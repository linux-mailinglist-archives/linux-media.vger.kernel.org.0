Return-Path: <linux-media+bounces-610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 531EF7F18AA
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 17:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A031282406
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 16:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA101DDC3;
	Mon, 20 Nov 2023 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQf7Kj9i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB21B9
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 08:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700497969; x=1732033969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTi5vYUDDtQ7RmJyAG9jDhpXICVVbBy060Vdbz5wQ9E=;
  b=lQf7Kj9ijOA7OC9PN2rOKYtUNcb4OsJYZojkBv63TSLRPUAspEQhctPY
   wmGqgnxKKCKZI1wUrh6ckK2LGnrWwdYCcHfuRvHNNNdHn4pkkEYeCjjYN
   nWZ/XD6wPPLHXO1asQtujQuMSXEiFRLe00K1LsR7yKrDR6pIDt01ccLEi
   WNjgb5Y/IpptS9HJbBwphVULBcZadbk4DYv31C3eo0Ewm8SHXFKwDn6bh
   MRZOquWQTJz3aYTlB/BALSCOYcIuwiZPVR+T5vX3lF5L/TSnHtEMfYZrQ
   lDBBOD2V+8mYQfLEYRZ3to3hJazNYlg+eHY8stkw/5rSuEq8aTEc407HY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382037869"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="382037869"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 08:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013634517"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="1013634517"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 08:32:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 228BA11FAC4;
	Mon, 20 Nov 2023 18:32:34 +0200 (EET)
Date: Mon, 20 Nov 2023 16:32:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ov2740: Add support for external clock
Message-ID: <ZVuKIhNt3NnvzB-G@kekkonen.localdomain>
References: <20231115123817.196252-1-hdegoede@redhat.com>
 <20231115123817.196252-3-hdegoede@redhat.com>
 <229e4b91-8ce4-b82f-1a18-b23de36d5da7@linux.intel.com>
 <61da944f-7a63-4ce5-8387-7dc5267201da@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61da944f-7a63-4ce5-8387-7dc5267201da@redhat.com>

Hi Hans,

On Mon, Nov 20, 2023 at 11:00:14AM +0100, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 11/20/23 05:06, Bingbu Cao wrote:
> > 
> > Hans,
> > 
> > On 11/15/23 8:38 PM, Hans de Goede wrote:
> >> On some ACPI platforms, such as Chromebooks the ACPI methods to
> >> change the power-state (_PS0 and _PS3) fully take care of powering
> >> on/off the sensor.
> >>
> >> On other ACPI platforms, such as e.g. various ThinkPad models with
> >> IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
> >> and the sensor's clock itself.
> >>
> >> Add support for having the driver control an optional clock.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/i2c/ov2740.c | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> >> index e5f9569a229d..0a87d0920eb8 100644
> >> --- a/drivers/media/i2c/ov2740.c
> >> +++ b/drivers/media/i2c/ov2740.c
> >> @@ -3,6 +3,7 @@
> >>  
> >>  #include <asm/unaligned.h>
> >>  #include <linux/acpi.h>
> >> +#include <linux/clk.h>
> >>  #include <linux/delay.h>
> >>  #include <linux/gpio/consumer.h>
> >>  #include <linux/i2c.h>
> >> @@ -336,6 +337,7 @@ struct ov2740 {
> >>  
> >>  	/* GPIOs, clocks */
> >>  	struct gpio_desc *reset_gpio;
> >> +	struct clk *clk;
> >>  
> >>  	/* Current mode */
> >>  	const struct ov2740_mode *cur_mode;
> >> @@ -1068,6 +1070,7 @@ static int ov2740_suspend(struct device *dev)
> >>  	struct ov2740 *ov2740 = to_ov2740(sd);
> >>  
> >>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
> >> +	clk_disable_unprepare(ov2740->clk);
> >>  	return 0;
> >>  }
> >>  
> >> @@ -1075,6 +1078,11 @@ static int ov2740_resume(struct device *dev)
> >>  {
> >>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >>  	struct ov2740 *ov2740 = to_ov2740(sd);
> >> +	int ret;
> >> +
> >> +	ret = clk_prepare_enable(ov2740->clk);
> >> +	if (ret)
> >> +		return ret;
> >>  
> >>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
> >>  	msleep(20);
> >> @@ -1102,6 +1110,10 @@ static int ov2740_probe(struct i2c_client *client)
> >>  		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
> >>  				     "failed to get reset GPIO\n");
> >>  
> >> +	ov2740->clk = devm_clk_get_optional(dev, "clk");
> >> +	if (IS_ERR(ov2740->clk))
> >> +		return dev_err_probe(dev, PTR_ERR(ov2740->clk), "failed to get clock\n");
> >> +
> > 
> > I am not very sure that the 80-char rule is still valid for checkpatch.pl.
> 
> checkpatch.pl defaults to allowing longer lines (<100 chars) now,
> but you are right that the linux-media maintainers prefer 80.
> 
> Still there is an exception to not split strings running
> over the limit and this line ends with a string,
> so I think that this is fine.

The rule is not to split strings in order to satisfy alignment rules. IOW
the line should be wrapped before the string. :-)

-- 
Regards,

Sakari Ailus

