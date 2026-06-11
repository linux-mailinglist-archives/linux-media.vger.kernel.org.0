Return-Path: <linux-media+bounces-64537-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M6YXO9lZKmqcnwMAu9opvQ
	(envelope-from <linux-media+bounces-64537-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:46:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDD266F200
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:46:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=bz3dTTrh;
	dkim=pass header.d=redhat.com header.s=google header.b=LXqNqjzc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64537-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64537-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF1C6302AF1C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFB93546D7;
	Thu, 11 Jun 2026 06:46:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D832A3C8
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 06:46:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160398; cv=pass; b=PASyWEFnX60LaxtptBTEOlgWi4b6rdPWJTMk54dW4K7q5TlZ8zc3SFb5CFkPeJtj1AhWGruMQjLtw761hFQQ60AsSvLQo5M3B7NjnopsaDjoZdSO7jNhY2qkyEBHGf4JgZ9Dp4LQpPkorCtsM6dy5lfku4yRuxosh/CwxwYTgIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160398; c=relaxed/simple;
	bh=6CmPBmqSO02whJhYGwYAJKtqsSXfaQCLE2SXiHJRXKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwmqiP9gEI1pqxbzMR+3W6arFmqJM8kYcU64HJAJ84nCuRSmWEHyt69mMVF4E2H02tFoPnvvomNEyQImIgDVORG8pcoXhxw6sYJj9mcU/xqmQ2GTNnPgjdkz7BTqJPS35avF/1DHtTId+xtId15mafj31Du0U00Q3u2pTWyJAA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bz3dTTrh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LXqNqjzc; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781160394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKu67TK6QKFp74b/9gtsdIIUFZHrjVR0F//2UO7RzzE=;
	b=bz3dTTrh+rikOMdEY8j6my++3NbdOQZtepSPlVOQ4hdU8KhR2zTA2EdvWelTglkW+fRx+n
	IT6icKR0zjtNHFSGBH15d2pZ87TKmsJ1FeJUgvpuhrzxYL1oZG1JNeiYVVx9HHUoy5PEFI
	WioSOimS4VjdsNeYQbz8syyKSaLIKoM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-ldifsWW4O7eYbNMS4APUTQ-1; Thu, 11 Jun 2026 02:46:32 -0400
X-MC-Unique: ldifsWW4O7eYbNMS4APUTQ-1
X-Mimecast-MFC-AGG-ID: ldifsWW4O7eYbNMS4APUTQ_1781160392
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e71e43e89bso6906859a34.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 23:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781160392; cv=none;
        d=google.com; s=arc-20240605;
        b=DFUSB6Y41VIcvaQ+n1UhkCgHFx44K5W6NV+wQigXVkKShHTGkIRI5cGrpOiZ79DXcB
         UUCTPohupoLsu6efoIwKfCZyjLSRJZLUpalyRBBDTMX0OdEULnQhanlakHnH7I1TS7aD
         f9SssjrN5GFZFrVRIXWXUopP7uao/kk2u5u82sTylZhDBSBo/7NuVHfhdmhh/u5D+06i
         a2hXILhtOHNaoFYEnATkKMzQCEtjwRB2+t14HeJRAPmBKa2ZUAqdYX9jnWgLqO4ixyHc
         IeBNyKlFOViy2bX/Msrf7TByl0HUhUUsTnPInw8ScdxZZSkvJAIcfPanu0Y4fpk7JdT/
         h6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JKu67TK6QKFp74b/9gtsdIIUFZHrjVR0F//2UO7RzzE=;
        fh=yop8bquuPBRFpme1Rj1oGu732ofZBulnbket6dazDMU=;
        b=EXXNgKXytWYrM9wBAJkSnUFDSpwN5nr1CV9huCCw8kwJaN2S39GLGE0AGJOOTBMDxI
         5BJBOL7QI+XmtpM6KB/fiZwmhmc6v9cW6jZUazI/4UzvUwEDr4LAL8kAmAh5wCkEVymJ
         sWGC/dN5GefsOPjFN7yY0WJlunA3dGkFvUYYie/NBjo89jQsfkWPX7JFeu9myN5rwMQn
         sl6SPl2MCIH8z0mbHoiWO6Lu0Imto91gQDruL+Ky85MF24dq1yqJJB5dJYQUKsJ0zt4v
         5ciEaWdfh/BMyPuYrOVnIKDEvmQzU+7f9DyvvjupHECk6f9yN1BQQg5fkcLl9q3SieR/
         Ryiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781160392; x=1781765192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKu67TK6QKFp74b/9gtsdIIUFZHrjVR0F//2UO7RzzE=;
        b=LXqNqjzc3/BEQEI1zBWs+DJrPZ0UOwBmWpCNg/iQFUnnLrY1/ugqbk/eD/4MZlbbF+
         NcevVCQkQSl8gOu5DkIPV5PynX+nz/r31xIlQyMowc2uVap0WXMaMLkIkGAdg3XINYeu
         g8XBozuayliVzTwRvYJ3yP02nUjGHqn+mI4fjzZ6JDKMA7rzKVFEKAbP0AjsVIIpESmc
         yO2+dNl8tAj/sV98dUW8qVJGmKCnzokoQziCOpb/1Zk/ezKLmHNDQa7QIzIWAy763CyJ
         M+AAOurHvdbWc7UQWYBFXVr9z5pWyBvjxQ7RtV6w/pscQFfkr308/fBc464xcJYB+Opj
         kgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781160392; x=1781765192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JKu67TK6QKFp74b/9gtsdIIUFZHrjVR0F//2UO7RzzE=;
        b=DL5+w1U1Xe/RPD6+pae1z+6yhJhxuSvOsMM7bAS/efONIfXy01CvHdMFa5rj0bEzKe
         b2VSXBPy3A3upDIIah4Z7pZxxjd6CcjmQ/+N6g0bx/ZYU0VV0V2LAt4x6naci24HPvoA
         2Z5VLigQjzZr9rM+H6WbE7KsuLiahNXoh6FprEGl4Xtz7WyraEQuVXLwv25W1CO1kpNE
         Mfj/Z6GAey6V5lIT/PpFa6JLEcyC1nx/kIq58AdA683CgbiSjbj8Zpv2ZXR3VfyN40+x
         x8veGQvpWMgHVUojZqCpUx/jXkqIHv0I16fG7gA52Ku639HGNfMUYis9SnYeRxaVPGhn
         eXHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W9Y1Pw52+or6fA7W6GhKSV7/rqCL3mrjnm+RHxHcXWZPtslrsc423qMBK0jgLRBmvNX6pGJRwFbHxqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo8OyEop5KuTwt8ObpGX42WTY2dx2wdfBAs6NUtUI69MRYEHm/
	wNFgzuh/uiL9QgrDlEVegIPGgfdlJ38H+ALc6CYamF0hOI8jSudhia/GG0Z3CTSut6Ldguko/nZ
	rB/4ttZ+RAwbhxPaQZaMay41rynkC1Kalu6Mx5Rp6VhwB5FlhXyb8do8RnLHQ9yMN8G6dGjl6eu
	dRm+7YxQB8/uUSnRW7HLSGs8Gwdm/xaNe82R3YN+ZfcMeGINg=
X-Gm-Gg: Acq92OE2fR/nnVIXWdBw7RuAqmr95SZMu1eMUwaGG0wpoalihCBPUaNG4EBxGQSVkkH
	g5qYKAjQ5+0e4do9GWq2TJKhSN6hK+e2AJGx3efMUPqocRyUaR4XfWXVn25X/UAgrRzO6/8rHje
	8NNUpeO6fv9mp0CKQrLiByDdbyKNM16kNf7OIhRwBCltTnEaC1yX+P1UNU8yXoIFL6LSjknBWOh
	aSd+BOMDo3jWhIb
X-Received: by 2002:a05:6830:668c:b0:7e6:e8cd:bb7e with SMTP id 46e09a7af769-7e77335aab1mr1135871a34.4.1781160391763;
        Wed, 10 Jun 2026 23:46:31 -0700 (PDT)
X-Received: by 2002:a05:6830:668c:b0:7e6:e8cd:bb7e with SMTP id
 46e09a7af769-7e77335aab1mr1135849a34.4.1781160391156; Wed, 10 Jun 2026
 23:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609124926.1038981-1-hpa@redhat.com> <20260609124926.1038981-4-hpa@redhat.com>
 <PN3P287MB1829693B81531B6333461AAE8B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB1829693B81531B6333461AAE8B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 11 Jun 2026 14:46:19 +0800
X-Gm-Features: AVVi8CeDDcTMng3Ff2mD_IhcEqZtAvfsbjYKdNxE1vMMpeSntnumkXBxQUjge_c
Message-ID: <CAEth8oFetuGzP8BUMyFmLdSy1i4Y=d0onAaS9QGf_GZQM55n5A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Serin Yeh <serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64537-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,siliconsignals.io:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DDD266F200

Hi Tarang,

Thank you for reviewing it.

On Wed, Jun 10, 2026 at 3:11=E2=80=AFPM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Kate,
>
> I noticed a few more issues. Could you please check the comments below?
>
> Sorry, I missed these in my first review.
>
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c
> >
> > This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 lapto=
ps
> > and it is a part of IPU7 solution. The driver was tested on Lenovo X1
> > Carbon G14, X9-14 and X9-15 laptops.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>
> ...
>
> > +#define IMX471_REG_CSI_DATA_FORMAT             CCI_REG16(0x0112)
> > +#define IMX471_CSI_DATA_FORMAT_RAW10           0x0a0a
> > +
> > +#define IMX471_REG_CSI_LANE_MODE               CCI_REG8(0x0114)
> > +#define IMX471_CSI_2_LANE_MODE                 1
> > +#define IMX471_CSI_4_LANE_MODE                 3
>
> The CSI data format (0x0112) and lane mode (0x0114) registers are defined=
 but
> never programmed.
>
> The out-of-tree driver mentioned in the cover letter configures these reg=
isters
> during initialization. Shouldn't the same settings be applied here as par=
t of
> the global register configuration?

ops. I didn't put them back in the cci_reg_sequence when I changed the
register names.
I'll check the register values.

>
> ...
>
> > +static const char * const imx471_supply_name[] =3D {
> > +       "avdd",
> > +};
>
> Only avdd is defined as a regulator supply.
>
> According to the datasheet, are there any additional power rails
> (e.g. dvdd or iovdd) required by the sensor?
I only found avdd on X1 Carbon G14, my X9-14 and 15. I only have this
one regulator to test and ensure it runs.
According to the datasheet, I found "VNAN, VDIG, and VIF". Should I
add them to the list?

>
>
> ...
>
> > +       { CCI_REG8(0x0307), 0x79 },
> > +       { CCI_REG8(0x030b), 0x01 },
> > +       { CCI_REG8(0x030d), 0x02 },
> > +       { CCI_REG8(0x030e), 0x00 },
> > +       { CCI_REG8(0x030f), 0x53 },
> > +       { CCI_REG8(0x0310), 0x01 },
> > +       { IMX471_REG_EXPOSURE, IMX471_EXPOSURE_DEFAULT },
>
> drop this setting above.
ok

>
> > +       { CCI_REG8(0x3f4c), 0x81 },
> > +       { CCI_REG8(0x3f4d), 0x81 },
> > +       { CCI_REG8(0x3f78), 0x01 },
> > +       { CCI_REG8(0x3f79), 0x31 },
> > +       { CCI_REG8(0x3ffe), 0x00 },
> > +       { CCI_REG8(0x3fff), 0x8a },
> > +       { CCI_REG8(0x5f0a), 0xb6 },
> > +};
>
> ...
>
> > +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct imx471 *sensor =3D container_of_const(ctrl->handler,
> > +                                                  struct imx471,
> > +                                                  ctrl_handler);
> > +       struct v4l2_subdev_state *state =3D
> > +                       v4l2_subdev_get_locked_active_state(&sensor->sd=
);
> > +       const struct v4l2_mbus_framefmt *format =3D
> > +                       v4l2_subdev_state_get_format(state, 0);
> > +       s64 exposure_max;
> > +       int ret;
> > +
> > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               exposure_max =3D
> > +                       format->height + ctrl->val - IMX471_EXPOSURE_MA=
RGIN;
> > +               ret =3D __v4l2_ctrl_modify_range(sensor->exposure,
> > +                                              sensor->exposure->minimu=
m,
> > +                                              exposure_max,
> > +                                              sensor->exposure->step,
> > +                                              exposure_max);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       /* V4L2 controls values will be applied only when power is alre=
ady up */
> > +       if (!pm_runtime_get_if_in_use(sensor->dev))
>
> Use pm_runtime_get_if_active() or update the comment. With pm_runtime_get=
_if_in_use(),
> the comment should say "applied only when the device is in use".

