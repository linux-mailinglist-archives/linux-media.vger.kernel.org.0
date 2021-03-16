Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430C433CFE4
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 09:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234758AbhCPIbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 04:31:11 -0400
Received: from ni.piap.pl ([195.187.100.5]:57866 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234824AbhCPIbE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 04:31:04 -0400
X-Greylist: delayed 393 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Mar 2021 04:31:03 EDT
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 4E550443991;
        Tue, 16 Mar 2021 09:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 4E550443991
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1615883066; bh=mhirheRq8WviKByzNYMicvIkW+qgbFBkujfQT55US3A=;
        h=From:To:Cc:Subject:Date:From;
        b=M1cHjUu3FwM/mWOUgYgyeQg/+IMB5YgRujci2wQwovMpygx1bJlK7cbwIfetc0Wcb
         De3mxr0nIhJpnCg0FyeLfXVMYpQGvOT7s2w4pQcnbJ+VUssRTruncKTNTTJ0Cqe6tP
         gq/9DjT1zgdw1XTerMnaxLPLicVSW4nHKwkyyc0Q=
From:   "Krzysztof Halasa" <khalasa@piap.pl>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MEDIA CODA: Fix NULL ptr dereference in the encoder.
Sender: khalasa@piap.pl
Date:   Tue, 16 Mar 2021 09:23:47 +0100
Message-ID: <m3a6r3tsks.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ctx->mb_err_cnt_ctrl could be NULL in case of failed initialization
(on decoders), and encoders don't use it at all.

Fixes: b2d3bef1aa78 ("media: coda: Add a V4L2 user for control error macrob=
locks count")
Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
Cc: stable@vger.kernel.org # 5.11+

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platfor=
m/coda/coda-bit.c
index 2f42808c43a4..26e37cbfe8dd 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2373,8 +2373,10 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 	if (err_mb > 0) {
 		if (__ratelimit(&dev->mb_err_rs))
 			coda_dbg(1, ctx, "errors in %d macroblocks\n", err_mb);
-		v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl,
-				 v4l2_ctrl_g_ctrl(ctx->mb_err_cnt_ctrl) + err_mb);
+		if (ctx->mb_err_cnt_ctrl)
+			v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl,
+					 v4l2_ctrl_g_ctrl(ctx->mb_err_cnt_ctrl)
+					 + err_mb);
 	}
=20
 	if (dev->devtype->product =3D=3D CODA_HX4 ||
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/plat=
form/coda/coda-common.c
index 96802b8f47ea..285c80f87b65 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2062,7 +2062,8 @@ static int coda_start_streaming(struct vb2_queue *q, =
unsigned int count)
 	if (q_data_dst->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
 		ctx->params.gop_size =3D 1;
 	ctx->gopcounter =3D ctx->params.gop_size - 1;
-	v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl, 0);
+	if (ctx->mb_err_cnt_ctrl)
+		v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl, 0);
=20
 	ret =3D ctx->ops->start_streaming(ctx);
 	if (ctx->inst_type =3D=3D CODA_INST_DECODER) {

--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
