Return-Path: <linux-media+bounces-59112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJGaOUGm5WksmgEAu9opvQ
	(envelope-from <linux-media+bounces-59112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 06:06:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459E426ABF
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 06:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D526C3018D45
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 04:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A466A3806B2;
	Mon, 20 Apr 2026 04:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EEODkahA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="afixwCZl"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528ED27FB0E
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 04:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657976; cv=pass; b=r8YtB7KszzpdaRj/yZmDUWfWUzE7nHUgRHR7+9+t9FNdXM6fuk2B5diL4EeS7S3rT5qmkC550YmIe/iq6OAccDETTrTWBXfOgrAs7JSX4UEfBcW0NIh+7DYYSXY03XcZvTquUjFddQyiCzJbfWs4UR16/xfHKmariQOhxT+T/oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657976; c=relaxed/simple;
	bh=FWNgk8h1mJj7B00nhrZre//Zp6O8wZ6aK4mdF7uGa7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eD05vuZPtBTOmenMOZEbJNCD6nhrmj3AX2wvvRAuhLyHO2Tjr6YRwGHkb9MwtG6i4zzQ8J1qZ3UBjuFHmneUTP70zA+mztooTy1doPrT1xgjiqe50lVmQNi19eGYlgHjpUBzhtQNGa6cHQvOPsjs+Cu6XtT5UlwKaeocJvEb6eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EEODkahA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=afixwCZl; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776657973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yt3drUhoWeBi221uV6HDaV7t9HrwpULmgTRLJlZol18=;
	b=EEODkahAkrwmRdQGYrDIEgSO23BcaD1HziSFG5JPk0mDCPMY4kIL/bsyRhHhPjKC95oAf/
	zIe2vNcZAqulmTjBYs6QglYThlNwn8QZTVlc2zc9FEZXkky9GHypzGYcpKtRiLs3+5GLba
	VB60RsRGqbX/QnlFc/P6ZLulXvoONMw=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-mzvPp6SLMBqeGsclos7mjw-1; Mon, 20 Apr 2026 00:06:11 -0400
X-MC-Unique: mzvPp6SLMBqeGsclos7mjw-1
X-Mimecast-MFC-AGG-ID: mzvPp6SLMBqeGsclos7mjw_1776657950
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d9e1866bf1so2810809a34.1
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 21:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776657948; cv=none;
        d=google.com; s=arc-20240605;
        b=LquG49xAfcMXtni2rCLUkbcuWbeX8BK7AUQIF3oENVBX3Tidyi0Hbb+g2EUO/eSxIL
         JU+0M/J4+KF83uKzFw2V07afYR8AK8IbNFLtg/5RV54EzIE6jbWOjVO01zXZwGHabpUu
         14maPRNrvFX7xWKFZk2v2/9N6Yt3unKd/OQKJy83pStmaPqqFkALDuRNa3gqMJF+HEtc
         HVgq/7GgedsrRvmGsKGwWXqX4fnvm1PRgkmnZ5n66JJ1h+4u32BqbcTXdStkaJxXK1s/
         N5c/fTptvg4UC5rniMUCKVa2Ac6v5G2VLlLF7kk+pEkfSVa4X+/nGPbyHQBKH2A3CmCV
         gQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yt3drUhoWeBi221uV6HDaV7t9HrwpULmgTRLJlZol18=;
        fh=cOCyiu3E/8eIHRgFHQX6oirPUiy78O4NIcQzLV7Rvjw=;
        b=A08O2KVWqkwAyV5gY2v5P5NvquSyLPmori8sq4fhU9wI6Cf9bhe4COk8cPvgxEtDKP
         k+rQX7MpkUocspfbo+14JK109Aw9DLlyb7t+aPQjW9laS4PfSSXkBqMxJaOA2B8r4QSo
         9JMRNG3v5MUZ6aCwSHWVarASKv8JNuGtE44hpdt1O5P/+VWl9GJIUeibNnvdgHFfdIKz
         9N5PQrsmkKNTnuFmMm/MtJp5AmkEqQuWtQ/WGnciSpx5itYMb3Lo7y+HMXT9Hxz/4pET
         a3mYR6r0dHYOaY18eAo+LDEdeHJ1oJXY1S7kfJfWBvi/GNgfMfmgj71nUkCglOolrHrU
         Zm2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776657948; x=1777262748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt3drUhoWeBi221uV6HDaV7t9HrwpULmgTRLJlZol18=;
        b=afixwCZlC/bN0LPY6088YuyoZL7Yn6CIVcbB8Bhi/C+AdfwRuLpClA6nsuvaK4WAgs
         OqdYorTJn3S9ax1Ta1diuZuCfcqbLV2zpNxBFswi9olwQuLkfodqpiMTsaI28oMjKI5v
         nLtql7HD/Z9mnILz2wryS+UMWEusby4NgSJU8t0fOK+ub1YEuJaKMVq9SXmxJTWtUN59
         TCEdtqzfuV0sGC/29Fpil6DYwlZrvWowO43lRJtp9nuGuKgd6Ox3MZZwQbZOUnIeIg9j
         8YSAT/iLKb/YjXlSX12wrYIdYF7IqJ3DO+RNnTxPLUEPbE4Q7o8Kxp9J1RQWzThgMpka
         6aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657948; x=1777262748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yt3drUhoWeBi221uV6HDaV7t9HrwpULmgTRLJlZol18=;
        b=Tl5jJkfe5QvTwTgT4BeEavOFxyvQHvxC/fjZMfwciJj5y6GDzl0C3O7fLgPbgO+bpL
         zLxTfXLeAIwOfoMfGEf3hrcEPSfr8e9ouu1Eu8J6p0KftOYUWIAd/76vPiIQ7lmGw1mt
         9Wo0UmlFpw15O6WiPWUSZUEJg7h8yMPONvDoES261vsoO06hMVOiFBVevKKmuIKby4jL
         HrcRv2J9fHASZ+oIsZ3oOuFxy+d+Ffr7zlNoePvzPZIkjghzCOHKb6sPBMv/9FWWztFp
         Xp67OzNzDlLZq6jishuBu6kgFYknMFJSWIRkTR8mWyaxapzKYyM77QpUjpDNWEuUDwSP
         RaIw==
X-Forwarded-Encrypted: i=1; AFNElJ+R9OPkTkLaGbdz0baEgnLBw9tOk9W6Z8jPwWnHKOaTjxpBiYKNNOXOQLbUWIoVWMoK0MABFyPwHtreYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuh+kyzHK1/QSMD4uBNvAcyVqh87FD386P5ns/Z+2aJV8iN0j
	rto4+e/XIFwiC46iL+YCKSYGKjEHh3J5npnQK/80INSQX4/g9TpjpoP8DdmvkUeOXxK+uWJk0tE
	IoKMB3LUYXU/YPSVoodTNxNi4Gp6GD8fBlysIdxgyZCLyB/MpS9IWQRX7OXziZRv7XQ0PjpPhhf
	dkTAWVKhfRyR/ub6CTW+cob8CTogL+pgInF0lorcA=
X-Gm-Gg: AeBDievZUyxEOxfloWz+NvOYdq8eN3zULbSxp76TjrqqW4oh8LWKtPVCP+KBQ5+YaxQ
	+a5PTyA0VnP9UvIF2jvxnly115RRzC94EFhqPBE2WWBcVGVu7RySvGWDxaoniI0992nIz6Ws+ct
	Cr8sQf7FvAp1V4V3Yt00O+URjYD+mgceshj5bw3CnLeA4myTUhPen2CHMOE6W9aIMKjKq56+mQz
	j5bp+f/d7p6Co47
X-Received: by 2002:a05:6820:200b:b0:685:3561:893f with SMTP id 006d021491bc7-69462f44dc9mr6768056eaf.55.1776657947917;
        Sun, 19 Apr 2026 21:05:47 -0700 (PDT)
X-Received: by 2002:a05:6820:200b:b0:685:3561:893f with SMTP id
 006d021491bc7-69462f44dc9mr6768041eaf.55.1776657947399; Sun, 19 Apr 2026
 21:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417083214.222189-1-hpa@redhat.com> <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
In-Reply-To: <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 20 Apr 2026 12:05:36 +0800
X-Gm-Features: AQROBzDuGeevxUSX9xf1aOLNPrICl_oBDe70YAObgH1CzUNkX2sQRcYtanpKyo8
Message-ID: <CAEth8oGjk5peCmC8FhqGLEL1eYaSGbk7QvkTx3+53bKF9E1UVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-59112-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5459E426ABF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Fri, Apr 17, 2026 at 6:16=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Hi Kate,
>
> On 17-Apr-26 10:32, Kate Hsuan wrote:
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c
> >
> > This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a p=
art
> > of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 lapto=
ps.
> >
> > Link: https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i=
2c/imx471.c
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2454119
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> <snip>
>
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > new file mode 100644
> > index 000000000000..32a105a60731
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -0,0 +1,1047 @@
>
> <snip>
>
> > +static int imx471_update_flip(struct imx471_data *sensor, u32 value,
> > +                           u8 flip_bit)
> > +{
> > +     int ret;
> > +     u64 val =3D value ? flip_bit : 0;
> > +
> > +     if (sensor->streaming)
> > +             return -EBUSY;
>
> I see no reason why this could not be updated while streaming,
> since the h/y offsets get adjusted the bayer pattern stays
> the same so changing while streaming should be fine.
>
> > +
> > +     /* hflip */
> > +     /*
> > +      * Some manufacturers mount the sensor upside-down (rotation =3D=
=3D 180).
> > +      * V4L2 sets both h/vflip to 1 for 180-degree rotation, but only =
the
> > +      * vflip should actually be applied. Skip the initial hflip write=
 to
> > +      * preserve correct orientation.
> > +      */
>
> I was answering your off-list email about this, but now I see that you've
> added this workaround here. I believe that this workaround is wrong, so
> let me move answer things here instead of off-list:
>
> > I filled in the DMI information in the table and I found v4l2 sets up
> > both hflip=3D1 and vflip=3D1 when the rotation is 180.
>
> Yes that is correct, note this is actually done by libcamera, in response
> to the rotation property reporting 180 degrees rotation after adding the
> laptop to the DMI table.
>
> > In my case, I only
> > need to set vflip then I can get a correct image.
>
> First of all are you sure that you only need to set vflip? A camera is no=
t
> a mirror! If you say raise your right hand in front of the camera then on
> the screen you should be seen raising the hand which is on the left for
> "the you" looking at the screen because if you were to look at you from
> the pov of the camera your right hand is on the left.
>
> The easiest way to check this is to have something with some written text
> on it. In a mirror you cannot (easily) read e.g. the text printed on
> a T-shirt but with a camera you should be able to read this without
> problems.
>
> Also make sure you use qcam to test because qcam does not mirror/hflip.
> Some apps hflip the image for you (esp. things like google meet) because
> people are so used to seeing themselves in a mirror that they adjust
> the view for you. Note e.g. google meet only mirrors your own preview
> it sends out an unmirrored image to the people on the call (IIRC).

Thank you for answering this in detail.
I was confused by the Camera app that hflip the image from a UVC
camera and the default hflip register setting.
Now I know how I can fix my v1 and recalibrate my 3D space recognition.

>
> If after this long mansplaining (sorry) writeup about the difference
> between a mirror and a camera you still think you only need vflip,
> then that means that either the hflip ot the vflip control of
> the sensor is inverted and the driver needs to invert it.
>
> Are we sure the camera module is upside down? Maybe vflip is the one
> which we need to invert and the module is not upside-down at all ?
>
> Hmm, looking at other imx sensor drivers, unlike ov sensors where
> sometimes hflip is inverted it seems the 2 flip controls are sofar
> always straight forward on imx. Although some drivers only implement
> vflip and have no hflip at all.
>
> As you mention in the cover letter this is a cleaned up version of:
> https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c/imx47=
1.c
>
> Note that we've seen issues with mirroring / flipping from various
> other drivers originating from Intel, they have not always got this
> correct, especially when it comes to mirroring by default (when
> the hflip control's value is 0) but also with vflipping by default
> when the driver was developed on a laptop which had the module
> upside-down, see e.g. :
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/dr=
ivers/media/i2c/ov02c10.c

Yes, ov02c10 is my example.

>
> where we needed to do quite a few flipping related fixes.
>
> > +     if (flip_bit =3D=3D IMX471_HFLIP_BIT) {
> > +             if (sensor->rotation =3D=3D 180 && !sensor->hflip_initial=
ized) {
> > +                     sensor->hflip_initialized =3D true;
> > +                     return 0;
> > +             }
>
> This looks like you skip writing the hflip on the first start stream,
> but what about subsequent streams ?

I'll drop this. It is unnecessary.

>
> Also see my next comment below, I think this skipping only once
> does point us in the right direction.
>
> > +
> > +             cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> > +                             flip_bit, val, &ret);
> > +
> > +             return ret;
> > +     }
> > +
> > +     /* vflip */
> > +     cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> > +                     flip_bit, val, &ret);
> > +     if (ret)
> > +             return ret;
>
> Hmm, I wonder if the problem here is you doing 2 subsequent
> cci_update_bits(). If the flip control registered is double-buffered
> and the new value is latched as the actual value on the start
> of the next frame; and this is combined with reading back
> reading the active value, not the last written value then
> the first time you do this the setting of the hflip bit will
> be overwritten by the second cci_update_bits.
>
> I think it would be better to do something similar to what
> imx219.c and replace these 2 cci_update_bits() calls with:
>
>         cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
>                   imx471->hflip->val | imx471->vflip->val << 1, &ret);
>
> I believe this should work here too.

