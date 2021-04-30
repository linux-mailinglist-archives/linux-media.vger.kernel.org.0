Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A9236FF42
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 19:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhD3RNy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 13:13:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:63665 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229750AbhD3RNy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 13:13:54 -0400
IronPort-SDR: c6tlyCii+mtfuFTLssfeNgkGzW/uXMIz+pA3MriI1Z9Gdpqf4/anhWawlBjCrWXT3CsNr26oy4
 M56b4J8J+wnw==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="184456687"
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; 
   d="scan'208";a="184456687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 10:12:46 -0700
IronPort-SDR: Lz5KIy5ekSzPKCUggg0rlcFyOWTixQPR1m3agrRuwDxHF467cBZ+854Ke9G+zlPChkZfh/y05Q
 sBqbwmlIZRTQ==
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; 
   d="scan'208";a="431532061"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 10:12:44 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id EE556203F0;
        Fri, 30 Apr 2021 20:12:41 +0300 (EEST)
Date:   Fri, 30 Apr 2021 20:12:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pci: reposition braces as per
 coding style
Message-ID: <20210430171241.GJ3@paasikivi.fi.intel.com>
References: <YIwk3KbVGRPJwKa4@dU2104>
 <20210430163327.GI3@paasikivi.fi.intel.com>
 <YIw4pUzTOHV6E9WZ@dU2104>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIw4pUzTOHV6E9WZ@dU2104>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

On Fri, Apr 30, 2021 at 10:34:37PM +0530, Deepak R Varma wrote:
> On Fri, Apr 30, 2021 at 07:33:27PM +0300, Sakari Ailus wrote:
> > Hi Deepak,
> > 
> > If you're touching all these lines, I might do a little more. Please see
> > the comments below.
> > 
> Hello Sakari,
> I can definitely include other changes, but then it will be many different
> types of changes into a single patch. Will that be okay?
> 
> I was planning to address one issue per patch as I think the volume of
> change is going to be high.  I mentioned that in the notes section of the patch
> message.

I think I'd split the patch into smaller chunks if the result becomes too
big but I don't think it's necessary yet.

Splitting different kinds of simple cleanups into several patches takes
longer time to review when they're touching the same piece of code. As the
chunks in these patches have virtually no dependencies to other chunks,
it's fine to do several kinds of cleanups at once.

-- 
Kind regards,

Sakari Ailus
