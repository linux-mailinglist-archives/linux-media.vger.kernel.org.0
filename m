Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C243361334
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 21:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235112AbhDOT6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 15:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234815AbhDOT6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 15:58:07 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC62C061574;
        Thu, 15 Apr 2021 12:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4GXPFxKdyq+7gB1Susv2wZJndNmxWkS7LuCF5KQHuQY=; b=Y4SXCkeAXvazsSvkYkiE2sv/Pv
        AFnQLfRsLbw3EfJa/blThV05+ruUaq+5QWnu4IGf8VxPEI/MaWMETP6OM+aDqntMSveNjJHPCMHQ9
        DyURa+XnTOOgxb4i+b+ig/wdjemKR9RQnkrDROQ++h+2Xd0CJ7MWen+N98LCOOHncqxoMDMsI8/aC
        69jcVea62je9MdgWzVhD5sw66UoB8EPPPBrpOo5VYNvsGgvRjtl/Yun8pnpwhW17ht+m8nuQ8p3Iy
        tX5+Fgl3pnsGfHdbexZPnotCQF8K+nWKKhOMcSfkb7L46SlJnVuzV0pNXSIFbB6jqADbOpUerCzRY
        bCqZOfvQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lX86q-0091RC-GQ; Thu, 15 Apr 2021 19:57:07 +0000
Date:   Thu, 15 Apr 2021 20:57:04 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415195704.GE2531743@casper.infradead.org>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415194955.GI3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 10:49:55PM +0300, Sakari Ailus wrote:
> On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> > On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > > -    u32 mbus_code);
> > > +const struct atomisp_format_bridge*
> > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > 
> > No, this does not match coding style.  Probably best to break the
> > 80-column guideline in this instance.  Best would be to have a function
> 
> Having the return type on the previous line is perfectly fine. There should
> be a space before the asterisk though.

No, it's not.  Linus has ranted about that before.
