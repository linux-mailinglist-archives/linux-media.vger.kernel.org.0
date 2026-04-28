Return-Path: <linux-media+bounces-59854-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHRMLA248GkyXwEAu9opvQ
	(envelope-from <linux-media+bounces-59854-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:37:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DB485FDA
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FA2C310EDAF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAFA1DA23;
	Tue, 28 Apr 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y3N1AB83"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B837B00F
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382122; cv=none; b=fs/ctb4c3dKYLCUSVrCMuLSfQ6DGYSQppEpZXnbKjvXJrxAM2lu+TTsxOnGfCEwcGAXy0ttyIPH1u9Fk8OzaH7grW9UQdodumM87W2dtmkPhAYhE8JQ0A5CqJBO5agkkO9KKC2Jg14UtVjI47ey5eJ0rUj+ayTfCkoAeJqiahn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382122; c=relaxed/simple;
	bh=7rCBvFe5ZW/XJkf03IpksDTSf8oKsP5JtlotqMrX6Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLafIOmEQAV4x5ULmGBxmE5MN7vlSzyWCPa5FpejykApAANDxNVeVCxgL8OmVr1KIbftwfyTJI84+YIkG7coSg2GopZLZ+wyKcuSLK+9IAlJWSZEeVpBQgfB84/bIzvSvHe99LZTAd3SDcloBhhLX7CkFBR80sHHKU0uBTtZm1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y3N1AB83; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9382e59c0eso816433266b.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777382118; x=1777986918; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D2C6/0LvJt0bQD4KBxtPX5+eWPSK6gQEy0L1ksMasWs=;
        b=Y3N1AB83Du29i+kR8xQ4Zw7i/txl8p6nvWyPb2eX2uYoYTdtcyFs7iimGhge75f4Zn
         gnVcqPKpT8WZ8KzoywGM2fgwUycoRMHXGiEbwIYnAd8+BZFbrH29/8sBscrwYyF0z+4m
         2vkY8cEv3qSauVSNMY9w4D9RFtLOqogaiF858=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382118; x=1777986918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2C6/0LvJt0bQD4KBxtPX5+eWPSK6gQEy0L1ksMasWs=;
        b=DhI+QXAeBF7Q5maj1IAd0p+jyY9oWCL2BtwyVv+OzQPDWSj7pjQ5CP9ujUYXVRZGbt
         dGveVy14pGibeMRnAnvX3jbQYlQJSBbIxflbJcc7pYMDwyJuIiduzwJgbhu0fMeBVv/x
         qzjX5uLWQvQ04RvXkV2lRct57FponBlLGK9wkOFeOgxT75fEAEkMWneFtfWbU/fUgnhy
         UQA9i/dXkJVnnF6aUSTPqYROWjqrP9lZSVW55uBKqQ3C4IFNORYosdjqBbyteLHONZ1m
         d6cVd2ocQSYQRssxw7ay21n3lt7gta6vIHA5Ywt4if3IQ5+SHGlVzfNyBU0R3wPcrKYK
         Jf7A==
X-Forwarded-Encrypted: i=1; AFNElJ/o9EOTcuLdoQVZjDGvoArbkSeKIolI+Jcje9HQ4oLvxF5hs3AxF8fSmpLaBQKIWk82Gaqmr7HccxQzvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPglUyXMj5rnC/RiFVWKebJh10IBUWF+P1XLmLoZQ9v0964sw
	4pvzOKSSq8cxPCuYwKsW79q5aG+aTTz3IUy5BUHEKdpUHVP/j3MMLsO1xqhjdjYUdLA/gQ9OvWW
	yznMW9Sjf
X-Gm-Gg: AeBDietRZ/fJVlntof/wDq0p31aWu4+vuF8vQ6AawulDHmv7fDr1JImwlVj6H9UyPnm
	f7L+XKFFKIhS3tv0Sj41s4rDFYMgUZWbxVfR64lgtR72izzXoaGVChwc1o1QkDx4eSESTzHCHfU
	lDirVeZGn/Y8GhV+JiT9+2F+7cJ8W9s02GWp53slKkKvqUn/flbz3NtveeccAQZ5tAQ5eK34IKf
	72EeW1VEekmr9jZsikP0ZF5qP1jcP3ytZpM0eaC4ttcDpjwYu2eBd2V0ExpUzKmzOzLMVYCmAzP
	0p+hCiTVrIGa3CpNvjf9LJALXOm6lSgxyf4W6vMr80VLTK+xykLZyzd+Geaieh5zyvbDCsb0DF2
	I2Apn7+3S9JATFCLYFudvDTOzKYA8w1tRRbrvpOITprwmH5iu0oE1SMakZ0N3GXPlDslj3JRkjX
	dZ0XGxhew4rR61W82k3MMSmPmFiN7g5cdu2r3+35tDBebAll3Vw5KWAgBRQeBA5/QXw/AAgX0=
X-Received: by 2002:a17:907:9814:b0:ba0:fd75:9c58 with SMTP id a640c23a62f3a-bb803971fc5mr200932566b.32.1777382118325;
        Tue, 28 Apr 2026 06:15:18 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853e641sm106385666b.10.2026.04.28.06.15.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:15:17 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba922426c5cso905070066b.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:15:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ewBJpKmUiQ28mwTIBhbdxAaLhiEBl/IxrB+1HSH1xQZWXg6ocGHLytvW8cdvh2NLumW8ej/ssNu7R9A==@vger.kernel.org
X-Received: by 2002:a17:907:6e86:b0:ba8:e7b5:39ad with SMTP id
 a640c23a62f3a-bb7fea77794mr174614466b.0.1777382116061; Tue, 28 Apr 2026
 06:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org> <20260428131038.GA120836@killaraus.ideasonboard.com>
 <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
In-Reply-To: <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:15:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCv1BWEL0poGaW0mBVRfPt9575GC07zea8U0eVaZzjSr0w@mail.gmail.com>
X-Gm-Features: AVHnY4JPkz8xt7BKytXFwEOdFJ1vkSGeuN-TQA2PjEQJga7epuURPun_hcwqZ64
Message-ID: <CANiDSCv1BWEL0poGaW0mBVRfPt9575GC07zea8U0eVaZzjSr0w@mail.gmail.com>
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
X-Rspamd-Queue-Id: 4E1DB485FDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59854-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email]

On Tue, 28 Apr 2026 at 15:14, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent
>
> On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > CC'ing Jacopo.
> >
> > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > Avoid invalid memory access if the zones_num is bigger than
> > > zone_weight.
> > >
> > > This patch fixes the following smatch errors:
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > >
> > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> >
> > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > buf prepare time, and an error should be returned to userspace. That
> > will likely not fix your smatch issue though, I don't think it will be
> > able to understand that the values have been validated.
>
> Based on the warnings from the other drivers I also suspect that if
> you have validated the data somewhere else smatch will understand it.
I mean that

will *NOT* understand it.

Sorry

>
> Even if you add a validate function I would suggest to keep the
> WARN_ON(), ideally it should never trigger, and if it triggers it will
> get a lot more attention to get it fixed.
>
> >
> > Jacopo, do we need to add a validate function pointer to
> > v4l2_isp_params_block_type_info ?
> >
> > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > >
> > >       /* Need to write 8 weights at once */
> > >       for (i = 0; i < zones_num / 8; i++) {
> > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > >
> > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > >
> > >       /* Need to write 8 weights at once */
> > >       for (i = 0; i < zones_num / 8; i++) {
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

