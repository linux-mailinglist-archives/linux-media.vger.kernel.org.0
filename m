Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705D32EC3EE
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 20:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbhAFTcZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 14:32:25 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:50926 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbhAFTcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 14:32:24 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106JSv4x096316;
        Wed, 6 Jan 2021 19:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=LKX+v411qJTSzQmb+cGxJEJkOBIOhcRhlSFMC+/Hg1k=;
 b=jqjUbeXc/xNjQSXYN3ogeUGIbB7rFX1hPcU2tEsbE49Cg6NdNxP6ALf1V+PKDwneEemk
 FdwOcfUmT1DBXWfn1vQ06W/DoKADh8Zm+ebH4P7mpHueLXkgwk4eAwMc0MrLNvTDL5zY
 cXcTRLlB1pwNrtk5VX9wPsKe7s9erfIa2LoQegRtuj9F25lU8U3LWizXdakIHmgM/kvm
 C0TDmZbCKMg018oUC08XjOoFtACknDu6BFSz8XlUxV2NAQ7Z8/3rFXE8YVLSJ0ufe9c8
 HN3tC/VVhYbH77LIsadSCJ7O+cEtRgxG2YMDK08i8dY67Dba1gO57/fQtekkmqjLABzb tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 35wepm9h4p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 06 Jan 2021 19:31:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106JUchj071415;
        Wed, 6 Jan 2021 19:31:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 35w3qsed49-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Jan 2021 19:31:29 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 106JVQCp018580;
        Wed, 6 Jan 2021 19:31:26 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 06 Jan 2021 11:31:25 -0800
Date:   Wed, 6 Jan 2021 22:31:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Antoine Jacquet <royale@zerezo.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: zr364xx: fix memory leaks in probe()
Message-ID: <20210106193116.GE2831@kadam>
References: <X/WMfVDCsxRghKHH@mwanda>
 <20210106164550.GB1012582@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106164550.GB1012582@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060109
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 11:45:50AM -0500, Alan Stern wrote:
> On Wed, Jan 06, 2021 at 01:10:05PM +0300, Dan Carpenter wrote:
> > Syzbot discovered that the probe error handling doesn't clean up the
> > resources allocated in zr364xx_board_init().  There are several
> > related bugs in this code so I have re-written the error handling.
> 
> Dan:
> 
> I recently sent in a patch for a similar problem in the gspca driver
> (commit e469d0b09a19 "media: gspca: Fix memory leak in probe").  It
> seems there may be similar issues in that driver: one single function
> call tries to undo an indeterminate number of initializations.
> 
> I don't know enough about these subsystems to evaluate this.  Can you
> take a look at it?
> 

The probe error handling in gspca_dev_probe2() is fine now.  All those
functions are no-ops when they haven't been allocated/registered.

regards,
dan carpenter

