Return-Path: <linux-media+bounces-14070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E18915147
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 17:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6488A285163
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 15:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22FA19B3E2;
	Mon, 24 Jun 2024 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOUgyQWA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4CF1DFD1;
	Mon, 24 Jun 2024 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241403; cv=none; b=AdMS9AOq2lMvz9EMjxw5UdKiaMViSaXwyOrzUFazBoV/hNDM//TGiyBB3yQ7EfORQrm5KgHD3G63nfXBPi85AL47DMuC/UZe8Qrc4LEHvXWpPpeBJm7TE/kH0dyGAIFM8rkCHzXXaxlgjdaE6D9wxr5xEQursNMGWtOVNmffKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241403; c=relaxed/simple;
	bh=B8JMyvMWFHz61nSn2gsE6oSBp9URmvYN5iI30R/r1T4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P738pdoyAx9YYlQ6o6jfgzxNfMXPBXixu1R/qckW5KBpaxdTTjZmEOqnU5Eji+GHvG51LoGSkqjROt1Zb0v1f4ttREI8EWFHaWYGEORuwN/9IljvbOmtJoXRJCFJxcFdRAoztqQm+nJICkA5b2zwTDKX3pL8p5zZaAbkYhZNxDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOUgyQWA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ce09b76e0so1444905e87.0;
        Mon, 24 Jun 2024 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719241400; x=1719846200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8JMyvMWFHz61nSn2gsE6oSBp9URmvYN5iI30R/r1T4=;
        b=ZOUgyQWAdJ7bcDjAztdI0ofJJvTnCukXoetsM/JNvnyPzRHxxaIYCD0tMcQMCQlyad
         YqOysd7Fz6P/OE5nZ6c1WNNJhXBDyJy11X7aQ2gfgYorrcGxV8wlyw4Ceblkx3Yfi9+X
         XRyf+i82XdqcMY1ChnZacHsqvUbWjjMsXy/Jl6ZHksu3ZP7jv6DRJ0puHWL8AjtFIFY6
         XPjzbr1U+9r08WJQJekhqQyQ4toCC7twKe2UQ7gmFaelSw7/gSmVcDgeLXMLHLFlOO0j
         s2PDGQff1V5/nTVNrWq2ZPmLVy5KzhM7oangDS8Odcy6ZEqWcnhwQ53s3p4XZxcx5NtU
         yiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719241400; x=1719846200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8JMyvMWFHz61nSn2gsE6oSBp9URmvYN5iI30R/r1T4=;
        b=Zu/pGwe9xOdpAWjEiCkccK1YCZCNEdH73rDM/v1biRfGQHBkQAKBrpQkV/0+AOMoso
         rq4Al5Q6Rv5G0URGjSzPa9PnsqWSramebaqBCon2xwbbVluGmDH/4ct3H0SIZtYCbOmb
         22HJRbnGA5d6EmnoaIIS2yt67+lzkXa4bjAdt6/ud93TKNrqI+JGaXD/s2fYGiFnUyV9
         4AX/Brxe1xMCrXRNxUgH1Pi0wprTbiPfVj6Qq1Mis4NF51n/KfFpzvhwOtiuO7YkVmp5
         3jweWJb2OArO93pKL9oMiF0h3116mudNjKsQe+cExLy20gQ7zgLuj1etve8BbiJe7OU6
         1LOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7F8Fi50RPP/YcAnDBEHkPi3d+48Ocz+dKSiON0hxVonK5KuA8mSUmniBQkp6fOf3SkfL9NakbBCyAsjx/690eVlGXxc8qwyBCtGFyqB4Gxjesw5fUqqbzqzf5AFeevBQGDMKN46mu37TIhzXEVzRGzBYpyPxU9NKzHrEOnaqRWK0fFfJekvmNgNi5UUNKLSDKeM2nSMW7BrCrE8IY4yumY6qAmQ==
X-Gm-Message-State: AOJu0YxNKpIFnverLt2FAWU450seVXz+nsrFBE1rfuigGJKbY83WKmjZ
	q3EjXowtzE3l+p0HfWSyCqTJuBR5f82+vR5YnbjaxAwHMs/L2sa3x9rEQaXc3h+bGUR9qvx5/H6
	FIXETBO8tXFUESs/1EMKesZRv1uU=
X-Google-Smtp-Source: AGHT+IGqfNPcAOIVjP63+QUUs0vjEMIhNqbBTC8yUZQsIbF7fBla7dK4hdC7TYVqp6tIqXdyqsHsFxxmquuTJDKpl4A=
X-Received: by 2002:a19:9118:0:b0:52c:81ba:aeba with SMTP id
 2adb3069b0e04-52cdf344b79mr1667460e87.14.1719241399821; Mon, 24 Jun 2024
 08:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com> <4d2f4a52-826e-44be-b242-55b50708692d@linaro.org>
In-Reply-To: <4d2f4a52-826e-44be-b242-55b50708692d@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Mon, 24 Jun 2024 23:03:07 +0800
Message-ID: <CADgMGSt2sRecrrYrG3t4RtgGn8QJzr1N+iRSWFKQVPgA6Pk8tw@mail.gmail.com>
Subject: Re: [PATCH RFT v3 0/5] Add sc7180 camss subsys support
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 9:50=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> > - Add RFT tag to all patches, since no tested-by at all.
>
> Have you not tested this updated series ?
>
> ---
> bod

Do you wanna add my tested-by too? It just feels weird to add my
tested-by that way.

Tested:
Linus tree 5f583a3162ffd9f7999af76b8ab634ce2dac9f90 +
20240522154659.510-1-quic_grosikop@quicinc.com with mine patches

Not test:
linux-next + 20240522154659.510-1-quic_grosikop@quicinc.com + mine

Just for reference, last month i pushed grosikop's patch with mine to below=
:
https://github.com/99degree/linux/tree/camss-working

