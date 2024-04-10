Return-Path: <linux-media+bounces-9013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B8689F11E
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E763E1F24D77
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D248915AAC6;
	Wed, 10 Apr 2024 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="un79bBkj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4C15AAAB
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712749599; cv=none; b=b4obKtpdk8FAFiEAJ4Wu6UBro2yVewi14EfpL9y+yJyPqAi7Dl2UVWbLyU6SA9XdPpCsN81HHj+M43zdnLamZkeBXt4BfuShFEuhCQHOts7faulWMvW4wv+xA/bqdAnxWj9IiYJbmk0T6Fgt5bGCva57ytmTNqNSKDmMLWEU5/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712749599; c=relaxed/simple;
	bh=H+ltWJTrCo8dAkDLOHCnfTU9X055aYq6FerReJVEQU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhNL8BAHHp4x5tGtPBATtq3OocTjFLLrxCuQqZdp5PZpgKoR4n62FK/NS5sF/5PiSRY+vLnvS5EzRYO9eY1t6ppG3CmYscpYvqN6EZ/o5tP1PEwYOT9SBPj+eoYUTAlC9B1zzQ4z2vMS0Yb+s4hVEIbXiOUi0Akj6HY0Q9STBG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=un79bBkj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BE6C433C7
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712749598;
	bh=H+ltWJTrCo8dAkDLOHCnfTU9X055aYq6FerReJVEQU4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=un79bBkjQtiu4AXFOuqBWUqWrKE2NrFzeGsyS95un8gsOWKrNwi68LyD3QDVNt0IO
	 EtxnioyHKJTNi+5XwUcsKAKNx4S6INPg19wpewkK1a6UHsk5l4BCmJE8MUMEEdYdHg
	 71J1gt37MMHtRoxn4moutl9B4nae+Jyyrra8Q6JF861KLQKyoFPiWJoltflnZvJzDx
	 UEOayzkdtu/4gwD8IKI7MSn8rhZRSZE29K8YSIsxXZ7fA3P7vI6e4bnPbT8lHJDiTP
	 y2b6plHjubqUgyymeXg0zsTpx8jq1CP5Npw17xRmIE0CSSMQ8vBjPUXYaB8rGzdtWm
	 58uTyM+gbcW9Q==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso6666235276.0
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 04:46:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHxxmeD8PQUOXuX9uKBxDe/lxC/vvvFGa/rKdUqjh5J0O+2BQ/Vfrd5LJVB/fsSNODGalXBej/Dl2rLYXdOna4uK7fRfaMVJdG0kg=
X-Gm-Message-State: AOJu0YzPpavPTZ9AbzW29ByOkGaQuTr6/yPfjjcoTS2trQ79cGaBoioT
	KVsCeRWxsCX+gJqZn5/QSF6WQY/CwO3KlmE9BX4nrAGx/VyRh22zyv7WIfvWEvJHq3IFmCqn/N6
	GrkHqJtwn3aFhKWAd63WKdCukqg4=
X-Google-Smtp-Source: AGHT+IGscNHInYs7CDsYy2rc+vs9zCMcROj27SxAQkw1qt7RRPJGJSIVkFJXaWYP64UZtB4m9xNghw6GJ6q3quU9p9A=
X-Received: by 2002:a5b:94a:0:b0:dda:a9cd:59c5 with SMTP id
 x10-20020a5b094a000000b00ddaa9cd59c5mr2464288ybq.40.1712749598059; Wed, 10
 Apr 2024 04:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410111416.2204-1-irui.wang@mediatek.com>
In-Reply-To: <20240410111416.2204-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 10 Apr 2024 07:46:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5xfwVvLbKYNPKWJAqOw49VspoVnmHaZ0r2c4jBKNW85w@mail.gmail.com>
Message-ID: <CA+5PVA5xfwVvLbKYNPKWJAqOw49VspoVnmHaZ0r2c4jBKNW85w@mail.gmail.com>
Subject: Re: pull request: linux-firmware: mediatek: Update MT8173 VPU
 firmware to v1.1.9
To: Irui Wang <irui.wang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Longfei.Wang@mediatek.com, Yunfei.Dong@mediatek.com, 
	Andrew-CT.Chen@mediatek.com, tiffany.lin@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 7:14=E2=80=AFAM Irui Wang <irui.wang@mediatek.com> =
wrote:
>
> Dear linux-firmware maintainers,
>
> The following changes since commit 1addd7dca2d953a5484c3e3c08dbd7dc253058=
dd:
>
>   Merge branch 'rtw' into 'main' (2024-04-09 12:30:28 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.1.9.git v1.1.9

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/191

josh

>
> for you to fetch changes up to c81f094c847d934c0ffe0870fa5cf861c62e3451:
>
>   linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9 (2024-04=
-10 18:36:10 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>

