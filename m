Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D816C37BF30
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 16:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhELOEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 10:04:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3730 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230211AbhELOEp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 10:04:45 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14CDphZ0010801;
        Wed, 12 May 2021 14:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=V+hE2ghJIzR7WK80U/S5ajeHoA9mgVnom0IfGthfcp0=;
 b=tpLsXOc24SmnYXMKlHelJK/1b9mbVL9DCDloLdip1ALLDJMTSE1qTT1Uxmszmnu8xQ2Y
 zLpGBEpfvViyF6DGaUCLqp52ZNpsUOiEIIuSQWCaW52sTNOsfh1fA8sfEpE0sFDS2vuM
 PhJxXWW7+4CHT9fCTBw6D1xt2RNwn6DVid3hFX7z8KlYQYy4hOghyGEEvXolOVDNor9I
 xHtRpOOvtx83Zw6bKhHl3YV2gN6M8w97aJbvvISe2lnd7jZ6hDY28EVbV4eOvPcCXW7T
 UqPUfmA3Hzpd7QZKfsOCTPhXXnl9Bu/UGRiQvSFL7Iqi0kdILgHRoJDnwrLEY/InH0PT Wg== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 38eyurrsdg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 14:03:35 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14CE3ZYi086243;
        Wed, 12 May 2021 14:03:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38e5pyxrxk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 14:03:35 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14CE3Yhg086231;
        Wed, 12 May 2021 14:03:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 38e5pyxrx9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 14:03:34 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14CE3XqU031598;
        Wed, 12 May 2021 14:03:33 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 12 May 2021 07:03:33 -0700
Date:   Wed, 12 May 2021 17:03:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     baijiaju1990@gmail.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: tuners: fix error return code of
 hybrid_tuner_request_state()
Message-ID: <YJvgLgZAEo5NtM2x@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: NM0TwrvEgO2Mz-8sGyfdCNGb5UHwdXfp
X-Proofpoint-ORIG-GUID: NM0TwrvEgO2Mz-8sGyfdCNGb5UHwdXfp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jia-Ju Bai,

The patch b9302fa7ed97: "media: tuners: fix error return code of
hybrid_tuner_request_state()" from Mar 6, 2021, leads to the
following static checker warnings:

drivers/media/tuners/tuner-simple.c:1112 simple_tuner_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
drivers/media/tuners/mxl5007t.c:885 mxl5007t_attach() error: potential null dereference 'state'.  (<unknown> returns null)
drivers/media/tuners/tda18271-fe.c:1311 tda18271_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
drivers/media/tuners/xc4000.c:1685 xc4000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
drivers/media/tuners/xc4000.c:1699 xc4000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
drivers/media/tuners/xc5000.c:1397 xc5000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
drivers/media/tuners/r820t.c:2350 r820t_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
drivers/media/tuners/tuner-xc2028.c:1500 xc2028_attach() error: potential null dereference 'priv'.  (<unknown> returns null)

drivers/media/tuners/tuner-i2c.h
   109  /* The return value of hybrid_tuner_request_state indicates the number of
   110   * instances using this tuner object.
   111   *
   112   * 0 - no instances, indicates an error - kzalloc must have failed

The comment says that hybrid_tuner_request_state() returns an error.

   113   *
   114   * 1 - one instance, indicates that the tuner object was created successfully
   115   *
   116   * 2 (or more) instances, indicates that an existing tuner object was found
   117   */
   118  
   119  #define hybrid_tuner_request_state(type, state, list, i2cadap, i2caddr, devname)\
   120  ({                                                                      \
   121          int __ret = 0;                                                  \
   122          list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
   123                  if (((i2cadap) && (state->i2c_props.adap)) &&           \
   124                      ((i2c_adapter_id(state->i2c_props.adap) ==          \
   125                        i2c_adapter_id(i2cadap)) &&                       \
   126                       (i2caddr == state->i2c_props.addr))) {             \
   127                          __tuner_info(state->i2c_props,                  \
   128                                       "attaching existing instance\n");  \
   129                          state->i2c_props.count++;                       \
   130                          __ret = state->i2c_props.count;                 \
   131                          break;                                          \
   132                  }                                                       \
   133          }                                                               \
   134          if (0 == __ret) {                                               \
   135                  state = kzalloc(sizeof(type), GFP_KERNEL);              \
   136                  if (!state) {                                           \
   137                          __ret = -ENOMEM;                                \
   138                          goto __fail;                                    \

But the patch changes the code to return -ENOMEM on error.  The callers
need to be updated or it intruces a bunch of potential NULL
dereferences.

   139                  }                                                       \
   140                  state->i2c_props.addr = i2caddr;                        \
   141                  state->i2c_props.adap = i2cadap;                        \
   142                  state->i2c_props.name = devname;                        \
   143                  __tuner_info(state->i2c_props,                          \
   144                               "creating new instance\n");                \
   145                  list_add_tail(&state->hybrid_tuner_instance_list, &list);\
   146                  state->i2c_props.count++;                               \
   147                  __ret = state->i2c_props.count;                         \
   148          }                                                               \
   149  __fail:                                                                 \
   150          __ret;                                                          \
   151  })

regards,
dan carpenter
