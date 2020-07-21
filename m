Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06942227DA6
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 12:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729349AbgGUKwA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 06:52:00 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:56062 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729312AbgGUKv7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 06:51:59 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06LAcjeq128470;
        Tue, 21 Jul 2020 10:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=PvyKfoECg1Rab+GAU63ZCDHWNoKItHwcDywMEowL0/0=;
 b=arNhpI5yyyDf49hCGFPElJ5vRRE0/vpywHNqFvNnPpbIm7+10SMWlJhm8b5eJv3/r1kY
 u4QsCdbnTM6vpEiaMdkfALoYvZ69OSft93BcfpnLwTvth7LfIgXlD1yif8pWGxfJOlu2
 uCwAxZ4+6fdlO3upuD+52heuJl3kWGRheAkbjjP+pBUDDzqoZ0nSvjGDcz+oaekWBJo4
 nrq8Wtx7en2hNKYwoHAld/LB3Q++tVMNTXdiBFm71igi0YopaP3VGmr8kFpZBC5940cC
 bKzTXMgYnbZFmIkJ2y4rsJcSOoTI08tmI9cFchSzlHpmTBL21TA7DxrGW3cKImDj6gUw ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 32brgrcgwb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jul 2020 10:51:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06LAbxrE151527;
        Tue, 21 Jul 2020 10:49:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 32dw48mbs4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jul 2020 10:49:55 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06LAnsJb017121;
        Tue, 21 Jul 2020 10:49:54 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 21 Jul 2020 10:49:54 +0000
Date:   Tue, 21 Jul 2020 13:49:46 +0300
From:   <dan.carpenter@oracle.com>
To:     <mchehab+huawei@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [bug report] media: atomisp: place all gpio parsing together
Message-ID: <20200721104946.GA149039@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=3 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=3 adultscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210075
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro Carvalho Chehab,

This is a semi-automatic email about new static checker warnings.

The patch 79317baaaea2: "media: atomisp: place all gpio parsing 
together" from Jun 21, 2020, leads to the following Smatch complaint:

    drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:830 gmin_v1p8_ctrl()
    warn: variable dereferenced before check 'gs' (see line 820)

drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
   814  static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
   815  {
   816          struct gmin_subdev *gs = find_gmin_subdev(subdev);
   817          int ret;
   818          int value;
   819	
   820		if (gs->v1p8_gpio >= 0) {
                    ^^
New dereference.

   821			pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
   822				gs->v1p8_gpio);
   823			ret = gpio_request(gs->v1p8_gpio, "camera_v1p8_en");
   824			if (!ret)
   825				ret = gpio_direction_output(gs->v1p8_gpio, 0);
   826			if (ret)
   827				pr_err("V1P8 GPIO initialization failed\n");
   828		}
   829	
   830		if (!gs || gs->v1p8_on == on)
                     ^^
Too late.

   831			return 0;
   832		gs->v1p8_on = on;
   833  
   834          if (gs->v1p8_gpio >= 0)
   835                  gpio_set_value(gs->v1p8_gpio, on);

Could we combine this with the first "if (gs->v1p8_gpio >= 0) {"
condition?  This code is looking pretty subtle so maybe not.

   836  
   837          if (gs->v1p8_reg) {
   838                  regulator_set_voltage(gs->v1p8_reg, 1800000, 1800000);
   839                  if (on)
   840                          return regulator_enable(gs->v1p8_reg);
   841                  else
   842                          return regulator_disable(gs->v1p8_reg);
   843          }
   844  

regards,
dan carpenter
