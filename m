Return-Path: <linux-media+bounces-9193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C78A31B5
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 17:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B451328299B
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 15:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007FB1474C8;
	Fri, 12 Apr 2024 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eKwRQSCg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A9182DF
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712934028; cv=none; b=WhXVEI2Zd2JQRg6JxKJ1v44tUaS9MDVMBqwiZg+3KLmb/DOvP9WPPOJwdDuR3pz4xcdjwzG+URKQfSB+5Nee26mqhXa1aa+7WktzA+xOM4L0jgRLjLNm1iW3s7ihLswly/3UVvfMWuAiLeEmMvgx4H9I6qDatTCtWXmTNcKksT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712934028; c=relaxed/simple;
	bh=9u46Z+ZyWL+vEYMrirQYxtY6BCVXyqvd2iBYhoGE4oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgdjBbjlRWuNCPpEDyd35bAoAcYgCCJBOV3ng/4UhZwx+aI+SAUnoslrUSTiukTwY1Ez0x5JhP9xWB07eyCXm45rPO8tVBK7OA6McoWTuEGrlUsgB2+oNCJIYU5GyoeLFWz/kZa0IAyMnwtHvYOw/3eVeZrXfQ+odVCCHmo5EFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eKwRQSCg; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7e618c51802so293264241.0
        for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 08:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712934025; x=1713538825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/BpABSOSMtO43OcfaHVzks+e/dXhjEqYkLMHPxVX44=;
        b=eKwRQSCgdoIEBdxQhrSkWVP0PFqVuoo598ekk4SQP1mRlLXGeCtPAQVD38KKXquyFH
         gwxIRY4A7VcA21+3HADhL7bzvWleXMFjCAFeExhLdBf+GMzLMgXXD3KSW9ds7A2oqxC/
         wIoRPe8YTFG5KIPvvUj9HG9BxGyPjebrwyk54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712934025; x=1713538825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/BpABSOSMtO43OcfaHVzks+e/dXhjEqYkLMHPxVX44=;
        b=YYFiccmMMOks5iSaP8TirZUpFgcv3FcWf5Msp19a6W1vnYfVO/EMcp/avWFOcvCKpq
         2aNTej9ZHRezeP8gSfbN4i9MF9wBW3G9PkHIteUVFa+7CPnoGGaLnLWgsYfuHf/ZPYZZ
         +6c5I67TR9FB28h1kSvCqw55F/PluRPvtGeHomufb6G2OyTGJGJ2A3zJAnYKI7z3Q9oJ
         bxD4L7DM3zj9sq9cmoIBYk3yxOyQImT24/CVhmb116PNW8Rfzv+y7LdoN+1xyUlhs7rv
         zwqSn3u3ZgZ4iE5FNTXTzTBBLCYhn3P9zLHsOg68a0PJ0Y05aNpV7wboC3rQG/8NSgTL
         p/lg==
X-Forwarded-Encrypted: i=1; AJvYcCXX/uq/NTe/g5iURra/CrTvxYXBfe1s8VjLuqVS3f411VlxR1ftmsu288Y1n+EaJ+eiC+qVOw1k2TBT8gvu4Dnff6P9v4tTr5WZnj4=
X-Gm-Message-State: AOJu0Yy0yaLXrpPXSrXQnLK56bgjUfjG2i/lH6Gp1SMWrTSdV9tiONtR
	PcPsbSoBbMRALvhB1iA8GbA3EI0mIT+Dz/LQaclsA8ftp2GJnOgbvC+WMiTS2JMDDwOLcPueJQY
	uXA==
X-Google-Smtp-Source: AGHT+IEmJDphcYbw+FtLhMQENcGfGnjkFcnnAwEaP2Vwcc755T/YRLiT+VEuRuxeln3IQOoD5zb64Q==
X-Received: by 2002:a05:6122:169e:b0:4d4:1551:6ef6 with SMTP id 30-20020a056122169e00b004d415516ef6mr3175854vkl.2.1712934025111;
        Fri, 12 Apr 2024 08:00:25 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id f13-20020a056214076d00b0069b5ec80687sm351853qvz.62.2024.04.12.08.00.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 08:00:24 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6962e6fbf60so7809626d6.1
        for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 08:00:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTpDaLYZcND4dMtuO4b93a+ByoELXR3QJiVH4NJtvUkhixz2gYKW6F8OOMhxbXciHI/xaitppuOCfJYkS0Y+t8w2icjiC6Iefb39A=
