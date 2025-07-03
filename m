Return-Path: <linux-media+bounces-36709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6976DAF81D6
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1B06166965
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989192BCF67;
	Thu,  3 Jul 2025 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL1N+Tkz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E372F229B36;
	Thu,  3 Jul 2025 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751574003; cv=none; b=l5t8zjKZv0pgbQxrI28r1Y8xX/CLYMqkYL1YFiNJSSwzTEH28J53/b/AkoisdByhpUSzYFXoEFh4WI1Hp/cymQK4rvhO/YHemtSecTE3by4gyElcMxKilyFjvBq1wnGFARywdvimAg3elhutIFKzEOm9R4oJvA1JmL5XW6E39ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751574003; c=relaxed/simple;
	bh=/Z6dqwWKcpslEvJUI8LhwqbM2J/z4HV3/9EflldkIS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsKVhX6m2p+g8P5qx5nqjgVQ0YHIP8nWQG7ZyfxXBGfvNMGH+WhpiaMIj5VTyVdFkEXEVMBiXx/mqrtLDTRYohs9ap9wwGArHROxVZGcHnLyVrb85QoR/ocgJ7hsplwdRn4iwy5JmMZuQ/cK+P9Q56pEPIFd3S88kVqHgaajf2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gL1N+Tkz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F6BC4CEF1;
	Thu,  3 Jul 2025 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751574002;
	bh=/Z6dqwWKcpslEvJUI8LhwqbM2J/z4HV3/9EflldkIS4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gL1N+Tkz0OLj2NMAhLtIDCKg5/fS+DhRasCnj+SqRlpM8NFvysOtOlTCR5iYjE8ed
	 xnfhUAewgXuKSGrWeNGmZoEST0fJhvNY9eAEkrzZTIj/Qs5yYvOti1bbwBIDWZd6no
	 b9AZ6LqyGe/3aOe4Xgjsv/wIJ8DJh4R8tYO+zv1VkJgInVHm2eOEKA/JSjvcD7lDwG
	 Hc9EWXC1HmCdYS3Ymzsg3gfeSebgRURaV2bSFSHl+PbqMyZ0dFw3geasAyJNOJ0E9j
	 A5591Ld/1BadRwFSBKP5ged+niipxIlcxHPQyhDU3DaG2EA71By+6UQi1dZKyo7b11
	 v/IlvtbIMeleA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso417391a12.1;
        Thu, 03 Jul 2025 13:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+JCbqLn+r0S2QtpFGQm84jJkeof/qE4VZeYxC/vvJqQoeSOqBMbGVFUEiKFxWU/O0Tg+fXGHySeOsY2BIsg==@vger.kernel.org, AJvYcCWEDsr/67B32EShW9O5re8IbTbm1lZSmXmDS8S6nNNstPRiqqrezqOmxiAnEaDwTQ/I70mT6lUfcEBCn30=@vger.kernel.org, AJvYcCWUVZ71ehxEae113sbPFB73gUwwbH4b/rIe7QhwQlGyUU0hsoNSmrzlHg0qgnY/804xIXW1l16cueU7do0O@vger.kernel.org, AJvYcCXU6PltZ+8DHau95W7wAezUkWdU6OggdYnc2JFMF8sUqhWIMCYR0v/AHXRUnFLFgk2Fv3hWBWwTxxiW@vger.kernel.org
X-Gm-Message-State: AOJu0YwcYXBVatCt7asSDIXLKtUxcUL1t2Cls++9O2NIa0DNkD/jDX3j
	LIJjYTXIiVFyUZA0ZdJxdIEDK8lvp8knFvtPQz3NnToZc0IvP6LeTnl2G9Qq3ZaKxkIDxUVCjBL
	emCAjlw8RAnbl7bnhnAnVZijCoTqjlg==
X-Google-Smtp-Source: AGHT+IE9hz7l5h4gKfA2Gok0trbBLrord6Qv4/OAvtCHoDspRQQMpgsUWP4XL2MXTLDAW0VEjFlalhjZGgWnYj7Qmpg=
X-Received: by 2002:a17:907:2d2c:b0:adb:2a66:85bc with SMTP id
 a640c23a62f3a-ae3d89953bamr452586966b.34.1751574000959; Thu, 03 Jul 2025
 13:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-sm8550-camss-v2-1-ed370124075e@quicinc.com> <175021976651.732077.6463322520296960558.b4-ty@kernel.org>
In-Reply-To: <175021976651.732077.6463322520296960558.b4-ty@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Jul 2025 15:19:49 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+46ThxSwJm2RjPDjmK9LmhkFhc9UidjBirEq7-kescPw@mail.gmail.com>
X-Gm-Features: Ac12FXzxV16zTuZlQN8D9DXY_qZpyOqeBk68ONoeu6ESaQCeuGhWEMIIFPY_tlk
Message-ID: <CAL_Jsq+46ThxSwJm2RjPDjmK9LmhkFhc9UidjBirEq7-kescPw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Add support for camss
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, todor.too@gmail.com, rfoss@kernel.org, 
	bryan.odonoghue@linaro.org, Wenmeng Liu <quic_wenmliu@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Depeng Shao <quic_depengs@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:09=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
>
> On Thu, 12 Jun 2025 16:01:26 +0800, Wenmeng Liu wrote:
> > Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> > includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> >
> > SM8550 provides
> > - 3 x VFE, 3 RDI per VFE
> > - 2 x VFE Lite, 4 RDI per VFE
> > - 3 x CSID
> > - 2 x CSID Lite
> > - 8 x CSI PHY
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm64: dts: qcom: sm8550: Add support for camss
>       commit: c5aeb681fcdd23d042d780f89ddcf908a13baee2

And adds warnings:

      6  clock-controller@ade0000 (qcom,sm8550-camcc): required-opps:
[[33]] is too short
      6  clock-controller@ade0000 (qcom,sm8550-camcc): power-domains:
[[56, 6]] is too short
      6  clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated
properties are not allowed ('power-domains', 'required-opps' were
unexpected)
      6  clock-controller@aaf0000 (qcom,sm8550-videocc):
required-opps: [[33]] is too short
      6  clock-controller@aaf0000 (qcom,sm8550-videocc):
power-domains: [[56, 6]] is too short
      6  clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated
properties are not allowed ('power-domains', 'required-opps' were
unexpected)

Rob

