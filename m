Return-Path: <linux-media+bounces-56931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDr4CihOw2n8pwQAu9opvQ
	(envelope-from <linux-media+bounces-56931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 03:53:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A040D31EE3E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 03:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 421C930E8771
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 02:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4DE292B4B;
	Wed, 25 Mar 2026 02:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbGy9RZw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhsk06AT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D8F4F1
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 02:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406993; cv=pass; b=N8yC4uq21WZL13sxbDKtiZGoUAtniwkstazigtXV0qTJn9kxJr8OPasqw2Irj0AM4mLc5jHfsmm9VF8U3F4MXWmRMc3f1JAtLQk/6qQjfWyEGmUN2dM0nrVArr4DgR/g50bgq2z2VfEuKCgyY9LN1UO3plxSSMjRI7GCRokx3us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406993; c=relaxed/simple;
	bh=76i7rBDggySoObx4iRvXSp2076m+447aqiqTF09wjuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=inPgE/FdxHi90IflhoVJHOaQlmUvLM77Fv113SsPZ3BtmwkgJVU6LiapjlyO6MHKQNXcdV9gMBIoNW6EUgIFRfg/m5z9hjdYD6uj8kuUXUoCGJNklcl4uEhCYBL2SrQS/qlfzlnIVKzkojHYHNz6HlXLxLtucc1uGhptKyz69E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbGy9RZw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhsk06AT; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774406991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZv5QUuwf6bawu66ZDksXY3mr8Wd+eVMWBbPght6IPk=;
	b=UbGy9RZwaCIZi45tDXwC+oLUsfFE7IZXk2RjM7znRI0ChtznJBldoq1RnIpm/MaHihVGGd
	kn/pIhKzfznf1fDCihHsQx9hv0OfUqFyZT59jl2cUp8782E0eHfXiI123y1lrzi7mO+44Z
	hAYz063s5DFgBKO5I8tcZMrIlorHHNU=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-_Fz42SVoOri8zpJErv5E3A-1; Tue, 24 Mar 2026 22:49:49 -0400
X-MC-Unique: _Fz42SVoOri8zpJErv5E3A-1
X-Mimecast-MFC-AGG-ID: _Fz42SVoOri8zpJErv5E3A_1774406989
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-66308f16ea1so18144880eaf.2
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 19:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774406988; cv=none;
        d=google.com; s=arc-20240605;
        b=f6hU7cxZXUKtlrx5Er5mk0q5uR8+mK0L/PUWmGDOwB4OTfomzB7byVTJLr4mjsJSsw
         PBcLh3HZy4VWnqDm01u22FiW5rx6Mqbk17n+o8tyEBvX5ZU5DbAEfQuUR3bfYidXLyx4
         lTMNRDhuutuBAqOiLg+mQHdMe+ZudXctOK+RKpOBmceJOKgk+7SIUefmOuAZRHD3Jc3T
         gM//pn3w2bWwTu5Ia0OufNRRVgRanubD26Ieap8buvVCvDUmZIHU7H9xFN9pjlQAQwol
         O7p9wuU+8UmfwCdi8LFlKMXPxvUNEM4tQWZ6/4nIg8ycXNQBJHoA+HCcOvooJ8RGLaP1
         LHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EZv5QUuwf6bawu66ZDksXY3mr8Wd+eVMWBbPght6IPk=;
        fh=XIr/w6uC3EHZMjeLsA7GN+VP5JK2D9tCjR9cQHP04z4=;
        b=FvqDOmKnNfyslx7bODHwuQQAOJPOhfhpYeATnaVhkz0QE8JMpj6r12gtNvNf4VQY6k
         Lcr9W8GV+fIIgN7di3sJT1RrOyo8/ZdQXDUmNQVCat6nPGYkkyj5nY81G8S6D6nmFOS8
         Ub6l3Bjo07VpdBURXUoQkh2tnv0m0DxLVuoKeLHrLx//N9CCEne5rdNtxap17X+sEXN5
         IOkBm5sDLYtOkYDh6Z/NRVhaGdEPFaK5ZGLT6HLoRsTYUHrb9X+rs9Qmd+bIZERyhe8G
         +u8abDvNz5hPnf4Tj4ZK3mUrc58dsvdEMHHQptMaPdLaD6HanTD01OcLzhDzOiV4NvBS
         C+XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774406988; x=1775011788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZv5QUuwf6bawu66ZDksXY3mr8Wd+eVMWBbPght6IPk=;
        b=dhsk06ATb0idpAQ1ANXb0tKI9GMNONSQcao99Jyl6+HFwWSgGozS5yIc4Uh8rblSt0
         jukTDWGOc8MJaIGRN6Hy1AHAM79rLDzXWE/Rfr0AzW4RBmNMKRlz4eL+oifV189gnlpP
         3D0hNPAGASu3s5k2lGdRKJW1u4fkQ/emFdczFVHLhJQagE9l3O6wr/6/w3hM101yuHmT
         pMfr8aWnU4wkdDBROAT64qrEoGnugCXbCWx7Mk6qtPgC2eHfybM8NxhOkvFV01jruGiP
         lgdNnsW1d/4DPwJrQ6qs5G0CgBw6UuJnyZFrE8sFHMHpZu/lcz7171o0FvnziLuVJsFY
         jSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774406988; x=1775011788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZv5QUuwf6bawu66ZDksXY3mr8Wd+eVMWBbPght6IPk=;
        b=pVDwoixvO7mkVXXTwhyRFRHyPhUYUZucuWDXc+SpCWY9ESenRFLzUImFMhGkk2z5bP
         ien9GOrexSYzCo9A47FRlc8s8diFunzoS72KctloypXVMguU7KMf+Vnp3OeEu8h7NQyV
         TzLWAMaEdaxpcQFOiVcerD3vC5sMajmw2XpWk62SWawrkFctU9CmjgO9c2lU4mY+nYFk
         RPURDteyaX+c9ZeBdqKyaor4fo5+5DWvJSnVgPSz6u6M+UCvhX9b5fXXaT07r2D7lyU5
         l87J78VYZ4kpGKHWbcpkJRDxiQYrBeJP6qXLdhOomEIH49g0r8RbbNYt7ZS7z6VskhBn
         xY7A==
X-Forwarded-Encrypted: i=1; AJvYcCUNaMBhS9a4Kv2NXzxfbP+ZzBUgecMuTrmRGfbxgY8ERtuYHPrOrM4ToFFQjyFceFHNxBN8xAuVMSWccw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwTpbaqAll+AtH54cV88Bd4YOpwcegONVEtmieZEC3HlE/yDq
	CGRrJ+3hFBYykbBLNSkZve3pGjxIzzhGW//AgHCh/Xxtueei+mnDvz0JlAbJKZn3EmH678bdDdo
	suGP2d5jGNwpvzf+cTxbbO7m3ufg/z3Jdv00cuebWHSFKwRUOt1XhyZxRmEsUNVy5+zUEjlj6Gw
	jffD+oZJlbC4jb416DkTUnOiqSOA29UIY+zblaj4lRhtYbkP2zRA==
X-Gm-Gg: ATEYQzxpVtjW91Y47ZsqoUPCn8iiV/CDukthQzRHeCtrE7SHrblC1ObNrSp5/jhe1jd
	hz5PMsEXZgFbJ4CCTfqJHrmXcIH8FQ9uyhi5JXpnIVZJPxyLhAn5Q0XJJUTTB+PSZMlfKBXKeqA
	76yzlp/2DbcqIHtGPfufw0rdeuXkRLLEHRpsIPMxclaQDBB5gicmDGb8bXIWo/yotN1eKLHiJkf
	W31iA==
X-Received: by 2002:a05:6820:2210:b0:67b:b1e0:501a with SMTP id 006d021491bc7-67dff40d3f0mr1252345eaf.17.1774406988420;
        Tue, 24 Mar 2026 19:49:48 -0700 (PDT)
X-Received: by 2002:a05:6820:2210:b0:67b:b1e0:501a with SMTP id
 006d021491bc7-67dff40d3f0mr1252338eaf.17.1774406987941; Tue, 24 Mar 2026
 19:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323071647.38086-1-hpa@redhat.com> <acJaWVxXoskFUc8m@kekkonen.localdomain>
In-Reply-To: <acJaWVxXoskFUc8m@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 25 Mar 2026 10:49:36 +0800
X-Gm-Features: AQROBzAPnN0gADH7M6VBlXT3rbPVqydjdOcUCAfzDoros_Mgel9b6JK-4tkfHqc
Message-ID: <CAEth8oEtGa=KJX25LnSW9nXdC=6TxSQ943OmHRqS8mJCr3jnFg@mail.gmail.com>
Subject: Re: [PATCH v12] media: Add t4ka3 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56931-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A040D31EE3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you for reviewing it.

On Tue, Mar 24, 2026 at 5:33=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> Thanks for the update.
>
> On Mon, Mar 23, 2026 at 03:16:47PM +0800, Kate Hsuan wrote:
>
> ...
>
> > +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_format *format)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *try_fmt;
> > +     struct v4l2_mbus_framefmt *fmt =3D &format->format;
> > +     struct v4l2_rect *crop =3D
> > +             v4l2_subdev_state_get_crop(sd_state, format->pad);
> > +     unsigned int width, height;
> > +     int min, max, def, ret =3D 0;
> > +
> > +     /* Limit set_fmt max size to crop width / height */
> > +     width =3D clamp_val(ALIGN(format->format.width, 2),
> > +                       T4KA3_MIN_CROP_WIDTH, crop->width);
> > +     height =3D clamp_val(ALIGN(format->format.height, 2),
> > +                        T4KA3_MIN_CROP_HEIGHT, crop->height);
> > +     t4ka3_fill_format(sensor, &format->format, width, height);
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
>
> You can move this check after the format assignment below and just return
> 0.

