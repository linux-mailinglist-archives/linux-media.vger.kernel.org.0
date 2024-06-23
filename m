Return-Path: <linux-media+bounces-14006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F052913F3E
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B6B42819E8
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025A618628E;
	Sun, 23 Jun 2024 23:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALpDcG7+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAE6441D;
	Sun, 23 Jun 2024 23:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719185280; cv=none; b=aGCT5HmfbrEx702O9BOanE4tKE3B8XLmNTF6EblvCszEVNvMrfXxfKZtB4yXSpFCxqZj4lIwmRjKlPUYrTI6owJ/YtTZUmsCft4jhgX5ZVf7qZdGAaUIXgackMzCZMZ3A/UbkiyIxxTps4MJRZYU1zuY1iqCoLYtIQXS7ecIjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719185280; c=relaxed/simple;
	bh=eWWq3t3HfbKaxtJ0zQ/fI0UjnlssE/dRNNLLP6Lszs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/0DfZEgThl7my3zGQTi++heBZnU1AP6ckZokelyTQwc6752xlhX+s8jp850s8HXSChuSzbo40xaR55c0Y6QI1yxwi7TUS2Rig7Yfzla5f/J0N1tpAy1IbXh2tHa6ElAzwkTRZt1PISZ0sNH2U+2q7pRgZVGjEJq4ClkztP/Q00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALpDcG7+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso1224291e87.1;
        Sun, 23 Jun 2024 16:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719185277; x=1719790077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWWq3t3HfbKaxtJ0zQ/fI0UjnlssE/dRNNLLP6Lszs8=;
        b=ALpDcG7+mkEV0e/acnyNLwdXnu0plJfCy8+cxFFMVr2ZjYDWg5l77V/5j/OnwN/N+/
         FJ1oc3bnHlbqlYwqfUk9VkGcTdT1PnijuqRATqH7HowJHhqReJhTGxpeGIAAKVuSqfjz
         pPmhSA+s4uJmBCnSh490rQDkqhQzpyax/o1s72zOtiy6dRKmjYpGbMkTRUf3LXICtBWZ
         qYYb/9+qDs7Qli7CySrI2DrenU8WlbyQ0IvIsZxCSXEVaE1g9FQ2BwoXewNFRzKLDafd
         zDn4N2zf7OVhV0pFA/4pQCvmrNTTxK1xODwvY3SM8sR7nk3J9epX6d5dNk52t6d358ck
         qVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719185277; x=1719790077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWWq3t3HfbKaxtJ0zQ/fI0UjnlssE/dRNNLLP6Lszs8=;
        b=Z4tTgV2Fe/WPOhgMylgiTGySKSXS9FARMQ77dfTBpP2+8wBpuSEg734st3/q2I8jiQ
         J34ELZwH/BiOOc8m1jAbxgiewkwHbrm/RGpaqvq0ROcrvXQy4Zkszm7mCy42R5rncV3y
         5003gNCGICS8xbSWE8Jh5VHc5QyPfItk18oYAuOWXmD5SAn2qzjz5OaT6CVTPf+QpTLX
         a97f4VjntrMnSBQbCudKwmdkq0zy7sxeKRzRxwl0SASflByV//GjeLkO+h8cGKS0ZaaY
         JJOn8f2cZdKGw8eoZH3YhuZN1sq6KczCB9CoZpNpdPOHmGpmJ4gDxX5tf6iAkFLn2wh/
         LYbw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Icjoy7R1TfgCYR99Iy0HDF/8YyvqNvqfyHHGHp4FOMQlkurezLFsfweehC2TASIlyKLczYcg/lQq+ypVJmWV2MqoHMfPATk44ZRCMBePSPvJ7HiRlEdek6VSR8Lq3PZarmeofmLyyD12eU6pvTsiL71ZrBhPOb3OxLnDxtKdYN3sYnr4Mh/dz4NfXEF8SqEqOU5jk1lrig3JuZiIzBTlxVuhNg==
X-Gm-Message-State: AOJu0YwRmXnMF9X0V2i/U9WZXnMdyxW07I4KX4jcQHmDag4qCtdX3cqe
	TmPWWMk3ez9dDnPMs++eHb7JrZpWVIfQJULqTWyh2c5YKIVLLTBgsfMY2O/GMaqmfRxgTWcAPFT
	mYqbkl9tIfBCt67iPJxGDCMfmQa+Jrw==
X-Google-Smtp-Source: AGHT+IHmk0cNmgfbsDw55NsnwCavsqqs+T3FNO9NZ88yr7hhF0OUdZbcKFzMr24a1mqeF2WlQwQYDDX7Xq0EF22Zvvc=
X-Received: by 2002:a05:6512:39c6:b0:52b:c0b1:ab9e with SMTP id
 2adb3069b0e04-52ce063d750mr2702595e87.5.1719185276757; Sun, 23 Jun 2024
 16:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-5-14937929f30e@gmail.com> <3660e37e-2716-4d9f-a9cf-b69568d4e77c@linaro.org>
 <CADgMGSva0_DjYX0QVFL+i3YXmrPAuVa4gQVa-DNHCwg-UA3VNw@mail.gmail.com> <51e95bad-1caa-4dd4-b319-7bde11a13f58@linaro.org>
In-Reply-To: <51e95bad-1caa-4dd4-b319-7bde11a13f58@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Mon, 24 Jun 2024 07:27:44 +0800
Message-ID: <CADgMGSvp8EmdmQf1pNOEsYwZHA7Ve+uSrUS-sRJKRGKamWYwgw@mail.gmail.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: Add sc7180 resources
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 6:14=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> Yes but what we are saying here is you should have two patches. One
> patch to add the resources and a separate patch to add extended error
> messaging.

Sure, v2 is available with split patches for sure.

