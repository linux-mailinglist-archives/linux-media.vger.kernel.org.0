Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938A8361C91
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 11:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239615AbhDPIzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 04:55:05 -0400
Received: from mga04.intel.com ([192.55.52.120]:27318 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235225AbhDPIzE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 04:55:04 -0400
IronPort-SDR: C3Dw58EJyKBOp9u/MTrmn6VW/AW7gD/oCvQX/h8cPC5/9Za1XZ7pyvKL2odzYoFL/WRrNX/XR2
 Dc7h40Oops3A==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="192884287"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="192884287"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 01:54:36 -0700
IronPort-SDR: BYCOgwJ1gbYMUxmrO50htGnKHmyFxtbXuGOi1ipu6Pihc6LpDHJFD3MRAVOBN/I27YxthQiLyE
 sdpLtBM3Zokg==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="453267127"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 01:54:34 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4BE3D20188;
        Fri, 16 Apr 2021 11:54:32 +0300 (EEST)
Date:   Fri, 16 Apr 2021 11:54:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210416085431.GM3@paasikivi.fi.intel.com>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
 <20210415195704.GE2531743@casper.infradead.org>
 <20210415195941.GF2531743@casper.infradead.org>
 <20210415212158.GK3@paasikivi.fi.intel.com>
 <20210416054941.GF6021@kadam>
 <20210416083728.GL3@paasikivi.fi.intel.com>
 <alpine.DEB.2.22.394.2104161045140.8503@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104161045140.8503@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 16, 2021 at 10:46:54AM +0200, Julia Lawall wrote:
> > > If you're running into the 80 character limit, then it's fine to use
> > > two tabs.  I think we have been rejecting patches that push align the
> > > parameters but push past the 80 character limit.  Using one tab is
> > > confusing because it makes the decalarations line up with the code.
> >
> > Interesting. Do you have an example of this? I've thought checkpatch.pl
> > gave a warning if the line ended with an opening parenthesis no matter
> > what.
> 
> Checkpatch is a perl script that searches for patterns that often indicate
> code that is hard to understand.  It is not a precise definition of what
> is allowed in the Linux kernel.  Humans have to amke compromises.

Yeah... but I'd think if this is a preferred style then the warning could
be omitted. It might not be that difficult.

-- 
Sakari Ailus