The code below
"""
     *v4l2_subdev_state_get_format(sd_state, 0) =3D format->format;

     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
            return 0;
"""
already assigned the format and checked the try state, so I'll remove
this check.

>
> > +             try_fmt =3D v4l2_subdev_state_get_format(sd_state, 0);
> > +             *try_fmt =3D format->format;
> > +             return 0;
> > +     }
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && sensor->str=
eaming)
> > +             return -EBUSY;
> > +
> > +     *v4l2_subdev_state_get_format(sd_state, 0) =3D format->format;
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return 0;
> > +
> > +     t4ka3_calc_mode(sensor, fmt, crop);
> > +
> > +     /* vblank range is height dependent adjust and reset to default *=
/
> > +     t4ka3_get_vblank_limits(sensor, sd_state, &min, &max, &def);
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, =
1, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     def =3D T4KA3_PIXELS_PER_LINE - fmt->width;
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, =
1, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return  __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
> > +}
>
> ...
>
> > +static int t4ka3_set_mode(struct t4ka3_data *sensor,
> > +                       struct v4l2_subdev_state *state)
> > +{
> > +     struct v4l2_mbus_framefmt *fmt =3D v4l2_subdev_state_get_format(s=
tate, 0);
> > +     int ret =3D 0;
> > +
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_OUTPUT_SIZE, fmt->width,=
 &ret);
> > +     /* Write mode-height - 2 otherwise things don't work, hw-bug ? */
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_OUTPUT_SIZE,
> > +               fmt->height - 2, &ret);
> > +     /*
> > +      * Note overwritten by __v4l2_ctrl_handler_setup() based on
> > +      * vblank ctrl
> > +      */
> > +     cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES,
> > +               T4KA3_LINES_PER_FRAME_30FPS, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_PIXELS_PER_LINE,
> > +               T4KA3_PIXELS_PER_LINE, &ret);
>
> These two appear to be redundant as they're written though
> __v4l2_ctrl_handler_setup() below.

