Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAA96F325E
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 16:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbjEAO5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 10:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjEAO5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 10:57:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1601109
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 07:57:31 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-956eacbe651so526522366b.3
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1682953050; x=1685545050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZxJl4/L6yEGLggthjdrX+7rImI5TCP3qT/9v04KDaQ=;
        b=JmxyVhA9xtDXya/Dl/9sCbe2nEa1fUir/tlQdR8/ZNdmiGoFTI2zRM5IOCeq4rbD0w
         sjMQ1NvgmC2A+wRpRb+A2PQ7epajiFue6IU4TDAcFwrlxLSC8O3T3St5Ya7pDCPiUfu4
         i4QWMTYM1al2EJvsdBbR3hkTJyrZvO3JMT2H+nVIoIVmdf74RaH5cO8xmkXGcnHG6+Cm
         S9QZF/m++fuI1rJP4Aod4bv3ujgF7WmDf9d4oEr+MGFx04KaGjpLZYwcPvaiJzVdTvU/
         4lN1NbChlY06Wl+9vYSdntahXc7L4/ArTB1jFfvcIdNXg0cKzlZ5SPczsZsnkO96NzLE
         U71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682953050; x=1685545050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZxJl4/L6yEGLggthjdrX+7rImI5TCP3qT/9v04KDaQ=;
        b=OqgXapzgwtsoIiZZ8C52JsoGwArCS2JmR48ANgL4Gshl4nry143fo9CFjEqxsRzxeg
         sOOvdI205ouH2crEtKruwdGwyIxu/UTFopcCj8l8hGQTouRV5YCE5wUbv9pX3l52xbBm
         x7lLUJn8jjAf8noHqPlQTMkZvSDoROb9kkllWNCn+DfSlqA43/Uwwd0rY8Xf1DlMcdA7
         yep31TXaCKonwH3e676XVz5cD+an4ERGo7RfY/Gpk9Aez9yYI/C91PRGZv/I4ju4qvm0
         +eolY0wLFC1KpIMyTyJ0/O9Clhu5veIBTx7khcSm6r+5XD+I1FXUTjJUOG/iEi4KsEXd
         x00Q==
X-Gm-Message-State: AC+VfDxwV3+V2fwOwnEF7UjAQ0ihwxb38KsNmfePpNudHNYizWrriJ4x
        +Tvy7xYp/VfdEOXxTFMveUzX6A==
X-Google-Smtp-Source: ACHHUZ4xO869J9dPcixZ8fXKhqkaz1VdQUXDy/j20ezwtg4S69ZaKKJZWdVpGsjk7gJ9qrFsZoz7vg==
X-Received: by 2002:a17:906:5d0b:b0:95e:d468:c35f with SMTP id g11-20020a1709065d0b00b0095ed468c35fmr11914019ejt.57.1682953050409;
        Mon, 01 May 2023 07:57:30 -0700 (PDT)
Received: from dlp-nixos.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id g24-20020a50ee18000000b0050690bc07a3sm11999481eds.18.2023.05.01.07.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 07:57:30 -0700 (PDT)
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org,
        Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: [PATCH 2/2] media: docs: vidioc-g-ext-ctrls.rst: Update p_s32 and p_s64 types
Date:   Mon,  1 May 2023 16:57:07 +0200
Message-Id: <20230501145707.4088026-3-dlp@qtec.com>
X-Mailer: git-send-email 2.38.4
In-Reply-To: <20230501145707.4088026-1-dlp@qtec.com>
References: <20230501145707.4088026-1-dlp@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pointer types of p_s32 and p_s64 in v4l2_ext_control has been
updated, match the change in documentation.
---
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 5292d5e1a91f..6d85ec6a19b4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -185,12 +185,12 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
-    * - __u32 *
+    * - __s32 *
       - ``p_s32``
       - A pointer to a matrix control of signed 32-bit values. Valid if
         this control is of type ``V4L2_CTRL_TYPE_INTEGER`` and
         ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
-    * - __u32 *
+    * - __s64 *
       - ``p_s64``
       - A pointer to a matrix control of signed 64-bit values. Valid if
         this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
-- 
2.38.4

