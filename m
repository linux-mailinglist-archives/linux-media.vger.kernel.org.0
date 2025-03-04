Return-Path: <linux-media+bounces-27470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A3A4DCE9
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C06B63A6463
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D57200B9F;
	Tue,  4 Mar 2025 11:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FabJJDm5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15A1FE473;
	Tue,  4 Mar 2025 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088840; cv=none; b=ALB2cAuJH/dSwPsVhA5WL2KzMBigAttxRv0OiMHP2tVwxJAxZdLWE0Qs1T4vIaUfCrRWNbCASQ0TDtKr3U9McpXaLKg5bb9OFZbd3IB7R0RL5lndgjYuM4LdR9MWP/5j70a3tT9e6eWq/CONrOXjnVKt5pwshUwpL50O6ZBGjKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088840; c=relaxed/simple;
	bh=0vNz5KI663r13YbDYRp/0zNc65hiKkRyDtaZBZqOEAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbdkJ8hX/roorqOwc97DnQwxKdJTAE7+k/rGL07Ub1dRBpNVM91M6aWH+Q3Hi7T6KXsFhIR6UhPbRQ+jK+VT+KDPjP0VE3+0XmFtIhmUGfNToYtPaBfzbpkHTb8yq5hI7yXZ7rodH/t53LgQOh9jhfOFpxDalu8y6Cn1s8taYNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FabJJDm5; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e4f5cc3172so6437071a12.0;
        Tue, 04 Mar 2025 03:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741088837; x=1741693637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdKvt+9tQm2qCrt7oFiiWlWL0il6DJKlMTh/YLfvuGQ=;
        b=FabJJDm5h/kdO8JCmXoDf4c/irqyU4+IlbNaQEMfBiXpcaxF7cn0D3tu7vv9BOvgRa
         n49qT/KaA4kznbS0mDiW2t7+LxGBWNYaGqpALSvspNrDoq2bnSKJD0/IDeimfsCXrUa1
         b+7UqAL215eEHDUxHd/IjISj1vf8qlM7IEwVTkrV+sWhi8qqWv/T7oPvUf5A+0OXlh0A
         1WGNdRKvg13udsY7BJqS9wKVoandK50WdVnLqnMwVMLDEBzllv7/D8r9e60j8m46EolP
         p9x1qWbO2z4/SpXyXfQgX1pAFZwJ6ogloj5E20gdZff5T+p/HvndTc63AwJBDypeQ3Ui
         m0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741088837; x=1741693637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdKvt+9tQm2qCrt7oFiiWlWL0il6DJKlMTh/YLfvuGQ=;
        b=Z55G09tDOBI2yCI50eTEV9Q2TpbjcoiAmNbg084tkMHMcB8diCr1LCjA2tgmCuHyOI
         zBrKy7JY22vI572ePfGBlAdaEZRUdBJjHQ+CMjPjqZVfjXxv5fmAaUdvSNhH7tmH0lzQ
         Sa6C/l2gxaDQWuXGC1OHRUN/jGz1ze9Vg058XOIZZ49Xt/6COjR2M1idMDHEbuAeliPb
         knR7/5f5vel7Yr0vUxosUmJJRKfTRSspt1XTtDM5SI92Dtu7+3AdUI8ANQY9HfBU6ZNp
         mkhnZBgQ0Cqr+XJZ3O78cfNuvv/A5C0G37Hto2cnV0HWFJYd5//OFFphvO9HNbEpJA68
         +t8w==
X-Forwarded-Encrypted: i=1; AJvYcCViGPX2SdWBDPRiyZ5I5hHKkoMzq4xVkfnMAXOFwiiGiaCKapKqVhKOTBgecOJQNrRZAwedManIz0L/@vger.kernel.org, AJvYcCWAYkDnMAEBQle+RpK8UwJEZGZUBhvjxywv+KM+Oqtvl0UptQTsjuhumOZtmdUU4lldCtnig4Y7h1/yKm2l@vger.kernel.org, AJvYcCXO8tPJUfNEiN0x2TzsAPcmyT7Z1/X6k4wdQnr3ZdvEWg889R+ExBmUq1AzyBfNVc/YmcgOiguL6S9Uyaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3BWtkJFY4Zg4qhtHcnOHHFRnYDrhhJvFvqlxLq8ShUGQdLNzO
	kD0FwgfZQjgzYkW0mMNvGpf71/s1cjT3dINRPDAfI0bX6eBjT879RdTxUe8etjLgV0rbc/btMTV
	7ttYi1TeC7w9cSPzYpdsVLP0ZlbacfJi91pA=
