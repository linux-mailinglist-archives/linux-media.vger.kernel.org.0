Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79970112CB2
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 14:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbfLDNgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 08:36:01 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:34474 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfLDNgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 08:36:01 -0500
Received: by mail-yb1-f194.google.com with SMTP id k17so3005417ybp.1;
        Wed, 04 Dec 2019 05:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Fu/F/3hbRJ1qpwigXrSbTCuUbqafK5Sx/Cpuh8kUDQ=;
        b=LAlb7P9ibskFckAA6MOHQZ2SzqGzOPg2jrOu9Ii4vrlScWsZJk6oqx1KGpLR/+R6sv
         /zllHCuuL6ePy2eW1Xc7CJF9kfT9EmJbz3y/zOJV66lIL78B/w5ZyY1wuEShadWEbS3X
         KH9GUNzuxVTZOjU0ehb740KlcybYaWNggFS0W1LCkgxOCcwVVqjXLbl9CIjhbzl5IxG+
         KGaanmVkhm0J9A+K5fU+SLZ6OKPi23oLxJ385EGWM2C1/odROujUt7xT1lAc4Fi02MML
         KcEt8cWt0hriA1qVdZeRm79yryd9aXRLKDAwe5Q1bEJ56u52LqJlsplLK4k9duWts2nM
         54yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Fu/F/3hbRJ1qpwigXrSbTCuUbqafK5Sx/Cpuh8kUDQ=;
        b=XdfUV/SWxNpMh1QEjo6xlij9f4WzjRRKwpuI3UF3l6CS5K3y2gG+vgFE2egyMwgcx4
         9eVk08JRh3VTFpNr8xuSELmcQsvLx245lsVIXpOzsBn0h8kGIEKs0WcBq6R6H/V2+Qjg
         cqM0nm/2TV9JW/Cd1mZItbyRJepRp0M568PwjmSqMAnUc5OzWUmsx2xB3qd3F/vUeuRO
         eOBHdGaRCSXibfsh9p5VDnB+wgCe32mZKdacdfVMLpShPG7+JU3+AdwdLOLUYarTx0TA
         5thLGcHfUilmlkcWu+F+LzJRa7hWVkF28PUDXRJLj6aTP5io/9rr0j06mD90mCmtC3PD
         oNYQ==
X-Gm-Message-State: APjAAAXXb+5N0h6L8L+ZjsVimpMnD0d1yYrHFqymjVYKOjtYxpnetA0y
        1x7dxhuI6klD+nXNJ6KW5Z8fh6bJzug=
X-Google-Smtp-Source: APXvYqwH0C/8Ivgr9kMlmTemKaNo43xh2PqidFqISWQD0lb0U1kt+HoFDClBqBpuoekqEMhpyh/BOA==
X-Received: by 2002:a25:dc86:: with SMTP id y128mr2102393ybe.126.1575466559849;
        Wed, 04 Dec 2019 05:35:59 -0800 (PST)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id e198sm3254617ywa.51.2019.12.04.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 05:35:59 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     adam.ford@logicpd.com, maxime.ripard@bootlin.com,
        Adam Ford <aford173@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3] media: ov5640: Fix check for PLL1 exceeding max allowed rate
Date:   Wed,  4 Dec 2019 07:35:42 -0600
Message-Id: <20191204133542.17239-1-aford173@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PLL calculation routine checks the wrong variable name 'rate'
when it should be called '_rate' when checking to see whether or
not the PLL1 output frequency exceeds 1GHz.

This patch changes it to the correct variable '_rate'

Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")

Acked-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V3:  Add Fixes Tag.
V2:  No code change.  Only change commit description to be less confusing.

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 500d9bbff10b..a3c0be56ae02 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -874,7 +874,7 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
 			 * We have reached the maximum allowed PLL1 output,
 			 * increase sysdiv.
 			 */
-			if (!rate)
+			if (!_rate)
 				break;
 
 			/*
-- 
2.20.1

