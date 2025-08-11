Return-Path: <linux-media+bounces-39432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E4B20AE6
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 15:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F41E7B62A7
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 13:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9FC1EEA47;
	Mon, 11 Aug 2025 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="R/QEnEmE"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01381E3DFE;
	Mon, 11 Aug 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920483; cv=pass; b=M9ClYKN8wedVd69v75jq7or9jtCAAXdTYM4iNYrCYKscDqkARkOKR1lrrStg1Z9CW5y5ND6WlvxI8FjN7ezdglYg8RB9SzWSmYDW7xZw9tr+IzhUTqsGCdyucFYzLfAGA5uCIoQXLc95+kmDKW1bBZH8XACfxzvoUN0b/4z0S0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920483; c=relaxed/simple;
	bh=YhJBPgywLVErZfqgjbtCkAVB8/26L/pPzKGKuTGLLHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JMKcCveQrVTHmI4hydY07eK0YcMZ6O3HCxXHf4h01V4/fxKWlPQbxxTWqOGqM1herEDz5CkhKgeSrrqXQQY6uRFw1XQ2MC8aavCvFTaHr7qGCu4Orgu5aSQ8MqvtOFFuo+Dv/nMWgAz6bVxNhI7yO4zLvjlXcHJHNyXF0NoDN2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=R/QEnEmE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1754920461; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V0bRZFgU/x4fCifmcfkC8/92g3rLVnGoJU100JXU3FH3bd1wPaizA22pWv1TEKU8Of5p6MRZD95e/xMPOngqWd6SrKmuuZ+JPxNgQia3KgKqGOpogMbmvnbrPhjGI6jpi1qsj+OHsQDkmoDFagv8c/uqIeHg8oX6GcJTZf7doQ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754920461; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lk+7uH5ULw993iOk2rMCszBT5TLvgX93elDnnsS9OhQ=; 
	b=D/lqdrCOjRYu6BArMpaHNf0VtWJUZV59bvYt8vVjSTm70+zA92TXrNcDEQDO/TUKYJIgpeJhaigANSvkFw76nePnBaAfu/THa/+gkkDsomYwGa8RQVhNCdn5peml69jbwQg9qI0hzug+6j6Lz7o3F+RqOw+tT9GdlXWEVtG9HZo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754920461;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=lk+7uH5ULw993iOk2rMCszBT5TLvgX93elDnnsS9OhQ=;
	b=R/QEnEmEfVw3riAD1p4eIR4YL+vp9qoQYshiLENUZMzO5CLhPqlW54H6b1gT+Gjm
	yLzi+g8g8ldNqrrn428Hq0acu4kuBfZLlsZJZjtod7d7RBp9NwC6jp/bwcEfjrDNE6d
	8y1FHRRwTcBlvUcQWyC+qLiE6iWibOACNnq/pGDw=
Received: by mx.zohomail.com with SMTPS id 1754920460001181.5866401293647;
	Mon, 11 Aug 2025 06:54:20 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 06/12] media: rkvdec: Add RCB and SRAM support
Date: Mon, 11 Aug 2025 09:54:18 -0400
Message-ID: <5031584.31r3eYUQgx@trenzalore>
In-Reply-To: <5c7767d1-1f28-48e0-bf8b-a224151fb007@kernel.org>
References:
 <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-7-detlev.casanova@collabora.com>
 <5c7767d1-1f28-48e0-bf8b-a224151fb007@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

On Monday, 11 August 2025 02:13:42 EDT Krzysztof Kozlowski wrote:
> On 08/08/2025 22:03, Detlev Casanova wrote:
> > -	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> > -
> > 
> >  	irq = platform_get_irq(pdev, 0);
> >  	if (irq <= 0)
> >  	
> >  		return -ENXIO;
> > 
> > @@ -1204,6 +1217,10 @@ static int rkvdec_probe(struct platform_device
> > *pdev)> 
> >  		return ret;
> >  	
> >  	}
> > 
> > +	rkvdec->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> 
> Didn't you just add new ABI?

Oh do you mean rkvdec_rcb_buf_count() ? I could indeed use that instead here.

> > +	if (!rkvdec->sram_pool && rkvdec->config->rcb_num > 0)
> > +		dev_info(&pdev->dev, "No sram node, RCB will be stored 
in RAM\n");
> > +
> 
> Best regards,
> Krzysztof





