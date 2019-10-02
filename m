Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC05C8C41
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 17:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbfJBPEP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 11:04:15 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47280 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfJBPEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 11:04:14 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92F44N0009201;
        Wed, 2 Oct 2019 10:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570028644;
        bh=A2r14ZIvwMI+9nPru8r2elyCsY5l5uNz6w+lSoYipew=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=LlSCmPgs9HGXyeEV9VDWMAZBHywJhcN2lZVb/7F6qEWUBt2tOXQoSUhHjoqM0A5+i
         ME+9IQWzEkDvnM+HvG+y5abc9A+2vBekmD7WkYuQCP26rW3yN9GNJrCL+KotInQl2v
         zSaUaeGlRHCVWEdWNNlzOq8gQe8oy3W5OvUngOL0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92F44D8091247
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 10:04:04 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 10:04:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 10:04:04 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x92F439N103031;
        Wed, 2 Oct 2019 10:04:03 -0500
Date:   Wed, 2 Oct 2019 10:06:15 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hugues.fruchet@st.com>
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191002150615.tyxy3n6cbxttbpum@ti.com>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
 <20191001162341.f2o7ruar2nifl5ws@ti.com>
 <20191002075951.afp2xligspqat4ew@uno.localdomain>
 <20191002121438.g3re6v54q4hit2wv@ti.com>
 <20191002143226.psrcocsjs2wtiydd@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191002143226.psrcocsjs2wtiydd@uno.localdomain>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> wrote on Wed [2019-Oct-02 16:32:26 +0200]:
> Hi Benoit,
> 
> On Wed, Oct 02, 2019 at 07:14:38AM -0500, Benoit Parrot wrote:
> > Hi Jacopo,
> >
> > Maybe, I miss spoke when I mentioned a helper I did not intent a framework
> > level generic function. Just a function to help in this case :)
> 
> Yes indeed, the discussion thread I linked here was mostly interesting
> because Hugues tried to do the same for LINK_FREQ iirc, and there
> where some usefult pointers.
> 
> >
> > That being said, I re-read the thread you mentioned. And as Hughes pointed
> > out dynamically generating a "working" link frequency value which can be
> > used by a CSI2 receiver to properly configure its PHY is not trivial.
> >
> > When I created this patch, I also had another to add V4L2_CID_LINK_FREQ
> > support. I am testing this against the TI CAL CSI2 receiver, which already
> > uses the V4L2_CID_PIXEL_RATE value for that purpose, so I also had a patch
> > to add support for V4L2_CID_LINK_FREQ to that driver as well.
> >
> > Unfortunately, similar to Hughes' findings I was not able to make it "work"
> > with all supported resolution/framerate.
> 
> As reported by Hugues findings, the PLL calculation procedure might be
> faulty, and the actuall frequencies on the bus are different from the
> calculated ones.
> 
> I wish I had more time to re-look at that, as they worked for my and
> Sam's use case, but deserve some rework.
> 
> >
> > Unlike my V4L2_CID_PIXEL_RATE solution which now works in all mode with the
> > same receiver.
> >
> 
> It seems to me you're reporting a fixed rate. It might make your
> receiver happy, but does not report what is acutally put on the bus.
> Am I missing something ?

No it is not fixed, the only fixed value was the initial value (which
representative of the initial/default resolution and framerate), I
fixed this in v2. The reported PIXEL_RATE is re-calculated every time there
is a s_fmt and/or framerate change and the V4L2_CID_PIXEL_RATE control
value is updated accordingly.

> 
> > So long story short I dropped the V4L2_CID_LINK_FREQ patch and focused on
> > V4L2_CID_PIXEL_RATE instead.
> >
> 
> As Sakari pointed out, going from one to the other is trivial and
> could be done on top.

As you said it could be done on top. :)

Benoit

> 
> Thanks
>    j
> 
> > Regard,
> > Benoit
> >
> > Jacopo Mondi <jacopo@jmondi.org> wrote on Wed [2019-Oct-02 09:59:51 +0200]:
> > > Hi Benoit,
> > >   +Hugues
> > >
> > > If you're considering an helper, this thread might be useful to you:
> > > https://patchwork.kernel.org/patch/11019673/
> > >
> > > Thanks
> > >    j
> > >
> >
> >


