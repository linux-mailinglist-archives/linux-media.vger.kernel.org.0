Return-Path: <linux-media+bounces-60584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ4wEVYw+2lxXQMAu9opvQ
	(envelope-from <linux-media+bounces-60584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:13:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFFF4DA01C
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93B6C30164BC
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622D743E4AE;
	Wed,  6 May 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OnHHZKsn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3327132BF5A
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069586; cv=none; b=qcCiL5YZeA+PcJ/H3JdY2Q6mw0nlyvtcqIFnctdCOxxgzdwf3MNcsNtzPjDDLxXFqCgc8pa4FiNhD6xy1g85rNk+CKUwp+XuwtnpWuKRJOw5qtESUpKdh9w0g1NrvD6j9GVgUH8EY8DY2wjJsFx4tbUZDZ7F1I6PDVzClsJHbFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069586; c=relaxed/simple;
	bh=25EStH+ZKY3S23pfBiuDiZcfYIT3PHSSztxBuJUVBwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FK0PcB4nZS2KJFuut6h75gTbfUj0DV9mPOncJ0v+vMltchrIF5w6ruS/fKfT5AVk8g/aF34rZ8p5rruMtTNniLqr+WU1RQi/vOFwvdxAQJBEzFZ2tJNGc9cVd3aJDlR55v+Bljvi0+0Bg7KilSJhcv/CwdXNZbYVx/BpnRkro98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OnHHZKsn; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bc23bebd345so148310266b.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778069583; x=1778674383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVjlbnqQSsjSh+3tnbsmuYby63Qhu3djg55a/YfzcUs=;
        b=OnHHZKsnX7upE62UPrWzVrhjfx3qmtFb/pI17rETlSKcIa8C4X7gioxAdx66QX9anF
         APDTAK8Tb9fKdcfTMPFcyCSn+XVYrNmVQx8mzhqiVTmbvFwDPwq3N68xVnm9nymSvqDl
         PBWElafZlviJsxOoQ5L53Dqw1jr4NKrvrPwh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069583; x=1778674383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVjlbnqQSsjSh+3tnbsmuYby63Qhu3djg55a/YfzcUs=;
        b=T82aiO15LLKq0ZpgcIbxgRsTVxNSH34obUb0PynFoY/XEHkXGt8aacDxL4x0jM7uWu
         52ZTQJC54dZKhrzxKkVQa/y4hOpnW6eipuCJBR0UqbiWq9QeCrdBOsL2gz8FtW1OixiC
         3fCCZpvC9OFyJbUZJvO3RrDKvYEJ5nL9waEtb8xQdOk0BUOQyxUuc7UFDODyojmaMDTc
         u1zZ3076O5dgxNs918h6nG9YY/RINSp1XFZKLh5BDCmjybaC8fSEXDS0g5RELQDmBsDf
         r+7WRuXK1dOwFza2ouaxU7fHvVUaUDaoO6/DSEcJ7DR0wuMLUt1gk9WwkILoQLFg2aWK
         QDew==
X-Forwarded-Encrypted: i=1; AFNElJ8+sQLum71CygShuZoQW0+aVYi96yNvPn2p4fvWsH0I43Is8hkk53SBgXMwl6rB4vsyPUq/ZJ4oGZNVUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmho6c/nrnOcxvUVW2PBkDiUT+3B7p1tftf24HCPdr66mrpg21
	EYPu4s30qEOkgOuuQyCeSqOshKN4p4PwR4xfc0OL6tJwSJSVgupUOjxyI2GYaO14oLegM0ZZXf/
	VHcSGeJzl
X-Gm-Gg: AeBDieurVkK7d7ws+i6pPHS+1TYX4NTCyuBLmEQBD+2rx+Q+qtFRSfYM77mKKHLZHN5
	fsnTwp+Xi8iRtIyC3W2NMtEscylZ6TDOWB8slXPhn5cIFfb5vUh9XwBBAjNF6I3W0VPxdxF7r86
	BqZr1DUaOdICactsjOhXCwKzf57RxfhuWaqa79Z8ABsLywEMcc+SntuJtURMz3OjkxJNPD8p3Nx
	rPJGv3YTa9lLx/LDEjwSCbZpU9VjROh6IfbHzXe8L94aUxnI5bLDwlfBqTVb5alUyXpaF+r39Pj
	ZDAmt3ZqdulUZI4qQeAyVftf1qdXouu68+z558bXWOJq8Hclw9+L1+fRsf0Kl3De4+s+/PnwP1Y
	0yXUsdCkHUvz7Ak7VSVFDZVtM6wSwJvA838nd//7dZaXTo600SF5kZJnMyd0s4YYSP4Ov1B4/Mx
	qvWuxZUg/2/tjy8XKdA+xCjeiypg5iDS+kpHlz5FRMx1Kwszr6ai9M+0ZlJIw660zFe/y6Hi8=
X-Received: by 2002:a17:906:12d6:b0:bc4:b981:d6eb with SMTP id a640c23a62f3a-bc4b981d733mr207068566b.29.1778069582904;
        Wed, 06 May 2026 05:13:02 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55f710d56sm76992566b.61.2026.05.06.05.13.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:13:01 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba3115fe0d5so159371266b.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qb3r+3ZC94DwKnAYtFBFKrKBh55Rjq9Cq6uKkfpPmjX332cyuorz6hWSYOdoR/r/AA7+fIqDyX7QTgw==@vger.kernel.org
X-Received: by 2002:a17:906:f587:b0:ba9:13e2:ddd1 with SMTP id
 a640c23a62f3a-bc549911f7cmr165900866b.4.1778069580078; Wed, 06 May 2026
 05:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org> <20260505231211.GE1598374@killaraus.ideasonboard.com>
 <CANiDSCtwPC1ihe5u=HuDG0f261zq76=TL90oMqfP8VQ6UK771g@mail.gmail.com> <20260506111838.GL1598374@killaraus.ideasonboard.com>
In-Reply-To: <20260506111838.GL1598374@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 6 May 2026 14:12:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCvo_J+jTUAjWAMhoVWnkvaYFH_=LJ+TBovfDhcskaooOA@mail.gmail.com>
X-Gm-Features: AVHnY4IQkpK3-5RS14A7VUMwQMw6jxPGx8jG3XavvTzh8GHEisq1RNp9k2xsYIg
Message-ID: <CANiDSCvo_J+jTUAjWAMhoVWnkvaYFH_=LJ+TBovfDhcskaooOA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] media: v4l2-dev: Add range check for vdev->minor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: AAFFF4DA01C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60584-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email]

