Return-Path: <linux-media+bounces-60433-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF6nMPf6+WmNFgMAu9opvQ
	(envelope-from <linux-media+bounces-60433-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:13:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C334CF289
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B61C306FFCA
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A505B47F2C8;
	Tue,  5 May 2026 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VecXaCoF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8293E51D7
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990173; cv=pass; b=YJL1jU8S0VF/6EFc4lldOtdhJNkuolOznawCi90i89FvHvW6uJiTStngZ/f1AniDrIrWLB4M16UCVcLS+/yj+Qo37aZDutF8u0Oq9fXPNmVYNCd1QX/M1o/v6EdC/EWVfPljO2Bop3jYnzmCXHrbnP/HpE6gBTVgZolSeIIB51w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990173; c=relaxed/simple;
	bh=QIUgAXjTfXdQ0fftjlz2SQAnm7krisRfODCg+xCLSOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjYNKUnQXf3l7dlj2ximghJ5r9k8friohRTQMHsdld3xSZl6yz3uRjYEyMElANaTkhOP4MWIOXWGWt9NyvUFAaWuKlI9Y9zo4Hua9Ned1Hu6ptR3O+UyxalswbGl6chOJhahNELgrjI2kOCRVgHaJiYDlpZAfbjAEUyUBdeBhuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VecXaCoF; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1309f4ee97fso1940724c88.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990171; cv=none;
        d=google.com; s=arc-20240605;
        b=TnE/xwy6ul7cdbSUb9fGEOAG5b8ec2FhH9jdISn1NnTG9FR7hxDPoRJgd6t3V/YgyP
         EIKrH/3bwjVLkE5hMIcVo5KYj5zBLo0m3T0z499EDW5ec8Nem7ECo8uF40QWbz5lCMx4
         wZtkwtEZvUZUDAU023czn9USfb5tVTLZZYCiLGmrTxxWXwEyCQEVKNniyBAPBCKUJ5P2
         taHKJl3TAIKN56L9nxX7Pd2ahSojDGpLIJvgcvrKB0JzCakHYTluWoDT0/MJdAp08TZm
         dYCnvDh7iz6Hpy6LOYSATwP5oX2GPPG4GRu90nm9NYsd98zJsW54xtl7JCWZNKi8ZJ8e
         Rs3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RuVZOBew+6vTm7k8LkHh8xz2Ehd/Dui+tNqUwCYx1KA=;
        fh=p3eOAsCMUANfqFU11R2Y61du/50zO3cPJccH+D566oI=;
        b=Yey1eEfUSGFOoEO3eLei3FKoFMitNJPgsQvDwfU555UofoUZkRFbwaD1ED6EGSpN+1
         laJz5g8imNnpKWA2mNDXw9r5p4mMHLJHPmbGbbwlH2QHY6LjYFQj66c+4fWDv6Va5VvQ
         RdW+Mc26q6O0duPG+k7XIwud/PMbIDAdTrMdeUZsL4HzBN6boWb7eXHXtvufRXHJ14s0
         WDvQc3Q4dk8tXY6OJCmhBLu0A3AibpsO5/W5XqK6Ufd0p2thlCpFoAuLsMcp5ruuGKhm
         3EmsNCWRlNDl/rc9VJNoKYrbRO6UZ7m2e+vFAS1B4eYVJ4PUZqfwzsdpr6g8ViOVDGzI
         gdYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777990171; x=1778594971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuVZOBew+6vTm7k8LkHh8xz2Ehd/Dui+tNqUwCYx1KA=;
        b=VecXaCoFlIj9CqmoVNapgknLoHjl5RbI7HTwA7DtfGRlcC6E22N0GaKT7r1YraulGs
         xmRiytC0MEgStfDP9FOjBk40yn7t0zz0yIffLqjffTpculdaFVlTre69Y4SlTeRhg7oS
         7m8NvmTmZC/daLqvqzQHRrVeXf7rlqNOgxHns9IfIFEvWEGPKJ5K9yQej3qtNiOv9+iD
         7DgyscpKn2zdAF6/T9H6YxE5OLNzAHZHI6cPklSaiEhRvMlpZowiuoPz5uk8hOWI+VkV
         FFYQQqRy6Vfe2+DvpnBtkGGNWd+902DP8tK3A4rIaU/S2QoL/Xi5JlGRPPpkj9+N52vg
         eWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990171; x=1778594971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RuVZOBew+6vTm7k8LkHh8xz2Ehd/Dui+tNqUwCYx1KA=;
        b=Rc2qqdODfL/Pw0pL5hNey3FPov9W3vxi3yk3uRd+ELpRJArd+A/59xXNzbJA2zg+JB
         FV7uTSFKnpw42dWM9cOg0407L06/YeUfavfZkWfMA7hbNinnNNz6YDoRgIXc1pIsrLS1
         7D2108od7CeFjzBcj16cYc5WGRRtchjtqf9vuyqFihwtcM9JwLSAa+422tS2wH5dhyf3
         05iQcQ1CP0NH71XwqtOp/tDAJ1/U7AA6mY5/eow1rU/ikBgWCb5g+d9f5Ki5/bU2iEkV
         gg906QQqElZMW9KyaSPXhVLWtMorw4pKZwhgFSBwWEtaNDSqaVROBGLbVw4HZlYen5OY
         r0cQ==
X-Gm-Message-State: AOJu0YzKxRhpYEdhQp/fFR97duv9z7qZnZC3DI3t7lBCalSaH9QTjuDw
	ljxi//1btPLw/ysIJyAEMqvE3fw1FpyLCKfWFVZR6NnOH2qr21Ls4K0X0miFTy32VcnW8TsnwJa
	1ALFsgVK4is8WyLnhyMi3BL7rggXTb1s=
X-Gm-Gg: AeBDiesKc52WVBmiUbQ8lyjKzqP1P7t9t/3Fcv24VlST92Ete5seOuHMHTlZKiVGkkZ
	SNqVB4g0ScKZdrO65SZq9xlhad8g9vzfzcA98hd5EpGsXYn1bA9qw/A7RZWVnqBKC6QZhJhR07o
	PMlbMUNlUXo1DCQbkEEw5Ss2hTcvnOJJyenoUm2vkYAPbj3XKo0gwnl9YR2eXTVd3HJdZvXxHfz
	TYkZ28fLajETd3Y9gjbnrEb38FxyRef3yUUtgpPhZHFT0D5il2mfD0RRuS8U9cBBwugF63C6DCV
	2jMUoEVghj/PwkuuD10=
X-Received: by 2002:a05:7022:ec0d:b0:12d:de3e:be8a with SMTP id
 a92af1059eb24-12dfd84ad53mr6079578c88.38.1777990169343; Tue, 05 May 2026
 07:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-2-eagle.alexander923@gmail.com> <20260505101505.GB1547435@killaraus.ideasonboard.com>
In-Reply-To: <20260505101505.GB1547435@killaraus.ideasonboard.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 5 May 2026 17:09:18 +0300
X-Gm-Features: AVHnY4K5pDjrENvEpiJMrGAVMy-6LYV9HIrklrW4bEN1kY6a11Q-A9LNKZtqIe4
Message-ID: <CAP1tNvQBKWkd0e9Yr+3swhaiHvkzUV+Ewb1qLF2kEYZy78meCQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234
 image sensor binding
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 36C334CF289
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60433-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hello Laurent.

> On Fri, Mar 06, 2026 at 01:36:13PM +0300, Alexander Shiyan wrote:
> > Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> >
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> >  .../bindings/media/i2c/onnn,ar0234.yaml       | 109 ++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar=
0234.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.ya=
ml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > new file mode 100644
> > index 000000000000..d93fa99e6535
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0234.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ON Semiconductor AR0234 1/2.6-inch CMOS Digital Image Sensor
> > +
> > +description:
> > +  The AR0234 is a 1/2.6-inch CMOS digital image sensor with a pixel
> > +  array of 1940x1220 pixels, capable of 1920x1200 resolution at up
> > +  to 120 fps. It supports MIPI CSI-2 output with 1, 2, or 4 data lanes=
,
> > +  and raw Bayer (8/10-bit) or monochrome output.
> > +
> > +properties:
> > +  compatible:
> > +    const: onnn,ar0234cs
>
> Should we define separate compatible strings for the mono and colour
> variants ? I know you identify the variant at runtime in the driver, but
> avoid I2C communication at boot time can be beneficial (to reduce boot
> time, and also to avoid flashing the privacy LED on systems that have
> one, albeit the latter is probably less applicable to the AR0234).

We could do it like this =E2=80=94 Color: ar0234cssc, Mono: ar0234cssm.
But the current approach is more universal...
Could we add two compatible strings and keep the base one for auto-detectio=
n?
For detection, it would still be good to check the identifier anyway...
Or just add two compatible strings but detect connected variant in any case=
?

Thanks!

