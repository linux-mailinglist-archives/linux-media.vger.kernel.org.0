Return-Path: <linux-media+bounces-59915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMK+C8Op8WkAjgEAu9opvQ
	(envelope-from <linux-media+bounces-59915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:48:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E148FF7A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE6753037984
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CD038E5ED;
	Wed, 29 Apr 2026 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i6g+HcOb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1638F25F
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445072; cv=none; b=EpZ/S5flzMZFp0FTk7Vid1WY2MbMoOnXOOj3AYw08pXyRQI3rU8d8XQxOp9Ht39Yb4MWmW0bd6KGRPbY1/viPzmY5vnvsQ8Sx0Xk5552WFq1tsNHmap2toRyxH1jgC/wiUqd3w/ayDEhqw4BwKZYbpevP/hBV/TXvklSxgOSL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445072; c=relaxed/simple;
	bh=8fvlPkqP93Ti+X20K6dIf2EVkYS6oyiwCe5f1yqLkm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8WtMfN9F8e3f9i9AdOazT/9WwSTllVlniKcpL11ECFHT/XudbZUxJzI1eSyVvfnm/o/Z2I+qXJrH7ACHYN12fyHTvXiyU3REts6JQXH0wzrEhTMw1pUNg5VSkAevBazdLo/wf5zHEUHz+yiEA9j9l2wpFdudxUYJgldogORYc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i6g+HcOb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba6b39871a3so99462166b.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 23:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777445067; x=1778049867; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DIYGnSzvjJ2ehoTLlG5N+Rw+U3EET8fJuAJ3tSeXDEM=;
        b=i6g+HcObT3tJBMsLWrxpkuY0eUeF1et5J86isrxJF+nUCb9zZ9u6CvyiZBEomxQnGw
         v+L5TedzvYFDkcgjMkJFYpYRQqsgCqE1AVqqLMRR5bv6rzolrMN+0hbB0oZn3nveVnd5
         vjOfJxVkv/cuYaWUy/GcINsJGxS5yGck0ID+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445067; x=1778049867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIYGnSzvjJ2ehoTLlG5N+Rw+U3EET8fJuAJ3tSeXDEM=;
        b=cU6HF/NxZvgT88bcyzyhpDKHDbA5/OtuIFOHf7d1qUW2saaENJsVqRMc0WtTOJC/Lu
         Xeh7HsGoX/WjNVccvoIFkRd4UbGGxFW31n3CyKAPrJNdGvXY79q5jKJEc2fck/Evhzj9
         7wizIju2wkxae4b7d6Nx2r8X+OCtsGQVZXGOCPGSB5rbhfQvYUsrksgPleDMtpH803GV
         h3AZnj9K4rvGyzWEu4LzokrAs1g20BkQ2yTWuVUWKeO+ItgvDG4w+aUioUT1zVpyXmY0
         AgMjC/RnkQwT3v+FmRoufkbPRlvGSVMIKuwlH9cR9EgwMIOYB7B0lQwgTpFawpeAFdlW
         4QnA==
X-Forwarded-Encrypted: i=1; AFNElJ89R214qYx1t0oSanDXjwVQ91VJEk8Y6Qzga5qoPCdrI7jYCcN7xk7YjPo0Vu+VoeBoxPLhxn86AHzDqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuhTNYQ1r0Q0Eg3Gg6X8sFvwR7HC+15WAJZCw2SQ8XJdy0nVSK
	bLEzRxVWji7iX8cnOv+NF8nvmHhYPoF4RJN6VFNe0SvrxYbZaViQ6wE6wS1LrwNtl8c2Gda+W06
	Xfha17iFP
X-Gm-Gg: AeBDievKmc4m6v476vB9UoC+4EopYmMs4fhMUBlvZuIQVEtxzneSY+dSrl5i8f0XHbm
	JcCutGIbBlGR+cLCtC54BO98Clu8vbFUfGMcBPkgxTjBPJTfjn4BwmrmksJC0gnML9qU97I/HTq
	S7GI+i1F9IriUHE6nt7cOpko4shl/R7lpVfOgwlTSSy/Sg0quyv8dRg+3o3+H5edR/oFrwrzk2g
	b7Y17PmQtgyGu8lCppOKq4Loi3ShJdd5+iiq3YSJ0d2ovhy8j6e6eCAkgCr717OerZre4riJc/r
	Q/XxTRS6Jabj9DG+8DnmD7eoIyvoPEWny0bSe8B3mM9yV5t196CI/Gk3G5K7Gub0secr1Vplp+y
	lul5sITVC3YXVnN2Fh/Av6E2G390pL9ueDrYZoOv4i5RHQqx02GfglM2bja7XLYsxIfRW9GtlDC
	wUn4mPafPxuhr3l8Mto3bGAA0nR8QSwy2LvgYE7sH1jglC2jPWVtNVBgy9XFMt4yNtuHryCKE=
X-Received: by 2002:a17:906:4fca:b0:bb8:fdd7:f32a with SMTP id a640c23a62f3a-bb9576e38fdmr111831166b.2.1777445066571;
        Tue, 28 Apr 2026 23:44:26 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb980a6f1c7sm46988666b.13.2026.04.28.23.44.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 23:44:24 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba3115fe0d5so102065766b.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 23:44:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LtbO2IXyiKl55xrmuH6W3kjldrbTIuxUJu5Qm61KeBUgmhVrSq7Kc/w4blvVDOcTfI1P3RkE1ik4Kbw==@vger.kernel.org
X-Received: by 2002:a17:907:1c13:b0:ba6:8b00:95cc with SMTP id
 a640c23a62f3a-bb9575ee381mr101529966b.5.1777445063536; Tue, 28 Apr 2026
 23:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org> <20260428131038.GA120836@killaraus.ideasonboard.com>
 <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
 <20260428132649.GD120836@killaraus.ideasonboard.com> <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
 <afGgKdauTs8GFoWg@zed>
In-Reply-To: <afGgKdauTs8GFoWg@zed>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 Apr 2026 08:44:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCtr6RiuupmPjHphcxtCrU5iKzFyp+BF9JLyOpb2hc2-cw@mail.gmail.com>
X-Gm-Features: AVHnY4JdW9iyKy9Fhy6GfXUCBi5n1bu-tNNlPxUXW8bgp0JI82GKd2-Pm8P9Fws
Message-ID: <CANiDSCtr6RiuupmPjHphcxtCrU5iKzFyp+BF9JLyOpb2hc2-cw@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb config
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7C2E148FF7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59915-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]

