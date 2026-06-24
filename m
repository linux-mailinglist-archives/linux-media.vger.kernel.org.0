Return-Path: <linux-media+bounces-65525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jRrKAvOjO2rhaggAu9opvQ
	(envelope-from <linux-media+bounces-65525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:31:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 951416BCF5B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:31:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=f+Yx0tcn;
	dkim=pass header.d=redhat.com header.s=google header.b=Gv4G5wfY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65525-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65525-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 095C2300B1D9
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686393B14A6;
	Wed, 24 Jun 2026 09:31:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55822C0294
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 09:31:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293485; cv=pass; b=UIcfpAS688IO7YsQl5mLydTnvnn/4yl8zokMl7NVYJ1GhL9cMImYgH4G5FUmD5EO9fjJnJdkpSl5zOr6V67uL0MXoMb6BaR07yuHrMYnTOH/iQhRWpdcQ0/EuI0VKWGGbwl4k4sfMI7idrn+Wl0U1sFF8CXdddsRnBzbJLx3rVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293485; c=relaxed/simple;
	bh=clyOGlJuCN2Uhd3yXSwuBl+1rcTCk405cLY92vrqP4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTFz2LLHSN+AA69dmFfYSp9lDWSsWVJNsI4wMgMdtLJxIoJpWcXHYDEokxqKPG2y4xHGUS+7nGFWKf878AlHL4v19PtIq3/g3tM1ApFf4tqHhuIOHdjFMbpeAueOFVHhOKNbNVE92rxEDDq6U0GIiHzJf0B2e9BQrywcGv7RH9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+Yx0tcn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gv4G5wfY; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782293473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FsRBNXhvERwXSz7kR2J8D7WcGba81/6FqRvffY6EHio=;
	b=f+Yx0tcntbUZKskF8N91fjDCDmuZr5QeFW+s4WQ2rePUmq4TxgUZnqiO5EiWv48EHCBGi8
	wFBH8M7mp0gapyioEeEQBkBpYgyIkf/rXpSKM9Cq1vXp6Idlag+byhA9KqNA3u4FhtLJJ4
	s0XVqIIZ1cmPLKb4xtAMCaVvis6lSLk=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-0snc0cUGPNSQpcGJRvb9dQ-1; Wed, 24 Jun 2026 05:31:12 -0400
X-MC-Unique: 0snc0cUGPNSQpcGJRvb9dQ-1
X-Mimecast-MFC-AGG-ID: 0snc0cUGPNSQpcGJRvb9dQ_1782293472
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e757d8937aso988771a34.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 02:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782293472; cv=none;
        d=google.com; s=arc-20240605;
        b=dZtN2HmyZEN21Ssx9Vf102Zjf+umfdm5WGjDWT6PlEGZabOTB8qzcLX3Q9FyY9MHc1
         vbBf/k3MMyoP+ga/vmpXYv1n+4kAFq3e69n/nwEqXinC9PMubGGfrGBZMFE7Su1b6LIY
         bc5hvmFKuiVrZJMEYS3N85WZFstFs7L1GYh3OqRPeVH4tDttBsiLyEeKYzw+gy93PWm8
         BSUeg4Rj0aGvF9hfK0SdA2S0nMz6e5M48lUUAvb0O1Rz/O8874v08WhcYHJRj/zcalnP
         ptqWygvC0p0IQWzQAhLlmz3E0G/dlCS3QXwRH0QzuytjExQ7tI2VWERIdmZcHDwzVAx9
         MY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FsRBNXhvERwXSz7kR2J8D7WcGba81/6FqRvffY6EHio=;
        fh=J/dJZwx1onhw3fQWwD5dPXhG+tFAY2X8RII1Ubs8wv8=;
        b=CSON52qx7MCh5Yrk3o9QEFFDOWGIB2DI/YO9QTAhhzhm9K6tSd0MTXylL854+f1FG1
         NvlO5JUIxXzVsKSaeloUhaP60Em+cBod0mUwIJ1slqoatXgm40RWAYeb69gjKSCKHfjL
         YZmtNI659gP0vZNNKMvltIg+b2udSERf5vqX5F//Y1bnXHFHhh1uhzbWwwj76br6u7NH
         JHDYL5HXnXyV+dewyeYLyLKP06est603jdcDg6oJA4UWkrY3Ss7jfCx33QqmRczjGsZA
         HY5IQcUDMmecn9iFZl3opheWKOCB+BNP6rUdW1RDwxK4hpDbo/zXVc4VKp+SLagP7Bup
         bsSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782293472; x=1782898272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsRBNXhvERwXSz7kR2J8D7WcGba81/6FqRvffY6EHio=;
        b=Gv4G5wfYA0gDbkxVPH6+5t4BomkMfU4rlP1cx3o3fr0K+LXemaCTAiE8J8mBzraeBf
         NRZVaxEwqCKPOktHNracOW8N56XXimB+cRgdL8ruIzy3nJIp9hWsphklOUsoxSTMPXsO
         GgwIG+ed/faqQLDKoy6O7ASGQ/jOTf93X31gBGepCBrvZwxE5F7C2VSnoHLAaFS/sf/z
         kmiYza73iJeUvQQKvTF83DWrPnioztYR5Vc2xy/jvtMxbZR5lYgUMINZV3tsRVAZWHH8
         2KP4cC8qdmcmFXr+TdzTjOvHJ9/FUVrXK7J3tVXGHXfgKs8WkuT26dEUWktTc1lnZfQh
         Fifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782293472; x=1782898272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FsRBNXhvERwXSz7kR2J8D7WcGba81/6FqRvffY6EHio=;
        b=RDLeLW6is0vevCbSXNjRaPorFNxNj7Sbeth41yCb+v/pOs5Ml/YB4Q6Dmq3/65MiEI
         yrdPKf0u+sLTQXQ2XE1OFsK76ZHOTzL4Eme44cmZ+l/9B8UP8JVexloTD3JLVH+pLJ2r
         ecR8poYIon6+4rzuiE2LwcQN3fboPF2tqlG/TCsMVsH6yBZPD0xuYR+LM90do+LwzfP+
         25ebHtyVk163/HhrCQyNUYXKfvlCJFyuKJikJs40A0rjzCmdOaEahrjx6yBwxBNMAQS6
         uRDOUV4U55ohsEsN72RE37wSpXZW+El/SGU7eFPSB2Z3XUI82adRocOt97KTRGtZ6ASe
         dL4w==
X-Forwarded-Encrypted: i=1; AFNElJ8t0QTJuTTu6sGTqbfpkdUU0XWBfxoSVm7ewErkxikK4mic/v8T/Mdjr4aMc4Arjo58h5vz7vhquIGxTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4z8tAsznSxMgu1tzVOfPZ5JdlH8F5dD2ixzo59eA8IaBN60X1
	NmLnlL7egNkBdi3C/o89wNuTqr28KJEJ2KiW5faa3CVzHYeI6xkauyptGFMHxZlInTYWaItKG5u
	R4rv5PDRg/DP6DkEfUPlYrjBloIiyzOlQnd87JFlflh5t1g++ZkZy2nLa3U5Cbj/NJFyxbXpaNj
	JjQm0HFOa4DPaDqZ0NRFq42jRQyFROXwLVZuCITyM=
X-Gm-Gg: AfdE7ckGKvA0wYroUkRXm+n9HK1luQobkbFFzaD3RLaMDrcQLpYHfw2sBWaSSFFJsMJ
	noLoXNuvNorfbKEYptob8oZW9kDdlpJXIaL0gcdu6SC58BNJkdfmj6Ai29clqZJcC7dmmatkHT3
	abwPpwQtjB//BxvPxIQfJ58L/OeFDX5HN+EQrvHaCo8HPPo4z+dLSRAqwFJMDan1uA0Q==
X-Received: by 2002:a05:6830:618a:b0:7e3:a897:5160 with SMTP id 46e09a7af769-7e9794d3e4dmr4686582a34.13.1782293471656;
        Wed, 24 Jun 2026 02:31:11 -0700 (PDT)
X-Received: by 2002:a05:6830:618a:b0:7e3:a897:5160 with SMTP id
 46e09a7af769-7e9794d3e4dmr4686559a34.13.1782293471107; Wed, 24 Jun 2026
 02:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624033508.27391-1-hpa@redhat.com> <20260624033508.27391-4-hpa@redhat.com>
 <ajubmHMhiuRyyLoM@kekkonen.localdomain>
In-Reply-To: <ajubmHMhiuRyyLoM@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 24 Jun 2026 17:30:59 +0800
X-Gm-Features: AVVi8CcypB4lSyWrrRzJSzLyJpSISghENvHyODuESnsvhMrmQSfcoqLJjtGKOQ8
Message-ID: <CAEth8oF4-WY0M=644E6bRYDA+Djg+qz1Jx0KahXxYQghsO46ng@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, Damjan Georgievski <gdamjan@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,intel.com,siliconsignals.io,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65525-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 951416BCF5B

Hi Sakari,

Thank you for reviewing.

On Wed, Jun 24, 2026 at 4:56=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> Thanks for the update.
>
> On Wed, Jun 24, 2026 at 11:35:08AM +0800, Kate Hsuan wrote:
> ...
>
> > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_format *fmt)
> > +{
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +     const struct imx471_mode *mode;
> > +     int h_blank, ret;
> > +
> > +     mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_m=
odes),
> > +                                   width, height, fmt->format.width,
> > +                                   fmt->format.height);
> > +
> > +     imx471_update_pad_format(sensor, mode, fmt);
> > +
> > +     *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;
> > +
> > +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return 0;
> > +
> > +     if (media_entity_is_streaming(&sensor->sd.entity))
> > +             return -EBUSY;
> > +
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->vblank,
> > +                                    mode->fll_min - mode->height,
> > +                                    IMX471_FLL_MAX - mode->height,
> > +                                    1,
> > +                                    mode->fll_def - mode->height);
> > +     if (ret)
> > +             return ret;
> > +
> > +     h_blank =3D mode->llp - mode->width;
> > +     /*
> > +      * Currently hblank is not changeable.
> > +      * So FPS control is done only by vblank.
> > +      */
> > +     return __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > +                                     h_blank, 1, h_blank);
> > +}
>
> ...
>
> > +
> > +static int imx471_init_state(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *sd_state)
> > +{
> > +     struct v4l2_subdev_format fmt =3D {
> > +             .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
>
> The purpose of the init_state op is to initialise the provided state only=
,
> it's not allowed to change the sensor configuration.

The input parameter sd_state could initialise it. I'll change this as follo=
ws
.which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;

>
> > +             .format =3D {
> > +                     .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > +                     .width =3D imx471_modes[0].width,
> > +                     .height =3D imx471_modes[0].height,
> > +             },
> > +     };
> > +
> > +     return imx471_set_pad_format(sd, sd_state, &fmt);
> > +}
>
> --
> Kind regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


