Return-Path: <linux-media+bounces-46185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F4EC2AAC3
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 10:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C12DD1892180
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 09:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5722E1EFF;
	Mon,  3 Nov 2025 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIP5eMU3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345FEEB3;
	Mon,  3 Nov 2025 09:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762160539; cv=none; b=j9WCxfaf+2eY3Civ2C0kDNGeEkVq97dhjTn6ZLQUfdxFsSHWjmBfNxtJo8el6o6aF7JgHClPG6L3r0dkIw4Qk70oEf4csZ7zA+UXU2yCA0ADXh+Pbvyqwn364L8g8gdLb+Qt7/OgcvRSVUFLxZsXlMjNphJSb1zlbEnW6Fq+bL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762160539; c=relaxed/simple;
	bh=W8dEDPU+y16+j7p2S006IJb//u+cz581x8CUkn3B/4Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SxQIXbmz3dMEPqshn5XTBk8RO8hJSOqrTHJOobVBGbQlCPannFN7fO8rX38z10TVZ0jfGuE5uOAXwj3r+arGBXpS1oItO/Us60omqruQZjxDmGvYxrXL8sykX3eN4CnZcRiOa0fhEoHWQJ0fX0OVsjcUD74/wKaabwmceb87J4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIP5eMU3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973A9C4CEE7;
	Mon,  3 Nov 2025 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762160539;
	bh=W8dEDPU+y16+j7p2S006IJb//u+cz581x8CUkn3B/4Q=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=fIP5eMU3/TlkV4WaIeORzkfCc09vjr7X9960r3wf5HUHS5Lmw0OveLNoK2SM4/31k
	 sBS8fpvPaUxFHp1W4fUXl0WE+xCKjxpU9OKvGyCXXv4Ey8mJkExNzUC/7gb1UOIboL
	 +dpZW0yBeSO+e+FvPyLnUAiGTlyWC0Kn9Pnxt3pTLm2mNsvoO756KmbZyU1ObsWSPF
	 HzxWv0kNdtB8Y/+Xo4fS/I0I+76V7KY81jwnGORY5/cgpiWCS87Jl8L5JmHYA7GJyf
	 vnAxwe/DMdUZx07cQS7o5Y+3kp/pM2qkQ9D15iKbqOjANIHOF9DLzZkqxivtz0vYuC
	 xn7qdljWFJFGg==
Message-ID: <13df4a17-93aa-41f4-bbff-d1e83993a618@kernel.org>
Date: Mon, 3 Nov 2025 10:02:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20251029110623.96661-1-lukas.bulwahn@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <20251029110623.96661-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2025 12:06, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 169ac4bc5bc4 ("dt-bindings: media: Convert MediaTek mt8173-mdp
> bindings to DT schema") renames mediatek-mdp.txt to
> mediatek,mt8173-mdp.yaml as part of this dt-binding conversion, but misses
> to adjust the file entry in MEDIATEK MDP DRIVER.
> 
> Adjust the file entry after the conversion.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Rob, since you picked up the patch referred to in the commit log, can you
also take this patch? Since it relies on the yaml conversion patch?

Regards,

	Hans

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e428ec79dd24..c094b2fef0fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15881,7 +15881,7 @@ M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
>  M:	Houlong Wei <houlong.wei@mediatek.com>
>  M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
>  S:	Supported
> -F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  F:	drivers/media/platform/mediatek/mdp/
>  F:	drivers/media/platform/mediatek/vpu/
>  


