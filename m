Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD722EAC8C
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 15:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbhAEOBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 09:01:41 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:46474 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728295AbhAEOBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 09:01:41 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105Dt2Sq064042;
        Tue, 5 Jan 2021 14:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ZKp707Mb4q3WyJ6+RAT7x+VqU/J+EMvbOOiJIw9rsmM=;
 b=wh+m9BfWWY4kEe2NrCkVScSUg87hfsBY0+OHgFqCoBv671Z22Et35NFQ2Z0CVruuB+B5
 rxhRZdBhi9cWU124Yeo4qdHr3gkVc1Yrv1FS0lLfB5dZ/Vn4sQQEnfSpS5M/4b09hmRP
 EeO0WUQAooRyztxT1vbmKGvZzPLXl/Knr+FwP8fpJt48P9DUgwNu2kLSjrcvijdtfcrf
 h3wYdwXpiXg1DSC7xBRtMzFh88lYpScTOsy/Qzl1vLs3Jb4fTM05MgxSoGPkxD/q2ydo
 BdvRlA85SQmkG3eF7dqNVnDFTDeMxRWVhCmzv1tOt5J8aQXkrhhR+dUuK8sFiwARE8iq EQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 35tebary6y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 05 Jan 2021 14:00:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105DuPDp164451;
        Tue, 5 Jan 2021 14:00:54 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 35v4rbdrk3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Jan 2021 14:00:54 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105E0rtb007992;
        Tue, 5 Jan 2021 14:00:53 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 05 Jan 2021 06:00:52 -0800
Date:   Tue, 5 Jan 2021 17:00:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        royale@zerezo.com, USB <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
Subject: Re: [RFT][PATCH v1] media: zr364xx: Fix memory leak in ->probe()
Message-ID: <20210105140045.GF2809@kadam>
References: <20201230211918.63508-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230211918.63508-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=764 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=773 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050088
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 30, 2020 at 11:19:18PM +0200, Andy Shevchenko wrote:
> When ->probe() fails in some cases it may not free resources.
> Replace few separated calls by v4l2_device_put() to clean up
> everything.
> 

The clean up everything style of error handling is always buggy.

For example, in this case, all the early error paths will now crash
instead of leaking.  The __videobuf_free() function will Oops when it
dereferences "q->int_ops->magic".

	MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);

The "q->int_ops" pointer is set in videobuf_queue_vmalloc_init().  There
are probably other bugs as well.  It's almost impossible to audit this
style of error handling either for completeness or for crashyness.

regards,
dan carpenter

