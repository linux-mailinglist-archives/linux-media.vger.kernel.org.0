Return-Path: <linux-media+bounces-24885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413AA15BD2
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 09:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0C553A7F12
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 08:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF36F158851;
	Sat, 18 Jan 2025 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6LPiDo9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86518126C16;
	Sat, 18 Jan 2025 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737187319; cv=none; b=nDwYEo8hWNWyS/kQr3Y8UymhLizBw6a4acoDGkFgeGPwGmPakFqTxdW8TDB5BfHy8U2aSDwyejS0CP4GQ+51h8lwgLdWjHps7tEs8CyhmvPZBt4/D67jP/8jGTXCFS4RO2+dopgw96H6cFIFFC8deBm3FPj4xLiyrgKjoMlpPuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737187319; c=relaxed/simple;
	bh=KW7/kJEvoyYfbgvb7E/hSfRhFRNwiBW0teru+yzXvs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdiHkeGk6O98GqQ+yuEb/Jr6+dfy8lQIsbQ4NPYYnv38Xvbm6JNGfxl4I3K+AVyj0tuaHQJkhp8+jWz/fJAHVlulcZMZl6TVASyBEg/pMBl7HhLb2PEMeSBzhzlkEogQNH/HAQhdHpQ0r5HrK+FGy4XGbtiaam/2HbmsfOK9s5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6LPiDo9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so4529926a12.1;
        Sat, 18 Jan 2025 00:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737187316; x=1737792116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5leNx52nYflWbnaQnHIYDvl9jkvolVSYl21uZakQUk=;
        b=M6LPiDo9903HZems0+j/ObQtaoRcXKp8bYocGCfd6akxnlIJrxWH71EZFlTdc79Kjc
         fNp2HC6aHW/xiXVDlN8l05w/8GAd1MgiryCJrEHRnrTLejCbeGk9RpSywP0Pccmn/xyC
         WJoksH/Sasojm+FyV4ESpnPEFjiZrjA1d73P/UydmnGbPUPI7/+U/AOvigC+EYTp5CJG
         l+iZXNSPDtxDy4clHuZykvR5zHeh/PPVKqp9VcbHk1zdrEtehVnKTl52bp+xlKzDJ3Pa
         yMgIXBhb2mWy6U3Ed9QpGUO+aB+YR56SxbwdSRVKecjMA2R6QHSDq6ST0JHUA1PIf9+l
         lcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737187316; x=1737792116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5leNx52nYflWbnaQnHIYDvl9jkvolVSYl21uZakQUk=;
        b=cXfJSyFQ8+AsHYKbyuKEeSGlxl5906PciLanPZx+tecDbMNoFxgzRD/Xiw4pn+teFk
         lL/HaD9E9yeW+foi0a4jbUSWxY6ERV4LuPwlopk7HpFaB//x7f0zpr4hYKjh/Ku48hPh
         TKwvrDfTVbSS7Twd0xx0sR0VcbwpjYS4phdmphkKFj1KC0a+zThdXCvlxO4UgXIBkanf
         g7PH9f4g8uzuL0MeyxTk7Sz+c/K+MPgnn4gvB0rhuH7P+4mQdfmAfbv4mrbmonoOnzJr
         ifctrGDCHNrnjmw1TYN541VnAPNP3xQBrkLipYZBD4mxcrx6b/JVa9sLM7oJXA1nARGD
         k0jw==
X-Forwarded-Encrypted: i=1; AJvYcCUh0CIUdXn0igOvqWTYQN7mMDNDLnHgOaO69MkCTBVtQsureckzKTotf/DHMtdwQHL5BvURnXakVCx0N8gv@vger.kernel.org, AJvYcCVPZWQxch0QKLPBODOtvID0ghsb2AfkHawQZaw2iCtuJCDcTlJxDHJSxNR+4Ko7Trwm4mD4tVPsZK4Vtuk=@vger.kernel.org, AJvYcCWaEOXPPjDqSGwnc1sMkgJY/kdmbXR4tXmEEBQ6OSxeOvE2VOw0co7p4Ir3bSrfkHKxkx4EQZTJnKZ6@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5784dDaiQ/jtmPdFXTUjOTXdvtiFJLGsKz74WfCi0yYeORNR
	iqkzY/lwbXTyFKPn0KDn8gthJId9MkJRQc9rXTdPrrBjxjqNZEisC7hQnJ9ZN4ItgPpTQac6N8g
	UXylYzvjO3W2sb23AI//aWP6RVbs=
X-Gm-Gg: ASbGncuC9aI3NEfeNCH9OfOazJdOo1JTFBYTpCU0xiQ+eOpuRRdANnTgBUaHrv1/tb0
	7INEOQ8mX/e+HJkdw3xmlTEDciKr9hTxSKSFndZUqDRdT7JDCPneu
X-Google-Smtp-Source: AGHT+IHDnUsA55LVvEL1oC8NsKW/4MnBth+XIP4g5Ck5snp17XQSxX2cERW4luQVwUAsqSDcbgeZfPjBNTsK8F64rgU=
X-Received: by 2002:a05:6402:35d3:b0:5d0:feec:e15d with SMTP id
 4fb4d7f45d1cf-5db7d2f9af6mr4227036a12.8.1737187315435; Sat, 18 Jan 2025
 00:01:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com> <87v7ufnc0w.fsf@bootlin.com>
 <CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com> <87plkli9fj.fsf@bootlin.com>
