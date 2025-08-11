Return-Path: <linux-media+bounces-39455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946EB214CC
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 20:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B1F04606A4
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 18:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8778D2E336C;
	Mon, 11 Aug 2025 18:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="H9zwuiMx"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DB2442C;
	Mon, 11 Aug 2025 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937916; cv=pass; b=ezOCmwM1bCp2Ee3rIkQTI7yH3s4x3WZ8V1VfZfw3zkQNZA2zp9M1HEmh3Lbbgi+v2cnKQnMHYDjQB+5vYyT9WOWkHs3AJelhskwX1Gsmf2ngY30SkLBKMW3q+vIDfnw3i0pJJ5+Za7Upqk4BL3YqiiveNggXHV6VCTA7XWQHoow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937916; c=relaxed/simple;
	bh=dy5iWcVJvtx3XYGrqjG/DvBAnlygnGnvt0S98w1D16g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YuA5oTjgg8Yb9pmHZZmrW5z9Ejtq6hMsMlB9eUO0UJS23HGMpldyLZHfackmtC76WFyjrbPDlXjMNTFPiEyZp8noYlICM+AFpfJAxeUGuS8A94v83LBn9oINH7j5MoF5/bwFL4HM0f5tqwf5a/goM0wj5Xa43aAfJ6aKL6I5dKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=H9zwuiMx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1754937896; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lmbspXf8oivJUf301TY1GyvEouLfOMCKKQgvbhX2bM1ZH3Q5JlLq/LddWrZayuJBebcXkVl/B2H2tSgyxbLc0Ttq8KqRkiUdDD3gJt9f4SB0mEs2wQFWqkCo3MXZjM0qAjrqtdqxQbLrIbmODstr4iuqOYsZbvRBX408kTlmz6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754937896; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=asPcu0HFDOpbe01/M/JtJ/Ahm+2yhurMQ/9pz+Kce3g=; 
	b=Qe74IdKuu2TsIVQ7Uhl1dlnJ9WcEt2MEuQakSScpSSjKpbc/TNM8ej74dkeRxPqJ/L7Yge4tQq0VnL43qRCHLO8xHmBHl54scq9UI2KGoEW7UtYtTX2Z7AbA8T9L41y280n0u+mSta0zQlHOsZeJRZUtYlu2vt4rJhj7YgkOpkY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754937896;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=asPcu0HFDOpbe01/M/JtJ/Ahm+2yhurMQ/9pz+Kce3g=;
	b=H9zwuiMxTQhnInn+t5Gkc5DdPKCp99oq/fNsSfV2zWWKWtH/89o3VYQXpwOKaejK
	2sDIPJrzVdtAGukLnmVMTJV0jBjPqniojX6pVY2Iz//ChFUFBxI6ZVKo7xviFawVhZT
	C5/YgmjuGtTn/unfZ2LQIgPUeSmVrOb2bw1h6HuU=
Received: by mx.zohomail.com with SMTPS id 1754937893088844.0326429284914;
	Mon, 11 Aug 2025 11:44:53 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 06/12] media: rkvdec: Add RCB and SRAM support
Date: Mon, 11 Aug 2025 14:44:51 -0400
Message-ID: <13821567.uLZWGnKmhe@trenzalore>
In-Reply-To: <ae6a9c48-85d5-479f-b230-187a06995553@kernel.org>
References:
 <20250808200340.156393-1-detlev.casanova@collabora.com>
 <5031584.31r3eYUQgx@trenzalore>
 <ae6a9c48-85d5-479f-b230-187a06995553@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

On Monday, 11 August 2025 10:01:59 EDT Krzysztof Kozlowski wrote:
> On 11/08/2025 15:54, Detlev Casanova wrote:
> > On Monday, 11 August 2025 02:13:42 EDT Krzysztof Kozlowski wrote:
> >> On 08/08/2025 22:03, Detlev Casanova wrote:
> >>> -	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> >>> -
> >>> 
> >>>  	irq = platform_get_irq(pdev, 0);
> >>>  	if (irq <= 0)
> >>>  	
> >>>  		return -ENXIO;
> >>> 
> >>> @@ -1204,6 +1217,10 @@ static int rkvdec_probe(struct platform_device
> >>> *pdev)>
> >>> 
> >>>  		return ret;
> >>>  	
> >>>  	}
> >>> 
> >>> +	rkvdec->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> >> 
> >> Didn't you just add new ABI?
> > 
> > Oh do you mean rkvdec_rcb_buf_count() ? I could indeed use that instead
> > here.
> No, I meant DT/OF ABI for "sram".

Yes, the sram Documentation was added in commit c6ffb7e1fb90 "media: dt-
bindings: rockchip: Document RK3588 Video Decoder bindings".

Is that not how it is supposed to be used ?

Detlev.



