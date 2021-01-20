Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC992FD039
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389409AbhATMh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:37:28 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:43632 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732852AbhATLEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 06:04:48 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KB08Gs173750;
        Wed, 20 Jan 2021 11:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=RCZXz3lxpfje8zAZ8SuZmCLcRPRQtJ7xlQXuUNxcbzw=;
 b=hc/TKJxuehPsko9mvvlVKOpHUh94iIgnlfdue64qaGhlFP7aSU3PlQopLYGIL3wlZorI
 pSxAeAE42Dr/Cujrx+fY9igGcdQ6kfykszSKh1Xu2zsUZJqHIK9Mt6Hfu1UoKYm4kjRc
 zOrHJZ8z4eLw5qQVRNtc7tebzw4DefT3eVeM2jmW/U6OwoSneLuXFJCWxLBpq0zRP0Dm
 ccBR2mc+eZlJfdWcHQ70Ssox297CWzSnpaoBFU8m3gi13WLKfVUbSx0ub8n5ELW3+Xzz
 ktCbxm3KOcFuG9CG+0H7xQ84mw8405nqBWpXhECeiwnUYCMOK+vQts3SzL7vF/h2OiKe DA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 3668qa9x93-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jan 2021 11:04:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KB0gQp163074;
        Wed, 20 Jan 2021 11:02:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 3668qvydtt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jan 2021 11:02:04 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10KB23l4022045;
        Wed, 20 Jan 2021 11:02:03 GMT
Received: from mwanda (/10.175.34.136)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 20 Jan 2021 03:02:02 -0800
Date:   Wed, 20 Jan 2021 14:01:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     stanimir.varbanov@linaro.org
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: venus: Get codecs and capabilities from hfi
 platform
Message-ID: <YAgNpc/QTLnHqAW9@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200064
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Stanimir Varbanov,

The patch e29929266be1: "media: venus: Get codecs and capabilities
from hfi platform" from Aug 26, 2020, leads to the following static
checker warning:

drivers/media/platform/qcom/venus/hfi_parser.c:251 hfi_platform_parser() error: uninitialized symbol 'count'.
drivers/media/platform/qcom/venus/hfi_parser.c:254 hfi_platform_parser() error: uninitialized symbol 'enc_codecs'.
drivers/media/platform/qcom/venus/hfi_parser.c:255 hfi_platform_parser() error: uninitialized symbol 'dec_codecs'.

drivers/media/platform/qcom/venus/hfi_parser.c
   231  static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
   232  {
   233          const struct hfi_platform *plat;
   234          const struct hfi_plat_caps *caps = NULL;
   235          u32 enc_codecs, dec_codecs, count;
   236          unsigned int entries;
   237  
   238          if (inst)
   239                  return 0;
   240  
   241          plat = hfi_platform_get(core->res->hfi_version);
   242          if (!plat)
   243                  return -EINVAL;
   244  
   245          if (plat->codecs)
   246                  plat->codecs(&enc_codecs, &dec_codecs, &count);
   247  
   248          if (plat->capabilities)
   249                  caps = plat->capabilities(&entries);

These aren't initialized on the else path.

   250  
   251          if (!caps || !entries || !count)
   252                  return -EINVAL;
   253  
   254          core->enc_codecs = enc_codecs;
   255          core->dec_codecs = dec_codecs;
   256          core->codecs_count = count;
   257          core->max_sessions_supported = MAX_SESSIONS;
   258          memset(core->caps, 0, sizeof(*caps) * MAX_CODEC_NUM);
   259          memcpy(core->caps, caps, sizeof(*caps) * entries);
   260  
   261          return 0;
   262  }

regards,
dan carpenter
