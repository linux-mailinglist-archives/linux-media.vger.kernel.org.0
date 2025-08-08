Return-Path: <linux-media+bounces-39150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A227B1EF61
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02EEC7AEB3B
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 20:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59B4233721;
	Fri,  8 Aug 2025 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfHta0Vi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52618186E2D;
	Fri,  8 Aug 2025 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754684511; cv=none; b=twWXS9giGFb5KbXbnVjSnoW/25wOnohej0prldqFLNMN5VDFYybZtxyO4/fwr2AKrbEZZAj4jMG+pQYVr/fbpXuLk/ZCyhVFKDV2rYMTLXarcPuczTSBeZ/13hbMZ40wZ0wuvh8B/b8wmaLzDx4W0BM4N8eElUjJdSyAesjyzQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754684511; c=relaxed/simple;
	bh=3+hUUSK4szO4LRjW3BmXqFzHM8zR8c039TUXffU8WGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYbycOjR4DyIZ7hJlI2XX+eGeO30HmdSPW1xvcsH/zp0dGzf/1m3Mt8U7LXyzMpVFfP2ZWh2oEB15E5OfokXVLdjrn2Fs0Ih37x6tySohErNIpW4X76Oa8MmRyPy3Z6FMCEqqcbU9A5aD3/XQEU1h59onwTdL+t09jHNZtgEYUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfHta0Vi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754684510; x=1786220510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3+hUUSK4szO4LRjW3BmXqFzHM8zR8c039TUXffU8WGw=;
  b=NfHta0VilwM1+KZGFFqX6xf/pCytTVwxhi+cU17JWLWre5Msc9fVxJjg
   3YcVL9yIC54oScb+Qw1WOkVclVKxNIteK7B8eam/MhHbnH6bR3CmpkJHf
   BcizMGhTqdqi4mRiClAnQGThkIdYPlUWk1Fwv7wL3xZ7CJDuMSeYud+jG
   9oH5m8qnJuMT9Q575LppZgtEgt5tdStAWxktOkmLkpMHkqlIQBfW6Xw9c
   Ic7q82SuPipYUWIyRdm5dEb1hGMbsQZXsgrPA3hxWqf9bYK+4U2kcfy/h
   a4qVFmsYe+eP57HoRkpK2B+qiSccEsaumL3ce6JUiLjHnY0Raudbm1QSI
   w==;
X-CSE-ConnectionGUID: 1T3QzIaETbe+6jVMgwPHQw==
X-CSE-MsgGUID: 4cQ3Iz4pQuSKTGVVRoSCDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57104540"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="57104540"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 13:21:48 -0700
X-CSE-ConnectionGUID: cEeZHyF9S+m460omcQ77VQ==
X-CSE-MsgGUID: +d77WPPuSpusqcyKdFfPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165778904"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.17])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 13:21:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B545611FC4F;
	Fri,  8 Aug 2025 23:21:40 +0300 (EEST)
Date: Fri, 8 Aug 2025 20:21:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aJZcVINHciYABUOk@kekkonen.localdomain>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <20250731061004.5447-3-hardevsinh.palaniya@siliconsignals.io>
 <aJXiv3VeoIhpNBhB@kekkonen.localdomain>
 <PN3P287MB351940E03B0D0AD1A933E99AFF2FA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB351940E03B0D0AD1A933E99AFF2FA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>

Hi Hardev,

On Fri, Aug 08, 2025 at 12:34:33PM +0000, Hardevsinh Palaniya wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> > Hi Hardev,
> > 
> > Thanks for the update. A few more minor comments below.
> > 
> > On Thu, Jul 31, 2025 at 11:39:58AM +0530, Hardevsinh Palaniya wrote:
> > > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
> > >
> > > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> > > active array size of 1920 x 1080.
> > >
> > > The following features are supported:
> > > - Manual exposure an gain control support
> > > - vblank/hblank control support
> > > - Test pattern support control
> > > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)
> > >
> > > Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > > Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> > > ---
> > >  MAINTAINERS                |    1 +
> > >  drivers/media/i2c/Kconfig  |   10 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/ov2735.c | 1071 ++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1083 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov2735.c
> > >
> 
> ...
> 
> > > +#define OV2735_XCLK_FREQ                     (24 * HZ_PER_MHZ)
> > > +
> > > +/* Add page number in CCI private bits [31:28] of the register address */
> > > +#define OV2735_PAGE_REG8(p, x)                       (((p) << CCI_REG_PRIVATE_SHIFT) | CCI_REG8(x))
> > > +#define OV2735_PAGE_REG16(p, x)                      (((p) << CCI_REG_PRIVATE_SHIFT) | CCI_REG16(x))
> > > +
> > > +#define OV2735_REG_PAGE_SELECT                       CCI_REG8(0xfd)
> > > +
> > > +/* Page 0 */
> > > +#define OV2735_REG_CHIPID                    OV2735_PAGE_REG16(0x00, 0x02)
> > > +#define OV2735_CHIPID                                0x2735
> > > +
> > > +#define OV2735_REG_SOFT_REST                 OV2735_PAGE_REG8(0x00, 0x20)
> > > +
> > > +/* Clock Settings */
> > > +#define OV2735_REG_PLL_CTRL                  OV2735_PAGE_REG8(0x00, 0x2f)
> > > +#define OV2735_REG_PLL_ENABLE                        0x7f
> > 
> > This register address doesn't use the macro to define one. Why?
> 
> This is not a register address but a register value. 
> I will correct the naming to OV2735_PLL_ENABLE to make that clear.