Okay.

>
>
> > +
> > +     cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
> > +               value ? 0xe0 : 0xeb, &ret);
> > +     if (ret)
> > +             return ret;
> > +
> > +     cci_update_bits(sensor->regmap, IMX471_REG_H_WIN_OFFSET, 1,
> > +                     value ? 0x01 : 0x00, &ret);
>
> No need for cci_update_bits() here, the register is always
> initialized to 0xc8 so this can just use hardcoded values
> like the V_WIN_OFFSET path:

Sorry for my test code. I'll drop it.

>
>         cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
>                   value ? 0xc9 : 0xc8, &ret);
>
> > +     return ret;
>
> Updating both offsets here is wrong when hflip !=3D vflip, you
> should only update V_WIN_OFFSET when changing vflip and
> H_WIN_OFFSET when changing hflip.
>
> I suggest dropping this function and instead in set_ctrl()
> do this:
>
>         case V4L2_CID_HFLIP:
>                 cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
>                           imx471->hflip->val | imx471->vflip->val << 1, &=
ret);
>                 cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
>                           value ? 0xc9 : 0xc8, &ret);
>                 break;
>         case V4L2_CID_VFLIP:
>                 cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
>                           imx471->hflip->val | imx471->vflip->val << 1, &=
ret);
>                 cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
>                           value ? 0xe0 : 0xeb, &ret);
>                 break;

That is better. I'll move them to the set_ctrl().

>
> Regards,
>
> Hans
>


--=20
BR,
Kate


