Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B300A7D3C
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 10:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbfIDIAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 04:00:21 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:48426 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbfIDIAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 04:00:21 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x847xL8U021167;
        Wed, 4 Sep 2019 08:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=MhLUSN2py/viV9rmUUtYwamBD4VHv59f0fHU55Y+1Ak=;
 b=a4Dco/TP3QA+Dax/2gFQSsYb3fT6cHCLeFZzj5Vxh3Xa/tfLD831dQBEi3R0jA6D4szP
 9r3iG4ZB0b1TUj7xvxO3yj/cQGqvwxSWkrmeScQfcdEq6eIiDDYalrgeleKerElQ9GF2
 xFuZLkIoK1LpTth8fJRYRlZnWoChd2k9IO9L2PIRy0C9xezYW5r8muOqDatMHj3yEfAh
 UkOAF2kN3j/adpa9OQkmtfao2j+lNOuho5VtcILCukUEMwPiH4kiAssxVR3E/IA9jsA6
 rJ7L9QL8as6dKmRW1G+AKByUVp6J3m+Z3954G22PDwbHE5R7fRt4r1uGoqTVbT/VER0g XA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2ut95s0265-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 08:00:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x847vxep173081;
        Wed, 4 Sep 2019 08:00:19 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2ut1hn316d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 08:00:18 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8480HMr000886;
        Wed, 4 Sep 2019 08:00:17 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Sep 2019 01:00:17 -0700
Date:   Wed, 4 Sep 2019 11:00:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: videobuf: fix epoll() by calling poll_wait first
Message-ID: <20190904080011.GA22685@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040082
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans Verkuil,

The patch bb436cbeb918: "media: videobuf: fix epoll() by calling
poll_wait first" from Feb 7, 2019, leads to the following static
checker warning:

	drivers/media/v4l2-core/videobuf-core.c:1126 videobuf_poll_stream()
	warn: passing bogus address: '&buf->done'

drivers/media/v4l2-core/videobuf-core.c
  1118  __poll_t videobuf_poll_stream(struct file *file,
  1119                                struct videobuf_queue *q,
  1120                                poll_table *wait)
  1121  {
  1122          __poll_t req_events = poll_requested_events(wait);
  1123          struct videobuf_buffer *buf = NULL;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  1124          __poll_t rc = 0;
  1125  
  1126          poll_wait(file, &buf->done, wait);
                                ^^^^^^^^^^
This will totally crash, because &buf->done is (void *)72 so it's
non-NULL.  It's weird that this code was merged in Feb and no one has
complained about it...

  1127          videobuf_queue_lock(q);
  1128          if (q->streaming) {
  1129                  if (!list_empty(&q->stream))
  1130                          buf = list_entry(q->stream.next,
  1131                                           struct videobuf_buffer, stream);
  1132          } else if (req_events & (EPOLLIN | EPOLLRDNORM)) {
  1133                  if (!q->reading)
  1134                          __videobuf_read_start(q);
  1135                  if (!q->reading) {
  1136                          rc = EPOLLERR;
  1137                  } else if (NULL == q->read_buf) {
  1138                          q->read_buf = list_entry(q->stream.next,

regards,
dan carpenter
