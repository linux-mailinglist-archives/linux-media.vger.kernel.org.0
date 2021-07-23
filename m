Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBEB3D30EC
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 02:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbhGVXyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 19:54:06 -0400
Received: from mx.ucr.edu ([138.23.62.71]:36134 "EHLO mx6.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232731AbhGVXyF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 19:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1627000480; x=1658536480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WjZhPfz6WGA+e7+W6h7hHSdZYaAsvQABJiyNAJlDjpE=;
  b=o7stjHwfWjfQqN2K9rkColddC63ezIJ33ovKtg5RHNpdQoM4KNSu4A0B
   j4auks/xhKT4IzPVyEvOHhYUysy6nNTKrA4++WSkBJjEj8OSiOOF1kwKe
   3GcDKggG8Bm9znI6rql8cbdeeWnlwGJLJpP9WnSY5ypf2eoZZdEfN5PBX
   XFCmQ8MAhDXhJ4V8pmP8DYmfEYjBbhwzU0cfONTbKU5TvpJ4dHqBlbAPu
   H9bgnTxSIaFJxYRQdNrXFUR5goYqj5E+Bi4IrQDpxiV1HisDy0SmzoJXX
   uuWgxsAcuAOEWH9SyALniFGZn4tzGRt5/MbgfT5RlJ299ITdt/ou6l8xx
   A==;
IronPort-SDR: 68RugcvrZsgFn+DS33dt4qXEDAda032cSyQ579UqtFIPO2AjgwgbRCQdxnr7RaTQPeYsocrKh4
 /3/tTrjWSQ2QanqqbJAhDfR6SPXNCERsj8eAb8GY1oBh00OxWS388/32/PiUkSIxnSv31Z85Gz
 wXRo4IizWYuWz2VoLw3p9WznVQLu3rC5tALjWFQkAeSp3tM0EishE7aN/VHZQnEzeGncg7GLas
 5uzlqbnxjVjJZZYoQusnMfWAmxaTjdiWJA0IRIY61s9hk1KPp6gqSwkzmXBKSuGeeYIuYYXgOF
 r5kh0g1w9V1DUduO3eXYxERR
X-IPAS-Result: =?us-ascii?q?A2FrBABuDfpghsjWVdFagmKDFmNVFpRmAQEGjCYYgQKGf?=
 =?us-ascii?q?IhmgXwCCQEBAQ0BAUEEAQGEVwKCeAIlNAkOAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?gEBAQEBAQUEAQECEAEBAQGBCgtZC2OBT4F5BgQ9gjgpg2UJAgEDEhVSED8SN?=
 =?us-ascii?q?AEFARwZIjmCFgGCYSYFnHCBBD2MMTOBAYgjAQkNgWMJAQiBKIh8hHAngRmBE?=
 =?us-ascii?q?IJQgTN1h2+CUASDHXsTgimBUAEBAZAxG4MGAYxmm2gBBgKDDByDEpsSRYZgj?=
 =?us-ascii?q?l2RJrsWAgoHBhAjgT2CFU0lgWwKgUFNAQIBAgEMAgECAQIBAgECCAEBAo41j?=
 =?us-ascii?q?jZBMjgCBgsBAQMJi1kB?=
IronPort-PHdr: A9a23:vKJlQhcHaGWrCLa6I2HYWduTlGM+St7LVj580XLHo4xHfqnrxZn+J
 kuXvawr0AWRG96EoKobw8Pt8InYEVQa5piAtH1QOLdtbDQizfssogo7HcSeAlf6JvO5JwYzH
 cBFSUM3tyrjaRsdF8nxfUDdrWOv5jAOBBr/KRB1JuPoEYLOksi7ze+/94PPbwlSijewY7x+I
 Am0oA7MqsQYnIxuJ7orxBDUuHVIYeNWxW1pJVKXgRnx49q78YBg/SpNpf8v7tZMXqrmcas2S
 7xYFykmPHsu5ML3rxnDTBCA6WUaX24LjxdHGQnF7BX9Xpfsriv3s/d21SeGMcHqS70/RC+v5
 Ll3RhD2lCgHNiY58GDJhcx2kKJbuw+qqxhmz4LJfI2ZKP9yc6XYfdMbXmpBRcdRVypOAoihc
 YUBFvcKPehZr4bjo1sBsAa1CQ2iCe/zzzNFgHj50LE03ug9DA3KxRAsE88Tu3jQsdn4NKIeX
 Oaox6fK0DrDdetb1zfj5obVfB4vovaCUrB+ccfK1UUjCxnIgkmKpID5Iz+Y0PkGvWiB7+pnU
 OKik2woqwBwoziv28csjZTCi4UVy1HF9SV22oc1KcGkREN1etOkDYdftzuAO4RoX8wiXnhlt
 SAnwbIJpZC1ZjIFyIg7xxHBcfyHdZCF7BLjWuqMLjl1hW5pdrKwiRuu8kWtyuLyW82p3VtXr
 SdIj9nBu24D2RHd6sWKReZw8Ei81DuS1A3f9uVJLEAqmKfdNpUvwaYwm4INvUjfGiL6gkb7g
 a+Mekk65+Sl5P7rbqv6qpOAL4N4lwDzP6A0lsChD+k1MhICU3aZ9OimyrHv40P0TbNXhfMsi
 KbZqorVJcEDq668BA9az5gs5g6kDzejzNQYhX4HLE9ZeB6fj4jmJVXOIPfgAPe6mVuskTNry
 +nePr3lH5nBN3bDnKn9cbph8UJcxw0zzddQ55JQFL4NOu78Wkj0tNDADx85NRK7w/r/Bdljy
 o8TXXiDD6yZPa/Ir1OE++0iL/OSaIMJpDrxM/0l6OTvjX89l18dZ66p3Z4PZXG4H/VmI1+WY
 XvwjtsdH2oHpRc+Q/DwiFGYTzFcemuyU7om5j4nEIKmEZvDRoe1jbyF3Se7GIBWZ29fBlCJD
 3jnaoSEVO0XZSKMLc9ujCYEWaKiS4A/zxGushH1y759IurT4C0YusGr+sJy4rjilAMy6Ds8W
 9WP02iMFzkvtn4DXXk70L0p8h818UuKzaUt268QLtdU/f4cF1pnXaM=
IronPort-HdrOrdr: A9a23:2xz20aAYRnp//O3lHemR55DYdb4zR+YMi2TDGXoBLCC9Hfbo8P
 xG8M5rtiMczQxhIE3I5+rwXpVoKEm0nfUU3WBSB8bYYOCPggqVxepZnO/fKlPbak/DHy1muJ
 uIsZIVNDQ9NzdHZL7BkXCF+h8brLe6zJw=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; 
   d="scan'208";a="230588957"
Received: from mail-pl1-f200.google.com ([209.85.214.200])
  by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jul 2021 17:34:40 -0700
Received: by mail-pl1-f200.google.com with SMTP id x14-20020a170902ec8eb029012bb183b35cso805615plg.3
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 17:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gm4YUZj/EvvmVEru6DPj42P4a48GvfDB+tH0wczqnc0=;
        b=lsg9w/vRlgU0lPrFiHMr/EApN8wqabIlhwzJvJOkrjBNMN5tTuQoNshwwd1MyVUbZA
         mxLRSqDUJttW6BXvEVhr7GEeYgeWJ/I8f4rZ9Wvfmtlh1UuA6ZYlnfRs6JIdIcAT3cvz
         XX6ZCfSL5ZYUlrG/ia9uQw7/7C4/NIWt4NJP5MlPezhq5DvD+3+Ed71saejEqKTMqCVg
         22B0kEEho5GkPdxCU5oA+aCfp80Pjl8AHRdgSIl2S0xkOD4Z7DB4aZKWYfjOzd7aaJBx
         kLXtEw9jorJsg+z8GAZDwyYz5vmoLXPzN5WgJiZGjXgBIPAuMRB6lQiDDLzgKWmm7CjK
         sRQw==
X-Gm-Message-State: AOAM532yw9vu7c8SNuZ9RAGzcOPdS0TSeKA96T4mpuWYfDnAXA6OTiXg
        HxJ4t5EjETOFwpwL6kk7i81sJAWz75OtS5dLNe5XAdZIgDZzQfabhFQ8YWj4ml3L7ZqrWmkrUqV
        SzWJqgkv10zKEJE4HGEaPrwUN
X-Received: by 2002:a17:90a:474f:: with SMTP id y15mr2247988pjg.2.1627000478318;
        Thu, 22 Jul 2021 17:34:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3T0RPoWuoz2nGgWu0oAbQM62TN09QruMzto43e2KyEy0LRuU/QLOYIutxXpEvtusHLp4qOA==
X-Received: by 2002:a17:90a:474f:: with SMTP id y15mr2247975pjg.2.1627000478123;
        Thu, 22 Jul 2021 17:34:38 -0700 (PDT)
Received: from kq.cs.ucr.edu ([169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id b18sm4059224pji.39.2021.07.22.17.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 17:34:37 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     Yizhuo <yzhai003@ucr.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Date:   Fri, 23 Jul 2021 00:36:04 +0000
Message-Id: <20210723003607.64179-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723085145.1ce7ee5c@canb.auug.org.au>
References: <20210723085145.1ce7ee5c@canb.auug.org.au>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
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

