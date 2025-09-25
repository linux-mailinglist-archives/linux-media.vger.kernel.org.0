Return-Path: <linux-media+bounces-43126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7966EB9D696
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 06:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51441BC1C07
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 04:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231D42E7BDC;
	Thu, 25 Sep 2025 04:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DuiiI+sN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F93A1F94A
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758776084; cv=none; b=OQPXgQhHOa3PqvEIqqOD/FvK9ebzzCRMSW8YNdiCp6W6zzKbpjTwI+CTTphMo+L5vTXur1rmsbTyQzTcGLJ/Opo2lGLSNZVyI57eTLmTc+aH3NDT2wRwzhw1Wpu9YhRm/JmU7D49nl+FyKj8pzXOV0UJ5Q07+yTaTGqmbv3u6Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758776084; c=relaxed/simple;
	bh=rwFjnBd/arunXm3tp0XfDKTYREgqSAQUlx1L0O8iPLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUbZ2ZkcRI8PcB4FALJXncNwsfRdiumxKzJaZ6Zi3SZicT5r/vHCFgPLbtp/gbG2DLSjc04uUrjzRtp8jExPehuriwNUhArTz2+0bLAohb9/UbDNPr/R7AicasDcEwl775BaQSILqK0FBmInfP/U26FL6rKo7pzogBCw/NxO2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DuiiI+sN; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-36a53fe7ebdso4668081fa.1
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 21:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758776080; x=1759380880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfOJlNr1JeVzQacNsJApm6u3eklKPliDP0EOZ1wC62c=;
        b=DuiiI+sN2rfnSnmhoELKNcQaxFUwfYvWCtWx7eDqipFUGnqbLDhyFpruGG2OyCL8eJ
         dnw8UOppbNLUmg2S5fBHa72faZdTW0+mAqCzCK6jUdm0Axy7tLwGcUk8ZGb5TZMxjb8F
         Mzo/fY8D28IvwJTOyD1s7oeiJk6UJV0l2sI5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758776080; x=1759380880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfOJlNr1JeVzQacNsJApm6u3eklKPliDP0EOZ1wC62c=;
        b=LE/+5yD40oUEMkgeWc68d5kP8lnJ4+CQm8JTL4XQ7U4sFoLo7s3OmpmiOCAhjg0qRb
         tXYn3EQYZN/o+dses4bPnjUqeGIJH1dferWfpFA499py9x67rxrtFtJiPVhyGZcoBSy7
         p62EAvMJd8f9pSwmUk39hZjYrza/Ms32bfCwzYH80lK7RiurajMhzZYiOgJTyy7E8E3B
         LHoGX43YKmel1KnJSjGcMErC3a/T7ZPXarnD64Gep9tCEy2JPKkijtjouc74RQL0xw2p
         zLDpGf+/UxPzLNZqSOxlIaoI8unshx2oY7yJgLRzbUqFicc/J/Q/s2s4TYG/TeRcQ/Kz
         IZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBuP0R6Cq6wcxuDVaRaFvtLWFXcbpcnICg64DV0VDgwbdLHE8RPZvo2xcJnaq/2YhdCwtJrlvfTpkCug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRJ5caOh5Go5araECqdG0L45Ch09323gSy4ym1h/yuqna4M/G
	lQO9HB0usSHJA4sZucfBGaHsSIXyVY3Kr2RamJw7mRzKVOknqHCTrAuKv/EKwYcbx5K5xBA6KCw
	XHFRI0GQtHaPgdoPCQMWW9rxpqMiNAVaqSPTg8zoJ
X-Gm-Gg: ASbGncsLbOgMHVN0xMSDXiGpMpB01BGqsBDEhEkCWp47ebsodNPsuruyHikrSjmME30
	QjkgIXbOMXXZmvkaAuGKJe7J9zyzVtxnntPwkxbKAtM7y7zGk3EoVt9eGZGfjJKYFqJ848pGTye
	EfQksi9c2+qB5HwUGKYmXNswiE6CgflgjLN1mJz+5+3tnYyUUYIT8Lw4RaL9BPhYvitv73TNpKn
	iSe6SacC+16v241HB1vA3JrU7NK/A5HhSkjEA==
X-Google-Smtp-Source: AGHT+IF0+5f68ueTJchiy8OVva2aPyot+zNZ1LmHpjgzKmp8yTmlbDcDBtW5B2Jmd8k/IXzMW6KzTG/3d0FIWAKFPI8=
X-Received: by 2002:a2e:bcc8:0:b0:365:b79:8845 with SMTP id
 38308e7fff4ca-36f7e795878mr4719381fa.10.1758776079768; Wed, 24 Sep 2025
 21:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924133552.28841-1-johan@kernel.org>
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 25 Sep 2025 12:54:28 +0800
X-Gm-Features: AS18NWCf3jNifuSG2T8itLUmSv-v41oBGMU6IUYuN3HfGIanTdAfEHlrZ5xZLDM
Message-ID: <CAGXv+5FDyB5U+ec62D9E_ULvsDm7GCddpQqw15eQqN5oVPohDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
To: Johan Hovold <johan@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 9:36=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> This series fixes VPU device leaks during probe of the mdp and two codec
> drivers.
>
> Included is also a minor documentation update to make it clear that the
> VPU lookup helper returns the device with an incremented refcount.
>
> Johan
>
>
> Johan Hovold (3):
>   media: mediatek: vcodec: fix device leak on codec init
>   media: mediatek: mdp: fix device leak on probe
>   media: mediatek: amend vpu_get_plat_device() documentation

Whole series is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>
>  drivers/media/platform/mediatek/mdp/mtk_mdp_core.c  |  7 +++++--
>  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 13 +++++++++++++
>  drivers/media/platform/mediatek/vpu/mtk_vpu.h       |  2 +-
>  3 files changed, 19 insertions(+), 3 deletions(-)
>
> --
> 2.49.1
>
>

