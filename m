Return-Path: <linux-media+bounces-51530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL5fOeA4d2nhdAEAu9opvQ
	(envelope-from <linux-media+bounces-51530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:50:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BD8632C
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57BA0300E15D
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9397F2C08D5;
	Mon, 26 Jan 2026 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq6QIE/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F395313547
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421022; cv=pass; b=lpiHVLA10tCj79HUH2mIWeUN5Z5+z3pTqxMI9MfwOA1wVqzezqYgCMaHM4/YbXfpkJ4K8xZ2tRl2eG/dkuNZIXejo2nuUOc5MD2oc+m7DHqklp/XarG2NicaZc8slTGql3Gv+HeCKIwnrgehdwMvVx8sMY6gHjuKvgS3PNJa7aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421022; c=relaxed/simple;
	bh=cGQu2EGRQNTg5jehYIe37iXIRI1Qv02jmN9aaHxq5wM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmdVIrmObPd+KdURnWa2JL4jLMg1mpfDPHdNjndDjdM0Yv8Lo/otjnS4o9FBfLl8cqzaHQfpfu3XDxMtfkt8wyH7xKwBLDVfVEC/nx7gsYcsT7tAQ2FWz+mgAXIMu7UHBahuoTjXLSH6j+2fiweTo3kKWXGaTe6iwH8OH8mR/vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq6QIE/D; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2751375f8f.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 01:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769421019; cv=none;
        d=google.com; s=arc-20240605;
        b=DRURizEh/KTAUgTWzrZ/jIl9aOlkplDmPcKYe2/B7Orn6zOZT5KWIwBLAfcqvgzVvo
         BkbRt2uXs+xwitx/MHZmkwKFBvQVn9KuxcaxT7mB8b64AX2FKDhdcWJqPZJRKnRYIIkK
         0KY4kFeC3QdwY15Zzc7mQpoWCLqYpG/WnyShYuYHK6jfSBzdHt9vBoUQ+jXafasPQvmj
         0Zbq2owBZhq00f8OkI4yPjxD9dzjgdFh7S1oThhNWzaRNJ0W9Zjzk4vMXz7ZwGqV9/qu
         62gzJoVw1Y4v1kePK3DwJSYbySItWUJTlOci9/cGQBARaul4KWWrFC9W82zjMCjFsu0b
         3wWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JqRoZEhecJjcnPHj8nYQiMdf+1z/05ZwRt/vvvbBqQI=;
        fh=T/coQFDMnLZvNjmJyWq+V+OqGyrGB8LMIGx0T1fkOu8=;
        b=Dx5/Bols2uji4Y/NoU1S4prHegyWJbmOwawBS/7t6WKfa14awixfuUc8NFdhLRY5FN
         6+4vXhEpWVcoV6eUvdbFsd9otcW5D543KSMtVV/XCKqDl+iXQcPwZVbL5wYIrDNEPjT0
         yvmhlXONM0BH+dums+QKmEpHa81x7Jsjv2bbaR8IPCfqlDuz8gZJ/n+Sn/ICEGjEj+RM
         saFb0EYDBJlXEPltXJcvWs0/3I0HIbNxQkGhj+79K0V97K3y3Ok1utHaIEqNrlnCAFT1
         nVhZGilWjSRz5xBA8Z236QRVCc3tJLsvnsaJRVGh4Jxd1kVvblfaNzRgNleEtyHR8gLa
         7ikQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421019; x=1770025819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqRoZEhecJjcnPHj8nYQiMdf+1z/05ZwRt/vvvbBqQI=;
        b=iq6QIE/DfqD7vFsd361ext8AoZGqm7UKxf7MAEZRBBeGZltWXWBgNJth9yE79b0tq8
         3n7AdwvM7ttL9I3V7wwiZC2AucSbvZ6KHeVAhhWtwbobaNUcDjl3zKCjbHiEHt5nbmJp
         diesw2Sblc5O8YZs+cb1cPgoTlH1KtSPYic89hQ1pHnn+HT1vWCVgRF4QTTmqG4dh3Jx
         4qQpfspJxb3HrP2BydRlhGX7x/7C1KIeSazjWlJnHzresVjk9cH4dsXiyi8WdGeK/7F2
         hfrn2VtvOYnDvuEdD+En0C1hnCfllZBguCLnpyFf1ule7aa93ihWGDWaZLym0nIfq941
         1HQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421019; x=1770025819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JqRoZEhecJjcnPHj8nYQiMdf+1z/05ZwRt/vvvbBqQI=;
        b=SdVQxOz4mnHmcoaCeUTLJJ+UaOmXK4I3rayzuRnqlA8yAfHasMXRrNs9l1DfJvhIVD
         iAt04ExuMVLw7rvx/qk181twKM0dx5Ixaf2mKEmPqNXu8THBwo9Ml1YQ4y4RZOdAAc4w
         lQlm+DwKu1uaWAtD0eG1CEjOAQbVm7jCcFBzCDBbXg/sqEGFZ5aD2TdzjMvsOrhDcIwV
         mR406L9MHAEJTM2q1dopDTvJkcE0YLEdrQRKIuWdSVSnGiBWVwcRhwyx455g5rNbeAVs
         yGluaXU+X1jao77X6FRfnlhSIpfZrGt3e7FpeucAxXwrw2IWjsRNSCy2aCflfadEpzWh
         Wykg==
X-Forwarded-Encrypted: i=1; AJvYcCX5MVzYtyN/ct4j5yQXCyK+CJW5nlMAIrIPUB+He6lunsOE0TjQIF6uR/hfEwwvMtnMPJ+JtJFLgDNd2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkG337ZHUbf2/uxeOyESXeUlOcNMUB1KVtN76w9wrMcKZ1IHXa
	K/YAo1Aa67mCRuzxfIO3hZE5VQKmJMbc6lH4zoNPfgCFuei8nUZPDlCycpktd51aCCjrtW2uLJ7
	PszUGqd1mhcInTKg0cnYyaP1NeUSqFww=
X-Gm-Gg: AZuq6aJWhoNqgACQ4861ig/2JeZEHUkL4ub+0JlpdM4R4A7E93u/5myU8IVyT0Es5Q/
	qvSmmk5WtMd1DcWEIynDByfFHtdwP478YaqIVmZsMqVv7DklxAstm4m8fI4t/OQF5l4DtjM1aJk
	N/OUYKR/+9yAAi+VY8NpHEWYcTWAki1bAmJrr/2/auHTZVzT/iAwvfsasQ8p4bXkkq05k739z8T
	a+VR3X9wzMbHzTjAAaEUTMdWLvFKXV5tecnJUK848RxYguNt2XdsnkVh1epADhqmU+XxQVL
X-Received: by 2002:a05:6000:2410:b0:430:f7dc:7e8e with SMTP id
 ffacd0b85a97d-435ca18f48emr5999415f8f.34.1769421018375; Mon, 26 Jan 2026
 01:50:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126083430.8247-1-clamor95@gmail.com> <20260126083430.8247-3-clamor95@gmail.com>
 <aXc1XwD8Wo2yu4dv@kekkonen.localdomain>
In-Reply-To: <aXc1XwD8Wo2yu4dv@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Jan 2026 11:50:05 +0200
X-Gm-Features: AZwV_QjOQ3QcXL3NXqa7mV6ImDvxW2ANsuss-JfX2KrPKkGoWsTBotuEQPEOLhM
Message-ID: <CAPVz0n3=JPyjm3RypcSec=FZ66W2cq4Mwu2yodR03Ng2jDbxEw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: i2c: mt9m114: add support for Aptina MI1040
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51530-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C6BD8632C
X-Rspamd-Action: no action

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 11:35 Saka=
ri Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> Thanks for the patchset.
>
> On Mon, Jan 26, 2026 at 10:34:30AM +0200, Svyatoslav Ryhel wrote:
> > Slightly different version of MT9M114 camera module is used in a severa=
l
> > devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
> > called Aptina MI1040. Only difference found so far is lacking ability t=
o
>
> s/Only/The only/
>
> > poll STATUS and COMMAND registers during power on sequence, which cause=
s
> > driver to fail with time out error. Add polling flag to diverge models =
and
> > address quirk found in MI1040.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++-------
> >  1 file changed, 28 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > index 4ec033c0ee84..d96a57ebcad4 100644
> > --- a/drivers/media/i2c/mt9m114.c
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -368,6 +368,10 @@ enum {
> >   * Data Structures
> >   */
> >
> > +struct mt9m114_model_info {
> > +     bool polling;
> > +};
> > +
> >  enum mt9m114_format_flag {
> >       MT9M114_FMT_FLAG_PARALLEL =3D BIT(0),
> >       MT9M114_FMT_FLAG_CSI2 =3D BIT(1),
> > @@ -421,6 +425,8 @@ struct mt9m114 {
> >
> >               struct v4l2_ctrl *tpg[4];
> >       } ifp;
> > +
> > +     const struct mt9m114_model_info *info;
> >  };
> >
> >  /* -------------------------------------------------------------------=
----------
> > @@ -2186,9 +2192,11 @@ static int mt9m114_power_on(struct mt9m114 *sens=
or)
> >        */
> >       usleep_range(44500, 50000);
> >
> > -     ret =3D mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET=
_STATE);
> > -     if (ret < 0)
> > -             goto error_clock;
> > +     if (sensor->info->polling) {
> > +             ret =3D mt9m114_poll_command(sensor, MT9M114_COMMAND_REGI=
STER_SET_STATE);
> > +             if (ret < 0)
> > +                     goto error_clock;
> > +     }
>
> What does the datasheet say, is there a need to do something else instead=
?
> As the polling is there to ensure firmware has done its job, the need
> appears to still be there.
>

MI1040 has no datasheet available and downstream code does not do this
polling. I have tested on Nexus 7 which has this camera and it seems
to be fully operational without this poling, but as soon it is enabled
camera fails will timeout. I suspect that this camera version has some
quirk regarding early access, but I cannot back it up by any
documentation or additional data.

I have a device with proper version of mt9m114 too and it works with
his driver without any major issues.

> >
> >       if (sensor->bus_cfg.bus_type =3D=3D V4L2_MBUS_PARALLEL) {
> >               /*
> > @@ -2207,9 +2215,11 @@ static int mt9m114_power_on(struct mt9m114 *sens=
or)
> >        * reaches the standby mode (either initiated manually above in
> >        * parallel mode, or automatically after reset in MIPI mode).
> >        */
> > -     ret =3D mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> > -     if (ret < 0)
> > -             goto error_clock;
> > +     if (sensor->info->polling) {
> > +             ret =3D mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STAN=
DBY);
>
> Ditto.
>
> > +             if (ret < 0)
> > +                     goto error_clock;
> > +     }
> >
> >       return 0;
> >
> > @@ -2421,6 +2431,8 @@ static int mt9m114_probe(struct i2c_client *clien=
t)
> >       if (ret < 0)
> >               return ret;
> >
> > +     sensor->info =3D of_device_get_match_data(dev);
>
> You can use device_get_match_data() here.
>

noted

> > +
> >       /* Acquire clocks, GPIOs and regulators. */
> >       sensor->clk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> >       if (IS_ERR(sensor->clk)) {
> > @@ -2539,8 +2551,17 @@ static void mt9m114_remove(struct i2c_client *cl=
ient)
> >       pm_runtime_set_suspended(dev);
> >  }
> >
> > +static const struct mt9m114_model_info mt9m114_models_default =3D {
> > +     .polling =3D true,
> > +};
> > +
> > +static const struct mt9m114_model_info mt9m114_models_aptina =3D {
> > +     .polling =3D false,
> > +};
> > +
> >  static const struct of_device_id mt9m114_of_ids[] =3D {
> > -     { .compatible =3D "onnn,mt9m114" },
> > +     { .compatible =3D "onnn,mt9m114", .data =3D &mt9m114_models_defau=
lt },
> > +     { .compatible =3D "aptina,mi1040", .data =3D &mt9m114_models_apti=
na },
> >       { /* sentinel */ },
>
> The sentinel entry shouldn't have a comma. Feel free to fix that while at
> it.
>

noted

> >  };
> >  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
>
> --
> Kind regards,
>
> Sakari Ailus

