Return-Path: <linux-media+bounces-49733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AA7CE9CF4
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD65C3027DB2
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1026723F417;
	Tue, 30 Dec 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/CaK/az"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958A6211A05
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102180; cv=none; b=gyK9wPLk8h7KnVdGYD9GMAjKngMWwhTD4i6tEnAZge5vkhGVoJQuc+I2SjWEup7gbiyyOSuQfhUKXYGPw54aKeWANUsOTvHYqlar9mQbojwMg93cpkDNaEH7jg4aSCZYa43vw7ynuWgqrYQrcLKuvqsghH6kuYg/VUfaRZ05iCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102180; c=relaxed/simple;
	bh=p9KA0nl7i5BOX44fhmZtO/USDE5WvOuDB+Z4A54etQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pV8f7d8WeUGhGgHhIc8ejAHrKMjmpWLzmZxlEuOSdoGQIv7XslppDfdzdsnzps1xOBVMURFtRJ1SExRiWVW0jWKrLsli2A/OZfG2arWNo8syx5l4ygpIyxFaAeUGY9pRbEIQIPXuUEiEFpSgEol6NOIaVch+DeDAyGFGJp2i6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/CaK/az; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a2dced861so104414461fa.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 05:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767102176; x=1767706976; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tyh9F0v/N7VJ73nDMsYJeC2X1fSpa5QMqgohH2jcBGI=;
        b=K/CaK/azINT29W2/QclFjpWikWH1eKfo99e9uLLKLaXS3SduyDUBDhqcDwl7yXHmqs
         jx4/9dRaXmX4i+n8AOHaFR6l4io8NoTrYi7nSrbR87hHSehYjJFPm8n0wyCyP82nryOY
         XeD/xtOdZ8JhfUB4Rj7vLE/MbXUUPk6kFwsGhYibpCY2kfYBMsTEJiTBrfHQ6We0UPST
         XjqQRydTXe1f9eVcx2GccH3eI2eKkko0Ci1XhDqjY2/Lca7J904K4D+01JVMN37mLylc
         +2ZlRKN3+K6bGjAojw1DlZaGJp9ZjvTFQTI09DV+oHXw6eMmSLKEzUlCLLt670DwdHsi
         OB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102176; x=1767706976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tyh9F0v/N7VJ73nDMsYJeC2X1fSpa5QMqgohH2jcBGI=;
        b=SePBUs98/LD9jlg2/Nz40ZBArDcYx0CqjrYmgWc3KeMuHisRBOTd9jAfW/Ge5vZbXc
         cKD9T73Gt1YbnWLZGd7Mpkm39m/BRC2KKDinBbkoqrPakYaZEnJSQKeWRW/hwx8cjVY1
         qvRw2xLjw20mHmosOWUJrsNo2LdRlryH3qiNJEmO7WIQ0gUxn57qaU07EG0WHMQONIyK
         iVMx3gma7SQiP8N7BYDuoIt95wibqAMNJGTJmjvJ/Wxg+kRZTWtzoY6yyQdg2pHQd0yE
         oBeH4em+j4XQhXfEZ1aM++UiHQs3yWuS8I51B/Wcq6pMa/3CvMhS/2Shl2x83ljGibey
         DWqg==
X-Gm-Message-State: AOJu0YzlLIotAwcRVSkB3CNHl5p4kUcYtOSzvWt37MD/mgxZtsGxcj8d
	mGMB1h/2EADsgSBfBghsrhdBv5zc+4QcgJax2H10t0BfH5hP7SVv01K5blpWj8eobHSd782h/dg
	ZKBSVASvEmuk7blFtiXx3Rst6YSeZPJQhJuCqutMhKw==
X-Gm-Gg: AY/fxX502jVeW5ovOt+JK6EJMKba2GntRD83XxFLGGlC5sVDwRbhdq0cLfykp41iWRS
	KH0qccrcLIs5x8EnOizKpQeEalO3iefsUDFOLKirlw7Y8HpkVhYyvZ7B8+N3c4lmwm3fRNBeipw
	c26GgOhgDpYmieeNfD7N6iA0W4toSw6JRFDjB0KiA6sz+dvYgXDQM+BXanJURGZZ/P0BhZXX47C
	VsgWlaXMPM11BW0kd+Ode7XGzN0LeK4+AVlcer2p0MGdyRCJBiuyO5DyUMYGOjU5fifUBVsoFcn
	S6NErVU=
X-Google-Smtp-Source: AGHT+IGnsU8hNigKaB6hVKDS7nf4goo4fbF6JJBGTSO/BU8M8fMqqI2YvS58YCByHu7aYQAfLz1NJS8b8AXypc1f7ZM=
X-Received: by 2002:a2e:9a09:0:b0:37e:7a16:38fd with SMTP id
 38308e7fff4ca-3811319d043mr116531121fa.6.1767102175653; Tue, 30 Dec 2025
 05:42:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com>
In-Reply-To: <20251205015428.643-1-ming.qian@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 14:42:18 +0100
X-Gm-Features: AQt7F2rVMfuvBZZs-hEcQQIpTtPZbAaFhZv2Z89dF-6-qgfGMGI_jCUJA6HlFl4
Message-ID: <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Fix concurrency issues between G1 and G2 on
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
>
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> On the i.MX8MQ, we encountered some concurrency issues with H264 and HEVC
> decoding.
>
> There are two main reasons:
> 1. The vpu blk-ctrl don't have separate reset and clock enable bits.
> 2. The g1 VPU and g2 VPU cannot decode simultaneously.
>
> We attempted to make corresponding fix to address these two issues.
>
> Ming Qian (2):
>   pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vpu
>   media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC
>
> Nicolas Dufresne (1):
>   media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
>
>  drivers/media/platform/verisilicon/hantro.h   |  2 +
>  .../media/platform/verisilicon/hantro_drv.c   | 42 +++++++++++++++++--
>  .../media/platform/verisilicon/imx8m_vpu_hw.c |  8 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 23 ++++++++++
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c         | 11 +++--
>  include/media/v4l2-mem2mem.h                  | 21 ++++++++++
>  6 files changed, 100 insertions(+), 7 deletions(-)
>

Can I pick the pmdomain patch separately from the others? Or does this
need to go together?

Kind regards
Uffe

