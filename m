Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2906317298
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 09:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfEHHau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 03:30:50 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:41974 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfEHHat (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 May 2019 03:30:49 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x487OJSt041397;
        Wed, 8 May 2019 07:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=Bgkclh8iOJCtRRiypEzU8b3p/0kkzvtrlMePeAQt2ac=;
 b=EUtgdwCCgyOTv7IJ9UZ1F15cS6zKyQiibW3LlAgEV5DR5TwplcVTh072fgk6Uu3MjWU6
 iofKL+fwLMZsWmED9SpQHo0GELug0pHCSLnJI5Ky0BhGkyLyzZU6Ge0rgPxZKG55n7hU
 bhgZR2ugHl2pQrfiD1dhZPl1rJ88ukL4mL9KjuwXafa6TBZ4zbRSnCIGNGndvuqNCcr8
 2zcDwTc8mjyvVqMBjx0padXrvOu76Cs/SZDg4L1vfCSquPOi4CZ9cgdZxnDS+KBe5DVv
 K1pXBHJNMI4PXWEkdHQP0qXspibk4MHhJoCbdinI+5nxhIWUFim2Nkb51shFw8TnBuf6 fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 2s94b620d1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 07:30:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x487TNea050610;
        Wed, 8 May 2019 07:30:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2s94afx8pq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 07:30:46 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x487Ujja012225;
        Wed, 8 May 2019 07:30:45 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 May 2019 00:30:45 -0700
Date:   Wed, 8 May 2019 10:30:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     narmstrong@baylibre.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: platform: meson: Add Amlogic Meson G12A AO CEC
 Controller driver
Message-ID: <20190508073039.GA12832@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=719
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905080048
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=743 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905080048
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Neil Armstrong,

The patch b7778c46683c: "media: platform: meson: Add Amlogic Meson
G12A AO CEC Controller driver" from Apr 12, 2019, leads to the
following static checker warning:

	drivers/media/platform/meson/ao-cec-g12a.c:377 meson_ao_cec_g12a_read()
	error: scheduling with locks held: 'spin_lock:cec_reg_lock'

drivers/media/platform/meson/ao-cec-g12a.c
   363  static int meson_ao_cec_g12a_read(void *context, unsigned int addr,
   364                                    unsigned int *data)
   365  {
   366          struct meson_ao_cec_g12a_device *ao_cec = context;
   367          u32 reg = FIELD_PREP(CECB_RW_ADDR, addr);
   368          unsigned long flags;
   369          int ret = 0;
   370  
   371          spin_lock_irqsave(&ao_cec->cec_reg_lock, flags);
                ^^^^^^^^^^^^^^^^^
Atomic context.

   372  
   373          ret = regmap_write(ao_cec->regmap, CECB_RW_REG, reg);
   374          if (ret)
   375                  goto read_out;
   376  
   377          ret = regmap_read_poll_timeout(ao_cec->regmap, CECB_RW_REG, reg,
   378                                         !(reg & CECB_RW_BUS_BUSY),
   379                                         5, 1000);
                                               ^
It sleeps for 5 usecs.

   380          if (ret)
   381                  goto read_out;
   382  
   383          ret = regmap_read(ao_cec->regmap, CECB_RW_REG, &reg);
   384  
   385          *data = FIELD_GET(CECB_RW_RD_DATA, reg);
   386  
   387  read_out:
   388          spin_unlock_irqrestore(&ao_cec->cec_reg_lock, flags);
   389  
   390          return ret;
   391  }

regards,
dan carpenter
