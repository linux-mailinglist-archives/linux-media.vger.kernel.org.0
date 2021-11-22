Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB656458B48
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhKVJ3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:59080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238645AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB9D760F5A;
        Mon, 22 Nov 2021 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=uoub8lwyF2e3h3UBzOFi3xispO3LB4G9st/Fel8Wp50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pTX9d95MMRvuWjs/BaYuivPCoDz2i4E7nA8oQoApfB75GcCLrMNdRm/VHe7VqXVvJ
         +XSuzKH0Fy3BAXCqG0SduN3koTJJmbc4v9t8pdb3tERtJ6xsWFReLLUy3/WAEnhgsm
         eGFMWb1Ei7Mh02lmOsRGqZUkqypifcHrFfuUEeFAL2h6mPeP5XqL8/wOE5SpfSKIi7
         L4nBecV5EnaKJ2VpkH7qBp/HQZk6cTAqNptuhXupu2kHBpDybMSeH8jymmysMvKzec
         /lbxNSm0y9cjUePL2+7isJ5Vqa1WmvxTTRPxA+nNNHCnhLdzKqGCoTJohXGEuqNO3F
         w4sSgkkwEANdw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hiS-58; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lukas Middendorf <kernel@tuxforce.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 06/10] media: dvb-core: dvb_frontend: address some clang warnings
Date:   Mon, 22 Nov 2021 09:26:08 +0000
Message-Id: <fe70cb9f32c41265de21129d26f1122e2849b842.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The typecasts at the dvb-core generate clang warnings when W=1
is enabled.

The warns are harmless, but they cause the build to break with
CONFIG_WERROR, so do the cast on a way that it won't produce
warnings anymore.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/dvb-core/dvb_frontend.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 8fc59f3cfb6c..48e735cdbe6b 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2554,8 +2554,7 @@ static int dvb_frontend_handle_ioctl(struct file *file,
 
 	case FE_DISEQC_SEND_BURST:
 		if (fe->ops.diseqc_send_burst) {
-			err = fe->ops.diseqc_send_burst(fe,
-						(enum fe_sec_mini_cmd)parg);
+			err = fe->ops.diseqc_send_burst(fe, (long)parg);
 			fepriv->state = FESTATE_DISEQC;
 			fepriv->status = 0;
 		}
@@ -2563,9 +2562,8 @@ static int dvb_frontend_handle_ioctl(struct file *file,
 
 	case FE_SET_TONE:
 		if (fe->ops.set_tone) {
-			err = fe->ops.set_tone(fe,
-					       (enum fe_sec_tone_mode)parg);
-			fepriv->tone = (enum fe_sec_tone_mode)parg;
+			fepriv->tone = (long)parg;
+			err = fe->ops.set_tone(fe, fepriv->tone);
 			fepriv->state = FESTATE_DISEQC;
 			fepriv->status = 0;
 		}
@@ -2573,9 +2571,8 @@ static int dvb_frontend_handle_ioctl(struct file *file,
 
 	case FE_SET_VOLTAGE:
 		if (fe->ops.set_voltage) {
-			err = fe->ops.set_voltage(fe,
-						  (enum fe_sec_voltage)parg);
-			fepriv->voltage = (enum fe_sec_voltage)parg;
+			fepriv->voltage = (long)parg;
+			err = fe->ops.set_voltage(fe, fepriv->voltage);
 			fepriv->state = FESTATE_DISEQC;
 			fepriv->status = 0;
 		}
-- 
2.33.1

