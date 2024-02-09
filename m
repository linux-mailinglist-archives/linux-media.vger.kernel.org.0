Return-Path: <linux-media+bounces-4883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 094DB84F8EF
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB901C213FF
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 15:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94CB76030;
	Fri,  9 Feb 2024 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="LMWEN+Mf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05E574E10
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707494078; cv=none; b=OZ7jHhSt+NXTRQZqbnlT75HojixHDztafJFiJYB0dY7HZnBTTvjGjX2p8AoSDvoHcMINsCto6iK+5+yJ+Fm7O6ecaO+5jV62pqcv8wRp+Q8V5KkbAkh/ZTdzNfyk5KpxTvjtKMVBHPRXXMxTnI+opLJEMlfWSt1K8gPurlggOD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707494078; c=relaxed/simple;
	bh=+KflXFFj7Otg5Y99/Xvwuc5SQnnGmoFmmaIQAR3N0Y4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k1q1HC2aknkLZAVPS7TnMs7I1B94O0k8Xevw6iaZC2RzClQmDbwC54ZMGShl3lpFnW3kKPzLxPLsctOs5MQuymnkrBY9s2sr9Moy8jR1v5Jh8oWt2H1dxze/9A9cABwH9cPDDzGLe0QEbBVVc5TMq+4Vak1Qp4HdVx0YQn4a8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=LMWEN+Mf; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4676a37e2c4so339968137.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 07:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1707494075; x=1708098875; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c5/9zed5qdZF9BZgoIk9c7OGOPG8WjEF92lk6+Pb8BQ=;
        b=LMWEN+Mfvz2NUIdbAE4RUzO+OXzGAj0QVm7fIHyludVvMH4Ck3L4MC8+Of1AQJXRhn
         Auvx7YSFpc3okrpuqca228iJgZJnCYCL8hveqs4nXXRuxDRimCxPxfg+C43GLiEwTHj6
         QCWJdXm9F/pDThnHotwZWawmGb0a99G5msKc0IWKU0ilFQbBHYNqHy+XbXrsNtQX/ZsH
         GObakXPBIwz+mU/nF2L8aIRfG7rTpAtFBjjg8q3DkIhz2Vkxa0GUwrlO/K0bIXJnm6I0
         zh21hI+qlra+NsJVzlIDq7+B4RLSRC5n154d+ncks+TPUXnMLrUXqqoDyJD9ntJFyN4o
         zUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707494075; x=1708098875;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5/9zed5qdZF9BZgoIk9c7OGOPG8WjEF92lk6+Pb8BQ=;
        b=vw1hb45A8wmd+wyjzT4N+mZ2CjZAK2EQyQ70QhctoMRTq81akF6XguwjGIA2I5eub5
         CtVcoBk41aV8BKPR5DEmWRKCJLM8Bz6f9heXcLZMae44b18cD0G2/uyl5bF9J6KuW58h
         d6Gv4WnNujo11n129QS/y2Ap62I+7szr0B1vLaALqYDPsZDhdVaGwY2H03zoi7sQ7jqQ
         CNKIYSSvSY33UvXwMjA41e6khfVlUKxh44uT+6LeRaPPoOcF+wvb19KXl9bG03ATKWTE
         /24D+oYk+JuGK27FIvBWiR9rd1KoO1xbsI9Sc4Mfvak+YTF4/7bLavVi6JnVNGuuz68U
         iN2A==
X-Forwarded-Encrypted: i=1; AJvYcCVOSvbh4xaAlWAJdjZdW42CoIORWmu3a8yi1VoWsAPQk9mXJjFliEkXMg1SH8Tv2Koq2rAIKgkemMPnCqS/YM2/T6JvhMsyzTXAgpg=
X-Gm-Message-State: AOJu0YyJLdb420qYXYGbOsL5f6SOJ/oqE8OiRVK0SOq3KhfEuJBjUkX0
	F64+xPfxJaB9sSK1g7IGYaO7Kue3TY++A0fNOpix7fqphW4qLYh8fau3D9EtP8DaA3IJ/mDd6YM
	H
X-Google-Smtp-Source: AGHT+IHWJupK08ZRddOWgoAiLUXB9PpEs01nSOPSIFhXjkh8UoHwI67Y75JPJMCEnGeA5BETBCnhcw==
X-Received: by 2002:a05:6102:1629:b0:46d:2d1f:dab2 with SMTP id cu41-20020a056102162900b0046d2d1fdab2mr2154497vsb.7.1707494075082;
        Fri, 09 Feb 2024 07:54:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5ohDR938ixZ2lNd9j3eRJq1MRPUymWvSzQC9Tx+pquVOIjR4i0jrJ7Z3nsedjtcZTRIZHgksqW+dyL6iBvp+ns+aNSN49CseqkN4=
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id od19-20020a0562142f1300b0068c89047955sm933820qvb.112.2024.02.09.07.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 07:54:34 -0800 (PST)
Message-ID: <e08b4e57a51db3f428af39ea396c3a4fd5275a75.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-ctrls-core.c: check min/max for menu
 controls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Dorcas Litunya <anonolitunya@gmail.com>
Date: Fri, 09 Feb 2024 10:54:33 -0500
In-Reply-To: <6af38faa-a10c-40e2-873b-c4288a68c5aa@xs4all.nl>
References: <6af38faa-a10c-40e2-873b-c4288a68c5aa@xs4all.nl>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 02 f=C3=A9vrier 2024 =C3=A0 11:38 +0100, Hans Verkuil a =C3=A9c=
rit=C2=A0:
> Menu controls require that the min-max range is inside 0-63.
>=20
> Negative values obviously make no sense for menu controls, and the maximu=
m
> value is currently limited by the number of bits of the menu_skip_mask va=
lue.
>=20
> If we ever need to add support for larger menus, then more work is needed=
.
>=20
> For now just check that everything is within range.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index a662fb60f73f..89d1e3e78563 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1504,7 +1504,8 @@ int check_range(enum v4l2_ctrl_type type,
>  		return 0;
>  	case V4L2_CTRL_TYPE_MENU:
>  	case V4L2_CTRL_TYPE_INTEGER_MENU:
> -		if (min > max || def < min || def > max)
> +		if (min > max || def < min || def > max ||
> +		    min < 0 || max >=3D BITS_PER_LONG_LONG)
>  			return -ERANGE;
>  		/* Note: step =3D=3D menu_skip_mask for menu controls.
>  		   So here we check if the default value is masked out. */
>=20