I'll drop the comment.

>
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_ANALOG_GAI=
N,
> > +                               ctrl->val, NULL);
> > +               break;
> > +       case V4L2_CID_DIGITAL_GAIN:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_G=
LOBAL,
> > +                               ctrl->val, NULL);
> > +               break;
> > +       case V4L2_CID_EXPOSURE:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> > +                               ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_VBLANK:
> > +               /* Update FLL that meets expected vertical blanking */
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_FLL,
> > +                               format->height + ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_TEST_PATTERN:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_TEST_PATTE=
RN,
> > +                               ctrl->val, NULL);
> > +               break;
> > +       case V4L2_CID_HFLIP:
> > +       case V4L2_CID_VFLIP:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_ORIENTATIO=
N,
> > +                               sensor->hflip->val | sensor->vflip->val=
 << 1, NULL);
> > +               break;
> > +       default:
> > +               ret =3D -EINVAL;
> > +               dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not ha=
ndled",
>
> Use dev_err.
sure.

>
> > +                        ctrl->id, ctrl->val);
> > +               break;
> > +       }
> > +
> > +       pm_runtime_put(sensor->dev);
> > +
> > +       return ret;
> > +}
>
> ...
>
> > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_format *fmt)
> > +{
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +       const struct imx471_mode *mode;
> > +       u64 pixel_rate;
> > +       int h_blank;
> > +       int ret;
>
> int h_blank, ret;
Okay.

>
> > +
> > +       mode =3D v4l2_find_nearest_size(imx471_modes,
> > +                                     ARRAY_SIZE(imx471_modes),
> > +                                     width, height,
> > +                                     fmt->format.width, fmt->format.he=
ight);
> > +
> > +       imx471_update_pad_format(sensor, mode, fmt);
> > +
> > +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->form=
at;
> > +
> > +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +               return 0;
> > +
> > +       if (media_entity_is_streaming(&sensor->sd.entity))
> > +               return -EBUSY;
> > +
> > +       pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> > +       ret =3D __v4l2_ctrl_modify_range(sensor->pixel_rate,
> > +                                      V4L2_CID_PIXEL_RATE,
> > +                                      pixel_rate, 1, pixel_rate);
> > +       if (ret)
> > +               return ret;
>
> Why do we need this? You have a fixed pixel_rate. Drop the settings above=
.

There is only one mode for this driver. This can be dropped.

>
> > +
> > +       ret =3D __v4l2_ctrl_modify_range(sensor->vblank,
> > +                                      mode->fll_min - mode->height,
> > +                                      IMX471_FLL_MAX - mode->height,
> > +                                      1,
> > +                                      mode->fll_def - mode->height);
> > +       if (ret)
> > +               return ret;
> > +
> > +       h_blank =3D mode->llp - mode->width;
> > +       /*
> > +        * Currently hblank is not changeable.
> > +        * So FPS control is done only by vblank.
> > +        */
> > +       return __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > +                                       h_blank, 1, h_blank);
> > +}
>
> ...
>
> > +static int imx471_enable_stream(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *state,
> > +                               u32 pad, u64 streams_mask)
> > +{
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +       const struct imx471_mode *mode;
> > +       struct v4l2_mbus_framefmt *fmt;
> > +       int ret;
> > +
> > +       ret =3D pm_runtime_resume_and_get(sensor->dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D imx471_identify_module(sensor);
> > +       if (ret)
> > +               return ret;
>
> Runtime PM leak. Please call error_powerdown at return path.
OK. I'll check the rest of the rumtime PM operations.

>
> > +
> > +       ret =3D cci_multi_reg_write(sensor->regmap, imx471_global_regs,
> > +                                 ARRAY_SIZE(imx471_global_regs), NULL)=
;
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to set global settings: %d=
", ret);
> > +               goto error_powerdown;
> > +       }
> > +
> > +       state =3D v4l2_subdev_get_locked_active_state(&sensor->sd);
>
> Why is the active state retrieved again here? state is already passed to =
enable_stream()
>
> Drop this line.

OK

>
> > +       fmt =3D v4l2_subdev_state_get_format(state, 0);
> > +       mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471=
_modes),
> > +                                     width, height, fmt->width, fmt->h=
eight);
> > +
> > +       ret =3D cci_multi_reg_write(sensor->regmap, mode->default_mode_=
regs,
> > +                                 mode->default_mode_regs_length, NULL)=
;
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to set mode: %d", ret);
> > +               goto error_powerdown;
> > +       }
> > +
> > +       ret =3D cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GA=
IN, 1, NULL);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       ret =3D cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +                       IMX471_MODE_STREAMING, NULL);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       __v4l2_ctrl_grab(sensor->vflip, true);
> > +       __v4l2_ctrl_grab(sensor->hflip, true);
> > +
> > +       return ret;
> > +
> > +error_powerdown:
> > +       pm_runtime_put(sensor->dev);
> > +
> > +       return ret;
>
> ...
>
> > +static int imx471_init_controls(struct imx471 *sensor)
> > +{
> > +       const struct imx471_mode *mode =3D &imx471_modes[0];
> > +       struct v4l2_fwnode_device_properties props;
> > +       struct v4l2_ctrl_handler *ctrl_hdlr;
> > +       struct v4l2_ctrl *link_freq;
> > +       s64 exposure_max, hblank;
> > +       u64 pixel_rate;
> > +       int ret;
> > +
> > +       ctrl_hdlr =3D &sensor->ctrl_handler;
> > +       v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> > +
> > +       ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to parse fwnode: %d", ret)=
;
> > +               return ret;
>
> Memory leak, Use goto error here.
I'll do it here as follows.
   v4l2_ctrl_handler_free(ctrl_hdlr);
   return ret;

>
> > +       }
> > +
> > +       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &p=
rops);
> > +
> > +       link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > +                                          &imx471_ctrl_ops,
> > +                                          V4L2_CID_LINK_FREQ,
> > +                                          ARRAY_SIZE(link_freq_menu_it=
ems) - 1,
> > +                                          0,
> > +                                          link_freq_menu_items);
> > +
> > +       /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample=
 */
