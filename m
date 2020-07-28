Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4836D23072B
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 12:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgG1KDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 06:03:11 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:38096 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbgG1KDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 06:03:10 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06S9vbJ9024190;
        Tue, 28 Jul 2020 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=rY2vB0P0/tyjyjLirqTSdg6vE+kWv7ysFIAp+6VnZjk=;
 b=ZllVecSYmeFo12UYNjUyMiX3cwsufWaPC1rydm5AJtCgWr6p5D/nL6U/1kvQdqYz1tK9
 BgfO4qc9t4zuRjR4xnW2uBx+mTPriBegnjnF0IK7yQPceai+3UN33QfSmHWInkbRFuYe
 G+UI1dvfPC8otgbnKalrbEFIlIXm9Hib8tuHwegHAGq3y8bMCn/iaEQYjgKPcbf701Ol
 cb4Z+8hDcz8QdK9xTAzrVSkTeTnF+42QG6WFxnl84NyAV9YkNR0YejqytxkBiRw/MpBs
 Y0+apsWepOc23H6zsTVv1TaY7gEwQEP1FCRNet4IVD9XrpGFN9ESzO5k3WEhi0++5ct1 ow== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 32hu1j6j8e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Jul 2020 10:02:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06SA2ZpS082878;
        Tue, 28 Jul 2020 10:02:51 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 32hu5skcft-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jul 2020 10:02:51 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06SA2kKG021605;
        Tue, 28 Jul 2020 10:02:46 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 28 Jul 2020 03:02:46 -0700
Date:   Tue, 28 Jul 2020 13:02:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200728100237.GG2571@kadam>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <20200727220456.GA328887@PWN>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727220456.GA328887@PWN>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9695 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9695 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280075
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 06:04:56PM -0400, Peilin Ye wrote:
> On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> > drivers/char/hpet.c:675 hpet_ioctl() warn: check that 'info' doesn't leak information (struct has a hole after 'hi_timer')
> 
> This one seems like a false positive.

Yep.

> 
> drivers/char/hpet.c:670:
> 
> 	mutex_lock(&hpet_mutex);
> 	err = hpet_ioctl_common(file->private_data, cmd, arg, &info);
> 	mutex_unlock(&hpet_mutex);
> 
> 	if ((cmd == HPET_INFO) && !err &&
> 	    (copy_to_user((void __user *)arg, &info, sizeof(info))))
> 		err = -EFAULT;

When Smatch parses hpet_ioctl_common() it says there are two success
paths:

drivers/char/hpet.c | hpet_ioctl_common | 170 |             0 |   PARAM_LIMIT |   1 |                    $ |                26625 |

The first success path is for when cmd is HPET_IE_ON.  We don't care
about that.

drivers/char/hpet.c | hpet_ioctl_common | 185 |             0 |   PARAM_LIMIT |   1 |                    $ | 26626,26628-26629,1074292742,2149083139 |

The second success path is for when cmd is HPET_IE_OFF, HPET_INFO,
HPET_EPI, HPET_DPI, or HPET_IRQFREQ.  If Smatch tracked the HPET_INFO
by itself then this wouldn't print a warning, but since Smatch groups
all those cmds together then it does print a warning.

It's not impossible to make Smatch split apart the success paths some
more but it's complicated because it means storing more data and slows
down the parsing.  The cross function database is already 27GB on my
system.

regards,
dan carpenter
