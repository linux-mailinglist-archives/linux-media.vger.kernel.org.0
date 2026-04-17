Return-Path: <linux-media+bounces-59017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JIvJs8p4mmQ2QAAu9opvQ
	(envelope-from <linux-media+bounces-59017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:38:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1441B457
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B59643060370
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDB739A041;
	Fri, 17 Apr 2026 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKvfZEOF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1D39936E
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429475; cv=pass; b=gNKMBbYlXXlF7Viyuy0f5VR5gNSvdJvB41EqepXWO9Xg2WbHaURKVuvwleUUhUs5l7U68XsgguOpsBfak6XuvBrtlyv0g/FgX1wkGyOcjDYPxgiG4F0N2mOj+vXrmhVr9CkC3taVMgP1r7jTCA4o/wCJ1A5cNx6xs0dKiC8KSD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429475; c=relaxed/simple;
	bh=oIu6DN+Yo1GS9V6OFVEhLzwsWKEJ4+izexh3mPX7P/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6TQ+ywBXNkv6rGnxYTp+xfO4nHJNHtFmINwTpy12IdvK5oyozHp3ZimzrnduQ5QNeQuWVuLKjt6aPchIloYrKn+A3biE+DTim42m1FknaVXGat7sI4Ai4+/X3vU3WtpRRJ7NI7ktwEfptdKk5ExZEYK4Ic5w4dVANIWW+mFlwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKvfZEOF; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so470926f8f.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 05:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776429470; cv=none;
        d=google.com; s=arc-20240605;
        b=a8nrWI1xCHZS1YlIngVirGHsQE8vg2WzGakygQWxLjS8CcS6QKPRzF165CYrJ3TCdJ
         SI9E/LMMIK0YacyWFaUpWIJ2HoO9inRwu3wki02yEpQYN4Rlk9Bwg5I/LqaMNow9V61w
         QpK/N061MUiv1R+xhA0/yFmdZ1l2oitXXbzbkYEarQ9auDZqzWg6n/TAAU+Ti7RoCM88
         UrKO2ztdBdMCL5IxVTdcWGrryvsFcHBdwvmi2fg+JHl4VP+2V6ZJSO3GZukeDI4FFa6P
         pRHGx4gA4w5u4o01F8Ut76bA6bBzsssVIRp6267bccbWFgqKs+sTuIBgaPgM+uhZKFtx
         PGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        fh=jlXlb4RcY2KrpOWRKIdNQMj1ZG+Sdm2cDvbSDavFnjs=;
        b=F5lFhkcH2uzROj6oxDEp9T+ixYf43+slhVpKkJfDUe2Dbp689HDTWvD2zqxqEl1maS
         6IScCnyayAI2cJcfcH6bkcITW6mATvVZtYoMmX9uhdrTnlQb2xSz2JnLPlEkKNdSqJLz
         Y+NB697hMHZXrMNbbD5cQx1lRpyWQ/j3JcqdyW9moeHtIlg4Oxbcq1vnO8eMXA0OCO/h
         FwArGSYk4xl+CotXg9fwFMnuarb5Os0VG+PFIeX6Bwt8qR14r1RsG15QsiHYnL4Yqe/J
         xKP99bibQCZOTx7kDkM/DTDBQvD1cIRtTcQbxW8EHg4WAIFP/Ci46Q/DPTFCUex5Swiz
         dWqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776429470; x=1777034270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        b=DKvfZEOFlif43UowkBTiqnBqo4w51hQ1NFE+e3B9wKKJmkL4Dnk3gfxApDI3ObV9i1
         RzS9mvQ3X/R7E+DPEnUSs2AhquNJuCPY7v4Fxdp8ID6l7VihnPSBXV/V2o7+atG/TYUa
         g39OwaJop8TMOXSsDrdpQ3o+v2t1jlG4ca0YMuHBJs4c/CBiaquJ6nJka/DLSi7f3z3r
         H7uduTF2cSl4ZGjxgWcMrkdG3VD0TrbK3IwHaBDau7r7ziu/S4aLEZO9lVqZxwmHLo7V
         KB6FZ1EI9zs93NgzJjHfneT8GEXgZ5lwX8sbwzrv//QnhECprjlcu8U/PC7ctZzyjQ9W
         Xjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776429470; x=1777034270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        b=IQIGDtxg6rXhq1+iaoiH8wf2q/PBHJPPu8+Q78EBeBcfuU0diPS4eDLQ1h3h97i00b
         wcpQu1bZpIK8EoyHZNVka5uWOyKaiAWanWHjED97NzsPtTZSdyKOe6IVR6wW5IlBaD1p
         kXmNB37SE7dMMuazN5yzhSOx4eOdT/JMx+z7G+FC08HJmMb/WOW260AU/RqiavleZo9H
         8806iSS5gBWeH3x95RL3HnpKfgVC0I1MgJtypIfU/UlLdIVcl2ZN1BHY6am4lTDOKSc6
         6l9KJggGTWWN/qCriQEVK/25EtJu9cqDG/Ucsj2QcvzD7JVuIBQfila2EXbxghb3oTY/
         uR9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Zh5H22R+xnQy/o/GRAMfZsKpE9r1f0TQTo4armiY+0JiVYN+Isa2so23i9s8ja5HyBmW7AL0/0cfBdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwFngItZGjyB9TFMReNwLW13qOvMAusx/Qx1ft7q2bg7ADxvkp
	ZXAd2yZivSVi7NFk0G/jXMGqeUxa7RMdmYN+MDZXk7sHdyO8hQW0/nP3l/qbkQgqsj5HJs40MkQ
	QErBA9CjwNpqapPH/g8mqZMmMawq5ho4=
X-Gm-Gg: AeBDieu7c0NXGSkDck45p1L2JqIrZFHuYZNElq+5wpUu+Gu9zioclKezXwZPqQvopf+
	tl8yWX4UwA5kQhnWveVetDhIQfQY5qQx2skym/aEfY/PvNJDV3FEzXdRPqxr1hcazJPfHuI9tO2
	zUGApiuJ4f1rUhlM8r3VPTPyxvZaorHnPSKojldwxc+bNLANRtiyuaDcAQtw+xl8DP3WEuBYno0
	ZafaZF5tLn2rlkENhOBheF/ukDaVSnwQ/7Qy/WC70lrMq99aDWcPm4t4LWDiV6XAX62VzMesyV/
	nQFQpL3ayNcb9MN01dY=
X-Received: by 2002:a05:6000:1ac5:b0:43d:73d4:b1a with SMTP id
 ffacd0b85a97d-43fe407c0d8mr4468477f8f.19.1776429470199; Fri, 17 Apr 2026
 05:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417114226.100033-1-clamor95@gmail.com> <20260417114226.100033-3-clamor95@gmail.com>
 <aeIk3z8f4dvjEXBQ@kekkonen.localdomain>
In-Reply-To: <aeIk3z8f4dvjEXBQ@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 17 Apr 2026 15:37:37 +0300
X-Gm-Features: AQROBzCGajxfHOMdb-jAWC2IPNr-tHIUYgt6Ny8fWbZU1eaEM3yL-TGQmmJHhU0
Message-ID: <CAPVz0n0vf_Re-4s4ygOP8aAMA+b=o7yM+UYVZiRUfkrJ931J2A@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] media: lm3560: Add IN supply support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59017-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1A1441B457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
7 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Fri, Apr 17, 2026 at 02:42:23PM +0300, Svyatoslav Ryhel wrote:
> > Add IN supply (2.5V - 5.5V) found in LM3560 to ensure its proper work.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/lm3560.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > index e6af61415821..a2674af6c9fb 100644
> > --- a/drivers/media/i2c/lm3560.c
> > +++ b/drivers/media/i2c/lm3560.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/mutex.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/videodev2.h>
> >  #include <media/i2c/lm3560.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -434,6 +435,11 @@ static int lm3560_probe(struct i2c_client *client)
> >               return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gp=
io),
> >                                    "failed to get hwen gpio\n");
> >
> > +     rval =3D devm_regulator_get_enable(&client->dev, "vin");
>
> I'd also enable this via runtime PM.
>
> Sensor drivers such as imx219 serve as a good example here.
>

Would you mind if I squash adding hwen, vin and pm into single commit?
It would be tricky to separate them from PM addition. I will add
descriptions of what was changed.

> > +     if (rval)
> > +             return dev_err_probe(&client->dev, rval,
> > +                                  "failed to enable regulator\n");
> > +
> >       rval =3D lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
> >       if (rval < 0)
> >               return rval;
>
> --
> Kind regards,
>
> Sakari Ailus

