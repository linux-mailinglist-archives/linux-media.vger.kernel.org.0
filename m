Return-Path: <linux-media+bounces-24883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42654A15678
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 19:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3D2188CDFB
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 18:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5731A7265;
	Fri, 17 Jan 2025 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R2/9Zf07"
X-Original-To: linux-media@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9C4A95C;
	Fri, 17 Jan 2025 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737138380; cv=none; b=bmScxkqfyy+BN3sus6yJtMxxdrdsNAwMg5I0V8iqyUrpYRPIKGQnKs8xqvBPQxsgdtC32S8hoDDf2b/IXtJsTUuGbdMHgq4lYmztKiLaXtF12Ho+vgEheWSVWwloJhgXRjoGTELi8S390smh0YGNgchnVa60YePSBYHHAQG/Xe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737138380; c=relaxed/simple;
	bh=OcOyXqiG40bVi8QUxUxz6FT3v7Ae14DfBiR5plxokUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UuLeyHDQdGOfPZ0mAuedOc/vcvTOnqW0yIrjMGWCQObJ+uzw3+V797CBoMBHYZMN00gyzhZzr2+0hrMpax9HLq63g61Z8piNL8L4iR99lpWBHcmTDUTRE3ktpLw8Fvg+uJXOXE19WcnxR++kL2coD6/NQZj7pgZfAQMqWfO8SCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R2/9Zf07; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A52CF60002;
	Fri, 17 Jan 2025 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737138369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XLrilTvSeVgL95ft30Ux+KpvfhUSLP8ehfo9grmap8c=;
	b=R2/9Zf07APhYrnskerwpgKcLM/ipA17GWDknh9yipWHE1xUOzaEY1IXGFZYUtOi2jiaohs
	IVyFLCN5BWgmKaJqBa+QDbixd5wtXixZ7mrKgNCYA62HzxhakepQube4+/uOJIYU6ycwqh
	0ZmBXgvzhZ6/5ruo1nBox3Wm8NrZgQDZCn/NI53TuZWwRsxp6/khs/tN2/3U/n+ETREZ15
	BPuvu+fmQ5SpbExipkZ+c4WPsQsLi/zKGaJO7LWGCyndzE4a615ANBRvAN85HYbrqDom04
	2KqsI+Ny3s+ZdVz2SM3wuwf0U/dRcMwDwyePeScIJFotRyCKXLBmSH1gU1M0qw==
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
In-Reply-To: <CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
	(Keguang Zhang's message of "Fri, 17 Jan 2025 19:58:39 +0800")
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
	<20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com>
	<87v7ufnc0w.fsf@bootlin.com>
	<CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 17 Jan 2025 19:26:08 +0100
Message-ID: <87plkli9fj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

On 17/01/2025 at 19:58:39 +08, Keguang Zhang <keguang.zhang@gmail.com> wrot=
e:

> Hello Miquel,
>
> On Thu, Jan 16, 2025 at 2:54=E2=80=AFAM Miquel Raynal <miquel.raynal@boot=
lin.com> wrote:
>>
>> Hello Keguang,
>>
>> On 17/12/2024 at 18:16:50 +08, Keguang Zhang via B4 Relay <devnull+kegua=
ng.zhang.gmail.com@kernel.org> wrote:
>>
>> > +static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls=
1x_nand_op *op, u8 opcode)
>> > +{
>> > +     struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
>> > +     int ret =3D 0;
>>
>> This return code is unused.
>>
>> > +
>> > +     op->row_start =3D chip->page_shift + 1;
>> > +
>> > +     /* The controller abstracts the following NAND operations. */
>> > +     switch (opcode) {
>> > +     case NAND_CMD_STATUS:
>> > +             op->cmd_reg =3D LS1X_NAND_CMD_STATUS;
>> > +             break;
>> > +     case NAND_CMD_RESET:
>> > +             op->cmd_reg =3D LS1X_NAND_CMD_RESET;
>> > +             break;
>> > +     case NAND_CMD_READID:
>> > +             op->is_readid =3D true;
>> > +             op->cmd_reg =3D LS1X_NAND_CMD_READID;
>> > +             break;
>> > +     case NAND_CMD_ERASE1:
>> > +             op->is_erase =3D true;
>> > +             op->addrs_offset =3D 2;
>> > +             break;
>> > +     case NAND_CMD_ERASE2:
>> > +             if (!op->is_erase)
>> > +                     return -EOPNOTSUPP;
>> > +             /* During erasing, row_start differs from the default va=
lue. */
>>
>> ...
>>
>> > +static void ls1x_nand_trigger_op(struct ls1x_nand_host *host, struct =
ls1x_nand_op *op)
>> > +{
>> > +     struct nand_chip *chip =3D &host->chip;
>> > +     struct mtd_info *mtd =3D nand_to_mtd(chip);
>> > +     int col0 =3D op->addrs[0];
>> > +     short col;
>> > +
>> > +     /* restore row address for column change */
>> > +     if (op->is_change_column) {
>> > +             op->addr2_reg =3D readl(host->reg_base + LS1X_NAND_ADDR2=
);
>> > +             op->addr1_reg =3D readl(host->reg_base + LS1X_NAND_ADDR1=
);
>> > +             op->addr1_reg &=3D ~(mtd->writesize - 1);
>> > +     }
>>
>> This looks very suspicious. You should not have to do that and to be
>> honest, I don't undertand what this means.
>>
> The Loongson-1 NAND controller requires a full address (column address
> + row address).
> However, nand_change_read_column_op() function only provides the
> column address. Therefore, the row address must be restored.
> The above logic retrieves the row address from the addr1_reg in order
> to restore the row address.

If it needs the full offset, it's probably not a change column
command.

What you do here is very risky and clearly not future proof, I'd prefer
to avoid it. If anything happens in the core between the read0 and the
column change, your logic breaks, and there are chances that this will
happen at some point.

Are you sure you implemented it correctly? What if you provide 0 as page
offset? If there is no change column possible, maybe the best thing is
to not support it.

...

>> > +static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
>> > +{
>> > +     struct device *dev =3D host->dev;
>> > +     struct dma_chan *chan;
>> > +     struct dma_slave_config cfg =3D {};
>> > +     int ret;
>> > +
>> > +     host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &ls1=
x_nand_regmap_config);
>> > +     if (IS_ERR(host->regmap))
>> > +             return dev_err_probe(dev, PTR_ERR(host->regmap), "failed=
 to init regmap\n");
>> > +
>> > +     chan =3D dma_request_chan(dev, "rxtx");
>> > +     if (IS_ERR(chan))
>> > +             return dev_err_probe(dev, PTR_ERR(chan), "failed to requ=
est DMA channel\n");
>> > +     host->dma_chan =3D chan;
>> > +
>> > +     cfg.src_addr =3D host->dma_base;
>> > +     cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
>> > +     cfg.dst_addr =3D host->dma_base;
>>
>> Don't you need a dma_addr_t here instead? You shall remap the resource.
>>
> Sorry, I don't quite understand.
> 'dma_base' is already of type dma_addr_t.

I didn't identify where the dma_base was remapped, but if that's already
done then we're good.

Thanks,
Miqu=C3=A8l

