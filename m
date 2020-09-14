Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61B92687EE
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgINJEo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:04:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:37864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgINJDg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:03:36 -0400
Received: from mail.kernel.org (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F25BD2220D;
        Mon, 14 Sep 2020 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600074212;
        bh=yn4rC/mpMg6Y49QUXHu+kh/MepPer+40IA5SSwhxib0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZNqZifMaRzqfCicyneaDvwsbeBbBI3tCjtcgneXEXAviuGZc+LhyXVKRBxBGRnNSX
         Qha9FiwsXRpoY5ZvfQc2GaD+b7thrmv0j564lGta81IR80oR0iksgdSem+TcG2uXSe
         6ItUF8QZxCYs938xleISIFpDFVVTbyh/stCtf/go=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHkOW-002dzi-5J; Mon, 14 Sep 2020 11:03:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH RFC 08/11] media: vidtv: properly initialize the internal state struct
Date:   Mon, 14 Sep 2020 11:03:23 +0200
Message-Id: <22b323ff01a900c01bf9e407c4130f82f62fe312.1600073975.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600073975.git.mchehab+huawei@kernel.org>
References: <cover.1600073975.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, the config data passed from the bridge driver is
just ignored.

Also, let's initialize the delayed work at probing time.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_demod.c | 10 +++++-----
 drivers/media/test-drivers/vidtv/vidtv_demod.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index 3eb48b4a9a6b..6199a4e06ff9 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -268,10 +268,6 @@ static int vidtv_demod_init(struct dvb_frontend *fe)
 	struct vidtv_demod_state *state = fe->demodulator_priv;
 	u32    tuner_status             = 0;
 
-	if (state->cold_start)
-		INIT_DELAYED_WORK(&state->poll_snr,
-				  &vidtv_demod_poll_snr_handler);
-
 	/*
 	 * At resume, start the snr poll thread only if it was suspended with
 	 * the thread running. Extra care should be taken here, as some tuner
@@ -288,7 +284,6 @@ static int vidtv_demod_init(struct dvb_frontend *fe)
 		state->poll_snr_thread_restart = false;
 	}
 
-	state->cold_start = false;
 	return 0;
 }
 
@@ -396,6 +391,7 @@ MODULE_DEVICE_TABLE(i2c, vidtv_demod_i2c_id_table);
 static int vidtv_demod_i2c_probe(struct i2c_client *client,
 				 const struct i2c_device_id *id)
 {
+	struct vidtv_tuner_config *config = client->dev.platform_data;
 	struct vidtv_demod_state *state;
 
 	/* allocate memory for the internal state */
@@ -408,6 +404,10 @@ static int vidtv_demod_i2c_probe(struct i2c_client *client,
 	       &vidtv_demod_ops,
 	       sizeof(struct dvb_frontend_ops));
 
+	memcpy(&state->config, config, sizeof(state->config));
+
+	INIT_DELAYED_WORK(&state->poll_snr, &vidtv_demod_poll_snr_handler);
+
 	state->frontend.demodulator_priv = state;
 	i2c_set_clientdata(client, state);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
index dfb36c515e4d..7f52a537935b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
@@ -66,7 +66,6 @@ struct vidtv_demod_state {
 	struct delayed_work poll_snr;
 	enum fe_status status;
 	u16 tuner_cnr;
-	bool cold_start;
 	bool poll_snr_thread_running;
 	bool poll_snr_thread_restart;
 };
-- 
2.26.2

