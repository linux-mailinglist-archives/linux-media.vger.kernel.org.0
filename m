Return-Path: <linux-media+bounces-62265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD1MFQClDWpM0wUAu9opvQ
	(envelope-from <linux-media+bounces-62265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:11:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C1F58D60B
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CD3E30E78BA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853323DCD8B;
	Wed, 20 May 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqoZ4dmu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196AF3DD51F;
	Wed, 20 May 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278547; cv=none; b=dkb6V+ioY8r9KOMFsz2OYr7wg13BrEgTSEnhdc3ZnlSpnqKyeupgHfkiMjyvJ3Oaw39BjdL83Ha9GMfKvvKiZP/CT0vMGsH/6OlROKt7+T/9RIUP1gi95ZYTah/cGTZ3aL8TX/SQojWPp8D84elObMZftR16VGllmY0MSgkyeQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278547; c=relaxed/simple;
	bh=cQmfLJSc40bDBXP/fgWlHQ8o57Tl2yyI+creHsRHiRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KU3raI3nFZ9+UQKrRQJuYqEzDUAuKMIH6R4UXp2UgYXNrGIaw3fk/QWmHH4z1Xs3bU0ydTiWQdmST2Qef4cjaNg5hhex8ZUL3OBdV6AY5LjpIdd+jj8y7GNeHj494s4ysyHLmT5VwILtXm7wgBqoaR8r0/XaFEqWvE4FL+Z9/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqoZ4dmu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779278547; x=1810814547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cQmfLJSc40bDBXP/fgWlHQ8o57Tl2yyI+creHsRHiRA=;
  b=dqoZ4dmuL+64A8jD40u5U0WEo3VMtuZKCwAZWm48HYLu2Qbo8C4K0jDm
   zRhoi52gE6+k1sr2+6Sj/kiotf28sN85zzAP1WewWbhh2dexXkVTo+ew6
   WqKdn8UVKQpYkI2/COMOt6afI/y5a1ew/ilbXVFlyR4A5ms8H/5xCmr1S
   Dx3j6kt+wwxC42g+88RME19VWrhh/Mh2kkBseFnRyFZFXw0gIqkP31NVj
   tjlhaUFOR/I+EE931rw0I6Resn+UMMt5sARplZq4ix/x0NlCFDxuGDRSI
   2WfE8TTn9Y8fGmGezesZfBSiC10F4QpMYNryOu5fWt/+EcMc68YbeRnQU
   w==;
X-CSE-ConnectionGUID: zh4D4fOSQyCaAqbe4vgtqQ==
X-CSE-MsgGUID: v3Yn7gJWRKerWSuqxgruBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90470726"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="90470726"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:02:26 -0700
X-CSE-ConnectionGUID: QAQqgWdBRT+zMt5bNQa1bA==
X-CSE-MsgGUID: +A8kp5Z5Tryqt3+zsLsuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245137103"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:02:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EE9A711F851;
	Wed, 20 May 2026 15:02:19 +0300 (EEST)
Date: Wed, 20 May 2026 15:02:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>, Ma Ke <make24@iscas.ac.cn>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-dev: do not fire driver's release on
 __video_register_device() failure
Message-ID: <ag2iy5fRlZJLYijT@kekkonen.localdomain>
References: <20260520090624.1071139-1-lgs201920130244@gmail.com>
 <20260520093421.GA215344@killaraus.ideasonboard.com>
 <14ab929b-f236-48cf-a022-f424fa1e0c1e@kernel.org>
 <20260520104816.GB215344@killaraus.ideasonboard.com>
 <00110771-c722-4208-a0e8-48819952e992@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00110771-c722-4208-a0e8-48819952e992@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,kernel.org,iscas.ac.cn,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62265-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: E3C1F58D60B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Wed, May 20, 2026 at 01:26:30PM +0200, Hans Verkuil wrote:
> On 20/05/2026 12:48, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > On Wed, May 20, 2026 at 12:01:46PM +0200, Hans Verkuil wrote:
> >> On 20/05/2026 11:34, Laurent Pinchart wrote:
> >>> On Wed, May 20, 2026 at 05:06:24PM +0800, Guangshuo Li wrote:
> >>>> video_register_device() / __video_register_device() registers vdev->dev
> >>>> with device_register(). Before the call the video core sets
> >>>>
> >>>> 	vdev->dev.release = v4l2_device_release;
> >>>>
> >>>> v4l2_device_release() invokes vdev->release(vdev) as its last step, and
> >>>> the driver's vdev->release hook is commonly video_device_release(), which
> >>>> kfree()s the vdev that the driver allocated with video_device_alloc().
> >>>>
> >>>> When device_register() fails inside __video_register_device() the core
> >>>> does
> >>>>
> >>>> 	put_device(&vdev->dev);
> >>>> 	return ret;
> >>>>
> >>>> which drops the only reference and fires the v4l2_device_release()
> >>>> chain:
> >>>>
> >>>>   __video_register_device()
> >>>>     device_register() -> -E*
> >>>>     put_device(&vdev->dev)
> >>>>       -> v4l2_device_release()
> >>>>          -> vdev->release(vdev)
> >>>>             -> video_device_release(vdev)   /* kfree(vdev), free #1 */
> >>>>
> >>>> video_register_device() returns the error to the driver. Drivers that
> >>>> follow the documented ownership contract release vdev on their own error
> >>>> path, e.g.
> >>>>
> >>>>   driver_probe()
> >>>>     if (video_register_device(vdev, ...))
> >>>>       goto err_release_vdev;
> >>>>     ...
> >>>>   err_release_vdev:
> >>>>     video_device_release(vdev);   /* free #2 -- DOUBLE FREE */
> >>>>
> >>>> This is the contract documented in
> >>>> Documentation/driver-api/media/v4l2-dev.rst: the driver owns vdev and
> >>>> is responsible for releasing it if video_register_device() fails. As
> >>>> Hans Verkuil pointed out, the right place to fix this is the v4l2 core
> >>>> rather than every individual driver, because drivers are expected to
> >>>> follow the documented ownership contract.
> >>>>
> >>>> Neutralise vdev->release around put_device() in the device_register()
> >>>> failure path so the device core cleanup does not run the driver's
> >>>> release hook. The driver-supplied release is restored before returning
> >>>> so the caller can release vdev according to the documented contract.
> >>>> Successful registration is unchanged, so the normal teardown sequence
> >>>> continues to call the driver's release hook and free vdev exactly once on
> >>>> unregister.
> >>>>
> >>>> Fixes: 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()")
> >>>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> >>>> ---
> >>>>  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
> >>>>  1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> >>>> index 6ce623a1245a..73648549eb2a 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >>>> @@ -1075,9 +1075,14 @@ int __video_register_device(struct video_device *vdev,
> >>>>  	mutex_lock(&videodev_lock);
> >>>>  	ret = device_register(&vdev->dev);
> >>>>  	if (ret < 0) {
> >>>> +		void (*release)(struct video_device *) = vdev->release;
> >>>> +
> >>>>  		mutex_unlock(&videodev_lock);
> >>>>  		pr_err("%s: device_register failed\n", __func__);
> >>>> +
> >>>> +		vdev->release = video_device_release_empty;
> >>>>  		put_device(&vdev->dev);
> >>>> +		vdev->release = release;
> >>>
> >>> That looks like a big hack. There must be something wrong somewhere else
> >>> in the design.
> >>
> >> There is, unfortunately the design was wrong since the beginning of V4L2.
> >>
> >> Documentation/driver-api/media/v4l2-dev.rst explicitly says that you should use:
> >>
> >>         err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >>         if (err) {
> >>                 video_device_release(vdev); /* or kfree(my_vdev); */
> >>                 return err;
> >>         }
> >>
> >> So everyone does that. Luckily device_register never fails in practice (you probably have
> >> bigger problems if it fails then just a double-free).
> >>
> >> The reality is that we don't handle this failure well at all, and this change wouldn't
> >> help in all cases either. E.g. drivers/media/platform/renesas/renesas-ceu.c actually relies
> >> on the release() callback in that it doesn't call video_device_release().
> >>
> >> But then it would fail on the v4l2_err(vdev->v4l2_dev, ...) call since vdev would be freed
> >> already.
> >>
> >> There are probably more drivers like that. (drivers/media/i2c/video-i2c.c)
> >>
> >> I'm not sure what is wisdom here.
> >>
> >> See also commit 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()"),
> >> which is where the put_device was introduced in the first place.
> >>
> >> Perhaps that should be reverted instead?
> > 
> > If we want a short term fix I think that would be better.
> > 
> > Have you seen
> > https://lore.kernel.org/all/aeCOdWLaVpH-5w8s@hovoldconsulting.com/ ?
> 
> I hadn't seen it. Interesting.
> 
> > 
> > Having an API contract different from device_register() will likely
> > cause issues one way or another.
> 
> Looking closely how the driver core works and what commit 2a934fdb01db changed,
> I think this might fix it:
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 5516b2bbb08f..6ffd385e880f 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1071,25 +1071,27 @@ int __video_register_device(struct video_device *vdev,
>  	vdev->dev.class = &video_class;
>  	vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
>  	vdev->dev.parent = vdev->dev_parent;
> -	vdev->dev.release = v4l2_device_release;
>  	dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
> 
> -	/* Increase v4l2_device refcount */
> -	v4l2_device_get(vdev->v4l2_dev);
> -
>  	mutex_lock(&videodev_lock);
>  	ret = device_register(&vdev->dev);
>  	if (ret < 0) {
>  		mutex_unlock(&videodev_lock);
>  		pr_err("%s: device_register failed\n", __func__);
>  		put_device(&vdev->dev);
> -		return ret;
> +		goto cleanup;
>  	}
> +	/* Register the release callback that will be called when the last
> +	   reference to the device goes away. */
> +	vdev->dev.release = v4l2_device_release;
> 
>  	if (nr != -1 && nr != vdev->num && warn_if_nr_in_use)
>  		pr_warn("%s: requested %s%d, got %s\n", __func__,
>  			name_base, nr, video_device_node_name(vdev));
> 
> +	/* Increase v4l2_device refcount */
> +	v4l2_device_get(vdev->v4l2_dev);
> +
>  	/* Part 5: Register the entity. */
>  	ret = video_register_media_controller(vdev);
> 
> This mostly reverts 2a934fdb01db, except that we keep the put_device.
> But when this is called, vdev->dev.release isn't set yet, so it only
> frees the device-related data (device_release in drivers/base/core.c).
> 
> Am I missing something?

I guess this could be workable. This way the caller knows the release
callback won't be called.

Regarding error handling, the return value from
video_register_media_controller() is ignored. It'd probably be good to fix
that in a separate patch though. I could submit one as well.

-- 
Regards,

Sakari Ailus