Hi Laurent

On Wed, 6 May 2026 at 13:18, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, May 06, 2026 at 08:48:06AM +0200, Ricardo Ribalda wrote:
> > On Wed, 6 May 2026 at 01:12, Laurent Pinchart wrote:
> > > On Mon, May 04, 2026 at 06:54:04AM +0000, Ricardo Ribalda wrote:
> > > > If the fixed minor ranges are not properly set we could end up in a
> > > > situation where the calculated minor is invalid. Add a check for this in
> > > > the code to make it more robust.
> > >
> > > If it was just for that, we could define the ranges in a way that could
> > > not lead to future programmatic errors.
> > >
> > > > This check also fixes the following false positive smatch warning:
> > > >
> > > > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > > > index 6ce623a1245a..5516b2bbb08f 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > > @@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
> > > >       vdev->minor = i + minor_offset;
> > > >       vdev->num = nr;
> > > >
> > > > +     if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> > > > +             mutex_unlock(&videodev_lock);
> > >
> > > I may get tempted to convert code to using scoped guards at some point.
> > >
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > >
> > > I'm annoyed by the proliferation of workarounds for smatch false
> > > positives that generate useless code :-/ This is in particular is not a
> > > big deal though, so
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >
> > > but I don't want to continue in this direction with every new kernel
> > > release. We need a way to tell smatch that this is safe with incurring
> > > an runtime cost.
> >
> > To provide some context, in this release alone we have found two "Fixes:".
> >
> > Do you have any data regarding the runtime cost of these new checks?
> > Most of the time, the compiler simply optimizes them out, so the
> > impact is either zero or minimal.
>
> If the compiler can optimize them out, then I expect the static analysis
> tools to also get the ability to avoid those false positives.

Ideally yes, but LLVM/gcc has hundreds (maybe thousands?) of
contributors and sparse/smatch are maintained by a handful group of
heroic warriors.

>
> > The added checks make the code more robust for future refactoring and
> > serve as useful documentation.
>
> In this specific case, if we want to make the code more robust, I think
> we should have an array of minor offsets and calculate the minor ranges
> based on that. It would avoid offsets and ranges getting out of sync. I
> don't think it's worth it though, because I don't foresee we will ever
> change ranges for the fixed minors case.
>
> > Furthermore, when false positives occur
> > in new code, they force the author to write more idiomatic code, which
> > improves maintainability.
>
> Up to a point only. Sometimes guarantees are provided in a very remote
> place. For instance, control values have ranges that are set when
> creating the control, and enforced by the control framework. Adding
> range checks to .s_ctrl() is redundant, but I don't expect static
> analysis tools to be able to understand that the value is guaranteed to
> be within the range (especially given that we support modifying ranges
> at runtime). How can we avoid those redundant checks (or mask
> operations, as in the mt9p031 patch in this series) ?

It depends on the nature of the range check and the consequences of
failing it. We can decide case by case and worst case scenario we can
ignore specific errors.


The mt9p031 patch in this series is special, the issue is not the
range check, but that smatch did not properly handle a mask operation.
Dan is working to fix it.



>
> > We have a deficit of maintainers, not
> > authors.
> >
> > So, I DO want to continue in this direction. I am very grateful for
> > these static analysis tools; they truly make our code more
> > maintainable.
>
> I do like smatch a lot, it points out real issues. My concern is that we
> have code that offers guarantees in ways that are not visible to static
> analysis tools (or to compilers), and having to add more runtime checks
> everywhere to silence warning is not nice. Those checks can over time
> become redundant (because tools improve, or because we remove the code),
> and will likely not be removed because nobody notices.
>
> There's a broader question here of how to connect pieces of code where
> one piece offers a guarantee that the other piece depends on, in a way
> that can be exposed to tools.

I agree with the idea, but this might not the right forum. It would be
a great topic for the Kernel Summit, though.

The "rust people" would love to have some annotations about the
guarantees of the C code.

But until we have those annotations the best we can do is runtime
checks where they make sense and keep track of where they do not make
sense (allow lists). That will make future discussions more
productive.

>
> > > >       /* Should not happen since we thought this minor was free */
> > > >       if (WARN_ON(video_devices[vdev->minor])) {
> > > >               mutex_unlock(&videodev_lock);
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

