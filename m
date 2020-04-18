Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD661AF2BE
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 19:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgDRRQd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 13:16:33 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:38342 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgDRRQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 13:16:33 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03IHEGbe191811;
        Sat, 18 Apr 2020 17:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=rNlZleqQokYY+1b1DcnBDRXapCSYEgbi43sOBUR2GeY=;
 b=I95scAH54d/9+TSUdFvyLBtosuuoqSsxMk3mbEhvIsGHeTM5pMWdLMmu7AS/c6mahLrd
 Sap6XOlYL6s4ufmbOPkUxPkF7gK/McmNqFcFSaYBVQ+sfTbRKnL9SFPrBdA1H4ztlnW+
 EMZTvOrVvJcoGPpo5g3KE+g1ote+RfeUmypscateShLY4oVO5S8fgRz+uOhLxnJJnkmN
 Pysass/N4FUa/GZFJ98xA2mVTQI/aqJpTDvTKQQlABTAxYgc3Nx/fe1QzESIH2D8itQa
 G18JRFTlnrkzAqAsBlv53uw3sObtUvclHpQmETz4QJXTiykjN2sw3oZ1x+k9xbu2Wq01 mA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 30fxkjrrdv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 18 Apr 2020 17:16:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03IHDIGE067024;
        Sat, 18 Apr 2020 17:16:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 30frvm958k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 18 Apr 2020 17:16:30 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03IHGTu4007283;
        Sat, 18 Apr 2020 17:16:29 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 18 Apr 2020 10:16:29 -0700
Date:   Sat, 18 Apr 2020 20:16:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: cec-gpio: add HDMI CEC GPIO driver
Message-ID: <20200418171623.GA801737@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9595 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=3
 phishscore=0 mlxscore=0 mlxlogscore=744 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004180144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9595 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=3 mlxlogscore=818 impostorscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004180144
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans Verkuil,

The patch 1e33936d3bae: "media: cec-gpio: add HDMI CEC GPIO driver"
from Jun 28, 2017, leads to the following static checker warning:

	drivers/media/cec/platform/cec-gpio/cec-gpio.c:40 cec_gpio_read()
	warn: signedness bug returning '(-4095)'

drivers/media/cec/platform/cec-gpio/cec-gpio.c
    34  static bool cec_gpio_read(struct cec_adapter *adap)
    35  {
    36          struct cec_gpio *cec = cec_get_drvdata(adap);
    37  
    38          if (cec->cec_is_low)
    39                  return false;
    40          return gpiod_get_value(cec->cec_gpio);
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
negative error codes become "true".

    41  }

regards,
dan carpenter
