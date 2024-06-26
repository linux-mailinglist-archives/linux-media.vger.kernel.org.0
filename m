Return-Path: <linux-media+bounces-14160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BB917BAB
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 370AD2891AC
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B77A16A921;
	Wed, 26 Jun 2024 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRqhDVNl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5713AD11;
	Wed, 26 Jun 2024 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719392666; cv=none; b=S8XAH96Ha1hCMCeo9E7BG9hAGaqOBYI5MUIpJCXbT+XlJjxTg0DolrprMk8IPLkSgOASTvMCl6LwausrkDsYP0iupmBAfHk2c5/LPJi42Z8igChX6xT9CstVHj5VDXLbnHN553Rt6pNaLsPoO+lFHDlJhJh+Cf/YOHtP63Ozq5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719392666; c=relaxed/simple;
	bh=oaYUMoogowtBtWar4tyNI6N865mtdxhIBovNlvD86ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALBq6uCKTfy7UKSnNJtCw4RjyzZNeLYg9Dp0nlb+kGm/Bp1z6sZN84IFNj4XSQCJtklfcxkNXVYncs97mGgnmPoB58fyk5kPl8qDI5Agjvb/GhssyFkLoqqoOWJ1wxy86zwDXAl6iYVSdVk45mJXZiN9994fqHiMeSlvhZ38FEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRqhDVNl; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebe3fb5d4dso3436341fa.0;
        Wed, 26 Jun 2024 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719392662; x=1719997462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7E3E5BV92BwfmylcDqUtcM4HRuAN4aH6njNvBh1p1a4=;
        b=DRqhDVNl8Ub//ovY8D+RPc7QiFGYSXFxrUaqmFRXZU2ZL7AEipjdg+c1lreEiSmaSM
         uSsFyNGNWkFlRKIAtp/FgktwsgzIoaICkLfVY8mG756f6AV5CEvWuWM5gBzSYFm6MhFZ
         R6Zy+cq/h4FRlJoEc7nip2zv0Nbtqatc2avKnp9ya8PjZybMrIjBSREV/ypttbhmXUHV
         vvIjCoWwyc8fJfumERnHbi3lmfLfF0BD2i3gXgLO2n70w1n/NzhllI7DzXYmgknvqVm3
         WnO9kmjm3Lbqhn8uArD44h/vX6goHYUH64qE5SMfykC/BbKHgIjusvqd4jN513D4Npns
         VF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719392662; x=1719997462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7E3E5BV92BwfmylcDqUtcM4HRuAN4aH6njNvBh1p1a4=;
        b=uRoEpKrLNcRb0vmLybfEs71N6FXJPKISbkSMbUH1eHMQh1X0YDEUC383so1HhfFCGy
         94BkGB+CI01iZ9V1aWs7OZNNi2cMtiJ034eHh4csMHdSPeW6KiHCv0X29EwMmgpGLJGr
         83ZNEy3bPQjlkL+fFwSV5EjFO35mUeFwcN3/YjLkeU9WA0uGGuKbIGfes2oelN76r4eR
         p0MuAyh5/qwB3K0PANX3013EC2aQvNzAHL97MOWrSbfW/CfaEqaIL74kowmmTynrrfvl
         bCCIQSYP8O1k0jexppey6+GGY6JwVSayOMxgAGaZnoidXumyVb4B4LgNhB+0C8OCy5Ce
         G2Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUrwICkejBhYeI2ZUSN6BU1dKlU0QfhKRIamdEbsoe6bDHZ/+F25JLTf2JCzWmCUF0A7WUdYO7W+qLfo80wxVJQubLXhhIjzadm7Y1sTla4y46oOUCRsp3loLKYSpMOGjaTeSgM2sGILUL2DbteB0cIWN+KwxHSUbVQpsVy80PwgkWyjhraQ/h3qdd8thxJhdZYZVWck6wpCVgwSxW1G8cJKi/Axg==
X-Gm-Message-State: AOJu0Yx54NICGspIZsVKauhuOYJZz6TynHowVACMQ0atIKFnZquMrT9i
	Y/wdSXZHaZfpRNofhHuaKQeLrUzmGcHm+6jzwtUxg4ZWHL1A/UrO2IGXHktRlSSDIlobfyq/ktU
	xM9V2hZOlPEIAZ6e6chCPujJLqis=
X-Google-Smtp-Source: AGHT+IHX5aR/TPFzCeASrNiTOjVcjJKCYtuqJqQwkfz+AyGjVcXrcnx5Unkd+h1xucYfF4Zt1bnv9HizRa3aNBh/Pao=
X-Received: by 2002:a2e:7215:0:b0:2ec:4deb:482f with SMTP id
 38308e7fff4ca-2ee4645bc13mr73171fa.8.1719392662318; Wed, 26 Jun 2024 02:04:22
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-1-89ece6471431@gmail.com> <c33dde93-2c3a-4a00-93ee-e4de303c9057@kernel.org>
 <CADgMGSvN=uAW7z1dpETGVRewzDG=K2MAtzOkhK7xAcskU_oeZg@mail.gmail.com>
 <0a35f0bd-ceec-487f-b9fd-ae9698b74048@kernel.org> <CADgMGSt9Hu5Ciq=ndMTaVK23Y_ixTVtTuSfy4hJkJooFH2uv9Q@mail.gmail.com>
 <CADgMGSv+x2Z9FsWTHW0auttvpdfNDnOPxiJhXnUaW3yQczN_Ag@mail.gmail.com> <a7306019-9f19-4619-875f-e6b71add5607@kernel.org>
In-Reply-To: <a7306019-9f19-4619-875f-e6b71add5607@kernel.org>
From: george chan <gchan9527@gmail.com>
Date: Wed, 26 Jun 2024 17:04:10 +0800
Message-ID: <CADgMGStvxkaj_LxXLuwEUtm5dPT-MCr6aKp_DKZngHsRPTjmng@mail.gmail.com>
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

On Wed, Jun 26, 2024 at 4:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/06/2024 10:38, george chan wrote:
> > On Wed, Jun 26, 2024 at 4:17=E2=80=AFPM george chan <gchan9527@gmail.co=
m> wrote:
> >>
> >> On Wed, Jun 26, 2024 at 3:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>> Keep the list in "required:" in the same order as the list in "proper=
ties:".
> >>
> >> ok gotcha
> > btw, i checked  "required:" and "properties:" are aligned, both of
>
> No, they are not.
>
> Which is the first entry in "properties"?
>
> Which is the first entry in "required"?
>
> Please stop wasting reviewers time by disagreeing on every little piece
> of this. The feedback was quite clear but somehow you do not read it and
> respond with some inaccurate statements.
>
> Best regards,
> Krzysztof
>

Then my apology. I might take a break here. Appreciated if some
developer is willing to take over it too.

