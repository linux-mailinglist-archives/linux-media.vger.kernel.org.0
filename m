Return-Path: <linux-media+bounces-36939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11679AFAB3C
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AD6A1752D2
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 05:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1F8274FD4;
	Mon,  7 Jul 2025 05:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIut4TWp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D803597A;
	Mon,  7 Jul 2025 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867403; cv=none; b=n4aR2S2BPdnZLKQmqRgUQVl+I0N7wmngk4Nugvjv8YmNVJ7r+gQwZ1nBpSk0smvG3/ksjNwte2qxrJTyCOgZBfrVIj0HaSp7dXbU+wGRZzRMT79D34caMoAMw8Ng3kbuC/28I3KbBbe//NYKHuOALovrja9Zt7i2hK3nZ1pX6HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867403; c=relaxed/simple;
	bh=H1uS+lRJDdIKeULrbOYxVDA++ia5TLO7SuOj0M3uK/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSfH3abOuT753hEDeQyUSTdOM6RCAKl8WYb6lTjZwMYfmEHWfoyinVrXitqoq8OZpfyC33F3ss3X2Czlcgu80gvlTe4MpI2vLbibVE7p9Gw+TB1ITEbTBX+jJwiJpzGOg7et0uyX01528Zs9W6fzrbo+Wfcy8pLv6IQXhw45aRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIut4TWp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4264AC4CEE3;
	Mon,  7 Jul 2025 05:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867402;
	bh=H1uS+lRJDdIKeULrbOYxVDA++ia5TLO7SuOj0M3uK/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIut4TWp53JwMnw9mex2FsExLGQGUavwebot/I3b/t4xvw0IIJk3dPFPV3CAF+0eq
	 /fWy9f3vAMXBRl4DZFFWTEuIWnztk0EYLXmHR3yWtFoTjDrL+EKH6KC5VKtTKLMm6T
	 HP7sP9REben2i/iLwmdN5Qt5BypVMEu1SN6VYzgZ1Dn+nTCNc06wbkdX5xi3iyD8wd
	 KVDuiaTyKjYQIfrZ9ag5OZ+5a13QrodgbuReDEqA61toH6f8R2zvMn++eQwxLnlfUu
	 UGa9GPrt5QIX3IBMjkFIrXeLdRFN093xAIhwUFsbAO6t32olgE2lR6y0d46f5wBZys
	 +9khuLgxKw+6w==
Date: Mon, 7 Jul 2025 07:50:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 05/13] media: platform: mediatek: add isp_7x seninf
 unit
Message-ID: <20250707-lavender-peacock-of-patience-fdc712@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-6-shangyao.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-6-shangyao.lin@mediatek.com>

On Mon, Jul 07, 2025 at 09:31:46AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>

My most frequent comment last year to Mediatek. I even asked to come
with some internal procedure so you will not keep repating the same
mistake in author's name.

Any success?

> 
> Introduce support for the MediaTek sensor interface (seninf) in the SoC camera

...

> 
> ---
> 
> Note:
> The PHY operations have been refactored and separated from the seninf driver,
> but there are still some issues to confirm with reviewers in this v2 patch
> (dt-bindings: media: mediatek: add seninf-core binding). The PHY part will be
> moved to drivers/phy/mediatek/ in v3.
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>

and here the same.

Best regards,
Krzysztof


