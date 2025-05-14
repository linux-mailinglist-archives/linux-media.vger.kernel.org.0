Return-Path: <linux-media+bounces-32483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0822AB6BEA
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 14:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48EBC3BD16A
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE12527A470;
	Wed, 14 May 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4pHremC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF727A462;
	Wed, 14 May 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227408; cv=none; b=hG5jVFLyDtL1xOb77zbhKxOyAKQwMvB+ZXUhDq4BW5x9vU16cwgxFAT921mpUpiuGK5rd3wZ3YSI0ruXjuWMBzBMteCvFp72BwXuUo2kR2Be/x1rB1NL8zmH5saS/3IXCFqALTZztMshNPQOBrsr1lbNTPmg0jf7x8fzg/VZhkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227408; c=relaxed/simple;
	bh=L5BkK/9+vx6s2eotlu7sP1AhcqapoAxZTN2ZPUj5+Rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eT78tgHBkDUcngX4cM14UpIMwDCfDTTjmdcm/b5ZVzieJYXoUDPiLD2UNvf3om/43p9bq5MF21h3Gmq8yU20Cf1TsnQWVYrYCln6O8dCN6SI3RUuJY9NEHdlMrHMKVbTSK0jxPwNECLA1OHefKxYbnobyLTwaQyE0+O555Cn7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4pHremC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1523CC4AF09;
	Wed, 14 May 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747227408;
	bh=L5BkK/9+vx6s2eotlu7sP1AhcqapoAxZTN2ZPUj5+Rc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q4pHremCCGtY/K88PxXXE2zElcPhPW8QC9ke0b0hfixqqaTfTDBPepN6yI5TcRehG
	 iVvpVkDF0e2HBoWfC6ng8oADLFCYDaxlCKyHN3GpfQQYqjNrPKFuohGzv95VPZZRF8
	 tPat4VVm8k1BKomELw3FsZZrF/uyH86O78tW0RkCh6twW2DVhyZiRLkw3t9tfbu7ej
	 MW6+z3eKWCZQki6FqoPhiOMvZeEAAaROyJjyHgersRO2cZceUlPiw1vvmrYEJZrBDW
	 VHSDoW1oaNzLtgB72Ws1zV4bDD50lOPSS7w6v6tt7kHLkghX2GapInrhFr4Ocii7f5
	 jPS/KglAN+rDQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad241baf856so169879366b.0;
        Wed, 14 May 2025 05:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQmC+sT9BWErGEq+1QK+eY0VitLp5LNC7SHv58IA+Q3JRTnwUweHVZSWx/u1SlEPwjmoHa2Q7IQ3s0zEQ=@vger.kernel.org, AJvYcCXyAv8F6Pr52/lvua5owjwBagHx6Nv7ZzpJyd8VrpWidXryECnyAAii8GQaEvqMZTa1A54uUWDrUfJ6@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4knY2ixuZaKft7C6dr/+zzsXXRwXM5Bbsc/xXRcmgDMdO6Zw
	oPI3MTgzWw2CNK/ndzowzhXDdnAoKxeJmDgr3zZGoEnr88dA8TEN6W7zpYIVIftjjuy13Xx+lTM
	5E3sDMLbK57JxXm4fmN8k9X06ng==
X-Google-Smtp-Source: AGHT+IELhqd55PbVIK/fh9d9i36btbbo6ITEwEb2MGkOGa83e9SO6cYkeWuJWJU73KbPHDZHvvCElKYOidvz0QmAzl8=
X-Received: by 2002:a17:907:3f89:b0:aca:d29e:53f1 with SMTP id
 a640c23a62f3a-ad4f71df611mr370014666b.12.1747227406681; Wed, 14 May 2025
 05:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
 <20250514092259.47035-3-angelogioacchino.delregno@collabora.com> <439db3ea-4fb7-4944-b182-222663c09b3d@collabora.com>
In-Reply-To: <439db3ea-4fb7-4944-b182-222663c09b3d@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 May 2025 07:56:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLwXwmt5Smutvv+V-HfLzgYCqb-YRVx9ydD7rfmkiWoeA@mail.gmail.com>
X-Gm-Features: AX0GCFtnPmpM9IU37owWuZIV0h2y0QbqRqJW_C41vIQEFK-1OTfvM_nf1ApA1kA
Message-ID: <CAL_JsqLwXwmt5Smutvv+V-HfLzgYCqb-YRVx9ydD7rfmkiWoeA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8188: Add all Multimedia
 Data Path 3 nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@mediatek.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 4:26=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/05/25 11:22, AngeloGioacchino Del Regno ha scritto:
> > Add all of the Multimedia Data Path 3 (MDP3) related nodes
> > including its Mutex instances, one for each VPPSYS block, and
> > all of its DMA controllers, Film Grain (FG), HDR, Adaptive Ambient
> > Light (AAL), Frame Resizer (RSZ), Tone Curve Conversion (TCC),
> > Two-Dimensional Sharpness (TDSHP), and others, enabling the entire
> > MDP3 macro-block.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>

Acked-by: Rob Herring (Arm) <robh@kernel.org>

> Rob, sorry again for missing your previous email about the warnings
> generated by this commit.
>
> I ran a dtbs_check on this and I didn't see any warning - can you please =
urgently
> check and confirm that I didn't miss anything on this one so that I can p=
ull it in
> the MediaTek trees for a fixed up PR?
>
> If anything else is wrong with this one, I'll have to just drop it and de=
lay this
> for the next cycle as it's really too late (my bad, though).

Thanks for fixing. FYI, Linus' and next trees are tested daily here:

https://gitlab.com/robherring/linux-dt/-/jobs

platform-warnings.log has the top warnings and undocumented
compatibles by platform family.

Rob

