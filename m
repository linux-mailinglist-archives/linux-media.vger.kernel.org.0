Return-Path: <linux-media+bounces-59853-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE+oI/jJ8GmfYgEAu9opvQ
	(envelope-from <linux-media+bounces-59853-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:53:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C56487604
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C90C830A778E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E18A4657FA;
	Tue, 28 Apr 2026 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VbSBWrJB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D50477E3B
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382079; cv=none; b=HxJ5DErbLwdLELBlSTDCOQtEr8eKB3FE7PBJx+5dXmMsMLQW1ltL1AKp+pKiaI1D64Qrnw+tLe8zITwz2Eqzr7o9cCodVUjwwWrOQYS+O25Qi20Ctn3DCUUILaxHp05toYXg/I95BZeNCWFJNmm4VN8QeiAV7EmY6aU9RmNZSik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382079; c=relaxed/simple;
	bh=DARNp76SP4VuPcL8MoUOAYG40IhuB3WdIRau0JvBD6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCh43POcnNFKJfM0T8iN9XCggJYBPvvhXfsicjNgCsacVem07wCcKaXoArbTJf7mCtnkL+/dg6ugJqM79P6LlwAHKUiuYK2/MEnsdyWG6spiXGQwd7Pm1M0gMERpbydtj4DtGmKh5tqtqzTITI0jYxzIo+r0BhGDaocsYri3Bhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VbSBWrJB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1900471366b.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777382076; x=1777986876; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F+G3TLEROPGFED8nEpk/bFYKEpd/tD5vfNBgNLoHd+A=;
        b=VbSBWrJBUI6yo1re6kfOovRQs+U7WFMynqs+rMGeh0vqluNzuVYq3B4di4B7p+Af7y
         vKpJaUXeiAxOJmr6ZxVezhMtEsD/Zwln/uwLb3noXuTYGd0ZTrpoT9NLOWkJPKBr/w23
         RcLZ87UbU3IsXLGYCCAKCFjSOVrWo4AWwbNiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382076; x=1777986876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+G3TLEROPGFED8nEpk/bFYKEpd/tD5vfNBgNLoHd+A=;
        b=TimvqKmsj6tlNFIcgM/z4qqCA7UDMfM2aw3AxDlBk/Tpsv7hIDTu8u//7bmHh6aRmK
         6yRiGMpq/WvGnxLL48nz2KnxOm2LC7wT2766L0ZTlOq6/TD5YC2uAIq4iW5y1JbBMkSm
         RRHdYcb93L+j7LSocwCnKzFojoE1QzlVFBGQ60tUZcxlqdcweeiUtHthoQ2oXuCZyEha
         M5BMOQVoTt+1Xa6pAyDn1dMF4pQOLKr2KnMgrNwVAPyfCQ/qtfipeQLG4Q8MchCBMFWG
         U2Dje2bMekh95J1vmBRGc3j8g6tHOIFMwbhn0kmQLoizg1oLdPibrsV9OVm2jdcOBPrI
         cLNg==
X-Forwarded-Encrypted: i=1; AFNElJ9hOCZ1ZT3rMdpoPyMWTWTnajoA9vJggKsoQ5eAAKNA4Zk9eOtOvUjEJ7/wjNeoRN4LBgK5t/WOKwp9UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSaLUJhCpT4ncvQcQydPIPBgcjX05a3sscjRMtx7qtYlMINOZi
	RaWCeJXxXHznRVfIv9BpbwQlovYBzBWhX3Vh7qQiswWwO75CzSs0pFUSvdodk48F1+ojx1oreIw
	xtibbhfaW
X-Gm-Gg: AeBDievQdUVFiE9qFpC5poCDvauq3uU7pQmZTFdDJ/pKH1y1+cI7BVlg/YJt3/+dqk9
	aVGcCMsPbxLyew2sRoVzznkDDFdLd2nzhSW+VfUsqtGyjvUYXF2f0eit8acUslKHB/sFxEJicOj
	Ou6a+Xu4vBmhcJAV9/hdvv6/4eLfbT57MjQ+jLu5ANAW1en8EPyddSqkTBpe95pFXW9TOXjqsiB
	o6bdWKHVL5OoKwVmba1uhfe6xoB5trP8umj0ufuc4d3SDLCxCSdy+J2xVOCO3xWdNaED6Iyys2L
	hCRrNJ0GTFFGnhayucCDPhojckNr9oTC1uknR10woP4ZJ/dGo5B1+PWNchUzaiA44Kw/wrL8Qhg
	XoHqIORscpD8sZh8ifcVJejnNT05yo6iDfAz6EjQQ2B0U8PmBX23wQf8tqYnbkDhYdRQCAV3iDZ
	+U70cqR0YedCU4V0Tsg+QzCD4Wr0sPmAPkX3VYud5bPBiDqzqskiIRMg/WGUw4ukxafDr8yzU=
X-Received: by 2002:a17:907:d312:b0:b9e:f58:c581 with SMTP id a640c23a62f3a-bb80443e813mr176311266b.45.1777382075505;
        Tue, 28 Apr 2026 06:14:35 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c181787sm101085066b.59.2026.04.28.06.14.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:14:34 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1900464066b.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:14:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9p1iKM5MuG0rr3xmqVwNtkggip3EBbEc71PUNeRTbGS2Hpv3KR4uDIwEE5EuYFQzXsd38RgrMPjElF9w==@vger.kernel.org
X-Received: by 2002:a17:907:e84b:b0:ba5:dfa6:1e8e with SMTP id
 a640c23a62f3a-bb80100e719mr185594266b.5.1777382073735; Tue, 28 Apr 2026
 06:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org> <20260428131038.GA120836@killaraus.ideasonboard.com>
In-Reply-To: <20260428131038.GA120836@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:14:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
X-Gm-Features: AVHnY4LFHGfHhfWwxoG7ukOxUIkuuRj7xqs5l6SQcLw4hcHZ-Knfdsk_-QkY82U
Message-ID: <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
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
X-Rspamd-Queue-Id: 89C56487604
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59853-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,mail.gmail.com:mid,ideasonboard.com:email]

Hi Laurent

On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> CC'ing Jacopo.
>
> On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > Avoid invalid memory access if the zones_num is bigger than
> > zone_weight.
> >
> > This patch fixes the following smatch errors:
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > index 6f9ca7a7dd88..42d780f684d1 100644
> > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> >
> >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
>
> This is triggerable by userspace, it shouldn't result in a WARN_ON().
> Ideally the horiz_zones_num and vert_zones_num should be validated at
> buf prepare time, and an error should be returned to userspace. That
> will likely not fix your smatch issue though, I don't think it will be
> able to understand that the values have been validated.

Based on the warnings from the other drivers I also suspect that if
you have validated the data somewhere else smatch will understand it.

Even if you add a validate function I would suggest to keep the
WARN_ON(), ideally it should never trigger, and if it triggers it will
get a lot more attention to get it fixed.

>
> Jacopo, do we need to add a validate function pointer to
> v4l2_isp_params_block_type_info ?
>
> > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> >
> >       /* Need to write 8 weights at once */
> >       for (i = 0; i < zones_num / 8; i++) {
> > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> >
> >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > +             zones_num = C3_ISP_AE_MAX_ZONES;
> >
> >       /* Need to write 8 weights at once */
> >       for (i = 0; i < zones_num / 8; i++) {
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

