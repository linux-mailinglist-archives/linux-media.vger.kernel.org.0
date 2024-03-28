Return-Path: <linux-media+bounces-8102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB98901B3
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 15:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0561C21673
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 14:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E0B81737;
	Thu, 28 Mar 2024 14:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOA8THAH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BEB7F481
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711636001; cv=none; b=Ld59ejjZzrTh1p6KUWBSY+Jwn7CZnul8Hy5u1gTBkQ3GYnoupLKdXPzPXIPywNcF1FTaj6FO1mMnplqLq8aQX6jg6e9Kls9U+2hfNg4g2iTKa5mb9aREdO4s7ZsTCdTl3TIU/AawUBn6/SHyGH7qEWn24E72k94f+WuRf/ZFqGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711636001; c=relaxed/simple;
	bh=aUaeGXBlVve+SgsWl8THiQ47pF6fQMipESWvHeT5QW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYgi7UeRQYYQW4FlUDoTHyh/emktLnJiWQgrITk+Zd/2ztyeqoBd+OGKykAO9TG9gbSLuOEdIB1c5tgBroTmYzcOuJPZ18ehx0iUYarSXi1EGvTZdkcu/jlY/8L1PdyqGGpBzkelTWqW26174b9P4URSTRDSysLuDPKvd7JE9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOA8THAH; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ea895eaaadso192892b3a.1
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711635999; x=1712240799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXRM7Q629i4Qice9e66tF5KEz9WaudBVobjE9h6tDcA=;
        b=SOA8THAHlaIokKtAh3iJuP/U7QdN2XNPGvZIk8zdBQcnDtz8N3gv5ToU60dOi8hO1q
         0uucGcbBaaMx/vEzZxRCCnD9LwOFE1tVsYafDkSae9VhQ8h4qTlTJFSEBmJcU453G/ND
         MDbQKBoAn8UjAJRmNSBMCGnjFZGTgmo7KFBp3NH23Iu5Q8FgSp88m+R7gdN4MzyOYDZO
         e2nt2h836xmOE/Hjt7FxokoZpaGTKj52FtwWZV0zxHsS9QGnVmYViaSaHrSFPPKidE4P
         Sa9fG59b/S5wBPBXHv4OL0qp4mY550jYA5e68hB82+ZrkEBMCJI/PEVBwR05vXLmlH/S
         KOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711635999; x=1712240799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXRM7Q629i4Qice9e66tF5KEz9WaudBVobjE9h6tDcA=;
        b=T33ggyAr26WqvxMxBy3CWReYa/9EQ/jnzI4ynbOxwxlXA+GHLPas1TTYxXgUF6ikbT
         mJdg9bxJWoPQcLionkBWA27WM4Zv9y6SErrlultOqt96GNObGNWsPbwQFTC9Pq3GSAPe
         HxkaykY7fKLejVKM3u7xO6XUSStB7/bDjk4tXJ1oNLQewPGP/J0yOEzgWKPOlMGOz3T2
         f+kRWwlJfX4vsRgissQhqyizc1ap04ww7aj60A2jK/s0fMYw+b1mffUjNky5GpM8aCwA
         JRlX99g5Gnq4RYOGJyQbSbGl1EtiXIqCJk392VbUAlaJQG+YwciTlYd/bF/r1eZEgDFA
         lk6g==
X-Forwarded-Encrypted: i=1; AJvYcCWBOntPXMf8Bjtk9NSAUNak3WDKfnB2zXeNxxzK+GGYJlZMC92TO9XDNs/9Amywi8Xxj21OCsaPIaOMIe8jw6zhiD7trbE2Nu/CPlQ=
X-Gm-Message-State: AOJu0YzDh5pU03bPc2KfVWoXqKkW7uZUCKAL6iswOtGe1y0W4PkHPHEF
	jrVWsOn6VP55fQfaiMnqFuN4YwB0RZkrrCOA+FqJyFCfTeAoHn9BrmQzRXKwnYXkeLR0BbmIa9s
	mTLiL90OamLQ57+NEGLBlozVn6Kg=
X-Google-Smtp-Source: AGHT+IGnQ98HJChv/y+Tr9GzUviQtc6/ofoI3aWA9dgNImxeV8CVHr9vjcYtTVSUx21ox5tr/gzMAmt7unGRR8IYBEU=
X-Received: by 2002:a05:6a21:789b:b0:1a3:c3e6:aef3 with SMTP id
 bf27-20020a056a21789b00b001a3c3e6aef3mr3182353pzc.2.1711635999199; Thu, 28
 Mar 2024 07:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328051320.2428125-1-festevam@gmail.com> <20240328051320.2428125-2-festevam@gmail.com>
 <dbba19b3-0ca2-47a3-ac6c-58872da87f66@redhat.com>
In-Reply-To: <dbba19b3-0ca2-47a3-ac6c-58872da87f66@redhat.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 28 Mar 2024 11:26:27 -0300
Message-ID: <CAOMZO5AxGR4AzLueCB65US03nUDRvb_gS6S625WimmHdb+sZGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: ov2680: Report success on link-frequency match
To: Hans de Goede <hdegoede@redhat.com>
Cc: sakari.ailus@linux.intel.com, rmfrfs@gmail.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Fabio Estevam <festevam@denx.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

[Adding DT folks]

On Thu, Mar 28, 2024 at 8:27=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:

> I think that what is necessary for your case with fixed dts file is:
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index bcd031882a37..5c789b5a4bfb 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1179,6 +1179,8 @@ static int ov2680_parse_dt(struct ov2680_dev *senso=
r)
>                 goto out_free_bus_cfg;
>         }
>
> +       ret =3D 0;
> +
>  out_free_bus_cfg:
>         v4l2_fwnode_endpoint_free(&bus_cfg);
>         return ret;
>
> and that then replaces both your patches, can you give this a try ?

This works fine if I pass link-frequencies in the dts, thanks.

--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -210,6 +210,7 @@ ov2680_to_mipi: endpoint {
                                remote-endpoint =3D <&mipi_from_sensor>;
                                clock-lanes =3D <0>;
                                data-lanes =3D <1>;
+                               link-frequencies =3D /bits/ 64 <340000000>;
                        };
                };
        };

Can we allow the probe to succeed even if 'link frequencies' is absent?

That was my goal on patch 1/2: to keep existing dtb's functional.

Otherwise, the old dtb's without 'link-frequencies' will be broken and I'm =
not
sure if the DT folks will accept a patch passing link-frequencies to
imx7s-warp.dts
as a fix to be backported to 6.6.

ovti,ov2680.yaml will also need to be changed to include 'link-frequencies'=
 as
a required property.

Thoughts?