> > +       pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> > +
> > +       sensor->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctr=
l_ops,
> > +                                              V4L2_CID_PIXEL_RATE, pix=
el_rate,
> > +                                              pixel_rate, 1, pixel_rat=
e);
>
> You can drop pixel_rate from struct sensor. it is not used anywhere in th=
e driver.
Ok
>
> > +
> > +       sensor->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > +                                          &imx471_ctrl_ops,
> > +                                          V4L2_CID_VBLANK,
> > +                                          mode->fll_min - mode->height=
,
> > +                                          IMX471_FLL_MAX - mode->heigh=
t,
> > +                                          1,
> > +                                          mode->fll_def - mode->height=
);
> > +
> > +       hblank =3D mode->llp - mode->width;
> > +       sensor->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_op=
s,
> > +                                          V4L2_CID_HBLANK, hblank, hbl=
ank,
> > +                                          1, hblank);
> > +
> > +       /* fll >=3D exposure time + adjust parameter (default value is =
18) */
> > +       exposure_max =3D mode->fll_def - IMX471_EXPOSURE_MARGIN;
> > +       sensor->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_=
ops,
> > +                                            V4L2_CID_EXPOSURE,
> > +                                            IMX471_EXPOSURE_MIN, expos=
ure_max,
> > +                                            IMX471_EXPOSURE_STEP,
> > +                                            IMX471_EXPOSURE_DEFAULT);
> > +
> > +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGU=
E_GAIN,
> > +                         IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
> > +                         IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT=
);
> > +
> > +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL=
_GAIN,
> > +                         IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
> > +                         IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAU=
LT);
> > +
> > +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                    V4L2_CID_TEST_PATTERN,
> > +                                    ARRAY_SIZE(imx471_test_pattern_men=
u) - 1,
> > +                                    0, 0, imx471_test_pattern_menu);
> > +
> > +       sensor->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops=
,
> > +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +
> > +       sensor->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops=
,
> > +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +       if (ctrl_hdlr->error) {
> > +               dev_err(sensor->dev, "%s control init failed: %d",
> > +                       __func__, ctrl_hdlr->error);
> > +               goto error;
> > +       }
> > +
> > +       link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +       sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +       sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +       sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +       sensor->sd.ctrl_handler =3D ctrl_hdlr;
> > +
> > +       return 0;
> > +
> > +error:
> > +       v4l2_ctrl_handler_free(ctrl_hdlr);
> > +
> > +       return ctrl_hdlr->error;
> > +}
> > +
> > +static int imx471_check_hwcfg(struct imx471 *sensor)
> > +{
> > +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +       };
> > +       struct fwnode_handle *ep, *fwnode =3D dev_fwnode(sensor->dev);
> > +       unsigned long link_freq_bitmap;
> > +       struct clk *clk;
> > +       int ret;
> > +
> > +       clk =3D devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> > +       if (IS_ERR(clk))
> > +               return dev_err_probe(sensor->dev, PTR_ERR(clk),
> > +                                    "can't get clock frequency\n");
> > +
> > +       if (clk_get_rate(clk) !=3D IMX471_EXT_CLK)
> > +               return dev_err_probe(sensor->dev, -EINVAL,
> > +                                    "external clock %lu is not support=
ed\n",
> > +                                    clk_get_rate(clk));
> > +
> > +       ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +       fwnode_handle_put(ep);
> > +       if (ret)
> > +               return dev_err_probe(sensor->dev, ret,
> > +                                    "parsing endpoint failed");
> > +
> > +       ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freq=
uencies,
> > +                                      bus_cfg.nr_of_link_frequencies,
> > +                                      link_freq_menu_items,
> > +                                      ARRAY_SIZE(link_freq_menu_items)=
,
> > +                                      &link_freq_bitmap);
> > +
> > +       v4l2_fwnode_endpoint_free(&bus_cfg);
>
> The sensor supports both 2 and 4 CSI-2 data lanes, but this driver only
> implements the 4-lane configuration. Please validate the data-lanes prope=
rty
> and reject anything other than 4 lanes.

