Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7604BDF10
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 15:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406574AbfIYNeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 09:34:31 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44534 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405963AbfIYNeb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 09:34:31 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PDTU70024328;
        Wed, 25 Sep 2019 13:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=EFK2VXZ8lXBjudoEfwapb6uebOnMfQBT4mdp9EWkAvg=;
 b=kb1ZRv5kRLvqHn6HtEc0SjkVJvBB7Lgyso5aCDNAYZWexu7bvD/GzCVtXBi8oTYJ6QWg
 r0Xr7dvqA5WAoWKykwZl7zZxPcQwGucQd8qnwk6bb4TmtVZ14LDePcxrOn+kluEu5ioR
 vq2tUCp8W6cPY8VOuRtyjFr5sWDKV+MbGnW9R8V717KpXYhWLRFvmXzCQup3YdjBCy5j
 8xMP+PEuiRwT+OmZsRbhTQBJ902XIqd2isyNgRZWT9/vDmQVgneVCBB0aUp31tZoHPWZ
 cdCn+1mAr1/DvXzCjjmqjRtLQlE4udHSQJKWYlG/Kmj0TAR8Ad26dbj0arFnu/2LX2Dj lA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2v5b9tvqer-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Sep 2019 13:34:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PDO02r034924;
        Wed, 25 Sep 2019 13:34:23 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2v82q9k1us-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Sep 2019 13:34:23 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8PDYL55013028;
        Wed, 25 Sep 2019 13:34:22 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 25 Sep 2019 06:34:21 -0700
Date:   Wed, 25 Sep 2019 16:34:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     yanguoxiong@huawei.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] [media] rc: Introduce hix5hd2 IR transmitter driver
Message-ID: <20190925133415.GA15578@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=727
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909250137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=800 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909250138
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[ Ancient code, but maybe someone knows the answer.  - dan ]

Hello Guoxiong Yan,

The patch a84fcdaa9058: "[media] rc: Introduce hix5hd2 IR transmitter
driver" from Aug 30, 2014, leads to the following static checker
warning:

	./drivers/media/rc/ir-hix5hd2.c:112 (null)()
	warn: odd binop '0x3e80 & 0xffffffffffff0000'

drivers/media/rc/ir-hix5hd2.c
    95  static int hix5hd2_ir_config(struct hix5hd2_ir_priv *priv)
    96  {
    97          int timeout = 10000;
    98          u32 val, rate;
    99  
   100          writel_relaxed(0x01, priv->base + IR_ENABLE);
   101          while (readl_relaxed(priv->base + IR_BUSY)) {
   102                  if (timeout--) {
   103                          udelay(1);
   104                  } else {
   105                          dev_err(priv->dev, "IR_BUSY timeout\n");
   106                          return -ETIMEDOUT;
   107                  }
   108          }
   109  
   110          /* Now only support raw mode, with symbol start from low to high */
   111          rate = DIV_ROUND_CLOSEST(priv->rate, 1000000);
   112          val = IR_CFG_SYMBOL_MAXWIDTH & IR_CFG_WIDTH_MASK << IR_CFG_WIDTH_SHIFT;
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is zero because << has higher precedence than &.  But maybe what
was intended was:

		val = (IR_CFG_SYMBOL_MAXWIDTH & IR_CFG_WIDTH_MASK) << IR_CFG_WIDTH_SHIFT;

   113          val |= IR_CFG_SYMBOL_FMT & IR_CFG_FORMAT_MASK << IR_CFG_FORMAT_SHIFT;
                       ^^^^^^^^^^^^^^^^^
This is zero anyway, so it doesn't matter but maybe there is a precedence
bug here as well.

   114          val |= (IR_CFG_INT_THRESHOLD - 1) & IR_CFG_INT_LEVEL_MASK
   115                 << IR_CFG_INT_LEVEL_SHIFT;
                       ^^^^^^^^^^^^^^^^^^^^^^^^^
Same

   116          val |= IR_CFG_MODE_RAW;
   117          val |= (rate - 1) & IR_CFG_FREQ_MASK << IR_CFG_FREQ_SHIFT;
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Same

   118          writel_relaxed(val, priv->base + IR_CONFIG);
   119  
   120          writel_relaxed(0x00, priv->base + IR_INTM);
   121          /* write arbitrary value to start  */
   122          writel_relaxed(0x01, priv->base + IR_START);
   123          return 0;
   124  }

regards,
dan carpenter
