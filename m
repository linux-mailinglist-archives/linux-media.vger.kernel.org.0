Return-Path: <linux-media+bounces-62657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO6hFhvfEGr2ewYAu9opvQ
	(envelope-from <linux-media+bounces-62657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:56:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB55BB472
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FD6A301E7D0
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 22:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A40392820;
	Fri, 22 May 2026 22:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZffznla"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997B638B130;
	Fri, 22 May 2026 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490530; cv=none; b=pMDDIfEYRtl9Sfsf0/KnwmRnslZWhqohR/+KZN/aB+hYFJGoHXeeviz48m/6MfqxGl5FxfA1QH1PXyPVnLNT1eSbOTwmA+9nJmiJ8wetshYHKDXyiC5wmATo0A+hTT4KlNlLlYcOaOquP/3eDB/wmF47rE+EKSbmrsoW5E/3oUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490530; c=relaxed/simple;
	bh=GRXjugWnFeh1Bp7bv2d0NpeIWu8H/r7HGIU3enNktEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAQUzP2Hu8KFrnIajCGxFCchv2+VLtlclpx04V2sTsoeG8NXa/YdqC91weIswJqKxwXeSWJQtgPZsvKSv2JMuXS1H3KKf0+tJHQbJxs6UzybXipPSWpwTQrd2WfjwylLmFx0ZrgznoEWWu4RBuxyn5p6z/FY3PLJuN5gfFEDL7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZffznla; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779490529; x=1811026529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GRXjugWnFeh1Bp7bv2d0NpeIWu8H/r7HGIU3enNktEo=;
  b=WZffznla3obHUSpvi48B1XM2iI9+YKpg9e75q6uk7STkGndcxxwLLoTL
   EiIbhE5a7hJb3t02gA9PtVwtcRYf7RclRhNrtGiS3yCltyZJ6F0lvT8Un
   MaIrs0C1Rx9fuZnliNkot1MSvoLPJSyRXQCeXv3qH1tiL7uumUIBXYb6P
   +XU3GWYk8YYNeYxvVDCsehtknIEdurhvxessbADRgy47YQ5d5DZDta4vz
   PuhU4ZRfPbCCg1SocU0slW5jlKlV+Yr2pZXOUyd5HNkw/sFoPlFBriiSL
   RZlhKUcYN363gA6J1787zyCa5f00afqj3DOAiOWqc9GUGLFrpXfviTrlG
   w==;
X-CSE-ConnectionGUID: ww8st6k9QGubpddQQBgRvg==
X-CSE-MsgGUID: +i83IkbKSTmmEXOtoXImYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80457962"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="80457962"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 15:55:27 -0700
X-CSE-ConnectionGUID: rfw88WztQ/aLQWqSodH9cg==
X-CSE-MsgGUID: jFGvPUjLQiujp5Si4Pj92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="240198790"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.81])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 15:55:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3CB3311F806;
	Sat, 23 May 2026 01:38:17 +0300 (EEST)
Date: Sat, 23 May 2026 01:38:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Kate Hsuan <hpa@redhat.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Serin Yeh <serin.yeh@intel.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <ahDa2Vj56-S7R6JH@kekkonen.localdomain>
References: <20260522031121.11968-1-hpa@redhat.com>
 <20260522031121.11968-3-hpa@redhat.com>
 <PN3P287MB182919EBD2C36CBBC0A8D8598B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB182919EBD2C36CBBC0A8D8598B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62657-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: D0CB55BB472
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tarang, Kate,

On Fri, May 22, 2026 at 11:12:53AM +0000, Tarang Raval wrote:
> > +/* Exposure control */
> > +#define IMX471_REG_EXPOSURE                    CCI_REG16(0x0202)
> > +#define IMX471_EXPOSURE_MIN                    1
> > +#define IMX471_EXPOSURE_STEP                   1
> > +#define IMX471_EXPOSURE_DEFAULT                        0x04f6
> 
> Better to use a decimal value here.

I'd rather just initialise this to the maximum instead of a fixed value.


...

> > +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct imx471 *sensor = container_of(ctrl->handler,
> > +                                                 struct imx471,
> > +                                                 ctrl_handler);
> 
> Use container_of_const.
> 
> > +       struct v4l2_subdev_state *state =
> > +                       v4l2_subdev_get_locked_active_state(&sensor->sd);
> > +       const struct v4l2_mbus_framefmt *format =
> > +                       v4l2_subdev_state_get_format(state, 0);
> > +       s64 exposure_max;
> > +       int ret;
> 
> ret = 0;

Or assign the return value to ret below. Either works.

> 
> > +
> > +       /* Propagate change of current control to all related controls */
> > +       if (ctrl->id == V4L2_CID_VBLANK) {
> > +               /* Update max exposure while meeting expected vblanking */
> > +               exposure_max =
> > +                       format->height + ctrl->val - IMX471_EXPOSURE_MARGIN;
> > +               __v4l2_ctrl_modify_range(sensor->exposure,
> > +                                        sensor->exposure->minimum,
> > +                                        exposure_max,
> > +                                        sensor->exposure->step,
> > +                                        exposure_max);
> 
> This control operation can fail. Please check the return value.
> 
> > +       }
> > +
> > +       /* V4L2 controls values will be applied only when power is already up */
> > +       if (!pm_runtime_get_if_in_use(sensor->dev))
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN,
> > +                         ctrl->val, &ret);
> 
> You are using ret for the first time here, Please initialize ret with 0 when
> declaring it.
> 
> cci_write() uses the value pointed by &ret to determine whether a previous
> error has already occurred, and an uninitialized ret may contain a garbage
> value, causing the write operation to fail unexpectedly.
> 
> > +               break;
> > +       case V4L2_CID_DIGITAL_GAIN:
> > +               cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_GLOBAL,
> > +                         ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_EXPOSURE:
> > +               cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> > +                         ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_VBLANK:
> > +               /* Update FLL that meets expected vertical blanking */
> > +               cci_write(sensor->regmap, IMX471_REG_FLL,
> > +                         format->height + ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_TEST_PATTERN:
> > +               cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN,
> > +                         ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_HFLIP:
> > +       case V4L2_CID_VFLIP:
> > +               cci_write(sensor->regmap, IMX471_REG_ORIENTATION,
> > +                         sensor->hflip->val | sensor->vflip->val << 1, &ret);
> > +               break;
> > +       default:
> > +               ret = -EINVAL;
> > +               dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
> > +                        ctrl->id, ctrl->val);
> > +               break;
> > +       }
> > +
> > +       pm_runtime_put(sensor->dev);
> > +
> > +       return ret;
> > +}

