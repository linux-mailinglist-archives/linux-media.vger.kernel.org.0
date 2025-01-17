Return-Path: <linux-media+bounces-24877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D87A14EEC
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 12:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0B18163A17
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292421F63ED;
	Fri, 17 Jan 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/VHSiID"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E11F9F55;
	Fri, 17 Jan 2025 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737115160; cv=none; b=dzVf7ki/LCDE0QyRa4zi3yb2qcQmVyxo6xU2Irg4B4pE6P48s9x2O55N9h9N9jsLOncWz0UNsIb60LocFFlFDYqnvOerW8j30wgGro1o6yPfMeFEswEllI1KXo+9PVMOecu/odHBghjyI5hgiFKmTdzSUzVfJZvWQVPVBHx/Kks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737115160; c=relaxed/simple;
	bh=fdhBTIi7kLsGDUzev1kgH1YCrWaqFmaBlkyxc0Jg3zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPu1WzQoXi1/8ZfFfILsheZqGfFrpwkHHGg5BbxK1oeqofCgjpFkuxn6g8UlBtD4VYA4kXVC3/1hDvNB2oZ/ltYgCkykzBMV/px8F4OJmZYgdQ7HDSeQRTkPuisz1gr8WcsZkaEyj0IleCm/zEN8QJcvIuF6ZnMKnhx0NxI34t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/VHSiID; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5db689a87cbso3550053a12.3;
        Fri, 17 Jan 2025 03:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737115157; x=1737719957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlnNNKdqxKKB+0KvYDd610dcbHcNYn5h+L0eQLkDywk=;
        b=W/VHSiIDPY91vJwS0rxSvzlYZYhNmReTpdkV7Jvbjc9OyS1USdDPkffQXwU5uRRlkD
         CgJlxuUJhKbwo4vW3McWeeV+gc8QjWxoOa8Kei/CKE91lP52dJ82e+j0Ywz2R7mt3dty
         2CO+3rTZSyrDnLKnFAiZahjb70aGwBJ7duOnrJVzuU/p/GwsOVJj9MdFde9fQn69n3W2
         +fbMJApD0qJYhH1PXqqhbnL4S1FGh8lBTXNj9zoWAvXWGcd0QSwtSwmTrNs5mChSaMlC
         1zSWXdrjYVjkTJ67003EVBy2oTWsqbPlpA7zwEZSKFeQ0fnJF3eNKuxaS4ag9eIfnECv
         UcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737115157; x=1737719957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlnNNKdqxKKB+0KvYDd610dcbHcNYn5h+L0eQLkDywk=;
        b=Ipk0aQjJWgOBgHMX+xEoDP26XwGg4WVyA+FcwF/fc1DvDVEILE+hJE8xxPmzHhop2U
         /OUxqLmEywzFxqCgnjeEA3qTjwZEFa6K4zaXkSSoTkRXGxzO7tB9hlG14cWrx7M61XrC
         SZjbXLHP7pHsQLOMYJRceUnhHfVi9GXXAjuM/0EqCjUlGV+7YibSWpXhBboZ4PMG2Xgt
         KyrYhBymq/fA8P6ODR58Z8YlQoXdg85xhCWPoIjwfB6i1bNzjVW5BjCFdbNrxrVWcNcO
         LuV8IR+J8msoh1OBWRH7QJNmU03I/zLq1DBEp9sbtd8uxKKY9fztZD7/4LUjv8fV5o8K
         SAXw==
X-Forwarded-Encrypted: i=1; AJvYcCUDTQV4JfDFxzZpQiD/WCF0hbii1Hjbeh/yo5qZC/s2BxR+628/NtgtY3+Gcf27yFZcZSaIzsstWUhvRSqu@vger.kernel.org, AJvYcCVUt+wK3a0n/FiiLZ0FqTsZEY9SRudGh4dSHks+9+nn5pMV5B2xKCgUh8YmBtEqK4SPa56yMiEVIO7a@vger.kernel.org, AJvYcCXpsG1L5oC1cfbh1d+JEZuR9fISoeQ6wjhVe0LcWTfbdhNzXQMZymxmjpjvVn6A5vHa2a0z+0/Xcp5rl4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFKmgNgOnblI02lv6rYaX2G6xU0XV34GamgucmgDEcKpHXMeLI
	Old/Ac4ynzAw/mYsM45JLyudGS+OoaYXtjcKOtrfr7nr1umjzpvjay0u0h8qfAgYhGeVaus8Swl
	rZJ8YYG/4hX+24XM8+H//Os6I/kY=
