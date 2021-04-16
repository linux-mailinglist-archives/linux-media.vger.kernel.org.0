Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403BA361979
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 07:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238716AbhDPFvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 01:51:54 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:34682 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238696AbhDPFvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 01:51:53 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G5ia0h094659;
        Fri, 16 Apr 2021 05:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=kRy8guf9ADEaLVne8vD5aYowdOf903zCbD0a8Uul56I=;
 b=OpiahsKZ7BS593zzzc1sX6x++7/hUb2U/9g3VD0sUKfzRO1PQlpN6tCjsrRjf+2tl1s5
 /iDtNVYj0TqlH5tn7cXVy78tUsjqwbWO45dv3tjKI80R6R8YBNllV57GauvhzNBCseaU
 ejxb5ChkpR6nOQy//UAWorG7BSFSrWEhXJPj8+yul4cFGBq/LUB6HeZt8oFQOjXvtzaF
 PU/litZdvJzBqAok1sc3QzHTuxKhb1SOXMC1Z6yINuMez+PMTiNoY+TVPqhXGvnoAWw4
 Hd/L4Et3RD51nTF21FjvPp7TfSoFGZJKA0UY1p5oOjucdfa0AHIlcDpgxKHXQxOkENmH ow== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 37u3ymqw8n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Apr 2021 05:49:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G5jd98014616;
        Fri, 16 Apr 2021 05:49:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 37unswq0xd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Apr 2021 05:49:55 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13G5nn50027730;
        Fri, 16 Apr 2021 05:49:50 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 15 Apr 2021 22:49:49 -0700
Date:   Fri, 16 Apr 2021 08:49:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210416054941.GF6021@kadam>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
 <20210415195704.GE2531743@casper.infradead.org>
 <20210415195941.GF2531743@casper.infradead.org>
 <20210415212158.GK3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415212158.GK3@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160044
X-Proofpoint-GUID: UBL0ZxRfGNz-BqCCz60MCMCNixHxWPlj
X-Proofpoint-ORIG-GUID: UBL0ZxRfGNz-BqCCz60MCMCNixHxWPlj
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1031
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160044
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 16, 2021 at 12:21:58AM +0300, Sakari Ailus wrote:
> On Thu, Apr 15, 2021 at 08:59:41PM +0100, Matthew Wilcox wrote:
> > On Thu, Apr 15, 2021 at 08:57:04PM +0100, Matthew Wilcox wrote:
> > > On Thu, Apr 15, 2021 at 10:49:55PM +0300, Sakari Ailus wrote:
> > > > On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> > > > > On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > > > > > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > > > > > -    u32 mbus_code);
> > > > > > +const struct atomisp_format_bridge*
> > > > > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > > > > 
> > > > > No, this does not match coding style.  Probably best to break the
> > > > > 80-column guideline in this instance.  Best would be to have a function
> > > > 
> > > > Having the return type on the previous line is perfectly fine. There should
> > > > be a space before the asterisk though.
> > > 
> > > No, it's not.  Linus has ranted about that before.
> > 
> > Found it.  https://lore.kernel.org/lkml/1054519757.161606@palladium.transmeta.com/
> 
> Two decades ago, really?
> 
> This is simply one of the practical means how you split long function
> declarations and avoid overly long lines. Not my favourite though, but
> still better than those long lines.

I've always thought we allow either style, but it has to be done
consistently within the file.  I was pretty sure that was policy but
it's another thing that goes back decades so I don't have a reference.
It shouldn't be about breaking up long lines.

> 
> My personal preference would be to wrap at the opening parenthesis and
> indent by just a tab, but I know many people who disagree with that...

If you're running into the 80 character limit, then it's fine to use
two tabs.  I think we have been rejecting patches that push align the
parameters but push past the 80 character limit.  Using one tab is
confusing because it makes the decalarations line up with the code.

regards,
dan carpenter

