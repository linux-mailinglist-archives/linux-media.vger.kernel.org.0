Return-Path: <linux-media+bounces-8057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ECE88F5C6
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 04:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4526328EF9E
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438AE2D052;
	Thu, 28 Mar 2024 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGE6Y2DV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3DA17984
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 03:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711595762; cv=none; b=tU6pAcmwhHBn2N4fXGjsxc9XGy+HNw9a7RuL1AOPryCE+3bfeTaX9Wd9EUbnQhmIuiwwdMZMITpybfl85vYLLcAzmUwM9y+eOAeXJvPVDSLoeoiDurFOFYdDf6ARKUaFztaAM5I021sLObYCivbzSwXhVGSgWFoITO+A/E1GP2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711595762; c=relaxed/simple;
	bh=R1+fB1B46Wi1GN/dDXJzu5LqbJ1GJn89QykVQIJ6xWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQ6mXlx4m4YeVi4Fl5tMp64poYy/2hWuglHLmBzjbcF6QBHenl0zcFsuSK+NKVnBMtvGSCket1cetiyNkbOpsqs+MkRokSMVf6mcEVtCmftcCFRCJIFKwp1NTLoifQPUOldHL0241s2tuARGZ0LLZoJYabPoURDxkAgm7ho+8S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGE6Y2DV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1def81ee762so1200295ad.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 20:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711595761; x=1712200561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1+fB1B46Wi1GN/dDXJzu5LqbJ1GJn89QykVQIJ6xWY=;
        b=HGE6Y2DVJ8fzI2uSbpLB1aYDmoFp7RlgpTvgnK68rvO/B/FJJlFwpjbed74GjJ8UZX
         2m/sPfDz4pDbVp+gp7s1A1Cw0p4fCYxjImKnvc5KANDqcC0jr8Xyjkssp50UdhLIv0f+
         FMvuzF8MrFYPUSslYAZS2ZRLm0pjYx9FSgg180eC2exnjCSIFqnW6COIKT1M70C4FnqP
         G1LR34R3yTWodefAaSOU8MiLWcct5Jng7wPnjnWh5XQUwi9CibphG6jxnjvNRoyn4hmC
         4Ko1keA0wHpbjif7iRe3MgJGM8z1txaWF4z4sYRYJSnyGUOCqOdOYblOp3JjIoJLSX+S
         Nftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711595761; x=1712200561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1+fB1B46Wi1GN/dDXJzu5LqbJ1GJn89QykVQIJ6xWY=;
        b=H8KPSTW+c8dc0BCLMB2DxZLjjJ+REovFYKbS18rDOWcuHmwlSJKHQVRp8mIqTPOJvD
         VSnlntJejwAkaMA4ZlW0z9DGxuc9UwdnnVUNfZ4pqqwrOylSvCPUca1D5osa11qCdI7H
         KQxCXkkfgtsRlhaCnH2+X9rIwSE3poSlmzMZ0qZloX2zW7dvCvmchI01n02hGomLsZa9
         wIIgdJjX8iwXncHt/1Q4n/TPxao1927jpk8tvJTmcv5C+tb6050DFi6vQnyX4oph0rVm
         mNMzcjVV2kNgd0nbIQN9oahJTvxsKL1lF3jnhPSsrN214zd67fZIjTSrkV5XTgPh8WJ/
         S95w==
X-Forwarded-Encrypted: i=1; AJvYcCUaPb9KlObxAzSYmFX8lCxroj9xc/x2jKmMBvbJQKD/mn/Yl4RbajvIqeeJhYV+FQWYtNBJuKb7WVWvR1MqEceRTZC5xV/B8jeJntI=
X-Gm-Message-State: AOJu0Yx/hPFhQeaCG5HBKiHQ0Z1T67uf/D3ObvVeUSyGEpiLvcaVORkN
	OS02D0zVTVHuwCqLH6+Xf/CM2nX3Ibm0Rfp9RjkjJcKN1jStzP6ASYbBVVI/P5hTObADfeQd6sJ
	i+89CXe9LiYo0CeMU/8iuyAZHoiU=
X-Google-Smtp-Source: AGHT+IHtrjEg7Bf4znDE0RxqkV2l5n8gvhvM392LP5k0eV7ObhPuwyf1GGzVBqloUdoqmOzkwHziQE9gYmygA5ozWf0=
X-Received: by 2002:a17:90b:34ce:b0:29b:961c:2df0 with SMTP id
 kh14-20020a17090b34ce00b0029b961c2df0mr1505165pjb.3.1711595760690; Wed, 27
 Mar 2024 20:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5CGzjQPbYznKuLqVi3izMyqF9x7rV7Prmt=s2Z+A66P5g@mail.gmail.com>
In-Reply-To: <CAOMZO5CGzjQPbYznKuLqVi3izMyqF9x7rV7Prmt=s2Z+A66P5g@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 28 Mar 2024 00:15:48 -0300
Message-ID: <CAOMZO5Dmj4XuvMeQPZLqPnHw2j=L_42+kDMaS1d-wLd-KCgxzw@mail.gmail.com>
Subject: Re: ov2680: Fail to probe on imx7s-warp
To: Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 11:54=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Hi,
>
> Currently, the ov2680 fails to probe on a imx7s-warp board:
>
> ov2680 1-0036: error -EINVAL: supported link freq 330000000 not found
> ov2680 1-0036: probe with driver ov2680 failed with error -2
>
> Reverting 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
> property verification")
> makes it probe again:

I checked that bus_cfg.nr_of_link_frequencies =3D=3D 0 which causes the
dev_err_probe().

Is there anything that needs to be adapted in
arch/arm/boot/dts/nxp/imx/imx7s-warp.dts ?

Thanks