sure.

>
> > +
> > +       return ret;
> > +}
>
> ...
>
> > +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused =
=3D {
> > +       { "SONY471A" },
> > +       { "TBE20A0" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
> > +
> > +static struct i2c_driver imx471_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "imx471",
> > +               .acpi_match_table =3D ACPI_PTR(imx471_acpi_ids),
>
> Could you please add .of_match_table as well? The driver can also be used
> on DT-based systems.

I don't have the hardware to verify it. I think it is better if
someone needs it and adds it.



On Wed, Jun 10, 2026 at 3:11=E2=80=AFPM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Kate,
>
> I noticed a few more issues. Could you please check the comments below?
>
> Sorry, I missed these in my first review.
>
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c
> >
> > This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 lapto=
ps
> > and it is a part of IPU7 solution. The driver was tested on Lenovo X1
> > Carbon G14, X9-14 and X9-15 laptops.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>
> ...
>
> > +#define IMX471_REG_CSI_DATA_FORMAT             CCI_REG16(0x0112)
> > +#define IMX471_CSI_DATA_FORMAT_RAW10           0x0a0a
> > +
> > +#define IMX471_REG_CSI_LANE_MODE               CCI_REG8(0x0114)
> > +#define IMX471_CSI_2_LANE_MODE                 1
> > +#define IMX471_CSI_4_LANE_MODE                 3
>
> The CSI data format (0x0112) and lane mode (0x0114) registers are defined=
 but
> never programmed.
>
> The out-of-tree driver mentioned in the cover letter configures these reg=
isters
> during initialization. Shouldn't the same settings be applied here as par=
t of
> the global register configuration?
>
> ...
>
> > +static const char * const imx471_supply_name[] =3D {
> > +       "avdd",
> > +};
>
> Only avdd is defined as a regulator supply.
>
> According to the datasheet, are there any additional power rails
> (e.g. dvdd or iovdd) required by the sensor?
>
>
> ...
>
> > +       { CCI_REG8(0x0307), 0x79 },
> > +       { CCI_REG8(0x030b), 0x01 },
> > +       { CCI_REG8(0x030d), 0x02 },
> > +       { CCI_REG8(0x030e), 0x00 },
> > +       { CCI_REG8(0x030f), 0x53 },
> > +       { CCI_REG8(0x0310), 0x01 },
> > +       { IMX471_REG_EXPOSURE, IMX471_EXPOSURE_DEFAULT },
>
> drop this setting above.
>
> > +       { CCI_REG8(0x3f4c), 0x81 },
> > +       { CCI_REG8(0x3f4d), 0x81 },
> > +       { CCI_REG8(0x3f78), 0x01 },
> > +       { CCI_REG8(0x3f79), 0x31 },
> > +       { CCI_REG8(0x3ffe), 0x00 },
> > +       { CCI_REG8(0x3fff), 0x8a },
> > +       { CCI_REG8(0x5f0a), 0xb6 },
> > +};
>
> ...
>
> > +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct imx471 *sensor =3D container_of_const(ctrl->handler,
> > +                                                  struct imx471,
> > +                                                  ctrl_handler);
> > +       struct v4l2_subdev_state *state =3D
> > +                       v4l2_subdev_get_locked_active_state(&sensor->sd=
);
> > +       const struct v4l2_mbus_framefmt *format =3D
> > +                       v4l2_subdev_state_get_format(state, 0);
> > +       s64 exposure_max;
> > +       int ret;
> > +
> > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               exposure_max =3D
> > +                       format->height + ctrl->val - IMX471_EXPOSURE_MA=
RGIN;
> > +               ret =3D __v4l2_ctrl_modify_range(sensor->exposure,
> > +                                              sensor->exposure->minimu=
m,
> > +                                              exposure_max,
> > +                                              sensor->exposure->step,
> > +                                              exposure_max);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       /* V4L2 controls values will be applied only when power is alre=
ady up */
> > +       if (!pm_runtime_get_if_in_use(sensor->dev))
>
> Use pm_runtime_get_if_active() or update the comment. With pm_runtime_get=
_if_in_use(),
> the comment should say "applied only when the device is in use".
>
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_ANALOG_GAI=
N,
> > +                               ctrl->val, NULL);
> > +               break;
> > +       case V4L2_CID_DIGITAL_GAIN:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_G=
LOBAL,
> > +                               ctrl->val, NULL);
> > +               break;
> > +       case V4L2_CID_EXPOSURE:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> > +                               ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_VBLANK:
> > +               /* Update FLL that meets expected vertical blanking */
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_FLL,
> > +                               format->height + ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_TEST_PATTERN:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_TEST_PATTE=
RN,
> > +                               ctrl->val, NULL);
> > +               break;
> > +       case V4L2_CID_HFLIP:
> > +       case V4L2_CID_VFLIP:
> > +               ret =3D cci_write(sensor->regmap, IMX471_REG_ORIENTATIO=
N,
> > +                               sensor->hflip->val | sensor->vflip->val=
 << 1, NULL);
