Return-Path: <linux-media+bounces-41113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE3FB37ACF
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 08:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C3411B618AF
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 06:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD9C313E16;
	Wed, 27 Aug 2025 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="noD4En54"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88459C133;
	Wed, 27 Aug 2025 06:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756277494; cv=none; b=hUO9X5gDHOF0SuksHDXuDhVZNyNHEMkBZOXirsl2/ZzPojXnHRGCdgde1tlbZHRmMRZ0IwnhGdBDM/rE8DtJfKwlm67f5wLutdmn41tMbPbJDDbPcxOwOjeRGvZxidMsfVNl9KONMYnst17ThXnmHRRiXP8ItwLxvUioZljo5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756277494; c=relaxed/simple;
	bh=6n/bITa6vrmP6YxQjYpYAvl0pURUaNYm8xkK9JCAWa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igsb6r6SMzmgygpw9SXboPfAichMZeUCD61X7Kz1dW+dFxFJA+o6qXQbywbF/8X5FZS8MgPacfWplniQCuxNVfPS3mjYCB3kNBTujs2z23NgfTClzdDDLXC7yZbbQaUvnL9CRkU7VfLVgaUPrcG9RzGM7K0qsNHik/5CD/6/4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=noD4En54; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=6n/bITa6vrmP6YxQjYpYAvl0pURUaNYm8xkK9JCAWa8=; b=noD4En545Nt/MdX0PP6isfTCIm
	nzzsDKAnZVdX0JQAaI/cY0hmmj4qQ34OFnMnfj7gzvR749DUPsZVAeEENOUrNf8dKgsSdc1dL40yU
	+d0TrjSv0RRgNY4vGdZsMDDw25760fIzo77/LhnS574eAc0b5k+ORFfbAiN0RQPdenFMW+P8Z1X9w
	5GFOcifgnTV1kJ/hZzz9Wlnp5vsuXy09PlBO/bUJw83SEhZ8NgZ7fQnv+H1Wb5sUceVheNheVV1RY
	MjHOsf+fHlCaRlT+ByUybYdRFVjjL0KSbnpcQBFbT7Qz3xhL8DPpssadKJbxiZpdtux/aYJKbb+4B
	VxCNnEnw==;
Received: from [213.244.170.152] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ur9ze-0005xU-Cd; Wed, 27 Aug 2025 08:50:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject:
 Re: [PATCH v3 01/20] bitmap: introduce hardware-specific bitfield operations
Date: Wed, 27 Aug 2025 08:50:49 +0200
Message-ID: <9063025.MhkbZ0Pkbq@phil>
In-Reply-To: <20250825-byeword-update-v3-1-947b841cdb29@collabora.com>
References:
 <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
 <20250825-byeword-update-v3-1-947b841cdb29@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 25. August 2025, 10:28:21 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> Hardware of various vendors, but very notably Rockchip, often uses
> 32-bit registers where the upper 16-bit half of the register is a
> write-enable mask for the lower half.
>=20
> This type of hardware setup allows for more granular concurrent register
> write access.
>=20
> Over the years, many drivers have hand-rolled their own version of this
> macro, usually without any checks, often called something like
> HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> semantics between them.
>=20
> Clearly there is a demand for such a macro, and thus the demand should
> be satisfied in a common header file. As this is a convention that spans
> across multiple vendors, and similar conventions may also have
> cross-vendor adoption, it's best if it lives in a vendor-agnostic header
> file that can be expanded over time.
>=20
> Add hw_bitfield.h with two macros: FIELD_PREP_WM16, and
> FIELD_PREP_WM16_CONST. The latter is a version that can be used in
> initializers, like FIELD_PREP_CONST.
>=20
> Suggested-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



