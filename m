Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF89AC88C9
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 14:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfJBMiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 08:38:55 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53928 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfJBMiz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 08:38:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Cch5D014533;
        Wed, 2 Oct 2019 07:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570019923;
        bh=6k/1/L8qVzBnkiN3DQ8sBlvddq0xsy4C1W0U2GgT2tc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=ckjObRSwAAxO4JX5G88yKRjMZ2g/hf5dGI8dK+zvxCOePp/Voa9SMYMVL3p0SMoUa
         NTf2aN8lVDrriaLaQg2fgPtJIwNJSdY8IyPpdueORyrhttt8C8ba1MoRwkVUDpFr44
         HhoiBQ5NeUiyVtK8SDoBqBy4etam5Lw1B8YwTBHM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92CchlD007388
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:38:43 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:38:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:38:43 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with SMTP id x92Cch6J093041;
        Wed, 2 Oct 2019 07:38:43 -0500
Date:   Wed, 2 Oct 2019 07:40:54 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hugues.fruchet@st.com>
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191002124054.gqw5l6tdyxqalpod@ti.com>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
 <20191001162341.f2o7ruar2nifl5ws@ti.com>
 <20191002075951.afp2xligspqat4ew@uno.localdomain>
 <20191002121438.g3re6v54q4hit2wv@ti.com>
 <20191002123513.GI972@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191002123513.GI972@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Wed [2019-Oct-02 15:35:13 +0300]:
> Hi Benoit,
> 
> On Wed, Oct 02, 2019 at 07:14:38AM -0500, Benoit Parrot wrote:
> > Hi Jacopo,
> > 
> > Maybe, I miss spoke when I mentioned a helper I did not intent a framework
> > level generic function. Just a function to help in this case :)
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
> > 
> > Unlike my V4L2_CID_PIXEL_RATE solution which now works in all mode with the
> > same receiver.
> > 
> > So long story short I dropped the V4L2_CID_LINK_FREQ patch and focused on
> > V4L2_CID_PIXEL_RATE instead.
> 
> It shouldn't make a difference which one you use; if you know the bus type
> (and if it's CSI-2 with D-PHY, number of lanes and how many bits per pixel
> the media bus format has), you can convert fairly trivially between the
> two.

Sakari,

Yes I get that, but at this point as they say I will leave that as an
exercise to the reader...

Benoit

> 
> -- 
> Sakari Ailus
> sakari.ailus@linux.intel.com
