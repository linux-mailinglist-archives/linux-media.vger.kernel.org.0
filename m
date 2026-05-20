Return-Path: <linux-media+bounces-62283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEdCMIOvDWrW1QUAu9opvQ
	(envelope-from <linux-media+bounces-62283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:56:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EC358E543
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 380B03009F56
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2592F3D47B1;
	Wed, 20 May 2026 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kU2Bj673"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA9F3E0C56
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281787; cv=none; b=FdNm0+yUaugwK6vL3jKhHVwIl7+Ygkb2/2HqbKJ6T51lW5HBZJX0q9Mn/R0bG7m7/y3TqIZwT5mLJUzsVRjBRvbTSwqfQZVwIxFJh1JGuPyXSnFq4QShwNDDo8rpqQfda+hUtshDukmrHLIuEB7Xfmm8YyhjheskSV9n5OGVR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281787; c=relaxed/simple;
	bh=hdH3cjVY/JTWX21aOyjtlBnca6HKVp819HXh+lsFQjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bupY4veX1S643o9EOJNpJEvWqOu/Ms0vimMee2MkvLJAhT+BGRSLQ8m4vJ6kHN+CcpnehJkAHzoVrYfv7bMfl1fIetYu8bbuXBkZoYN/Oat+J51MzZuyexX//5eiprP3WYB6eyvVfl4BduO8HrowhoeZYIBaSfdTHaE6eCRqQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kU2Bj673; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779281786; x=1810817786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hdH3cjVY/JTWX21aOyjtlBnca6HKVp819HXh+lsFQjE=;
  b=kU2Bj6733l4yz/Ru3u+vQCazuzeEkS57pyjt/plPI5L3wcV9e5grmCpe
   3Sgo/GN0AQM8YfdQeZuAvyypOaoBDcetcXBZT/ONehXYzZeU0qG1Z1umG
   TgZrW2WK0I5BPEwVg9zDYhqoM8qyE3RGY/cPvVPJhrLiW8rhwQccVNNIV
   L2iI+/JaOD0GGIfSjAB3aTfkWHMz84AGP/TRmxvFQ1NmnW6Fi+6Clnfx9
   yKsdoZ2f1MegCC/KIFHlJKwsgoZ7fuL9htlpad64QyQufG+PLZEI7fMTv
   tqYetb/bzY68GVNJ3+Mo4zv4vSnw3avr1Hn6g/ufav94YclJ7A4xAa1Jy
   Q==;
X-CSE-ConnectionGUID: RKhfx1zCRs+XyiDqyoEyxg==
X-CSE-MsgGUID: 4jNTb8pxRommcd3fGJfiWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90873625"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="90873625"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:56:25 -0700
X-CSE-ConnectionGUID: 1YmrDU4eR8WrBe965pB0Zg==
X-CSE-MsgGUID: 9aohBLr4R5mqns9rNl+SeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="240420160"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:56:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9372911F851;
	Wed, 20 May 2026 15:56:19 +0300 (EEST)
Date: Wed, 20 May 2026 15:56:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 04/17] media: v4l2-subdev: Allow releasing frame
 descriptors on return
Message-ID: <ag2vczfVp5mbIvJI@kekkonen.localdomain>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-5-sakari.ailus@linux.intel.com>
 <agzXbQpxTuXx3Tqe@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agzXbQpxTuXx3Tqe@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62283-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,kekkonen.localdomain:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 69EC358E543
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

Thanks for the review.

On Tue, May 19, 2026 at 05:34:37PM -0400, Frank Li wrote:
> On Mon, May 18, 2026 at 07:43:04PM +0300, Sakari Ailus wrote:
> > Use DEFINE_FREE() to allow using __free() to release frame descriptors
> > using v4l2_subdev_free_frame_desc().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-subdev.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e7127953ac22..c10ca3f5d979 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1798,6 +1798,11 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >   * for each frame descriptor obtained by calling this function using
> >   * v4l2_subdev_free_frame_desc().
> >   *
> > + * Use __free() to release the frame descriptor automatically::
> > + *
> > + *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
> > + *            v4l2_subdev_get_frame_desc(sd, pad, desc);
> > + *
> 
> Generally, _get*()/_put*() is well known resource manage pair function
>            _alloc()/_free() is pair.
>            _request/_free()
> 
> Is it a little better v4l2_subdev_request_frame_desc() since get()/put() means
> have ref number?

We have similar v4l2_subdev_get_* calls that obtain various things like the
mbus format or selections, and that naming isn't aligned with get/put
either. I'm not entirely happy with the existing naming but changing it
would be a major amount of work for little gain. Either way, it still
aligns well with v4l2_subdev_get_frame_desc().

In fact I called the function v4l2_subdev_alloc_frame_desc() earlier but
changed the name as its main function is to obtain the frame descriptor by
using various means, not so much the allocation.

There will about ten users of the function albeit it'll grow slowly over
time.

-- 
Kind regards,

Sakari Ailus

