Return-Path: <linux-media+bounces-49592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD665CDF8EB
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AA0A3004B96
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94637312817;
	Sat, 27 Dec 2025 11:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3ltLgtD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E6238171;
	Sat, 27 Dec 2025 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766834637; cv=none; b=UWHcIqYS0Jg7p5gU0AeAkoF0m991ZV4gjvHg4om+pK/vIb3ZQF0ki1iTpzh+WtE2NOCZSrnfm8N0Iy+Ani74NXRPX17KVgUaLvDGp1kF10v5x7PUHkHEmmhhmoXZVgzR9dBeH7v+8szB7N2qoERCX76yHGQdVa+y6VZqc2e6id0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766834637; c=relaxed/simple;
	bh=8SbV3v5bOC6DtXAsU2COdJFeLRHKXvsg2NX4hX69wZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4oYv+Ly5oxgd/yuxcCFgriY/3yk8T2mVRpStz63bT9ThEG2nodA2gcUpXrhWQaxboLAvHagA7AuXvIwJErkjnp/wz8UhErstal+DJ+Wg3JNGoSWOA0puGmaQChg7PIgwoD8qaWwYa1BJSnRCv6QqGLUfylb1hSg64kVOjGm3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3ltLgtD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB5EC4CEF1;
	Sat, 27 Dec 2025 11:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766834636;
	bh=8SbV3v5bOC6DtXAsU2COdJFeLRHKXvsg2NX4hX69wZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p3ltLgtDHY9uuLcgaYBca1zrmYQGOvFdHb7KbD1ZaYSJbkKmAC3vSAp9UZM+LAWyt
	 8wJOEkh83doJHwxcTO8hT7YKeGTzlLGxgs+uB2664fGVDMgs2RBmmUIu8/BN8jxSGX
	 PRj9oYrFNGAIL1dcfMA4jgx3EY/SfO/wYi8ncnctZEpO2EiRL51tFsP1HVf/wzXCEB
	 VeMa5d9oUxFKQzJDTQa6i8gcGStfWuRmxBwx05td7zk/jwjI8eWF6yno4kc5dUnSPg
	 kLUf8OQwOPRw/+a4/Mv22aDdn/0lKjX2aX+zgq3ye1wGGHzELImUmTTxG5GNyu6+Sg
	 Fty68gCmesSJQ==
Date: Sat, 27 Dec 2025 12:23:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: dt-bindings: ti,omap3isp: Convert to DT
 schema
Message-ID: <20251227-puzzling-impressive-otter-a0aae1@quoll>
References: <20251225-dt-bindings-et8ek8-omap3isp-v3-0-b027e0db69a5@gmail.com>
 <20251225-dt-bindings-et8ek8-omap3isp-v3-2-b027e0db69a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251225-dt-bindings-et8ek8-omap3isp-v3-2-b027e0db69a5@gmail.com>

On Thu, Dec 25, 2025 at 01:03:08PM -0800, Alex Tran wrote:
> Convert binding for ti,omap3isp from TXT to YAML format.
> 
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
>  .../devicetree/bindings/media/ti,omap3isp.txt      |  71 --------
>  .../devicetree/bindings/media/ti,omap3isp.yaml     | 189 +++++++++++++++++++++
>  2 files changed, 189 insertions(+), 71 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


