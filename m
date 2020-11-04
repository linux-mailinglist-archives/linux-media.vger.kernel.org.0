Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551962A6382
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbgKDLks (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:40:48 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:40296 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729508AbgKDLks (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:40:48 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A4BdhVI144676;
        Wed, 4 Nov 2020 11:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=rma02KPg1kKHnISzToa1qVrQU80lIknQ5aS0+dySMKA=;
 b=TWNQt4gM3JaDdDUBHnnI8fj7mB9KLjO0Dqdc4Gc9FdAZO6XAddNNmq0tZ6PQof0OQLa6
 Vy8cUdzaMjJ/YytnkcFaBwkJZQ0Z9amMx0ipfD9jWf1FgfYgSRIrv0Gw/rfydzJ1V2BD
 Db1n+3FapFp6g1GMEeSpQxwx2mUOYgfg3LVgdWlTI7+ncg9uaosCqMAOfDmYVLBSVydk
 MdRV/AjXmfWKRjFrS43tmOAJldgKMpT4EvSj5a8yTmhmVVzHaXjQKlz0H5Y/g3KaGS2v
 rDSnDYZX9j+kInn40q9A2CdTN7KCrz+of1qUemMkeHHWtQayEWydjmdsZzcaUrMfmFhl rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 34hhvceae2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 04 Nov 2020 11:40:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A4BaV4r019096;
        Wed, 4 Nov 2020 11:40:32 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 34hw0jruqb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Nov 2020 11:40:32 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A4BePp2017833;
        Wed, 4 Nov 2020 11:40:25 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Nov 2020 03:40:25 -0800
Date:   Wed, 4 Nov 2020 14:40:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michel Lespinasse <walken@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [v2] media: atomisp: Fix error handling path
Message-ID: <20201104114015.GH18329@kadam>
References: <1604455331-28031-1-git-send-email-jrdr.linux@gmail.com>
 <65712450-1ee9-2dd3-cd43-f850807ae203@web.de>
 <20201104083121.GG18329@kadam>
 <85ff17ad-8aa7-a457-6e23-4f5c1c5152f2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85ff17ad-8aa7-a457-6e23-4f5c1c5152f2@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9794 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011040087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9794 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011040087
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 04, 2020 at 11:30:29AM +0100, Markus Elfring wrote:
> >>> Fixes: 14a638ab96c5 ("media: atomisp: use pin_user_pages() for memory
> >>> allocation")
> >>
> >> Please delete a line break for this tag.
> >
> > Markus, the thing is that we all saw the line break and we just thought
> > it didn't matter at all...
> 
> Do you disagree to the known documentation then?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=4ef8451b332662d004df269d4cdeb7d9f31419b5#n123 

The documentation is correct but no one wants you to constantly be
nagging developers about minor stuff...

One thing that I do is I start to write an email and then if I realize
it's not worth complaining about and I save it to my postponed messages
folder.  Then I never send it and I forget about it completely.  I have
currently have 740 messages in my postponed messages folder.  :P

That's a lot of whining and complaining which I never sent and the world
is the more beautiful for it.

regards,
dan carpenter

