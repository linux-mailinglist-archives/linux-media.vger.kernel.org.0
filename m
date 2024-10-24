Return-Path: <linux-media+bounces-20184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B69AE333
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 13:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 802EF1C22469
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC1A1C879E;
	Thu, 24 Oct 2024 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWIKLxXi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83F017278D;
	Thu, 24 Oct 2024 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729767623; cv=none; b=dqcDEtnw+znfBKYD21euZcGYQZXQXk1y+510sIc6dPe8mkM7hBjisnkY3OaAv1PP+xHwMBbRpV6t7Xi0qDk5mOJSI0khD0R6zZmaYiCMsofiNWgb+8xCGxQFiiQpUndo8LjKvNe2hyS333HBQLV0bhKGe2eBs8+q/K2zlmjeAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729767623; c=relaxed/simple;
	bh=mFc9tj0AdbcvCZ9hGMOALSeE2VN0Id5w0yWCtY8sEP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0BO1k7FU6UpAddAh0MxrlIydxcEBjXMpnfKiopWSDI9jjplgZxahguMqK1XucYPfcHAkSXUoYzf7FqsON2M9pORMXOJPF9bBFnPqP91JFcd6er/XZJtk6A6VSkLvVrL6PRW/RpR4om+Yjn/rqjB0/cpqoWTvfsM/aMTXyJp6ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWIKLxXi; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so1105317e87.1;
        Thu, 24 Oct 2024 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729767620; x=1730372420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFc9tj0AdbcvCZ9hGMOALSeE2VN0Id5w0yWCtY8sEP0=;
        b=JWIKLxXiC/pcybSp9keu2e7FJmm64xB8ptmd0Ywyj4DhAPVU5Whl727DNQVXdb/wCr
         dEdxhGOFv5Ta1XKWzwuwMmq7Y6EhjK9lj494XrzdGK+ypCx9CA5jnVbM16KycQtjwoUu
         bnt1Wm9FtJhh9hKq937/ZwN7Q5lgeamNebtG23y7A8xzHTTE2Up9ar60dPwkEmrLTEfY
         bqrsRwRTCtqZ4YxXob+35xnL5ZFmYe2+wAvZWXM2cDwVPbdUZlXCg5DXjBq0a4NrT59Z
         OMjP2VbnlxnFgOgX83mlnvo9LFefl38rqXFzDwOzkt3HPV2U6ItAHlcjwoIafPDzKIOg
         5dVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729767620; x=1730372420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFc9tj0AdbcvCZ9hGMOALSeE2VN0Id5w0yWCtY8sEP0=;
        b=nhsqiuBR18lYWPTwxMvb9MMNKTK96nJ41JFkM8nvTTcaVs4Cz3EY0If3RN04SNJ71m
         C12YEhPcBOO4duinyNwt3H0KZHWWSSVVOAcTMcBdg3nvh/cpTJdGYXA8WsgXh0xJ16G3
         +DTBp1a0Npx4zZp6Pes9gIgsYWsgsjOklJy7b47RQvk9No1RzOU1+kTfyLikI2KggCfN
         Z86UCffblKGQj5hkNlELGFcYIshgdBXxNXGdsCSE9bMqbtTxqnhK+gPbZpC4j7JfCm23
         jmAJKB1wamLF+GJpNRQ5SkHcZ6NqbfgahyGU69lvsVOasSX55INZEyPjvRJFfrC4Qw1T
         7BIg==
X-Forwarded-Encrypted: i=1; AJvYcCVqgOvcfOYuT5d2+GB8yEQjMR14Aw9PW1M9ctLAbJcp1E/lbNcOmkzqKNxjkObnZ/kLWPqywVKgkr7J@vger.kernel.org, AJvYcCXfAiSZTsh549KUQuZzYuoalx5cMiJrj5yPkR0FWXEQNuCf1r63dzxM737MyPhVfkNwLhKd2TZOCjbdK/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8nLJ5xUzyukkTXoBiAZALbE53fiQwSo89Ao0K/yqoqK9rjlhJ
	WwSqxOFPmsRFvG52rwtuAXZ+C1kOwxvyJRkdzxGvMmCmvKi7kQjoxwlXVNjFnJmoifZIMsDKdQ5
	xfDLJQ3YVBQi1k6n0R/r8S3ZhBqI=
X-Google-Smtp-Source: AGHT+IGWkE1pe0oLSYDJWS2zXqP8+hBUfDUf8ZYKKOYozF4a2KG2zriqtwVIIi7sY3pGg5fedlHT20ZHJPOCGO/2+RM=
X-Received: by 2002:a05:6512:3d0e:b0:536:7a79:b4df with SMTP id
 2adb3069b0e04-53b2371753fmr598477e87.14.1729767619349; Thu, 24 Oct 2024
 04:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023144206.1099622-1-festevam@gmail.com> <20241023144206.1099622-3-festevam@gmail.com>
 <5qukgvhiszyyqoetl7go47qen27uwnq5mhgwz4lejdgyhyupkb@i2dre4tovzqh>
In-Reply-To: <5qukgvhiszyyqoetl7go47qen27uwnq5mhgwz4lejdgyhyupkb@i2dre4tovzqh>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 24 Oct 2024 08:00:07 -0300
Message-ID: <CAOMZO5CqOwZ=h61x+iUnvPtrcwvvdJeU9aCOuW1_vZs1w40+ag@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hverkuil-cisco@xs4all.nl, lars@metafoo.de, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Oct 24, 2024 at 4:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> This will affect other users of this DTS, which we try to avoid. Some
> sort of analysis if this is used in BSD would be useful.

Thanks for the suggestion.

I checked the BSD source code and there is no adv7180 driver available.

