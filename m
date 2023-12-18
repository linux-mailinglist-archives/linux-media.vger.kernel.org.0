Return-Path: <linux-media+bounces-2494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147A816433
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 02:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7052825EA
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 01:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB5320E6;
	Mon, 18 Dec 2023 01:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HLu0L8OL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837963D7A
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 01:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FE6957E;
	Mon, 18 Dec 2023 02:52:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702864370;
	bh=uwW4bLr7Fljh/DEbGQJCQ3i0GV+2C4OB+2Kt2bPdLA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLu0L8OLI2SqjKi01Q5ym8Pz9c5e2R9XIZBiqdR0giHzTphUkqmxUWh5ij4BCasji
	 BE2yrgXjGCHn/QcEHF/J1oT/9b63v9c7uUvPsB/kvjPnC0sxoUDq8XdRkxwPE4jR3R
	 A2m0ObLN7mdf/SvVmanBeAMmaNc9N1VZ2N8jovRc=
Date: Mon, 18 Dec 2023 03:53:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Linux-rockchip <linux-rockchip-bounces@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.or>
Subject: Re: [bug?] 85d2a31fe4d9 ("media: rkisp1: Drop IRQF_SHARED") breaks
 ISP1 on RK3399
Message-ID: <20231218015345.GE5290@pendragon.ideasonboard.com>
References: <87o7eo8vym.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o7eo8vym.fsf@gmail.com>

Hi Mikhail,

On Sun, Dec 17, 2023 at 10:14:34PM +0300, Mikhail Rudenko wrote:
> Hi!
> 
> Rockchip ISP1 is broken for me on a custom rk3399-based board in the
> latest media_stage. Relevant dmesg fragment:
> 
>     rkisp1 ff910000.isp0: Adding to iommu group 2
>     genirq: Flags mismatch irq 42. 00000004 (rkisp1) vs. 00000084 (ff914000.iommu)
>     rkisp1 ff910000.isp0: request irq failed: -16
>     rkisp1: probe of ff910000.isp0 failed with error -16
>     rkisp1 ff920000.isp1: Adding to iommu group 3
>     genirq: Flags mismatch irq 43. 00000004 (rkisp1) vs. 00000084 (ff924000.iommu)
>     rkisp1 ff920000.isp1: request irq failed: -16
>     rkisp1: probe of ff920000.isp1 failed with error -16
> 
> According to rk3399.dtsi, isp interrupts are shared with correponding
> mmu interrupts (isp0 with isp0_mmu, isp1 with isp1_mmu), so the subject
> commit breaks devm_request_irq. Reverting it fixes the issue for me.
> 
> If I'm just missing something, sorry for the noise.

You seem to be right. I don't know how I managed to miss that.

Tomi, would a revert of the offending commit be enough, or are there
other issues introduced by the other changes in the rkisp1 driver on top
of the shared IRQ drop that will need to be handled too ?

-- 
Regards,

Laurent Pinchart

