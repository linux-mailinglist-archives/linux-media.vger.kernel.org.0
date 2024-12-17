Return-Path: <linux-media+bounces-23539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC69F4370
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76A40169016
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E0C15B543;
	Tue, 17 Dec 2024 06:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvnjVI/3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB38BF8;
	Tue, 17 Dec 2024 06:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734416415; cv=none; b=tiyfL2GAkcKcmt7XMcHcHJCOv7Nf59AoXGkZgyzMBcyAcxobRuHZ5kPSCAagkth5xaOwOH7zW0DQPnlrDKOSNbyoHjc/FAIc2tFA2psT2hYK2CWK+TZmDSLh7aSn2PZfYLGRmKjYZS9R4i4VdGOWhVE82uG5hnNIlteUSNfPVtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734416415; c=relaxed/simple;
	bh=rqXWB3u9ZxvXDScKrU5LAc/xwQxxqDDGs8te1hon9RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS6qJFA8YXYkMMNlZEK1PmAAN/uvKkOsNE1NZViTn4HvvQ3zyQLVHcque3w4pNXuTt6mKpy0l7zYPrAqL6Rp+WIJ32UAa9m6w3Xw2wyOaevRdCT3mK4N0JYzmu0GWr2E2ovdYxuL5x2/wHsUFjUJcxp4KMVcWBNKHMTJ1i3k8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvnjVI/3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9260EC4CED3;
	Tue, 17 Dec 2024 06:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734416414;
	bh=rqXWB3u9ZxvXDScKrU5LAc/xwQxxqDDGs8te1hon9RE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvnjVI/3O1AHrWLZEUhuqIqfAiGpmTZp16uuVwrGisGXz/Dm5amuaxiyZjQcG0qoS
	 D/LPUFBlwpl6FZ5AvZnC8dVEEBPV27tVFesXfYI0uE2e8dgLVCdwxJeEUvwIMR9AZG
	 DTVy10OCpRHdRgwkArv/8J83Fm2Hg/bAy7rhriIYmPoCM3Hsauo12WOfJl03S3Y0ih
	 Siq6d2P11ILt1cbILS3UJnyDlST/vAVqDQT911hKr2xOithzvU5e2+eSqbHwv787fA
	 7oSAqUJe8BdTMTR51T8K0qA+BuElIo6uvsB73g4R97LvzbrK0UY1gjwOqbQ785hrCp
	 VynmhwCx104og==
Date: Tue, 17 Dec 2024 07:20:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v8 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Message-ID: <uy4ahej6uecpef3djpxb6izk3o3w4e4e3qtwkdrpfu2nnamn6o@behbaakmw5qt>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-10-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241216223019.70155-10-mailingradian@gmail.com>

On Mon, Dec 16, 2024 at 05:30:23PM -0500, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
>  1 file changed, 318 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


