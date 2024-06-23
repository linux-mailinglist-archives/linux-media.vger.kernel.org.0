Return-Path: <linux-media+bounces-13992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111F913E9E
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C730C1F21160
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 21:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642C91850A5;
	Sun, 23 Jun 2024 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So6F7SV6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470832F24;
	Sun, 23 Jun 2024 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719179305; cv=none; b=PU/uWQWP9GQB6vmCWrF92g4x+1RDzUu70+9p0WKGS+dBf+jqxtutpjAvezBHNZs076+clqC5uFYaV0luIWUpcOztHN6Xe5tZuyX+UTBteb0XxUL4isCDw+jg07a73aBagV10hGId8pLXW3fraj6sBGnTiaEHixAa5///RMZtvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719179305; c=relaxed/simple;
	bh=FjeT/4uo+MFGapGGQFRzLPu+u5xPvDN2JhdqP0sRZeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKtr7rgqBKOGzFTw3ailzKKsV6SCdZC57mjyrDALpAghSVqbBlAbsYXHaMYgv1GW/kUi4YUWT5uOsuRBiRMq9qw4+1KgSUYg3WDkAffD9V3QxdKoKyKrmSUYNJxLdJvY9kefWQUOZFX6nexbJn2ghkJ+so8advKp4g6qj9k17tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=So6F7SV6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52caebc6137so3585936e87.0;
        Sun, 23 Jun 2024 14:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719179302; x=1719784102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjeT/4uo+MFGapGGQFRzLPu+u5xPvDN2JhdqP0sRZeo=;
        b=So6F7SV6LceXYeIT+K0RfvuwvboHUfYo99RzL+7AUqVue63H+9+Lj+hTwLqSiP76py
         /nOqImnk230/3zlQWQBHdxPD/60WlKQD2Vx+43GwgZXuJk0hfVIeJAo2KzSlyhIskfSw
         Z9G92SVTAPwqYf7Ck8nOptpNFeXW1Q4Il72WNx1j4JEbB+XZIr789f4F5VZ08OXQ0t/N
         MPn3012SW5rS/dPeNxlIC6fallRxc+c5r0h+dhy9cz+UgC1x45CF8PEAI2sappyoIsxR
         Q6EfUKJhVLBCqC9UMD9tOJyr6BqNvIowWVYYaWpWmeWTmnkCsv8qaPjL2dQwAG903LRE
         SS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719179302; x=1719784102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjeT/4uo+MFGapGGQFRzLPu+u5xPvDN2JhdqP0sRZeo=;
        b=JjOKyqJfBfQSQb8GMBpF+0th60a8CZM++aFnhyjnqN4847qz1pzMQ8VfVbppyQavEm
         wQJMoYLbH+7UFLl9Lkj9uHn2d79VhLADGNZ8AKbadxvN98hh2IzROvpdq1150Ogm6lmu
         pL2zFb23x85GjkGLlWWwlDrnGI8SJJGqFBeVKVlLF15lCG0bGQgSYyspkNoeGvGpLhIa
         qBZqqcx2uxNREpxKZ7tpi2QJaoUSKqxDUIOQPOxNs9QDTsWC5BmT1a1zje0V+DMhumeg
         xFQltMQpX4xr2LUnA4BLkm+h+rYCJRVrnKjXPvhR+/yyZHlY9bcQSXcTX1psKYQXrGSw
         PODg==
X-Forwarded-Encrypted: i=1; AJvYcCWEIkUOUC4uyRlC+tVLuysKXunPdgZ2CJ4auOzddzgebO9SKfA6TmlJo2oR4Pgjucc36iR0LuQC/sF4KrYriFWXmUVIcGCB0sCEv7n+zPSdMJExccXClNY7VmCWbDMv5yqQnC3w42XZbrF0VbWlmPN7MG91lkX05Hl4dVpDsH1k1YKwUlC9FYYglqhyOvPpJF+OrFRgKqd5y8HAy+ObRHRmPiY9Zg==
X-Gm-Message-State: AOJu0YxgS7of45obINR282vXe99brdOIw9+NkcAoMyzdluoccuOc8PAl
	0cerDBztUv7O3eU6ga+laJpRP1tEyBGCi75t7rmNFoin1TJKBzsd/fKVENC1/mW4jRFv7/RzIa+
	DnXz+8TZ3E8DvlJknhB+ek10lqOcibQ==
X-Google-Smtp-Source: AGHT+IG2v51vvIgUNNJTJF1KPdnhSoN3nj5BJljBDTkt7B2Mh0IPSTaWFfVbtbghb5v+6nWKIQzNpI9gh8nC2rO/vvE=
X-Received: by 2002:a05:6512:401a:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-52ce1832541mr2141404e87.3.1719179302284; Sun, 23 Jun 2024
 14:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-5-14937929f30e@gmail.com> <3660e37e-2716-4d9f-a9cf-b69568d4e77c@linaro.org>
In-Reply-To: <3660e37e-2716-4d9f-a9cf-b69568d4e77c@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Mon, 24 Jun 2024 05:48:11 +0800
Message-ID: <CADgMGSva0_DjYX0QVFL+i3YXmrPAuVa4gQVa-DNHCwg-UA3VNw@mail.gmail.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: Add sc7180 resources
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 7:18=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> although I wasn't able to find
> the matching clock rates
The clk rate is in the camcc clk driver, isn't it? ;-)

