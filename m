Return-Path: <linux-media+bounces-56118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNBeFEuVuWkJKwIAu9opvQ
	(envelope-from <linux-media+bounces-56118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:54:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCA42B0518
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA0B5301CD88
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3BE332628;
	Tue, 17 Mar 2026 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NF3m8e2O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C837BE96;
	Tue, 17 Mar 2026 17:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770042; cv=none; b=OLc65J3SzOr/ik5ic7KOOuXI3NFuD+/rGOYLj83zTN4tg11DeNpqZlsY3S9eyXW+KN5ingaZTxc9px3OI03I76RLdbacPHBYGmdh8hV327CyhbgFlcxQAL9xUCv9KRIiYfdc7n6PDxwEW6zYZY97Z2qaDtD3HVRV+6d8kbx0Ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770042; c=relaxed/simple;
	bh=1AcqHamz6LWrdQ8YfjZrM5I+jqHRWQZtOZszs+Mv5nE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R98iVrCPpIkgh4JbIF8Cj6BlN5bFHKn9b45bqiHbZs/vEO0c/4sak/Ay0YVF2pzDv+eRTnzOpJi5UOznnLXCDAO7IHvUUntxjWqMdiGljshB0rpSJ0DqhllWfd+cfn8/l4vn1UpzTM3tFF+cQR8M5gObU3VPI9A/734cCYFGUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NF3m8e2O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773770041; x=1805306041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1AcqHamz6LWrdQ8YfjZrM5I+jqHRWQZtOZszs+Mv5nE=;
  b=NF3m8e2OWnSwlwNiFg6bs/aC/paNNqjqNO+2EWUBFLB5LhjKzf15/zYG
   lxHUjdv2AhB1+pDmL50Dyt4cPRZU/u4I75ynpjbIBnHluGo3lb1oT0lhf
   p0XWKPwsqE7L5YM2wKZ57O5zhCHVoZeRvQ6FPaSMHgljoyOQRdZy2NSGe
   M2rSdEyhRznfZaABMDwdXx/+UCyiFz+s938HMzXeyJQ4A9dE4TPuOFTET
   YFAU7zBuhZNOpyaFcFsB3UBVihSqiT4aiaRKSNIqQ8H7Bi6LOQV7alW2H
   hXWYAAdsodz+/8DtxRbUFqiePnlToRS0vpyyV2SYr1bFBjaNZjBeQF6mx
   w==;
X-CSE-ConnectionGUID: 2hKnZCxWSEa8sEgx+Xaimw==
X-CSE-MsgGUID: dm22fJFcSymDuXy0BW2Bww==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78708118"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78708118"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:54:00 -0700
X-CSE-ConnectionGUID: 9V79YYK9SZiVeNnZUQaEJA==
X-CSE-MsgGUID: CfsG6PP3Tue5FVvqaXPjDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222400745"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.193])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:53:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8664F120233;
	Tue, 17 Mar 2026 19:53:52 +0200 (EET)
Date: Tue, 17 Mar 2026 19:53:52 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
Message-ID: <abmVMOR9MMpTtj98@kekkonen.localdomain>
References: <20260316085704.352669-1-hpa@redhat.com>
 <abh9evUPzozh40k-@kekkonen.localdomain>
 <CAEth8oHPaWg9U5GWSeF4R5FmKfgxdxE3jfPut8egP=8c5oxHJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oHPaWg9U5GWSeF4R5FmKfgxdxE3jfPut8egP=8c5oxHJw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56118-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: BFCA42B0518
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kate,

On Tue, Mar 17, 2026 at 09:24:20PM +0800, Kate Hsuan wrote:
> Hi Sakari,
> 
> Thank you for reviewing it.
> 
> And thank you, Hans
> 
> On Tue, Mar 17, 2026 at 6:00 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Kate,
> >
> > Thanks for the patch.
> >
> > Where have you seen this sensor being used, if I may ask?
> 
> It can be found on the Xiaomi Pad2 that is based on an Intel Cherry
> Trail platform.

Ack, thanks for the info!

> > > +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka3_data *sensor)
> > > +{
> > > +     struct v4l2_subdev_state *active_state =
> > > +             v4l2_subdev_get_locked_active_state(&sensor->sd);
> > > +
> > > +     return v4l2_subdev_state_get_format(active_state, 0);
> > > +}
> > > +
> > > +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sensor)
> > > +{
> > > +     struct v4l2_subdev_state *active_state =
> > > +             v4l2_subdev_get_locked_active_state(&sensor->sd);
> > > +
> > > +     return v4l2_subdev_state_get_crop(active_state, 0);
> >
> > Please avoid adding such helpers.
> As Hans mentioned, we can put active format and crop in the t4ka3_data
> or keep the helpers.

What prevents you doing:

	struct v4l2_subdev_state *active_state =
		v4l2_subdev_get_locked_active_state(&sensor->sd);
	struct v4l2_rect *r = v4l2_subdev_state_get_crop(active_state, 0);

in the code? In a lot of the cases you could simply pass the state to the
function using it as the caller already has it.

It also seems the driver operates in active state whereas any state should
be valid. In general, file handle specific try state should resemble the
active state as much as possible with the exception that it won't be
applied to hardware.

In the long run I'd also expect the control values to move to state.

...

> > > +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +     struct t4ka3_data *sensor = ctrl_to_t4ka3(ctrl);
> > > +     struct v4l2_mbus_framefmt *fmt;
> > > +     int ret;
> > > +
> > > +     /* Update exposure range on vblank changes */
> > > +     if (ctrl->id == V4L2_CID_VBLANK) {
> > > +             ret = t4ka3_update_exposure_range(sensor);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     fmt = t4ka3_get_active_format(sensor);
> >
> > You could assign this in declaration.
> Okay
> >
> > > +
> > > +     /* Only apply changes to the controls if the device is powered up */
> > > +     if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> > > +             t4ka3_set_bayer_order(sensor, fmt);
> >
> > Does this call belong here?
> I think it can be. It is a simple update of t4ka3_hv_flip_bayer_order.

Why are you doing it here? It basically assigns the Bayer order to the
active format based on the flipping controls. Why not to do that when
changing the flipping controls?

> >
> > > +             return 0;
> > > +     }
> > > +
> > > +     switch (ctrl->id) {
> > > +     case V4L2_CID_TEST_PATTERN:
> > > +             ret = t4ka3_test_pattern(sensor, ctrl->val);
> > > +             break;
> > > +     case V4L2_CID_VFLIP:
> > > +             ret = t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_VFLIP_BIT);
> > > +             break;
> > > +     case V4L2_CID_HFLIP:
> > > +             ret = t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_HFLIP_BIT);
> > > +             break;
> > > +     case V4L2_CID_VBLANK:
> > > +             ret = cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES,
> > > +                             fmt->height + ctrl->val, NULL);
> > > +             break;
> > > +     case V4L2_CID_EXPOSURE:
> > > +             ret = cci_write(sensor->regmap, T4KA3_REG_COARSE_INTEGRATION_TIME,
> > > +                             ctrl->val, NULL);
> > > +             break;
> > > +     case V4L2_CID_ANALOGUE_GAIN:
> > > +             ret = cci_write(sensor->regmap, T4KA3_REG_GLOBAL_GAIN,
> > > +                             ctrl->val, NULL);
> > > +             break;
> > > +     default:
> > > +             ret = -EINVAL;
> > > +             break;
> > > +     }
> > > +
> > > +     pm_runtime_put(sensor->sd.dev);
> >
> > Newline here?
> Okay
> >
> > > +     return ret;
> > > +}

