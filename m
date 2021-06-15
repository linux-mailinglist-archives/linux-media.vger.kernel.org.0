Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015C53A88E7
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 20:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhFOSzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 14:55:08 -0400
Received: from mx.ucr.edu ([138.23.62.71]:10728 "EHLO mx6.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229749AbhFOSzH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 14:55:07 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Jun 2021 14:55:07 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1623783184; x=1655319184;
  h=mime-version:from:date:message-id:subject:to;
  bh=VwHEffF6WEd8HZtGBpsh6YDP+gKybrkud0rCfHHpekU=;
  b=b5ZXKMLwQCMDb41GMpG2qfuQTHX7fiJmhpUFXX5CZDRtF8MWR4J2s5DR
   UXcRKXY6FEUUygmAuEMKagZacEviwRFM1L+cvPOvPe4HIb8HXhNF4AigZ
   bwEf/Nf7x3VZ0ej0iA0thLj6ids5yWE3+ZQRO1KWeeIPlj3I80mdERSak
   rxKz5iXgOvmO+XkDyne1DuclD8YL2PCPdNfqPNYoXgi7WJxGNOmc/MgS+
   jQCSnLR6PqZKMxL+hFGWN+I/PvqnRNFSRUKjErnclp9OgCV4PQrOGV8Mu
   A3WjUGTeTjo7T2QunZcutG5FseVTRixuRiaYPD+cO3cdY52TJbvvTgWIR
   w==;
IronPort-SDR: 1PDWsyY/hfb9FCsAjHe+XnMmkpRYVp5CY11JN3QTRyWgqvIjlfAXckE7I2tz5FBakayFoEhMw6
 9KVV9TIAw/5PuQwdWiVI4y5FWlGjfuepKy2IYXd31NuTpvfyyeBxnBrqssL3ds0lVoVyTd8vR6
 Y/u8kHJXlwe0IzIrEnyopwEOZVDUDFMa2b8eVSnFHOdxwgfLVVAavUI/fWWdHdNpQwItdYcoLn
 1kCAtZO3iX5R9LJYbgRY3J+0D88piXSG4F5r1AF+Y3vAlJU9Plb3Su+W+OqQUXew3SekHM40nJ
 1Ho=
X-IPAS-Result: =?us-ascii?q?A2G2AgDC9MhggMbSVdFagQmBV4N4bIRIlScBmCWBfAIJA?=
 =?us-ascii?q?QEBD0EEAQGHOwIlNAkOAgQBAQEBAwIDAQEBAQUBAQYBAQEBAQEFBAEBAhABA?=
 =?us-ascii?q?W6FL0aCOCkBhAURBHgPAiYCJBIBBQEiARIihVcFnF+BBD2LMn8zgQGIJwEJD?=
 =?us-ascii?q?YFiEn4qhwmCZ4QhgimBS4I3dIQLg1CCZASDGXsTg3YBAQGeM5xgAQYCgwMbn?=
 =?us-ascii?q?XgrpWUBlVSkTRAjgTGCFTMaJX8GZ4FLUBkOnQ0kLzgCBgoBAQMJhxWCRwEB?=
IronPort-PHdr: A9a23:MK81MB8pP4RNZv9uWXK7ngc9DxPPW53KNwIYoqAql6hJOvz6uci7b
 QqEv6om0wSBdL6YwsoMs/DRvaHkVD5Iyre6m1dGTqZxUQQYg94dhQ0qDZ3NI0T6KPn3c35yR
 5waBxdq8H6hLEdaBtv1aUHMrX2u9z4SHQj0ORZoKujvFYPeksC62/q89pHNYQhEiziwbL1vJ
 xiqsAvdsdUbj5F/Iagr0BvJpXVIe+VSxWx2IF+Yggjx6MSt8pN96ipco/0u+dJOXqX8ZKQ4U
 KdXDC86PGAv5c3krgfMQA2S7XYBSGoWkx5IAw/Y7BHmW5r6ryX3uvZh1CScIMb7Vq4/Vyi84
 Kh3SR/okCYHOCA/8GHLkcx7kaZXrAu8qxBj34LYZYeYP+d8cKzAZ9MXXWVOUMZfWSJCH42yc
 ZcAAvEdPepEtYTxu0cCoQe8CASqGejhyiVIhnjz3aAi0eshEADH3Aw9H9IJrX/br9X1O70TU
 euoy6TJzTTCb/NM1jf89ITEbh4srOqRXb1sa8rd01cgGB7YjliJr4HuIjya2PgXvWeB8+pgS
 fygi3QhqwxpozWiwtohh5fHiIwb113J6CV3zJgoKdGmTEN3fN+pHpRSuiyVKYd7Q90uTmV0t
 Cs01rELu5C1cDUExZk7wxPSZfqKeJWL7BL7TOudPyt0iXZ/dL+8hxu+61asxvDgWsWuzVpHq
 ilIn9/RvX4XzRPT8NKISv5l80ek3jaAyh7c5/lfIUAxiarbM5khwqMslpYLsUTMACv2mELug
 a+TbEok++yo5/3/YrXou5OQLoF0hhz6P6ktgMC/DuM4Mg8BX2if5+uwzqHs/Ur8QLlSj/02l
 LfWsIzCKMgFuqK0BxVZ34Uj5hqlETuqzcgUkWMaIF9Bex+Ll43pNEvPIPD8A/e/mVOskDJzy
 vHGP7zhAo/CLnnfnLv9c7tw8FNcxxYpzdxF+Z1bF6wBLOrpWkDtrNzYEgM5MwuszubjCdV90
 J4eWG2WDq+cLqzdrF6I6fg0LumSa48apiz9J+Im5/Hwl385n0ESfa2z0ZsQcnC4EacuH0LMR
 HPxmNBJOm4QoAM6TOuio12PUTdZLyK3VKIx5jgxIIGrF4HOQsaqmrPXmG+yHZRMZyZPC1SRC
 l/sdoOZS7ENbj6fJolqlTlAHZe7RoBp9gupvQ+/67N9Mu/d/GVMuoju29t1z+nSkwwi+ztpC
 ciUz2CKSSdzhGxeA3c0wal5vQp0zluO2IB3hvVZEZpY4PYNGgM7M4PMiul3B9H7chzOc83PS
 1u8RNiiRzYrQZZ5x94IflY4AMmrgRHF0AKuAqQJjPqPBZop4uTQ0ma1b8J8zWvWkaoslV8rR
 uNROmC8wK1y7Q7eA8jOiUrKubytcPEt3TzN6WDL/2qHvQkMQRxwWKSdBSs3e0DM69n1+xWRH
 PeVFb07P14Zmoa5IaxQZ4is1A0eLMo=
IronPort-HdrOrdr: A9a23:usZ1nqnCO3etnG9c+qMFYIg6EDTpDfIl3DAbv31ZSRFFG/Fw9v
 re+8jzuiWE6wr5NEtBpTniAsi9qBHnhPxICOAqVN/IYOCMghrMEGgN1/qH/9QiIUDDHyxmv5
 uIv5IQNDQ4NzQVsfrH
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; 
   d="scan'208";a="222637625"
Received: from mail-pf1-f198.google.com ([209.85.210.198])
  by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jun 2021 11:45:51 -0700
Received: by mail-pf1-f198.google.com with SMTP id e19-20020aa78c530000b02902e9ca53899dso53273pfd.22
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 11:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LSLEA8uny0SvK6BuP9EUGLzKH3cmbfNsLY8/jivrk4k=;
        b=iOSak8zCvMgVtSdOIBgRpUaI1+GmIEUQ9Xrw9cPukK+kKG5fxmhDSRkN7dNZvj8h8z
         mP5gc68y0Od0Y6EwlDYH++95gkGn1ZDGXAN4H8GcautjMYo93zJLa9LVcZiz52MCfxvj
         iylu/iLBeYzIhNPDh80in2kE82IKAJOCHXuEm+wEYagApnnG+l6bv/ZTX71sKFiZAq2k
         rlc2AWPTUnUvJpI6b+EX2nyBc34TKyiahEEpicgbbqVvGQo7n5W3868zdfw7PMKad+VV
         /oiewPlYDmMnv6n432rln21MabWfOzVS290wQsd0g3FEKmcnheWq3z9L7a+vP8UGFJ2e
         nCeg==
X-Gm-Message-State: AOAM533EUcBZpiu8TTq8qBjUPkhWkr0FKXzKI+KmPvU9iy3/WzBD9BGh
        VYaAqdlx4srWyJofY3zPSxB+SmRpTjbpDLbu3vHNeUXySk8eN+XYKM5/7L6bC/jgH9q8DQLS3zZ
        FlCkQhO5gYiSqCYx4cjsQaZ+Q5BLT8sBmCWfvfms0
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id p30-20020a056a000a1eb02902e289d85c87mr5849450pfh.73.1623782748928;
        Tue, 15 Jun 2021 11:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRMpzEEiW7csamoO9aph8EpArFwG28jZL6hWiXyGFAufQLqrWEPEkYySQa4vh+rPwD5JI28wk2KUtqd79gny0=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr5849431pfh.73.1623782748638; Tue, 15
 Jun 2021 11:45:48 -0700 (PDT)
MIME-Version: 1.0
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Tue, 15 Jun 2021 11:45:38 -0700
Message-ID: <CABvMjLRkmsrxXxHkX7PrkoRK5m=7_b3wpvyZK88V19b05CFx2w@mail.gmail.com>
Subject: [PATCH] media: atomisp: fix the uninitialized use
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        akari.ailus@linux.intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        juant.aldea@gmail.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..8ddddb18ffbb 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1534,12 +1534,15 @@ static int mt9m114_detect(struct
mt9m114_device *dev, struct i2c_client *client)
 {
        struct i2c_adapter *adapter = client->adapter;
        u32 retvalue;
+       int ret;

        if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
                dev_err(&client->dev, "%s: i2c error", __func__);
                return -ENODEV;
        }
-       mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
+       ret = mt9m114_read_reg(client, MISENSOR_16BIT,
(u32)MT9M114_PID, &retvalue);
+       if (ret)
+               return ret;
        dev->real_model_id = retvalue;

        if (retvalue != MT9M114_MOD_ID) {
-- 
2.17.1