In-Reply-To: <87plkli9fj.fsf@bootlin.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Sat, 18 Jan 2025 16:01:19 +0800
X-Gm-Features: AbW1kvbuP1oX6dA8N9eTWfkJNkhk_jjPkci2MVDNJ_NvAWDSgqY1yCzwxCljkio
Message-ID: <CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 2:26=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 17/01/2025 at 19:58:39 +08, Keguang Zhang <keguang.zhang@gmail.com> wr=
ote:
>
> > Hello Miquel,
> >
> > On Thu, Jan 16, 2025 at 2:54=E2=80=AFAM Miquel Raynal <miquel.raynal@bo=
otlin.com> wrote:
> >>
> >> Hello Keguang,
> >>
> >> On 17/12/2024 at 18:16:50 +08, Keguang Zhang via B4 Relay <devnull+keg=
uang.zhang.gmail.com@kernel.org> wrote:
> >>
> >> > +static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct =
ls1x_nand_op *op, u8 opcode)
> >> > +{
> >> > +     struct ls1x_nand_host *host =3D nand_get_controller_data(chip)=
;
> >> > +     int ret =3D 0;
> >>
> >> This return code is unused.
> >>
> >> > +
> >> > +     op->row_start =3D chip->page_shift + 1;
> >> > +
> >> > +     /* The controller abstracts the following NAND operations. */
> >> > +     switch (opcode) {
> >> > +     case NAND_CMD_STATUS:
> >> > +             op->cmd_reg =3D LS1X_NAND_CMD_STATUS;
> >> > +             break;
> >> > +     case NAND_CMD_RESET:
> >> > +             op->cmd_reg =3D LS1X_NAND_CMD_RESET;
> >> > +             break;
> >> > +     case NAND_CMD_READID:
> >> > +             op->is_readid =3D true;
> >> > +             op->cmd_reg =3D LS1X_NAND_CMD_READID;
> >> > +             break;
> >> > +     case NAND_CMD_ERASE1:
> >> > +             op->is_erase =3D true;
> >> > +             op->addrs_offset =3D 2;
> >> > +             break;
> >> > +     case NAND_CMD_ERASE2:
> >> > +             if (!op->is_erase)
> >> > +                     return -EOPNOTSUPP;
> >> > +             /* During erasing, row_start differs from the default =
value. */
> >>
> >> ...
> >>
> >> > +static void ls1x_nand_trigger_op(struct ls1x_nand_host *host, struc=
t ls1x_nand_op *op)
> >> > +{
> >> > +     struct nand_chip *chip =3D &host->chip;
> >> > +     struct mtd_info *mtd =3D nand_to_mtd(chip);
> >> > +     int col0 =3D op->addrs[0];
> >> > +     short col;
> >> > +
> >> > +     /* restore row address for column change */
> >> > +     if (op->is_change_column) {
> >> > +             op->addr2_reg =3D readl(host->reg_base + LS1X_NAND_ADD=
R2);
> >> > +             op->addr1_reg =3D readl(host->reg_base + LS1X_NAND_ADD=
R1);
> >> > +             op->addr1_reg &=3D ~(mtd->writesize - 1);
> >> > +     }
> >>
> >> This looks very suspicious. You should not have to do that and to be
> >> honest, I don't undertand what this means.
> >>
> > The Loongson-1 NAND controller requires a full address (column address
> > + row address).
> > However, nand_change_read_column_op() function only provides the
> > column address. Therefore, the row address must be restored.
> > The above logic retrieves the row address from the addr1_reg in order
> > to restore the row address.
>
> If it needs the full offset, it's probably not a change column
> command.
>
> What you do here is very risky and clearly not future proof, I'd prefer
> to avoid it. If anything happens in the core between the read0 and the
> column change, your logic breaks, and there are chances that this will
> happen at some point.
>
> Are you sure you implemented it correctly? What if you provide 0 as page
> offset? If there is no change column possible, maybe the best thing is
> to not support it.

Understood.
I will improve .parse_address with regmap_update_bits() to avoid this
restore logic.

>
> ...
>
> >> > +static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
> >> > +{
> >> > +     struct device *dev =3D host->dev;
> >> > +     struct dma_chan *chan;
> >> > +     struct dma_slave_config cfg =3D {};
> >> > +     int ret;
> >> > +
> >> > +     host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &l=
s1x_nand_regmap_config);
> >> > +     if (IS_ERR(host->regmap))
> >> > +             return dev_err_probe(dev, PTR_ERR(host->regmap), "fail=
ed to init regmap\n");
> >> > +
> >> > +     chan =3D dma_request_chan(dev, "rxtx");
> >> > +     if (IS_ERR(chan))
> >> > +             return dev_err_probe(dev, PTR_ERR(chan), "failed to re=
quest DMA channel\n");
> >> > +     host->dma_chan =3D chan;
> >> > +
> >> > +     cfg.src_addr =3D host->dma_base;
> >> > +     cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> >> > +     cfg.dst_addr =3D host->dma_base;
> >>
> >> Don't you need a dma_addr_t here instead? You shall remap the resource=
.
> >>
> > Sorry, I don't quite understand.
> > 'dma_base' is already of type dma_addr_t.
>
> I didn't identify where the dma_base was remapped, but if that's already
> done then we're good.

Perhaps I misunderstand the usage of dma_map_resource(). dma_base is
the physical address and will be written to the DMA controller
register at last. It should be defined as the phys_addr_t type and set
to 'res->start' directly when probing. Am I right?

>
> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