X-Received: by 2002:a05:6214:3211:b0:69b:54b0:2d0c with SMTP id
 qj17-20020a056214321100b0069b54b02d0cmr4190551qvb.2.1712934024185; Fri, 12
 Apr 2024 08:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410-pack-v1-0-70f287dd8a66@chromium.org> <20240410-pack-v1-2-70f287dd8a66@chromium.org>
 <f7ca4107-0341-4631-8d8d-b9677782ac2f@xs4all.nl>
In-Reply-To: <f7ca4107-0341-4631-8d8d-b9677782ac2f@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 12 Apr 2024 17:00:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCvkRWZXuG7dfw0WXvgT+LHQqG3fx9F1M2P0_9dkB9VOKA@mail.gmail.com>
Message-ID: <CANiDSCvkRWZXuG7dfw0WXvgT+LHQqG3fx9F1M2P0_9dkB9VOKA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: dvb: Fix dtvs_stats packing.
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans

On Fri, 12 Apr 2024 at 16:21, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote=
:
>
> On 10/04/2024 14:24, Ricardo Ribalda wrote:
> > The structure is packed, which requires that all its fields need to be
> > also packed.
> >
> > ./include/uapi/linux/dvb/frontend.h:854:2: warning: field  within 'stru=
ct dtv_stats' is less aligned than 'union dtv_stats::(anonymous at ./includ=
e/uapi/linux/dvb/frontend.h:854:2)' and is usually due to 'struct dtv_stats=
' being packed, which can lead to unaligned accesses [-Wunaligned-access]
> >
> > Explicitly set the inner union as packed.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  include/uapi/linux/dvb/frontend.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/linux/dvb/frontend.h b/include/uapi/linux/dvb=
/frontend.h
> > index 7e0983b987c2d..8d38c6befda8d 100644
> > --- a/include/uapi/linux/dvb/frontend.h
> > +++ b/include/uapi/linux/dvb/frontend.h
> > @@ -854,7 +854,7 @@ struct dtv_stats {
> >       union {
> >               __u64 uvalue;   /* for counters and relative scales */
> >               __s64 svalue;   /* for 0.001 dB measures */
> > -     };
> > +     }  __attribute__ ((packed));
> >  } __attribute__ ((packed));
>
> This is used in the public API, and I think this change can cause ABI cha=
nges.
>
> Can you compare the layouts? Also between gcc and llvm since gcc never wa=
rned
> about this.

The pahole output looks the same in both cases:

https://godbolt.org/z/oK4desv7Y
vs
https://godbolt.org/z/E36MjPr7v

And it is also the same for all the compiler versions that I tried.


struct dtv_stats {
uint8_t                    scale;                /*     0     1 */
union {
uint64_t           uvalue;               /*     1     8 */
int64_t            svalue;               /*     1     8 */
};                                               /*     1     8 */

/* size: 9, cachelines: 1, members: 2 */
/* last cacheline: 9 bytes */
} __attribute__((__packed__));



struct dtv_stats {
uint8_t scale; /* 0 1 */
union {
uint64_t uvalue; /* 1 8 */
int64_t svalue; /* 1 8 */
}; /* 1 8 */

/* size: 9, cachelines: 1, members: 2 */
/* last cacheline: 9 bytes */
} __attribute__((__packed__));


>
> I'm not going to accept this unless it is clear that there are no ABI cha=
nges.

Is there something else that I can try?

Regards!

>
> Note that the ABI test in the build scripts only tests V4L2 at the moment=
,
> not the DVB API.
>
> Regards,
>
>         Hans
>


--=20
Ricardo Ribalda

