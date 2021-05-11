Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063BD37A0C1
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 09:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhEKHXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 03:23:39 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:53000 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhEKHXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 03:23:36 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B7KC7j165568;
        Tue, 11 May 2021 07:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=LIqIlTYR8W6LmxNRlfRBjYRVMwL26zOpcyZEqTLcG3k=;
 b=QMpO3kGAQFAcZyRBMYZiaJYMQIyc+PB8a9Kc0GQHLnff3o/owJbtaJNfaV1P7G670Jc7
 XXnQMXsljf94jK4b19UVkNQM7KYxhimfrs70sedenN7ZJMy8FPpiZXXD9UuE8GPi0ep/
 A80ZLGyH8MgvRtH2a5dKu5AeEzMoxyTotqsTWQ1eSmdonKjVlqx00lMJdiELuUIn1rDv
 EVZWqP4OoNeNL1NmXuCHlqS3dlZMpzFkxQ1Ti+7CzGVpVtfEs6CnySItoJolm/30Ll0q
 d22/zxmc6uAjOJt9si71+rS7/vIC3P20Wj64asftchdJUEPjVpF9kl0lHpTFC4wmEU7a TQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 38e285cwr5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:22:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B7K0CP077626;
        Tue, 11 May 2021 07:22:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 38fh3w96wb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:22:26 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14B7Kv8h081385;
        Tue, 11 May 2021 07:22:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 38fh3w96w5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:22:26 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14B7MPNq026849;
        Tue, 11 May 2021 07:22:25 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 May 2021 00:22:24 -0700
Date:   Tue, 11 May 2021 10:22:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Malcolm Priestley <tvboxspy@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: lmedm04: delete lme2510_get_adapter_count()
Message-ID: <YJowq0hJZ6cFDX/6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: zzJUf4pMPLC7VRtiREv6Ypfx-s_5r19i
X-Proofpoint-ORIG-GUID: zzJUf4pMPLC7VRtiREv6Ypfx-s_5r19i
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110055
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The adapter count is fixed at compile time so we can delete the
lme2510_get_adapter_count() function and set ".num_adapters = 1"
instead.  There is also no need to create a zeroed adapter
element at the end of the array.  Remove that as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From code review.  Not tested.

 drivers/media/usb/dvb-usb-v2/lmedm04.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 1b6d4e4c52ca..fe4d886442a4 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -1122,11 +1122,6 @@ static int lme2510_powerup(struct dvb_usb_device *d, int onoff)
 	return ret;
 }
 
-static int lme2510_get_adapter_count(struct dvb_usb_device *d)
-{
-	return 1;
-}
-
 static int lme2510_identify_state(struct dvb_usb_device *d, const char **name)
 {
 	struct lme2510_state *st = d->priv;
@@ -1211,12 +1206,12 @@ static struct dvb_usb_device_properties lme2510_props = {
 	.frontend_attach  = dm04_lme2510_frontend_attach,
 	.tuner_attach = dm04_lme2510_tuner,
 	.get_stream_config = lme2510_get_stream_config,
-	.get_adapter_count = lme2510_get_adapter_count,
 	.streaming_ctrl   = lme2510_streaming_ctrl,
 
 	.get_rc_config = lme2510_get_rc_config,
 
 	.exit = lme2510_exit,
+	.num_adapters = 1,
 	.adapter = {
 		{
 			.caps = DVB_USB_ADAP_HAS_PID_FILTER|
@@ -1227,8 +1222,6 @@ static struct dvb_usb_device_properties lme2510_props = {
 			.stream =
 			DVB_USB_STREAM_BULK(0x86, 10, 4096),
 		},
-		{
-		}
 	},
 };
 
-- 
2.30.2

