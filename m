Return-Path: <linux-media+bounces-24923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C33A167EE
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 09:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6139E3A5B58
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 08:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707E71922FD;
	Mon, 20 Jan 2025 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OnvprkhI"
X-Original-To: linux-media@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A370A189B8B;
	Mon, 20 Jan 2025 08:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360609; cv=none; b=BjAp9mkh3huWI2I3Ofr+8e2dxcZjZLgkEiaItUtSP0BRBm5nHBUsKhy5GU50yPUxX0/xdOMx6MeZSNpjJkovSQqG/B5DFeNYhQN1JjltGK1AafjMbsR9lDfoIg9zU+wNG/ECXtJBUEScspPwSMe86KZ1Bf9Y6FEtNVVGwTUijkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360609; c=relaxed/simple;
	bh=H4+cy6US/uZAjZmugxgIPG09WzOslaSKe4LUtckj+9w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QiYaCDPw0haGqg+Iydf4YFqt7UQqCy0h/h6BbpurRPwiEqFuyRUkuWLGBx/KIStk5Fms6KOUz2yBIXD5+vfQ/0/PYgjGbs9iHjuIZwSJgGLgkCvTlA6/uGo6nl58xvbe1w/h4/82/AfD7oJhj2GgNenilKpJx+8jz6LoOTDtF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OnvprkhI; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C5DB24000A;
	Mon, 20 Jan 2025 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737360605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4+cy6US/uZAjZmugxgIPG09WzOslaSKe4LUtckj+9w=;
	b=OnvprkhIw7yOUZO1XyyC2I5wZ2cCxTJv7kjHrd0itixN6Q2mDOz6pzI4c98f8Dl8hQrkeM
	DNFQMnXhiLPVc+KThh0RKrNEOGfapOzeNySQqdphA44+0HG7T6j3zl2SSp6UCRicQn6lP0
	rJh3mG/4c4AdZRz+Ayiv5WFkVHV/nEejPpkXha9TaZPOzBl9h9JjWJcIZx8JouIB5DP7Hl
	hb32Xf/eSeaaBMlAkNIlX4eNrVbsKOOqF7upJkh0b3XbWQjQVZAV82KuGTtqSOCr36y3MO
	/C60C3WdnPj8ogR0Ash4b7QrPapaB03l/GAV8cLkrv2UZSkJyHKmrrefRyzEyw==
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
In-Reply-To: <CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
	(Keguang Zhang's message of "Sat, 18 Jan 2025 16:01:19 +0800")
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
	<20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com>
	<87v7ufnc0w.fsf@bootlin.com>
	<CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
	<87plkli9fj.fsf@bootlin.com>
	<CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 09:10:04 +0100
Message-ID: <874j1tykgz.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com


>> >> Don't you need a dma_addr_t here instead? You shall remap the resourc=
e.
>> >>
>> > Sorry, I don't quite understand.
>> > 'dma_base' is already of type dma_addr_t.
>>
>> I didn't identify where the dma_base was remapped, but if that's already
>> done then we're good.
>
> Perhaps I misunderstand the usage of dma_map_resource(). dma_base is
> the physical address and will be written to the DMA controller
> register at last.

IIUC, yes and no. It is the remapped address of the physical address you
want to reach, not the physical address itself. The type is dma_addr_t
and not phys_addr_t and you can get a dma address out of a physical
address with a call to dma_map_resource(). The numerical value might be
the same if there is no IO-MMU involved, but the good practice is to
remap anyway.

Thanks,
Miqu=C3=A8l


