Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D58C1BBE30
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 14:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgD1Mus (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 08:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726909AbgD1Mur (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 08:50:47 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F32C03C1AB
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:50:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x25so2627944wmc.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bS1/sm0XxWUvP6abjHta7A4TuogN+Inw+AeKvST2rX8=;
        b=CJ1HWPYa6lmeaiOGvITpPEE3yiBBS9ByoXcQet3Ewn7USk0P0L2v6kpGBwwVeAbOFj
         qaBVV+2OJEDE3NPzqfV0vm9K7As0NHUxa311IdVrZ0pNcKclHW8uy52KshOBmizJ76OR
         E5ENb5bdFQpElej+VSUYUYv5G481/tNKYFDrFNRmgE8Q9ZlHsaJghyhsFWqQeTDquklo
         BWc5H2O0F69bpTAjwrPRdszY3TXrWFrhiY0PUV3y+GQn496C55TBA4HzmO8S0+QZlwb0
         FF5/Yl8RbGFzq3a1GgtEp/vrOkdCDp1AXaM4Myml+k2PMAu9Etnoy8vqrKYGEaUYRy4N
         jsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bS1/sm0XxWUvP6abjHta7A4TuogN+Inw+AeKvST2rX8=;
        b=NJvA9S2ELvPjygw9XAmXQ6Uk4DMrhGcNP7spUGhI7Bd+CT/HipxhyUtvA1ws0iAmkH
         h1B77ejj+7uVbDAl+ccSuNM9L+PYit3++WrxxsAhIu3bhpVx4okptniOwl+EmWLsh8Ow
         aTnQrICrQU8GYZ83jtSb/kGd0EA23dAbPejEDGqgJlUxmMfJQ3maesU7jtJqJrvkd7gt
         lLGQ+2lnYErl0+AsIkde1g/y1cVv38lhz01TJnrUv2SytqJ5dkLcloYWZiXlCj/k0Eir
         /Bjcmrbg2m9/V3birVoOkc58WeWw+oVomP0FWGcvNy+I23IT1N9WhLrPxtAZ3+gCTqXc
         qGRA==
X-Gm-Message-State: AGi0PubZu95SFtU9OMU7Ap5RQjRdW4YUC/LLEg5griOY3djdtEPsfZrn
        a8WC3bvuvR0O3x3cokJnkMMNw8ResP6/jA==
X-Google-Smtp-Source: APiQypJ5w0jIkk9TNeGTgbLsSl7iD17zkDITUusCBji+wndwzT9z5UrwElq+jr6HWA18Jr9/fIejuw==
X-Received: by 2002:a05:600c:20c6:: with SMTP id y6mr4328740wmm.131.1588078245188;
        Tue, 28 Apr 2020 05:50:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
        by smtp.gmail.com with ESMTPSA id q184sm3246115wma.25.2020.04.28.05.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 05:50:43 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/3] media: meson: vdec: enable mcrcc for VP9
Date:   Tue, 28 Apr 2020 14:50:34 +0200
Message-Id: <20200428125036.9401-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200428125036.9401-1-narmstrong@baylibre.com>
References: <20200428125036.9401-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

The motion compensation reference cache controller allows caching
parts of reference frames for faster decoding.

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 60e4fc0052b3..897f5d7a6aad 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -854,6 +854,36 @@ static int codec_vp9_stop(struct amvdec_session *sess)
 	return 0;
 }
 
+/*
+ * Program LAST & GOLDEN frames into the motion compensation reference cache
+ * controller
+ */
+static void codec_vp9_set_mcrcc(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+	struct codec_vp9 *vp9 = sess->priv;
+	u32 val;
+
+	/* Reset mcrcc */
+	amvdec_write_dos(core, HEVCD_MCRCC_CTL1, 0x2);
+	/* Disable on I-frame */
+	if (vp9->cur_frame->type == KEY_FRAME || vp9->cur_frame->intra_only) {
+		amvdec_write_dos(core, HEVCD_MCRCC_CTL1, 0x0);
+		return;
+	}
+
+	amvdec_write_dos(core, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, BIT(1));
+	val = amvdec_read_dos(core, HEVCD_MPP_ANC_CANVAS_DATA_ADDR) & 0xffff;
+	val |= (val << 16);
+	amvdec_write_dos(core, HEVCD_MCRCC_CTL2, val);
+	val = amvdec_read_dos(core, HEVCD_MPP_ANC_CANVAS_DATA_ADDR) & 0xffff;
+	val |= (val << 16);
+	amvdec_write_dos(core, HEVCD_MCRCC_CTL3, val);
+
+	/* Enable mcrcc progressive-mode */
+	amvdec_write_dos(core, HEVCD_MCRCC_CTL1, 0xff0);
+}
+
 static void codec_vp9_set_sao(struct amvdec_session *sess,
 			      struct vb2_buffer *vb)
 {
@@ -1267,6 +1297,7 @@ static void codec_vp9_process_frame(struct amvdec_session *sess)
 
 	amvdec_write_dos(core, HEVC_PARSER_PICTURE_SIZE,
 			 (vp9->height << 16) | vp9->width);
+	codec_vp9_set_mcrcc(sess);
 	codec_vp9_set_sao(sess, &vp9->cur_frame->vbuf->vb2_buf);
 
 	vp9_loop_filter_frame_init(core, &vp9->seg_4lf,
-- 
2.22.0

