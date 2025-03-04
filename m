Return-Path: <linux-media+bounces-27488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274DA4DFC7
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 14:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1C1C189DAB5
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EF1204873;
	Tue,  4 Mar 2025 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aumIJXyw"
X-Original-To: linux-media@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2812D2040BA;
	Tue,  4 Mar 2025 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096347; cv=none; b=mQswgFcpnMfrwMzuzUtmovse2ZJY5ezzrBSaKETaY1rM7xwioPLPcFVyIR7jwiuKs+09l6CrKMLWiylJYIRXFz6S5eIUWPd9yuAaIeOP0zxZXnwy4RMnpr9GiuwRgMkkqiS+/TVC2zY5p2YIdTVGTsMec2Z/wOcccbCbcdGiito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096347; c=relaxed/simple;
	bh=KG+5ZDEmMAAlcs3FLvTikf2avS7in/3ZUEFbDpSO3pw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z3qQazrnibnx2MoScUUZWEHZ6CzOtWp2OGnoJ/cjdkQLUTuN8OCdXe4lAEv3HIYbEPxiS8FqJ5UhxT53C0KLPQod7//acCcJhNP8N1Wx8Q70qdFHRHT35/krbeZ2t9OFULECpZHqbmdk2MyP/tYmBHkdJwJ/6gJOsZCWBliW0Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aumIJXyw; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5957E442DF;
	Tue,  4 Mar 2025 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741096343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgvnIz652GdCe+1GOXltyjv7Y3wMFnRZ17oZzmJ1J3I=;
	b=aumIJXyw7r4wXdnxFIp7qTFxnKKhDnYzaa1H0Z4eQxjKOTu/R4qWGqqHuOXaLyUBFEPdBR
	UJ+H+aYc42fQWZQi/72HimeHW45R+AvJcSRTVhORNnJFiKN18i1U/p4EYPSKwtmA8ERprS
	IwzuB19aLvyrN9t2OUGl+qnZIHn6NQbcXTsdVF6OjBRLPU6olQwlp5o6trMvuSye8q5PIY
	UmdeL284CV3nQ7sDsIaEGbCbTPCADsep0sSLV5VXb5dkS3JdTVmYfzXz5EY2mj9PXgSAlp
	le2UMWyql+a4uaTUdPGmcSZ9LwpBOeoqbzx+hOKEGq+KXIz6TRHTw5atQtnraQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-media@vger.kernel.org
Subject: Re: [PATCH v12 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <CAJhJPsUw7YGKfBuFtUirOGuCA9hV6e-wjrL4L9b-5kmuVUW=ow@mail.gmail.com>
	(Keguang Zhang's message of "Tue, 4 Mar 2025 19:46:39 +0800")
References: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
	<20250121-loongson1-nand-v12-2-53507999de39@gmail.com>
	<87tt972dt0.fsf@bootlin.com>
	<CAJhJPsUw7YGKfBuFtUirOGuCA9hV6e-wjrL4L9b-5kmuVUW=ow@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Mar 2025 14:52:21 +0100
Message-ID: <87a5a0299m.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvvhhnuhhllhdokhgvghhurghnghdriihhrghnghdrghhmrghilhdrtghomheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Keguang,

>> > +static int ls1x_nand_exec_op(struct nand_chip *chip,
>> > +                          const struct nand_operation *op,
>> > +                          bool check_only)
>> > +{
>> > +     int ret;
>> > +
>>
>>         if (check_only) ?
>
> Sorry, I'm not sure if I understand correctly.
> nand_op_parser_exec_op() only checks patterns and will skip
> pattern->exec() when check_only =3D true. Therefore,
> ls1x_nand_check_op() should handle all opcode checks in that case, and
> leave check_only =3D false to nand_op_parser_exec_op().
> Then the code will return to:
>
> if (check_only)
>         return ls1x_nand_check_op(chip, op);
>
> return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op, check_only);
>
> Am I right?

Absolutely, yes.

Thanks,
Miqu=C3=A8l

