Return-Path: <linux-media+bounces-45669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 329AEC0E609
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 15:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA17F4F76CF
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 14:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E300530EF9A;
	Mon, 27 Oct 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dp4ar7Wm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269CE30ACF2
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574313; cv=none; b=izLVmbryEUGt1S3U34EgILEx5VVjQkrIOLi4iZ/RSu1a1L6jES2vfFCXg0SBvHVNfUHtnlO8HXpGiuafotXk7eUFvrQIXFQJ34Kt/hDtni2eXmAMzk/1LcLLasthqcjTmeK5CJNYkDR9C7vRnLpiWLIsY01RxbGoeM1WU2sM1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574313; c=relaxed/simple;
	bh=8pSKogHAV0YCMjRL6oB8JJn2I1t630qC+Zdgt1EdXNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWZr3YLODNYfas6G7LqaBTSLzEFncOPTQIiFfQoCe5tFyyOGeJ6TiBkWJIQRKZNULR8XbxltCRZrt6eydcOwtpY4bnATl91NEMTxAn9pvnwHrTJg6tr0w9jkDG/gV9xiy4Icgl2bPZyK/J/E0J6SmbvmaRR3bTkSlALZJnBKk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dp4ar7Wm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16F2C4CEFF
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761574312;
	bh=8pSKogHAV0YCMjRL6oB8JJn2I1t630qC+Zdgt1EdXNw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dp4ar7WmuEdc4ozF6d8Mnvrz2aoSjAxj7SGB3kpSF18DQ/dYLlG7ogeL2YDXioqhE
	 MFC5Rdf+QYbyTChRkOixVB+ZNc0fTjlmbEYRG29PrQYhcKelByyWh4mg3WOWGIo7Ra
	 UPhkgk6ukoQjYMDzh4q/XLJI/s/DKqmQgn154dAMMPKdjDaTRzhCn3r0wjOS1jiuAX
	 l4bGCxmtwsZbBxgsUIvFkOEKpXENqYQz/r7bH0cFhipBplFKDjZAVHZmIN91/rvCC4
	 HvOk3KQENw+o/RQikHBDGLffJ2tdGex/tAz8+UAsNNIeCGr6BNXrbcp2PcuFxHqv0r
	 B/+6oZkuiJpEw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so600833966b.2
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 07:11:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWq6lCDQZDE+8htbyovAgVN30ZCrd+GYVAaMVuaSlZIpC/MCHrTh5JI3TByhSvpAOqU6JhyOUThNMmOGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQN7AoB22PxSONmIHXqefxX3IaTgckM47YEklpgstDnbL51ChN
	AFiFXgI+C5PYKo1oB2zxCj94sDEf8mD4pxBahOlb9o+LzKuZ5Y6QcinPoyEBWieLHPDkspStxUE
	JNH1BbIxwuc2MYUXN8FGJNGwe4AT+6A==
X-Google-Smtp-Source: AGHT+IFj8EZV8kIUyITeEbObKp3pkSpn/VEF/SrKqfhWlJrQlAhj3nZehJL5G/aueVs5l/+xNxsm1tQL0HMrR6Qn2y4=
X-Received: by 2002:a17:906:f58a:b0:afe:7b8c:a583 with SMTP id
 a640c23a62f3a-b6dba3f306bmr9821366b.13.1761574311195; Mon, 27 Oct 2025
 07:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813214949.897858-1-robh@kernel.org> <CAL_Jsq+vUNtMw6JS0ac6a8LTdJBB+UepadpDxP_S8vr6QwUiNA@mail.gmail.com>
 <0bb932e4-9fb5-4ee0-bd21-6e30d6c8044c@linaro.org>
In-Reply-To: <0bb932e4-9fb5-4ee0-bd21-6e30d6c8044c@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Oct 2025 09:11:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJHzPUyB6nDaTS87eHysoh5W8o=CefWt6hH8zbpM_aQJw@mail.gmail.com>
X-Gm-Features: AWmQ_bnwI83EeKQTO-531dVAI_XpG-oG19djxHv8cu5QJqGiPGiiOZXN0MqZNC4
Message-ID: <CAL_JsqJHzPUyB6nDaTS87eHysoh5W8o=CefWt6hH8zbpM_aQJw@mail.gmail.com>
Subject: Re: [PATCH v2] media: Use of_reserved_mem_region_to_resource() for "memory-region"
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Ming Qian <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 4:25=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 18/09/2025 21:22, Rob Herring wrote:
> > On Wed, Aug 13, 2025 at 4:50=E2=80=AFPM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> >>
> >> Use the newly added of_reserved_mem_region_to_resource() function to
> >> handle "memory-region" properties.
> >>
> >> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
> >> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >> ---
> >> v2:
> >>   - Rebase on v6.17-rc1
> >> ---
> >>   drivers/media/platform/amphion/vpu_core.c     | 40 +++++------------=
--
> >>   .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
> >>   drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
> >>   3 files changed, 21 insertions(+), 56 deletions(-)
> >
> > Ping!
> I'll pick this one up.

I still don't see this showing up in next.

Rob

