Return-Path: <linux-media+bounces-62846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBIQA/COFmrHnQcAu9opvQ
	(envelope-from <linux-media+bounces-62846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:28:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66F5DFD1A
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55A82303F99B
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 06:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5643630B7;
	Wed, 27 May 2026 06:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VYrNmvKN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q+TCSJY2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC2E3603EC
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 06:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779863085; cv=pass; b=Skd7BcFsz2YQ3thHyZTKOwGRthwPb432MuNtv2lgHHodSBWFAMgbENQ8jadZDH9lYUloRzyBDP44Sb60ErXOzKmcNgG9m6Vb2XRWwgA0ia2LWso4Ii3d2SxLC6HTSj3YMggIDEZuE8gI/QdU/qY+z6jg7+kFjf3l2yZXuo+HeQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779863085; c=relaxed/simple;
	bh=2gPlpZeV5yEIzm9JGMbKapxj071Mc1ivZmmE1Dp5Rp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGDE+NPKqpy7Wa3IK+5xiAaxqZ1+zjrnjlMGwWvciSSq9FnI/TQaNbdlbDuxAb6xB85fSGs4ghoiCQ2wUXPzwKa4+pjqmkiZrpYWZ1hoIojHqba+vcauaodSRC1petd13Y+w2RJ2ycxGNKcSovpR0l+zFQH+TKCp3V6RpJU/1mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VYrNmvKN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q+TCSJY2; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779863080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3A/qVC7ATA19juH0/mLWg9+jSGj0iuLnbDKGPfnHbjI=;
	b=VYrNmvKNmtvE7vN/fka/ahahlpi7xpblnZJLY4Xa5WcEFnctMzsJIA+Jenf4S66aeIpc4k
	kSN+o2vxABXaMCf3ZB5S9UCZ6F6yP5C79GmY0+5FmBBcGnBct6YEUe1W1GLq5QW7/NMxzO
	QuPOJFNynW2PHZ+2phvkZMEa3njfC48=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-Sezlp4buMja6GHL7YhZRIw-1; Wed, 27 May 2026 02:24:38 -0400
X-MC-Unique: Sezlp4buMja6GHL7YhZRIw-1
X-Mimecast-MFC-AGG-ID: Sezlp4buMja6GHL7YhZRIw_1779863078
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43a60eba349so4135965fac.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 23:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779863078; cv=none;
        d=google.com; s=arc-20240605;
        b=fypOyLBit91wjtdS86V1eOzblE5ZtdYEMufpzY9XK0FlqA5ncmRqGxuoMMnQiy2mwT
         78sQb4PPfJUr0+0pBSd7S2p8f3BNbs6B9lTSZDoQUMm/b/1F9qix7n8+Q2h7EM0kAOzJ
         7LsWSt2R30B2b6/zEHIpLDPEZbsxlQAk6pB2uIQ0TafK+zJp6HtoiyTauFWz0Qr22otT
         0pW1PaUfNmXT6WouAYNZQtyCv5q/rPpOet3YCt2C26XumvOJPO/0rg4YMfF2G/wo8ush
         E3pK7R7dIMr2dv6YgWyNfPIKSacv+q7P5IdhbK0/Ij81DnAtPSOSaBmuG1bp74mMYj2y
         SHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3A/qVC7ATA19juH0/mLWg9+jSGj0iuLnbDKGPfnHbjI=;
        fh=d5S6Sr6BliXwUSepg513eESm9+cxXaSzNghfZ7rI36s=;
        b=Ol8VymJHDuuomb8HLEzoKqpC2HK96OJi1RKeEsknxAryghIR0bXIsRt5WU2L726GDF
         77JgRaIwDOvDnHIap+iGC0FJI/wU3oIKo0cSZNzmb2tmoKn5GI3lgjpi4iwcqTykfJNw
         JUoILH+NZvNhcKYs35URScPSCNuxmT85qjMTK7G7RFrjzHMGbdWEhOk0IgP0BQHVfrel
         G11V+CuJ6ir/HGy0t5LlZ5vYkWK6lfsXM3ctW8YrMQD/34D4RFFdEfFrl/Xzds/Y+pDl
         amOi21s5oUTQbjbNHSJY60s0YZdr7QaNLUfGDEHBLMz82t7E1ZTl9mvr2nXtrhQP50ot
         uujA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779863078; x=1780467878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A/qVC7ATA19juH0/mLWg9+jSGj0iuLnbDKGPfnHbjI=;
        b=q+TCSJY2QezyZrfB8OPKrtgPH/56v/CFYBC134cw8wpAT3okz+yGwEoF8UnU/U1/f+
         rkRirnXv2G7Xq0IjmHh9Q8pUgUjM0GAqWLKjt+uBXzh3WdML+wyJSWh3ZoSlUJbKhX8M
         oVpX9FWOgAhLh0U88Et4s7s0FBuYrNm+N3GNZUfNj553oBJP8QMXVJoDWGh+Q7QseGqr
         55j3nbB8MlYU1nOZExFbSjsXQxnRRHY8f6CrQvzqlYUK2rotPDF+6ErKFTKb9pnhKT5G
         5x5NVLdkR0st1J3l1q+pzrRPZBlFO58a2iaD35uTbmoL8mBORJDxTE+it3qSLlpjTknd
         oLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779863078; x=1780467878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3A/qVC7ATA19juH0/mLWg9+jSGj0iuLnbDKGPfnHbjI=;
        b=j1XFB/Speb93Yvc2XrClAjaDH0yJ8d7rWyQDcPc2k7uYreGKxmX2wccLFT4NpdeZ53
         m8BCq7GpcijkvdnpN5n6mWM9WA7Juvu0trD+tmIEylR5kl8chwwh3az0HVh4ihhZQ+/E
         ouypanc/x6R1Hxstzjn1rx/ltnlyF28F0WKZiYKLPjeLBhbicAv5JVqpklcTJiWnP/dC
         wbEXNid+LkoqN/tmWnIBLqJYq4hC0JN71egEGVG99ZuQZmdNwbHS+wTKgVRbVIRiaj+C
         Q7DseAZeYk3K/mYvAAZWYZd6Hv+LEQ50q1pdZOW+Qro1NbGGWmA3us8GcMt/pZuZs+GD
         ovQg==
X-Forwarded-Encrypted: i=1; AFNElJ/wrKrJ0oXCRsYNdKShD06aUJ3jvsXYjgL/+sdjJ/Jq6ifYPaIr76SKvXAvxOBM3iFWc+8FmUKgX7pjRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4qm+/NEpe3/yrEb/cG7RRz3C32xeWNSYZQ0eMOI9+dl84rD8Y
	FgTFEi9AVaWapU/lAdIj1MHOgf1ufPSUGmDFTR630x+p6JhM34RpZjy6QWmWahJEFX52qoCz7Wk
	+Pg8O+qIrTbG0A6cqbZGhDEoqHywupWHIvFHidCmusynaZrNqGb3jr8882nz5SQSFviv2n5GaXM
	A/DOmzkXpsGg1XnUMlVjPqpCiaQ7p5Y++yWGQjOQg=
X-Gm-Gg: Acq92OHTPMfqHEUoQflZNlaMpGrR4EENi6KZdHIQ5TqEeFQzffx1qHxyFZ1WR1gMhqY
	0xwJTIdZr/1gaLRioRHjQ2C1N4GkXCCBldKoyOPw1YHD5ij6692cmfgxcObQ4/dLwi70Oox3e00
	9WJbVCO57T5eZvgTtx+jH6ikqetRGTLelR+skwy74gQ/nu3/EF4oeSgTdBhnlUhqrH6NQ5oBN9W
	7ODHIK+rQE5wfs=
X-Received: by 2002:a05:6870:c08c:b0:424:684:c423 with SMTP id 586e51a60fabf-43b5adca781mr12614125fac.18.1779863078048;
        Tue, 26 May 2026 23:24:38 -0700 (PDT)
X-Received: by 2002:a05:6870:c08c:b0:424:684:c423 with SMTP id
 586e51a60fabf-43b5adca781mr12614110fac.18.1779863077652; Tue, 26 May 2026
 23:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522031121.11968-1-hpa@redhat.com> <20260522031121.11968-3-hpa@redhat.com>
 <PN3P287MB182919EBD2C36CBBC0A8D8598B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <ahDa2Vj56-S7R6JH@kekkonen.localdomain>
In-Reply-To: <ahDa2Vj56-S7R6JH@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 27 May 2026 14:24:26 +0800
X-Gm-Features: AVHnY4LKSVwQZmqDCW5bDavq0R3kDKnGicANKvnCPaEcyim_C8Bytg__8p4tsDU
Message-ID: <CAEth8oHXg-Fwf95+EBFcXeRcpXPU6-dc_PyVXrtVo4NJ3u1ZAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Serin Yeh <serin.yeh@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62846-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9A66F5DFD1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 6:55=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tarang, Kate,
>
> On Fri, May 22, 2026 at 11:12:53AM +0000, Tarang Raval wrote:
> > > +/* Exposure control */
> > > +#define IMX471_REG_EXPOSURE                    CCI_REG16(0x0202)
> > > +#define IMX471_EXPOSURE_MIN                    1
> > > +#define IMX471_EXPOSURE_STEP                   1
> > > +#define IMX471_EXPOSURE_DEFAULT                        0x04f6
> >
> > Better to use a decimal value here.
>
> I'd rather just initialise this to the maximum instead of a fixed value.
I can set the max value when creating the exposure control and drop
the default value.

>
>
> ...
>
> > > +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +       struct imx471 *sensor =3D container_of(ctrl->handler,
> > > +                                                 struct imx471,
> > > +                                                 ctrl_handler);
> >
> > Use container_of_const.
> >
> > > +       struct v4l2_subdev_state *state =3D
> > > +                       v4l2_subdev_get_locked_active_state(&sensor->=
sd);
> > > +       const struct v4l2_mbus_framefmt *format =3D
> > > +                       v4l2_subdev_state_get_format(state, 0);
> > > +       s64 exposure_max;
> > > +       int ret;
> >
> > ret =3D 0;
>
> Or assign the return value to ret below. Either works.
will fix it through ret =3D cci_write(...);
>
> >
> > > +
> > > +       /* Propagate change of current control to all related control=
s */
> > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > > +               /* Update max exposure while meeting expected vblanki=
ng */
> > > +               exposure_max =3D
> > > +                       format->height + ctrl->val - IMX471_EXPOSURE_=
MARGIN;
> > > +               __v4l2_ctrl_modify_range(sensor->exposure,
> > > +                                        sensor->exposure->minimum,
> > > +                                        exposure_max,
> > > +                                        sensor->exposure->step,
> > > +                                        exposure_max);
> >
> > This control operation can fail. Please check the return value.
> >
> > > +       }
> > > +
> > > +       /* V4L2 controls values will be applied only when power is al=
ready up */
> > > +       if (!pm_runtime_get_if_in_use(sensor->dev))
> > > +               return 0;
> > > +
> > > +       switch (ctrl->id) {
> > > +       case V4L2_CID_ANALOGUE_GAIN:
> > > +               cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN,
> > > +                         ctrl->val, &ret);
> >
> > You are using ret for the first time here, Please initialize ret with 0=
 when
