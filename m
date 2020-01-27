Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F35B14A227
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 11:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730012AbgA0Kmj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 05:42:39 -0500
Received: from mga17.intel.com ([192.55.52.151]:34809 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgA0Kmj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 05:42:39 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jan 2020 02:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; 
   d="scan'208";a="246357158"
Received: from unknown (HELO kekkonen.fi.intel.com) ([10.252.52.135])
  by orsmga002.jf.intel.com with ESMTP; 27 Jan 2020 02:42:36 -0800
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id E2FEE21D17; Mon, 27 Jan 2020 12:42:33 +0200 (EET)
Date:   Mon, 27 Jan 2020 12:42:33 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: 14-bit pixel/media bus formats for i.MX8QM/QXP CSI
Message-ID: <20200127104233.GC21275@kekkonen.localdomain>
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Fri, Jan 24, 2020 at 09:36:25PM +0100, Daniel Glöckner wrote:
> Hello,
> 
> the i.MX8QM and i.MX8QXP contain MIPI CSI-2 controllers that forward the
> received data on a parallel bus to the Image Sensing Interface (ISI) of
> the chip. If the data on the MIPI bus is in any of the six RAW formats
> defined for CSI-2, the CSI controller will shift the values so that the
> msb is always in bit 13. This was most likely done to allow following
> hardware to process the data as RAW14 regardless of the actual RAW format.
> Unfortunately the ISI is not able to shift the bits back before writing it
> to memory. RAW8 data therefore has to be saved in two bytes per sample with
> two unused bits at the top and six unused bits at the bottom.

That's a rather peculiar implementation, indeed.

> 
> The drivers for the hardware are still being developed in NXP's repository
> at CodeAurora. We have extended them to support greyscale and Bayer
> cameras. Now all we need are stable defines for the pixel and media bus
> formats for use in libraries and applications and documentation for people
> to know their meaning.
> 
> To keep the number of needed formats low, we would like to ignore that
> there might be unused bits at the bottom. Then we can use the existing
> MEDIA_BUS_FMT_S{BGGR,GBRG,GRBG,RGGB}14_1X14 formats between the CSI
> controller and the ISI and just have to add a MEDIA_BUS_FMT_Y14_1X14
> format. For the pixel formats we would add V4L2_PIX_FMT_Y14 and rebase
> e38d5f254ad8 from Sakari's packed12-postponed branch for Bayer.
> 
> Now the questions:
> 
>  - Is it acceptable to use MEDIA_BUS_FMT_Y14_1X14 in this case instead of
>    using MEDIA_BUS_FMT_Y12_1X14_PADLO, MEDIA_BUS_FMT_Y10_1X14_PADLO,
>    MEDIA_BUS_FMT_Y8_1X14_PADLO, MEDIA_BUS_FMT_Y7_1X14_PADLO,
>    MEDIA_BUS_FMT_Y6_1X14_PADLO? Another 20 _PADLO formats would have to
>    be added for Bayer.

I think I'd say yes, you could do this, *if* you're fully certain you'll
*never* see this CSI-2 receiver paired with any other hardware than the
ISI, which is the case for instance if it's part of the same device. As if
there is hardware that can make use of the information on how many bits are
actually used there, you'd need to expose that information on the uAPI as
well. Changing that would be an uAPI change, something that should be
avoided if at all possible.

> 
>  - Given the history of Sakari's packed12-postponed branch, is there a
>    chance to get these definitions merged into mainline although the
>    driver is not? I fear that NXP's drivers will not hit mainline for a
>    long time.

Cc'ing Hans.

We have a practice not merging the format definitions (or other API
additions) before there are users. That's partly because often API
additions merged before the user have ended never being used because it
turned out to be something else that the driver actually needed, or the
driver was never merged.

That said, I don't foresee that problem here: these (14-bit raw Bayer
pixel) formats are pretty standard stuff albeit still rare for 14 bits is
more than you usually need, but we started off with 8 bits per pixel and 12
isn't uncommon nowadays.

I'd be leaning towards merging them --- it's just a question of time when
they'll be needed somewhere else.

> 
>  - Sakari, do you mind me adding the same license header to your
>    pixfmt-y14.rst that is used by all other pixfmt-y*.rst files?

Feel free to do so.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
