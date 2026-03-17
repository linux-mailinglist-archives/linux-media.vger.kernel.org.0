Return-Path: <linux-media+bounces-56119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNjaEVqWuWkJKwIAu9opvQ
	(envelope-from <linux-media+bounces-56119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:58:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2602B06EB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1B3D3031218
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E0237CD52;
	Tue, 17 Mar 2026 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhQERqYe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159935A39C;
	Tue, 17 Mar 2026 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770325; cv=none; b=Rs17o4Z74x0Kdw8dzvJOZQDN2EZpDiECYuT8lnD5keSx3H9ajbS7pxN1mz9Wtuv4oy1zJMH9XCv+2FgXFRb1oiAI5okFoHY0f6r7VrOUqkmuEb+LpNN1w6tfyETbZcBvBRYMXNWYmEz/z9jnv23OkZMeuDfaaKFFYC5q7twUkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770325; c=relaxed/simple;
	bh=K2IdV+Uw720kiDHmMFNs0it5nPZAGND5AxnJgazGq1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFxQ9INk2dSMU43ylJ2YLulbJSINInAgN79bukc8gPWMW6vvlilwxIAcIZ3TGlCFCPoTt9kemhoRcsuT5LB42jRUQt+kpjq8VbJrlEkar8AXwBGAf/CHeALwHTMdMM04OfCiEdH5MPploizmfr5gh2uc+bAY50sFGQLIbZB3kwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhQERqYe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773770324; x=1805306324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K2IdV+Uw720kiDHmMFNs0it5nPZAGND5AxnJgazGq1s=;
  b=lhQERqYe9og9KZAS8f2+YB97muGpiqsTmFwp2czpuBHs2YlDWShnNa6R
   MRCAnEZi+cKDMQYK35dYX5bAw7MTI9kMJlNmycUhuXTFvzw0w5fJHmaNd
   +/Kqdh5QeTph8CW+9/88N620Z3/sHD0BHg73D4IL3paCzp36W0ZrtOpMZ
   o0syBONTFccNw5jQfIbEt0LTXbeA0cf2Udt/5rTYEK9LJR6+kK/3TklGy
   GLCKRMGgpoclI3IvMbhwWNpC7kQF4aMG7t59ANwnPTTJn+w5PxJ81VP1+
   OgUxf0SuTe6cklGZeOLMUGRGp7Q9YrnyzJVVY1fhoL97QZEwyc6LKBbIs
   A==;
X-CSE-ConnectionGUID: 8pNZJn4hTXOMUiYAnl+YkA==
X-CSE-MsgGUID: HaXhRqy3QEuqwhviARVdCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86167810"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="86167810"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:58:43 -0700
X-CSE-ConnectionGUID: TcJk3eyjSYmAa4TFSyPAtg==
X-CSE-MsgGUID: KR0r6WE3REy5pci+7SKiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="245366436"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.193])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:58:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6A21B120233;
	Tue, 17 Mar 2026 19:58:40 +0200 (EET)
Date: Tue, 17 Mar 2026 19:58:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
Message-ID: <abmWUIIxCq1xcZ5m@kekkonen.localdomain>
References: <20260316085704.352669-1-hpa@redhat.com>
 <abh9evUPzozh40k-@kekkonen.localdomain>
 <a3f89715-b937-4858-9a44-8d8d634cf97a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3f89715-b937-4858-9a44-8d8d634cf97a@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56119-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: DD2602B06EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Tue, Mar 17, 2026 at 01:24:57PM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 16-Mar-26 23:00, Sakari Ailus wrote:
> 
> <snip>
> 
> >> diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
> >> new file mode 100644
> >> index 000000000000..d9af5e51f7a8
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/t4ka3.c
> 
> <snip>
> 
> >> +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka3_data *sensor)
> >> +{
> >> +	struct v4l2_subdev_state *active_state =
> >> +		v4l2_subdev_get_locked_active_state(&sensor->sd);
> >> +
> >> +	return v4l2_subdev_state_get_format(active_state, 0);
> >> +}
> >> +
> >> +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sensor)
> >> +{
> >> +	struct v4l2_subdev_state *active_state =
> >> +		v4l2_subdev_get_locked_active_state(&sensor->sd);
> >> +
> >> +	return v4l2_subdev_state_get_crop(active_state, 0);
> > 
> > Please avoid adding such helpers.
> 
> The problem is that we need to know the active-fmt/-crop in some places
> without access to it. E.g. when the vblank ctrl gets set this influences
> the range of the exposure control, so we need active_fmt.height to
> calculate the values to pass to v4l2_ctrl_modify_range() and we need
> this from a v4l2_ctrl_ops.s_ctrl callback which does not get passed
> in the (active) fmt.
> 
> Since the ctrl lock is used as the main sensor-driver lock too, 
> we can always safely call v4l2_subdev_get_locked_active_state()
> in these cases, since we are always holding the lock.

I replied to Kate's e-mail already, but indeed you should get the active
state if you really need the active state. In a lot of cases it's "any"
state which is already available to the caller of these functions.

> 
> The alternative would be to store a copy of the active fmt/crop
> inside struct t4ka3_data, but I thought that the whole direction
> for sensor drivers was to stop having (and needing to update) their
> own shadow copy of the active_state and instead direct use
> the active_state ?

Correct.

> 
> <snip>
> 
> >> +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
> >> +{
> >> +	struct t4ka3_data *sensor = ctrl_to_t4ka3(ctrl);
> >> +	struct v4l2_mbus_framefmt *fmt;
> >> +	int ret;
> >> +
> >> +	/* Update exposure range on vblank changes */
> >> +	if (ctrl->id == V4L2_CID_VBLANK) {
> >> +		ret = t4ka3_update_exposure_range(sensor);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >> +	fmt = t4ka3_get_active_format(sensor);
> > 
> > You could assign this in declaration.
> > 
> >> +
> >> +	/* Only apply changes to the controls if the device is powered up */
> >> +	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> >> +		t4ka3_set_bayer_order(sensor, fmt);
> > 
> > Does this call belong here?
> 
> Yes, if the hflip/vflip controls change then fmt->code needs to be
> updated to the now changed bayer-order. t4ka3_set_bayer_order()
> uses the cached ctrl->val values so it is cheap enough to
> always do this instead of checking if the changed ctrl is
> vflip or hflip.
> 
> In case the sensor is actually streaming and we don't hit this path,
> the t4ka3_t_vflip()helper will return -EBUSY since changing
> the active fmt while streaming is not a good idea.
> 
> Looking at this again, I do think that: t4ka3_t_vflip() should
> be renamed to t4ka3_update_hvflip() because the current name
> is weird.

This should also apply to non-active state (albeit implementation requires
implementing get_fmt locally). This will get "fixed" with the metadata
series eventually with generic raw formats.

-- 
Kind regards,

Sakari Ailus

