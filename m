Return-Path: <linux-media+bounces-26107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 959FEA33933
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D09661888881
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 07:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AB220AF80;
	Thu, 13 Feb 2025 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMluKzxm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44772BA2D;
	Thu, 13 Feb 2025 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739432966; cv=none; b=XU7WNRZq+3OhIg9Pqfne8vjUDU9AAB22F8qE+X39aRueTyAJComQMXHYubw1z5hIJTrrBraynHHxbZKdgRICoFw0hJE2JdvzhqyRqMtDfS8/hY5x1sFDh+JEOepTxsWCRNsr8UnyheicXCVfncY0GkNYkNYWuwYc+uxsBW+mTwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739432966; c=relaxed/simple;
	bh=2r+iftouz+KNmWMr3hXVKgACN/Hfjh0z0QlWbmjE1h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxOQtRdJZiR+0ZFbmRYq7ivKPjKiaxpvP0tM2ZydKkqbdrtStWJEcPQ1FPTlZEUinxyYY+om+dZxdFP2S98WbwX30O9tJWKBTA5PhYbM9eRKDuMkZoCj7XhcfYKOjQC42MILb6qnW29WuElKOxAp/E4mo8ZkN7Ajjer7kpdV5lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMluKzxm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7596C4CED1;
	Thu, 13 Feb 2025 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739432965;
	bh=2r+iftouz+KNmWMr3hXVKgACN/Hfjh0z0QlWbmjE1h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMluKzxmo91HgIN1XqkBR3AF7NgltciJKCmluuhvjfPw7PanUY4Ka5mozmeVyD5kb
	 XhASNZQV3PF7zlpU4/W9nXn5/2hUbc0y8/yPTLKFbGPWRZe604hrBuY9RSRXb42L4w
	 tATww9srWEdEo/s3xQL0FdCoaUHGzZJBYR58r/eaBEZhz6HohlAuddG5xQR2vUr1+E
	 kMB4mFf0DYXi1IORBjBN1ysHl+A50TxsBym5CV7mYQujhqHGg71oN4/b/8cC3j0b3u
	 ki0MR2Oxvb+rgyz0IFScFso0vcPnscvYFgF/xV9AjcdxZTRTKilye+wBn2K1WIdbzm
	 dchmsnZ2sqvVg==
Date: Thu, 13 Feb 2025 08:49:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: eajames@linux.ibm.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250213-loose-positive-moth-be16ab@krzk-bin>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>

On Thu, Feb 13, 2025 at 09:53:38AM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


