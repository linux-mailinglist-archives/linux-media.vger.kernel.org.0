Return-Path: <linux-media+bounces-14154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AED917AB3
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 10:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64708287F42
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 08:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A2616193C;
	Wed, 26 Jun 2024 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/OG3MNd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27E1D699;
	Wed, 26 Jun 2024 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719389892; cv=none; b=DY08/uboWMC11iS96cpZOfh/ID2Rh0B/ddNo3dcNO9HtWyDgM3T41fZ9HVaVzbstoe5y852EGh6mhzBGvAI5A0wqP5WqHUR3tJs1zaKpii96VLtdsjEujf36eNIM/xeaOLVaS3dAzwiT3FvGScSWxF3nVEtHC9wEUKUa3WGf4/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719389892; c=relaxed/simple;
	bh=AvoSHU99a8vMa0GC5pTkxSbP0Ew1+aZz/FGdJf6Wu9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIJHxJL1y4oU0vKZFl0sV6Kqk3xPHUk3eOysegpbbu91JMxNhoXu+uBAwcSQSEOYHb3NXAh3s1AXdCfuXZUzRAPQnyQnnX6x29oGJgrJo6+NAeAb9PlVsuVoL7Iu2Qu1wrJWjw/rxnHKZb91G8skvpNblmQiyjq+B47mfsdF5zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/OG3MNd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so73313651fa.3;
        Wed, 26 Jun 2024 01:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719389889; x=1719994689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N15q/WNT6ob47bnVTbvIGkqXwMXEwhLb/EHETRB7CUY=;
        b=N/OG3MNdS09CQynMMpPYC+uP6RYKMdJ6YvKHlfhniIGnF2nysYwIUY8uggPQWXWi5u
         mLdcgZf35lq4GMSzjzelN8U4N0eGWArqMdpxZ4CeOACpD+N8AfVsa0O9NT1wxUm0pYEJ
         1NSXqABLyRERtTL+vp97ykGdLWtjvsH+nLbikD9+Sh1EDQFYRYY6t7Oxj+zExWG3UL3e
         UL+cRtz7PTeT5F3M1t4wX0TVqhyamoKd3CeHz77n+u+0U3daEvdmS2rojbwENLQqdWg4
         vNL2e/KZJDpqVtgbXOYhQm1zC9jmmiCYG6S4UUwP7uCsXxijvg0WDPAF9bZbcrVS5i73
         /6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719389889; x=1719994689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N15q/WNT6ob47bnVTbvIGkqXwMXEwhLb/EHETRB7CUY=;
        b=SlFsqA+P/5yYm73pC6zcjHZ895juHcRcbM+gWgyt+SankwHOfGZfzJP675k28WxgDU
         7XuePP2LRE2/zgRwuJzWYrAfD/Zwfs5mgVXE43chl94UzsJ5NHjgeiAmC4uJvzLoyc+3
         6TRRdOdR//PnxBhxq/5VlHJ4MD4XebopVgfbQiOnbBYbXmBO/Gs/atXVkVu+rJnUZKuj
         kxul/eAEsrZzcbwpH7CvBIt9XY9XcIBaZHNvkyWxf0uKIZ3mdoVSNa1dNh5c/IinURy7
         4Ah5MhNNNHkBe7uhjJizfrBdJ9LKuP/RTatZvKEjw0J2rt9a5dXgtxeSd1EttXWnzD22
         GoUg==
X-Forwarded-Encrypted: i=1; AJvYcCVwhLuatGGATqCMjDd9ceSljEQQKUaKq4P5UNP8wrqVuZBMD+Gab3mP+MmpeZFKUMc2RJSgpI206QXxEM+dBMRCu2Qj1Xd1ZTacmWNSwjrrQ+YMP88/2K8AXkSmU+yBeRYpQTuoK4d7Ea3qWrLza2REEpr3FXusdePxToA/05OzWAyZ53KMPpT5UANnqx7hOjCel1KHpgMpughCCtFTDwNfqm3Lfw==
X-Gm-Message-State: AOJu0YxqpOvtRQ973CsK0Kor79Wyk/EA487iCHUkpPsYbKoPh79daGXf
	sl1xPTTT6p3tGTGrX6+nwsSmMGCtqdJldITvonCRdcerW0ZxfKzkCbQ0a6ikgihSpoy9i1PUtbm
	9/F2GNiT3I3vd+0Jsk1loN349fx4=
X-Google-Smtp-Source: AGHT+IGrMzFsxLqCWpEHWfyt6b10dYrOfGyfsiaHCujHuLFEa6ZRzFkUvBuBJdgFSbHy5HHYXI31qwFsh+TAP1vy7uw=
X-Received: by 2002:a2e:9cc8:0:b0:2ec:3fb8:6a91 with SMTP id
 38308e7fff4ca-2ec5797a562mr67610491fa.19.1719389888403; Wed, 26 Jun 2024
 01:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-1-89ece6471431@gmail.com> <c33dde93-2c3a-4a00-93ee-e4de303c9057@kernel.org>
 <CADgMGSvN=uAW7z1dpETGVRewzDG=K2MAtzOkhK7xAcskU_oeZg@mail.gmail.com> <0a35f0bd-ceec-487f-b9fd-ae9698b74048@kernel.org>
In-Reply-To: <0a35f0bd-ceec-487f-b9fd-ae9698b74048@kernel.org>
From: george chan <gchan9527@gmail.com>
Date: Wed, 26 Jun 2024 16:17:56 +0800
Message-ID: <CADgMGSt9Hu5Ciq=ndMTaVK23Y_ixTVtTuSfy4hJkJooFH2uv9Q@mail.gmail.com>
Subject: Re: [PATCH RFT v3 1/5] dt-bindings: media: camss: Add qcom,sc7180-camss
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

On Wed, Jun 26, 2024 at 3:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Keep the list in "required:" in the same order as the list in "properties=
:".

ok gotcha

> >> BTW, I asked for subject to keep only one, first "media" prefix:
> >>         "Subject: just one media (first). "
> >> but you kept the second "media".
> >
> > Sorry I can't get it. Could you choose one?
> >
> > _ORIGINAL_
> > dt-bindings: media: camss: Add qcom,sc7180-camss
>
> No, original was different. Go back to your first posting. I asked to
> remove one media and keep only one - the first. I did not ask to
> re-shuffle the prefixes.
Yes, let me sum it up

v1 title is w.r.t
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240222-b4-camss-=
sc8280xp-v6-1-0e0e6a2f8962@linaro.org/
then extra "camss" pre-fix keyword and "binding" post-fix is not needed.
v2 wrongly remove all prefixes and correctly removed post-fix
v3 added correct prefix, removed redundancy "camss" prefixes but
changelog still refer to old sc8280xp style

The title now should be fine. So I will modify the changelog only.

So there are 2 todo items as above. Other than above, all review items
are addressed. Plz confirm.

