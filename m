Return-Path: <linux-media+bounces-50842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2AFD2DF57
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24D15301C0B7
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA672FFDD8;
	Fri, 16 Jan 2026 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCptigFF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920E8238D22;
	Fri, 16 Jan 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768551802; cv=none; b=QOU70Wp1/gUUJ/oSA7mJXfOXbHyfcOh98ePBlh0GenkOfBVIeVA4/9ocHXcorNRu8MAR0M8rJ4uoOh82qm/pKg4JI9dg/LcWTDWfo6IROtFxTuSO3z2TIj2w0sPDTbysfOIP0/W2MjBDecCwWiqzTnb1MTBQ7k3Ed3dkCRBeyvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768551802; c=relaxed/simple;
	bh=S1kIUZKIzsRuosOO161eQC66tPw79XmUGVuFAOWHQ/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG/mdJHPLo+gmmXYgb3b8S4iOhLy86NaJU3FHZG/WLMviOXoTWazONaPMP1EgZEuPuLqoI74R057UiV1EiWrP3/Gd80DlApSMI6lgshWuV8+Prg9dQlnEdOOFbYh+2DnLC0XNe5MoItIZeG2iUdqy9AhnsDQ1u6ZrHnOMiFOBqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCptigFF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E74C116C6;
	Fri, 16 Jan 2026 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768551802;
	bh=S1kIUZKIzsRuosOO161eQC66tPw79XmUGVuFAOWHQ/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCptigFFnLQ71JdSojmjSSSH3PChgvA/bck8jnhpZjM6/5o5a7Ae4LmLEdi51uReU
	 uMD1VYcdi3o3H/iOp0/iTAffYsqBu2wvQnG3a7UA9cIAEhkG+FVfVC6S0KogolbJzx
	 bmSVq/Fd94J5kV9Q7D5QW9qp2W7iA3rvvQ7PUHtI5jPLDV3bqBXGm3RJuAjhlqflrz
	 u+wqjWzUlGePdVwwuiwQ08NmRbc5Tb6ynrWhnLEYTXVJG95hf1IWGodAq1QIXkd3BS
	 PBdFFFCpvKSNhpgrKFslu9f0888sDxU7mLtD85wRUjsucnuGBlwA+ApZYe8KIhBBOD
	 SPmSjkyIs051w==
Date: Fri, 16 Jan 2026 09:23:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: add rockchip mipi csi-2
 receiver
Message-ID: <20260116-alluring-chestnut-ibis-5cc776@quoll>
References: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
 <20251114-rockchip-mipi-receiver-v4-1-a9c86fecd052@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-rockchip-mipi-receiver-v4-1-a9c86fecd052@collabora.com>

On Thu, Jan 15, 2026 at 07:26:07PM +0100, Michael Riesch wrote:
> Add documentation for the Rockchip MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 147 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


