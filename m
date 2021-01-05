Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56812EAD95
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 15:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbhAEOnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 09:43:42 -0500
Received: from mga04.intel.com ([192.55.52.120]:50191 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbhAEOnl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 09:43:41 -0500
IronPort-SDR: pDCGS368j4VtJzF8z82tUrnSisgB42Wavyn6WReAnjshcprtcIwlBZ06s9A+tJnvzzsLK+FysO
 AXQrFldZZ6pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="174537846"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="174537846"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 06:41:56 -0800
IronPort-SDR: bpivkxY+nxz/ZxLQsHPsFGGX4EmiEFv4XieEvrtWP21TnXDbfi4io+N4fhpOYVmtcVsUx2apXH
 mvhvVF0qNRBg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="361188842"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 06:41:52 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D694F206FD; Tue,  5 Jan 2021 16:41:50 +0200 (EET)
Date:   Tue, 5 Jan 2021 16:41:50 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH v4 2/3] media: i2c: Add support for the OV8865 image
 sensor
Message-ID: <20210105144150.GS11878@paasikivi.fi.intel.com>
References: <20201231142702.3095260-1-paul.kocialkowski@bootlin.com>
 <20201231142702.3095260-3-paul.kocialkowski@bootlin.com>
 <20210104120749.GK11878@paasikivi.fi.intel.com>
 <X/Qzp8/4gd/ANdXh@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/Qzp8/4gd/ANdXh@aptenodytes>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Tue, Jan 05, 2021 at 10:38:47AM +0100, Paul Kocialkowski wrote:
> Hi Sakari,
> 
> On Mon 04 Jan 21, 14:07, Sakari Ailus wrote:
> > Hi Paul,
> > 
> > On Thu, Dec 31, 2020 at 03:27:01PM +0100, Paul Kocialkowski wrote:
> > > The OV8865 is a 8 Mpx CMOS image sensor producing 3264x2448 at 30 fps.
> > > Other modes (including some with sub-sampling) are available too.
> > > It outputs 10-bit bayer CFA data through a MIPI CSI-2 interface with
> > > up to 4 lanes supported.
> > 
> > I've added the patches to a pull request to Mauro; there appear to still be
> > some checkpatch.pl issues in both of the drivers.
> > 
> > I don't mind the warnings on the assignment or the mutex though. Could you
> > address these in additional patches, please?
> 
> Sorry about that, I realized that I never run checkpatch with --strict
> so I completely missed those.
> 
> I'll fix the cosmetic issues in a following patch.
> 
> Just to clarify one thing:
> #define OV8865_PAD_PK_DRIVE_STRENGTH_2X		(1 << 5)
> #define OV8865_BLC_CTRL1_COL_SHIFT_128		(1 << 4)
> 
> these are not single-bit fields so even though it looks like they should
> use BIT(), this would be incoherent with other possible values, such as:
> #define OV8865_PAD_PK_DRIVE_STRENGTH_3X		(2 << 5)
> #define OV8865_BLC_CTRL1_COL_SHIFT_64		(2 << 4)

Agreed.

You might not assign the top bit, but if you did, the left operand would
have to be unsigned to guarantee the intended result (otherwise it's
undefined).

-- 
Sakari Ailus