...

> > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_format *fmt)
> > +{
> > +       struct imx471 *sensor = to_imx471(sd);
> > +       const struct imx471_mode *mode;
> > +       int h_blank;
> > +       u64 pixel_rate;
> > +
> > +       mode = v4l2_find_nearest_size(imx471_modes,
> > +                                     ARRAY_SIZE(imx471_modes),
> > +                                     width, height,
> > +                                     fmt->format.width, fmt->format.height);
> > +
> > +       imx471_update_pad_format(sensor, mode, fmt);
> > +
> > +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> > +
> > +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > +               return 0;
> > +
> > +       if (media_entity_is_streaming(&sensor->sd.entity))
> > +               return -EBUSY;
> > +
> > +       pixel_rate = IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> > +       div_u64(pixel_rate, 10);
> 
> You need to store the return value, as the above operation does not update
> pixel_rate.
> 
> Please use:
> pixel_rate = div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> 
> > +       __v4l2_ctrl_modify_range(sensor->pixel_rate,
> > +                                V4L2_CID_PIXEL_RATE,
> > +                                pixel_rate, 1, pixel_rate);
> > +
> > +       __v4l2_ctrl_modify_range(sensor->vblank,
> > +                                mode->fll_min - mode->height,
> > +                                IMX471_FLL_MAX - mode->height,
> > +                                1,
> > +                                mode->fll_def - mode->height);
> > +
> > +       h_blank = mode->llp - mode->width;
> > +       /*
> > +        * Currently hblank is not changeable.
> > +        * So FPS control is done only by vblank.
> > +        */
> > +       __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > +                                h_blank, 1, h_blank);
> 
> All the above control operations can fail. Please add proper error checks for them.
> 
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx471_get_selection(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_selection *sel)
> > +{
> > +       switch (sel->target) {
> > +       case V4L2_SEL_TGT_CROP:
> > +               sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
> > +               break;
> > +
> > +       case V4L2_SEL_TGT_NATIVE_SIZE:
> > +               sel->r.top = 0;
> > +               sel->r.left = 0;
> > +               sel->r.width = IMX471_NATIVE_WIDTH;
> > +               sel->r.height = IMX471_NATIVE_HEIGHT;
> > +               return 0;
> > +
> > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > +               sel->r.top = IMX471_PIXEL_ARRAY_TOP;
> > +               sel->r.left = IMX471_PIXEL_ARRAY_LEFT;
> > +               sel->r.width = IMX471_PIXEL_ARRAY_WIDTH;
> > +               sel->r.height = IMX471_PIXEL_ARRAY_HEIGHT;
> > +               return 0;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static int imx471_init_state(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *sd_state)
> > +{
> > +       struct v4l2_subdev_format fmt = {
> > +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,

You shouldn't be setting the active format here.

> > +               .format = {
> > +                       .code = MEDIA_BUS_FMT_SRGGB10_1X10,
> > +                       .width = imx471_modes[0].width,
> > +                       .height = imx471_modes[0].height,
> > +               },
> > +       };
> > +
> > +       imx471_set_pad_format(sd, sd_state, &fmt);
> > +
> > +       return 0;

...

> > +static int imx471_check_hwcfg(struct imx471 *sensor)
> > +{
> > +       struct v4l2_fwnode_endpoint bus_cfg = {
> > +               .bus_type = V4L2_MBUS_CSI2_DPHY,
> > +       };
> > +       struct fwnode_handle *ep, *fwnode = dev_fwnode(sensor->dev);
> > +       struct clk *clk;
> > +       unsigned long link_freq_bitmap;
> > +       int ret;
> 
> If you want, you can sort the variable declarations throughout the code, where
> appropriate, by length to make them more readable.
> 
> > +
> > +       clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> > +       if (IS_ERR(clk))
> > +               return dev_err_probe(sensor->dev, PTR_ERR(clk),
> > +                                    "can't get clock frequency\n");
> > +
> > +       if (clk_get_rate(clk) != IMX471_EXT_CLK)
> > +               return dev_err_probe(sensor->dev, -EINVAL,
> > +                                    "external clock %lu is not supported\n",
> > +                                    clk_get_rate(clk));
> > +
> > +       ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > +       ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +       fwnode_handle_put(ep);
> > +       if (ret)
> > +               return dev_err_probe(sensor->dev, ret,
> > +                                    "parsing endpoint failed");
> > +
> > +       ret = v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_frequencies,
> > +                                      bus_cfg.nr_of_link_frequencies,
> > +                                      link_freq_menu_items,
> > +                                      ARRAY_SIZE(link_freq_menu_items),
> > +                                      &link_freq_bitmap);
> 
> This can fail silently. Please add an error message before returning the failure.

v4l2_link_freq_to_bitmap() does print errors already, don't do it here.

> 
> > +
> > +       v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +       return ret;
> > +}

-- 
Regards,

Sakari Ailus

