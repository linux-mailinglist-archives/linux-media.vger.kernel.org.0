Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF00148695
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 15:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390024AbgAXOLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 09:11:35 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54850 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389118AbgAXOLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 09:11:35 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OE8RCK065931;
        Fri, 24 Jan 2020 14:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=VfNjqg7FejUrmLZJcuFSOF82y9tdMchXxATYFjEy1q4=;
 b=OUxPmpHW4++e/oZ8ICTiksfYm56LaT6jP9XajNEy3rgWIjLtwVyfBFVnCDm3fVSA6sTR
 tbhAa1L2H1vKy1rlDiBoFhK8CYJElQQA/mCKjrHTYCrZjJR+GMeBfeZPQL/0ktFYtwid
 MSBJLObZITMGk61zg5DSXzW0ixfjjBsBxYrPpS9x2kXii+kyD2VuzKT3e65QvmhL6PuC
 A3bKJNbmqZgWM0aefaE6RuXj9qXF1xyVBbYg/S6tVcGQB0rzJlKR5HUbNcF8W5eVc6ZL
 Zc6L7HyEXlZzF+ZT0TXBuN7x6V3bNYzh4BV2RrDSqlgzTz/6A37GFUqYnfd9t8QzWbQN lg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2xksev1ady-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 14:11:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OE9ACV011506;
        Fri, 24 Jan 2020 14:11:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2xqmwfbgrs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 14:11:11 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00OEB72Z000365;
        Fri, 24 Jan 2020 14:11:08 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 24 Jan 2020 06:11:07 -0800
Date:   Fri, 24 Jan 2020 17:10:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        andreyknvl@google.com, bnvandana@gmail.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in v4l2_release (3)
Message-ID: <20200124141058.GM1847@kadam>
References: <000000000000de50d7059ba6acd5@google.com>
 <20200123102707.2596-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123102707.2596-1-hdanton@sina.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=609
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001240118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=687 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001240118
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This would work but another approach would be to to allocate "usbvision"
with devm_kzalloc(&dev->dev,...  I believe that would postpone the free
enough to solve the use after free but I hadn't tested it yet.  But
other drivers do that so hopefully it works.

regards,
dan carpenter
