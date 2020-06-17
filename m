Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985881FD4E2
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 20:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgFQSwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 14:52:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727039AbgFQSwT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 14:52:19 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70AEE217D8;
        Wed, 17 Jun 2020 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592419938;
        bh=Ycs20U18UeBv/A9n4DRip4ZO+FTx+G0oEWD/A+0ZHiE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wxaNY2ti/AePGO0n8yEl9tG+fbWibf7lnASl3bclbRCNnoH4puCjavAcrb6sZaBT2
         tl+/tXW/y1mPauMOdq1Lgq5dBN4oPWRFnk+Ced1bG3hQI+tpWxTr+k7N22p2H9fadf
         F9x6xycnXmRDXtliIJSGBKoXY1mwVvuiColnzm+c=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jldAW-00C8At-2O; Wed, 17 Jun 2020 20:52:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Brad Love <brad@nextdimension.cc>, Sean Young <sean@mess.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [RFC 4/4] media: dvb_frontend: disable zigzag mode if not possible
Date:   Wed, 17 Jun 2020 20:52:14 +0200
Message-Id: <974065921c41fa0c97700196de1d921c95fafaaf.1592419750.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592419750.git.mchehab+huawei@kernel.org>
References: <cover.1592419750.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the zigzag to work, the core needs to have a frequency
shift. Without that, the zigzag code will just try re-tuning
several times at the very same frequency, with seems wrong.

So, add a warning when this happens, and fall back to the
single-shot mode.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 141 +++++++++++++++-----------
 1 file changed, 79 insertions(+), 62 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index ed85dc2a9183..cb577924121e 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -642,6 +642,9 @@ static void dvb_frontend_wakeup(struct dvb_frontend *fe)
 	wake_up_interruptible(&fepriv->wait_queue);
 }
 
+static u32 dvb_frontend_get_stepsize(struct dvb_frontend *fe);
+static void prepare_tuning_algo_parameters(struct dvb_frontend *fe);
+
 static int dvb_frontend_thread(void *data)
 {
 	struct dvb_frontend *fe = data;
@@ -696,78 +699,92 @@ static int dvb_frontend_thread(void *data)
 			fepriv->reinitialise = 0;
 		}
 
