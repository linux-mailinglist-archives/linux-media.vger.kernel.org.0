Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A203130F9
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 12:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbhBHLfX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 06:35:23 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34053 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233103AbhBHLdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 06:33:17 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 94mLljIGcW4yN94mOllQEM; Mon, 08 Feb 2021 12:32:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612783953; bh=Ss85Ty6ChQv/rF/V0wOK3bguIsGY8X0PPIE2qcOiYI0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=p3o7K0TpwSMZpmu6YwGsnxT7ccmWXGGqrVFBZZpR0bm4+03U8BBaa6PpHO4YUZrxW
         rdCsfO5D8LAJt0eB74ZhwM3plM1uS5WaP5VhwXpwFwBR91tbZtFDkg24X9L+08H36F
         g42d/kpPIg/MBj8oa3pkxsaVmj+Lkl5CnR2p/YdAjS3SDcnFBvDcHbtzv2WdEVnBpL
         KHP2xmjpNEezeMS7+uhIDH1DEEMoLMKVQfQBKw9dvL6T4wQV62dyrZ3qJaZR+V8x7C
         4ZDIgKwc+FTGr6hD/wj/MYEhmm0kYOuz/nrfpoCwhXr853pWWX0hDcTfDFs/Sh54C5
         F5HwxhCoHyG5w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Martina Krasteva <martinax.krasteva@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] imx334: 'ret' is uninitialized, should have been PTR_ERR()
Message-ID: <917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl>
Date:   Mon, 8 Feb 2021 12:32:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBBC8Zm5FioE5rO3c8RlmYZrAnwvNJ4Ox4mL8SzunbURTrEZjb81cDICObvhrEO99Kg4XVGjCnxN/qXNzGvvR5sdq9ttSOqn/+Rx1RaJH3IarUhnfrjV
 PKBDpk2htKLtJUq5ZeZBUnP+C1jIM8QiNgSJ3x6Bnk82GynUf9815o2pxuKsHpEK7fph02HRsutkZsznkzwEHeibguM8XWReeuOFd08qwoN4dALmMfMXWdvf
 U4Xt3Z746mfarGHWUE9JlmQtf8htGUM5InAabQqc+6d/3ubMGVs1VEYtmh0+uADz
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this compiler warning:

drivers/media/i2c/imx334.c: In function 'imx334_parse_hw_config':
include/linux/dev_printk.h:112:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
  112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |  ^~~~~~~~
drivers/media/i2c/imx334.c:783:6: note: 'ret' was declared here
  783 |  int ret;
      |      ^~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/imx334.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 07e31bc2ef18..ad530f0d338a 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx334->reset_gpio)) {
-		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
+		dev_err(imx334->dev, "failed to get reset gpio %ld",
+			PTR_ERR(imx334->reset_gpio));
 		return PTR_ERR(imx334->reset_gpio);
 	}

-- 
2.29.2


