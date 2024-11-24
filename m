Return-Path: <linux-media+bounces-21912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF529D7832
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 22:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26E50162BFA
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 21:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0C9166307;
	Sun, 24 Nov 2024 21:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7TliI9Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5E163;
	Sun, 24 Nov 2024 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732482636; cv=none; b=RaxgV0FjOFuxRSGaH/m9W91DELwXtY1ILex7kqwvd5AcB5xqynmwCh+y3izOxp9vM49pNm4tuJc04V/Im/HIjlxoJQiuF4tDCLeypEgR2SXUCFPJtg5HkGuHGlrdMhv4q5Ht3hdfgRfX/fOURhq9mWg1moO27wo/4EhXOWAqBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732482636; c=relaxed/simple;
	bh=mFDf1CSpN7D4WMQlO4FpcyVXIJcDBPie8o23ouZqasw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omK/cZ84G80VY5kLX1kpQcfulvqZWS+0HVbYS61pyjlVoPFXEuEjCeqosbbd8/PCncZAP3V1+tiGdlkbAa9JrVpmSgXmvVNy2Is01vSOSTE9PKAqcjeCaSYXfM45aZVOMjOQekBqD1zn/nlmOuGwv+kKRsIvhET35Wg0PvJztvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7TliI9Q; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4668f208f10so4735001cf.3;
        Sun, 24 Nov 2024 13:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732482633; x=1733087433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W07l0zNFrs+EFQwQdJy7SMIOa1ecWzPkN3V9gFJWiHk=;
        b=E7TliI9QuV5kmi0gh6A2IfRj4cN+lIbYdHcQih/+pKJrAdU1K8rtSHmomK8rRgQlzN
         qJxzWyGA/AxKQDHtEHyDA85wqXtGbCm0Z2RSMjhwDq4rH995iglOToiCmT9ApkcG1zOh
         mtW0ZatVtnv32EJYei0F2k9+M5Ywr8HLdN0qEupzbR0gVvDIDsfmreFW1Cmd4ILCvOt+
         Wc1/4ke7FY92pgE4XIUGmISlmo5W7+Yi83lMfsaBwJHNF2lDMkEC9wMx5IlNP4KioJMC
         v4yaFwzartj/XDWu2gefzs+63Wlp2PZWWEzSjfwsjntSChZ0XJvwEO1Af5B/+5Cbo7XU
         kxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732482633; x=1733087433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W07l0zNFrs+EFQwQdJy7SMIOa1ecWzPkN3V9gFJWiHk=;
        b=Tub2DF3zkg23x5DLbTB7QsoNy0fSJ0iXD7+mLnQnrq4O3NA+cJoLcmRl1VK+PdMZ+z
         z92kvQ3+gXvykzgZIOigOhcEOEXp6zsk6DxTnlfR/Gq5Z/heU5EseV31rgh2n3CCYMMd
         gLLDuB4bgOkgIpZCeh+N3FXihcpWafBE1jTSRRNszgBz8DTknzp2QyP3VlIpPJHxBh4j
         3tqwJdfJZnql1lmlN2nlptaGib+PSvP0BK37a4m28rwNCAiHlhX+hqMllYb2ic3ZKJvm
         RnEI5fOPxd5nL1ioXpMfLtt6xib+o4ebJEjUoWbzsq04fpE36pa0PO1dvicaMc/I5xN8
         8Yww==
X-Forwarded-Encrypted: i=1; AJvYcCW2k9yAKsgSAjXShNKWPHjaf2gLrw14MZTvmy0lNc//NIM00Dp+GoaFDBdXrVUZf/nz0bUYFWGN1awA6Z6EBm1xLy8=@vger.kernel.org, AJvYcCW8bAhv/tq7EG/NC9PIePnvhaTL6XL50H6iy8LwlEIZJLOuPLJ/2d7MRXaiV57mztrvFXgldGN20OOvQVY=@vger.kernel.org, AJvYcCX8bsHuzukB0hBQmJYOj5loNhcpLXVbeONAwU4GIga7/pHobd96erMm4/J5KqR4JoCgjRje9bEI9+DvC5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qK4B++M5MIM2BDl1aG7o+0BbjCzGUC5ZTqHg7ksSuZZP7Jw5
	xNwYhfkI5uYxrehJ4ByHporzmnO/+ULP5r8WEIWXCEpmt3vrDo8i81jXHBEW6GGYHsWnVKOlLtL
	keMgRMKxgwrQ68QhrbKIcvR6idnw=
X-Gm-Gg: ASbGncto+uOGO2AGzvL0MHYM2pR6QQaziKW4dBW12L+I0FwCNRR9qiDfp8G8zhlAlHZ
	XVBp9kUQi/yIIog3m2BGVUk7bGXoVmyra
X-Google-Smtp-Source: AGHT+IFFGfCsnztfsLunwMxUWCnNQbocjlno2uE7RveujuTHAm4e0cTyGoyDHCbxuwKBXRaxOpeKeT6w++DlBbaz2BQ=
X-Received: by 2002:ac8:7f16:0:b0:466:9003:aaf0 with SMTP id
 d75a77b69052e-4669003adc7mr41252241cf.37.1732482633443; Sun, 24 Nov 2024
 13:10:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123212624.6237-1-jiashengjiangcool@gmail.com> <b3e2ed68-092f-4ccb-a945-19e19d5c8071@kernel.org>
In-Reply-To: <b3e2ed68-092f-4ccb-a945-19e19d5c8071@kernel.org>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Sun, 24 Nov 2024 16:10:22 -0500
Message-ID: <CANeGvZXjUUOhySGhMCXDp3yfTtuOKdXgMa7DTtZDpq1iXkkfhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camif-core: Add check for clk_enable()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sylvester.nawrocki@gmail.com, mchehab@kernel.org, dron0gus@gmail.com, 
	tomasz.figa@gmail.com, alim.akhtar@samsung.com, kyungmin.park@samsung.com, 
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sun, Nov 24, 2024 at 5:50=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/11/2024 22:26, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() to gurantee the success.
> >
> > Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC s=
eries camera interface")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
>
> Nothing improved...

Sorry for the confusion. This series consists of two patches.
Only "PATCH 1/2" has been modified, while "PATCH 2/2" remains unchanged.
As a result, there is no changelog for "PATCH 2/2".

-Jiasheng

