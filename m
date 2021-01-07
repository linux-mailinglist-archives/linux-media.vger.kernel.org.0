Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C17D22ECE3C
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbhAGKyR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:54:17 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:53930 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbhAGKyR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 05:54:17 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107Amxsk107836;
        Thu, 7 Jan 2021 10:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=5SMoYs193H/F2DE2IQKVDg7HukA9+pDr7yls5T+ESaE=;
 b=mu2G665tqrqAhD7acNOnw/a0qAAuKRXmrs3oajhu0N37db1iQheaQfvTnLPaA2B/cjHl
 1nsKbCvyEi342gk9lHJgh0PcFwomWNIboPojiWg5GKa3qyIoiVjzwGXvLsmW4nn87dW1
 dTPF9hCKMxxTSeIrx7HWYqoK1sMH4X70CrDsWBOU3oUGVRze+0+zRbi6MVd5cYpRymOQ
 26cYSAu0LZiZ6zqqa3XjhfZ4ZjC7o6XrkrP17H8QpsTugQ0jlv7R+fBPe59eZbmxa8Vt
 mlNFFRMIrtlpqW0ZR76jf4R84+DS/D/MieFsMU7673w9i0aA293+rhZDmPotfZEocKRO Ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 35wepmbvgn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 07 Jan 2021 10:53:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107Ais8x174981;
        Thu, 7 Jan 2021 10:53:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 35v1fb47ad-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 07 Jan 2021 10:53:27 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 107ArQw7015782;
        Thu, 7 Jan 2021 10:53:26 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 07 Jan 2021 02:53:19 -0800
Date:   Thu, 7 Jan 2021 13:53:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Joe Perches <joe@perches.com>
Cc:     Filip Kolev <fil.kolev@gmail.com>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: ov2722: replace hardcoded function name
Message-ID: <20210107105310.GB5083@kadam>
References: <20210105202945.26913-1-fil.kolev@gmail.com>
 <X/VsF364jpGz6oze@kroah.com>
 <dcdda829-89d6-badd-4f22-72d95d24e9e3@gmail.com>
 <X/X45909l1Tk7Bni@kroah.com>
 <c9284a7f1443146b3885e8ceae3dcf113c531a36.camel@perches.com>
 <20210106193633.GK2809@kadam>
 <c5781c80a582cc68e1ae1bdc106c50cb263f81bf.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5781c80a582cc68e1ae1bdc106c50cb263f81bf.camel@perches.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070065
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070065
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 01:17:47PM -0800, Joe Perches wrote:
> On Wed, 2021-01-06 at 22:36 +0300, Dan Carpenter wrote:
> > On Wed, Jan 06, 2021 at 10:25:26AM -0800, Joe Perches wrote:
> > > On Wed, 2021-01-06 at 18:52 +0100, Greg Kroah-Hartman wrote:
> > > > On Wed, Jan 06, 2021 at 07:43:42PM +0200, Filip Kolev wrote: 
> > > > > On 06-Jan-21 09:51, Greg Kroah-Hartman wrote:
> > > > > > On Tue, Jan 05, 2021 at 10:29:18PM +0200, Filip Kolev wrote:
> > > > > > > There is a debug message using hardcoded function name instead of the
> > > > > > > __func__ macro. Replace it.
> > > > > > > 
> > > > > > > Report from checkpatch.pl on the file:
> > > > > > > 
> > > > > > > WARNING: Prefer using '"%s...", __func__' to using 'ov2722_remove', this function's name, in a string
> > > > > > > +	dev_dbg(&client->dev, "ov2722_remove...\n");
> []
> > > There are quite a lot of these relatively useless function tracing like
> > > uses in the kernel:
> > > 
> > > $ git grep -P '"%s[\.\!]*\\n"\s*,\s*__func__\s*\)' | wc -l
> > > 1065
> > 
> > These are printing other stuff besides just the function name.
> 
> No, these are printing _only_ the function name.
> 

Oh...  Duh...  I was looking at the complete wrong output.  My bad.

Yeah.  I like this warning.

regards,
dan carpenter

