Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0847B7888
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 09:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241453AbjJDHUC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 03:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjJDHUC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 03:20:02 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D78AD
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 00:19:58 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so308940866b.3
        for <linux-media@vger.kernel.org>; Wed, 04 Oct 2023 00:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1696403997; x=1697008797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ew1c9NXug8ctY4MLl60wGEzXYZjlRdO90T8KbwkWmwo=;
        b=SN4SASU2IrcaUNcqb1Yrkf2oKD+c8Kxpy2ClJDx/LXjqUFCg7dufsYD3pmYXrsqsuQ
         LxFc/UUaG+kWVHhqCKHjmA7JsBj6VT/T3IxpXJRFic/J6iBubZM2F6vwaHvAjKGK9rcy
         AZ2RnDJOCsoeGP24FviJazHZcu29nrZIGEfJvnZlkqFrgW4vnGs6XwT+9gtBJFrl0oYF
         zHMfYOepwzmPEJLsDKOJw1JparQEDDth1OGeEOHijwOBIX8r2Z2fTbpEcoEAzU7uWcEe
         2Km0c+5QmRoDBFCkJpOF+PQdQUf9K8qTktE4xVL34MprVOhSI5SDQIUGxqBhfYjJ9qwm
         5DLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696403997; x=1697008797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ew1c9NXug8ctY4MLl60wGEzXYZjlRdO90T8KbwkWmwo=;
        b=e5yl7R5q8TH48LXBw2nb1pp5rlGXqpSeNWXgiVXCCEIpA+qYRP7qVA7iKp7Cm2kl90
         Pb77S49p9kK9hHdSDFOd+hcvnGSRZ/yDAQEdotsLtOqzOhjAzqV/XkQW5vJk8CRrNj5c
         Ou342WPK+/MdF1qiyJr8ayvJXIEUpqCVyMe3CV+vF+E4kY6vvVDatn2QJ02a+Gcn3vKm
         CGD1hj36QcOL82CsA8aynt04VDa1WhtTYZRx5xBblmlxqEUkeUFI4A41BivtclUOcPR3
         VZuCVrDVdCYRRBfoOqHAwAm8eUAxsYG8pfXBc3TWdR4tnaASjKrkelKz/GLt3CsGVDmo
         qIlw==
X-Gm-Message-State: AOJu0Ywa7hYPQZjQW0mNbgw71eIUPqWrkf2cMM2H3f7hsgsgK9MDcKdC
        6593jHMVFUgmi3ccOytLZTuryJI1GPMMTl5TzswebCe0OOEiy8eeVgDgaRURZX3PO+BaGy6O6v8
        UbTd+bvfs/1MhJPSyRgtWE2vhYpijLUgP3/QQiQn9OxX0eT3+9l5cx8KSSWOtd0iC1rBYgaqzxa
        tNww==
X-Google-Smtp-Source: AGHT+IGTV+fX27y5K0VvWm4l1aaWyZkbH6zZ5AACaUBxJ1PXxAQRmjzelUSeasRbsRczHLFso00LUg==
X-Received: by 2002:a17:906:3081:b0:9ae:73ca:bbad with SMTP id 1-20020a170906308100b009ae73cabbadmr1182656ejv.43.1696403997208;
        Wed, 04 Oct 2023 00:19:57 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id sa18-20020a170906edb200b009adc77330ebsm2313242ejb.199.2023.10.04.00.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:19:56 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     <linux-media@vger.kernel.org>
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v5 1/8] media: uapi: ctrls: Add Time of Flight class controls
Date:   Wed,  4 Oct 2023 10:19:40 +0300
Message-Id: <3d1a6a49790a699980dc02450ebdbac2a03ebb51.1696347109.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1696347109.git.vkh@melexis.com>
References: <cover.1696347109.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define Time of Flight class controls.
Also add most common TOF controls:
 - phase sequence
 - time integration
 - frequency modulation

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 include/uapi/linux/v4l2-controls.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c3604a0a3e30..92b3957d5720 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -30,6 +30,7 @@
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
 #define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
+#define V4L2_CTRL_CLASS_TOF		0x00a60000	/* Time of flight camera controls */
 
 /* User-class control IDs */
 
@@ -3479,6 +3480,13 @@ struct v4l2_ctrl_av1_film_grain {
 	__u8 reserved[4];
 };
 
+#define V4L2_CID_TOF_CLASS_BASE		(V4L2_CTRL_CLASS_TOF | 0x900)
+#define V4L2_CID_TOF_CLASS		(V4L2_CTRL_CLASS_TOF | 1)
+
+#define V4L2_CID_TOF_PHASE_SEQ		(V4L2_CID_TOF_CLASS_BASE + 0)
+#define V4L2_CID_TOF_FREQ_MOD		(V4L2_CID_TOF_CLASS_BASE + 1)
+#define V4L2_CID_TOF_TIME_INTEGRATION	(V4L2_CID_TOF_CLASS_BASE + 2)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-- 
BR,
Volodymyr Kharuk

