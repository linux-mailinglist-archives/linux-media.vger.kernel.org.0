Return-Path: <linux-media+bounces-16432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C60DF95613E
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 04:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DDC0B20A14
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 02:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54786335BA;
	Mon, 19 Aug 2024 02:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBnx85WV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2226D3BBEF;
	Mon, 19 Aug 2024 02:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724035909; cv=none; b=d/s1gBwLtPE7SOhM6dqaoq09PbyhrH38SlTwlHDr2A4ex1VfCih23dafttwQAukg8abhc+DBj9qwHW8IpfdQlZBHwWcjFU8f8ILrI0fMPVT8c7sOxXIzhPwGVdWi5o3DV+BkL2jUmezQRx7HxcAQq073BW5jho14QmVvYBYm/mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724035909; c=relaxed/simple;
	bh=iOAky0YuVIdmBSLAN1+x9Uot0I0GbwCG6AuRV+YGhic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1CALLGEJwKQ2bnWMWdx7citFDzLdjVMWOcLhbbm69goUXpXjHinlTFqTcl8VcrMTvne22SHy4nSY8QqpnZzkqbVLRzlcaOmsuG1VuExZbanDT4OCKttpfTqZxHc5NYCfn5F2I0WIJ4vKHeOMMkIsh37n92JCEp4I8iFqLaMn/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBnx85WV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37195f88a17so1774354f8f.3;
        Sun, 18 Aug 2024 19:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724035906; x=1724640706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOAky0YuVIdmBSLAN1+x9Uot0I0GbwCG6AuRV+YGhic=;
        b=UBnx85WVYcxEALrAGB85y7YHq9bqUCHaIjBo0dnfAPkKKBCSFEUzLOtRd7EO0csqlz
         KhSt0lC29ijgH50EHUnzUhufGZgRmBzR5W8gdncVAK4l53w/OXDAUov9uVHeFMzPKkI+
         sBQjgtv5K0hbER5WY4zbChczqf0XMrtTYqgzitHEcO1g3ERxOVCKJWlgzbwZpFQY3X8Q
         4x5DbqjYgmhiZi/dIdsqffULTpm0Dozlo0klviJYLdFpmN0UwaiOAbABnyeqE9LUNAgd
         8cIdtDqBniUH0xNUVEqOgskTuBSoAB0CAWXQ1Tu/Dnn7benmHXR9l87sN/6/IOvpmCOU
         hFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724035906; x=1724640706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOAky0YuVIdmBSLAN1+x9Uot0I0GbwCG6AuRV+YGhic=;
        b=fUi+IlfYHspmU383lQhI3L8iLz/iNak/Q1amvrKYRHKCqSm/n9Umnx0DRBqA3V1rMf
         sE9XCQF3BQTF8NbP0S39zCvDnxnbMVubx7rqM1hcJaU1eTX+Pe16sBpZo1KW5skVjTuq
         lQrqA2iRO2BOflGHDu80IjYtqp4qefauZbk8ZwZDSfjjFS5VYz5qQ4glaQ0jF64+WzJ1
         a9W6Dj7KUACfsSLi4mxJF3aJph0KH8lYs22BXQF4zr7miJxykTCMvjtR2aRq1QtcWal6
         9JoNvi4c7KadSyMa/TkdAQNkxNl53tM9lM3J/2WByyw6Pjyq1VQT8EjcLSI6pt9Sg4sD
         qrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnkBMPUocD4UOc/NkU0q/Ecfk35HjyxfLHuJQdN9ksPU6bJ0IKW5FRmxTR3HtwUEghPqJuDLFrBRAFU9H3qucgKZ6qO6wDMXqc4nCNtFgvZYQZsGw/qQryqpR70fyatfiysq91B1fsC/q9hGGadkP502WgtidH/VjbbW52RKdRLFv3JCMh
X-Gm-Message-State: AOJu0YxWk6e24xu6K8UhqMBn270wiAHQZ2r+wmezOaJGmuU0m/efRrsa
	8cWY2vdCpsNe6Kgdnw3cepOgxy4sdwx/OzyWdXOuLykkDV/ue+G54dIXg8ij0mGjGqE+5ZoKbTb
	WEW2EP9v2dz+9rukhGYod8KaaOKk=
X-Google-Smtp-Source: AGHT+IH619dt1C/HugVRab8KXzPRU/jfFMZu/ooXKNJwmcmoQBV7Gqj1VMZBI8HGX8T1g7AECYwMYGRs0fV589TfrJA=
X-Received: by 2002:a05:6000:186:b0:367:8ff0:e022 with SMTP id
 ffacd0b85a97d-371946b0ddcmr5515014f8f.63.1724035905695; Sun, 18 Aug 2024
 19:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com> <20240808-backyard-unglue-3cf429ad8da5@spud>
 <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
 <20240809-smuggler-patrol-067003f0ba9b@spud> <20240814091231.1d9525be@xps-13>
In-Reply-To: <20240814091231.1d9525be@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 19 Aug 2024 10:51:09 +0800
Message-ID: <CAJhJPsWBKNZmDQreigABVxLqUg_F+BGT7dUnO9C09pNDovbxMQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 3:12=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi,
>
> > > > When I first read "nfc" here I thought it was a copy-paste mistake,=
 as
> > > > "nfc" is a technology of it's own. I think it would make sense to r=
ename
> > > > to "loongson,ls1b-nand-controller" etc to remove that sort of confu=
sion.
> > > > These devices might not implement NFC, but what's to say that a fut=
ure
> > > > device will not?
>
> I believe the nfc (also, nc) abbreviation pre-dates the NFC spec. But I
> agree, it may be misleading. Even though I don't foresee any NAND
> controller with NFC coming, it's probably bad for newcomers/people who
> are not already deeply into the mtd details to use these confusing
> letters, especially in a binding.
>
> So, Ack.
>
> > > Sorry for the confusion.
> > > The string "loongson,ls1b-nand-controller" might be too long.
> >
> > It "might"? Why do you think it is too long?
>
> Yeah, why would it be too long? Let's call a cat a cat. This is a
> compatible for a NAND controller. So I expect the string to mention
> it's a NAND controller because it's clearer. For quite some time there
> has been a confusion between the NAND controller and the NAND
> flash/chip, but these are two different hardware components.
>
> > > May I rename it to "loongson,ls1b-nand"?
>
> For the above reason, no :)

Will change it to "loongson,ls1b-nand-controller" and rename the
filename accordingly.
Thanks!
>
> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

