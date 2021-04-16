Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5954E361D04
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 12:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241192AbhDPJO0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 05:14:26 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42788 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240020AbhDPJOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 05:14:25 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G995Ta036648;
        Fri, 16 Apr 2021 09:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=op45Vt9QNCZlrOsT0yNWkAC1F6euLT9Icbvg5SmZawc=;
 b=Xhln4dkC8kBM8Y0iUi4mrzZJOYzqas0G0hxht1MmWO5m9xqYAJ6QzMqR7G1Dq5xaaa3n
 tW9LgDUZUsVDdnzgjQVbToCKuK9lGo7vNO8e1OScgu+1ZNM9J4oHbdQu0vp1IVJtW2jf
 Dluh9FlhjtD8O8jqt3gQTVOG1s0+nxQSHy15lOlLA5axuHcobOBACD5m9Lhvp5/rep8E
 kjiAFE3FFNjefJNYyimYM6PbYF9nSMkj9wotfvR7mCa3TkzkdAhRsKWC7MR74bUmscAu
 qqD/L4eiBO64yISmUUyMLwZiaql3JF2HwncJ/09cGZWLQqUjeRGGymbJR/v9Enl3NRvH kQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 37u3ymrhpx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Apr 2021 09:13:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G99oot089563;
        Fri, 16 Apr 2021 09:13:43 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 37unx47fy3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Apr 2021 09:13:43 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13G9Dc9g015177;
        Fri, 16 Apr 2021 09:13:39 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 16 Apr 2021 02:13:38 -0700
Date:   Fri, 16 Apr 2021 12:13:31 +0300
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
Message-ID: <20210416091331.GG6021@kadam>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
 <20210415195704.GE2531743@casper.infradead.org>
 <20210415195941.GF2531743@casper.infradead.org>
 <20210415212158.GK3@paasikivi.fi.intel.com>
 <20210416054941.GF6021@kadam>
 <20210416083728.GL3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416083728.GL3@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160070
X-Proofpoint-GUID: TZZwkd1UcLjdaWLo9Gwz4W7eEvpQrFSZ
X-Proofpoint-ORIG-GUID: TZZwkd1UcLjdaWLo9Gwz4W7eEvpQrFSZ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1031
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160070
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 16, 2021 at 11:37:28AM +0300, Sakari Ailus wrote:
> Hi Dan,
> 
> On Fri, Apr 16, 2021 at 08:49:41AM +0300, Dan Carpenter wrote:
> > On Fri, Apr 16, 2021 at 12:21:58AM +0300, Sakari Ailus wrote:
> > > On Thu, Apr 15, 2021 at 08:59:41PM +0100, Matthew Wilcox wrote:
> > > > On Thu, Apr 15, 2021 at 08:57:04PM +0100, Matthew Wilcox wrote:
> > > > > On Thu, Apr 15, 2021 at 10:49:55PM +0300, Sakari Ailus wrote:
> > > > > > On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> > > > > > > On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > > > > > > > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > > > > > > > -    u32 mbus_code);
> > > > > > > > +const struct atomisp_format_bridge*
> > > > > > > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > > > > > > 
> > > > > > > No, this does not match coding style.  Probably best to break the
> > > > > > > 80-column guideline in this instance.  Best would be to have a function
> > > > > > 
> > > > > > Having the return type on the previous line is perfectly fine. There should
> > > > > > be a space before the asterisk though.
> > > > > 
> > > > > No, it's not.  Linus has ranted about that before.
> > > > 
> > > > Found it.  https://lore.kernel.org/lkml/1054519757.161606@palladium.transmeta.com/
> > > 
> > > Two decades ago, really?
> > > 
> > > This is simply one of the practical means how you split long function
> > > declarations and avoid overly long lines. Not my favourite though, but
> > > still better than those long lines.
> > 
> > I've always thought we allow either style, but it has to be done
> > consistently within the file.  I was pretty sure that was policy but
> > it's another thing that goes back decades so I don't have a reference.
> > It shouldn't be about breaking up long lines.
> > 
> > > 
> > > My personal preference would be to wrap at the opening parenthesis and
> > > indent by just a tab, but I know many people who disagree with that...
> > 
> > If you're running into the 80 character limit, then it's fine to use
> > two tabs.  I think we have been rejecting patches that push align the
> > parameters but push past the 80 character limit.  Using one tab is
> > confusing because it makes the decalarations line up with the code.
> 
> Interesting. Do you have an example of this? I've thought checkpatch.pl
> gave a warning if the line ended with an opening parenthesis no matter
> what.

The prefered style is still aligning with the parentheses but if you
have to choose between a warning about going over the limit or a warning
about aligning then probably it's fine to not align.

I can't find an example, but I'm pretty sure we've been rejecting
patches that align the parameters but now go over the 80/100 char limit.

regards,
dan carpenter
