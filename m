Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45F0361340
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 22:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbhDOUA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 16:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbhDOUA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 16:00:27 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74214C061574;
        Thu, 15 Apr 2021 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Jidstt2/GQtBM10h7qL1vxyo4ZsH+nyyJX9lVogApq4=; b=GXqEg47IGUl3iUkF0KKQI28r5i
        dXx0qi4Ae6gDsIoXFQVAAC2MYV3sv4hydRUaejqig0bIuTdEbTa42bMVyWl2MjtkrJy/n115VvYWe
        AhMwH1m3yGKaa2KzY9fD65upkcgJwjyBdXpGxrkeOuUfulBaEqEom1khvrU0dhtXhi2ho7aYmCv4k
        Y5TA/PCz/aBcZNTXvPHp354+UrRhf1bXzp5uBCI5OxTIE4pA4x3zVKYWTJaDC/SR+ElSEke5nWeb8
        fjtpJh02CDA3xdPUdHKQD22nF2nG2kfSdC2bKHPdS4OR+BHsUsic7RIkbuyAARmJQRNr2BbsI1oyV
        qxcO1aIw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lX89N-0091Za-NN; Thu, 15 Apr 2021 19:59:44 +0000
Date:   Thu, 15 Apr 2021 20:59:41 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415195941.GF2531743@casper.infradead.org>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
 <20210415195704.GE2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415195704.GE2531743@casper.infradead.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 08:57:04PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 15, 2021 at 10:49:55PM +0300, Sakari Ailus wrote:
> > On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> > > On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > > > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > > > -    u32 mbus_code);
> > > > +const struct atomisp_format_bridge*
> > > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > > 
> > > No, this does not match coding style.  Probably best to break the
> > > 80-column guideline in this instance.  Best would be to have a function
> > 
> > Having the return type on the previous line is perfectly fine. There should
> > be a space before the asterisk though.
> 
> No, it's not.  Linus has ranted about that before.

Found it.  https://lore.kernel.org/lkml/1054519757.161606@palladium.transmeta.com/
