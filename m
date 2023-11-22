Return-Path: <linux-media+bounces-812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 808DA7F479F
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FD15B20D53
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDA94C61E;
	Wed, 22 Nov 2023 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdLMBnnP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDADE193;
	Wed, 22 Nov 2023 05:21:13 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cf73e25b72so3323665ad.0;
        Wed, 22 Nov 2023 05:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700659273; x=1701264073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNGFlXpLeFTnJCRR6Y2M9TMyhiU71gt62Qctjghc6I8=;
        b=fdLMBnnPP6LoerFhnTOGVm+pI2puYNOvqEWNY/+Z7zrrdqDOWRZRBUMNx/pVJUc9cL
         fsDrkNvoXzEQP4Cju0aO4GsCB1jtLrFpH243rQASuD1TvjH8dhwoMQHBTxrX8rvkwIcP
         xtv0sIdydELCJH/Jje2xQo8uiJ5rj3OKvPTdPP9dh+xGDgANZuNpEGj2794fLyFCuiRx
         aXz/nIG8EjMjT8YM1TyVWvw9OKUGdyW7eb2BUcWsVShBS4xuHKUhkRG8CG9kqb8Vnt3h
         lo58OhTYkmeWPXUyPLLLPOcjBNGyPxG04bf7OqQhamI6yh/zyivlmZHFGhLkdKcA1ooU
         DohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700659273; x=1701264073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNGFlXpLeFTnJCRR6Y2M9TMyhiU71gt62Qctjghc6I8=;
        b=jV60AAHaNv+k7wgcT5FsHZTquP2dCJDH9oTqvBo10MtT0ux8zA+ebOrjS06J8A9z0U
         kYr7VPuHYIF7yDGkPVoek5HAE/XfP8BANy7yD558pfBXcUBdhbvOkUqcvi5kuUpsVgzq
         orm1HQvmA9fvQo6SDIQZ3TxmVY7dBTujei60gZNUIu0ryfYmvwZjqthXUF+yFXD2QQwi
         FQWG/gmZHa3eI3eM4hFNeBBETbGTk+FymoQXiquA4JDWLZWPIcgCW1GoPtTAtAX+YE8P
         EO8KtrIdvq3N5qEMcq8hxP2R7PDH3B5CbLsT3ypxszpk9sSVXZmEfhYt3mZ6ylg26nYN
         XHmA==
X-Gm-Message-State: AOJu0YwzZl4uWVMeCJ1d7y5aDInBACdz9DRHPWDKeW0vmHN+0RtmI2sL
	es1V15Z2VFSK8HYmtrhcLFUR8SigVA1RbwrtibQ=
X-Google-Smtp-Source: AGHT+IGzBPf4hDlXNcGQRCu8WY4gcdSOLM7a7oO6hsUAEw72nGXyHtvJtwrK9TdLMRMrIoNMgAb/QwNGirnNQOyx2Cg=
X-Received: by 2002:a17:90b:3606:b0:281:2d56:e751 with SMTP id
 ml6-20020a17090b360600b002812d56e751mr2322112pjb.0.1700659273253; Wed, 22 Nov
 2023 05:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-imx-csis-v1-0-0617368eb996@ideasonboard.com>
In-Reply-To: <20231122-imx-csis-v1-0-0617368eb996@ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 22 Nov 2023 10:21:01 -0300
Message-ID: <CAOMZO5AW0qft5ciGAWuX=RC0zHwAWEpLCyB5TbeE0QH3Nb+nQQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: imx-mipi-csis: csis clock fixes
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>, 
	Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Wed, Nov 22, 2023 at 10:14=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Two fixes to the csis driver: One to fix remove() another to only enable
> the clocks when needed.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Tomi Valkeinen (2):
>       media: imx-mipi-csis: Fix clock handling in remove()
>       media: imx-mipi-csis: Drop extra clock enable at probe()

Shouldn't both patches contain a Fixes tag?

