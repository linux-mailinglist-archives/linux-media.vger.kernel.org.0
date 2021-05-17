Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289743835A4
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 17:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236366AbhEQPXf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 11:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244424AbhEQPUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 11:20:39 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F66C0610E3
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 07:29:39 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id j19so4941142qtp.7
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fHCHTlP3//K978EvY7rwF4tuW8ieWnf/K366gEOonds=;
        b=Y0RzLQXC0TAqeZkyAXC92ZZwUs24j282EVieboVyU38BlaPEsyN8ynkeJCsapNHiPS
         xEFrwsAR4lW7tQRHHfgYTGEWH7YHG7GRISe7BMcQ5QnyhftJeI1uxWSMBOcUmSK9MYwH
         O4XtE7LLmHl3jKc0jpSYZKHnXFgBiAtNyca3wR7ShLP8t35Xy3tOB6bEAtGkVrQ4Xk79
         L4BklvBhf7UAZ914GeH0i/fgN55Wi+co6UMEB+iHaC1Y0JrFg9/gHl1bnwFmdcoNw2ly
         TlG+t/Z3XQ8cBkCROy3Bk70woFr35MIKtLeNQaoovrr2rqNrPOUkV2rZmonYxgn2LKVy
         Q0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fHCHTlP3//K978EvY7rwF4tuW8ieWnf/K366gEOonds=;
        b=QRz5jpVVcLmkP6sEsm4BDlTiHv8++3D3WJNbA+4GkWRefqNBqLjGe2ytjtiMw60woq
         4J52FdB+mIb96/jCb5FmyEuTkbXUlWX70uZpfLwVlrL5s1nntPKSgjLD5a8rwmN+RRaJ
         Pk7Gr3u3Kk9qH9eTTEpX4Zfhusp3/pGu5tNhemH5pd/92/tHkm00AUR+k6QLpYd8GG5K
         Q8e64Dve/8ZTekd+b5ZQj2HkVuvOVMQtKe4Ok2NUiXXXJJmbIsLUIUQ7QjEmt7HptMy+
         lVv+fTLofmsxj8JemtD6NXAwnqdcy7+bPM7FR7Lrr056QKxMKEuL9dawPZPn58evVfVA
         XULQ==
X-Gm-Message-State: AOAM530wbF+8TZk1YYK3YjRvdSO+NUT8WNsC2Ny3GsHfJsEzBjRO0d3f
        KSqbBgTQ6QEiySY6qIzIO6w=
X-Google-Smtp-Source: ABdhPJyXGsiVOpLBOY9RRgPMa6Vnr1y3+C3osJVrDq85CUHKaoTxd+ktn9RkUWWDHA5nlbLJwnYDwQ==
X-Received: by 2002:ac8:7442:: with SMTP id h2mr51137656qtr.315.1621261778206;
        Mon, 17 May 2021 07:29:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:7569:d958:c12:8892])
        by smtp.gmail.com with ESMTPSA id h65sm10591449qkd.112.2021.05.17.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:29:37 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        frieder.schrempf@kontron.de, tharvey@gateworks.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] media: imx-csi: Skip first few frames from a BT.656 source
Date:   Mon, 17 May 2021 11:29:23 -0300
Message-Id: <20210517142923.3173431-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Steve Longerbeam <slongerbeam@gmail.com>

Some BT.656 sensors (e.g. ADV718x) transmit frames with unstable BT.656
sync codes after initial power on. This confuses the imx CSI,resulting
in vertical and/or horizontal sync issues. Skip the first 20 frames
to avoid the unstable sync codes.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
[fabio: fixed checkpatch warning and increased the frame skipping to 20]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Increase 'bad_frames' to 20 as 10 was not enough to avoid
the problem when using an NTSC camera.

 drivers/staging/media/imx/imx-media-csi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index e3bfd635a89a..6a94fff49bf6 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -750,9 +750,10 @@ static int csi_setup(struct csi_priv *priv)
 
 static int csi_start(struct csi_priv *priv)
 {
-	struct v4l2_fract *output_fi;
+	struct v4l2_fract *input_fi, *output_fi;
 	int ret;
 
+	input_fi = &priv->frame_interval[CSI_SINK_PAD];
 	output_fi = &priv->frame_interval[priv->active_output_pad];
 
 	/* start upstream */
@@ -761,6 +762,17 @@ static int csi_start(struct csi_priv *priv)
 	if (ret)
 		return ret;
 
+	/* Skip first few frames from a BT.656 source */
+	if (priv->upstream_ep.bus_type == V4L2_MBUS_BT656) {
+		u32 delay_usec, bad_frames = 20;
+
+		delay_usec = DIV_ROUND_UP_ULL((u64)USEC_PER_SEC *
+			input_fi->numerator * bad_frames,
+			input_fi->denominator);
+
+		usleep_range(delay_usec, delay_usec + 1000);
+	}
+
 	if (priv->dest == IPU_CSI_DEST_IDMAC) {
 		ret = csi_idmac_start(priv);
 		if (ret)
-- 
2.25.1

