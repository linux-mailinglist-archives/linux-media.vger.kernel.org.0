Return-Path: <linux-media+bounces-60580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECsPLrsj+2mQWwMAu9opvQ
	(envelope-from <linux-media+bounces-60580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 13:19:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BA4D9AB4
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 13:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 674623014557
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 11:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCD13E3171;
	Wed,  6 May 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N8AA/bmq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C7434DCD9;
	Wed,  6 May 2026 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066326; cv=none; b=JFvnoEjiZydqsnzw2YyRVjCBLyYCOyCLErXX9dJVfRTlpsP6Qpa+H2MU+mfweAeX+GXLJbQL/ldUYQyCh2OVBgXAF1mxAYpv+9UnKbwJPN7SjnvA3cgYTjOBkT9tFYpbcq85faIPVUoYlxMTZvkHXeLCLVM8NbgZxtwm6qmgInI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066326; c=relaxed/simple;
	bh=I0A/srbBaxYfifORY4VfqSD6hmjlfsy4Bki2EZn+OIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtcGMNyfEY91B4AcrpvLbp1NTAPb0xlV4buWJZllWwP2lkCf4/m/O568ulbE6BT8eCIEzNYu0Gq0B6SwYb9ua5FvDI2nc0s21lfDKDNtN9OgzYMVgAqCmhnzddmat6Zb3MSxueYNDTyIYFFWCnqtYtfwtetIdaNHJiWWumGUqqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N8AA/bmq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11B58C21;
	Wed,  6 May 2026 13:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778066317;
	bh=I0A/srbBaxYfifORY4VfqSD6hmjlfsy4Bki2EZn+OIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8AA/bmqbF/mu72vKToOvjk0mOIgiFPKuAtPJotvjQ8wXq73b3D16eCpUuEcCb8tU
	 i6rOE3IWHRKPxWRQaXf5e+ynjyzYvs7Ipc+LL7XKUr3HNnftH6DtJ9xY5aljoWMpNt
	 A8AEC25WvAttiN+24rP/ZBsexJeKE0gf4bNQUksE=
Date: Wed, 6 May 2026 14:18:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 1/6] media: v4l2-dev: Add range check for vdev->minor
Message-ID: <20260506111838.GL1598374@killaraus.ideasonboard.com>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org>
 <20260505231211.GE1598374@killaraus.ideasonboard.com>
 <CANiDSCtwPC1ihe5u=HuDG0f261zq76=TL90oMqfP8VQ6UK771g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtwPC1ihe5u=HuDG0f261zq76=TL90oMqfP8VQ6UK771g@mail.gmail.com>
X-Rspamd-Queue-Id: 1D8BA4D9AB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60580-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 08:48:06AM +0200, Ricardo Ribalda wrote:
> On Wed, 6 May 2026 at 01:12, Laurent Pinchart wrote:
> > On Mon, May 04, 2026 at 06:54:04AM +0000, Ricardo Ribalda wrote:
> > > If the fixed minor ranges are not properly set we could end up in a
> > > situation where the calculated minor is invalid. Add a check for this in
> > > the code to make it more robust.
> >
> > If it was just for that, we could define the ranges in a way that could
> > not lead to future programmatic errors.
> >
> > > This check also fixes the following false positive smatch warning:
> > >
> > > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > > index 6ce623a1245a..5516b2bbb08f 100644
> > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > @@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
> > >       vdev->minor = i + minor_offset;
> > >       vdev->num = nr;
> > >
> > > +     if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> > > +             mutex_unlock(&videodev_lock);
> >
> > I may get tempted to convert code to using scoped guards at some point.
> >
> > > +             return -EINVAL;
> > > +     }
> > > +
> >
> > I'm annoyed by the proliferation of workarounds for smatch false
> > positives that generate useless code :-/ This is in particular is not a
> > big deal though, so
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > but I don't want to continue in this direction with every new kernel
> > release. We need a way to tell smatch that this is safe with incurring
> > an runtime cost.
> 
> To provide some context, in this release alone we have found two "Fixes:".
> 
> Do you have any data regarding the runtime cost of these new checks?
> Most of the time, the compiler simply optimizes them out, so the
> impact is either zero or minimal.

If the compiler can optimize them out, then I expect the static analysis
tools to also get the ability to avoid those false positives.

> The added checks make the code more robust for future refactoring and
> serve as useful documentation.

In this specific case, if we want to make the code more robust, I think
we should have an array of minor offsets and calculate the minor ranges
based on that. It would avoid offsets and ranges getting out of sync. I
don't think it's worth it though, because I don't foresee we will ever
change ranges for the fixed minors case.

> Furthermore, when false positives occur
> in new code, they force the author to write more idiomatic code, which
> improves maintainability.

Up to a point only. Sometimes guarantees are provided in a very remote
place. For instance, control values have ranges that are set when
creating the control, and enforced by the control framework. Adding
range checks to .s_ctrl() is redundant, but I don't expect static
analysis tools to be able to understand that the value is guaranteed to
be within the range (especially given that we support modifying ranges
at runtime). How can we avoid those redundant checks (or mask
operations, as in the mt9p031 patch in this series) ?

> We have a deficit of maintainers, not
> authors.
> 
> So, I DO want to continue in this direction. I am very grateful for
> these static analysis tools; they truly make our code more
> maintainable.

I do like smatch a lot, it points out real issues. My concern is that we
have code that offers guarantees in ways that are not visible to static
analysis tools (or to compilers), and having to add more runtime checks
everywhere to silence warning is not nice. Those checks can over time
become redundant (because tools improve, or because we remove the code),
and will likely not be removed because nobody notices.

There's a broader question here of how to connect pieces of code where
one piece offers a guarantee that the other piece depends on, in a way
that can be exposed to tools.

> > >       /* Should not happen since we thought this minor was free */
> > >       if (WARN_ON(video_devices[vdev->minor])) {
> > >               mutex_unlock(&videodev_lock);
> > >

-- 
Regards,

Laurent Pinchart