How about OV2735_PLL_CTRL_ENABLE?

>  
> > > +#define OV2735_REG_PLL_OUTDIV                        OV2735_PAGE_REG8(0x00, 0x34)
> > > +#define OV2735_REG_CLK_MODE                  OV2735_PAGE_REG8(0x00, 0x30)
> > > +#define OV2735_REG_CLOCK_REG1                        OV2735_PAGE_REG8(0x00, 0x33)
> > > +#define OV2735_REG_CLOCK_REG2                        OV2735_PAGE_REG8(0x00, 0x35)
> > > +
> > > +/* Page 1 */
> > > +#define OV2735_REG_STREAM_CTRL                       OV2735_PAGE_REG8(0x01, 0xa0)
> > > +#define OV2735_STREAM_ON                     0x01
> > > +#define OV2735_STREAM_OFF                    0x00
> > 
> > It's a good practice to name register values with the register macro as a
> > prefix, with "REG_" removed.
> 
> This is not a register address but a register value. 
> 
> > > +
> > > +#define OV2735_REG_UPDOWN_MIRROR             OV2735_PAGE_REG8(0x01, 0x3f)
> > > +#define OV2735_REG_BINNING_DAC_CODE_MODE     OV2735_PAGE_REG8(0x01, 0x30)
> > > +#define OV2735_REG_FRAME_LENGTH                      OV2735_PAGE_REG16(0x01, 0x0e)
> > > +#define OV2735_VTS_MAX                               0x0fff
> > > +#define OV2735_REG_FRAME_EXP_SEPERATE_EN     OV2735_PAGE_REG8(0x01, 0x0d)
> > > +#define OV2735_FRAME_EXP_SEPERATE_EN         0x10
> > > +#define OV2735_REG_FRAME_SYNC                        OV2735_PAGE_REG8(0x01, 0x01)
> > > +
> 
> ...
> 
> > > +static int ov2735_init_controls(struct ov2735 *ov2735)
> > > +{
> > > +     struct v4l2_ctrl_handler *ctrl_hdlr;
> > > +     struct v4l2_fwnode_device_properties props;
> > > +     const struct ov2735_mode *mode = &supported_modes[0];
> > > +     u64 hblank_def, vblank_def, exp_max;
> > > +     int ret;
> > > +
> > > +     ctrl_hdlr = &ov2735->handler;
> > > +     ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> > > +     if (ret)
> > > +             return ret;
> > 
> > No need to check this here explicitly.
> > 
> > > +
> > > +     ov2735->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
> > > +                                            V4L2_CID_PIXEL_RATE, 0, OV2735_PIXEL_RATE,
> > > +                                            1, OV2735_PIXEL_RATE);
> > > +
> > > +     ov2735->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2735_ctrl_ops,
> > > +                                                V4L2_CID_LINK_FREQ,
> > > +                                                ov2735->link_freq_index,
> > > +                                                0, link_freq_menu_items);
> > > +     if (ov2735->link_freq)
> > > +             ov2735->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +     hblank_def = mode->hts_def - mode->width;
> > > +     ov2735->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops, V4L2_CID_HBLANK,
> > > +                                        hblank_def, hblank_def, 1, hblank_def);
> > 
> > Can you run:
> > 
> >         $ ./scripts/checkpatch.pl --strict --max-line-length=80
> > 
> > on the patch, please?
> 
> I tried to keep lines within 80 columns, but in some cases a slightly longer line 
> improves readability. I’ll revisit these and fix where possible to follow the style
> guide more closely. 

-- 
Regards,

Sakari Ailus

