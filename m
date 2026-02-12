Return-Path: <linux-media+bounces-52674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aExbNmkDjmlf+gAAu9opvQ
	(envelope-from <linux-media+bounces-52674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:44:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECFE12F8CF
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10917303EFCD
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C1435DCF3;
	Thu, 12 Feb 2026 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsGp5p+d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC635CBBF
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770914660; cv=pass; b=ob7B1QkvZDY39MF36MnVyELpQkuGJWR3smD+TJAvj6A3ryeWdnZJp9nc5yr4aB+wAftdKyyIb4ASOBJ3Of5iU83/tt9mFfled24zru9+MDw/E8BTSbZrXox0pupljLiCRekgt7Gp9wkFzhuXmb1mn/hgM/HMOZxRFrPPQKmV7jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770914660; c=relaxed/simple;
	bh=VDqnSoAcb/UFd/YOnLuG10wuFJa5jjHmt7QWH5ahMSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYSdPsQtj+D4B3+tcaG2V0L6VmaMcRpJ09O9OaDMYEiw2s8m9D8saaD+APWMmR53XpOzY2hoDmDgVhHy2qya2dAM/vHm6znW1zlwHh7PJ0q+qY0LVZa1YrRsq1D74yVsTy75qMOgsn0HlO8B/LHhvwinal6UfUgLMuutQVDa8Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsGp5p+d; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43626796202so57795f8f.3
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 08:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770914658; cv=none;
        d=google.com; s=arc-20240605;
        b=OGLiVbXCo4ktdyyK097NGSH9Q+zpH673+9hsTNP6dnz83uvY+L8xjgqo60YlnIQKAf
         VdAa3yWGldLuigEUXKTVQ9nPOtj1J4qGbA7JlkLIvkBh78inZk4xWMLS54p+5hXNWm6P
         ohpa+N/2mthvm8XDCRbbGi//anHHCPixmXX90MPDd1xNmHWXNC5e68rogVJ5ZtYcbqHq
         NfUhw3uuMyMga7FcrBurKo618FtbYSMJtFpxG3hk8a5XGZ6/67a4Lfrg0qM7AGPLZScb
         qDWrsQzG80OVYKEWkk22Lcu1Lk2+OJ8ce2gb7YcGFrAJeRSiP2MmWeog1wPKlNXTyAqY
         vDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I/RYJJ7q55MvOOqIL3m0zu4yv/whLz1HFbVP/Fxg0NM=;
        fh=PYLnEe32ymfr1tABvB3FNeOWH/xbjt3l2HpRNHFqSw4=;
        b=lbbojZ++0c+67LIiZBpFv/nqPBqesUzV/2NCbeggdJISTgIhGbA//4w5FZ6C0dHvqE
         HtlgYIb7n0zKS5cOb0vVHq2fZXAIyDuk91zgXOKxqAQ+iCUf0PBoeMRsBRjlSioXufn4
         /34ksw0UhaprncYFsJwhJa+8d9o+URsCA3ky01fv1RiHpvVPtowCUSA0U2sv3MYzD3Hz
         ujLeebHps7CHPKVDlzkgpVfYoRTDHxBfPGmbPReqDpU3CAVThndi1QScsOJ8CFY0kXnK
         TMD2/1YXh6k9Xg3uv0QS1mTm/hyRFbo57SwIO3yyISKxtkRDbWWaGOZ5DC1CR4QFtn9y
         uG9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770914658; x=1771519458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/RYJJ7q55MvOOqIL3m0zu4yv/whLz1HFbVP/Fxg0NM=;
        b=jsGp5p+dalKKFoV61vLV3AYT5jpW1RYq7h+9GYVfad91ZlDi+HWDUthQb1G8GZH6nz
         pAZPV9EAHF7TJYxO5KRwRqUyXSu0PDBlhTv2AzMgAjxiY+6yGHSFtRddZuIOD4VrDENy
         UycEpMoanHtFVRJXtU/wt7HfIXvqHE60yjUTE+HK7xTz4GV/U64sMVj4Edn+4XA9Mr90
         YUiz5OTOa8dx41CPgG0PyGhbAPzBtXMBOEhYe+dOJkIQeeNDdUiQoZPZq5Stje97AbIZ
         dGonXIjW85pzmJj5MGkbmhSUGb0itRntRAtNnJMMKwVSC/VyvlXfVR0mMWOL8LIDfrcF
         VV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770914658; x=1771519458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/RYJJ7q55MvOOqIL3m0zu4yv/whLz1HFbVP/Fxg0NM=;
        b=nX+DzEzdQTiMYgB2k4R3jWmdAewNBaYxoxFo+kH/r93r8bpMHzkpNpNdZd5WRB5icx
         6MABnGaJKNDPSZ7xLbmkFPWXdHHuU/ao6CmQNunN48DsrZsoAEYSxTo2nZKXuQwYsTty
         6z2XCr+AnE/0Od22j2xWL90fKIfI88EcTuT8YbtLze2u64wQZTmMh7SHinuFUReoo7Lr
         +lSJuTnIirc2ayN/QEu/vY80AStJXN7H9utpBIJ7MlMVactFsNGqSwOtnhZryK5P6YJc
         Plz6Py6S29ScJ5m+0o2lRsUehTrsSsNJG9NR+tFVviiY55CM0U8jic4GjDWjef4yGRzq
         a/CA==
X-Forwarded-Encrypted: i=1; AJvYcCVZvGbyWtZ8Zrn+LpXH/3k/+tBgjMtKlmItK0y3hZL3W8OEq6coVoQnoVXEyIlDwUW/dLNq+0w5NcdBvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+dZAmom2W2wdTCspAeH0LkTWJMxTL+ZxUmlR7omZGRF5vju8
	BccfZWZ8nSqCiXhKvKCkUEePaWPXybpiuAEWNLjbRdTvPqCDO5b1G7urBH1g26/kDM+VoK8hYK2
	1ZM21RDe+6rWJ1kHKMr777Kl8rgWEipo=
X-Gm-Gg: AZuq6aJHeQRmiWemFk2F9KfAIgCudKSfptm7v8XkTM55DQNvANiZv7xiccxg/shj+dp
	L4NaZRGiWYAAH7RLbljy7rnOtHIIVePEPhTaJb1jjQliG1rP7MpXBtjbwcjXfUnTeXHUUgqPH7N
	kUBqPKeCCAAVd1qkFWJoa/9d4lFT9shvr4fRJpu4f3cZz6hxYC6HOwGC0i0IjUZBpxSpl99xG+Q
	DVXCyL7QQAJf5Po4Y2zgveSggKrtTYcyGoAQdEJOW7mb3Ulj1pJUIDjtaOOimmrgMp4MtXLDrZX
	WEj/O/Hh
X-Received: by 2002:a05:6000:25c4:b0:435:e451:39d4 with SMTP id
 ffacd0b85a97d-4378f183dadmr4950547f8f.44.1770914657435; Thu, 12 Feb 2026
 08:44:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212122302.29211-1-clamor95@gmail.com> <20260212122302.29211-3-clamor95@gmail.com>
 <1cb955d5-c813-4b52-8f0a-51e4635d7b27@oss.qualcomm.com>
In-Reply-To: <1cb955d5-c813-4b52-8f0a-51e4635d7b27@oss.qualcomm.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 12 Feb 2026 18:44:06 +0200
X-Gm-Features: AZwV_QimqdlIQ0qDjpK17kNf5lGS_VBdEULEGTDmWKbRCRnHVEJ52aysLsMC6gc
Message-ID: <CAPVz0n0CSFhYKnzLWsSo_7kE_nDsBKJ1cS+A5ZQ6gt9DWLtxAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: mt9m114: add support for Aptina MI1040
To: johannes.goede@oss.qualcomm.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52674-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 5ECFE12F8CF
X-Rspamd-Action: no action

=D1=87=D1=82, 12 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:53 <joh=
annes.goede@oss.qualcomm.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On 12-Feb-26 13:23, Svyatoslav Ryhel wrote:
> > Slightly different version of MT9M114 camera module is used in a severa=
l
> > devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
> > called Aptina MI1040. The only difference found so far is lacking abili=
ty
> > to poll STATE register during power on sequence, which causes driver to
> > fail with time out error. Add state_polling flag to diverge models and
> > address quirk found in MI1040.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/mt9m114.c | 29 ++++++++++++++++++++++++-----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > index d5b142fe68a9..a4b021702a1f 100644
> > --- a/drivers/media/i2c/mt9m114.c
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -373,6 +373,10 @@ enum {
> >   * Data Structures
> >   */
> >
> > +struct mt9m114_model_info {
> > +     bool state_polling;
> > +};
> > +
> >  enum mt9m114_format_flag {
> >       MT9M114_FMT_FLAG_PARALLEL =3D BIT(0),
> >       MT9M114_FMT_FLAG_CSI2 =3D BIT(1),
> > @@ -422,6 +426,8 @@ struct mt9m114 {
> >
> >               struct v4l2_ctrl *tpg[4];
> >       } ifp;
> > +
> > +     const struct mt9m114_model_info *info;
> >  };
> >
> >  /* -------------------------------------------------------------------=
----------
> > @@ -2279,9 +2285,11 @@ static int mt9m114_power_on(struct mt9m114 *sens=
or)
> >        * reaches the standby mode (either initiated manually above in
> >        * parallel mode, or automatically after reset in MIPI mode).
> >        */
> > -     ret =3D mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> > -     if (ret < 0)
> > -             goto error_clock;
> > +     if (sensor->info->state_polling) {
> > +             ret =3D mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STAN=
DBY);
> > +             if (ret < 0)
> > +                     goto error_clock;
> > +     }
>
> So I would expect a flag called state_polling to be checked
> in mt9m114_poll_state(). It looks like you are only disabling
> one specific case of state polling, not all of them.
>
> Please rename the flag to reflect this.
>

And which name you see fitting? There is only one instance of using
mt9m114_poll_state in this driver, I see no controversy in naming.

> >
> >       return 0;
> >
> > @@ -2527,6 +2535,8 @@ static int mt9m114_probe(struct i2c_client *clien=
t)
> >       if (ret < 0)
> >               return ret;
> >
> > +     sensor->info =3D device_get_match_data(dev);
> > +
>
> This can return NULL when the driver is manually bound through
> sysfs, which will result in a crash later on when checked in
> mt9m114_power_on()
>
> Regards,
>
> Hans
>
>
>
>
> >       /* Acquire clocks, GPIOs and regulators. */
> >       sensor->clk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> >       if (IS_ERR(sensor->clk)) {
> > @@ -2641,9 +2651,18 @@ static void mt9m114_remove(struct i2c_client *cl=
ient)
> >       pm_runtime_set_suspended(dev);
> >  }
> >
> > +static const struct mt9m114_model_info mt9m114_models_default =3D {
> > +     .state_polling =3D true,
> > +};
> > +
> > +static const struct mt9m114_model_info mt9m114_models_aptina =3D {
> > +     .state_polling =3D false,
> > +};
> > +
> >  static const struct of_device_id mt9m114_of_ids[] =3D {
> > -     { .compatible =3D "onnn,mt9m114" },
> > -     { /* sentinel */ },
> > +     { .compatible =3D "onnn,mt9m114", .data =3D &mt9m114_models_defau=
lt },
> > +     { .compatible =3D "aptina,mi1040", .data =3D &mt9m114_models_apti=
na },
> > +     { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
> >
>

