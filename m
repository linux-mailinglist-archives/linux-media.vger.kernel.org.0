Return-Path: <linux-media+bounces-1372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1962E7FD951
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8452283030
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33726315A6;
	Wed, 29 Nov 2023 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK56JkMn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA56BD5E;
	Wed, 29 Nov 2023 06:26:38 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cfa3fe1701so13325645ad.0;
        Wed, 29 Nov 2023 06:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701267998; x=1701872798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7b2Nulvli0XXaWTRS/NHJL5IUXXuTTk42jEYJUffA4=;
        b=cK56JkMncQ3IO/CvPWE5OnfVm/LM5CigazbJJpR34THLZw4eajOwbS6q8qkyWqN8kt
         oZgfxzOFciAbDY6xX9PZ8VZMtta/3ZRwEaTeXXGG0nIXD87weyvRpZ/qwUdOq+ja9Rd+
         q8J6WunmXmT/sANVg5x0wYeFvq7IHSA/dxCdCYLhTujc/xBLBtd5edtweMujNhGjTo2e
         1QvwQqFFKOdpmvOyXKNihBHCoMEJ9Dj5WTiCfY1a3bQbFil4fC7jnRxqFoh/cl4L8JOE
         yAvtjVUiSeGqlf0n5fOzsOWjdMgr0mWNmgtuJQuiZ6PZspyK8iXrJigUUyiEufHqO0R7
         JDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267998; x=1701872798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7b2Nulvli0XXaWTRS/NHJL5IUXXuTTk42jEYJUffA4=;
        b=n6I6ri5aio5R0duVeCH2kP6wqJ56sytgQEo4bYaF3ub5xHMH0PFPmRtqj/8T3eBj6I
         gojn4X/GLJy2BOhcLUBdKrJ797jA245Tql8gMm7PE9UTzWAjI5tqY1uyKWskuMUqsjyy
         kL7knZ0IF5QvsLNbGiSo6i5x/hU9DEYawqevAmH/AtaLQMh5tNoBoe3OXTRU/+XIWyJ4
         YieVROm1Z7+sKoxD/XVrJITFCmnAW9UVr1vlBL8utRBBJRc69GNp6xQqzAGOAEQURqYB
         I1YrRzYCfkIifFAOrRt8L8a54YyHjXvuR/7qDX+UIWF/tzIACcCS3av1LhzrU0Gczx6+
         sRRA==
X-Gm-Message-State: AOJu0YxvRsoO/hRR37VrdSdO41xCfjDvYxo8qh34XLhuoRs/kc2MjMKm
	b83XO4/MowgtN3hNQDl0HsPVNl1hVqnQU4553MA=
X-Google-Smtp-Source: AGHT+IFfblq4BAWKNldtxNoPKOvbcayy5PLLTP8bX9iWs45sm5wkoDieDLx4KVZcLW5V7NBurSVUEknkL0zk/kA4/d4=
X-Received: by 2002:a17:90a:d996:b0:285:f76:9d6e with SMTP id
 d22-20020a17090ad99600b002850f769d6emr19191499pjv.3.1701267998176; Wed, 29
 Nov 2023 06:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129093113.255161-1-paul.elder@ideasonboard.com>
 <20231129093113.255161-2-paul.elder@ideasonboard.com> <CAOMZO5BPQCyCQKPvc9HHqANk5rKic25EkUGCjBdf-d78zGDR0Q@mail.gmail.com>
 <CAHCN7xJyqEN_3GFCRogii_ST3oC354CBG6d029HGRnBKh=H_rQ@mail.gmail.com>
In-Reply-To: <CAHCN7xJyqEN_3GFCRogii_ST3oC354CBG6d029HGRnBKh=H_rQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 Nov 2023 11:26:27 -0300
Message-ID: <CAOMZO5CfPR05LJodpsUERvPM3Z1dxPtxyYqDqNLw0Ee498QyMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Adam Ford <aford173@gmail.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On Wed, Nov 29, 2023 at 10:49=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:

> Fabio,
>
> Paul posted a series to the media mailing list adding support for the
> i.MX8MP ISP:
>
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D11776

Thanks for the clarification. It's great to see this series.

Cheers