Okay. I'll check this again.

>
> > +     /* Always use the full sensor, using window to crop */
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_START, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_START, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_END,
> > +               T4KA3_NATIVE_WIDTH - 1, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_END,
> > +               T4KA3_NATIVE_HEIGHT - 1, &ret);
> > +     /* Set window */
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_START_X,
> > +               sensor->mode.win_x, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_START_Y,
> > +               sensor->mode.win_y, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_WIDTH, fmt->width, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_HEIGHT, fmt->height, &ret=
);
> > +     /* Write 1 to unknown register 0x0900 */
> > +     cci_write(sensor->regmap, T4KA3_REG_0900, 1, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_BINNING,
> > +               T4KA3_BINNING_VAL(sensor->mode.binning), &ret);
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
> > +{
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(sensor->dev);
> > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +     };
> > +     struct fwnode_handle *endpoint;
> > +     unsigned long link_freq_bitmap;
> > +     int ret;
> > +
> > +     endpoint =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +
> > +     ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > +     fwnode_handle_put(endpoint);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freque=
ncies,
> > +                                    bus_cfg.nr_of_link_frequencies,
> > +                                    link_freq_menu_items,
> > +                                    ARRAY_SIZE(link_freq_menu_items),
> > +                                    &link_freq_bitmap);
> > +
> > +     if (ret =3D=3D -ENOENT)
> > +             goto out_free_bus_cfg;
> > +
> > +     if (ret =3D=3D -ENODATA)
> > +             goto out_free_bus_cfg;
>
> Please check for any non-zero return value instead.

will replace it with
"""
if (ret < 0)
     goto out_free_bus_cfg;
"""
>
> > +
> > +     sensor->link_freq_index =3D ffs(link_freq_bitmap) - 1;
> > +
> > +     /* 4 MIPI lanes */
> > +     if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> > +             ret =3D dev_err_probe(sensor->dev, -EINVAL,
> > +                                 "number of CSI2 data lanes %u is not =
supported\n",
> > +                                 bus_cfg.bus.mipi_csi2.num_data_lanes)=
;
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +     sensor->mipi_lanes =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
> > +
> > +out_free_bus_cfg:
> > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +     return ret;
> > +}
>
> I'll take this one now but please submit a patch on top to address the
> above.

According to the emails, I'll propose a v13 patch to include the
MAINTAINER change and the fixes :)

>
> --
> Kind regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


