Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BBC3878C5
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 14:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244399AbhERMc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 08:32:58 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:45920 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243225AbhERMc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 08:32:58 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14ICOjpB164422;
        Tue, 18 May 2021 12:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=18S5hPX3Rys9CMZRJDd44G4yZ/6Awq7sc7aquF2b+po=;
 b=HlEasV+aeuV1waOs4k1WpHW0nzEORHWI1rydhTZ5dNQ5LcEKOaFznYnPznwbA9d054yf
 3vFan9LDwhQ8w+6VPsZJI4VVGXucQ8M5SWxfynbx6YVgswTTeqO+ludpL7xKb3nfotWs
 6wjqw+1sVvEbri+4Xnn4rbfFbk/PECa9UvofCZGtFFfHRGCONdpjZPB10/czpQsi1QSm
 M7nBAf0yyPRon5BZaX+KpJzvKIke8/QnUsOxP9ziVzej8Ppk0Ct33BrIKXnb3SwLiLXC
 U5Jqw09zwQe4m8ihwWznLz1ebvkOw+ZXUmxj4kykfer7fJ1pHRZDiWvbvOulf03xGS+t AQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 38j68me6ra-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 May 2021 12:31:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14ICQEmP182664;
        Tue, 18 May 2021 12:31:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38j4bc2kms-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 May 2021 12:31:37 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14ICVaeG196135;
        Tue, 18 May 2021 12:31:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 38j4bc2kmg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 May 2021 12:31:36 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14ICVZqB024483;
        Tue, 18 May 2021 12:31:35 GMT
Received: from mwanda (/10.175.177.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 18 May 2021 05:31:34 -0700
Date:   Tue, 18 May 2021 15:31:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     satendra.t@samsung.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: videobuf2: Add new uAPI for DVB streaming I/O
Message-ID: <YKOzoeC6Bp+C3QxS@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: mISR8PB72K8DhJYJ9vhFwG8z3NSoOZZK
X-Proofpoint-GUID: mISR8PB72K8DhJYJ9vhFwG8z3NSoOZZK
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9987 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=917
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180088
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Satendra Singh Thakur,

The patch 57868acc369a: "media: videobuf2: Add new uAPI for DVB
streaming I/O" from Dec 18, 2017, leads to the following static
checker warnings:

  drivers/media/common/videobuf2/videobuf2-core.c:645 vb2_core_querybuf()
  error: buffer overflow 'q->bufs' 32 <= u32max user_rl='0-u32max' uncapped

  drivers/media/common/videobuf2/videobuf2-core.c:1583 vb2_core_qbuf()
  error: buffer overflow 'q->bufs' 32 <= u32max user_rl='0-u32max' uncapped

drivers/media/common/videobuf2/videobuf2-core.c
   643  void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb)
   644  {
   645          call_void_bufop(q, fill_user_buffer, q->bufs[index], pb);
                                                             ^^^^^
index has not been checked at all.

   646  }
   647  EXPORT_SYMBOL_GPL(vb2_core_querybuf);

I've been re-working how Smatch parses v4l input validation.  Mostly
my approach has been to say that if a function is called from the
v4l2_subdev_call() then it has been validated.  But there a couple
warnings which remain.

In thise case vb2_core_querybuf() is called from two functions.
The vb2_querybuf() function does input validation but the
dvb_vb2_querybuf() function does not.  The callers are
dvb_demux_do_ioctl() and dvb_dvr_do_ioctl() so "index" comes from the
user via the ioctl.

Please let me know if I have misread the code so I can silence this
warning in Smatch.

regards,
dan carpenter
