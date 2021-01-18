Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E922F9F67
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 13:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391417AbhARMVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 07:21:39 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54364 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404011AbhARMVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 07:21:11 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10ICF5WX167030;
        Mon, 18 Jan 2021 12:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=I/Gkifl18XJioa2EZqEq8waf3qGoKiu8TDdISQu8GPM=;
 b=IiGuKj62Yfo/6y/lGbFftTw32iN3P42wvyCLA7IZECOrgWC/XPwi6/81drDhyRXmgkPn
 ICg0p9NAY5D8XqIa+WLgU4NTx+F0NUZV9/c4Ifv8vU9XQfyb24T1o95NzKDCJxmdnVK7
 P5zjInqMS+8OeUsLOGWCjbijHDrfnVSo7t//2TJh+xbvZPHIQ2t8SkazsNUM4VHjs1bQ
 nFq7ZN1EnSTNUmeobXV5vP8MO3J6kl+ufYcaCIrd1NKW+cnaahbUFrJt0nV3+amORDaY
 Uf3B8y6ieebxUyAxldKflksQlpkPGaRIkonh9xku5/oqZQadRI3uSFiB7ZFTbcjq+LNo SQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 363nnad27a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jan 2021 12:20:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IC9vT7035510;
        Mon, 18 Jan 2021 12:20:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 364a1wch1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jan 2021 12:20:23 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10ICKL4w013785;
        Mon, 18 Jan 2021 12:20:21 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 18 Jan 2021 04:20:21 -0800
Date:   Mon, 18 Jan 2021 15:20:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Antoine Jacquet <royale@zerezo.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: zr364xx: fix memory leaks in probe()
Message-ID: <20210118122011.GA2696@kadam>
References: <X/WMfVDCsxRghKHH@mwanda>
 <196887f5-677f-0aeb-5f5c-fb4a918d6128@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <196887f5-677f-0aeb-5f5c-fb4a918d6128@xs4all.nl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180074
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 05:13:41PM +0100, Hans Verkuil wrote:
> Hi Dan,
> 
> On 06/01/2021 11:10, Dan Carpenter wrote:
> > Syzbot discovered that the probe error handling doesn't clean up the
> > resources allocated in zr364xx_board_init().  There are several
> > related bugs in this code so I have re-written the error handling.
> > 
> > 1)  Introduce a new function zr364xx_board_uninit() which cleans up
> >     the resources in zr364xx_board_init().
> > 2)  In zr364xx_board_init() if the call to zr364xx_start_readpipe()
> >     fails then release the "cam->buffer.frame[i].lpvbits" memory
> >     before returning.  This way every function either allocates
> >     everything successfully or it cleans up after itself.
> > 3)  Re-write the probe function so that each failure path goto frees
> >     the most recent allocation.  That way we don't free anything
> >     before it has been allocated and we can also verify that
> >     everything is freed.
> > 4)  Originally, in the probe function the "cam->v4l2_dev.release"
> >     pointer was set to "zr364xx_release" near the start but I moved
> >     that assignment to the end, after everything had succeeded.  The
> >     release function was never actually called during the probe cleanup
> >     process, but with this change I wanted to make it clear that we
> >     don't want to call zr364xx_release() until everything is
> >     allocated successfully.
> > 
> > Next I re-wrote the zr364xx_release() function.  Ideally this would
> > have been a simple matter of copy and pasting the cleanup code from
> > probe and adding an additional call to video_unregister_device().  But
> > there are several quirks to note.
> > 
> > 1)  The original code never called video_unregister_device().  In other
> >     words, this is an additional bugfix.
> 
> Not a bug, see below.
> 

Thanks for reviewing this.  I will fix a send a v2.  I should have seen
that.

The layering here is sort of confusing in a way...  But not anything
that needs to be dealt with immediately.

regards,
dan carpenter

