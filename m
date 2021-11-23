Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EAD4598DC
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbhKWAEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232879AbhKWADt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:49 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3CEC0613F1
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:41 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c4so35662792wrd.9
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KIGNvcARpMlW7oz6VNmdq8EGxgVuFaq/E3tv969Js34=;
        b=oC4YQ7tcCT1MQe8Q0JEwMd8RWPnyrlayXdlMgX3Ozyn37o1fUcrxwrd5hhg7Eumxrn
         z6hzO2yssQGa+WEpvumtanMZiBKVOzJ6NITUG1xZxOcLkjayCeGEfKDAK1XAlgRsCIhG
         GK604iJ1iALgqNiGAgoTfbSQNrCesgeV49CGsH78gjRrzzrKTPihG9CrLb+IG2AGDEh5
         eWJbNy3dAXq1R434i3qpKMoCS2DUpBAujI30t8aaUTsQ/MEKMUYu5BUz5g1DvY/QR4kl
         8D4o2NTmqjqzBvlsL4EWEkE2PuHueZdQfkIen3JWeF2hPEwHirl3v+5oQoOitSvTGFQn
         8GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KIGNvcARpMlW7oz6VNmdq8EGxgVuFaq/E3tv969Js34=;
        b=xpa2PhlpjU6n+pF9yTdqo5D9UPWULUoTpaO9AY4XqGy/WFSRcaHOSOqFtTX9+LHNh3
         0ON2cGfnc0TN/jbeQxmeNaGTRLVulFlbRlKfiQuuFVgkhggs2Dz7PQw6oBlbxgXsXJR/
         ZFfXu3KydH9pKwAV8G5ZK29HQW414g3TbP+9uR8Pf7kwDLrOKZFWEiH5PTJzBR+8gh/V
         dUOvW72poaj//vCvwbSmF8UjZgFmrG2P8AY6AM3SkhbqIiFi/Yvj5WeG0UU24H1wQ/gk
         694EZvE4FgFd/N/R3APCQlHebL0yI0s/HzAD3Kbcj3TUMW7YDT+51ftwQgGHsivYo00R
         +6kQ==
X-Gm-Message-State: AOAM531O8/xR/0UOv/M879NS5AX79iiD2qq5er4QhKxqt9tMzdrC8Uoq
        Ksy+CfS/t0csjou/K1vPGftfWOLO5JM=
X-Google-Smtp-Source: ABdhPJyNcMFh13MFcuoPmyRQDjpVW25hKnVlPQA1cSBLrG4zm8P2/iQV9pu8FVtikQSYRtciD2ozAg==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr1565192wrs.249.1637625639729;
        Mon, 22 Nov 2021 16:00:39 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:39 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 16/17] media: i2c: Fix max gain in ov8865
Date:   Tue, 23 Nov 2021 00:00:16 +0000
Message-Id: <20211123000017.43187-17-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The maximum gain figure in the v4l2 ctrl is wrong. The field is 12 bits
wide, which is where the 8191 figure comes from, but the datasheet is
specific that maximum gain is 16x (the low seven bits are fractional, so
16x gain is 2048)

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- Patch added

 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 1aa577dba0a3..ebdb20d3fe9d 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2535,7 +2535,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Gain */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 8191, 128,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 2048, 128,
 			  128);
 
 	/* White Balance */
-- 
2.25.1

