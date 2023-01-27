Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8536567E98C
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 16:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbjA0Pe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 10:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbjA0Pey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 10:34:54 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9DC80009
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 07:34:52 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id b7so5327542wrt.3
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 07:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiofnt06/2YnOi5riywAOCp/UNp1DDfntXDSuWyqqVo=;
        b=z87Ie7ZGVECo2oxbzKEZFMQzgB879wc5UXGnVWe7wuicH7DJutgmGJ1HI3pqlrkuJ+
         n//LEIGTALhM7I9tjKSzvgy+bKpAaF3v3dvKT0s7M2q2zAaeaaFhxylKo5fsueI7twQU
         jWytlZn+yld6t3RePrXg/eGgilIVNMhQ8vL/CAED37VukIXzOtitvrWsDJ775OATG8la
         we9YKMDDwxjZpq5FuRPk2Rv0ssYar7ZYMev/mm8+ZH1YuqE5rMA+zqmKIKEXTWxys/aW
         JkdzMpGX/0cBgqWULLjbQQ5DCL2YngWsV5U3+VG66x9vhHtPmA7LUIc2ioMIT+EAcCO2
         48Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiofnt06/2YnOi5riywAOCp/UNp1DDfntXDSuWyqqVo=;
        b=24dAOd+x8P9a/wLAlMzwtxfCA6UYQZIgYrR2dJgoa/UWXYDp4WMj7TIz+gUfGTvA2r
         GWYd7vTZ/Z7GscVqxn+Xi+kaAqRYTydnuwIHL134L2v5pFrqF03QR5uhlidjBh+lSQJp
         k5Fy9CBmfpQCG+piBAGSNS5hDFDDkaTBnvSjlpSKLaRW6VDUGXOWeeHBgJwdeTy2W9Dj
         LoTzzu6S2DDWax51YawJTl4T7NCO6OI+8C7hgoPYWhO9vFw3BKTNWU8fON5jkXYqkvQh
         Z8HGjGsZrZpnPm6O++nJaIVXZ5JF/i1qUgsPSNzWkfb2+fAaMC1Wb2axKQ2D/3AUUdhP
         4w+w==
X-Gm-Message-State: AFqh2koSJufeiLpZqPDcrjTsPLIGItuUMNaZadHnOPm30t4DB+P7Olh7
        CMNO5pDHoLB4rpnoezWt272P54JZCKN6tBcXoCA=
X-Google-Smtp-Source: AMrXdXsuCKfmoyb7PfGVqHVlhN9MkqUByVk/NxnYdGFbOeRqdyw4i/XkPubL9TggmQh8RY0d5BTTqQ==
X-Received: by 2002:a5d:6b85:0:b0:2bd:d782:c2bc with SMTP id n5-20020a5d6b85000000b002bdd782c2bcmr35399633wrx.33.1674833690633;
        Fri, 27 Jan 2023 07:34:50 -0800 (PST)
Received: from sucnaath.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4d0e000000b002bde537721dsm4231826wrt.20.2023.01.27.07.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:34:49 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, John Cox <jc@kynesim.co.uk>
Subject: [PATCH 0/2] media: v4l: Add Broadcom sand format to the list of V4L formats
Date:   Fri, 27 Jan 2023 15:34:13 +0000
Message-Id: <20230127153415.83126-1-jc@kynesim.co.uk>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is in preparation for attempting to upstream the Rpi H265 decoder
as these formats are the only ones the hardware can decode to. They are
a column format rather than a tile format but I've added them to the
list of tiled formats as that seems the closest match.

V4L2_PIX_FMT_NV12_C128 matches DRM format NV12 with modifier
DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT(ch) and
V4L2_PIX_FMT_P030_C128 matches DRM format P030 with the same modifier.

John Cox (2):
  media: v4l: Add Broadcom sand formats to videodev2.h
  media: v4l: Add documentation for Broadcom sand formats

 .../media/v4l/pixfmt-yuv-planar.rst           | 192 ++++++++++++++++++
 include/uapi/linux/videodev2.h                |   2 +
 2 files changed, 194 insertions(+)

-- 
2.37.2

