Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFEE112C50
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 14:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfLDNJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 08:09:20 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:44374 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfLDNJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 08:09:20 -0500
Received: by mail-yw1-f65.google.com with SMTP id t141so2728292ywc.11;
        Wed, 04 Dec 2019 05:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6M5H4D4X2AsOiYboIpdgi6cfmrBnb91azdYQdJ9k7uE=;
        b=ZnKMm7NV37u/pTdxfH6NqTWY4rZ/we6M/bzSCnakVlwVPvqtmHaasJVzLKXG3zu/qQ
         Q5U5Kz9QaBaaTlCeXIURQehZupgHp9oQOh60nZTGEub81x3a+1VJN7Zio+mPNYzWh9KI
         /2vVBvS37+OSQV19yMnLG2K0IrtJHEsfZOJKOrO6r+3WCIp3DCVwPkxrmYzXc+lOpO4u
         +7ez/feDqTKF4dozCL1liXtJS5/1mEwWysHo4ZoXidZN5cwLByhOBWqj2/2hRw18ie8+
         nwuf6/rQxBLh+zn+Y3DabHcFdFaUom7vFSeShMx5626b+fNn5vWR0I2E+yh4hJ+yfMOV
         T6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6M5H4D4X2AsOiYboIpdgi6cfmrBnb91azdYQdJ9k7uE=;
        b=aZW1kmMyOhhTWF3SdAOiuvCg/wJIN0vq3NxdWtEIs8RAihvPKpaV6LuYYRnDJB1vOe
         udgYuoQI77KN9i2TwoGsiq31f/NWCN+FrzVeG4v7EM6uMck0tL2ZPA7Y7005fNxssnU5
         gKC4ehf+G1K1ItUNQrTJJp1Cs3tNaM2L/Dr07l2n6EXstd6UOsC3ggm8ejy/epDgGmmc
         rbNDDsnZFkCIzm0WHJ7oEdk7vhqWcwE2ikwU9Yt50ARTprEBv3beH01K8vUmkpulInY7
         0E7HUOPs/wj/ux2dvVoVXBBQE0MWFxiSc/OsaWwoc0v06fh4Xsu4HCsBplKFAsZSjPW3
         8a5Q==
X-Gm-Message-State: APjAAAWvTzZKrFPm4sC+qzI3sPs19vTxzp9pxqKz7WVbSbssjFDxNzb+
        0h8ESKMbfLaIHRwABZ7UhYAL9sJwclA=
X-Google-Smtp-Source: APXvYqzUC2NwCkByPnF1pFnKQUfDQa9+9llgOQYxTcPuo1Y3zs2vYlHkYcBrgO2ha9dwjLhpC4rJcA==
X-Received: by 2002:a81:65c4:: with SMTP id z187mr1722227ywb.191.1575464959075;
        Wed, 04 Dec 2019 05:09:19 -0800 (PST)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id y189sm2906385ywf.53.2019.12.04.05.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 05:09:18 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2] media: ov5640: Fix check for PLL1 exceeding max allowed rate
Date:   Wed,  4 Dec 2019 07:09:07 -0600
Message-Id: <20191204130907.19799-1-aford173@gmail.com>
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

Acked-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  No code change.  Only change commit description to be less confusing.

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
2.20.1

