Return-Path: <linux-media+bounces-17065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE29639C3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 07:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7853E1C2156A
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 05:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F021487E9;
	Thu, 29 Aug 2024 05:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="cHEoehbu"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53F47A76;
	Thu, 29 Aug 2024 05:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908269; cv=none; b=R53mdJixDSbdfW9MDQdm4p5Hi/6jweZ8lku4kYTIzr6ljJD4SQG2/04uPtlZu1oS8eRvg060M8+fy1fath/px7lRtvkI5g0t0tMXCt1+f3bvt6sTit81A8O9X5oGE0kxDA2yi59FXh63jDaAAQegB0EC+r6FqtBEq4/Wb8oSLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908269; c=relaxed/simple;
	bh=fgvcDbXNs0Q2B6EpbT/VM90lJ5uMadwua77ZNptrS9w=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JqOuxn56ngVN1zL1WqnutRDNEW+BV0tOpSFrcEFXAuqrNsvxWpuD722q/0/6c/7bMpino8zCIngt3M5NNTUjiLPWfV4hq0EiIb8K73blkwDVnKLyINrr/O/so95BgP05mG4UGEaD/WgwT1ETJSXZxxAYzQpu79AcQ6te9rbwKm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=cHEoehbu; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724908225; x=1725513025; i=markus.elfring@web.de;
	bh=x0H5LhWeBnap376Af69NmB4TBfSaSBhzBfGyQjPVPB8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cHEoehbuOE6W4x4I+N76/6FiOuExmeFWUQhfWdrSV6PTsN/9DWrmoO0yxJsOUl2V
	 WQyAXumerCU8oJtd1SB2jlFzuc0w1jifSl1EE0sPCoX8YxiIZyqCm094CmDAsq9BO
	 byzdlRxIWacR1tQrZbE5k0N995stzs+mcvg6NI5iIk2X0M2o/AotPb2xv5AxmNKjx
	 4v5W1d0DkJa55QzPs5OJInjNm3cN0Gu0cHromuMOj8F7XvPHLRjJU7dhROuz8PTr/
	 a3803NJS2XlpDqnlHyTa+9l0+fjKyRHXoimeADK7tg26lV7/WzLbV3ixPQLueS/hF
	 FT/i/2q+bk5syQNi+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Myv72-1rp71X22zK-00uSO5; Thu, 29
 Aug 2024 07:10:25 +0200
Message-ID: <75ffe2db-a5d5-471b-9e8b-53b98e75368e@web.de>
Date: Thu, 29 Aug 2024 07:10:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, linux-mtd@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240821071132.281018-3-hpchen0nvt@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240821071132.281018-3-hpchen0nvt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P17nbWou0TFVsrRb5ZgVibk9Jj9ThMZLILYHiiSBcaB4zGnpU7i
 d3nGa573rBMdE/Sn7xSbbnb4oG20qYzkXmvPMobuVmM2/OOl25j7K2jCCqjwFMBOwvNDosc
 3P5I8cuiD2iyp1ey55TCcv/3krjIddp9i+FsQ2jR4V7aNrDZHIRxiwOCjLHSE12IE339m/M
 EWV4excC/Vf/yiN1hOa5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uyUJvvjWHBA=;lmK5yfkuO6oybTgUqjJef7gzTex
 C+IW3/jqkkEk+ehwv0zec1lU4cceppSd2W4RDl2aDbvRfuhOc03lCoKS9TkcPoXzV2aaZyB4x
 a7S/FoTIuXAscD78GSCSfXhVAUxbDzYYLRPP6c0f0XW6u/Th73nPovPIgW5X7n9o4+arSYRoa
 2G09L5hafj4i+oQiyUN155ulJ2skjCRzJjjw1O+x3sneXPdtYrfL/2VjV+6eCVTcL+HukpKcz
 BgXHULCNz9bsQzrwgEW/cSOvCAH+5NsLAPvH/IzvD7xnBMI6xw9s7QY/VLEuvrXrj05shXOb8
 k5bAR8x/VWWz1bZYuuqsXvy8Zv7fJfZ/0M7EYxRQT8iXRSCB4GsAw9tSqBM6n+s8S1eyHTOgp
 +J831BdHjlxrhuWd+Y9YAQUMTU+E/Aaye0hHVyXZCccxL/IdLQKA3jlVCXalyrKGbBM3kjp1I
 Be9+K66xldnuE3yO/tREJNMX1KLbYrwSKIzLK+i2wyHxkVgCh1NWCxzebysQo2d4DNih6DUdi
 feVPauS3pLZVyia992XftojjPmTmMdL0TBgLjoosZaw1iSeakczlH6YuP6Sfx7j5Wm+o2FDtb
 3Czh+AUiZN+0wreGIEa5BCWmoqPlvP1M88YO8IQuGe58/J9l5b4uNpTcQGl96pNpkNhjbDjRR
 dkLVvX5NNLPQjHjEm6v+bIbRKUO1iReFOG4HRwgjhX2e6HwlKJ0PMLyC/X/uoK/t7kLQe3QXE
 QwObMRqOyZpZxIfMnCg9v/zXzBHGyuGs1t43LhfeIoumZYy6OyJsFvlc7qv9KUz6Em9aPpS4X
 0ojkGP9/sW9GbLSQamt+VVvg==

> Nuvoton MA35 SoCs NAND Flash Interface Controller
> supports 2KB, 4KB and 8KB page size, and up to 8-bit,
> 12-bit, and 24-bit hardware ECC calculation circuit
> to protect data communication.

You may occasionally put more than 53 characters into text lines
of such a change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc5#n45


=E2=80=A6
> +++ b/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
> @@ -0,0 +1,1068 @@
=E2=80=A6
> +static irqreturn_t ma35_nand_irq(int irq, void *id)
> +{
=E2=80=A6
> +	u32 isr;
> +
> +	spin_lock(&nand->dma_lock);
=E2=80=A6
> +	spin_unlock(&nand->dma_lock);
> +
> +	return IRQ_HANDLED;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock)(&nand->dma_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc5/source/include/linux/spinlock.h=
#L559

Regards,
Markus

