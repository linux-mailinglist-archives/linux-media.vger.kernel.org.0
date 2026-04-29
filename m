Return-Path: <linux-media+bounces-59925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMvJNBux8WmwjgEAu9opvQ
	(envelope-from <linux-media+bounces-59925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:19:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A654905A0
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38904303AB5B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95E13A453F;
	Wed, 29 Apr 2026 07:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NZ+bXhEg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859AA3A3E97
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446978; cv=none; b=L2dE8RY+spUCCOHmaXeJH1UR0ZN73OV+hKPAq7sFEF7tfbyEiS9jcBHPHba0TLtsmus4l9ZBhFiq2W+CYnPZ3hcroP3J4uSekPh1QIGFiaprohPjRVIDmEWi7GwQt3mrDP859SOzbLvK/g2Tt/1tAtz51uzbMdb68/lIoBw/LlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446978; c=relaxed/simple;
	bh=xB2ti4ZBr1oXFjM8YFkh0Dg/OOaBcI02P4dFnj/2cbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1owdNL27rhYXriKp/zIceLnJhWjaWC/bIk0r4dS7E/swWQ7PQhf21R0VQa1x/y8z8enjTsKwWrzqYyTA9XpxXo/0wpzXsmTYjnPwF5hL5dtLW5/24n0gyoUXoMgVdLmRZQ8nIOth87kSOijpdTDPj4krRgcROcXUS/OpRIkSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NZ+bXhEg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so20198565a12.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777446974; x=1778051774; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zH4LOP+SlYMykRy8/Pf04NdQ0dQW87QZTuybjlYT/Nw=;
        b=NZ+bXhEg8ragvfD27rI/bJ02O8g4LpFDkBCygapwEcF12EhngYipyPDnWuCVeSMLyW
         iUZumlA0Zy+7boUR5uro043Jg4VrOWX7Nux1D8OOpmNEorkx3wOsHANsaclWfL0xCwtk
         fdUdTJs1fOttlFirucBm1AHFulQcIotPMEJj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446974; x=1778051774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH4LOP+SlYMykRy8/Pf04NdQ0dQW87QZTuybjlYT/Nw=;
        b=m6RIkJPum2cK5h5K94yT38KClXMcXfaOqI+O2YFZAn+OV5AJJBzdRKyCCLnEt1uJVw
         llcBF4UsIvRlHGwToq1hvx+qTxFvSGgZ+q4zwK4hOoL8YN9ha1qsizU6ROYSwhtdP4bg
         vukBw75xF0U/gbthdv1n8aSBSyJr2nEYiRck4elhV5zgCb9LxJzVZbJWNSppjvLALg4O
         XluLKUa0IA00572hSkeqSP/FAdTMyypQzk8xX8lZ+1jACHb5Q5OIskggL4DonaIY5dvE
         w/OUU+L5uDqHV1aC6Vj8PYaHX9+Ob/gVfwxTCsWJYOP3dPhu4mqeM+Xbzf2E0qcOwUGO
         BoQw==
X-Forwarded-Encrypted: i=1; AFNElJ+sAjLBw8tWu/8To1fVX1y2Ls6B+0A4cIk5byqmLc+vuFoXFYbxrW2ikxGd0+P/3dOUaYr0ND858iq9ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jb/qWqJ290bKy80yciglE9DI1dbj6eYHVG9tMhVeti+cSKK2
	t/G6zEWUPIgkBUzYx/jjcJ6dutU02zd0UBymARtqJxoFkBCJ/exwvDV0F4ijHwSFfBckc1hM/pY
	oQxBeev4E
X-Gm-Gg: AeBDieu8B94hOz6JKnyEdeJkJG4unrhNrZKWDo9uprkaiSu3l4NeBdsHfTn5IX+4kcv
	gOjEGD7z3vfVAhe72A5JWf/4FVBCurv973xG9wi2KlPVnt6jd2iUZrixuOMBPla9HK+pc63xMn4
	W913+REne6YqJISAo34jWjxGPhVNpPEp4BkESIMnyjSm4yI21iCJfXMwMQOR4S2DHaa1YPAF0cC
	IqQEK+gZUlh38TwWid9wkAhoXWNrKjwwhTO8JTartCt69Wd8Oqp0oXKuZt8ez2tiUj8N+HHHt66
	5sSZpsNy98lmEWeYFCtd5yS+77vYWOHTSs3PjfJC4Hu6WBgJbGM1fs6HYfFivpuzSvyD9ZLmIma
	lV3n5hOk7ttLuPF3V/z6C1SZNI/yAyMgW2PQc5ulYK3Kn52rAIyFhlV4gUzKtl5lEb0zMgRtkgt
	I9jKNeRPFY5gD95uYj5NRH1RDV95pOT+ZaIsY2lY9bljYYZRvP6y8F4HEGfapqG8Em3mtKBMo=
X-Received: by 2002:a05:6402:5216:b0:671:eac2:d328 with SMTP id 4fb4d7f45d1cf-679bb04b10amr3233196a12.10.1777446974386;
        Wed, 29 Apr 2026 00:16:14 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22165b31sm374661a12.23.2026.04.29.00.16.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:16:13 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so20198489a12.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:16:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8SdN7PtjMLAWQwQEfJk9/yJhx85lSrHMinSwWM715TmMAe14f1lzuEgcUjb+i74PED3Yp2dbw9VEpGZw==@vger.kernel.org
X-Received: by 2002:a17:906:ef0c:b0:ba7:62f:9fa6 with SMTP id
 a640c23a62f3a-bb8018de3eemr353915866b.2.1777446971661; Wed, 29 Apr 2026
 00:16:11 -0700 (PDT)
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
 <afGgKdauTs8GFoWg@zed> <CANiDSCtr6RiuupmPjHphcxtCrU5iKzFyp+BF9JLyOpb2hc2-cw@mail.gmail.com>
 <afGqxcABkv2D3DWG@zed>
In-Reply-To: <afGqxcABkv2D3DWG@zed>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 Apr 2026 09:15:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCsj6yPX1s5WTKbbhT3QA+hhrJHNwjKb5ntaC4v2qo13KQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jqv-PVWRQnGBllidZi6sXJbggmK90XBD2px7fsJee02wPtsN-yZmn7sk4
Message-ID: <CANiDSCsj6yPX1s5WTKbbhT3QA+hhrJHNwjKb5ntaC4v2qo13KQ@mail.gmail.com>
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
X-Rspamd-Queue-Id: 26A654905A0
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
	TAGGED_FROM(0.00)[bounces-59925-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,ideasonboard.com:email]

Hi Jacopo

On Wed, 29 Apr 2026 at 08:55, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Ricardo
>
> On Wed, Apr 29, 2026 at 08:44:11AM +0200, Ricardo Ribalda wrote:
> > Hi Jacopo
> >
> > On Wed, 29 Apr 2026 at 08:15, Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Hello
> > >
> > >    thank you Ricardo for the fix
> > >
> > > On Tue, Apr 28, 2026 at 03:49:49PM +0200, Ricardo Ribalda wrote:
> > > > On Tue, 28 Apr 2026 at 15:26, Laurent Pinchart
> > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > >
> > > > > On Tue, Apr 28, 2026 at 03:14:21PM +0200, Ricardo Ribalda wrote:
> > > > > > On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart wrote:
> > > > > > > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > > > > > > Avoid invalid memory access if the zones_num is bigger than
> > > > > > > > zone_weight.
> > > > > > > >
> > > > > > > > This patch fixes the following smatch errors:
> > > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > > > >
> > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > > > > > > >  1 file changed, 4 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > > > > > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > > > > > > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > > > > > > >
> > > > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> > > > > > >
> > > > > > > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > > > > > > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > > > > > > buf prepare time, and an error should be returned to userspace. That
> > > > > > > will likely not fix your smatch issue though, I don't think it will be
> > > > > > > able to understand that the values have been validated.
> > > > > >
> > > > > > Based on the warnings from the other drivers I also suspect that if
> > > > > > you have validated the data somewhere else smatch will understand it.
> > > > > >
> > > > > > Even if you add a validate function I would suggest to keep the
> > > > > > WARN_ON(), ideally it should never trigger, and if it triggers it will
> > > > > > get a lot more attention to get it fixed.
> > > > >
> > > > > We could keep the WARN_ON() if we first validate the data, but the
> > > > > driver doesn't currently :-/ I expect there could be more similar
> > > > > issues.
> > > >
> > > > Yep, I got that. I will let you or Jacopo figure out the best way to
> > > > implement the validation in buf_prepare. If you do not have time to
> > > > implement it now I will just remove the WARN_ON in the interim... but
> > > > from my experience we only fix stuff if we get an oops.
> > > >
> > > > Regards!
> > > >
> > > > >
> > > > > > > Jacopo, do we need to add a validate function pointer to
> > > > > > > v4l2_isp_params_block_type_info ?
> > >
> > > To allow drivers to provide an additional per-block validation
> > > function ? I think it could be nice indeed.
> > >
> > > Ricardo, could you spare this patch for the moment ? I think we can
> > > WARN_ON() to please smatch but we should pre-validate the buffer (without
> > > spamming the system log in case of errors) to make sure we actually
> > > never hit the WARN_ON() :)
> > >
> > > I have some patches in the pipe for v4l2-isp to add support for
> > > extensible stats, I could pile up a few more to give drivers a space
> > > where to implement additional per-block validations
> >
> > Do you have any idea of the timeline for this?
> >
>
> Give the change will likely come on top of extensible stats it might
> slip this cycle
>
> > I would really like to land this in this cycle. If it is going to take
> > long maybe i can just
> >
> > if (zones_num > C3_ISP_AE_MAX_ZONES)
>
> Fine by me
>
> >
> > and then when you add your checks you can promote it to:
> >
> > if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
>
> To be honest, if we pre-validate and silence the smatch warning with
> the above
>
>         if (zones_num > C3_ISP_AE_MAX_ZONES)
>
> then there shouldn't be any need to WARN_ON() ?

I like WARN_ON in "sanity checks" because when they fail they give you
a pretty verbose warning that will lead to resolution.
But if you do not need/like it, it is also fine by me.


>
> >
> > ?
> >
> > Also it would be much easier to backport this change than a change in v4l2-isp.
> >
> > Regards!
> >
> > >
> > > > > > >
> > > > > > > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > > > > > > >
> > > > > > > >       /* Need to write 8 weights at once */
> > > > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > > > > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > > > > > > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > > > > > > >
> > > > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > > > > > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > > > > > > >
> > > > > > > >       /* Need to write 8 weights at once */
> > > > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > >
> > > > > --
> > > > > Regards,
> > > > >
> > > > > Laurent Pinchart
> > > >
> > > >
> > > >
> > > > --
> > > > Ricardo Ribalda
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda

