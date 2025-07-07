Return-Path: <linux-media+bounces-36936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33761AFAB2B
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 933DA189BE23
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 05:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE5C274FC1;
	Mon,  7 Jul 2025 05:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVvdJli/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F848C2FB;
	Mon,  7 Jul 2025 05:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867089; cv=none; b=rR3B+rew40I56PWbR5IwNg6TYaqR65C9lcf6MOR0sCf/NrgNReTvTc0UYxjTI8DZH3tymUTfALPacxLxggU/qqHUiz/8J4nY0yL3AoNv5vRRws9byVogKQtF7sJfE+u4QNCZu+/mkUNdqibd9MjOFuVIsKq1tjnufi9mYd9XyEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867089; c=relaxed/simple;
	bh=eu+GHjOCvCqVRqoV63kexKMOhEID9n+g92CJ/14sRIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILUhV3XnxHNaEOaRz6mMlvys6qAMDchXyRPKB1gW/VFt2T4wWc+cPuc7lk9boYMEK8W+IeKOPiyHTVvUxCr/Xlk9xK/js0h2FEwYlihlxvWzjMXSniRC+6HN2S9eYhvOT9YtpSWeXCTJYKUbEaKnOAspGayn9npx9tPGX1Vm4bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVvdJli/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC0AC4CEF4;
	Mon,  7 Jul 2025 05:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867088;
	bh=eu+GHjOCvCqVRqoV63kexKMOhEID9n+g92CJ/14sRIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVvdJli/K1bLN5V7IZXJn+i7qVsLuHc04/BVVu7V5YFQuxNYCzJnanl9TJV2s4u4O
	 ZrYzzUNlEbYPm0iGu0leOc9FRhDw1RzZ2Y6QTKnld3ga1v9KY2GDAaTyTYJSTkHeMJ
	 9/5sMnr7/NfIVCuOUImcIEz2yItPERe5vrvxp6l+UPoNO6hbUu3po9+7pQSM5/H8jn
	 4jqrYKWakPv7gzCU0XmEon3BoGMGnE8P7Ek6epBomcO3UUGVX8Nw0TSz3Yowxp32xi
	 Wz9AIqm0PqpNKmKRUHwkmq7CDwGSve7eYuOwikbIAg+ux1ePKm0yvT7jTY6YnLAHyA
	 y1GFlrPylvORg==
Date: Mon, 7 Jul 2025 07:44:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core
 binding
Message-ID: <20250707-merciful-electric-jerboa-bb5bae@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-3-shangyao.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-3-shangyao.lin@mediatek.com>

On Mon, Jul 07, 2025 at 09:31:43AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> 1. Add camera isp7x module device document
> 

Still no SoB, still not tested, still no checkpatch...

and also:

...

> +
> +...
> \ No newline at end of file

Look, you have patch warnings. Review your patches before you post them.
You should reach internally to mediatek colleagues to explain you how
this process works. I really do not understand why mediatek has so poor
quality of work and cannot improve over last 1-2 years!

> -- 
> 2.18.0
> 