> > +               break;
> > +       default:
> > +               ret =3D -EINVAL;
> > +               dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not ha=
ndled",
>
> Use dev_err.
>
> > +                        ctrl->id, ctrl->val);
> > +               break;
> > +       }
> > +
> > +       pm_runtime_put(sensor->dev);
> > +
> > +       return ret;
> > +}
>
> ...
>
> > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_format *fmt)
> > +{
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +       const struct imx471_mode *mode;
> > +       u64 pixel_rate;
> > +       int h_blank;
> > +       int ret;
>
> int h_blank, ret;
>
> > +
> > +       mode =3D v4l2_find_nearest_size(imx471_modes,
> > +                                     ARRAY_SIZE(imx471_modes),
> > +                                     width, height,
> > +                                     fmt->format.width, fmt->format.he=
ight);
> > +
> > +       imx471_update_pad_format(sensor, mode, fmt);
> > +
> > +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->form=
at;
> > +
> > +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +               return 0;
> > +
> > +       if (media_entity_is_streaming(&sensor->sd.entity))
> > +               return -EBUSY;
> > +
> > +       pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> > +       ret =3D __v4l2_ctrl_modify_range(sensor->pixel_rate,
> > +                                      V4L2_CID_PIXEL_RATE,
> > +                                      pixel_rate, 1, pixel_rate);
> > +       if (ret)
> > +               return ret;
>
> Why do we need this? You have a fixed pixel_rate. Drop the settings above=
.
>
> > +
> > +       ret =3D __v4l2_ctrl_modify_range(sensor->vblank,
> > +                                      mode->fll_min - mode->height,
> > +                                      IMX471_FLL_MAX - mode->height,
> > +                                      1,
> > +                                      mode->fll_def - mode->height);
> > +       if (ret)
> > +               return ret;
> > +
> > +       h_blank =3D mode->llp - mode->width;
> > +       /*
> > +        * Currently hblank is not changeable.
> > +        * So FPS control is done only by vblank.
> > +        */
> > +       return __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > +                                       h_blank, 1, h_blank);
> > +}
>
> ...
>
> > +static int imx471_enable_stream(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *state,
> > +                               u32 pad, u64 streams_mask)
> > +{
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +       const struct imx471_mode *mode;
> > +       struct v4l2_mbus_framefmt *fmt;
> > +       int ret;
> > +
> > +       ret =3D pm_runtime_resume_and_get(sensor->dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D imx471_identify_module(sensor);
> > +       if (ret)
> > +               return ret;
>
> Runtime PM leak. Please call error_powerdown at return path.
>
> > +
> > +       ret =3D cci_multi_reg_write(sensor->regmap, imx471_global_regs,
> > +                                 ARRAY_SIZE(imx471_global_regs), NULL)=
;
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to set global settings: %d=
", ret);
> > +               goto error_powerdown;
> > +       }
> > +
> > +       state =3D v4l2_subdev_get_locked_active_state(&sensor->sd);
>
> Why is the active state retrieved again here? state is already passed to =
enable_stream()
>
> Drop this line.
>
> > +       fmt =3D v4l2_subdev_state_get_format(state, 0);
> > +       mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471=
_modes),
> > +                                     width, height, fmt->width, fmt->h=
eight);
> > +
> > +       ret =3D cci_multi_reg_write(sensor->regmap, mode->default_mode_=
regs,
> > +                                 mode->default_mode_regs_length, NULL)=
;
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to set mode: %d", ret);
> > +               goto error_powerdown;
> > +       }
> > +
> > +       ret =3D cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GA=
IN, 1, NULL);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       ret =3D cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +                       IMX471_MODE_STREAMING, NULL);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       __v4l2_ctrl_grab(sensor->vflip, true);
> > +       __v4l2_ctrl_grab(sensor->hflip, true);
> > +
> > +       return ret;
> > +
> > +error_powerdown:
> > +       pm_runtime_put(sensor->dev);
> > +
> > +       return ret;
>
> ...
>
> > +static int imx471_init_controls(struct imx471 *sensor)
> > +{
> > +       const struct imx471_mode *mode =3D &imx471_modes[0];
> > +       struct v4l2_fwnode_device_properties props;
> > +       struct v4l2_ctrl_handler *ctrl_hdlr;
> > +       struct v4l2_ctrl *link_freq;
> > +       s64 exposure_max, hblank;
> > +       u64 pixel_rate;
> > +       int ret;
> > +
> > +       ctrl_hdlr =3D &sensor->ctrl_handler;
> > +       v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> > +
> > +       ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to parse fwnode: %d", ret)=
;
> > +               return ret;
>
> Memory leak, Use goto error here.
>
> > +       }
> > +
> > +       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &p=
rops);
> > +
> > +       link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > +                                          &imx471_ctrl_ops,
> > +                                          V4L2_CID_LINK_FREQ,
> > +                                          ARRAY_SIZE(link_freq_menu_it=
ems) - 1,
> > +                                          0,
> > +                                          link_freq_menu_items);
> > +
> > +       /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample=
 */
