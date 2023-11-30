Return-Path: <linux-media+bounces-1398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226E7FEC83
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 11:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0B68B20F98
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 10:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAA73B29F;
	Thu, 30 Nov 2023 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZQlB4cyy"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EDB10F3;
	Thu, 30 Nov 2023 02:07:07 -0800 (PST)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C360660734A;
	Thu, 30 Nov 2023 10:07:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701338826;
	bh=R8T0iC2mQNhpzO/CpE43ZSPOXrTu2c3orumc8cAwUs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQlB4cyygtPG0C7qjLvsTRjjmGChjkm2BYFJnkZ5q/UIjDRleC9TU53v5X8ORyYsm
	 j074TLjZfzJHTRRIC4pqJYnKigSKYgxuMpFEqTe5Y4QwniYWQ2NFAmHkVxfDXyk1Q3
	 TtFreScl83x81378oHwEo4fXylLoTxWo48ym77JYFUBVFMUZasSFAB8nfF0TX803ja
	 Hos2WEBEDcGUXBLIGYTJUfbp/dStHZSZzWzUJN9UBQ7WulVmCk5kgNz9MOfB9qub/6
	 3tO8HCrh1pkZHx3zyiUL93TMFyW+5Z7xvdvMzEu0T3X0sdnx4W6dvw74c1T5Thj08s
	 fBIXEXBdURB5w==
Date: Thu, 30 Nov 2023 11:07:03 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Beckett <bob.beckett@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: chips-media: VIDEO_WAVE_VPU should depend
 on ARCH_K3
Message-ID: <20231130100647.pbgk7oqgynx3pzrw@basti-XPS-13-9310>
References: <eb27184d182811520de31e59f449ea49e7cc6963.1701195705.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <eb27184d182811520de31e59f449ea49e7cc6963.1701195705.git.geert+renesas@glider.be>

Hey Geert,

Thanks for the patch!

Could you please adjust the subject line to:
media: chips-media: wave5: VIDEO_WAVE_VPU should depend on ARCH_K3
                     ^^^^^^

On 28.11.2023 19:26, Geert Uytterhoeven wrote:
>The Chips&Media Wave 5 Series multi-standard codec IP is currently only
>supported on Texas Instruments K3 J721S2 SoC.  Hence add a dependency on

While it is true that is currently only tested on the K3 architecture ,
it is not only supported by that exact SoC, as you can see here:
https://lore.kernel.org/all/20231127223718.2651185-4-b-brnich@ti.com/T/

So, maybe this commit is worded better with:

is currently only supported on the Texas Instruments K3 architecture.

The change however is obviously correct.

Greetings,
Sebastian

>ARCH_K3, to prevent asking the user about this driver when configuring a
>kernel without Texas Instruments K3 Multicore SoC support.
>
>Fixes: 9707a6254a8a6b97 ("media: chips-media: wave5: Add the v4l2 layer")
>Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>---
> drivers/media/platform/chips-media/wave5/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/media/platform/chips-media/wave5/Kconfig b/drivers/media/platform/chips-media/wave5/Kconfig
>index 77e7ae5c8f35f454..9ccc1f7e32f3874f 100644
>--- a/drivers/media/platform/chips-media/wave5/Kconfig
>+++ b/drivers/media/platform/chips-media/wave5/Kconfig
>@@ -3,6 +3,7 @@ config VIDEO_WAVE_VPU
> 	tristate "Chips&Media Wave Codec Driver"
> 	depends on V4L_MEM2MEM_DRIVERS
> 	depends on VIDEO_DEV && OF
>+	depends on ARCH_K3 || COMPILE_TEST
> 	select VIDEOBUF2_DMA_CONTIG
> 	select VIDEOBUF2_VMALLOC
> 	select V4L2_MEM2MEM_DEV

