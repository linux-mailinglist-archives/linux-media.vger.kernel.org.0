Return-Path: <linux-media+bounces-20807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9499BB9ED
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 17:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD6691C210EB
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 16:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E261C1AB4;
	Mon,  4 Nov 2024 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdwUCbNm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B232AF12;
	Mon,  4 Nov 2024 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730736762; cv=none; b=FMRbxXm9KiYSHBs8BZlXhPLqdBOfYc7aJXM9nUWekZcNh/ez7e6VTFtMIHw7EearhZ6q9TcjJuk3s46Tfo67eTKdYu7ee3KRfNnvB1pqwL/ee8vEA/ZsWaPQZncWOO/ZLUYFRiw7zKRmoOLKApsKzn3aA4xVAKlAzNuf4wgZq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730736762; c=relaxed/simple;
	bh=CSI8nmFVeCBUZm3j23aCaLtGEVXGHX7F+EO7hopFI+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqMQAfuMxzXqitz/FM5fD3pE29f2W1C5eQswkUymYVfwAwjPXr3NCHwAkQ22sM94sb7Jj7u0x8GU85Yji5shtuZaLGaxoODGNHunxvcQtBKCF87e0ELuqfc2BcnZxE4xw5bIjd3Ui2qGi8UKlkEbdCdp349e8lu21VUVWCd2KZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdwUCbNm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D564C4CECE;
	Mon,  4 Nov 2024 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730736759;
	bh=CSI8nmFVeCBUZm3j23aCaLtGEVXGHX7F+EO7hopFI+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdwUCbNmHML9PrNRdfy29kUrRCJ+UtUsiVXu0fQDqOvjEDs1MiwEtWWsiE4TNtwCr
	 15ttqIq17BRC9+3YTw8CQf1lIqQSb8DpE8Aqd6NFQjCvWdh6tnVjypmIbECUbk5EqU
	 Rs+HYZR/snvujBQGJylaQ71jiUH+YmzyUYqQsTU8tzG/jq3jInKe5RrOyUeoI0BRrr
	 X+OVVN4KzoshoecdzH9MWUr0wVrs2UhQpRNybBQbQKg6EFVcIJQG0KZrZgsd859jzN
	 WQwHpxAZZwXAIcnelk0ZpR10LFHinC8ACu2kJ9+5k8K3burokUgzCmfAdxnBjizLpx
	 gTsgy9KArpFbQ==
Date: Mon, 4 Nov 2024 10:12:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, tzimmermann@suse.de, mchehab@kernel.org,
	mripard@kernel.org, geert+renesas@glider.be, jonas@kwiboo.se,
	nfraprado@collabora.com, jernej.skrabec@gmail.com,
	kernel@pengutronix.de, prabhakar.mahadev-lad.rj@bp.renesas.com,
	quic_jesszhan@quicinc.com, Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org, arnd@arndb.de, neil.armstrong@linaro.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org, s.hauer@pengutronix.de,
	tomi.valkeinen@ideasonboard.com, shawnguo@kernel.org,
	simona@ffwll.ch, will@kernel.org, conor+dt@kernel.org,
	marex@denx.de, quic_bjorande@quicinc.com, andrzej.hajda@intel.com,
	catalin.marinas@arm.com, rfoss@kernel.org,
	sakari.ailus@linux.intel.com, airlied@gmail.com,
	maarten.lankhorst@linux.intel.com, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, hverkuil@xs4all.nl,
	biju.das.jz@bp.renesas.com, festevam@gmail.com
Subject: Re: [PATCH v5 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Message-ID: <173073675713.309604.179338628102616229.robh@kernel.org>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <20241104032806.611890-9-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104032806.611890-9-victor.liu@nxp.com>


On Mon, 04 Nov 2024 11:28:01 +0800, Liu Ying wrote:
> Dual-link LVDS displays receive odd pixels and even pixels separately from
> dual LVDS links.  One link receives odd pixels and the other receives even
> pixels.  Some of those displays may also use only one LVDS link to receive
> all pixels, being odd and even agnostic.  Document common properties for
> those displays by extending LVDS display common properties defined in
> lvds.yaml.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5:
> * Use patternProperties to define port@0 and port@1.  (Biju)
> * Require port@0 or port@1.
> 
> v4:
> * Squash change for advantech,idk-2121wr.yaml and
>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
> 
> v3:
> * New patch.  (Dmitry)
> 
>  .../bindings/display/lvds-dual-ports.yaml     | 63 +++++++++++++++++++
>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +----
>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +-----
>  3 files changed, 65 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