Hi Jacopo

On Wed, 29 Apr 2026 at 08:15, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hello
>
>    thank you Ricardo for the fix
>
> On Tue, Apr 28, 2026 at 03:49:49PM +0200, Ricardo Ribalda wrote:
> > On Tue, 28 Apr 2026 at 15:26, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Tue, Apr 28, 2026 at 03:14:21PM +0200, Ricardo Ribalda wrote:
> > > > On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart wrote:
> > > > > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > > > > Avoid invalid memory access if the zones_num is bigger than
> > > > > > zone_weight.
> > > > > >
> > > > > > This patch fixes the following smatch errors:
> > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > > > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > > > > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > > > > >
> > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> > > > >
> > > > > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > > > > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > > > > buf prepare time, and an error should be returned to userspace. That
> > > > > will likely not fix your smatch issue though, I don't think it will be
> > > > > able to understand that the values have been validated.
> > > >
> > > > Based on the warnings from the other drivers I also suspect that if
> > > > you have validated the data somewhere else smatch will understand it.
> > > >
> > > > Even if you add a validate function I would suggest to keep the
> > > > WARN_ON(), ideally it should never trigger, and if it triggers it will
> > > > get a lot more attention to get it fixed.
> > >
> > > We could keep the WARN_ON() if we first validate the data, but the
> > > driver doesn't currently :-/ I expect there could be more similar
> > > issues.
> >
> > Yep, I got that. I will let you or Jacopo figure out the best way to
> > implement the validation in buf_prepare. If you do not have time to
> > implement it now I will just remove the WARN_ON in the interim... but
> > from my experience we only fix stuff if we get an oops.
> >
> > Regards!
> >
> > >
> > > > > Jacopo, do we need to add a validate function pointer to
> > > > > v4l2_isp_params_block_type_info ?
>
> To allow drivers to provide an additional per-block validation
> function ? I think it could be nice indeed.
>
> Ricardo, could you spare this patch for the moment ? I think we can
> WARN_ON() to please smatch but we should pre-validate the buffer (without
> spamming the system log in case of errors) to make sure we actually
> never hit the WARN_ON() :)
>
> I have some patches in the pipe for v4l2-isp to add support for
> extensible stats, I could pile up a few more to give drivers a space
> where to implement additional per-block validations

Do you have any idea of the timeline for this?

I would really like to land this in this cycle. If it is going to take
long maybe i can just

if (zones_num > C3_ISP_AE_MAX_ZONES)

and then when you add your checks you can promote it to:

if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))

?

Also it would be much easier to backport this change than a change in v4l2-isp.

Regards!

>
> > > > >
> > > > > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > > > > >
> > > > > >       /* Need to write 8 weights at once */
> > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > > > > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > > > > >
> > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > > > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > > > > >
> > > > > >       /* Need to write 8 weights at once */
> > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda

