Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6BD36C784
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 16:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238317AbhD0OHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 10:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236074AbhD0OHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 10:07:50 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4430CC061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 07:07:06 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id i11so23500498qvu.10
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V2KuM+3mxDQpdStyMvKPjH2s2jVcV8vDTom1OEkhMpw=;
        b=Ozo05gvpqNRE6sMKBWhtIvv1vqcu810F9+xG6Jke4KuL6ZhA+CuoKxpBAqocIk0tZ5
         9qGCtp59L1VcKKcsoqEE7J1x2HxDfFc7kjOyR5moTyfdg8JfapVtf5x+JFNEsBFsOKhy
         PDDUIBb14Cu1x/Wjyg9QQsCt7iBBPPS4emtJkakdcl13CqrtW6xbGQFODkufLLtDmdUv
         crDVaHdstmUSMoA/Uph7w6NqY/GqkiLyr+M4tYGqNKLFJByYPu8bdkjfNB673oj5X3Si
         rU0UumoZ8TQ7nAxmJYAl4mEdA6J0aqazYcZ/U+yNUjTzxvUxHwA73jNYje9DBLRBFgYE
         JJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V2KuM+3mxDQpdStyMvKPjH2s2jVcV8vDTom1OEkhMpw=;
        b=NLvMKvfVelvv023gKSjOYPw9JWdh9pvo0B6fNicU8n69V7hQgJTEJR7x/NtAi5UDAm
         TQWJtu4hV6ISALY9F1Vmu9VPmQZrJxlGd2GNHNL75XLb6pfQgZ4t+QSRdgi0B1oa8g/f
         n4ViIsnzzAGNt8MlCmc95tDTXxBKCziIDy1fIi6RlHinB1m0Vp6IVcIIIpJVj+d308gL
         mv5beNrNA9IamsRvUvjZhRVSuMWNAtAgVB9GWia7EJmFxDbRlQnBWKXQ2t6X9WPwC+LG
         FpkZnX1UmUnjKAgv6+o/iy39F1wUzY8PYGwYXjLlT9LT3GKcSrtwa7NAwEV3H0QB9HGz
         +zQg==
X-Gm-Message-State: AOAM531hx4Nf2c0eOIABEbeCETSM1Y6RU2DyyYKwudreFjDMyd/Bc0lg
        3lBOvgWFEaWruiFaT2fNFD0=
X-Google-Smtp-Source: ABdhPJxx7gLawyWsz4NLi6VtiM5RbV+my6YKrowykeEwoHu7gvhwGOhJLWogb/XKjvinntYtwD5PrA==
X-Received: by 2002:a05:6214:725:: with SMTP id c5mr23236497qvz.54.1619532425486;
        Tue, 27 Apr 2021 07:07:05 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:dc3c:c8fa:5d17:d49e])
        by smtp.gmail.com with ESMTPSA id 69sm3005696qkk.58.2021.04.27.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 07:07:05 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        frieder.schrempf@kontron.de, tharvey@gateworks.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] media: imx-csi: Skip first few frames from a BT.656 source
Date:   Tue, 27 Apr 2021 11:06:49 -0300
Message-Id: <20210427140649.3107744-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Steve Longerbeam <slongerbeam@gmail.com>

Some BT.656 sensors (e.g. ADV718x) transmit frames with unstable
BT.656 sync codes after initial power on. This confuses the imx
CSI, resulting in vertical and/or horizontal sync issues. Skip
the first 10 frames to avoid the unstable sync codes.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
[fabio: fixed checkpatch warning]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Fix Author line, sorry Steve!

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

