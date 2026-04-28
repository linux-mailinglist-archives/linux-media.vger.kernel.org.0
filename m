Return-Path: <linux-media+bounces-59860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGI+Ose88Gk9YAEAu9opvQ
	(envelope-from <linux-media+bounces-59860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:57:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52F486649
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0E413088C18
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59634266BB;
	Tue, 28 Apr 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CKBGc0Vw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698A40242E
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384208; cv=none; b=QZI+grctQHXSSZEauO/9cEHwQrPJ8KxHa3xdozdootH46uHR4ghcg0V/4ZE084cDA5nNIouwMQMk3jM8xuzONiboYFSp70oenR8/RNRiUk739iPhC/8m+JHwNhWFfImhuMcnn9Yw05FogaBFbv3CoGHVPaKjxijXbIlKcj92kdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384208; c=relaxed/simple;
	bh=SKUmRosHf8cXsO4qmgxOkffPaH52PyMXK7TMPW4tXYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amW9gyBwdTpbtFUXdakCynwDealB0e78IHLzMQcCvABfzjpKikPdAAKu2YWWrXQEkpRA36i0DchQ4Muez3KY1+g3ufT8j5hicU3nG99SrXJ24ThI5HOlLO4Z1dhrjqaLYAVCOtaJm9wQDmg/Hbtef/NRxf4q3m4DaDxNCSiYcOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CKBGc0Vw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8d7f22d405so1919519966b.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777384205; x=1777989005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PC/PQI2pFt/lgK3OA060nn1/otX3Vo5UtapngrIT2LQ=;
        b=CKBGc0VwTIi8NkQGuXg72659WuJA43NzO13QGmkgbDYdhPjP42zTRijMqd+saxobOP
         MMG8O3uqlWKNlzNtdSmzCsoKrIw+B9mlN6taemWNbkF3SvuOyofygyzOhKDwujdv1dt8
         zSRVQN4mj24oA8KbtQD6lCjvAkujtoxF6F3z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384205; x=1777989005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PC/PQI2pFt/lgK3OA060nn1/otX3Vo5UtapngrIT2LQ=;
        b=Z/qON3Zvz/IM1gYdJdpMaG+X5R3Qto+5eNonPOILUSVBHGxfqHUj7fLDafeKPegr/A
         iiVmTXmbzNvzCz4MrT4sw21aXBmkc/wxnWmifpUREjPqpcuqn3jTNeMhLCCuoKp+8No+
         3oOJ4XPen2OQQIPXHBbAoVpUg6k/h9mZnBy/0ibEJrAbdDuEuFZ0o/JTo0nQApU3Xu6F
         Ph9bauAt8maL/YKXF94Fpxns3t+G9VWISjU/bQYisN0GAuJNnWN4KgjQDqv9ZFrc79Vb
         SlQdiTeNGSsRNNLMGLRbJEJU+dgoLmeAiHFIaeRynwjKFmZ0Q6xs/MC2B8W3N6JJIwXp
         4IcA==
X-Forwarded-Encrypted: i=1; AFNElJ99uxgT4TV8yuzFDIQ9yJGOz8Jlc3m9N2YFUv1im9IFjUp2sykX4kWvZY8XvTj1LaL0VLdV9HENWmvZ5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLczWEaEPjYuefo4PRjZDZNgJ3KqUbcxNYl+bWhVusaMKBXMVp
	1k1dnxes8gd1FrSzIYKzWZTC3r9Wjx3I87eCCQ1A4fcJICEASnVCbyintISOop95stwCKD4NXfH
	j4MD7xwjM
X-Gm-Gg: AeBDieuJ1MT96mohAXPAhJ9UApLrVeOI2D83x+EPfASNMv57E+ihJt7RcIHPAMN+SMo
	UUWZ17s1/g+6FkJTttqJwHcDS31RpEZ+R9krFPBGqskd85WWzVWDCOI93ZdaN7XWfVUBHZfq9nF
	vY0730lSVWpAXUbd9aOm59oBvnwXk9jJCKcc/atH7iRZ5JcKLbgNl8Jf+GxwAMllmtjjty5xbpX
	lwOpCV4f0dq025a+HjgoD8Ofs2RFIVEh4nJ7FSy/C308+V47ZDf6/DPn3XzyILmetvoK4DSuspA
	mSkFL4LXFAKNuMALep+O1otktKWpq2mtKg+NKO7QqvqlIis7nNcRAhxx6feJ2yIyXKld3liDpYF
	kQ4F7XT1t8Vd6kKjydbvgKHMOrwWwPRiliCcGPvih5H+Senqd5N42egAywqm90eFU+fxVVNe1Af
	C3InLwmyDvCdjHYwPaOH0Es5lALFaaQUzNZC4+SqONqwMDaphtDpm/rIKXoXoNtW6/gNT/DhE=
X-Received: by 2002:a17:907:a604:b0:ba9:2233:1ec with SMTP id a640c23a62f3a-bb802ea0f63mr181186866b.22.1777384204690;
        Tue, 28 Apr 2026 06:50:04 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2adea3sm110162766b.33.2026.04.28.06.50.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:50:03 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-671d60ef9c6so15833923a12.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:50:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+IB44PKaL1YBNPD+/WrhWHoPBAwhpDd0k/z19Tnm2Lx6SagrwcuchAoNkpgMN30Qxp3BYjoYJN7Ce9cQ==@vger.kernel.org
X-Received: by 2002:a17:906:ef04:b0:b9d:3f8b:1dec with SMTP id
 a640c23a62f3a-bb8042457f4mr203399466b.28.1777384201977; Tue, 28 Apr 2026
 06:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org> <20260428131038.GA120836@killaraus.ideasonboard.com>
 <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com> <20260428132649.GD120836@killaraus.ideasonboard.com>
In-Reply-To: <20260428132649.GD120836@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:49:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
X-Gm-Features: AVHnY4L0RRCRK9m_wQVkfe94sTYFyPwo5lxWCFL-9QFE8Q4JKGGSP1NdZwWEX2g
Message-ID: <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb config
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: AD52F486649
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59860-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[mail.gmail.com:server fail,ideasonboard.com:server fail,sto.lore.kernel.org:server fail,chromium.org:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:dkim,chromium.org:email,ideasonboard.com:email]

On Tue, 28 Apr 2026 at 15:26, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 28, 2026 at 03:14:21PM +0200, Ricardo Ribalda wrote:
> > On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart wrote:
> > > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > > Avoid invalid memory access if the zones_num is bigger than
> > > > zone_weight.
> > > >
> > > > This patch fixes the following smatch errors:
> > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > > >
> > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> > >
> > > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > > buf prepare time, and an error should be returned to userspace. That
> > > will likely not fix your smatch issue though, I don't think it will be
> > > able to understand that the values have been validated.
> >
> > Based on the warnings from the other drivers I also suspect that if
> > you have validated the data somewhere else smatch will understand it.
> >
> > Even if you add a validate function I would suggest to keep the
> > WARN_ON(), ideally it should never trigger, and if it triggers it will
> > get a lot more attention to get it fixed.
>
> We could keep the WARN_ON() if we first validate the data, but the
> driver doesn't currently :-/ I expect there could be more similar
> issues.

Yep, I got that. I will let you or Jacopo figure out the best way to
implement the validation in buf_prepare. If you do not have time to
implement it now I will just remove the WARN_ON in the interim... but
from my experience we only fix stuff if we get an oops.

Regards!

>
> > > Jacopo, do we need to add a validate function pointer to
> > > v4l2_isp_params_block_type_info ?
> > >
> > > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > > >
> > > >       /* Need to write 8 weights at once */
> > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > > >
> > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > > >
> > > >       /* Need to write 8 weights at once */
> > > >       for (i = 0; i < zones_num / 8; i++) {
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

