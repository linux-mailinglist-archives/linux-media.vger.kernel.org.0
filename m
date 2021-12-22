Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7B747CF42
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 10:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243929AbhLVJbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 04:31:10 -0500
Received: from mga14.intel.com ([192.55.52.115]:60298 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231653AbhLVJbJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 04:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640165469; x=1671701469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rQ/Cai9x0R34onPyQIivWXgGskbH+Wuk+cpaqorNtU4=;
  b=QcKN9ueXhVRDgwn0/T73PoxNqUpRMOPhLx+DvjdVdcCziyhTI3r4IERc
   nx9zMsaD9hgcLPSyeli2esbspxeRzrh4KhFQ02zhs2uxP2rflYOXPWGjw
   YVq+SvXA+sapIxePTdWGpuIeP0ANpdDECahrQZPdKtSJhJfhuOYYlp8Y7
   Ymb4AaGGZctSKrbLXU9vAXFNy1OLGFJxHrRojfYgGHrAbBWruIFtYitZ5
   TDOiG//WOYSzSHqqc/i9kJvs+gdowMboLiRY2t4RjVqHDPkcMkU1qMNn4
   mSvNB6Bqyw3m++DShh0+O8WCAwIBkHHx12sBlvSyssj0Ue/0kNm71bDZE
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240809227"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="240809227"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 01:31:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="664223439"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 01:31:08 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 42B72201AA;
        Wed, 22 Dec 2021 11:31:06 +0200 (EET)
Date:   Wed, 22 Dec 2021 11:31:06 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 2/2] media: i2c: IMX296 camera sensor driver
Message-ID: <YcLwWiBL2fU8Zwui@paasikivi.fi.intel.com>
References: <20211219220948.28953-1-laurent.pinchart@ideasonboard.com>
 <20211219220948.28953-3-laurent.pinchart@ideasonboard.com>
 <YcHOmEVxvcDwx+M4@paasikivi.fi.intel.com>
 <YcH5RufWI398s232@pendragon.ideasonboard.com>
 <YcJYBKB+Z4XYANgi@paasikivi.fi.intel.com>
 <YcJa53KRgdcEVX2/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcJa53KRgdcEVX2/@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Dec 22, 2021 at 12:53:27AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, Dec 22, 2021 at 12:41:08AM +0200, Sakari Ailus wrote:
> > On Tue, Dec 21, 2021 at 05:56:54PM +0200, Laurent Pinchart wrote:
> > 
> > ,,,
> > 
> > > > > +static int imx296_ctrls_init(struct imx296 *sensor)
> > > > > +{
> > > > > +	struct v4l2_fwnode_device_properties props;
> > > > > +	unsigned int hblank;
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +
> > > > > +	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> > > > > +
> > > > > +	v4l2_ctrl_new_std(&sensor->ctrls, &imx296_ctrl_ops,
> > > > > +			  V4L2_CID_EXPOSURE, 1, 1048575, 1, 1104);
> > > > > +	v4l2_ctrl_new_std(&sensor->ctrls, &imx296_ctrl_ops,
> > > > > +			  V4L2_CID_ANALOGUE_GAIN, IMX296_GAIN_MIN,
> > > > > +			  IMX296_GAIN_MAX, 1, IMX296_GAIN_MIN);
> > > > > +
> > > > > +	/*
> > > > > +	 * Horizontal blanking is controlled through the HMAX register, which
> > > > > +	 * contains a line length in INCK clock units. The INCK frequency is
> > > > > +	 * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
> > > > 
> > > > It seems the driver supports other values, too. Shouldn't this be the
> > > > actual frequency?
> > > 
> > > That's not clear to me from the documentation I have access to :-( It's
> > > quite convoluted, there are a few examples from which I tried to infer
> > > what was going on, but no clear explanation. My board uses a fixed clock
> > > frequency of 37.125MHz so I can't test other values.
> > > 
> > > Can we start with this and update it later if we can figure out more
> > > (assuming there's an issue, it may actually be correct already) ?
> > 
> > Sounds reasonable. I was just wondering.
> > 
> > > > > +	 * convert it to a number of pixels based on the nominal pixel rate.
> > > > > +	 */
> > > > > +	hblank = 1100 * 1188000000ULL / 10 / 74250000
> > > > > +	       - IMX296_PIXEL_ARRAY_WIDTH;
> > > > > +	sensor->hblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx296_ctrl_ops,
> > > > > +					   V4L2_CID_HBLANK, hblank, hblank, 1,
> > > > > +					   hblank);
> > > > > +	if (sensor->hblank)
> > > > > +		sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > +
> > > > > +	sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx296_ctrl_ops,
> > > > > +					   V4L2_CID_VBLANK, 30,
> > > > > +					   1048575 - IMX296_PIXEL_ARRAY_HEIGHT,
> > > > > +					   1, 30);
> > > > > +	/*
> > > > > +	 * The sensor calculates the MIPI timings internally to achieve a bit
> > > > > +	 * rate between 1122 and 1198 Mbps. The exact value is unfortunately not
> > > > > +	 * reported, at least according to the documentation. Report a nominal
> > > > > +	 * rate of 1188 Mbps as that is used by the datasheet in multiple
> > > > > +	 * examples.
> > > > > +	 */
> > > > > +	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> > > > > +			  1122000000 / 10, 1198000000 / 10, 1, 1188000000 / 10);
> > > > 
> > > > What about the link frequency?
> > > > 
> > > > Is this value constant for the sensor? Or should there be a list of
> > > > hardware supported link frequencies?
> > > 
> > > It seems to be constant, but again the documentation is fairly unclear.
> > 
> > Ack.
> > 
> > ...
> > 
> > > > > +static int __maybe_unused imx296_runtime_resume(struct device *dev)
> > > > > +{
> > > > > +	struct i2c_client *client = to_i2c_client(dev);
> > > > > +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > > > +	struct imx296 *sensor = to_imx296(subdev);
> > > > > +
> > > > > +	return imx296_power_on(sensor);
> > > > > +}
> > > > > +
> > > > > +static int __maybe_unused imx296_runtime_suspend(struct device *dev)
> > > > > +{
> > > > > +	struct i2c_client *client = to_i2c_client(dev);
> > > > > +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > > > +	struct imx296 *sensor = to_imx296(subdev);
> > > > > +
> > > > > +	imx296_power_off(sensor);
> > > > > +
> > > > > +	return 0;
> > > > 
> > > > I'd merge these two with imx296_power_o{n,ff}.
> > > 
> > > That would require calling imx296_runtime_resume() and
> > > imx296_runtime_suspend() in probe() and remove(), which I don't really
> > > like. I'd prefer keeping the functions separate.
> > 
> > You could keep calling the functions imx296_power_o{n,ff}. There's really
> > no need for two pairs of functions doing the same things.
> 
> imx296_power_on() is called in probe() before the subdev is initialized,
> so the i2c_get_clientdata() call in imx296_runtime_resume() would fail.
> It may be possible to refactor the probe() function to fix this, but I
> think that explicit power on/off calls in probe() are clearer than
> calling the pm runtime resume and suspend handlers.

They're doing exactly the same things, powering the device on and off. The
fact that it's used as a runtime PM callback as well as called directly
doesn't change its nature.

Most other drivers do it this way actually. What it'd take is a call to
v4l2_i2c_subdev_init() before powering the sensor on.

-- 
Kind regards,

Sakari Ailus
