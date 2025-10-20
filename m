Return-Path: <linux-media+bounces-45058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141FBF29B2
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 19:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DEE84E8D19
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 17:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F60330B27;
	Mon, 20 Oct 2025 17:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roq0Ke4m"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0B417A2F0;
	Mon, 20 Oct 2025 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980023; cv=none; b=oXXm9wgeR+0w7fVhAcAVZ3AYvTis6tTe//XpqzjL+01B8Wc0u3h0P8I9gw23DH6FNSCHCNUne+0QoxmK1C9N8t3ScOWEsHiYRO1U0rExb2fDzZ0z72EjJQBlVuD3YMu/8ubFTFBTn+MP6iU/kNdDG0Geb2pQs0Kz09KwIz7shBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980023; c=relaxed/simple;
	bh=BXD39jZJVxX6AUbacgFfEyVJoekOr0uUFJadFIRRQsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK8fYx7Skj+xjki8TMG9Hkv2pFx1yGyY3UT4mwq94ZlLnNZ8eNJhgBfP8lakhBfTuVCS52oSnLH3FmuRkUnYRy95VfF3z96CtY5rOAN/kBxEO+dBmWn1K8bFtFyYmpWZCrbHacuNbq3ihNVwvBU5MOmoKNOm6ZucRTE1XbdZ+xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roq0Ke4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0647C4CEF9;
	Mon, 20 Oct 2025 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980023;
	bh=BXD39jZJVxX6AUbacgFfEyVJoekOr0uUFJadFIRRQsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roq0Ke4mM4GKd+i9w+UN/JjXEtPMQEbIrgWZhOB0UCeKMt0pE+tQmRiDOITM7UvF/
	 X2gIwc+wvR+Y3Uyt+ISl/frmA+XaDSktQswOAZuX0VcazAq53ZIkzcjPBHb6ovQqec
	 qk82+2WhDnCOGgajWTvYuX05Aci+pehtiSO9WJJAVjWE9xu+3i4f6OYE9gV/b+78NZ
	 NYjsVEsNcFapmYAZZ1/KiVXC1ptrL7xd0u6tIPJa/UcBUlF2ICCQKnZe/7O2FRk/SL
	 paTl2/dqMrlFo0vr5qBPWTLaDHoU4xoCbk/l+f/tjpt2SunBvZzMBo8qaAcZ+aqwdn
	 utxmIrDX52i8g==
Date: Mon, 20 Oct 2025 12:07:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Erick Setubal Bacurau <erick.setubal@gmx.de>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, s.hauer@pengutronix.de,
	david.hunter.linux@gmail.com, devicetree@vger.kernel.org,
	mchehab@kernel.org, festevam@gmail.com,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	skhan@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: fix redundant quotes on fsl,imx6q-vdoa.yaml
Message-ID: <176098001750.936573.6366914023282858347.robh@kernel.org>
References: <20251020121145.190020-1-erick.setubal@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020121145.190020-1-erick.setubal@gmx.de>


On Mon, 20 Oct 2025 14:11:45 +0200, Erick Setubal Bacurau wrote:
> Fix a dt-schema error: `fsl,imx6q-vdoa.yaml:19:12: [error] string value is
> redundantly quoted with any quotes (quoted-strings)`
> 
> Signed-off-by: Erick Setubal Bacurau <erick.setubal@gmx.de>
> ---
>  Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


