Return-Path: <linux-media+bounces-1362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EB7FD89A
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04DCE1C20E36
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 13:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF177210F0;
	Wed, 29 Nov 2023 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NprO9jms"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5980ECE;
	Wed, 29 Nov 2023 05:49:43 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6cd97c135e8so2670615b3a.0;
        Wed, 29 Nov 2023 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701265783; x=1701870583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Irh5FOLnUoxjszhCv8qONiTjS2UNum2n4pRc3UwW/QQ=;
        b=NprO9jmsL69zqT70ikC29oYlr5zat4VkLWD/ODW25U5mTcq9+thJGBSjR2cBoy5A6+
         CZdITro181FB/Pm80HqzZlWuAOGR7NvdSmjt802pOO2zHLhz6EdKBsM+QwxEHvnYHBun
         InZptYsPOLhiIjKi+a6uX4JXO8RCiZ/lPSE2k7CUiDX+M4qiCg3qn+YsE6t34YRRlVoy
         HspfovTJArWTCKRyn4s2aI82ATsZlGMcu23Ne11PGidaIjqjUmckGa4C2Rh1503osV4I
         loJeeTd6+GuJKV+NJwq3XuZgI6/1cTDNnMiZvFeIE5aGzeKLeRVVVA+Gcr1VIUp/eTj1
         PkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265783; x=1701870583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Irh5FOLnUoxjszhCv8qONiTjS2UNum2n4pRc3UwW/QQ=;
        b=mI/M+dypDYhfy/AZRtLGTRBuaUAiF2l8nCyLJOJOIi8doPBKT3COx1Q+Hy9laF4bZY
         FRM1kg8iJnV3pC4qR8FZGRXQ/a1UwBMiGP6GtuEnOZyjJwJSUpKzMDjjXgh3AaUdRktD
         XZMsmSLkmwYlxWeU8q5Khvqwya0H7OmHn/HtM4tGp0b/8muDcPsVQfXenuqfuslTgxlB
         pdSBZMz9zn/AODglacjNwm/xol0ZdWCAZhF+VdNdHlREqF2lhiqR+IvGXBU1SPC8+Qy/
         db7LfNgL/pm3EHbETEz2w35T9w1Kr/4vsU7YKxHJo1TeVawEbDV2/fJU/ESJJ+yn/v2s
         nlXQ==
X-Gm-Message-State: AOJu0YzNGECB+pY6mM7GUudXiz7GIrTBhVC8ZWJCgHMNTECDkzw2vvkl
	eNEdZLTr0Y7Rk4HJpWW6iXXjAin8LVGTLpshW4c=
X-Google-Smtp-Source: AGHT+IHwQ/nopwgshRkVmMmvgI9zzwEk3H+Qv8ke6oMvs0cb3CNtQT6uGhfEEDX0QL5kFKRzgZjUwvvEU0MxscBFGR4=
X-Received: by 2002:a05:6a20:a114:b0:18b:4c44:d09 with SMTP id
 q20-20020a056a20a11400b0018b4c440d09mr20615138pzk.0.1701265782677; Wed, 29
 Nov 2023 05:49:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129093113.255161-1-paul.elder@ideasonboard.com>
 <20231129093113.255161-2-paul.elder@ideasonboard.com> <CAOMZO5BPQCyCQKPvc9HHqANk5rKic25EkUGCjBdf-d78zGDR0Q@mail.gmail.com>
In-Reply-To: <CAOMZO5BPQCyCQKPvc9HHqANk5rKic25EkUGCjBdf-d78zGDR0Q@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 29 Nov 2023 07:49:31 -0600
Message-ID: <CAHCN7xJyqEN_3GFCRogii_ST3oC354CBG6d029HGRnBKh=H_rQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Fabio Estevam <festevam@gmail.com>
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

On Wed, Nov 29, 2023 at 5:59=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Paul,
>
> On Wed, Nov 29, 2023 at 6:31=E2=80=AFAM Paul Elder <paul.elder@ideasonboa=
rd.com> wrote:
>
> > +                       isp_0: isp@32e10000 {
> > +                               compatible =3D "fsl,imx8mp-isp";
>
> This compatible string is still not present in today's linux-next.
>
> Will it be merged soon?

Fabio,

Paul posted a series to the media mailing list adding support for the
i.MX8MP ISP:

https://patchwork.linuxtv.org/project/linux-media/list/?series=3D11776

I am guessing it'll have to go through the review process.  I was CC'd
because I did some previous testing before.  I have a Sony imx219 that
works in 4-lane mode.  I'm likely to review and test tonight or
tomorrow.  I am guessing he posted the DTS changes via a different
series since they usually go through Shawn's branch instead of the
media one.

Hopefully that helps.

adam