...

> > > +static int t4ka3_disable_stream(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> > > +                             u32 pad, u64 streams_mask)
> > > +{
> > > +     struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> > > +     int ret;
> > > +
> > > +     ret = cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
> > > +     pm_runtime_put(sensor->sd.dev);
> > > +     sensor->streaming = 0;
> > > +     return ret;
> >
> > Return 0 here but complain about it.
> Do you mean return 0 here and print a message when ret != 0?

Yes, please.

...

> > > +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
> > > +{
> > > +     struct fwnode_handle *fwnode = dev_fwnode(sensor->dev);
> > > +     struct v4l2_fwnode_endpoint bus_cfg = {
> > > +             .bus_type = V4L2_MBUS_CSI2_DPHY,
> > > +     };
> > > +     struct fwnode_handle *endpoint;
> > > +     unsigned long link_freq_bitmap;
> > > +     int ret;
> > > +
> > > +     /*
> > > +      * Sometimes the fwnode graph is initialized by the bridge driver.
> > > +      * Bridge drivers doing this may also add GPIO mappings, wait for this.
> > > +      */
> >
> > No need for such a comment.
> I'll drop it.
> 
> >
> > > +     endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > +     if (!endpoint)
> > > +             return dev_err_probe(sensor->dev, -EPROBE_DEFER,
> > > +                                  "waiting for fwnode graph endpoint\n");
> >
> > This
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=cleanup&id=8181d18d45d593d8499cbf0e83de08c6d913516c>
> > will be merged soon.
> Does it mean "return  -EPROBE_DEFER;" is enough?

You can omit checking for errors here.

> >
> > > +
> > > +     ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > > +     fwnode_handle_put(endpoint);
> > > +     if (ret)
> > > +             return ret;

...

> > > +static int t4ka3_pm_resume(struct device *dev)
> > > +{
> > > +     struct t4ka3_data *sensor = dev_get_drvdata(dev);
> > > +     u16 sensor_id;
> > > +     int ret;
> > > +
> > > +     usleep_range(5000, 6000);
> > > +
> > > +     gpiod_set_value_cansleep(sensor->powerdown_gpio, 0);
> > > +     gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> > > +
> > > +     /* waiting for the sensor after powering up */
> > > +     msleep(20);
> >
> > fsleep() maybe?
> I can change it.
> >
> > > +
> > > +     ret = t4ka3_detect(sensor, &sensor_id);
> > > +     if (ret) {
> > > +             dev_err(sensor->dev, "sensor detect failed\n");
> > > +             return ret;
> >
> > What about gpio values in this case?
> both powerdown_gpio and reset_gpio are 0 when resuming and 1 when suspended.
> t4ka3_detect() reads the sensor name through i2c. If it finds the
> product ID then return 0;

What if t4ka3_detect() returns an error? What happens then?

-- 
Kind regards,

Sakari Ailus

