Return-Path: <linux-media+bounces-45707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CEEC0FD29
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F318F350593
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 18:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C149531AF34;
	Mon, 27 Oct 2025 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGfwz6+0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A1F25DB12;
	Mon, 27 Oct 2025 18:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588081; cv=none; b=fSdsKyNXJQyQiasSHLNHbTQwSzmPjCCTlXsMkSBzMuXOIlbsf6i+wlQZq2G4jFAc4A+O8x9S/VnU2RPD+JkucQn0rO5sghbemL6IyYq1yWRv7NmPUlcXHIbCUPjQU4DWvct6nfVHoi/1lnjULMyX/u+Kb/BHqvAIqz110b7TOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588081; c=relaxed/simple;
	bh=9jM1AyAjLgTLzGDPG1KyrYzLoMQUACPXx/AJXSYKCR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2++W1OltW3kszweIUkGJXR2hXCqbPlHbfpQXGRUDG7RXUMFXv/zMbwlszlB1PVWJLD7yP/TemZZBYjzI15jXR49gU/NE13BocnFNa2QCbKM2Ssv9vgBRKQ+Rd1+N8FDdcoe6E6ipLBCpajVwxoFJ1l79EJnNvG4hrc5W+MxsR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGfwz6+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5F1C4CEF1;
	Mon, 27 Oct 2025 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761588080;
	bh=9jM1AyAjLgTLzGDPG1KyrYzLoMQUACPXx/AJXSYKCR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uGfwz6+04+lKKSGIgJAX4Bj6rEpXWa0ZZmr/m04gLJCYeRf3xtu8z7+eiWlEKIKNk
	 RBQS7TcAR0AKwibjHenjEiMjFMThvZ6hvMlzHKzPFQ3OL0vkV6NzVuP1JHcgVXFzYT
	 6Zg2WXJL3Fh7p9SGEP8O5SLc5f2V0fe2TYPfl4zBFhL4rHaTwVN5Vozj+friwzaHCM
	 NzegOTSsZB+WugVobmY78QPEKBWGXCMwHWtBNfPnwKN8QzoSlGs1DOVfsMAR7ai5gV
	 3Ud6ZaanLvuOsWFI4Vamcj8axRLFGouGi9x6nYHCDawwz/hNQSrPxtB4/4V+/z0gFT
	 MtDS49A2H7nLQ==
Date: Mon, 27 Oct 2025 13:01:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: Sukrut Bellary <sbellary@baylibre.com>, hverkuil+cisco@kernel.org,
	u-kumar1@ti.com, jai.luthra@ideasonboard.com,
	linux-kernel@vger.kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, bparrot@ti.com, linux-media@vger.kernel.org,
	dale@farnsworth.org, conor+dt@kernel.org
Subject: Re: [PATCH V5 3/4] dt-bindings: media: ti: vpe: Add support for
 Video Input Port
Message-ID: <176158807606.1250661.5992100889957757703.robh@kernel.org>
References: <20251024094452.549186-1-y-abhilashchandra@ti.com>
 <20251024094452.549186-4-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024094452.549186-4-y-abhilashchandra@ti.com>


On Fri, 24 Oct 2025 15:14:51 +0530, Yemike Abhilash Chandra wrote:
> From: Dale Farnsworth <dale@farnsworth.org>
> 
> Add device tree bindings for the Video Input Port. Video Input Port (VIP)
> can be found on devices such as DRA7xx and provides a parallel interface
> to a video source such as a sensor or TV decoder.
> 
> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v5:
> Krzysztof:
> - Drop VIP node's label from the example
> - Fix indentation of the example
> 
>  .../devicetree/bindings/media/ti,vip.yaml     | 152 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


