Return-Path: <linux-media+bounces-45587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F862C0B59B
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 23:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2EA3189845F
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 22:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A5C2EBDF4;
	Sun, 26 Oct 2025 22:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVU2GwNf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6D48CFC;
	Sun, 26 Oct 2025 22:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761517459; cv=none; b=KI8+aw5gU9LLxeSfrpHnUtwCD2wthHdJczB+3cuXYowru3npdAip7noo4BAz87SvROwYn0nrkt0RwwF54HyNNyrRmH26+8b+9qkrrjQVxr4C22jOvdMIhAYSbd+FtjrKpsGVO2HRAnpLD61beOBIrNz/H0RNxeyCVMj5g/HgoIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761517459; c=relaxed/simple;
	bh=wqfmqPUYrqaRfBk+poDFpcrAq8e0x45EHLFsjGjVWiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHr1zruGlW8aUEbqO1NeRDgDRA5FbOC02bolRypxUTNLW4+IPjmYOpbaqxUX3wQgt7TpFJl6subQm5w5dY6217g1QIku3Ljq4AT/8o95Dn43WoA7rp8hbAK4hdG1UAfqpVOgzAnCtT6jks/pY2bvTZpcIPl+CzKwvo6dUFtAGQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVU2GwNf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B8EC4CEE7;
	Sun, 26 Oct 2025 22:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761517458;
	bh=wqfmqPUYrqaRfBk+poDFpcrAq8e0x45EHLFsjGjVWiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVU2GwNfwtpx6wq6fJoFqVxektGKFDqprTLRqK+JcoZhnNmRQOwGSocBBNOPG3vTT
	 81Z3JqDVJdPT4zAxd4RYatkBjpj1wpCqiQL1Rn96e/JWPTDs4o87LztNG8XNWi9jnP
	 fRmenZlr9UI4z20bq4qbXEJpgQyySlAoEOrIR96Tl4c8Dqro03eHVatK771aa42f25
	 klcYgzV/pv/C/DB7flPJM/stVHiCeNWugqRjMESyhlzRlJpgnx+2/0FfT1Yo6u0F6X
	 KVCRG1mGSsasXw8BNa6IRATUkusP7e9W3RB+5jgszjawGRCtUxSRNf+4imwJR/X30o
	 5hKdFern7DJxA==
Date: Sun, 26 Oct 2025 17:24:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-media@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <176151745413.3041982.13183037303437786159.robh@kernel.org>
References: <20251022144930.73272-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>


On Wed, 22 Oct 2025 17:49:28 +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
> 
> The #nvidia,mipi-calibrate-cells is not an introduction of property, such
> property already exists in nvidia,tegra114-mipi.yaml and is used in
> multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> mipi calibration function and CSI function, in Tegra114+ mipi calibration
> got a dedicated hardware block which is already supported. This property
> here is used to align with mipi-calibration logic used by Tegra114+.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


