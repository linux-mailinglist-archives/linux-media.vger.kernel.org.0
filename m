Return-Path: <linux-media+bounces-1356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491A7FD5DC
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 12:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB871B217D6
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC4A1CFBD;
	Wed, 29 Nov 2023 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVS6CY6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337E6137;
	Wed, 29 Nov 2023 03:36:37 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cfabcbda7bso6086935ad.0;
        Wed, 29 Nov 2023 03:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701257796; x=1701862596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsTqxVq/HhioW2JTWiJZhbOniYNLafZW0sv5YW5xjcw=;
        b=MVS6CY6ZzwGFoNlPHuJNM/MH2CkSugOZokSASmoWXIujfAwpbf6J0rOf3HCGVo0GEe
         yOZyO3/BJ0RMsa7VSH+voGHX/3KHe71noGt2OUGhHlse2SpFXkY90NWQXqPxJhkqWt1N
         yX8mgsnvEZSpiCfJu/YiYoQ+9+oJJHcvkf3ZlCPSHRNPt90M6XvzSO/eLYuIT0AZcpRq
         a8mnsr9wFC8Gnc1YQZbMRNnyMEarikhmtaXQ3TJmKplyORhG9wgrxddLw7W4m0FyCu69
         gyg7JVjtseoskrMs1PFgizCTIJYlYchUNntGQohl9wU03OiBKO86m9ICtDv1nE+fJSp7
         1Jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257796; x=1701862596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsTqxVq/HhioW2JTWiJZhbOniYNLafZW0sv5YW5xjcw=;
        b=XFRvn9Qyt9nzVn/TTQf7JtJRZgcLe55+SbjhU2FPrtG2QZn4wOkHI9Wx7f6PBWIgWT
         ZcNuASViTv4FYypGnsYcf+lSkebfq8xArxBziWlpgoE1JzzzyeGObJ0r3W38ab1FHP3i
         87yd7zyt5lJCL2HbJd27FYsr7rS1d7MT9UBrnJ2pHzXVTzQrszh+SMaUtTl/jz5NzuI/
         J/6xaBGifWp5ZZamdnIdPmLXl3sqfP6U7+xkj90P91POnk2ZVxKxFQBYKJabC0sEtM84
         gdCL0ckpEpj9kLeGxh2wkHrfOvr9zQFWZKzONExTQZ4Tq5JRo4c+7h/QVAUPoS3+4nkn
         ogBQ==
X-Gm-Message-State: AOJu0YyN7faNw9lGCThyMwDcap1EI7Lcu5XdQEX/uILrggN8xbvoWjCv
	Zt1+scAfpKddwc4Xo7pjaSSSi1GAOl7PiYIN8EXJjDMtfbk=
X-Google-Smtp-Source: AGHT+IFgXuDZYe56dvUjntjxMeoPtvwsSizmgf1EC7O1I8uWWAxbBkCdKOux7Imnul9wYk9scmPGGkhAOGrJYURUsfk=
X-Received: by 2002:a17:90b:1e0a:b0:285:b6b1:a2bd with SMTP id
 pg10-20020a17090b1e0a00b00285b6b1a2bdmr16044087pjb.6.1701257796420; Wed, 29
 Nov 2023 03:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129092759.242641-1-paul.elder@ideasonboard.com>
In-Reply-To: <20231129092759.242641-1-paul.elder@ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 29 Nov 2023 05:36:25 -0600
Message-ID: <CAHCN7xLgypy8YMhxM1g27DWU7hY3nwAYLYRSMMDtODeGdd_CQg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] media: rkisp1: Add support for i.MX8MP
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:28=E2=80=AFAM Paul Elder <paul.elder@ideasonboard=
.com> wrote:
>
> This series extends the rkisp1 driver to support the ISP found in the
> NXP i.MX8MP SoC.
>
> The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1")
> and in the NXP i.MX8MP have the same origin, and have slightly diverged
> over time as they are now independently developed (afaik) by Rockchip
> and VeriSilicon. The latter is marketed under the name "ISP8000Nano",
> and is close enough to the RK3399 ISP that it can easily be supported by
> the same driver.
>
> The last two patches add support for UYVY output format, which can be
> implemented on the ISP version in the i.MX8MP but not in the one in the
> RK3399.
>
> This version of the series specifically has been tested on a Polyhex
> Debix model A with an imx219 (Raspberry Pi cam v2).

I have tested previous versions with a imx219 camera running in 4-lane
mode with great success.  Should I apply this series against
linux-next, or do I need to apply it against something in the media
tree to test?  I hope to test it tonight or tomorrow.

adam
>
> Laurent Pinchart (2):
>   media: rkisp1: Add and use rkisp1_has_feature() macro
>   media: rkisp1: Configure gasket on i.MX8MP
>
> Paul Elder (9):
>   media: rkisp1: Support setting memory stride for main path
>   media: rkisp1: Support devices lacking self path
>   media: rkisp1: Support devices lacking dual crop
>   media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
>   dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
>   media: rkisp1: Add match data for i.MX8MP ISP
>   media: rkisp1: Shift DMA buffer addresses on i.MX8MP
>   media: rkisp1: Add YC swap capability
>   media: rkisp1: Add UYVY as an output format
>
>  .../bindings/media/rockchip-isp1.yaml         |  37 ++++-
>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 128 ++++++++++++-----
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 ++++-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  66 +++++++--
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 +++++++++++++++++-
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  32 +++++
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  27 ++--
>  include/uapi/linux/rkisp1-config.h            |   2 +
>  8 files changed, 398 insertions(+), 60 deletions(-)
>
> --
> 2.39.2
>

