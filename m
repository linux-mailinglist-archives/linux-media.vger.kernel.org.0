Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C69D4B7B05
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244358AbiBOXIN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244343AbiBOXIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:12 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839987674
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:08:01 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id x3-20020a05600c21c300b0037c01ad715bso388023wmj.2
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3iUKXpsWvnYENTSa7D2kghfQRHXp3gOSZNEj5S0Nu0A=;
        b=Vytv+VH+8Xu9JpX537GKIqhwBr+oI95WiBwq40kqoESolCyaiJUoRYlqc9nc8qiNRp
         44P+scSfeexEZWHklQ6PAAR0/nWNl+HBnNFMw/OanVJ3eQCgNA/zzjCirgcmgxelzmQo
         +KQjkXh580sgV0JG4yS+O3G0Z7NFUdcwzfha19pw0AOU3c8MlooiPZllvO1guSY+/Se/
         3/i9EA3cyvZoFEZWstsuk/3xpNBkQlq2gWZlG+7OB4p+hsm2vNy7ZQT0OobE+eyuzial
         DbuTOyHzFWNOAMgysUrZ3yC2l6VXyE+loGmjltYk0DDidOHkVqrPAt3lhTEu63D3+Aur
         2XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3iUKXpsWvnYENTSa7D2kghfQRHXp3gOSZNEj5S0Nu0A=;
        b=VXdzvrByynpidxR0S6ibeiooR369/c69ImqsYsuJcOPUIaqbIK0Ftgfu2cULn7/5pV
         j6gIUbpItwNYgsLrtq1G26ZDM6EeeoHRcCHXUOtRRmmwN38hqHBmv7mAiMUvR9qikea6
         2145LYakKpHJwovXjzu8TS89fvbP29KW7S8yhuPFkxA/GuHsr04iRTqja43yqadKJ74a
         daqvCitWODMiSdou0L0IqAZBG2gozOiYy3Noy3lreTyNGvijyArN4U9Z0j1/E5Yf8T6V
         lmCYLhYHD/8/xP8ExSQb1HW+EcuNMRCy7lDb0PRm727dRUNfLqFqzSu8sWJJjuUcAZTk
         M+ww==
X-Gm-Message-State: AOAM532egu4uG6vAHIyYpCX499pP47t+ZwkrmgItEmq1jiH5d3qBOJfV
        G88hCo4S+5Tr6UpSSoY9t8pyPgWohAtI3g==
X-Google-Smtp-Source: ABdhPJx04N05ZsAMUTfSc1foZNTar/e3QqN7QNB0R+I++9Z6u1QjE7TXLG95S/B5ARjmTmJbVwDePA==
X-Received: by 2002:a05:600c:22d3:b0:37b:f1a7:ceb5 with SMTP id 19-20020a05600c22d300b0037bf1a7ceb5mr124707wmg.164.1644966480205;
        Tue, 15 Feb 2022 15:08:00 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:59 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 10/10] media: ipu3-cio2: Add INT347E to cio2-bridge
Date:   Tue, 15 Feb 2022 23:07:37 +0000
Message-Id: <20220215230737.1870630-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
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

ACPI _HID INT347E represents the ov7251 sensor, which can be supported
by the cio2-bridge. Add it to the list of supported devices so the
bridge builts the software nodes.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 7ccb7b6eaa82..a27b4948b4f6 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -25,6 +25,8 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV8865 */
 	CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
+	/* Omnivision OV7251 */
+	CIO2_SENSOR_CONFIG("INT347E", 1, 240000000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
 };
-- 
2.25.1

