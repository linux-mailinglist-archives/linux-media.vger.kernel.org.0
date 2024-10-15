Return-Path: <linux-media+bounces-19645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E3199DFCC
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 09:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D989028237E
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 07:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC82B1AF4EE;
	Tue, 15 Oct 2024 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k+QG82PJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8576118BBBA
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728978895; cv=none; b=IIUd5bzBIAp/PWgLpsQ7OKtf0uQbcyJJQxDnMrCe8bDBpmZKNy392ae0SU6mJPc2Jltv9eDLCsLVPqyPDFhQ5VZchpqMjHjeQzRj/sJe2+pL3Tn4Kaeg1A+P/hq5nfAMqECEqz7Apwoa1egmJACBCV9ESG7/wOggsohTIbBkIIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728978895; c=relaxed/simple;
	bh=ThTVRucm/KZeiT1R5y4mJV5HZBk+JpKkUrjfGkBfYiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NouXVovrHkyJSx9G0vPM5Kr0onQqpJ1mAhZcPOG3T4pEULD0km++ZxZ33xWpdoX9yi8CBTvbJPiuWSUEbeXFh6/EJAklm9H8lvXafx4f0AcBdu10s5XBuIJQk8zRhfiTtaaneuAijtkI8dZrYH7Y7poIFf0/oo1ATJERgYSnbzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k+QG82PJ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so1844491e87.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 00:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728978892; x=1729583692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmFcFRCIYAEw2190Z4FOUZUOyxlKcujKYWug46B335c=;
        b=k+QG82PJ9uLXcdTsQPWoMohl5IpiFXsoO66MZq5lMp4IEN9MHCC4KVKjaH+5ehrHRM
         69LO5/wKMY/50U0dkD/q0upCELxSwiSut/kyEO82cMr0VAf4pZcvgMmbd99GyFUnkZ4c
         LlF9B4ND1kJH3wJyUp3v3o5vxk0e5OYYAq6J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978892; x=1729583692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmFcFRCIYAEw2190Z4FOUZUOyxlKcujKYWug46B335c=;
        b=dK8kM1GqVir/1a0wOmO9sXTN+fsbQtZLc9aIgJIuZFuh4eb1yGjEIAhYKyv/w5388G
         hbYAF4+vI97CwI1KV0rn5ohiFKcV7BEpjkjunixGJNR4/MHPpCD4716Bc4OriQxnbfHl
         +p82Jf+VHnLqcm/DMyGwm+yFN9isdhBe5PLLpfW9lEuPxn35mVjA8+lY+Rw/j0Op8KTt
         ZL9Mt+jkEt3vM3UWUyJbmDjpzU+PytHLoDo13lcEmNIzn3Lg5dXdLcl2L4rWWQ1gkmfu
         2GmLX7ngAVEHoO6ixT/GtjMYnAzCZVaHnCOI46BbdbYB6vNwfDbhustc6sdInzqXpMUG
         B9Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUrcYCe+p4Ibnt7fK+KgY6yFSXOhUk/w7NlPJ/RkUWcHV2X/Q6wegI0PKl8zuJICk0wMAyYYt+8s8h2BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbxi/RCFKR1Yn20/6WZq4dCgJJEFEmme7W9nkrMqrum0QnPTXb
	fGvsUR9HlAbgJgroJF+oDNkWaecHY8nb0TmD2r+NyB7qb1/l90+J20k1iZh2Me8NhpJ1u2Bt62z
	m5z/HovCq+KzXAECFiRQ81I/YR80d5IYqfyMX
X-Google-Smtp-Source: AGHT+IFUgfyLoHOaQbm6qbZAsrm98uAC9lIzeFdz3VvnKSPD4b56Z9J3TfdKULBQpAMGKGfWRGt6pNsyYRyR0zqkODw=
X-Received: by 2002:a05:6512:b22:b0:539:f8cb:f5e3 with SMTP id
 2adb3069b0e04-539f8cbf8a5mr3102219e87.48.1728978891625; Tue, 15 Oct 2024
 00:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014073314.18409-1-yunfei.dong@mediatek.com>
In-Reply-To: <20241014073314.18409-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 15:54:40 +0800
Message-ID: <CAGXv+5HV5EPvhFb6oFkRBSw-EGaccxDGBrW0tVDoWQR0RAAeiQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: mediatek: vcodec: support h264 extend vsi
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 14, 2024 at 3:33=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> The working buffer address start and end are calculated in kernel
> side currently, can't calculate the address end if the driver only
> getting the address file handle, not the real physical address. Need
> to extend the vsi to calculate the address end in scp.
>
> Re-construct some interface and add config to support extend and non
> extend at the same time.
> ---
> This patch series depends on:
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20241012064=
333.27269-1-yunfei.dong@mediatek.com
> ---
> Yunfei Dong (6):
>   media: mediatek: vcodec: extend h264 video share information
>   media: mediatek: vcodec: remove parse nal info in kernel
>   media: mediatek: vcodec: remove vsi operation in common interface
>   media: mediatek: vcodec: rename vsi to extend vsi
>   media: mediatek: vcodec: adding non extend struct
>   media: mediatek: vcodec: support extend h264 driver

This should be reworked so that "adding non extend struct" is not needed.
"rename vsi to extend vsi" and "extend h264 video share information"
could be combined so that you are "adding" the extended data structures,
not reworking the existing ones. Otherwise the whole thing breaks existing
systems until "adding non extend struct" is applied, making the series
non-bisectable.


ChenYu

>
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
>  .../decoder/vdec/vdec_h264_req_multi_if.c     | 516 +++++++++++++++++-
>  2 files changed, 493 insertions(+), 25 deletions(-)
>
> --
> 2.46.0
>
>