X-Gm-Gg: ASbGnctb7vHY0+xEb4/qbM/RDkWtsogA8PNiFNaG/Z6z8N5q46r7unT9C4TVh5o0Cir
	ayzio5QTGo3JVareWvQQMTm43+g7lgkTpUI0Sxao=
X-Google-Smtp-Source: AGHT+IHfIR+xbISvX2qPWa8mjRUk2Vgs1uJJDiq2502k3ozYAyJa5rzpQCm2IvuA2xVac0mNdwLLNbK9usob/kyK4pQ=
X-Received: by 2002:a05:6402:845:b0:5d0:cd85:a0fe with SMTP id
 4fb4d7f45d1cf-5db7d339cdamr1800146a12.25.1737115156513; Fri, 17 Jan 2025
 03:59:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com> <87v7ufnc0w.fsf@bootlin.com>
In-Reply-To: <87v7ufnc0w.fsf@bootlin.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 17 Jan 2025 19:58:39 +0800
X-Gm-Features: AbW1kvYA7FVSBFdV9eoFK9A28dF2tOaxBUk_bcumjmq3fqty3qbKbUkx6ejwWD0
Message-ID: <CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Miquel,

On Thu, Jan 16, 2025 at 2:54=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hello Keguang,
>
> On 17/12/2024 at 18:16:50 +08, Keguang Zhang via B4 Relay <devnull+keguan=
g.zhang.gmail.com@kernel.org> wrote:
>
> > +static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls1=
x_nand_op *op, u8 opcode)
> > +{
> > +     struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
> > +     int ret =3D 0;
>
> This return code is unused.
>
> > +
> > +     op->row_start =3D chip->page_shift + 1;
> > +
> > +     /* The controller abstracts the following NAND operations. */
> > +     switch (opcode) {
> > +     case NAND_CMD_STATUS:
> > +             op->cmd_reg =3D LS1X_NAND_CMD_STATUS;
> > +             break;
> > +     case NAND_CMD_RESET:
> > +             op->cmd_reg =3D LS1X_NAND_CMD_RESET;
> > +             break;
> > +     case NAND_CMD_READID:
> > +             op->is_readid =3D true;
> > +             op->cmd_reg =3D LS1X_NAND_CMD_READID;
> > +             break;
> > +     case NAND_CMD_ERASE1:
> > +             op->is_erase =3D true;
> > +             op->addrs_offset =3D 2;
> > +             break;
> > +     case NAND_CMD_ERASE2:
> > +             if (!op->is_erase)
> > +                     return -EOPNOTSUPP;
> > +             /* During erasing, row_start differs from the default val=
ue. */
>
> ...
>
> > +static void ls1x_nand_trigger_op(struct ls1x_nand_host *host, struct l=
s1x_nand_op *op)
> > +{
> > +     struct nand_chip *chip =3D &host->chip;
> > +     struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +     int col0 =3D op->addrs[0];
> > +     short col;
> > +
> > +     /* restore row address for column change */
> > +     if (op->is_change_column) {
> > +             op->addr2_reg =3D readl(host->reg_base + LS1X_NAND_ADDR2)=
;
> > +             op->addr1_reg =3D readl(host->reg_base + LS1X_NAND_ADDR1)=
;
> > +             op->addr1_reg &=3D ~(mtd->writesize - 1);
> > +     }
>
> This looks very suspicious. You should not have to do that and to be
> honest, I don't undertand what this means.
>
The Loongson-1 NAND controller requires a full address (column address
+ row address).
However, nand_change_read_column_op() function only provides the
column address. Therefore, the row address must be restored.
The above logic retrieves the row address from the addr1_reg in order
to restore the row address.

> > +
> > +     if (!IS_ALIGNED(col0, chip->buf_align)) {
> > +             col0 =3D ALIGN_DOWN(op->addrs[0], chip->buf_align);
> > +             op->aligned_offset =3D op->addrs[0] - col0;
> > +             op->addrs[0] =3D col0;
> > +     }
> > +
> > +     if (host->data->parse_address)
> > +             host->data->parse_address(op);
> > +
> > +     /* set address */
> > +     writel(op->addr1_reg, host->reg_base + LS1X_NAND_ADDR1);
> > +     writel(op->addr2_reg, host->reg_base + LS1X_NAND_ADDR2);
> > +
> > +     /* set operation length */
> > +     if (op->is_write || op->is_read || op->is_change_column)
> > +             op->len =3D ALIGN(op->orig_len + op->aligned_offset, chip=
->buf_align);
> > +     else if (op->is_erase)
> > +             op->len =3D 1;
> > +     else
> > +             op->len =3D op->orig_len;
> > +
> > +     writel(op->len, host->reg_base + LS1X_NAND_OP_NUM);
> > +
> > +     /* set operation area */
> > +     col =3D op->addrs[1] << BITS_PER_BYTE | op->addrs[0];
> > +     if (op->orig_len && !op->is_readid) {
> > +             if (col < mtd->writesize)
> > +                     op->cmd_reg |=3D LS1X_NAND_CMD_OP_MAIN;
> > +
> > +             op->cmd_reg |=3D LS1X_NAND_CMD_OP_SPARE;
> > +     }
> > +
> > +     /* set operation scope */
> > +     if (host->data->op_scope_field) {
> > +             unsigned int op_scope;
> > +
> > +             switch (op->cmd_reg & LS1X_NAND_CMD_OP_AREA_MASK) {
> > +             case LS1X_NAND_CMD_OP_MAIN:
> > +                     op_scope =3D mtd->writesize;
> > +                     break;
> > +             case LS1X_NAND_CMD_OP_SPARE:
> > +                     op_scope =3D mtd->oobsize;
> > +                     break;
> > +             case LS1X_NAND_CMD_OP_AREA_MASK:
> > +                     op_scope =3D mtd->writesize + mtd->oobsize;
> > +                     break;
> > +             default:
> > +                     op_scope =3D 0;
> > +                     break;
> > +             }
>
> Please get rid of this extra step. I'm not a big fan of it, but this can
> be very well simplified and this whole switch removed.
>
Will simplify this logic.

> > +
> > +             op_scope <<=3D __ffs(host->data->op_scope_field);
> > +             regmap_update_bits(host->regmap, LS1X_NAND_PARAM,
> > +                                host->data->op_scope_field, op_scope);
> > +     }
> > +
> > +     /* set command */
> > +     writel(op->cmd_reg, host->reg_base + LS1X_NAND_CMD);
> > +
> > +     /* trigger operation */
> > +     regmap_write_bits(host->regmap, LS1X_NAND_CMD, LS1X_NAND_CMD_VALI=
D, LS1X_NAND_CMD_VALID);
> > +}
> > +
>
> ...
>
> > +static const struct nand_op_parser ls1x_nand_op_parser =3D NAND_OP_PAR=
SER(
> > +     NAND_OP_PARSER_PATTERN(
> > +             ls1x_nand_read_id_type_exec,
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CY=
C),
> > +             NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 8)),
> > +     NAND_OP_PARSER_PATTERN(
> > +             ls1x_nand_read_status_type_exec,
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 1)),
> > +     NAND_OP_PARSER_PATTERN(
> > +             ls1x_nand_zerolen_type_exec,
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> > +     NAND_OP_PARSER_PATTERN(
> > +             ls1x_nand_zerolen_type_exec,
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CY=
C),
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> > +     NAND_OP_PARSER_PATTERN(
> > +             ls1x_nand_data_type_exec,
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CY=
C),
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> > +             NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 0)),
> > +     NAND_OP_PARSER_PATTERN(
> > +             ls1x_nand_data_type_exec,
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CY=
C),
> > +             NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 0),
> > +             NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +             NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> > +     );
> > +
> > +static inline bool ls1x_nand_is_valid_cmd(u8 opcode)
> > +{
> > +     return opcode =3D=3D NAND_CMD_RESET ||
> > +            opcode =3D=3D NAND_CMD_READID ||
> > +            opcode =3D=3D NAND_CMD_ERASE1 ||
> > +            opcode =3D=3D NAND_CMD_ERASE2 ||
> > +            opcode =3D=3D NAND_CMD_STATUS ||
> > +            opcode =3D=3D NAND_CMD_SEQIN ||
> > +            opcode =3D=3D NAND_CMD_PAGEPROG ||
> > +            opcode =3D=3D NAND_CMD_RNDOUT ||
> > +            opcode =3D=3D NAND_CMD_RNDOUTSTART ||
> > +            opcode =3D=3D NAND_CMD_READ0 ||
> > +            opcode =3D=3D NAND_CMD_READSTART;
> > +}
> > +
> > +static inline bool ls1x_nand_is_cmd_sequence(const struct nand_op_inst=
r *instr1,
> > +                                          const struct nand_op_instr *=
instr2)
> > +{
> > +     return instr1->type =3D=3D NAND_OP_CMD_INSTR && instr2->type =3D=
=3D NAND_OP_CMD_INSTR;
> > +}
> > +
> > +static inline bool ls1x_nand_is_erase_sequence(const struct nand_op_in=
str *instr1,
> > +                                            const struct nand_op_instr=
 *instr2)
