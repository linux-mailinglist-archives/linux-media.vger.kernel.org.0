Return-Path: <linux-media+bounces-38178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F3B0C71E
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6403B23D7
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 14:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3709C2DECBC;
	Mon, 21 Jul 2025 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IB/CSD6V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E2514D70E;
	Mon, 21 Jul 2025 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753110012; cv=none; b=Z3wQYCwdtYQi9RgmrA19CbnBfrq3FvQtZzFGRRYIN4+MDWV2xk8KrlloQF99eAPirPJNgwatXdTha/J2STRq7NhJ730N3f84b9jkxJnWkpc2iN3JCBk7DmCMuJ2Ch8lwr98Ab8aNnQbrEkgSbFgU6sKlfyrpPETDnySuzXDZVZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753110012; c=relaxed/simple;
	bh=VZAFEBYGkW7zkA9QHXJ+nLYWvFYNy70boXd5O+3hoTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CThkbw7vwvo4QVbd+i+lhb9yA0Gnt4W6Rkwak2V8su7FEd0uHy0JlPiKS2r9F7YD576YTJUPcRyBI8ZNQmgKe/EAwrYw+znm+TUkMO9Sl4UAn0h6hmH5A6m9Tlv7FUXYOQKsPI/O8QZ7mZlUaqBLZnhep5VZybkD3TUyp4fB9vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IB/CSD6V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39475C4CEED;
	Mon, 21 Jul 2025 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753110012;
	bh=VZAFEBYGkW7zkA9QHXJ+nLYWvFYNy70boXd5O+3hoTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IB/CSD6Vq+QSQx7hD4TITcqcR5SxQBlyS50DA0avSGhIjlvqkcRKYI17VaEjvhG9G
	 8EkxIyAshM5qj5/Ca5ztlQkj1/5by7Mn9fXzKf4k03zrNSF4q6xKRa+9ynRjtY32c1
	 koQ/MqhOdb++vqwtjVnKSWpw8D55HKl5tj8mVRhwr8N/crPeyeNEJXMwY/S5CE8p8V
	 kD7P+aQdsXlW2q/DsTXwF+7EQEN/Fa5+0Tg3w6c5t9/A3e3yqdRXuhO3vmRAcdsZfN
	 IVxJw+tZ2vk2x/To/uEb0vgzEKb9n3+yTioSZBLwKbhoPU54izO08bAtR3kGxOEwzH
	 TX8rvX67snRIQ==
Date: Mon, 21 Jul 2025 10:00:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-rockchip@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-media@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-doc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v9 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
Message-ID: <175311001041.629023.12786244001330541185.robh@kernel.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <20250721-6-10-rocket-v9-6-77ebd484941e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250721-6-10-rocket-v9-6-77ebd484941e@tomeuvizoso.net>


On Mon, 21 Jul 2025 11:17:33 +0200, Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
> 
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
> 
> v3:
> - Split register block in its constituent subblocks, and only require
>   the ones that the kernel would ever use (Nicolas Frattaroli)
> - Group supplies (Rob Herring)
> - Explain the way in which the top core is special (Rob Herring)
> 
> v4:
> - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
> - Remove unneeded items: (Krzysztof Kozlowski)
> - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> - Add reg-names to list of required properties (Krzysztof Kozlowski)
> - Fix example (Krzysztof Kozlowski)
> 
> v5:
> - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> - Streamline compatible property (Krzysztof Kozlowski)
> 
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>   (Kever Yang)
> - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> 
> v7:
> - Remove allOf section, not needed now that all nodes require 4 clocks
>   (Heiko Stübner)
> 
> v8:
> - Remove notion of top core (Robin Murphy)
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 112 +++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


