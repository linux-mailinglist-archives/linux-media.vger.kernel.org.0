Return-Path: <linux-media+bounces-2927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3781CF66
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 21:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2721F22EF3
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 20:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07E02C1A7;
	Fri, 22 Dec 2023 20:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmHqVMNF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C71E503
	for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3995921e4so5497885ad.0
        for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 12:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703278624; x=1703883424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q4uF7oac6CDiL73+wWvY5HOgsCzmWVIw8k/sWK3dVM=;
        b=mmHqVMNFJBG2HLzPeGiiNrjeA6xhHFMG8Xu440MwG7J700drEJgwoEQwAvZWotF0WG
         0fjUey3rVQWFtJZezFFN/bT3enNikiZFM32ZOvZdp0QSyOCdxBosMWh2BBUlCw0yu5t9
         tuAKkBQTdCvKSItKcJHrmkW2l0HTjnxs/P/rpPbpUr5pRRwdMoulqmSLXvOwJL1fMZ5a
         WOmmkvOazIdJWc/ZnatdAm4SsdRf/aFsUoLFyyeKEVuwo+kRmgepCZyHPERBK+zectOz
         Yw0VkxqNqC6ZVBLQZboRfdP+9iyuDSwTGrotp4Wo87hccBXO5A/8FwtCszyNAv4STDOq
         NeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703278624; x=1703883424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6q4uF7oac6CDiL73+wWvY5HOgsCzmWVIw8k/sWK3dVM=;
        b=GGyyrOV1Xq+RtpOWwSJAIyEBR/CdxUAaNHxoJvu+pD1mgSfK5bouuATJ7kKh2fR6L+
         uSJW3XT5BdyXkjJn/M+w3Vw/XqQDZBSG9+y2T752d6w6fMO7o3Mps0uWW5PmtvhsVyDE
         iioWVXMN4Skd5QeSRO5ODYz4dBzQtY2EEIFWLmDbJqG1ZiBmMrSfwRjXUClWy+f9ocV0
         RP2nSJZetigmVBTFGrdLuDIu6EJu2uY+Xagout0TMA1iFOI4dQ+49LiTMaoPtqn/HAkd
         GMlcjlQjLnuzq8xyK9tVLFTE0d/oTqxndIjGy0L2xsQZPq/rSyua+dreksk2aE9GazSa
         /dxg==
X-Gm-Message-State: AOJu0YyikyVl7C7eTfjHAYIYagBfW+S5zr4KtaUrXy+fbgJHCQ/bioHe
	QBQbSLs18KokQG8JUVUGITyUPUb13EuVNndFId8=
X-Google-Smtp-Source: AGHT+IE9Sua+dxayUyQA/OJK4+AJyYeSTfjEVRYS2Lr4olL2XMxRF/TsJIWkPoJ0yptx+6DwpstYnl24yjW1jMZnKm8=
X-Received: by 2002:a05:6a20:8698:b0:194:db35:767 with SMTP id
 k24-20020a056a20869800b00194db350767mr3139231pze.2.1703278624228; Fri, 22 Dec
 2023 12:57:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ+vNU2Kj=a-_xDBsNO5zkyP_mgLsVtA2bXqkAkpmCQmVEA_=w@mail.gmail.com>
 <CAOMZO5CX4xuMvZDMVEND0vpMyuU7ozDm2pk+yVQZAKLenipY_g@mail.gmail.com> <CAJ+vNU3FUMBt7WyEJHJFkgjUViTUjS1EgeVt49CcdN7dgtaMfQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU3FUMBt7WyEJHJFkgjUViTUjS1EgeVt49CcdN7dgtaMfQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Dec 2023 17:56:50 -0300
Message-ID: <CAOMZO5AGLAxeRfya2EJOMghqE5cvqZtqPAz05oMfFJT==F6PvQ@mail.gmail.com>
Subject: Re: imx7_media_csi probe deferred
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-media <linux-media@vger.kernel.org>, 
	Schrempf Frieder <frieder.schrempf@kontron.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 5:51=E2=80=AFPM Tim Harvey <tharvey@gateworks.com> =
wrote:

> Fabio,
>
> Thanks for testing. Is this with arch/arm64/defconfig?

I modified arch/arm64/defconfig to only build for NXP i.MX.

The resultant defconfig is this one:
https://pastebin.com/raw/6dFx3tfp

