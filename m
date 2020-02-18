Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9707F161E90
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 02:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgBRBeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 20:34:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46910 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgBRBeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 20:34:25 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02D9C2F9;
        Tue, 18 Feb 2020 02:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581989663;
        bh=4bsetaKc49L30YkXwTk51CLh7U+02FPAup9GHnaO8ko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eqA6vLIYoYzsXOgKflQmR53zs9ZPpRrM5yN4VhchnLQERiX4+2t/iPBrhBdBF1ahY
         gy3A0pkdUNxHO3H8VT1cBssZ3aOEZSLNWuHKmCD31ytFCEuAB+A+3h5r4ds3akHq56
         PkATpUvheZeVJ5n10ykv60Abu0zp2kOuKGYmDrqo=
Date:   Tue, 18 Feb 2020 03:34:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel =?utf-8?B?R2zDtmNrbmVy?= <dg@emlix.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: 14-bit pixel/media bus formats for i.MX8QM/QXP CSI
Message-ID: <20200218013404.GA24051@pendragon.ideasonboard.com>
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
> 
> The drivers for the hardware are still being developed in NXP's repository
> at CodeAurora.

Highjacking the thread a little bit, for my information (and thus
without any commitment of any kind), do you know what the upstreaming
plan (and in particular the upstreaming timeline) is ?

> We have extended them to support greyscale and Bayer
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
> 
>  - Given the history of Sakari's packed12-postponed branch, is there a
>    chance to get these definitions merged into mainline although the
>    driver is not? I fear that NXP's drivers will not hit mainline for a
>    long time.
> 
>  - Sakari, do you mind me adding the same license header to your
>    pixfmt-y14.rst that is used by all other pixfmt-y*.rst files?

-- 
Regards,

Laurent Pinchart
