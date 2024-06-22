Return-Path: <linux-media+bounces-13972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56E9134DC
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 17:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE0291C20CED
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 15:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB36716FF30;
	Sat, 22 Jun 2024 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bu/NKNPU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED802747B;
	Sat, 22 Jun 2024 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719070302; cv=none; b=BUt0SKzDYSady3ECdk0iT1/xLmwNMy+SL+tizaxHz7HU0l0KFYhzlWEemU/LrT0dT+Uhs9Z5cQ4IRX68pHhikKFyLVYmYaB5xKsZyG2CNbFjl0GpCxUTEsjkx8R1qreY/5HstIKijaulmMXlA+5ufFJXp6uuyBmSriwoD4Hb5dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719070302; c=relaxed/simple;
	bh=78+jfZw8Qm/6Xkeu+Ov7luz84SP/0mDRIMogWWXParY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oi6zQ3AgNvj9pyT+MqutiRgzldyJm9DNa3QBlD330FDdj5aBqlaeCkgxFDE778draEywU6tEN0r17omtxqwdaGIwOE572SNRcK5qK+WsTxa60U700xvREb26ussNxTgNeWc8Wc/Fxi3YgZYY0jzC0KY9MOLgt4ZgKOBVUay1ls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bu/NKNPU; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cdd893e5cso678863e87.1;
        Sat, 22 Jun 2024 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719070299; x=1719675099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irIlX9pzCj+LqP6WlQKohFop2vkwEj5DnCvCBTLwHqY=;
        b=bu/NKNPUJWsIt6dZQkB1jvTKfpA7FosiPqZgbiu5xAUANKQfc7iQSDGQATF8dEe7T2
         jT06yCJQeOEH9G7jPgGxoyl+4nPRVsNcKcf4r6QL/V0Dwo86MNd3JbX1UsD3BWpOrxhI
         Ms5/V5SFXW2xLtw12C0fVm3troRgAaUbV0cEaBZ+EmqXLdDmJMQecXbcggvoFvLpyvaX
         6zkCocPQoJNusbo3MX43NOHGCYeVsbIWsvajgbbmQTICpLlephQtyuE3dd1a6pau9vr+
         +pje6c6nfE9khrBUSwa6yCs7D2IVNnOcWOUJBJKIlWQqZvpwREj8BwxH4raoRzVG+cxa
         fmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719070299; x=1719675099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irIlX9pzCj+LqP6WlQKohFop2vkwEj5DnCvCBTLwHqY=;
        b=rzcC5hEKtySqT8NcN20q3cAi3eUojJlGNuVJAJZtejujujcOQKYlS4TKB73UHDKaNw
         idJ89oiN3DwSr0LD7LPYqco8rOFJGCp/65Xb4EBMZqjj+8VFF4vO9SOKwARnKlg2p2C4
         zYBhRG8+DB9c6ei5th/+v8c4X4+lVXt62VDNZx4q4kUjGrqnkXPHjWoGQj9iAnAIIQoe
         Eqt94GJxE1+XIRx36PmmndOOvBADB6BvUiwzcoHhcF5cFaUE3+jUChub6EzxMVvEbval
         K4Jx555ylpyKC87j4M7xAhNN/5FW6AUZVU8eX5S/y71xHUj2gk3gC24IA6/GAXVixpf5
         Cl2A==
X-Forwarded-Encrypted: i=1; AJvYcCU1/Tqzr68BXrqkytxP4lUioNvw/fXaM8dLi4YfE5yrGfXbYDp8wJt5jXOmXJP0ijhAFw6C3US93q4rIKyleSJJVhQmSCAveMzHSERRNtX5WkijuFoTVZeLc/CMGpmmt5zFBRPK0OIlao2+4fAoHXK+xWK/3eDhVzWw/8kPod2yWZp8O7+NViyIq41DpskH+7fLQpOu1HxIwDYfEpgofMmcN+4mog==
X-Gm-Message-State: AOJu0YzQFCPbDcZvDAHabM7C/iXbjHSDfoOLj6Xy6Z138KOBJIqDeqPR
	enzxHktT4OANsflVrNvkBv9FNxBCkemzpRAd4DZ1LOgXRjixcFevO1ACKrMZ9rlQqLnURBq6u9Y
	26p5FVzUg3DwS4VB540yHwC0UCDk=
X-Google-Smtp-Source: AGHT+IH9OMuvq0TduIf9JcWWgQCin8/zSCjEZkGNUTz+C/w37Evif+RLTN1PK2CiYo9WYEcZHFvzujWI0UoWaibUu1E=
X-Received: by 2002:a05:6512:515:b0:52c:deb9:b974 with SMTP id
 2adb3069b0e04-52ce1863223mr67757e87.69.1719070298714; Sat, 22 Jun 2024
 08:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com> <fcdb072d-6099-4423-b4b5-21e9052b82cc@linaro.org>
In-Reply-To: <fcdb072d-6099-4423-b4b5-21e9052b82cc@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Sat, 22 Jun 2024 23:31:25 +0800
Message-ID: <CADgMGSvbK+8_QvtXSYrxdGjJFFzgtLPFtetMecBME_pCdoWzsA@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7180-camss binding
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

On Fri, Jun 21, 2024 at 7:24=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 21/06/2024 10:40, George Chan via B4 Relay wrote:
> > +  power-domains:
> > +    items:
> > +      - description: IFE0 GDSC - Image Front End, Global Distributed S=
witch Controller.
> > +      - description: IFE1 GDSC - Image Front End, Global Distributed S=
witch Controller.
> > +      - description: Titan GDSC - Titan ISP Block, Global Distributed =
Switch Controller.
>
> Please name these power-domains and require them in your yaml,
> remembering to add them into the DTS.

I can borrow the idea from sdm845-venus-v2

@@ -191,6 +190,7 @@ required:
   - interrupts
   - iommus
   - power-domains
+  - power-domain-names
   - reg
...
+        power-domain-names =3D "ife0",
+                             "ife1",
+                             "top";

I can confirm sc7180 will be the first one to have
"power-domain-names" property on camss node amongst SOCs.
>
> ---
> bod