> > declaring it.
> >
> > cci_write() uses the value pointed by &ret to determine whether a previ=
ous
> > error has already occurred, and an uninitialized ret may contain a garb=
age
> > value, causing the write operation to fail unexpectedly.
> >
> > > +               break;
> > > +       case V4L2_CID_DIGITAL_GAIN:
> > > +               cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_GLOBAL,
> > > +                         ctrl->val, &ret);
> > > +               break;
> > > +       case V4L2_CID_EXPOSURE:
> > > +               cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> > > +                         ctrl->val, &ret);
> > > +               break;
> > > +       case V4L2_CID_VBLANK:
> > > +               /* Update FLL that meets expected vertical blanking *=
/
> > > +               cci_write(sensor->regmap, IMX471_REG_FLL,
> > > +                         format->height + ctrl->val, &ret);
> > > +               break;
> > > +       case V4L2_CID_TEST_PATTERN:
> > > +               cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN,
> > > +                         ctrl->val, &ret);
> > > +               break;
> > > +       case V4L2_CID_HFLIP:
> > > +       case V4L2_CID_VFLIP:
> > > +               cci_write(sensor->regmap, IMX471_REG_ORIENTATION,
> > > +                         sensor->hflip->val | sensor->vflip->val << =
1, &ret);
> > > +               break;
> > > +       default:
> > > +               ret =3D -EINVAL;
> > > +               dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not =
handled",
> > > +                        ctrl->id, ctrl->val);
> > > +               break;
> > > +       }
> > > +
> > > +       pm_runtime_put(sensor->dev);
> > > +
> > > +       return ret;
> > > +}
>
> ...
>
> > > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > > +                                struct v4l2_subdev_state *sd_state,
> > > +                                struct v4l2_subdev_format *fmt)
> > > +{
> > > +       struct imx471 *sensor =3D to_imx471(sd);
> > > +       const struct imx471_mode *mode;
> > > +       int h_blank;
> > > +       u64 pixel_rate;
> > > +
> > > +       mode =3D v4l2_find_nearest_size(imx471_modes,
> > > +                                     ARRAY_SIZE(imx471_modes),
> > > +                                     width, height,
> > > +                                     fmt->format.width, fmt->format.=
height);
> > > +
> > > +       imx471_update_pad_format(sensor, mode, fmt);
> > > +
> > > +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->fo=
rmat;
> > > +
> > > +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > > +               return 0;
> > > +
> > > +       if (media_entity_is_streaming(&sensor->sd.entity))
> > > +               return -EBUSY;
> > > +
> > > +       pixel_rate =3D IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> > > +       div_u64(pixel_rate, 10);
> >
> > You need to store the return value, as the above operation does not upd=
ate
> > pixel_rate.
> >
> > Please use:
> > pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> >
> > > +       __v4l2_ctrl_modify_range(sensor->pixel_rate,
> > > +                                V4L2_CID_PIXEL_RATE,
> > > +                                pixel_rate, 1, pixel_rate);
> > > +
> > > +       __v4l2_ctrl_modify_range(sensor->vblank,
> > > +                                mode->fll_min - mode->height,
> > > +                                IMX471_FLL_MAX - mode->height,
> > > +                                1,
> > > +                                mode->fll_def - mode->height);
> > > +
> > > +       h_blank =3D mode->llp - mode->width;
> > > +       /*
> > > +        * Currently hblank is not changeable.
> > > +        * So FPS control is done only by vblank.
> > > +        */
> > > +       __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > > +                                h_blank, 1, h_blank);
> >
> > All the above control operations can fail. Please add proper error chec=
ks for them.
> >
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int imx471_get_selection(struct v4l2_subdev *sd,
> > > +                               struct v4l2_subdev_state *sd_state,
> > > +                               struct v4l2_subdev_selection *sel)
> > > +{
> > > +       switch (sel->target) {
> > > +       case V4L2_SEL_TGT_CROP:
> > > +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel-=
>pad);
> > > +               break;
> > > +
> > > +       case V4L2_SEL_TGT_NATIVE_SIZE:
> > > +               sel->r.top =3D 0;
> > > +               sel->r.left =3D 0;
> > > +               sel->r.width =3D IMX471_NATIVE_WIDTH;
> > > +               sel->r.height =3D IMX471_NATIVE_HEIGHT;
> > > +               return 0;
> > > +
> > > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +               sel->r.top =3D IMX471_PIXEL_ARRAY_TOP;
> > > +               sel->r.left =3D IMX471_PIXEL_ARRAY_LEFT;
> > > +               sel->r.width =3D IMX471_PIXEL_ARRAY_WIDTH;
> > > +               sel->r.height =3D IMX471_PIXEL_ARRAY_HEIGHT;
> > > +               return 0;
> > > +       }
> > > +
> > > +       return -EINVAL;
> > > +}
> > > +
> > > +static int imx471_init_state(struct v4l2_subdev *sd,
> > > +                            struct v4l2_subdev_state *sd_state)
> > > +{
> > > +       struct v4l2_subdev_format fmt =3D {
> > > +               .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
>
> You shouldn't be setting the active format here.
I'll drop it.

>
> > > +               .format =3D {
> > > +                       .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > > +                       .width =3D imx471_modes[0].width,
> > > +                       .height =3D imx471_modes[0].height,
> > > +               },
> > > +       };
> > > +
> > > +       imx471_set_pad_format(sd, sd_state, &fmt);
> > > +
> > > +       return 0;
>
> ...
>
> > > +static int imx471_check_hwcfg(struct imx471 *sensor)
> > > +{
> > > +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> > > +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > > +       };
> > > +       struct fwnode_handle *ep, *fwnode =3D dev_fwnode(sensor->dev)=
;
> > > +       struct clk *clk;
> > > +       unsigned long link_freq_bitmap;
> > > +       int ret;
> >
> > If you want, you can sort the variable declarations throughout the code=
, where
> > appropriate, by length to make them more readable.
> >
> > > +
> > > +       clk =3D devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> > > +       if (IS_ERR(clk))
> > > +               return dev_err_probe(sensor->dev, PTR_ERR(clk),
> > > +                                    "can't get clock frequency\n");
> > > +
> > > +       if (clk_get_rate(clk) !=3D IMX471_EXT_CLK)
> > > +               return dev_err_probe(sensor->dev, -EINVAL,
> > > +                                    "external clock %lu is not suppo=
rted\n",
> > > +                                    clk_get_rate(clk));
> > > +
> > > +       ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > > +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > > +       fwnode_handle_put(ep);
> > > +       if (ret)
> > > +               return dev_err_probe(sensor->dev, ret,
> > > +                                    "parsing endpoint failed");
> > > +
> > > +       ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_fr=
equencies,
> > > +                                      bus_cfg.nr_of_link_frequencies=
,
> > > +                                      link_freq_menu_items,
> > > +                                      ARRAY_SIZE(link_freq_menu_item=
s),
> > > +                                      &link_freq_bitmap);
> >
> > This can fail silently. Please add an error message before returning th=
e failure.
>
> v4l2_link_freq_to_bitmap() does print errors already, don't do it here.
>
> >
> > > +
> > > +       v4l2_fwnode_endpoint_free(&bus_cfg);
> > > +
> > > +       return ret;
> > > +}
>
> --
> Regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


