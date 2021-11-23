Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010534598C7
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhKWADt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbhKWADh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:37 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969A6C061714
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:29 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id y196so17036352wmc.3
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q+3MLDYJ/ZL65E+0XzcCajbT6diDBCTk6oc3BzWVgoU=;
        b=FybhARAoTnQHaafZwlqNdgfgq943E6OUGLF7NMU3ohZWecWhRkWkUm56s3u5Z7nFnh
         ZUYlp4cNOt4sZ83i/eJ7xhshyQgLw8r+uBR2WbaBll1nKQW9HiEkwwufbANJxj212Wk2
         VVPgpO28I6iIz8TgZzdnulscmUyC8duNa8kHeh2Tb5rZTRjR092qI+NaJD/356V8KsFY
         LTTCyMXCVwxaicK9BKo8mC3+db5OnR4khADglHX30V/FHZEzpdvAIMA8mxdZMctJGdJV
         HWtatqZUNeWxyaU/JoHGbMULs/GOgYgOl7tU725aLh4xwJVn2kcvg01Q+a0G2n5lAi5+
         qehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q+3MLDYJ/ZL65E+0XzcCajbT6diDBCTk6oc3BzWVgoU=;
        b=W3zNUHcd7PledHsE63jTjY7Hwu3HYGlswn8jhWta8tdCIV0/LxUzxdWPwFp0XLc8OC
         3Xob6J/qOo00zF0KoANFna5Au9n7lL+fFtmx0nz+HrS+9qb7Sx0bZkKDpcQsJRxZSNFl
         VaVmZcMtiV8Sc9gBu4CW1TcHsgBGPjBqhXB4OHOwmuyblkQmXoIcICu6xnnJ7hJsS66s
         tPQv5W69eBHUgAjcL3D4loTkJmAXfYNolvVwDpCpmZU0AC+9bgsWOVVe4uxSAY38NcYK
         xY8qxi+kkXIgvxA6015yXTj+OELeXWjhKru3ydyEg4L0Ttn2UqgS4WC+usEiT4tLsXTy
         /5SA==
X-Gm-Message-State: AOAM5303+ktotDe8xfATZ71A7DgjgERL+DWWPKk0eEGpDkR0RaGf7+ae
        Mwi3PlqsvogTKpbGwVYPOfknIP/6xPA=
X-Google-Smtp-Source: ABdhPJwAXDcfRwTHbsOirYHGKJNkxAO75WHilH3xa796F7k7fF5FG5COOsYVDNA2Y+IV7w6qJQoeQA==
X-Received: by 2002:a05:600c:35d4:: with SMTP id r20mr1510175wmq.76.1637625628276;
        Mon, 22 Nov 2021 16:00:28 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:27 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 04/17] media: i2c: Fix incorrect value in comment
Date:   Tue, 23 Nov 2021 00:00:04 +0000
Message-Id: <20211123000017.43187-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PLL configuration defined here sets 72MHz (which is correct), not
80MHz. Correct the comment.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 9f1c0d66c4f9..a6372a0989e1 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -713,7 +713,7 @@ static const struct ov8865_pll2_config ov8865_pll2_config_native = {
 /*
  * EXTCLK = 24 MHz
  * DAC_CLK = 360 MHz
- * SCLK = 80 MHz
+ * SCLK = 72 MHz
  */
 
 static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
-- 
2.25.1