-		/* do an iteration of the tuning loop */
-		if (fe->ops.get_frontend_algo) {
+		if (fe->ops.get_frontend_algo)
 			algo = fe->ops.get_frontend_algo(fe);
-			switch (algo) {
-			case DVBFE_ALGO_HW:
-				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_HW\n", __func__);
+		else
+			algo = DVBFE_ALGO_SW;
 
-				if (fepriv->state & FESTATE_RETUNE) {
-					dev_dbg(fe->dvb->device, "%s: Retune requested, FESTATE_RETUNE\n", __func__);
-					re_tune = true;
-					fepriv->state = FESTATE_TUNED;
-				} else {
-					re_tune = false;
-				}
+		/* do an iteration of the tuning loop */
+		switch (algo) {
+		case DVBFE_ALGO_SW:
+			prepare_tuning_algo_parameters(fe);
 
-				if (fe->ops.tune)
-					fe->ops.tune(fe, re_tune, fepriv->tune_mode_flags, &fepriv->delay, &s);
-
-				if (s != fepriv->status && !(fepriv->tune_mode_flags & FE_TUNE_MODE_ONESHOT)) {
-					dev_dbg(fe->dvb->device, "%s: state changed, adding current state\n", __func__);
-					dvb_frontend_add_event(fe, s);
-					fepriv->status = s;
-				}
-				break;
-			case DVBFE_ALGO_SW:
+			if (fepriv->max_drift) {
 				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_SW\n", __func__);
 				dvb_frontend_swzigzag(fe);
 				break;
-			case DVBFE_ALGO_CUSTOM:
-				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_CUSTOM, state=%d\n", __func__, fepriv->state);
-				if (fepriv->state & FESTATE_RETUNE) {
-					dev_dbg(fe->dvb->device, "%s: Retune requested, FESTAT_RETUNE\n", __func__);
-					fepriv->state = FESTATE_TUNED;
+			}
+
+			/*
+			 * See prepare_tuning_algo_parameters():
+			 *   - Some standards may not use zigzag.
+			 */
+			if (!dvb_frontend_get_stepsize(fe))
+				dev_warn(fe->dvb->device,
+					"disabling sigzag, as frontend doesn't set frequency step size\n");
+
+			/* fall through */
+		case DVBFE_ALGO_HW:
+			dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_HW\n", __func__);
+
+			if (fepriv->state & FESTATE_RETUNE) {
+				dev_dbg(fe->dvb->device, "%s: Retune requested, FESTATE_RETUNE\n", __func__);
+				re_tune = true;
+				fepriv->state = FESTATE_TUNED;
+			} else {
+				re_tune = false;
+			}
+
+			if (fe->ops.tune)
+				fe->ops.tune(fe, re_tune, fepriv->tune_mode_flags, &fepriv->delay, &s);
+
+			if (s != fepriv->status && !(fepriv->tune_mode_flags & FE_TUNE_MODE_ONESHOT)) {
+				dev_dbg(fe->dvb->device, "%s: state changed, adding current state\n", __func__);
+				dvb_frontend_add_event(fe, s);
+				fepriv->status = s;
+			}
+			break;
+		case DVBFE_ALGO_CUSTOM:
+			dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_CUSTOM, state=%d\n", __func__, fepriv->state);
+			if (fepriv->state & FESTATE_RETUNE) {
+				dev_dbg(fe->dvb->device, "%s: Retune requested, FESTAT_RETUNE\n", __func__);
+				fepriv->state = FESTATE_TUNED;
+			}
+			/* Case where we are going to search for a carrier
+			    * User asked us to retune again for some reason, possibly
+			    * requesting a search with a new set of parameters
+			    */
+			if (fepriv->algo_status & DVBFE_ALGO_SEARCH_AGAIN) {
+				if (fe->ops.search) {
+					fepriv->algo_status = fe->ops.search(fe);
+					/* We did do a search as was requested, the flags are
+					    * now unset as well and has the flags wrt to search.
+					    */
+				} else {
+					fepriv->algo_status &= ~DVBFE_ALGO_SEARCH_AGAIN;
 				}
-				/* Case where we are going to search for a carrier
-				 * User asked us to retune again for some reason, possibly
-				 * requesting a search with a new set of parameters
-				 */
-				if (fepriv->algo_status & DVBFE_ALGO_SEARCH_AGAIN) {
-					if (fe->ops.search) {
-						fepriv->algo_status = fe->ops.search(fe);
-						/* We did do a search as was requested, the flags are
-						 * now unset as well and has the flags wrt to search.
-						 */
-					} else {
-						fepriv->algo_status &= ~DVBFE_ALGO_SEARCH_AGAIN;
-					}
-				}
-				/* Track the carrier if the search was successful */
-				if (fepriv->algo_status != DVBFE_ALGO_SEARCH_SUCCESS) {
+			}
+			/* Track the carrier if the search was successful */
+			if (fepriv->algo_status != DVBFE_ALGO_SEARCH_SUCCESS) {
+				fepriv->algo_status |= DVBFE_ALGO_SEARCH_AGAIN;
+				fepriv->delay = HZ / 2;
+			}
+			dtv_property_legacy_params_sync(fe, c, &fepriv->parameters_out);
+			fe->ops.read_status(fe, &s);
+			if (s != fepriv->status) {
+				dvb_frontend_add_event(fe, s); /* update event list */
+				fepriv->status = s;
+				if (!(s & FE_HAS_LOCK)) {
+					fepriv->delay = HZ / 10;
 					fepriv->algo_status |= DVBFE_ALGO_SEARCH_AGAIN;
-					fepriv->delay = HZ / 2;
+				} else {
+					fepriv->delay = 60 * HZ;
 				}
-				dtv_property_legacy_params_sync(fe, c, &fepriv->parameters_out);
-				fe->ops.read_status(fe, &s);
-				if (s != fepriv->status) {
-					dvb_frontend_add_event(fe, s); /* update event list */
-					fepriv->status = s;
-					if (!(s & FE_HAS_LOCK)) {
-						fepriv->delay = HZ / 10;
-						fepriv->algo_status |= DVBFE_ALGO_SEARCH_AGAIN;
-					} else {
-						fepriv->delay = 60 * HZ;
-					}
-				}
-				break;
-			default:
-				dev_dbg(fe->dvb->device, "%s: UNDEFINED ALGO !\n", __func__);
-				break;
 			}
-		} else {
-			dvb_frontend_swzigzag(fe);
+			break;
+		default:
+			dev_dbg(fe->dvb->device, "%s: UNDEFINED ALGO !\n", __func__);
+			break;
 		}
 	}
 
-- 
2.26.2

