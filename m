Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9591500A02
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 11:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241336AbiDNJjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 05:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiDNJjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 05:39:47 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C8B6F4B7
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649929043; x=1681465043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iGqtdRrgtrv3Dju25ovTu73j9qcewFOrxCrVHCo37jk=;
  b=f+vuDRba6GTGfaHobF3c35Ey/NJt77Y6a6sXGXb5EFp5udq2kWKJW9+D
   3UV/1HYXuU51eg9H2IozxTcX5lSTqbI4Cdion9kB92tmoRf6Jm9EYD0Jr
   VLhj1wFWoTNxzSUhRuVi+2dBL6gqrgIwSnrMWsgZUVBTLom2GQ3XojKZI
   iVDTJCojdybb0rlnqwunZ09ycwwaqPYXW5yTi70lJAZmCqDYQMVsxBD/i
   XHtoPAy2RX3BKja6EOpCKZrjr+Zx8fc9Bu0n68CPu1TOl1/62Uu2QOHEo
   HRsBhC8f30iki7V7mP9eY+EwhSTWYcywx9J2opeQrgIFly6dmGFruNaQT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262644560"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="262644560"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 02:37:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="725296779"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 02:37:22 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 022982030F;
        Thu, 14 Apr 2022 12:37:20 +0300 (EEST)
Date:   Thu, 14 Apr 2022 12:37:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: entity: skip non-data link when removing reverse
 links
Message-ID: <YlfrTxuX5/onWwh0@paasikivi.fi.intel.com>
References: <20220412062313.1645762-1-yunkec@google.com>
 <Yle8zUUjbVW392Gc@paasikivi.fi.intel.com>
 <CANqU6Fd1ixjcTTLG5gfFmkXfd9znvBwmxrni3c4yX-0mP=mS2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANqU6Fd1ixjcTTLG5gfFmkXfd9znvBwmxrni3c4yX-0mP=mS2g@mail.gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

On Thu, Apr 14, 2022 at 03:44:47PM +0900, Yunke Cao wrote:
> On Thu, Apr 14, 2022 at 3:19 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Yunke,
> >
> > Thanks for the patch.
> >
> > On Tue, Apr 12, 2022 at 03:23:13PM +0900, Yunke Cao wrote:
> > > The original implementation removes reverse links for any input link and
> > > assumes the presense of sink/source.
> > > It fails when the link is a not a data link.
> > > media_entity_remove_links when there's an ancillary link can also fail.
> >
> > The function's return type is void. Are there other adverse effects from
> > this? Looking at the function, it would seem like that the reverse link
> > simply isn't found in this case, and so not removed.
> >
> The function dereferences without any check link->source and link->sink
> ("link->source->entity == entity" etc.), which is in union.
> Ancillary links populate gobj0/gobj1 instead of source/sink.
> Calling this function on ancillary links can cause crashes.

Indeed. The struct definition isn't too pretty either. And this only works
with interface links as they're not included in the links list...

> > >
> > > We only need to remove reverse links for a data link.
> >
> > Ideally this would not be based on the link flags as it's not a very robust
> > way to test whather a backlink needs to be removed.
> >
> I was mainly trying to make sure link->source and link->sink are
> populated by checking the link type.
> Currently, only data links need to run this part of the code to remove
> reverse links so I feel this is
> the easiest way. Let me know if there's any better alternative.

I think we should get this in now. The code seems to be in a dire need for
cleanup still.

-- 
Regards,

Sakari Ailus
