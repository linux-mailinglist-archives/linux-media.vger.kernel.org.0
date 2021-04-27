Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76ED36C780
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 16:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236269AbhD0OGc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 10:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236074AbhD0OGb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 10:06:31 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9FAC061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 07:05:47 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id o5so60046819qkb.0
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MNOgrskzgSHiZ308twmTts1ZnjtIruP3xMzmz0Vi210=;
        b=H2MolgjL+VBAn1bSMHgevFZJm48ixkhKG/Up+B0C6qR+jqyUDqo2QvuVOSFLQnCdwU
         +GfRbx9ZebvyjuQz71xbzUcQ2rHuQWRUhn8ojw+hMClv+Ww8Z6XucX5es1n4czlgIzXt
         1UvxF83R7PGiMtlDmjOFuVinWqoQ2uIDe+hvm1e9DN5Q7RC0jt/CJgnKPHoRAcA2Kg5I
         d1w0V9TH/SJNErrjhz29z+Ih3c8CQ/vCSdp1I66MkX/IRC+UM9+AF8TwdQSqCt23iy6n
         Q24kU9ey9yUlJD6dwTEWf4FltS63at4pOh5J06ehRrbOLvxTyh0o+1yNSCbTQetFkOR0
         8esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MNOgrskzgSHiZ308twmTts1ZnjtIruP3xMzmz0Vi210=;
        b=B7js9p717pvLZsj9CSlrXF5a1DqHcsE7niqr4FHl0flqzmq2qu1dsUnFn9n/DfrXka
         C9nfRLCe88eOiRu1gXsBpz+020JJSeDcuX+A6p3+qKlGX6Y7TcirZR8y9b2KZDgvMcgn
         RgXkUcPMJclRchfnp+P9QdYHmejhlQpqHYoAYQLv87qnLhYhivwwoQBfieXi6JAUDJWX
         Bqxbbs8azWQZbxXDUDTt7fS8ZDAgGIxMcLs6M8w7wr8G0kXWxyKu/USYuJPUVmYIsPJ/
         WS+AcRSBLwkN8GKWc9q92TDiB8hTJ/bgOTZ4WpTfOhy5kfRnpDdqmdWXilRjujXjSg+U
         2zfg==
X-Gm-Message-State: AOAM53166IzN0nwfCXD/i996i8Ed9O/gy56JnzkgEzAtOmwipnMmRc12
        4cQ7V+ERRliAmLHU9hwrPz0=
X-Google-Smtp-Source: ABdhPJwBP5JNT6RigylhEKrKzGXD896h/o4GJ/1cOmUPR/nq2imp5X6dE5uAz5uBawE4HjV5wTu8tw==
X-Received: by 2002:a05:620a:15c7:: with SMTP id o7mr9743308qkm.102.1619532345726;
        Tue, 27 Apr 2021 07:05:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:dc3c:c8fa:5d17:d49e])
        by smtp.gmail.com with ESMTPSA id t18sm2797653qkj.75.2021.04.27.07.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 07:05:45 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        frieder.schrempf@kontron.de, tharvey@gateworks.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: imx-csi: Skip first few frames from a BT.656 source
Date:   Tue, 27 Apr 2021 11:05:35 -0300
Message-Id: <20210427140535.3107582-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some BT.656 sensors (e.g. ADV718x) transmit frames with unstable
BT.656 sync codes after initial power on. This confuses the imx
CSI, resulting in vertical and/or horizontal sync issues. Skip
the first 10 frames to avoid the unstable sync codes.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
[fabio: fixed checkpatch warning]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index e3bfd635a89a..5d24dd1379b3 100644
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
+		u32 delay_usec, bad_frames = 10;
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