> > +{
> > +     return instr1->ctx.cmd.opcode =3D=3D NAND_CMD_ERASE1 &&
> > +            instr2->ctx.cmd.opcode =3D=3D NAND_CMD_ERASE2;
> > +}
> > +
> > +static inline bool ls1x_nand_is_write_sequence(const struct nand_op_in=
str *instr1,
> > +                                            const struct nand_op_instr=
 *instr2)
> > +{
> > +     return instr1->ctx.cmd.opcode =3D=3D NAND_CMD_SEQIN &&
> > +            instr2->ctx.cmd.opcode =3D=3D NAND_CMD_PAGEPROG;
> > +}
> > +
> > +static inline bool ls1x_nand_is_read_sequence(const struct nand_op_ins=
tr *instr1,
> > +                                           const struct nand_op_instr =
*instr2)
> > +{
> > +     return (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_READ0 &&
> > +             instr2->ctx.cmd.opcode =3D=3D NAND_CMD_READSTART) ||
> > +            (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_RNDOUT &&
> > +             instr2->ctx.cmd.opcode =3D=3D NAND_CMD_RNDOUTSTART);
> > +}
> > +
> > +static int ls1x_nand_check_op(struct nand_chip *chip, const struct nan=
d_operation *op)
> > +{
> > +     const struct nand_op_instr *instr;
> > +     int op_id;
> > +
> > +     for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
> > +             instr =3D &op->instrs[op_id];
> > +
> > +             switch (instr->type) {
> > +             case NAND_OP_CMD_INSTR:
> > +                     if (!ls1x_nand_is_valid_cmd(instr->ctx.cmd.opcode=
))
> > +                             return -EOPNOTSUPP;
> > +                     break;
> > +             case NAND_OP_ADDR_INSTR:
> > +                     if (instr->ctx.addr.naddrs > LS1X_NAND_MAX_ADDR_C=
YC)
> > +                             return -EOPNOTSUPP;
> > +                     break;
> > +             default:
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (op->ninstrs =3D=3D 4 &&
> > +         ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs[2]) &&
> > +         !ls1x_nand_is_erase_sequence(&op->instrs[0], &op->instrs[2]))
> > +             return -EOPNOTSUPP;
> > +
> > +     if (op->ninstrs =3D=3D 5) {
> > +             if (ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs=
[2]) &&
> > +                 !ls1x_nand_is_read_sequence(&op->instrs[0], &op->inst=
rs[2]))
> > +                     return -EOPNOTSUPP;
> > +
> > +             if (ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs=
[3]) &&
> > +                 !ls1x_nand_is_write_sequence(&op->instrs[0], &op->ins=
trs[3]))
> > +                     return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ls1x_nand_exec_op(struct nand_chip *chip,
> > +                          const struct nand_operation *op,
> > +                          bool check_only)
> > +{
> > +     if (check_only)
> > +             return ls1x_nand_check_op(chip, op);
> > +
>
> It lookse like you're re-encoding all your requirements in
> ls1x_nand_check_op(), whereas nand_op_parser_exec_op(check_only :=3D true=
)
> should give you already a certain number of verifications which are
> skipped here. I'd suggest to improve this to avoid repetitions between
> the two. Of course the second part of nand_check_op is necessary, but
> the initial checks seem redundant and would better be performed by the pa=
rser.
>
Indeed, this logic seems a little wierd.
In addition, ls1x_nand_check_op() must always be executed whenever
check_only is set.
Will fix this logic and drop the first part of ls1x_nand_check_op().

> > +     return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op, che=
ck_only);
> > +}
> > +
> > +static int ls1x_nand_attach_chip(struct nand_chip *chip)
> > +{
>
> ...
>
> > +static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
> > +{
> > +     struct device *dev =3D host->dev;
> > +     struct dma_chan *chan;
> > +     struct dma_slave_config cfg =3D {};
> > +     int ret;
> > +
> > +     host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &ls1x=
_nand_regmap_config);
> > +     if (IS_ERR(host->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(host->regmap), "failed =
to init regmap\n");
> > +
> > +     chan =3D dma_request_chan(dev, "rxtx");
> > +     if (IS_ERR(chan))
> > +             return dev_err_probe(dev, PTR_ERR(chan), "failed to reque=
st DMA channel\n");
> > +     host->dma_chan =3D chan;
> > +
> > +     cfg.src_addr =3D host->dma_base;
> > +     cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +     cfg.dst_addr =3D host->dma_base;
>
> Don't you need a dma_addr_t here instead? You shall remap the resource.
>
Sorry, I don't quite understand.
'dma_base' is already of type dma_addr_t.

Thanks for your review!

> > +     cfg.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +     ret =3D dmaengine_slave_config(host->dma_chan, &cfg);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to config DMA chan=
nel\n");
> > +
> > +     init_completion(&host->dma_complete);
> > +
> > +     dev_dbg(dev, "got %s for %s access\n", dma_chan_name(host->dma_ch=
an), dev_name(dev));
> > +
> > +     return 0;
> > +}
> > +
> > +static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
> > +{
> > +     struct device *dev =3D host->dev;
> > +     int nchips =3D of_get_child_count(dev->of_node);
> > +     struct device_node *chip_np;
> > +     struct nand_chip *chip =3D &host->chip;
> > +     struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +     int ret =3D 0;
> > +
> > +     if (nchips !=3D 1)
> > +             return dev_err_probe(dev, -EINVAL, "Currently one NAND ch=
ip supported\n");
> > +
> > +     chip_np =3D of_get_next_child(dev->of_node, NULL);
> > +     if (!chip_np)
> > +             return dev_err_probe(dev, -ENODEV, "failed to get child n=
ode for NAND chip\n");
> > +
> > +     chip->controller =3D &host->controller;
> > +     chip->options =3D NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BR=
OKEN_XD;
> > +     chip->buf_align =3D 16;
> > +     nand_set_controller_data(chip, host);
> > +     nand_set_flash_node(chip, chip_np);
> > +
> > +     mtd->dev.parent =3D dev;
> > +     mtd->name =3D "ls1x-nand";
>
> No, the name is gonna be filled automatically when you call
> nand_set_flash_node IIRC.
>
> > +     mtd->owner =3D THIS_MODULE;
> > +
> > +     ret =3D nand_scan(chip, 1);
> > +     if (ret) {
> > +             of_node_put(chip_np);
> > +             return ret;
> > +     }
> > +
>
> It looks like your controller does not support any ECC correction, if
> that's the case you must make sure it's properly handled in attach_chip
> hook by refusing to probe if the on_host engine is used.
>
> Thanks,
> Miqu=C3=A8l



--
Best regards,

Keguang Zhang

