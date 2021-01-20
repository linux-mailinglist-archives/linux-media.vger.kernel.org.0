Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9C42FCE6A
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387498AbhATKka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:40:30 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56565 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731645AbhATJny (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:43:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A19l8jEn; Wed, 20 Jan 2021 10:43:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135792; bh=cASv0L/3Ndr/1cXJ9kG21MCLpitVUBYkCIZgva6q27M=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hSoGyyGFfq9hqb/lRu6BjCknO8UQoDDcQunwRywbbELDW0oF57/zZK5CR2qZjN2QY
         7xw9BzUn9s4kPmJSq8tQpc69wvHwPq3I4ER8ogmxfMcOAy2DKxoQ7ZxUdqAhjFHjB0
         OvIE26XPDUA7/GIuSb5kUmxEeSoXY/oucp2hHaOKMmJ2XbTw0OB0eKqRZP47oHvXDg
         xbTXGxacYNsDmA08CT4ZCNW36+KADHsGDFt5bofKMAhTAthp0uaKXzmyZ/W1rdcRG/
         sk7fG1zfufVvGu0f/2lUPdnunHIApD6ZbMOfYq4+0KNtbPNiuIeN4djnss9WXBJmQ/
         6Yt83tUCjL3MQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 06/14] i2c/ov8865.c: fix error checks using wrong variable
Date:   Wed, 20 Jan 2021 10:42:58 +0100
Message-Id: <20210120094306.784318-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfORkKQX5gN9k5kFaBKWeo+8JRWkTLMzG6fpWfMxdBNifkxq9v62lX9Jj+rbzuwPnakICu39PzPg6MMJv16bir3xVLnIVCkM9B8JQVe0xWy2saKwmQdGd
 m2SpTLrwFJwp98Do2dpK1L+DfVBTDRbf2cJz+GRrOWgLQIra6CHaoOKUlywpUr370CJGTmKaILUaPAvbmaZj00hpRivhZUM5xOWpM1QF9KAOKJsh2bLDALE4
 eWQXvTlROWPiQ1smvld8vu/Mes68RDdGCInOYWCmnkXtabvHEnNKkjwGrXufHF3ZWd7O3Qk6aQSs4uE1ptnzUQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix two typos: dvdd -> dovdd and dvdd -> avdd

Both clearly copy-and-paste mistakes.

Fixes this smatch warning:

drivers/media/i2c/ov8865.c:2852 ov8865_probe() warn: passing zero to 'PTR_ERR'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/ov8865.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index fda5a55979aa..72ef300c0b67 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2839,9 +2839,9 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* DOVDD: digital I/O */
 	sensor->dovdd = devm_regulator_get(dev, "dovdd");
-	if (IS_ERR(sensor->dvdd)) {
+	if (IS_ERR(sensor->dovdd)) {
 		dev_err(dev, "cannot get DOVDD (digital I/O) regulator\n");
-		ret = PTR_ERR(sensor->dvdd);
+		ret = PTR_ERR(sensor->dovdd);
 		goto error_endpoint;
 	}
 
@@ -2849,7 +2849,7 @@ static int ov8865_probe(struct i2c_client *client)
 	sensor->avdd = devm_regulator_get(dev, "avdd");
 	if (IS_ERR(sensor->avdd)) {
 		dev_err(dev, "cannot get AVDD (analog) regulator\n");
-		ret = PTR_ERR(sensor->dvdd);
+		ret = PTR_ERR(sensor->avdd);
 		goto error_endpoint;
 	}
 
-- 
2.29.2

