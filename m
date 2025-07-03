Return-Path: <linux-media+bounces-36711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7FAF820E
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42F521C83051
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9852BDC2B;
	Thu,  3 Jul 2025 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsBVSBs/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FC629CB4A;
	Thu,  3 Jul 2025 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575374; cv=none; b=PsfIoRU5UziQguk6nBylIPsVjyAkvaE7mfBWPth6lSxuZTP+Q88Pd2Ow2aZxWczLg9es3CYSufkP6RUBg20JXZ40C3CwSzchmvZBGoaCz3f2jI+s3uaP+wRbEQ+czIbCp0y2UlULqWryz793ED88d+2eVjj3DWXL45D+pRKxQ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575374; c=relaxed/simple;
	bh=S3Qiddw1A/Zn9W+fIM17Ljsk5wEnvLdg5XYDuk1y0yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8rESeDYraMZUJ86/fJ1+q6KOR7z/ablAuLgyaNnpm1q3VUKDYjAcwg6Mm2pRS0kNX1/GgD1qhX56RnKYvOwK8h6XARFJcVZInrJt4xE/5/apfvsC4Ts56fvn0aKELKbpntog+rDzJBn9ceN9LLuGPX+jShlTfV88lyTim0lzUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsBVSBs/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB46C4CEED;
	Thu,  3 Jul 2025 20:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751575373;
	bh=S3Qiddw1A/Zn9W+fIM17Ljsk5wEnvLdg5XYDuk1y0yE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CsBVSBs/tv77pqTxmlxHJRGzueLXCkEnh5OrHC98eFJRqLdxgxfxVCNDDePyyCOBr
	 ISDrBfh7P1w3+pPTb+A0xU9B9z/zf/sXVYgImNz5P4ji8pUo7lviA+CRoQaDb+F+AY
	 EM0t+P+uSDsmHyqSjhMz25JHxdfKOdNOkiO8a7kiQKdKzMVssX/LbcUsKz6wVaWu5p
	 fOP884W/RV0MmlhYGEyfal+Iir6gG3t6wozNIbX9cdUNjSNeGnh8zEl54w1PA5vu4z
	 OpZ+iiM6SSjwZ5bEC2HelMCRKLFmjTI0NoQjWyy2w59gWDPkBM9WN6UxAufvsdMh6b
	 Pq4WIYQIKYHYw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso400836a12.0;
        Thu, 03 Jul 2025 13:42:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUADKLLs88hj+8k+31mCvaG7M5PGuoB3P7OalyElIDu5bwslpwebRXyl7nKqqRgqrfUh+DXYKjwy7I5xdg2@vger.kernel.org, AJvYcCUawTvMfJVF5YFSteZFRx2U+U+k3Y4ko7N0wJqBDyc9DIP/nOjfFnc/DcsfHNYFzrQ44IyTyDNTyPsz4bG0gA==@vger.kernel.org, AJvYcCWvIaZK6MpxvufpkKqhhz2+3Vqas4IkQaQ8uPtMRWqHqHVFNfADWke+veAnOdIH1eOJjXGk9SKQDAJIF0Y=@vger.kernel.org, AJvYcCXZokttz4vmrHmegsysCdfW0IxPOxOp5pQ5lKGGSBQaRFpajHqZ5wc3+hkNQKZpOEYLO3p5e1Iey0s/@vger.kernel.org
X-Gm-Message-State: AOJu0YybaFP2yQF2Nm9V5vdrxG+CDUy2/xfIdCPDEqN2K1DW/szz9Yzb
	ZHn9RFJytuFuhgIyikRHBuNjjbqxXcONyGCgelnm7q9pO78dqahci0a6LcblXCxVEwz3zINVgxO
	gRtOVutn1jCt4mXH1ATqqIcClj56YGw==
X-Google-Smtp-Source: AGHT+IE7u+N95burKlExkwTD90qVHoArfcaqb2runQxI+LEZ8vqMAFBb7o0PlXFoCB14cvv77kcjPkMVsiK9RnFzq6k=
X-Received: by 2002:a05:6402:13d2:b0:609:b263:41c9 with SMTP id
 4fb4d7f45d1cf-60e536499c9mr7795095a12.32.1751575372188; Thu, 03 Jul 2025
 13:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-sm8550-camss-v2-1-ed370124075e@quicinc.com>
 <175021976651.732077.6463322520296960558.b4-ty@kernel.org> <CAL_Jsq+46ThxSwJm2RjPDjmK9LmhkFhc9UidjBirEq7-kescPw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+46ThxSwJm2RjPDjmK9LmhkFhc9UidjBirEq7-kescPw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Jul 2025 15:42:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKyMpCxMXw-w4rFF+MS8T7uuPc48gvzekgcMu5mqCDMwQ@mail.gmail.com>
X-Gm-Features: Ac12FXxL07CywnCOnQ_ZurwE4PGfzvOA0rYgUW2sef1JYVjT8LlXLMmZC6-ZA_U
Message-ID: <CAL_JsqKyMpCxMXw-w4rFF+MS8T7uuPc48gvzekgcMu5mqCDMwQ@mail.gmail.com>
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

On Thu, Jul 3, 2025 at 3:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jun 17, 2025 at 11:09=E2=80=AFPM Bjorn Andersson <andersson@kerne=
l.org> wrote:
> >
> >
> > On Thu, 12 Jun 2025 16:01:26 +0800, Wenmeng Liu wrote:
> > > Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> > > includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> > >
> > > SM8550 provides
> > > - 3 x VFE, 3 RDI per VFE
> > > - 2 x VFE Lite, 4 RDI per VFE
> > > - 3 x CSID
> > > - 2 x CSID Lite
> > > - 8 x CSI PHY
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] arm64: dts: qcom: sm8550: Add support for camss
> >       commit: c5aeb681fcdd23d042d780f89ddcf908a13baee2
>
> And adds warnings:
>
>       6  clock-controller@ade0000 (qcom,sm8550-camcc): required-opps:
> [[33]] is too short
>       6  clock-controller@ade0000 (qcom,sm8550-camcc): power-domains:
> [[56, 6]] is too short
>       6  clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated
> properties are not allowed ('power-domains', 'required-opps' were
> unexpected)
>       6  clock-controller@aaf0000 (qcom,sm8550-videocc):
> required-opps: [[33]] is too short
>       6  clock-controller@aaf0000 (qcom,sm8550-videocc):
> power-domains: [[56, 6]] is too short
>       6  clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated
> properties are not allowed ('power-domains', 'required-opps' were
> unexpected)

Actually, looks like we are waiting on "[PATCH v5 17/18] arm64: dts:
qcom: sm8550: Additionally manage MXC power domain in camcc"  and
other patches in the series to be applied.

Rob

