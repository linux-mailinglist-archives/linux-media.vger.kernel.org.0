Return-Path: <linux-media+bounces-59948-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE2aLdLG8WnnkQEAu9opvQ
	(envelope-from <linux-media+bounces-59948-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:52:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 340304915F0
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDE993013704
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9153B9601;
	Wed, 29 Apr 2026 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyaMVGE1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC703A543D;
	Wed, 29 Apr 2026 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452744; cv=none; b=ePUFrqKpRFUoth4HIgW40ZjZimjLCzX7ImDC/QNilBm5EElMoMzhqHrZjNClZS2ljdMI9utBxv0OFkFMe+/EBoqvo1hk4vk0R7YKYUxVDfS7tCRICyJa7RTKcLybQAAF9D8zVQCWCLyrJTnp52UThFw2356shk/kTgX8dn1dGg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452744; c=relaxed/simple;
	bh=uU6Y3gk1xbY3oco84gwHexHH5ZrD6vhTon1ablLx6YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5jL35pm7Z9uLm/XsDp+d4LasUuVP+WJlSONH7Caj/BoZu2D7vVsEldzGRljrN7SgCus8twHdE6rTrVCQeRVCVCGdG/BrNBQWT+bjTx45V47Od2TnorkM2pe24NPwLlOSydQeoDKDGBqEmhvDjaxsGg4WO2s9sZwrXGTwcLiFGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyaMVGE1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777452742; x=1808988742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uU6Y3gk1xbY3oco84gwHexHH5ZrD6vhTon1ablLx6YU=;
  b=nyaMVGE10TYuEr2uku3LTE04we5iDcDWAWhEs/NlWL0Wm9GJWg8C8Wlw
   pdCbIMA/W/d8Y54x3I/IgmMIeWJCxxhRPHRukavlxBjI2vFtPuYa2UGCJ
   H+6McgpiyxUrrDawgPjMsoyU1ZreTtaaymkK1XuEF6nKcc7fOwTd58+G3
   fEZ9RlQjtX2OGqlIYPlC0v033X94gNb7jTJOQekXLqmMvXzxNZtI4MH0L
   uWL+g+BDbijs5rP0w2sO0zoU/nQwvvxy1KKx6fzbTiQOEskYzUtUOSBJw
   smnzfzqEaWlQPosOfDaF/lm2lkCY7fbMaJCLRjHzapmy9JLjXq98Qwv4L
   w==;
X-CSE-ConnectionGUID: tFXgLGKHR/26ydS68yy9HA==
X-CSE-MsgGUID: SIzF3nHlSb66BHHJwlCvjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82242736"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="82242736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 01:52:21 -0700
X-CSE-ConnectionGUID: aKGBknF+ReS/3chqJV3v4A==
X-CSE-MsgGUID: xCbrNcyxT6uuT5UQj76rgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="239201800"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 01:52:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1326E121CB5;
	Wed, 29 Apr 2026 11:52:22 +0300 (EEST)
Date: Wed, 29 Apr 2026 11:52:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/6] media: v4l2-dev: Add range check for vdev->minor
Message-ID: <afHGxs-reZLVABTd@kekkonen.localdomain>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
 <afG2hm-V9uUkUmXk@kekkonen.localdomain>
 <40d31660-73c1-417b-a00c-1a83079943e5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40d31660-73c1-417b-a00c-1a83079943e5@kernel.org>
X-Rspamd-Queue-Id: 340304915F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59948-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email]

Hi Hans,

On Wed, Apr 29, 2026 at 09:53:41AM +0200, Hans Verkuil wrote:
> On 29/04/2026 09:43, Sakari Ailus wrote:
> > Hi Ricardo,
> > 
> > On Tue, Apr 28, 2026 at 12:41:07PM +0000, Ricardo Ribalda wrote:
> >> If the fixed minor ranges are not properly set we could end up in a
> >> situation where the calculated minor is invalid. Add a check for this in
> >> the code.
> >>
> >> This check also fixes the following smatch warning:
> >>
> >> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> >> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> >> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> >>
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> >> index 6ce623a1245a..a731ffdb91ee 100644
> >> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >> @@ -1032,6 +1032,12 @@ int __video_register_device(struct video_device *vdev,
> >>  	vdev->minor = i + minor_offset;
> >>  	vdev->num = nr;
> >>  
> >> +	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> > 
> > Could this be combined with the should-not-happen case below? The error
> > handling is the same (releasing the mutex) and the error code could be as
> > well. I think the message can be just as well removed as we have a
> > WARN_ON() here anyway.
> > 
> > I wonder what Hans thinks.
> 
> I actually prefer to keep it separate. If you combine it, then it is hard
> to see which of the two possibilities is actually wrong (out of range or
> minor in use). And this function sits at the core of V4L2, so it's OK to

Not if they're on different lines as you get the line number with
WARN_ON(). Keeping such code small has benefits.

That being said, I certainly have no strong opinion about this.

> be a bit more verbose.
> 
> I do agree that a pr_err after a WARN_ON is not needed.

-- 
Regards,

Sakari Ailus

