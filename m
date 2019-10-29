Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB00E887A
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 13:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732178AbfJ2MmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 08:42:24 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:42057 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJ2MmX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 08:42:23 -0400
Received: by mail-yb1-f193.google.com with SMTP id 4so5283153ybq.9;
        Tue, 29 Oct 2019 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=K1pJ+AjYi047ZlopREyC5YFV3eC0jvS9A97jFIdkYBI=;
        b=sA56HEYh9uI0fwGa75BOovdBOBk1F9GUVb+Cm9YI8MnpzOrYGtPzM87c8fFImew+1R
         pNDzJX/tr9sRYhl4kL65ZVW1m3zIzfkDdQwKI2b9zmtbofFSdn+iOLyltFgxe7KEJiN2
         9Q/IOo+enZxrtTAmf5cxws8fT9dJ7xCm9Ljg8Nan1UkQoJ9ijQYcTueUInoWB0NCYG2d
         ipV/IsH8rYgy4cdC3Q3TmhPJ4NcZcdz1PZgTm6Zl7ausBJU8LEsBjihnA21zKZCAGIbU
         bCdCArwOjrUQiH8fUwMEZfTf+Os+81Gm3bE5qeF8fveBfQZq/Tvzj9aQmq34i8C8TbE5
         UQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=K1pJ+AjYi047ZlopREyC5YFV3eC0jvS9A97jFIdkYBI=;
        b=GfHXuXA2v2+p4V245SRZAphh9ud7XbnjYeQt76cSHPPrsktu9D22xuU+iVi/y2xWS1
         5cQ17YIRVmfKwxd97hDMpEpLAMbqUWLFUZMaeazzKHhNpz++5ARWjeO4sxYZfQAYY14Y
         /8FpHaGmsJ/PStk125rjjaZigfbiiXIN2ytz2nbc8QBe8jREcQsPBBQjVzXQdMd730EZ
         rQm1pugjJbJdLyEYS8six+pD1SgKmSKDyS1IsDm6boichyvlMvIGZ59RsD0ZgdvwxhjW
         TvlYkxgrcpzvUZiqHmpQsODXcErSfYC3XzXp3ugBsWY3wQmCGyPEQhvwKX7N8Lk3slbd
         7pAg==
X-Gm-Message-State: APjAAAXvoqFyiZuF7welxRr8INcIG9fJBpw5njBbT1sVBm/wZpyr+yzD
        vruoU4bBHmd9R93XKDaltruWtrgg
X-Google-Smtp-Source: APXvYqxcmj0/7NQzyVO/SO4K8JGG87BSdh2uo2MLIaIGWoKqFHQ1reDHKNSOsVHvYIcjtqqZmvh2dA==
X-Received: by 2002:a25:bd88:: with SMTP id f8mr18153315ybh.135.1572352941934;
        Tue, 29 Oct 2019 05:42:21 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id q131sm8174926ywg.60.2019.10.29.05.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:42:20 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, slongerbeam@gmail.com,
        maxime.ripard@bootlin.com, adam.ford@logicpd.com,
        linux-kernel@vger.kernel.org, Adam Ford <aford173@gmail.com>
Subject: [PATCH] media: ov5640: Fix check for PLL1 exceeding max allowed rate
Date:   Tue, 29 Oct 2019 07:42:11 -0500
Message-Id: <20191029124211.15052-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The variable _rate is by ov5640_compute_sys_clk() which returns
zero if the PLL exceeds 1GHz.  Unfortunately, the check to see
if the max PLL1 output is checking 'rate' and not '_rate' and
'rate' does not ever appear to be 0.

This patch changes the check against the returned value of
'_rate' to determine if the PLL1 output exceeds 1GHz.

Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 5e495c833d32..bb968e764f31 100644
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
2.17.1

