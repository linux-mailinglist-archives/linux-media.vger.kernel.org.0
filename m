Return-Path: <linux-media+bounces-44309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA4BD3FE8
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 17:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1965B3E81A0
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B192272801;
	Mon, 13 Oct 2025 14:50:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1A71F91E3
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367048; cv=none; b=kjGXB60ORMapaAyy+9CYu1gxGAvhDrGGjHSxxNLd7Acp2qgD1RlDtAX12blX7s4hnnDHaB0x56rtRykYm716oqYeVTzJWLbR6idethktNmpnWd2g8quwqWefx0BlczmCzS7MC6MBo4r0bNaMYxOTScUPG/MhZSdpRneG5zUtOMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367048; c=relaxed/simple;
	bh=a8rzeaiQ54tOFcMOe+sIUa8tfmcif5r7xjlXNM2RFaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILGdmjGFGknhY0Mp4dEK0zMQrNTitD6U2Y4jHWtwrk4K7MmJ2CXIe+dVLoSaa33T4ZiV9G4/hE2Ir5TOUJj6pZxTg/qvLkJyeleDOkZrirLDYPfB7akros54TB5eBy/gVn6EPgxeCXFgzMfW5MaZ2sKX19H8K9Jr8aZ+ASd97VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-86278558cdeso583009685a.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367045; x=1760971845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BF1nvJKgerbunlxq6rI58NsjqwKmmQvTj5E3RRtPIQ=;
        b=ZGGchRfofUqSJ30Y3nThhVuohV7eYS0AORyRXE10YgqG8ZpmGdioD7+7cb9HS5/M/l
         7gaoybSV0tHlfIuYsP0f1qM6HRWz6kZu6vTwdVw6XK/tWDI02kor8FRp+7hFg/ptkHln
         DfmuRxB8gK4CoOwFMLqqkFn3t0ocGucNIi22RFWVS7ARzjxKygkix7HKWgbQY+EbiwdF
         Db9y2oG8fgdV9yR4FEK3lerQISc0KJyn6GCsWAzL05khNRS2Raxs+XVNtjI2KuOilhT3
         zqLn4KxHC/AC7MYr1UpY0M5Babb6qy51VmAtOS0v2rQQ3SQOhKspPcHgCRVJI5cUwclg
         illg==
X-Forwarded-Encrypted: i=1; AJvYcCUCgVQPVCyPuVxkeVspKtQC5d5csK8DSlxyzOxY1MR1PoVHEiQLjIMvFAvSc3Fa1MkOoGabTXqRlXdrbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx58BAYxCoUzb9+/M8/KoIAKMVHyShKv6JY6iQ63J5kSnr39En1
	u1QIPJIJgI9neXROK3pZEQ/vRB2wjdcDI+iiJwC1jDgc+gA70VesDQCR8Fb/+BZ/
X-Gm-Gg: ASbGnctlSWVPQaiv5zse+W8CVktBK/HUPFiHx0o9JofhnGB/V7VXAywca5f2FOTCqCu
	VNHwQbbPwhI0jX+ME/10tbIrZa+I/d5mAQfqFVeFwfz9yZvfULK0FzcrtxKvw5VtKvBl09eVP8U
	j/CTG/uFnbrzbwAZ1h0D/f+ETOGl+WzRQgXPCgdCkHvnQVuFAECyH8arukkQGfQ3Z2DtLz9lIc+
	LvE545OhxjEFSVxL/ekJpOQZ+f8XzHmCSRereGzIW0eRJsTYSZsQGG5nkupSNIXVOkZQCgIkEyl
	R0OZa9hnFExCcbhrQ8UVucS6JeJ5ss/2ti6hL2fhJld5aD5tbj9/BLrynFSVW9qvAO3inc3JBTT
	JXEJlfqvf5rxKXf2J9PhUFiOF9G4N+jBge+FSVQfb0WUOTJQY5gyMoJ7nlOzddYMcQSNmB23W4w
	iqQbs=
X-Google-Smtp-Source: AGHT+IEVIsLcKEjCPiZ4WyWVrBQJQszolIeA68FVpbISeX/AZJ5AcdYJiWn90fDFl5PIlKlfs3UagA==
X-Received: by 2002:a05:622a:1341:b0:4b7:a308:b5b9 with SMTP id d75a77b69052e-4e6ead76899mr309695461cf.46.1760367045460;
        Mon, 13 Oct 2025 07:50:45 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e70d134a3csm67478241cf.9.2025.10.13.07.50.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:50:45 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-80ff41475cdso88455906d6.2
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:50:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6XVCYCEeZ4ftX+iWaIlFJkC96PE6nAdU6euYX3WjFWjtwsy1mHIUN78+m+pOvKmQDywS0qbXUCbuMxw==@vger.kernel.org
X-Received: by 2002:a05:6102:598b:b0:521:57e7:3b19 with SMTP id
 ada2fe7eead31-5d5e23ad946mr7466194137.25.1760366582403; Mon, 13 Oct 2025
 07:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:42:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
X-Gm-Features: AS18NWDbEQGWUFg0r_aGxPQP6vUjubUz4v9cHDpfk8kXxZq-lj2695LEwK7MQ10
Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
Subject: Re: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 16:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>
> This patch fixes this cocci report:
> ./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

