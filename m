Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4FBA51B1F4
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378987AbiEDWe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237672AbiEDWeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:25 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32CF2CC9F
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:43 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q23so3819219wra.1
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wjKT8/HtIvRRldjfymBu3g/MFDvJOLJj7QZZaQyz0Z4=;
        b=QfCRzAWPD+U+Fj98hpID6uvoCtvZyffpcCcrlPlDr8Krr8q2aXjKKSNuPvTWnVCeyx
         esOhqM4jCWJLR9NSzFbInXd/7uzh53WUq2CYibdArgjRFmp7pkhoxrO+jw4PuewyI7Fb
         lGcEPO9FU1rSt4VfXhevLf+L/5cLoY/aXEI6rNwBL7CG3v2LyzbXSRvwjaQasN3sZbL5
         OET+Odedl07quLz1JBRsPVTC+hxFE5fyicOeO5lywQMKrG8GSKPlv5GFIgRPHsJPDUm8
         MRLEC7Pv9/9DiDQwtC+K2xSnohBsBr8z09+fhcx0grHvAbg0ZubElkhIyzDB5W2ZR2E7
         qqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wjKT8/HtIvRRldjfymBu3g/MFDvJOLJj7QZZaQyz0Z4=;
        b=jmMdc09cIuUQrIFFvtEWZhumZrIbm5X/58n0JNYIwNFPq7+sTfaJGdhvyOVyImpOVd
         +m5SKiHVyMa5DeYWeZ3BDzQUrQ2ehSQMO+vNt4aZDh1oAW2YYlXapB/HaaowOA2PPoA3
         cSJZybb48lNN4jlYhHbFzX3ElyWgYsf7vqanKV3wArtW6U/xsUvQeLPhD4I/ZIXroHKL
         kcirqQQkbkx/gJJtJbKIBocjU5MWSmyGVJtzR4FNSanz3OCSm2FLBLv+Hrf8vIOaWx3t
         c5OGDUQ+xres7RDDvUu6eDqkxrIxcDlNh8hAQijIfwzeNVxZe6liLMdCe86b5Rxhpxg9
         A3PA==
X-Gm-Message-State: AOAM530sTWiaoZ638xD5W1s/HDTEC8/NzeU90vm+g5RwrR0aohg8qwdD
        xd1EQ18RQUibsDbCFiZcS+Xt+D+1fdE=
X-Google-Smtp-Source: ABdhPJzPdMadfFAKMlQWfSqX5Zv9FNlMD3OaxlPWGjg3aosSS2Q4pJYjcUazvA+OBz4hjDkRgSI7Yg==
X-Received: by 2002:a5d:59a5:0:b0:20c:5603:c0c3 with SMTP id p5-20020a5d59a5000000b0020c5603c0c3mr16964624wrr.521.1651703442617;
        Wed, 04 May 2022 15:30:42 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:42 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 02/15] media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
Date:   Wed,  4 May 2022 23:30:14 +0100
Message-Id: <20220504223027.3480287-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have platforms where a camera sensor transmits Y10 data to
the CIO2 device - add support for that (packed) format to the
ipu3-cio2 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

Changes in v2:

	- None

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 0e9b0503b62a..93cc0577b6db 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -65,6 +65,11 @@ static const struct ipu3_cio2_fmt formats[] = {
 		.fourcc		= V4L2_PIX_FMT_IPU3_SRGGB10,
 		.mipicode	= 0x2b,
 		.bpp		= 10,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
+		.fourcc		= V4L2_PIX_FMT_IPU3_Y10,
+		.mipicode	= 0x2b,
+		.bpp		= 10,
 	},
 };
 
-- 
2.25.1

