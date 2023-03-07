Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F06B6AE0AF
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 14:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjCGNhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 08:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjCGNg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 08:36:59 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347AE74333
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 05:36:57 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id cy23so52189987edb.12
        for <linux-media@vger.kernel.org>; Tue, 07 Mar 2023 05:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1678196215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq4ptQE4dk6kp+3N0ctAY6mzFtuZj1nvA5N1ILCC/BY=;
        b=WQ9GraAWs+jY/EoM8k6ibSgu7vDEAz7ZJzv9vjPN9iaFJgNbp0HxE4bY1Dirrt0ysH
         5WQmx3FtkNvWPps4f2GI62TGU5MmzcWYwity+lKm+7GqYQZYqTMhPL91tDEby1Xe3FWv
         EVqELyJ3eLt3pM2+0kXbjSwUCmfitU2MgheB3xJli4xvLp71N0q2T9I3KSXzqd4ySaeq
         GK/JHz602ZWMcFCfkCRrvJ4sAdARO4E95HrdqA8twJIxQg10DrdTV1m/jbQNPAj5O5/U
         I5sTfZ1SdfoIjoUnJWdTOe1oXnf891RxJA+RUdzH0fxR1Nisv5XURYBA9TDYOZTv93hV
         MKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cq4ptQE4dk6kp+3N0ctAY6mzFtuZj1nvA5N1ILCC/BY=;
        b=iDDNeh9DZD4EQRpDAnoBVbQ2i+35tSXPznmAvEsMNm74JdBwza6hMCy2NZp/yViZpL
         pYSRXakfY76cCQH7kuM9xQCsJQ3lpSiaTmB/rNpCrc0BW663QAH1XuQzqI9R5VZXoGyV
         d+qNkyw8ONDhlQ6u9evTTrnZCmK2/vj4f+gItT165wsErKu98kq9MTBczklgAVkN/+Ga
         DnRUlK/cT52WZAGaYFZrDM3I1LrtmGmMVEfpSWyLyerPJwpGrYxavfTHfsziuBSTS9eW
         MK+ZMGgRK3zs3WMoMzn0x8cvRB8K+zpqmOnQmm0ewVtBjSZ/9fwUXwNFvl92uqUZZrzI
         /iig==
X-Gm-Message-State: AO0yUKVfUoTUKISKtQ8tAIDmf5qVZvvqVpzubdTHXGrkGv1Pr0fq0dGI
        mZPaKN4K3p0xfsacv5PkdhHLJA==
X-Google-Smtp-Source: AK7set8s5aoPoc68E4P2lgvJyt7SDsDDHuMJ4DVv0JPDUmqgem619YWW5dOfkkeRHsQK0QeX2BoEDQ==
X-Received: by 2002:a17:907:cbc1:b0:8aa:c2bd:a71c with SMTP id vk1-20020a170907cbc100b008aac2bda71cmr16110691ejc.75.1678196215466;
        Tue, 07 Mar 2023 05:36:55 -0800 (PST)
Received: from dlp-nixos.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b008b23e619960sm6117270ejb.139.2023.03.07.05.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:36:55 -0800 (PST)
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org,
        Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: [PATCH] media: docs: vidioc-g-ext-ctrls.rst: Document p_s32 and p_s64 fields
Date:   Tue,  7 Mar 2023 14:36:17 +0100
Message-Id: <20230307133617.116683-1-dlp@qtec.com>
X-Mailer: git-send-email 2.38.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

p_s32 and p_s64 were added to the v4l2_ext_control struct, so these
should have documentation as well.
---
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 892cfeb8b988..5292d5e1a91f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -185,6 +185,16 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * - __u32 *
+      - ``p_s32``
+      - A pointer to a matrix control of signed 32-bit values. Valid if
+        this control is of type ``V4L2_CTRL_TYPE_INTEGER`` and
+        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
+    * - __u32 *
+      - ``p_s64``
+      - A pointer to a matrix control of signed 64-bit values. Valid if
+        this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
+        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
     * - struct :c:type:`v4l2_area` *
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
-- 
2.38.4