X-Gm-Gg: ASbGnctByFn1YqKvDP4IYSbF6CAQPN1M6wrESjxuvuSLNd+hAnFLOJ82s2IdSLHr/FN
	2FwafVP89LJ+4/gXCrNgg94Bgl0/Q4fXfgqx4iQfejfhAw4eEOfbLpgkxizVh7U8cU1c4DL7exb
	d6pLMyjqqyUX0WYJoTaSatXTushzk=
X-Google-Smtp-Source: AGHT+IHeNVeHFv5jhJzVjg4LB/54QEae2d+Sjnh6QpxFmgh5nNZje3z8A3cZOjJzWmEkVq/tu0ZnH8vGN0maF/68lR0=
X-Received: by 2002:a05:6402:348f:b0:5dc:94ce:42a6 with SMTP id
 4fb4d7f45d1cf-5e4d6b4b980mr19108890a12.22.1741088836597; Tue, 04 Mar 2025
 03:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
 <20250121-loongson1-nand-v12-2-53507999de39@gmail.com> <87tt972dt0.fsf@bootlin.com>
In-Reply-To: <87tt972dt0.fsf@bootlin.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 4 Mar 2025 19:46:39 +0800
X-Gm-Features: AQ5f1JrHSph0iUHkN40CrLh0rv6H1WjLXzdy0jpcSWywGhbQqeTnmVuEIdx_gPs
Message-ID: <CAJhJPsUw7YGKfBuFtUirOGuCA9hV6e-wjrL4L9b-5kmuVUW=ow@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Miquel,

On Fri, Feb 7, 2025 at 1:17=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hello,
>
> > +static inline int ls1x_nand_check_op(struct nand_chip *chip, const
> >  struct nand_operation *op)
>
> No inline function in a c file.
>
> > +{
> > +     struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
> > +     const struct nand_op_instr *instr1 =3D NULL, *instr2 =3D NULL;
> > +     int op_id;
> > +
> > +     for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
> > +             const struct nand_op_instr *instr =3D &op->instrs[op_id];
> > +
> > +             if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> > +                     if (!instr1)
> > +                             instr1 =3D instr;
> > +                     else if (!instr2)
> > +                             instr2 =3D instr;
> > +                     else
> > +                             break;
> > +             }
> > +     }
> > +
> > +     if (!instr1 || !instr2)
> > +             return 0;
>
> Is this expected?
>
> > +
> > +     if (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_RNDOUT &&
> > +         instr2->ctx.cmd.opcode =3D=3D NAND_CMD_RNDOUTSTART)
> > +             return 0;
> > +
> > +     if (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_READ0 &&
> > +         instr2->ctx.cmd.opcode =3D=3D NAND_CMD_READSTART)
> > +             return 0;
> > +
> > +     if (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_ERASE1 &&
> > +         instr2->ctx.cmd.opcode =3D=3D NAND_CMD_ERASE2)
> > +             return 0;
> > +
> > +     if (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_SEQIN &&
> > +         instr2->ctx.cmd.opcode =3D=3D NAND_CMD_PAGEPROG)
> > +             return 0;
> > +
> > +     dev_err(host->dev, "unsupported opcode sequence: %x %x",
> > +             instr1->ctx.cmd.opcode, instr2->ctx.cmd.opcode);
> > +
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static int ls1x_nand_exec_op(struct nand_chip *chip,
> > +                          const struct nand_operation *op,
> > +                          bool check_only)
> > +{
> > +     int ret;
> > +
>
>         if (check_only) ?

Sorry, I'm not sure if I understand correctly.
nand_op_parser_exec_op() only checks patterns and will skip
pattern->exec() when check_only =3D true. Therefore,
ls1x_nand_check_op() should handle all opcode checks in that case, and
leave check_only =3D false to nand_op_parser_exec_op().
Then the code will return to:

if (check_only)
        return ls1x_nand_check_op(chip, op);

return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op, check_only);

Am I right?

> > +     ret =3D ls1x_nand_check_op(chip, op);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op, che=
ck_only);
> > +}
> > +
> > +static const char * const nand_ecc_algos[] =3D {
> > +     [NAND_ECC_ALGO_UNKNOWN] =3D "none",
> > +     [NAND_ECC_ALGO_HAMMING] =3D "hamming",
> > +     [NAND_ECC_ALGO_BCH] =3D "bch",
> > +};
>
> No way you need this in your driver :-)
>
> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