> > +       pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> > +
> > +       sensor->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctr=
l_ops,
> > +                                              V4L2_CID_PIXEL_RATE, pix=
el_rate,
> > +                                              pixel_rate, 1, pixel_rat=
e);
>
> You can drop pixel_rate from struct sensor. it is not used anywhere in th=
e driver.
>
> > +
> > +       sensor->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > +                                          &imx471_ctrl_ops,
> > +                                          V4L2_CID_VBLANK,
> > +                                          mode->fll_min - mode->height=
,
> > +                                          IMX471_FLL_MAX - mode->heigh=
t,
> > +                                          1,
> > +                                          mode->fll_def - mode->height=
);
> > +
> > +       hblank =3D mode->llp - mode->width;
> > +       sensor->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_op=
s,
> > +                                          V4L2_CID_HBLANK, hblank, hbl=
ank,
> > +                                          1, hblank);
> > +
> > +       /* fll >=3D exposure time + adjust parameter (default value is =
18) */
> > +       exposure_max =3D mode->fll_def - IMX471_EXPOSURE_MARGIN;
> > +       sensor->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_=
ops,
> > +                                            V4L2_CID_EXPOSURE,
> > +                                            IMX471_EXPOSURE_MIN, expos=
ure_max,
> > +                                            IMX471_EXPOSURE_STEP,
> > +                                            IMX471_EXPOSURE_DEFAULT);
> > +
> > +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGU=
E_GAIN,
> > +                         IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
> > +                         IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT=
);
> > +
> > +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL=
_GAIN,
> > +                         IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
> > +                         IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAU=
LT);
> > +
> > +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                    V4L2_CID_TEST_PATTERN,
> > +                                    ARRAY_SIZE(imx471_test_pattern_men=
u) - 1,
> > +                                    0, 0, imx471_test_pattern_menu);
> > +
> > +       sensor->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops=
,
> > +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +
> > +       sensor->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops=
,
> > +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +       if (ctrl_hdlr->error) {
> > +               dev_err(sensor->dev, "%s control init failed: %d",
> > +                       __func__, ctrl_hdlr->error);
> > +               goto error;
> > +       }
> > +
> > +       link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +       sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +       sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +       sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +       sensor->sd.ctrl_handler =3D ctrl_hdlr;
> > +
> > +       return 0;
> > +
> > +error:
> > +       v4l2_ctrl_handler_free(ctrl_hdlr);
> > +
> > +       return ctrl_hdlr->error;
> > +}
> > +
> > +static int imx471_check_hwcfg(struct imx471 *sensor)
> > +{
> > +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +       };
> > +       struct fwnode_handle *ep, *fwnode =3D dev_fwnode(sensor->dev);
> > +       unsigned long link_freq_bitmap;
> > +       struct clk *clk;
> > +       int ret;
> > +
> > +       clk =3D devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> > +       if (IS_ERR(clk))
> > +               return dev_err_probe(sensor->dev, PTR_ERR(clk),
> > +                                    "can't get clock frequency\n");
> > +
> > +       if (clk_get_rate(clk) !=3D IMX471_EXT_CLK)
> > +               return dev_err_probe(sensor->dev, -EINVAL,
> > +                                    "external clock %lu is not support=
ed\n",
> > +                                    clk_get_rate(clk));
> > +
> > +       ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +       fwnode_handle_put(ep);
> > +       if (ret)
> > +               return dev_err_probe(sensor->dev, ret,
> > +                                    "parsing endpoint failed");
> > +
> > +       ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freq=
uencies,
> > +                                      bus_cfg.nr_of_link_frequencies,
> > +                                      link_freq_menu_items,
> > +                                      ARRAY_SIZE(link_freq_menu_items)=
,
> > +                                      &link_freq_bitmap);
> > +
> > +       v4l2_fwnode_endpoint_free(&bus_cfg);
>
> The sensor supports both 2 and 4 CSI-2 data lanes, but this driver only
> implements the 4-lane configuration. Please validate the data-lanes prope=
rty
> and reject anything other than 4 lanes.
>
> > +
> > +       return ret;
> > +}
>
> ...
>
> > +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused =
=3D {
> > +       { "SONY471A" },
> > +       { "TBE20A0" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
> > +
> > +static struct i2c_driver imx471_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "imx471",
> > +               .acpi_match_table =3D ACPI_PTR(imx471_acpi_ids),
>
> Could you please add .of_match_table as well? The driver can also be used
> on DT-based systems.
>
> > +               .pm =3D pm_sleep_ptr(&imx471_pm_ops),
> > +       },
> > +       .probe =3D imx471_probe,
> > +       .remove =3D imx471_remove,
> > +};
> > +module_i2c_driver(imx471_i2c_driver);
> > +
> > +MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");
> > +MODULE_AUTHOR("Serin Yeh <serin.yeh@intel.com>");
> > +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> > +MODULE_DESCRIPTION("Sony imx471 sensor driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.54.0
>
> Best Regards,
> Tarang
>


--
BR,
Kate


