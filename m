Return-Path: <linux-media+bounces-27556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215AA4F7DC
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 08:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B79A188FE1E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D981EDA3E;
	Wed,  5 Mar 2025 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nD/e2oF5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80B01EA7F5;
	Wed,  5 Mar 2025 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741159625; cv=none; b=hvubKzjH4Gxd1cqdWwql8y5sfPMWSljhbyaohEAsZNEvW3hFzmD7q8+T0OJsYtJPEgz3Rcd+kt4FHr4qChYUupK8VQuenO0npJnZhJrZURJvJ8mf4awdunlLj0dXCxT4hLXGy3U0zYmRoMHIXOFoZkOi8u9/epPF6wYf0t2qzgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741159625; c=relaxed/simple;
	bh=wRaq4uFDdTXwzW2CzVR/8V0Bnta0TTyoo+FbDAQvNt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqM7D9b7/ozJkQAInR+QpG+OB+nA1+TU7sOC3uiP1zIzgS3JfaaDpPylbNMiL1gHKXOpn+IQY/78yICSRwo3Odnu13eVXoMY0a6Y0jtaCUAMq4c7ewIZq/cZ7HRf3Ad2WTa5XXxhBaNpyWJ2hEvihR9/p+k3MC+tW87OC/P0qww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nD/e2oF5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A80FC4CEE2;
	Wed,  5 Mar 2025 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741159624;
	bh=wRaq4uFDdTXwzW2CzVR/8V0Bnta0TTyoo+FbDAQvNt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nD/e2oF5oGakQJofxgIE1SqfssbJLLX4TIicWW37Q5W/bvq1vlD5zUNrynDGJl8wO
	 R9OUhQ0HbdOLl3czEjIFH1NdaUqNMRpjKTB+YhuAk6/EsW/5RFLvJoh2bbk07L2BmS
	 lW3yYUQd1n2BJr+1CVtH4hF2ir0rVbiFD/YDP3/uZVTYxYkVHxtrNEbwelGK96M+VF
	 gReEoZoKVNwUQxrHE0jRmoggtcRoXxLOmPqbF/4TfxKED+6vuJu74/PJinGLTzY4kp
	 2izTB8hwFve0XrtWfIy1BAP1/p3Yj4i+AOI4XgCDj/MTcd34deJPBerxFyW2PYeJ+w
	 E0vDOBcVXKlgw==
Date: Wed, 5 Mar 2025 08:27:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasiliy Doylov <nekocwd@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Vitalii Skorkin <nikroks@mainlining.org>, 
	Antonio Rische <nt8r@protonmail.com>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: Add LC898217XC documentation
Message-ID: <20250305-onyx-vicugna-of-action-cdcf0b@krzk-bin>
References: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
 <20250304-media-i2c-lc898217xc-initial-driver-v2-2-6a463cef3ea8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304-media-i2c-lc898217xc-initial-driver-v2-2-6a463cef3ea8@mainlining.org>

On Tue, Mar 04, 2025 at 10:32:19PM +0300, Vasiliy Doylov wrote:
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

If there is going to be resend/new version: drop above blank line.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


