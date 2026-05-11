Return-Path: <linux-media+bounces-61147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD9YFQX+AWppnAEAu9opvQ
	(envelope-from <linux-media+bounces-61147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:04:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B88511C26
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E62E230A41FE
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D487641B37B;
	Mon, 11 May 2026 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BBpto/5I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9A7402B89
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514994; cv=none; b=lGqNx43oK4MfiRWbnkfKBJrUFjTF5ATosH4/DeQXI7S90meN2sPjrhzvkdCCbQa3xGd1tQrfX+SLi392pvhH3E/14BGfWtOwU/2Fxnfp85TmMD0gv85gDUu0+NO/UiXOLLj//+e2Fn61+EV8PxAcFF8jP5qx6Vxpy2qnMsGiX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514994; c=relaxed/simple;
	bh=26Z5zACiBEmeh57u1zpWGmh+HK9C+rNPbX7cWfwXieY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbR5l+vqwsuww0Hq3PaKiRjXIadhEXzDD6GsAjBWeq+zdULvU+dRxp5uOl9U1Q6aZEW7wbxYiyuVd0ymvetMfXEi9Whysj++wT2vEio6uEOE9RuezjMVHdLT8iCZoXDXHPbh7aA4aOE8JBqJ83K6LTar/40Po14yzO2orKtz654=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BBpto/5I; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f97c626aaso750746066b.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778514991; x=1779119791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V8N1U/Qyj3QR7QkqyWRXyEthKrpdzgJBz+nYOsIhbBo=;
        b=BBpto/5I+TwFggsKxnpB1NE8QJSu+Y7VnKUZQkPv1htHf5lnfXx8G4K4Z5nMedvGwu
         kSj1YP8Jw8Aw1F/6bqtAn3Tc1KE7lNzru3KZRjn5VbczorZRh9dDwh7QoU0fEj+GlswF
         PtHLHTKT+qhdDu04c/VFY+YXl5eF4IJJmCYmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514991; x=1779119791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8N1U/Qyj3QR7QkqyWRXyEthKrpdzgJBz+nYOsIhbBo=;
        b=R+u9yz/D+OWVLJZzFO8hbtDDLiXg1mg1m2C5FWnv2+fVMRwy3/UYPUO2o83Tb920nD
         gp8HS8iuYT00ztatvMF9xHS76cs89MmgB3DSvUbxiwMXDqgAQGAhx9+MAfp/R3cjCWhC
         G8xXwHBz48F3FEqR9ihTNOWz8rqORGCCEC6zznL+VwzL4WncNdR62S0UftPP4Lnml9f3
         x853TZsB0FVRNeUjNkRmbIusHi2BjywcGvyUIK8pqXk3CoRgp4JFgTAzaIml3PSjErK+
         5gEuuuOm1Wvgl/s6BUye6obpOMbpo3VtFJKXdplS/vcLi1A7buivVHN3dMLJO5ywBysG
         mh3A==
X-Forwarded-Encrypted: i=1; AFNElJ+Zjh8olQrsxlDyYc1EqqjC6FTCnK3xaoNeQa8J3mEwamo0oOoEWgwAfE5KjlPn8Loe957bulogTeKLlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEfdgZtA9TBMYOzO8pa/MM2b7o2HaQpSiQXPjLLlxcDrxgljM
	p2nGfnTWExm5/lAq8CPq+VBpE9VSgB1ILrDuMjiFfPm7vTnD08HO5CjqTdyWYDNmmmsIpWfQ2EO
	xBc0=
X-Gm-Gg: Acq92OH13B+DfOYKqbOtltAhKDGDxYKxjHLm1Kg9hW0/7RjXn8f4Vz4AyfmfheK+ZfE
	mpmJK8JDWeMNr3bETB0p3G7tZIn9m/o4SC2qrH60dEb00shzPm2nXco5Uas+b9ywbc2hGk8nJne
	I61TnmZwyszEblGsF9VELm34QRp3nkSljaHt30gvG9deyC28RzHS87isAelO0yjBQbBTe8amN0/
	FLNt08GNF/swy5Xz5cHH+795iBC7SJe6O64YX1sjkaT3fNMpXR9qS5JVxas4kbzR7Xe1iAoxga4
	SBfAWVLHCD40gkppj44uO6rTlDnZb0APS+Q+zaFBBxl6Tsnid5TXajL8+UsDoR8IQLrzD3iPhmo
	ymGwrVGHQJPaeBZur1NaeNA4IFLZrIpyj+9VRwh6maGCptsvLiwNaFQq73L6rCgTKsKVU77mtRK
	EC99iOCtvoefQG1U8W+I/5PmL5TWz3KcxF6qUDFRK+oZB791Y8nDB/s0bDZhDQ
X-Received: by 2002:a17:907:1ca7:b0:bce:2050:a0c2 with SMTP id a640c23a62f3a-bce2050bba9mr384406266b.0.1778514990668;
        Mon, 11 May 2026 08:56:30 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd09513b8cesm134547766b.38.2026.05.11.08.56.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 08:56:29 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bc66ad3742fso735163566b.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+NBKVUETLIRpDACAHQ8QwgMjK+Ep6NqC0P9kzjN/sv92fLK0uucrYXaHuZLdnkuk6VLhgwOc4M1Ed2Yg==@vger.kernel.org
X-Received: by 2002:a17:906:7946:b0:bc6:14b3:e835 with SMTP id
 a640c23a62f3a-bcaac454f5amr778837666b.32.1778514988144; Mon, 11 May 2026
 08:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-1-aa42e3865204@chromium.org> <20260511154629.GB3043805@killaraus.ideasonboard.com>
In-Reply-To: <20260511154629.GB3043805@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 11 May 2026 17:56:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCuhk-xdFcXBfsXMtjDERmj_A4TGDLMBKiQZyVuaQCtbgg@mail.gmail.com>
X-Gm-Features: AVHnY4J56rIMhLc06nCkSPl4V0Q1aa58PkNztLW1yCu0dHF_rEy9aAbm3MLbfKk
Message-ID: <CANiDSCuhk-xdFcXBfsXMtjDERmj_A4TGDLMBKiQZyVuaQCtbgg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: uvcvideo: Fix dev_sof filtering in hw timestamp
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E6B88511C26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61147-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,ideasonboard.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026 at 17:46, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Mar 23, 2026 at 01:10:28PM +0000, Ricardo Ribalda wrote:
> > To avoid filling the clock circular buffer with duplicated data we only
> > add it if the new value sof is different than the last added sof.
> >
> > The issue is that we compare the unprocess sof with the processed sof.
> > If there is a sof_offset, or UVC_QUIRK_INVALID_DEVICE_SOF is enabled,
> > the comparison will not work as expected.
> >
> > This patch moves the comparison to the right place.
> >
> > Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 40c76c051da2..6786ca38fe5e 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -583,16 +583,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       if (!has_scr)
> >               return;
> >
> > -     /*
> > -      * To limit the amount of data, drop SCRs with an SOF identical to the
> > -      * previous one. This filtering is also needed to support UVC 1.5, where
> > -      * all the data packets of the same frame contains the same SOF. In that
> > -      * case only the first one will match the host_sof.
> > -      */
> >       sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
> > -     if (sample.dev_sof == stream->clock.last_sof)
> > -             return;
> > -
> >       sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
> >
> >       /*
> > @@ -664,6 +655,16 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       }
> >
> >       sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
> > +
> > +     /*
> > +      * To limit the amount of data, drop SCRs with an SOF identical to the
> > +      * previous one. This filtering is also needed to support UVC 1.5, where
> > +      * all the data packets of the same frame contains the same SOF. In that
> > +      * case only the first one will match the host_sof.
> > +      */
> > +     if (sample.dev_sof == stream->clock.last_sof)
> > +             return;
> > +
>
> We will now uncondtionally call some potentially more expensive
> operations, in particular usb_get_current_frame_number(). Wouldn't it be
> better to store the unprocessed SOF in the sample in addition to the
> processed SOF, to allow early comparison ?

Works for me. But I'd rather do it as an optimization 5/5

I would like to have an early equality comparison against the
unprocessed_sof. And then a similarity check as in 4/5 with the
processed_sof
>
> >       uvc_video_clock_add_sample(&stream->clock, &sample);
> >       stream->clock.last_sof = sample.dev_sof;
> >  }
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

