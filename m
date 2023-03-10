Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732E76B5116
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 20:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjCJTmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 14:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjCJTmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 14:42:15 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A1412EE7F
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:11 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q16so6074420wrw.2
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112; t=1678477330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUcnfXGHq8wlQsbMjwF+ih7GicQCSKVDP7TPdHU7uoc=;
        b=7FI8dfb5ucfiepnEJYtHF/iJZggQGy2eyfpA24TZ5b+5+QT0tFe9GGFFhAGOXMK040
         3x9Tjp8IL4oiHqHgB5NezmVMHtCcuEMlKN5boqFKoniyy3dFaE8wRi9FDUVsh0AwyyGy
         HZH6hUFj71rgPR4Xm1whmyW8a9J2iH+AAh3DZeUOEXbcYD3f91NiaxdDykMgiltarobt
         Va2t5qDfVKuT5GeXV/Uh5ai4COYFUivqVrp0GQIHrmA1NqGTzIJMEu6hEsrPLtxuAiZm
         X6NyAcaVm8v3cqIRPbw2S4P0xmjhUiKFEw6/T5XI8810aKB4yFeZcDwWM3GPLlvbvqAV
         Pfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678477330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUcnfXGHq8wlQsbMjwF+ih7GicQCSKVDP7TPdHU7uoc=;
        b=f7oEzQEpUmIimQ+GiUHhvqAWatrGZs/p0pWeU/1cLecwgsD4ehjjO9/L2qwjIDGSdJ
         CsMKNBpRekVp2FVh8IhRpL6hM4EH5eBjVIT4sBFbtNoyPw4kSwNKRlle+tTNX7i8Wl1X
         svoN0W0Kk1gkkxWruWuc1iXBvnbY6kSSJM4Z4feiDIEox+NWtoKSdKmVuYsGlq2JWYyn
         kGdPJi+Duj2xBAv4p+z24paAUR79Ye0NIxkp8pV9QYmnSKdJyeReITSyqp340IrhFWnA
         ZNKN1zWYX4yF6hlMA5iCCaMimC5/lbXZWfssC4sMDO0bY7BmY4TxAYmjr3p+BihPG3zr
         HRMw==
X-Gm-Message-State: AO0yUKUEp5PkZRliyS9DUQjZo2VUSSxdHwGNnPRNjLl8pLQo9il4jDmz
        CCXSutsb+H0/zVkUOZNqfi2/u9MpOz6GDsk5WYg=
X-Google-Smtp-Source: AK7set9owERGbj6+LaXa/blGdByoY6V5n7n7j/INLdbA+Uq77V81CsIDWvhuLGuYNKqzgcV36S5DaQ==
X-Received: by 2002:a5d:4e90:0:b0:2c7:e5f:e0e0 with SMTP id e16-20020a5d4e90000000b002c70e5fe0e0mr17357924wru.65.1678477330465;
        Fri, 10 Mar 2023 11:42:10 -0800 (PST)
Received: from sucnaath.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id n4-20020adffe04000000b002c54c92e125sm585400wrr.46.2023.03.10.11.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:42:10 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        hverkuil-cisco@xs4all.nl
Cc:     John Cox <jc@kynesim.co.uk>
Subject: [PATCH v2 2/5] media: v4l: Add Broadcom sand formats to videodev2.h
Date:   Fri, 10 Mar 2023 19:41:18 +0000
Message-Id: <20230310194121.61928-3-jc@kynesim.co.uk>
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

Add fourccs for Broadcom 8 and 10-bit packed 128 byte column formats to
videodev2.h

Signed-off-by: John Cox <jc@kynesim.co.uk>
---
 include/uapi/linux/videodev2.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1befd181a4cc..a836322ae5d8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -656,6 +656,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12  Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
 #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', '2') /* Y/CbCr 4:2:0 128 byte columns */
+#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', '0') /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
 
 /* Tiled YUV formats, non contiguous planes */
 #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 tiles */
-- 
2.37.2

