Return-Path: <linux-media+bounces-24959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0166A16C90
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E15FC3A64E8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF931E0DD0;
	Mon, 20 Jan 2025 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jt6q+SaC"
X-Original-To: linux-media@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C11FC8;
	Mon, 20 Jan 2025 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737377662; cv=none; b=U4CJxXg9PQzeosmyjM0tH0VWieThROD2sPw41CqSrmICAXJEqx+MK8SbOZzZ1WE5UHUWjWZrb7HjsUqml0/OrUkxsoXM2pc6wW4d/WeKap+f0QxX/rnP2LCu341ZYUopGn/T7uZ6fqAmmST2V06Y/QzSF45JU+Sjy2f52/JyGf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737377662; c=relaxed/simple;
	bh=MH8LDLWN99P3e8Hr0MV2OdmaCW2GNmA8x3rgPJ+E3ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YxFe50Ek4vQJOYDYCd9qYo03ZtHPAKVS9H0orNPMKtnqokq/txWZIhyoXhEENd8UFsBnbnAOCe5eQtx/RPFCGJeRMq/NJ+OM8/5JBRnS+5tDnuu7CqZCHMYhrTWKChv/OZHYScWd9/zRsUDyZOaSSFPrruyDtL+cLFgDDsZQ/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jt6q+SaC; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 453CF24000D;
	Mon, 20 Jan 2025 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737377658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niS8yhjGEG7kTaHhimkQuAQuleYT6pZ/DZpG8RfuVdU=;
	b=jt6q+SaCOTvrT+n2U+bULG2DgFvhhLJUSnbw6D/ah24y3TJ40gyafJRRX/P7MvyubzNnxC
	/8c8cGz6C5xuuv7fL89VAry/h6FP0t2D8kUrjULsOOfu+iW16JThT1njQJE4ohW5tWXNv8
	AneSNuHJGUsFi9tdDw0iVzBwKMDdo0rLdNgPh32gmFCd5IKqkeR/49O57WqagYiMiO2a/S
	Mtwoebd1PeQ4j3Cf8GcBVMttOXhMVKWSYa8if3k9RIuc0qyhqO8iyGxihh7rRO7a0ykD56
	nwkusuGupXRw9RkKG2Oq0k3q1Ysf5DNxWldKC7apL6Sgrbtdu2BshIxPI8FZIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-media@vger.kernel.org
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <CAJhJPsU1eFJ_R1-emENs8T5rrKXUKjvk-cQx9RT2ztTvmOTZug@mail.gmail.com>
	(Keguang Zhang's message of "Mon, 20 Jan 2025 19:08:55 +0800")
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
	<20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com>
	<87v7ufnc0w.fsf@bootlin.com>
	<CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
	<87plkli9fj.fsf@bootlin.com>
	<CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
	<874j1tykgz.fsf@bootlin.com>
	<CAJhJPsU1eFJ_R1-emENs8T5rrKXUKjvk-cQx9RT2ztTvmOTZug@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 13:54:17 +0100
Message-ID: <8734hdsl1i.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: miquel.raynal@bootlin.com


>> IIUC, yes and no. It is the remapped address of the physical address you
>> want to reach, not the physical address itself. The type is dma_addr_t
>> and not phys_addr_t and you can get a dma address out of a physical
>> address with a call to dma_map_resource(). The numerical value might be
>> the same if there is no IO-MMU involved, but the good practice is to
>> remap anyway.
>
> Got it. I will keep dma_map_resource() as it is, which is called in
> ls1x_nand_probe().
>
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-dma");
> +       host->dma_base = dma_map_resource(dev, res->start, resource_size(res),
> +                                         DMA_BIDIRECTIONAL, 0);
> +       if (dma_mapping_error(dev, host->dma_base))
> +               return -ENXIO;

Looks correct.

