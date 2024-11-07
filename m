Return-Path: <linux-media+bounces-21032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFA59BFF5F
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EAC51F22609
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 07:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC9419A2A3;
	Thu,  7 Nov 2024 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OHuNbvct"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75833191F9C
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965765; cv=none; b=LpCck7pxGAPAPOg6rcA27tuLGtaEGj3IGljMvpcebez4PiTCYS7PT0wgl1ZoRCrFrMD19W9PuNhtPlacTWTnK0rsWdw6j3UuY4f2IEYCnQlmKsSHsWm9ekJh4rWwAmOSCTBTHW2yeiNO9l+8+PGVKxXmdrB55049eBVTR8JDZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965765; c=relaxed/simple;
	bh=Z5KIa5+EjcYXaQtJ5CUKjRCce+Nn4x5tsG3QRpALwRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QT4C6UVkucZnSfkXdjrKx/5oKdcQaHM/oU2xQfygKq2xf7NaTlC0BUbnXSwjrfQ2dvaIbrPJKL58HGxeXlhXgLZrLFluBWL5QgRI6CpCAmq605aY98DST6yjKAlXwCD4rX3RbpAG/+Lqix4wmy56PC3ebmAAEVp7Sl7/oJuFVeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OHuNbvct; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fe02c386so1547747e87.0
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 23:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730965762; x=1731570562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5KIa5+EjcYXaQtJ5CUKjRCce+Nn4x5tsG3QRpALwRQ=;
        b=OHuNbvctu8vBzcDDUrwSu2OJvVy8Tkncf+rvvfNc+pbkub/JY18xzUzWqpa2TQI40D
         j0yxdvJxcGw34ZRr6/vtNBXAoQpWQ/XYAvD3aMFdsUsscFzH7d6Oy1Z7EeD2EKaCuC8q
         CKtQnuUzsKT9OxSCDQjruh9lNXDNZWrjW1Wbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730965762; x=1731570562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5KIa5+EjcYXaQtJ5CUKjRCce+Nn4x5tsG3QRpALwRQ=;
        b=iyM89CY1XohawlxL/Ra7P4YAdFQaydeBItE4bDZkKBua+Sg4t4LDZrGJ4QJN2OgaKI
         bfTdSLgDANdADfQ+655AGak40FJZ3/M7vRvQXIGkkBysj9fZaBzQw4KzsX7Z6iXIsDyw
         VnzASfbheiE/WWcHpSfudq07V84DFHi5MkGgZI7EiAcjYzxaEUNmfrggikV5Hx5sMo/c
         vTbV94Jf0WiKd9JgGJTlGy2WbQ3LCTg5PTHfCx20eC8ygeBWzy1jWr9AuCIst75EUhpC
         KY1dg0RlhD+57SCjOKVVCYEjw3VuxBVcOEOsdu+Rqc6WDzCBj/xNIF+5aTYtKBlymyh0
         lbww==
X-Forwarded-Encrypted: i=1; AJvYcCWBB6vIRTzbAfc1ZuebpqSb5zOnafVwWcfHxC8u2MBvtMUZ6VmMj1s9rxvYGzaBVDW+7TluysHjkGr4aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGQCE6qS0UmDhifh3kS5WCUdmd5BwtBB+jTY1RvlsCPf4EihKp
	m93UPVrxkrgQpM0i09qMhQQ8iXoY7JcSujBlw1nD13P9A5YhnbDI/PpTpXl/4aiEstQDyx5vuFP
	0oXccYc+LHLNsHbPtwyoafUxRkbig4TbcBZ9O
X-Google-Smtp-Source: AGHT+IGxn2pSbneZDHgWnWUCDZaUop/6c6chaGYhHrU991goYLF9CZhKqopx6hRuSSwvbSM+DLDtcwV7tpySQOVxgHc=
X-Received: by 2002:a05:6512:1086:b0:539:fcaa:d0ca with SMTP id
 2adb3069b0e04-53d81971b63mr724012e87.13.1730965761512; Wed, 06 Nov 2024
 23:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107074603.31998-1-yunfei.dong@mediatek.com> <20241107074603.31998-4-yunfei.dong@mediatek.com>
In-Reply-To: <20241107074603.31998-4-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 7 Nov 2024 15:49:10 +0800
Message-ID: <CAGXv+5F3+65gTsmz7Dzrm3QchmKnTECAGzLwJW9uT5aM_jLeMw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: mediatek: vcodec: add description for vsi struct
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 3:46=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.co=
m> wrote:
>
> If the video shared information (vsi) is changed accidentally,
> will leading to play h264 bitstream fail if the firmware won't
> be changed at the same time. Marking the shared struct with
> "shared interface with firmware".
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

