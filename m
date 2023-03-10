Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBC106B5117
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 20:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjCJTmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 14:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbjCJTmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 14:42:15 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D289D136890
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:12 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id f11so6052083wrv.8
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112; t=1678477331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c1iseD1FkOW1sQLnk3ujWQpy2jxtIlsP7y0CDseEDE=;
        b=5c74U1kjXlZk38JE1K97h3NKlidgpBlZ3wbk5aSsrD6fe06HUidhAbjQv3lSNE/oO+
         b23a1yuNuTvrNjZ9lIz45cns3xly9+I1Tb9N42nNrMmjI9WoW9ZwU/p0z/5ymROwBuUn
         KtXWV12T2l8S3Tw6EDV+E6g+PKlINiD379PXsSxOcgq+0IvgpJ8wHMR2NnLBioz0pZ2p
         T1e6XSFAJpaKI9NJmEgXWDM0kfJMY6Mh0bVNSCs3JqVwNdEo2s0gfDqCwqexQV91Lfi7
         iLKFRzwOykr/Dm344ZHyRXYHuYWcfE5Yse+8IgWK6q+tit0lUsM4CNALtoLN0PSCI73H
         R9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678477331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/c1iseD1FkOW1sQLnk3ujWQpy2jxtIlsP7y0CDseEDE=;
        b=KqGwj+meTxPcIFlvy2xo5GIpeKZ65RNOSXJrTYXZUyt/0e+QV/EW987cXs3FYbOyQI
         N1zN4nsmJy35MfLSlMvRbHWlYXybxRYsemcZOB6VeqNCScGk8V+anjz5r+aH0NBp9LUW
         CLxXg8sVRkTWIrOlvG1wml5usUrKjlwNDu51xxjNl99IYhnnqCfaoLiLDlHcxaJ2M5Cq
         kAaaCPbqK5cgrCg+PTQ/tS2JroKfMTAL16xzpFEWV0fS3yKVlFhlzZaSGT2IlObCnWAI
         Ph0bR15iWwtzSFeFR5JKYj1Qra0HBpJavDDkssjtZ/LbR3PdMOOTcGyVBX0JePF4wpQh
         Js8A==
X-Gm-Message-State: AO0yUKWjvDC67z9IBv9shTQJCDiSqhpJ7IF/QKoyaV6aC6PIM75rbsAN
        iUzJXLi5tirKtuANPoF0bjvcx0xbfHFGgPipro4=
X-Google-Smtp-Source: AK7set+KTSNaOHn43zgUBQqMQHEzYDlagG6cLioaWQBxDYAHuIVlwLr+SpIZHLX9u1b3ZQ8O+jU3UA==
X-Received: by 2002:adf:f304:0:b0:2c7:1210:feaa with SMTP id i4-20020adff304000000b002c71210feaamr16912611wro.26.1678477331462;
        Fri, 10 Mar 2023 11:42:11 -0800 (PST)
Received: from sucnaath.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id n4-20020adffe04000000b002c54c92e125sm585400wrr.46.2023.03.10.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:42:11 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        hverkuil-cisco@xs4all.nl
Cc:     John Cox <jc@kynesim.co.uk>
Subject: [PATCH v2 4/5] media: v4l: Add Broadcom sand format descriptions to v4l2-ioctl.c
Date:   Fri, 10 Mar 2023 19:41:20 +0000
Message-Id: <20230310194121.61928-5-jc@kynesim.co.uk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230310194121.61928-1-jc@kynesim.co.uk>
References: <20230310194121.61928-1-jc@kynesim.co.uk>
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

Add short descriptions for Broadcom 8 and 10-bit packed 128 byte
column formats to v4l2-ioctl.h

Signed-off-by: John Cox <jc@kynesim.co.uk>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b26da2650289..3120548aa139 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1353,6 +1353,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/UV 4:2:0 (16x16 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/UV 4:2:0 (32x32 Linear)"; break;
 	case V4L2_PIX_FMT_P010_4L4:	descr = "10-bit Y/UV 4:2:0 (4x4 Linear)"; break;
+	case V4L2_PIX_FMT_NV12_C128:	descr = "Y/UV 4:2:0 (128b column)"; break;
+	case V4L2_PIX_FMT_P030_C128:	descr = "10-bit Y/UV 4:2:0 (128b column)"; break;
 	case V4L2_PIX_FMT_NV12M:	descr = "Y/UV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV21M:	descr = "Y/VU 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
-- 
2.37.2

