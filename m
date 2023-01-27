Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392E167E98B
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 16:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjA0Pez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 10:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234616AbjA0Pey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 10:34:54 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCF68000A
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 07:34:53 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id y1so5331428wru.2
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 07:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUcnfXGHq8wlQsbMjwF+ih7GicQCSKVDP7TPdHU7uoc=;
        b=iKyoXCAyEXSEz3N4u0taPPHPbNxdlms57CIJlJ5yHAkBgU9QGbgaq8tNCwle7Di3uQ
         /pQ6UXSujtvSuTDHdmDKrU1cQUbH59bKEg/+MvOVmmFq7g4fIHiCobG3FfbvmHshV9CS
         IiBymksAzhM/ge6cu24oOl1PclIC2PaDNlhNDVi7Dt3kkd68qFpVpMw7JGXhjixXZFo5
         JsKCXm8cguZv8QLgTHMqw2BSH9ExQAgHOqgRlsL30wqiqNJi3oCCvdqnfWacoAZofXpL
         +IcJMPMjaT+JQzr3BGhJOJRcck35gXRutkFKt5b3/BShH5qrUC19oB8tAq/sZNS7iT8D
         MpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUcnfXGHq8wlQsbMjwF+ih7GicQCSKVDP7TPdHU7uoc=;
        b=t9mAfP+ngwQOq4Jfdc/8g1CWxqBwc7RkJLnYFgoDv7ECsEwKz1h9DmHnawiYJVv/gP
         HGmhON+rfFY+bj2AL6HBG45sb3+SYFeKyq4MTv30pQKpkdZ7qmY2fenPjiM39EGXEG1v
         4ps4wa+d1wuaiiFjIiuGnjgZKFVIcW4CTcPfK1RqpAUOcmJZvuyrozDGWNS106DEeKgu
         xA7VGEmDtUwgT6r+THOrw34doB/REXhGZ3B8KSQSpyNRnwgSYoH38xN5m1DwgobQAnjA
         KO9AgjSVgIqBJg+75DlQIrzGpHvqWABvYZGDfV6t7yEUzvUikIHPpFe2A005vVgcgpRX
         o6Ng==
X-Gm-Message-State: AFqh2kqneT2BIyp3UwFZmH3ozNUjWsa+LaWRQo8LYeQiqOnJ4yTu6VyE
        yItdydgnuC10Bf2JOKS5e3S5PSgBMW9q8Y9Hkyg=
X-Google-Smtp-Source: AMrXdXvkZR+zykfgLNGFLg/eYbbNFMxGo0PO9BrLskzPFzsgzfV0ky8d5ri4LXRu7EtFklrlvpjmKA==
X-Received: by 2002:a5d:5b21:0:b0:2bf:9628:b21f with SMTP id bx33-20020a5d5b21000000b002bf9628b21fmr25581735wrb.59.1674833691295;
        Fri, 27 Jan 2023 07:34:51 -0800 (PST)
Received: from sucnaath.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4d0e000000b002bde537721dsm4231826wrt.20.2023.01.27.07.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:34:50 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, John Cox <jc@kynesim.co.uk>
Subject: [PATCH 1/2] media: v4l: Add Broadcom sand formats to videodev2.h
Date:   Fri, 27 Jan 2023 15:34:14 +0000
Message-Id: <20230127153415.83126-2-jc@kynesim.co.uk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230127153415.83126-1-jc@kynesim.co.uk>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
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

