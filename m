Return-Path: <linux-media+bounces-14049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DAB91481F
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 13:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 724081C210B6
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6701386B3;
	Mon, 24 Jun 2024 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlDgg0xt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF366137760
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227390; cv=none; b=qHhvZg3gqCLJidtFLGWQHBL+X8cHhA0fU/4qm7Ph7mwSx2YHRSrLEVAuVFLqQiiiJxb53Ty9k7qk3N5k6y9Qpc9giirO02AOybz2en1qKbOAH2t8p9fSYxgo0W1rjYMFFKt2xASyaR2RKj4efM93oB30l/vtL4PGGCDToWwPa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227390; c=relaxed/simple;
	bh=xQpJ0O+kFmzdnd+u2y9biX9+NfS+Otix6vWwyOgcJmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXsMdIktZ4dEbYKzaRxqmUZqut8hqnl2LWgLMteiY+bSmz06rNOPX3t1mVfCynirq59YBFmRnS9BO//IQkOMvuV6GjjRlfaHmCOrNSbiNj7Eu4Gg9jqoQtuW9p1MxIy+GuyzHt+Hw1kfoYON30LOoLOIqm/6Xqjx7g1XU9+/iW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlDgg0xt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5369DC32781
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 11:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719227390;
	bh=xQpJ0O+kFmzdnd+u2y9biX9+NfS+Otix6vWwyOgcJmU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qlDgg0xtHSu6BTGehgfLiSiYR9gYNg3ol4RFgHA9xh+XkG2CX4e5cmCuFx+mMuNiY
	 /kBYHkFAQJwjcNxLcBCm2rkQDi8xOacvGfO3CUWckK51uGqCxvHb8lGjqjfhOisbVW
	 s1UPYdKEFy6zofHBiuSu4c0+De47dgBs2EgkxMun8BUU02kHlqnPECvQmnXuysGzJA
	 a6XJyoSep1ju8LoRV6JC7B1gsMjhTrT5W/dc100y8/fSB+ELHzjlw4NxviwKYJ2dgW
	 EsWunf/9/8uLl7Kh8cjGtuvViBxFsliqnzU3Y7wV0hq1m5ycUVbRB34YHa+RzpykOf
	 AkntivKplX3wA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-63036fa87dbso32658797b3.1
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 04:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOcET8m+lTUUnAxKEjTNcJBNS5PkSytNNoWjCywhFfZLJzmjdlakqPCNz4EYutDH4ndcpdSmoNEMDmGOur8ST8ri00idBpexJVcVQ=
X-Gm-Message-State: AOJu0YxII/I8SS6zuLjx5iUeqrEUaZwpmimLjumdHp/zNIvdY2BynAIR
	cu5WeYW9bV4KsIYwSvPPCVrElcSZdOtP/dm0dGR/f8GuUM/n3xwcIYSB1Ioyys153vykAw/cjYh
	wc5RIySFEX6Y2pgwy1TYwwG7eCVg=
X-Google-Smtp-Source: AGHT+IHJewWlgVgVWeiPC8QQql7oiSxVMmM3qo+hU7W4gXmRpRgv1QFrjde4yVk+TqcJHqfarcbqEzFfGA9KZlXNCIY=
X-Received: by 2002:a81:b654:0:b0:618:498f:9dbe with SMTP id
 00721157ae682-6424908a767mr29142797b3.10.1719227389508; Mon, 24 Jun 2024
 04:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240622102347.7004-1-irui.wang@mediatek.com>
In-Reply-To: <20240622102347.7004-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jun 2024 07:09:38 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6dmCQpeaP0fhzx6RYc_sGPY=Ae3T7+r=pyt8rLoFLK3g@mail.gmail.com>
Message-ID: <CA+5PVA6dmCQpeaP0fhzx6RYc_sGPY=Ae3T7+r=pyt8rLoFLK3g@mail.gmail.com>
Subject: Re: pull request: linux-firmware: mediatek: Update MT8173 VPU
 firmware to v1.1.8
To: Irui Wang <irui.wang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 6:24=E2=80=AFAM Irui Wang <irui.wang@mediatek.com> =
wrote:
>
> Dear linux-firmware maintainers,
>
> The following changes since commit 77eb1a9398784c42e23ad087acddef599f0dd9=
d7:
>
>   Merge branch 'robot/pr-0-1718900951' into 'main' (2024-06-20 16:54:34 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.2.0.git  v1.2.0

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/235

josh

>
> for you to fetch changes up to 9e6aff680098f0def484e018413ad7c002c2f4fd:
>
>   linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0 (2024-06=
-22 18:06:17 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>

