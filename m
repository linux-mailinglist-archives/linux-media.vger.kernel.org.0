Return-Path: <linux-media+bounces-13971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C89134CE
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 17:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B832284774
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1C916FF27;
	Sat, 22 Jun 2024 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLDq+EIK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242DB660;
	Sat, 22 Jun 2024 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719069900; cv=none; b=oLhY40GoO6QYdaOy8R1aOBFV1vfSikSniav09A2PZDviL2xC5Z1nsesk9CQ67/kwoVZv2zFcOZ2VLl6sX4hruNvG6QsIt/U2CDjqig2Ua7bYAQY3WcYAUnBIDNsZ9e8i3lopOgSsVPQIeS9ZPLsJPQprbRLEE4kvsG+JPYUAL5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719069900; c=relaxed/simple;
	bh=6caVNfHTLv+Bqjo8900FUooAVRuNhA6RULeILJX/6/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5f8sF5EUejaLHWuXlDgBe569gE0cO0Vj4OjDvAt733ibSyBfkL2IAdpnVjbMoJHKDEkxvGn50a/50MMwvwFVY0M/GXZOn+N3i6qwi9YKjtDqtK1KrHyaboPEKfKjo+0cjlVsT2aIayjikdvHyO6STpyPDuBs7oNUuTi9pr+pyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLDq+EIK; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so34510571fa.3;
        Sat, 22 Jun 2024 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719069897; x=1719674697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNJ3A3/ZoubiYa0vnJHTcpHavO0LE2V8lljWDxJfZl8=;
        b=SLDq+EIKGeVyQnxXfq24S8wsdILu3pLOLByBt2fUQxaYXpwL6rmv1T2ubSlQLHuxTN
         gNmLW4OLqRkv7A0PAOftpkyn1lj35YtghNHCzFy8NjquOtIFo1IUaxgVZAo4yRyzpwFw
         9YvgnFvEG1zpZXBbedwBuwxakdlSvGOMGH7igHf6z+ot8i6xVloRrRrnOww4y2utzWSW
         CJ2tH1Tgb5GVf3c3Wdx4E1MBu3Hydr9TTqzW9FEg0xHYBpDUf8su9SlK4nNOOXdKefe6
         41aspPETudkC/WdK7vMXGfKSOXsWJddVOcbdIlnlaNKsMlWQRV6CXkSVWbzkgGT7Fsoa
         4LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719069897; x=1719674697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNJ3A3/ZoubiYa0vnJHTcpHavO0LE2V8lljWDxJfZl8=;
        b=kt3V4L+LKBkGTY2rZiFNTmkiKHYKmVPmI4BuiB9Rmw6BgOMhIkrovxIgMOOIJJ2tWb
         UGoTY28FqPk9KTAP3wMv8baYUD4FDowmKlp5ApkwVCNd1uCjwhWIJvrTCu+HgJeVLsFy
         0VYKtDgfNzXvHaE1zi04nLkioU+Z+P+tKTs0diwT1cTv2LSolSnA91w8Vlrcv/0CNKg7
         xpBs1LM4UeCghWeSzE/uaqoOetOh/Yg+NwCD9g7OLwSN/BVudnz0OXU6XTFInUg8tYe0
         AOB+/g5IBU416FKIS9CGYIQ5jhPQNjHOVrUOAFq15ClU7melz1yh1HFGP+6LXils/2Ku
         /aIA==
X-Forwarded-Encrypted: i=1; AJvYcCXS6CSJfWLNfXz+WCZSY0Q6Yvmk1WUQMhb7hIR0iLcQXAdYG7WL8xCiGHGieRL2ixRS7+V1j5jIOkuYkpeYwinunHHwSICSXm2+OHgpdZfOPJkq7d2BVVGhr51B0it/4I7uqirvgpkepQD/caVcYu7I9kYxxXZndOftZuqzasT11+SlqJpOmmF2UXcbg9LQvBWNNg0rZtwsCO1hIfLwrDnrAmfuww==
X-Gm-Message-State: AOJu0YwfCxJcNH16I3wOIrJOGRPsXCJgaUuSG5iDietqASvkH/KvyAH/
	fAEJzOQyL6LNVTIplGSZv6ry+wrD/sTVqeTZeY2Bt+eMrnuoMihRPkh0PCunOAi4dBsIPIxpVj+
	D06fj1xIqr86EvsbKJSpDxvGD1Uo=
X-Google-Smtp-Source: AGHT+IGBNs9qsdlFtAbkBUFgGsGr7NinG7KxjziUKHsUT5TWrmBFJLJFgJwjuQ/oH+YQlL8u4VsuXQjAQhxA5QH6Umc=
X-Received: by 2002:a2e:7207:0:b0:2eb:f7a4:7289 with SMTP id
 38308e7fff4ca-2ec579ffb0fmr7211981fa.51.1719069896867; Sat, 22 Jun 2024
 08:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com> <c3e2e7a1-e424-4808-a690-a457e0526f3f@kernel.org>
In-Reply-To: <c3e2e7a1-e424-4808-a690-a457e0526f3f@kernel.org>
From: george chan <gchan9527@gmail.com>
Date: Sat, 22 Jun 2024 23:24:43 +0800
Message-ID: <CADgMGSv8fTO8Cft90MHria1fa=WKU70p5OrAts=bH6iUY=NgsA@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7180-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 6:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/06/2024 11:40, George Chan via B4 Relay wrote:
> > From: George Chan <gchan9527@gmail.com>
> >
> > Add bindings for qcom,sc7180-camss in order to support the camera
> > subsystem for sm7125 as found in the Xiaomi Redmi 9 Pro cellphone.
> >
> > Signed-off-by: George Chan <gchan9527@gmail.com>
>
> Subject: just one media (first). No need to write media: media: ...
>
>
> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree=
/bindings/submitting-patches.rst#L18

I found the cause of this, see if I can fix it next round.

> > +title: Qualcomm CAMSS ISP
>
> What is CAMSS?
>

No idea from an outsider, i can suggest one like "title: Qualcomm
Camera SubSystem"

> > +
> > +maintainers:
> > +  - Robert Foss <robert.foss@linaro.org>
>
> For sure this is not true. Robert does not work in Linaro and I doubt he
> cares that much about camss.
>
Well, i might suggest to be like below if no objection

 maintainers:
-  - Robert Foss <robert.foss@linaro.org>
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
...
> > +
> > +description: |
>
> Do not need '|' unless you need to preserve formatting.

How about this? I have no idea what this is, just modify it blindly below.
-description: |
+description:

Then drop all "minItems"
...
> > +required:
> > +  - clock-names
> > +  - clocks
> > +  - compatible
>
> Keep the list ordered, the same as list properties.

Sure for this "required" list
...
>
> Missed alignment with previous <.
>
Sure
...
> > +        reg =3D <0 0xacb3000 0 0x1000>,
>
> reg is always the second property. See DTS coding style.
>
...
> > +        reg-names =3D "csid0",
>
> So this will be the third property.
>
>
>
> Best regards,
> Krzysztof
>
Best regards,
George

