Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447DB2EAF9F
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 17:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbhAEQHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 11:07:46 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:51480 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbhAEQHp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 11:07:45 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtMe7137932;
        Tue, 5 Jan 2021 16:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=27lyL6V97rY2W/IgCdTTMc5DSG0km/flclLx6kdUVyU=;
 b=hLC3hRLS1FA0qEoLdU5KJx4WJG2F/FiownHEiLnIG4ngzGuU4v8Z19SN8HCaCvjvzYHk
 shD+/5zbExURIS4GvrL8/CgqRDFy+MtpCzK0L8O8KXqIelVGX0NrIJu6sUzvNm4FYLge
 efVb/ttXmOlZloCjEVM70EB/DUfMDcGW03TtX2sgkOgCSXjygX2Mp/uzuIJKzOZ/kppV
 14h12Y0v8RBwGe8QnbXuECj4b5KsfTRNTY+ndXzCmtrIzHmn6XQjiVQmi1Gbee2/ltED
 NbN4zud+XyLUBVFgMUT/GybDnIsKLBZy9patWFILN8MsxlPqR7wPFFCfMq2yTpxlq+nt tQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 35tg8r1gnc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 05 Jan 2021 16:06:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuQ9w026613;
        Tue, 5 Jan 2021 16:04:58 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 35v4rbj7g8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Jan 2021 16:04:58 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G4uYO015851;
        Tue, 5 Jan 2021 16:04:56 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 05 Jan 2021 16:04:56 +0000
Date:   Tue, 5 Jan 2021 19:04:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        royale@zerezo.com, USB <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
Subject: Re: [RFT][PATCH v1] media: zr364xx: Fix memory leak in ->probe()
Message-ID: <20210105160448.GY2831@kadam>
References: <20201230211918.63508-1-andriy.shevchenko@linux.intel.com>
 <20210105140045.GF2809@kadam>
 <20210105143741.GK4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105143741.GK4077@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=896 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=903
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 05, 2021 at 04:37:41PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 05, 2021 at 05:00:45PM +0300, Dan Carpenter wrote:
> > On Wed, Dec 30, 2020 at 11:19:18PM +0200, Andy Shevchenko wrote:
> > > When ->probe() fails in some cases it may not free resources.
> > > Replace few separated calls by v4l2_device_put() to clean up
> > > everything.
> > > 
> > 
> > The clean up everything style of error handling is always buggy.
> > 
> > For example, in this case, all the early error paths will now crash
> > instead of leaking.  The __videobuf_free() function will Oops when it
> > dereferences "q->int_ops->magic".
> > 
> > 	MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
> > 
> > The "q->int_ops" pointer is set in videobuf_queue_vmalloc_init().  There
> > are probably other bugs as well.  It's almost impossible to audit this
> > style of error handling either for completeness or for crashyness.
> 
> Feel free to submit better fix, thanks!

Sure.  I'm too tired to think straight today.

I see now that syzbot actually discovered the Oops in __videobuf_free()
as well...  I'm sort of surprised that the original code never called
zr364xx_release().  We might have another reference leak somewhere...

regards,
dan carpenter


