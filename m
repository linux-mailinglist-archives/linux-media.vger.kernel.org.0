Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263BE3B3C48
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 07:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbhFYFjo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 01:39:44 -0400
Received: from mx.ucr.edu ([169.235.156.38]:54848 "EHLO mx-lax3-3.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhFYFjo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 01:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1624599444; x=1656135444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G2oig34TGgKGc+PsnU3ZBFvHpvFyfTN2H3X7vZGztVI=;
  b=GCKI3alGiVEj1BdGVppofLbh9kDcP5kqgec3X3uOWlwgmLAwpeq8yP21
   V8He270rrA3e6X+Cn9L3Lcg6+yt9GRShKeujlNlbH5zyWYaK8rqZlN3u7
   BVIhz5dIg1I2mD3lRXyAkPm3Em7jdKVosGadcs3neOak5L0mxec7nWBIV
   7eMi7c37rUXpWX1x6B37UEroPfVIU5w4dOEAw0Ll7slmghvIxqs/6sNob
   Uf05Jhma8nNZJk+GqXP/tXRmHwfw2i91cwAgUdl7W/H8/f8uyeb7ZShQG
   D8/zyfSBfFTcftRrUW22UIpxvrk+Eg2MBtrUigC1TzN7a/lFn5uTUCrEJ
   g==;
IronPort-SDR: mlq2Wqk5qoL/fXKDFrtRLxA9sqLt5p/hrK7uZ4qM5v3hLF/DTFNeZxLRMM6qZxaRWHpfkNs5UM
 2wIghtmB5Am1ePAIMAA8VVObXlEftGa/Y5I9vzEaH5SjZ0DckR224VITDqK9sLf+T1KDmDWEKI
 kluL0B0OrfMZBe7rzpSpKOeyPgk7D1DO9gz2IgVFPFF7FLDcZPOKXopP4X5rwn/pXpA7DfZHL6
 gg+5nsL7rp7jcCJ4wBmGVog7jGM6AVcx9UyqPKfSbC1X40t3pZ7dO3RDZPXzU0FYnG1kEpBoBn
 apU=
X-IPAS-Result: =?us-ascii?q?A2EUBwA5atVgh0XYVdFagmCDeVUWjUyHMAEBBowaGH+Ge?=
 =?us-ascii?q?YhlgXwCCQEBAQ0BAUEEAQGEUgKCcAIlNAkOAgQBAQEBAwIDAQEBAQUBAQYBA?=
 =?us-ascii?q?QEBAQEFBAEBAhABAQEBbIUvRoI4KYNlCQIBAxIVUhBRNAEFARwZIjmCFgGCY?=
 =?us-ascii?q?SabB4EEPYwxM4EBiCoBCQ2BYwkBCIEoiHqEcCeBGYEQhAJ0h2+CUASDH3sTg?=
 =?us-ascii?q?3YBAQGQExuDBAGMPJtHAQYCgwUcgwCacESGVI4nkH66MgIKBwYQI4ExghVNJ?=
 =?us-ascii?q?YFsCoFBUBkOjjiONUEyOAIGCgEBAwmMbQE?=
IronPort-PHdr: A9a23:2Kvd9xd00tx0+gcEtayWND7plGM+Rd7LVj580XLHo4xHfqnrxZn+J
 kuXvawr0AaYG96Htbka1qL/iOPJYSQ4+5GPsXQPItRndiQuroEopTEmG9OPEkbhLfTnPGQQF
 cVGU0J5rTngaRAGUMnxaEfPrXKs8DUcBgvwNRZvJuTyB4Xek9m72/q99pHOZwhEnjSwbLxzI
 Rm5rAjcttQdjJd/JKo21hbHuGZDdf5MxWNvK1KTnhL86dm18ZV+7SleuO8v+tBZX6nicKs2U
 bJXDDI9M2Ao/8LrrgXMTRGO5nQHTGoblAdDDhXf4xH7WpfxtTb6tvZ41SKHM8D6Uaw4VDK/5
 KpwVhTmlDkIOCI48GHPi8x/kqRboA66pxdix4LYeZyZOOZicq/Ye94aQGtBXt1KVyxABIO8Y
 JYEAfQYM+1FoYn9pkUBrR+jCgKxAO/ixCNEinrw0KI9z+ksHx3K0BE5E94SrXjfsdH5OLoSX
 OywyqTD0DfNYO5M2Trl6IbGbA0vr/+PU7x3c8XRx1IiGx/ZgliKtYDoJS+Z2vgLvmOG7+RgT
 +Wvi2s/pg5zoziux8csipTOhokIzV3F9SR4wIYvKt25VEJ3fdCpHYBNty6GLYt6WN0tTHx1u
 CsjzLANpJG0cjQQxps92x7fd+KIc5KO4h/7VOifISp0in1kdb6jhxi8/lStx+78W8e71FtHs
 zdIn9rRu30NyRHd5MaKR/ty80q81jiCyh3e5+JYLU0wlafWNZgsyaMzmJoLqUnPADP6lUHsg
 KKVdkgo4Pak5/nmb7n8p5KRM5d4hhz/P6kqgMCzH+o1PwgUU2SF++mwzqPv8VP3TbhMk/Y4i
 LPWsIrAKsQevqO5BghV3Zs95BunFDem1cgYnWEALFJYZBKLl4jpNE/KIPD/Ffq/hk6jkDZvx
 /zfJr3hAIjBImHNkLrgebtx8UFcyA00zdBQ45JbFKsNL+70Wk/0rNDYDxk5PBKow+v/Ftlxy
 ocTVXiMD6KZKq/er0KE6+M1L+SNYIIZoDP9JOIk5/7qg385g1gdfayx0JoXaXG4Hu5pI0SFb
 XbwjNoMCnoKsRYkTODwllKNTCNTa26oX60g/jE7FJ6mDYDbS4CpgbyB2jq7H5JPamBDFF+DD
 HboeJ+fVvcSZyKdPNVhniYHVbe/UY8h0w+htAvgx7pgNOrU9X5Qm4jk0Y1E5v/TiBZ6oS1mD
 82ciznWZ3x/hCUFSyJgj/M3mlB01lrWifswuPdfD9EGoq4UOjo=
IronPort-HdrOrdr: A9a23:4aX6narMN3m8bzfzvNAdXJ4aV5oWeYIsimQD101hICG9vPbo8v
 xG885rsiMc5AxhO03I3OrwQJVoP0msk6KdiLN5VdzDYOClghrSEGgL1+rfKlbbaknDH4BmpM
 VdmmtFZeEYz2IRsS832maF+q4bsaC6GWmT6Ynj80s=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; 
   d="scan'208";a="53721912"
Received: from mail-pj1-f69.google.com ([209.85.216.69])
  by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2021 22:37:23 -0700
Received: by mail-pj1-f69.google.com with SMTP id p22-20020a17090a9316b029016a0aced749so4920361pjo.9
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 22:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xtwG69GQCPYiiB5WlVucW+OBGTJgS4kN+uKVm3Qcm3Q=;
        b=fk7kGuJcumOnusN6SCSIF3R0l/LYoXYumavxunEYNVRNmafKBd5BrfTHXJ+dc1IQ+v
         mX5agUv4uOD49HzO652KwUBpXuZWJF+fDgN8nlzXvYsDFM0S7UlTXy0qelQZXUe6aKVV
         jffuhoq4daO1DaSbkL1rvilM67j+jc0JYb3oHtwpGaGnf6WbEcdH0j65eWLPs+iTuobG
         ShUuy4mnMELtpVNcsllRuC1tBqseG28LtWkPgO87EdNmRkVFSJhAJ+AU5RzRLd7vFwAb
         hb8pJ1Tgb+7qT6rEF/plo8FRH9/eWjReq/w/gMmrXR2sbxDFd2tbk9F7L2G+3Ng1BYUH
         spgg==
X-Gm-Message-State: AOAM530NgyUhxC/qrhN37bXvSD2fX0BbNzwC/u1rF2f8qcvrPQi6jNpB
        P8/yKiq2U8U2hNdM2/k4DYu4tRVeO3shvzTHmtSENCyX/1doTOakUhAfcUPxWIGy6AK5k0YV+e3
        R1pvgSOobQ8z2Zb726DBOPxaW
X-Received: by 2002:a17:90a:af95:: with SMTP id w21mr19507057pjq.72.1624599442521;
        Thu, 24 Jun 2021 22:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqRTmcqC4vi40EHsgDckYDej90aX9OSDH8R6PN5TIdXSwHdDOECqZKmcofW6Yn2pEh34YR1w==
X-Received: by 2002:a17:90a:af95:: with SMTP id w21mr19507045pjq.72.1624599442356;
        Thu, 24 Jun 2021 22:37:22 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id z26sm260933pfk.112.2021.06.24.22.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 22:37:21 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     Yizhuo <yzhai003@ucr.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: atomisp: fix the uninitialized use and rename "retvalue"
Date:   Fri, 25 Jun 2021 05:38:56 +0000
Message-Id: <20210625053858.3862-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624031719.11157-1-yzhai003@ucr.edu>
References: <20210624031719.11157-1-yzhai003@ucr.edu>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Fixes: ad85094 (media / atomisp: fix the uninitialized use of model ID)
Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..77293579a134 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1533,16 +1533,19 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u32 retvalue;
+	u32 model;
+	int ret;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev, "%s: i2c error", __func__);
 		return -ENODEV;
 	}
-	mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
-	dev->real_model_id = retvalue;
+	ret = mt9m114_read_reg(client, MISENSOR_16BIT, MT9M114_PID, &model);
+	if (ret)
+		return ret;
+	dev->real_model_id = model;
 
-	if (retvalue != MT9M114_MOD_ID) {
+	if (model != MT9M114_MOD_ID) {
 		dev_err(&client->dev, "%s: failed: client->addr = %x\n",
 			__func__, client->addr);
 		return -ENODEV;
-- 
2.17.1

