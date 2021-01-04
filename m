Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E152E948F
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 13:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbhADMJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 07:09:41 -0500
Received: from mga04.intel.com ([192.55.52.120]:9446 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbhADMJl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Jan 2021 07:09:41 -0500
IronPort-SDR: xZTo9WKylRjwsJw5Wy1ieLSpPy/NXIq4V3nC3RivSkT3oNrNIXDGthu/vt7oldAfYLOQsJ6rXP
 iOzkAHeUpdKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9853"; a="174367452"
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; 
   d="scan'208";a="174367452"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 04:07:55 -0800
IronPort-SDR: AljENoK4bHv16eucz7sir0b2XFg4vUGszlWhlXIDJ2uePSu+ZLzdmB9wT9pCaoJGYaexvuOdAg
 Xxrq3wDbAzNA==
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; 
   d="scan'208";a="345880335"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 04:07:52 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DAB59206FD; Mon,  4 Jan 2021 14:07:49 +0200 (EET)
Date:   Mon, 4 Jan 2021 14:07:49 +0200
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
Message-ID: <20210104120749.GK11878@paasikivi.fi.intel.com>
References: <20201231142702.3095260-1-paul.kocialkowski@bootlin.com>
 <20201231142702.3095260-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231142702.3095260-3-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Thu, Dec 31, 2020 at 03:27:01PM +0100, Paul Kocialkowski wrote:
> The OV8865 is a 8 Mpx CMOS image sensor producing 3264x2448 at 30 fps.
> Other modes (including some with sub-sampling) are available too.
> It outputs 10-bit bayer CFA data through a MIPI CSI-2 interface with
> up to 4 lanes supported.

I've added the patches to a pull request to Mauro; there appear to still be
some checkpatch.pl issues in both of the drivers.

I don't mind the warnings on the assignment or the mutex though. Could you
address these in additional patches, please?

-- 
Kind regards,

Sakari Ailus
