Return-Path: <linux-media+bounces-56177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKo/DItUumm8UQIAu9opvQ
	(envelope-from <linux-media+bounces-56177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:30:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE02B6F25
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DB6630620F3
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 07:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9580036AB52;
	Wed, 18 Mar 2026 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+MgsKyy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqEfgqkj"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635DF2264AA
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 07:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818956; cv=pass; b=svtqy2xjs0TEwEWOHvSNCzpyi/jQfbyZy1hO+Gjrpga57iNaRHsu+ND6+/pXTGYMhwEFJG1wJnXoMR2zybGbrdnIz8K7OJNBYkVsGi+4j8vqdUPDWuSaW0G3R7ArQiZGz+V9/BKYOogfRTRlQz2thMPT9CfqxVyPAMdmls/hMYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818956; c=relaxed/simple;
	bh=VNVi4qAlpHN2tyxw3mLQStKUx03Gmtu4kxNzvHEbgUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg+wWrMXI8EypIQfrJ3nUUe0pNdOj18fUpRz8QgyzCOAnts4OIeRW9WHJoSZLT7SmHuqb9t6tm7mpqQ8zT9zq3wMFskKTrNh9tdwyzQiluEN3Yl3/PakcNceZ6VjjeQOQgi59d4uO6m4rq7w6D19Vr0bkZFNMMk94DmmQBgCocA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+MgsKyy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqEfgqkj; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773818953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xr0XwmFLGJMnPiuKVbJ2UmzSLNxukv7BddBzFr0oupo=;
	b=Z+MgsKyycmbcxE1O6AZ8EvRpl/1+34KwHGC7v5U8BBqtyCstWQMJKwhmnCNM0pMIFeLwUw
	UZISswrQlAVJMkNYfhNdNWY5QhmYCKINXvXCFqS0bGwGYiLy7bP2iMTrrW/Kqt/zodbL3k
	gi/FOlU0LmMmHxOgWJk5HnYppID3vPE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-oH5VUsOxPuaf1ASZ2QWK7g-1; Wed, 18 Mar 2026 03:29:11 -0400
X-MC-Unique: oH5VUsOxPuaf1ASZ2QWK7g-1
X-Mimecast-MFC-AGG-ID: oH5VUsOxPuaf1ASZ2QWK7g_1773818950
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d742da766aso28939794a34.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 00:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773818950; cv=none;
        d=google.com; s=arc-20240605;
        b=VNKb3cXaFH2NGlSJXeY9loeQ+o+NetdV65gokxgxGTCS70Ukb07bjBl0tp77DEIf0X
         W9AogZsQml9dP7XHJuIizXjrVXEDzBode2l+Ej7kin0vAzXCZsfLhzEJbUDl2GdZI8gg
         hOoNMETQoNziqz0PFdwxQvdCZzmcz2PnaJYp3FunDMaJIBRvEnmEWqG5uOBa75sZRKHn
         bhR77KwGHOmkMs5UytLVD4WjjuGzP9ViP8Mufe2bGmbLOlRdrXCpa2zW0AhgiC3QNF8J
         YNCqha+k5bE7gLpstbUX5smEHSxbKZqhnQDNfMsnu/HnYfiWqXA91c4mHYui7cUrppLW
         nf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xr0XwmFLGJMnPiuKVbJ2UmzSLNxukv7BddBzFr0oupo=;
        fh=FUNpDbbvTwtRDhlk9ShOeXAW+EbUAwECOcmp2IxE5+o=;
        b=YeXcc1DhL/0TBApMxrWm8r2iBMsQbVaSeReEec7LFSxQtc1YawdLTXJ8g0oGadPqbM
         JFd9IrhVKlqnCMl8TO78vs/1DnwvfaDmrCbn/e0+PgXQS0u/G2CzHLO3GTcETlZeJuaL
         Kx7gIFvs9PDvsDRXGsx4g9zzqNwofolDxXV09GW2Sfbv/042ZBzOBWv/kM2r+UY3ewnp
         byo9SAhpKCJ4wtYSSLxCYFO1jHLl9N/bQQ+Oxcl7504oNl9Ls0j6pnGmySx5Fd6LM9lG
         Pzw+O+5qYZkHMl8Fc5LZ2HuhollKB282nUl+eKM45CP8hJRSFXReKpgWTNm8TPsgN1yx
         33Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773818950; x=1774423750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xr0XwmFLGJMnPiuKVbJ2UmzSLNxukv7BddBzFr0oupo=;
        b=dqEfgqkjZocO0jI5W/LuBAsFJAP9I97rJfd535B/8QR3ahK01OdJeyIdqP16zPEwSX
         ZHOlzU8yUNJOORnW0VKBAXYhHgjJlENWQfkdleID4y5+yxpDEHJfR3rbwADs1GWVzuE3
         WtjLMXckUK/y54RXCkJJkWHSaEBiNxC/iCSuOpbu/s7QIKyXpwUh4ZU0RTLqJAJMx8BL
         MPuz9JsxShFUY2RehVWniE+yXKSf3+bZTBguO6m2YBERS8mXMlvaxtw0EhZ93Q24XpNJ
         5dRvHbvyY5yXMu4P1Hl3yqbBap8t0tNIWMPzmFFxr0V9E58yzfvcjS7ipQ72BCKziOzF
         ospw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773818950; x=1774423750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xr0XwmFLGJMnPiuKVbJ2UmzSLNxukv7BddBzFr0oupo=;
        b=JFHK5FiXWNuz2Gcmo+vy/iKgzU7euxjlGOqfcyHfShxkvofYh0ZUWbwWglLiWHinbl
         TO4S9K9Hz6WYOLInwpL9WfITWZQmOEssJeDAJW5tDqR7aEi6mGuxr4Sfb4Zwn9nbo1s1
         ud09zfXjywQUSXKuEUYnJOzABRwxmCkEVklfhSECNIH+JWRE2OHrUttjDyj0zG6M1MlM
         h6kiL9QHFvAW42JVu8+1Uwz4TgRU+kw/21Z6in8rO/kSZA1qEGgCTY6ejzyGpskW97Id
         tZ45noGt7lnGdnXQomanW7pNDPUlLWq3Ry6q1dpn8Grm1D36sZZC+a3/BKzg8+RJSIVI
         IFLg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Pvc4Kpf1KOTSe277HnKDRurLf+/hN7I/fGvxoR+Ye5ZJyXrwMI3BrKmCxSl0QpDbsQPDuBTCUIbYhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmcHNDD7Zh64VoMDXp6qsXIdypggERjDlDVJhw5WdPaMQpGQlG
	HF9gbSRIBglLT+a0HSRy9MaBKOwb+CbtY4Ph05dbQvZHr5UsgPkGK4BA6OaGPAV/WC8iL0UM+lC
	5Yj72cyk9iWKXqwlYvxzjq2UNKmHQJagE/In16SFCgJ+WG9AnW7VZ5UNBj/ZKyJuJaSq3y/5ddV
	KDP9HrvXc73Z/VahllRQFASLdWMVwyLZ5djfaqQYk=
X-Gm-Gg: ATEYQzygmHyghl8AK/+it+xAOqTxKLf71pPjgAha8Dc3jTsDHSslp8IZplq8MpMmsd3
	2OONdFflQ7vnUiKrrYRIGyOzzfKofOzF/BmSSpbuBmMPHuxEWxXbLZbQajmYPPjCHX0/+xn096y
	5E2LTglHxxLiFyU7HxugG9F6nzFDWI7WodFx7J921xTELuv+3vD1dK9wjwXXHVzRBZUtwndaorZ
	Nv/AA==
X-Received: by 2002:a05:6830:6adb:b0:7cf:c485:be43 with SMTP id 46e09a7af769-7d7ca5114c9mr1454997a34.7.1773818950337;
        Wed, 18 Mar 2026 00:29:10 -0700 (PDT)
X-Received: by 2002:a05:6830:6adb:b0:7cf:c485:be43 with SMTP id
 46e09a7af769-7d7ca5114c9mr1454986a34.7.1773818949852; Wed, 18 Mar 2026
 00:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316085704.352669-1-hpa@redhat.com> <abh9evUPzozh40k-@kekkonen.localdomain>
 <CAEth8oHPaWg9U5GWSeF4R5FmKfgxdxE3jfPut8egP=8c5oxHJw@mail.gmail.com> <abmVMOR9MMpTtj98@kekkonen.localdomain>
In-Reply-To: <abmVMOR9MMpTtj98@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 18 Mar 2026 15:28:58 +0800
X-Gm-Features: AaiRm52wKxIWvr5sXoEq-xjNzSuaiBkSp4X1OZoI7NLaLVPyjG1osQBjh0ccOWU
Message-ID: <CAEth8oHcOe9-6pE-uFQACY8ewvhC8dXWUNFVh=9aBo4h2iaFBg@mail.gmail.com>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56177-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: C1FE02B6F25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari and Hans,

On Wed, Mar 18, 2026 at 1:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> On Tue, Mar 17, 2026 at 09:24:20PM +0800, Kate Hsuan wrote:
> > Hi Sakari,
> >
> > Thank you for reviewing it.
> >
> > And thank you, Hans
> >
> > On Tue, Mar 17, 2026 at 6:00=E2=80=AFAM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Kate,
> > >
> > > Thanks for the patch.
> > >
> > > Where have you seen this sensor being used, if I may ask?
> >
> > It can be found on the Xiaomi Pad2 that is based on an Intel Cherry
> > Trail platform.
>
> Ack, thanks for the info!
>
> > > > +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t=
4ka3_data *sensor)
> > > > +{
> > > > +     struct v4l2_subdev_state *active_state =3D
> > > > +             v4l2_subdev_get_locked_active_state(&sensor->sd);
> > > > +
> > > > +     return v4l2_subdev_state_get_format(active_state, 0);
> > > > +}
> > > > +
> > > > +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *=
sensor)
> > > > +{
> > > > +     struct v4l2_subdev_state *active_state =3D
> > > > +             v4l2_subdev_get_locked_active_state(&sensor->sd);
> > > > +
> > > > +     return v4l2_subdev_state_get_crop(active_state, 0);
> > >
> > > Please avoid adding such helpers.
> > As Hans mentioned, we can put active format and crop in the t4ka3_data
> > or keep the helpers.
>
> What prevents you doing:
>
>         struct v4l2_subdev_state *active_state =3D
>                 v4l2_subdev_get_locked_active_state(&sensor->sd);
>         struct v4l2_rect *r =3D v4l2_subdev_state_get_crop(active_state, =
0);
>
> in the code? In a lot of the cases you could simply pass the state to the
> function using it as the caller already has it.
>
> It also seems the driver operates in active state whereas any state shoul=
d
> be valid. In general, file handle specific try state should resemble the
> active state as much as possible with the exception that it won't be
> applied to hardware.
>
> In the long run I'd also expect the control values to move to state.
>

If the caller has the state,  the state will be used and passed to the
function without calling the code mentioned above, such as
(v4l2_subdev_get_locked_active_state()...).
v4l2_subdev_state_get_format() and v4l2_subdev_state_get_crop will be
used in this case.

If the caller doesn't have it, the code mentioned above will be called
to get fmt and crop.

> ...
>
> > > > +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > +{
> > > > +     struct t4ka3_data *sensor =3D ctrl_to_t4ka3(ctrl);
> > > > +     struct v4l2_mbus_framefmt *fmt;
> > > > +     int ret;
> > > > +
> > > > +     /* Update exposure range on vblank changes */
> > > > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > > > +             ret =3D t4ka3_update_exposure_range(sensor);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     fmt =3D t4ka3_get_active_format(sensor);
> > >
> > > You could assign this in declaration.
> > Okay
> > >
> > > > +
> > > > +     /* Only apply changes to the controls if the device is powere=
d up */
> > > > +     if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> > > > +             t4ka3_set_bayer_order(sensor, fmt);
> > >
> > > Does this call belong here?
> > I think it can be. It is a simple update of t4ka3_hv_flip_bayer_order.
>
> Why are you doing it here? It basically assigns the Bayer order to the
> active format based on the flipping controls. Why not to do that when
> changing the flipping controls?

What I understand is
Move the t4ka3_set_bayer_order() into t4ka3_t_vflip() and change the
value based on the change of vflip and hflip value.
in t4ka3_t_vflip(), t4ka3_set_bayer_order is called in the function so
setting up bayer order here can be dropped.

A helper is needed and will invoke v4l2_subdev_get_fmt() to find the format=
.
>
> > >
> > > > +             return 0;
> > > > +     }
> > > > +
> > > > +     switch (ctrl->id) {
> > > > +     case V4L2_CID_TEST_PATTERN:
> > > > +             ret =3D t4ka3_test_pattern(sensor, ctrl->val);
> > > > +             break;
> > > > +     case V4L2_CID_VFLIP:
> > > > +             ret =3D t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_V=
FLIP_BIT);
> > > > +             break;
> > > > +     case V4L2_CID_HFLIP:
> > > > +             ret =3D t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_H=
FLIP_BIT);
> > > > +             break;
> > > > +     case V4L2_CID_VBLANK:
> > > > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_FRAME_LEN=
GTH_LINES,
> > > > +                             fmt->height + ctrl->val, NULL);
> > > > +             break;
> > > > +     case V4L2_CID_EXPOSURE:
> > > > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_COARSE_IN=
TEGRATION_TIME,
> > > > +                             ctrl->val, NULL);
> > > > +             break;
> > > > +     case V4L2_CID_ANALOGUE_GAIN:
> > > > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_GLOBAL_GA=
IN,
> > > > +                             ctrl->val, NULL);
> > > > +             break;
> > > > +     default:
> > > > +             ret =3D -EINVAL;
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     pm_runtime_put(sensor->sd.dev);
> > >
> > > Newline here?
> > Okay
> > >
> > > > +     return ret;
> > > > +}
>
> ...
>
> > > > +static int t4ka3_disable_stream(struct v4l2_subdev *sd, struct v4l=
2_subdev_state *state,
> > > > +                             u32 pad, u64 streams_mask)
> > > > +{
> > > > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > > > +     int ret;
> > > > +
> > > > +     ret =3D cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
> > > > +     pm_runtime_put(sensor->sd.dev);
> > > > +     sensor->streaming =3D 0;
> > > > +     return ret;
> > >
> > > Return 0 here but complain about it.
> > Do you mean return 0 here and print a message when ret !=3D 0?
>
> Yes, please.
>
> ...
>
> > > > +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
> > > > +{
> > > > +     struct fwnode_handle *fwnode =3D dev_fwnode(sensor->dev);
> > > > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > > > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > > > +     };
> > > > +     struct fwnode_handle *endpoint;
> > > > +     unsigned long link_freq_bitmap;
> > > > +     int ret;
> > > > +
> > > > +     /*
> > > > +      * Sometimes the fwnode graph is initialized by the bridge dr=
iver.
> > > > +      * Bridge drivers doing this may also add GPIO mappings, wait=
 for this.
> > > > +      */
> > >
> > > No need for such a comment.
> > I'll drop it.
> >
> > >
> > > > +     endpoint =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > > +     if (!endpoint)
> > > > +             return dev_err_probe(sensor->dev, -EPROBE_DEFER,
> > > > +                                  "waiting for fwnode graph endpoi=
nt\n");
> > >
> > > This
> > > <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=3Dcleanu=
p&id=3D8181d18d45d593d8499cbf0e83de08c6d913516c>
> > > will be merged soon.
> > Does it mean "return  -EPROBE_DEFER;" is enough?
>
> You can omit checking for errors here.

OKay
>
> > >
> > > > +
> > > > +     ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > > > +     fwnode_handle_put(endpoint);
> > > > +     if (ret)
> > > > +             return ret;
>
> ...
>
> > > > +static int t4ka3_pm_resume(struct device *dev)
> > > > +{
> > > > +     struct t4ka3_data *sensor =3D dev_get_drvdata(dev);
> > > > +     u16 sensor_id;
> > > > +     int ret;
> > > > +
> > > > +     usleep_range(5000, 6000);
> > > > +
> > > > +     gpiod_set_value_cansleep(sensor->powerdown_gpio, 0);
> > > > +     gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> > > > +
> > > > +     /* waiting for the sensor after powering up */
> > > > +     msleep(20);
> > >
> > > fsleep() maybe?
> > I can change it.
> > >
> > > > +
> > > > +     ret =3D t4ka3_detect(sensor, &sensor_id);
> > > > +     if (ret) {
> > > > +             dev_err(sensor->dev, "sensor detect failed\n");
> > > > +             return ret;
> > >
> > > What about gpio values in this case?
> > both powerdown_gpio and reset_gpio are 0 when resuming and 1 when suspe=
nded.
> > t4ka3_detect() reads the sensor name through i2c. If it finds the
> > product ID then return 0;
>
> What if t4ka3_detect() returns an error? What happens then?

That means the sensor replies with an unexpected value and returns
-ENODEV to notify that "no such device" and then power it off.
I need I have to power it off when t4ka3_detect() returns an error. I'll fi=
x it.
Or I can move it into probe().
>
> --
> Kind regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


