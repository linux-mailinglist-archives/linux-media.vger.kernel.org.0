Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402EF640A36
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 17:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbiLBQHz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 11:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbiLBQHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 11:07:52 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A748C192B8
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 08:07:46 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n20so12691504ejh.0
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 08:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNTO40Ok4F3wT6nUp6jH7yU9/UGuuLve2Grw8oDnk/g=;
        b=ARkRdYTOiXiipZTE47HPue2MN+UObGHSxr/guZ9T22CLYI8fZvcUWlGs4iMdg6BMjV
         wJWDrkIscj6W+pHXw4+jU4/qftMwEKN0w75esdlK62rEiICnyaoxpM9Ed60mqsl05I3q
         eRv7WZfr4Kz1tmYxaUEYTezCsKrKu2EMbKc8ZZqiAgREX7MlOiYyBqTK1FOZ5GGYn7+o
         rymH4Esoo7ZCfp8ZDuACLoqd5M0OhM8ojPMDXnWlJD3PiG2AtZnG7y6P0mfEByqEB2LP
         CWZV0fdqxxchAWbnm0pxjbPW9ewvyXnkxK42CurPCw+WOY290/CzPVRi42vCu2H2j8fP
         ZITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNTO40Ok4F3wT6nUp6jH7yU9/UGuuLve2Grw8oDnk/g=;
        b=J9MLL9Cr08SjLJ7IJpADokx8Kzkvh1HT+NQwmx/nxThYWUZe+dHOV0jXeIWe2ZTtNO
         VuTCwgFnfa0QKjTeDSDgVv7dQYclkweoQlSLEctpVPc3c42UdcbKdRGPAeP9037gmVjW
         g7lvSAlOmfTf8Tp9KIvHK4fm1hrSwuf55vUOV7gjnguit73+zKOfjBJRebHDkfD/vG8H
         dXF7WrwPGVZIsUZsEvE5O123Mwij3qO8apxJbROBXuDm0Wuu2zepUEAl7iO3g1G+Pjcg
         37YMCSvbzm/dYACwILFL/2Bk6cXkJUbR1uqhPNyoo8tw0C4vCBZO6XWV8jLcobb2YTnr
         98dw==
X-Gm-Message-State: ANoB5pl3hmCBu3VGPzM7+IFL6YscQyP8qGPoodP8gxZAFh24AB7ySE7U
        TWAn2pLo38vLstUJqSFSPqO6pf4A6C6RpQYGHAHOfSV4sAX75ceghI0QTeGzgSNgmrpJPaRMM2e
        GXQGw8/V1E/EEyA1hHY8N25FIB0fn/7D76p/iRx7jvuDJyLwlu6AaQmxCqFlwLUxiFWrYC5owjz
        w=
X-Google-Smtp-Source: AA0mqf4+eZS/iQUOCNUyH9I+uLK1obE77VOcynm8gb+ynq8oTfHZVGerl+a8pOuYDFD5xXvVSXvi2A==
X-Received: by 2002:a17:906:3411:b0:7c0:d3e6:cce with SMTP id c17-20020a170906341100b007c0d3e60ccemr137787ejb.742.1669997265139;
        Fri, 02 Dec 2022 08:07:45 -0800 (PST)
Received: from melexis ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id m11-20020a056402050b00b00467cc919072sm3063885edv.17.2022.12.02.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:07:44 -0800 (PST)
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
Subject: [PATCH v4 1/8] media: uapi: ctrls: Add Time of Flight class controls
Date:   Fri,  2 Dec 2022 18:07:31 +0200
Message-Id: <3a4d7724d689b72a5cea89824821f392ded50478.1669978791.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669978791.git.vkh@melexis.com>
References: <cover.1669978791.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
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
---
 include/uapi/linux/v4l2-controls.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 410d778c1243..3a6b6231b6f7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -68,6 +68,7 @@
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
 #define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
+#define V4L2_CTRL_CLASS_TOF		0x00a60000	/* Time of flight camera controls */
 
 /* User-class control IDs */
 
@@ -2788,6 +2789,13 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 	struct v4l2_vp9_mv_probs mv;
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

