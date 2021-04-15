Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5B936140E
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 23:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbhDOVW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 17:22:27 -0400
Received: from mga07.intel.com ([134.134.136.100]:54160 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234959AbhDOVW0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 17:22:26 -0400
IronPort-SDR: e1Q9Ow3/33ziRqlO4KagyEEyUaqhfvf6WTDlveiA5ok2mvXHlMQFFOCrQPRkLCZ0jC/M93gmat
 aGh+Mtwv2yow==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="258904597"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="258904597"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 14:22:02 -0700
IronPort-SDR: edfhmDWBq4D32ytRDaSJdaCo3lFDKzjLHcP4EAWXKQUPkEKrVTbYXKXBIceoIwGr8lx19WZnMn
 YI+F1VdRQubg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="451258859"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 14:22:00 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 608852051E;
        Fri, 16 Apr 2021 00:21:58 +0300 (EEST)
Date:   Fri, 16 Apr 2021 00:21:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415212158.GK3@paasikivi.fi.intel.com>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
 <20210415195704.GE2531743@casper.infradead.org>
 <20210415195941.GF2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415195941.GF2531743@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 08:59:41PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 15, 2021 at 08:57:04PM +0100, Matthew Wilcox wrote:
> > On Thu, Apr 15, 2021 at 10:49:55PM +0300, Sakari Ailus wrote:
> > > On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> > > > On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > > > > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > > > > -    u32 mbus_code);
> > > > > +const struct atomisp_format_bridge*
> > > > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > > > 
> > > > No, this does not match coding style.  Probably best to break the
> > > > 80-column guideline in this instance.  Best would be to have a function
> > > 
> > > Having the return type on the previous line is perfectly fine. There should
> > > be a space before the asterisk though.
> > 
> > No, it's not.  Linus has ranted about that before.
> 
> Found it.  https://lore.kernel.org/lkml/1054519757.161606@palladium.transmeta.com/

Two decades ago, really?

This is simply one of the practical means how you split long function
declarations and avoid overly long lines. Not my favourite though, but
still better than those long lines.

My personal preference would be to wrap at the opening parenthesis and
indent by just a tab, but I know many people who disagree with that...

-- 
Sakari Ailus
