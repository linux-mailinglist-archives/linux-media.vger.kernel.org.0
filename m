Return-Path: <linux-media+bounces-6601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED387417F
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 21:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39681C240AC
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 20:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3456E14A82;
	Wed,  6 Mar 2024 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vGcGH3lW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83017543
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709757667; cv=none; b=OY1TXPlDnCw2w7QWufWMo6iUusATcDH0beoUcMXJeWUY0B7D3p6fGI3hhIboCV0B30s0BHj3qYBQRj3RpXVtADl1xzfGuBcYrGLK2RvIeT3UBmEaf0cbu7KRWV13lvQJjODUVKw3PTY7ED7ijVBRyUeSUqDNJdayLVZT3rG+/fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709757667; c=relaxed/simple;
	bh=D61uvbx4HmTlqMk3crqiWc8K0eoK6nSYmpHXWpZdQUo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EekcJd3++uOIvYJjLgAw8eghQA+koUmhiw/9CKuMqJm6wrRUUnSQSWcp9gISlMqH13iFBlj5xinT8kFK8vkp+5wynzF+yWKeCC+5XHhceq/tbzyvq+zylkwAqcC54tXQGAt6xsNcQgyH7/fTf/X/AyqlbYauLaXvo33zf0Yzl78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vGcGH3lW; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-42edf8325f6so683471cf.0
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 12:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1709757663; x=1710362463; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uimJmY/j8jQufeUryeoEHn/ksV6syjDpNTGQ3aRcpVI=;
        b=vGcGH3lWto14lrCncfVVxwV49tLNKXNYaW8kJVMkyuqRy6FIz7mtG9rhQ054GzIgcA
         oNIceS43PnV5goh0bzaLOQ0r48KFBryfB1Y/MFfygeSAElaBujxr6aGfpGsgTw6Ok0Il
         fv1l407qOYFNGz8hlnTcF1Zj+i6MEPgpjMlYLHd8SWbZOdf5Gzs91jO2D1rWrFuXCyeY
         vfIlxhnKjbjXrlqj+51kkqP6kEVMeqwRdzi+fuofjDXlHGk/h4hyMNWLbqL4wwGtVYXR
         lTd6cU+ajhA4Qe48TdEsu/BLXd2Ou7w1oxdkcpFhQH1lY/UWm5slo4mWiqxgi173Qo3x
         tfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709757663; x=1710362463;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uimJmY/j8jQufeUryeoEHn/ksV6syjDpNTGQ3aRcpVI=;
        b=sijM8WbkvhtA3jTlN7H8EQI3jmVp/VY/Q7565h0BNsGO2b5aQma5CkL9lW98yOvSDx
         u6LwjeZM6T5+KmETiLh5Bgip5K7douXT22r86X0gTgQUKYc2yZuKJah0rBzYc7BJzFx6
         7vIDwInrZgTbf27hSjXrLOuajVmvQC3mKkz5V97p7q7A5sd6ihdgdSBj3MUh/+6nWKtG
         dCLKlXS+UZncnlj8KO1RTNpcY6JkkAO6vnejgvd49bK2wEZ3/Vb6k1rA2+VWC9ZZ0IX3
         Egj89FTcbKUGSP2OHp1B+EFLq3AP2Il+8PEnT8GVhPnA1LLhJVf6kzS0h4ENZBo8yaBM
         n4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWqESGR4jriEpUtr3wHLDXpCuxBZw36ZpSKpcRI1VUuUfzdVB6mnZYmTLnuCkvqGriZRWUhpZ35slxlNoJqzXhMIST57mjmaE80P/g=
X-Gm-Message-State: AOJu0YyBohGRUn3/JqpubdL7JiSmld13sJA0loJmkXpN5O8GLNqLPqNw
	groohIVjSW6IHDPpAmiwJXVd7k46nyAPrAJcPhhygBV44k9NZo0ZO56myq/V3yPEJ6jqd++RP89
	e
X-Google-Smtp-Source: AGHT+IEHS29+ZP9C1XsvEJdilbixT762y7OtBUqepXgdCR+776Z8Pv4BSx3QPM4fBfmpVkClUASd5Q==
X-Received: by 2002:a05:622a:2c9:b0:42e:e20a:64ad with SMTP id a9-20020a05622a02c900b0042ee20a64admr6303049qtx.65.1709757662983;
        Wed, 06 Mar 2024 12:41:02 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:eba4::7a9])
        by smtp.gmail.com with ESMTPSA id h24-20020ac85058000000b0042ee02f7b92sm4442757qtm.89.2024.03.06.12.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 12:41:02 -0800 (PST)
Message-ID: <886777e1c6ac552a695df61fddab56a79d6538cf.camel@ndufresne.ca>
Subject: Re: Using the videobuf2 framework for USB bulk transfers?
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Florian Echtler <floe@butterbrot.org>, linux-media@vger.kernel.org
Date: Wed, 06 Mar 2024 15:41:01 -0500
In-Reply-To: <920db340-bbd5-4fcc-94e1-f11983b7d874@butterbrot.org>
References: <920db340-bbd5-4fcc-94e1-f11983b7d874@butterbrot.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 05 mars 2024 =C3=A0 15:36 +0100, Florian Echtler a =C3=A9crit=C2=
=A0:
> Hello everyone,
>=20
> I'm taking another stab at fixing the DMA bug in the sur40 driver which h=
as been=20
> present for some time now.
>=20
> The bug was introduced as a side effect of this commit:=20
> https://github.com/torvalds/linux/commit/6eb0233ec2d0df288fe8515d5b0b2b15=
562e05bb
>=20
> The sur40 is a bit of an odd duck which uses USB bulk transfers for video=
 data,=20
> so AFAICT there is no other driver I could use as an example for this com=
bination.

The UVC driver can operate in BULK. It really depends on the UVC device you
have. This is one of the rare device I know for that:

https://inogeni.com/product/4k2usb3/

What is the symptoms ? maybe I didn't notice it and its now having this bug=
 ?
...

>=20
> I've tried the following variants:
>=20
> - videobuf2-dma-sg (this is the currently broken in-kernel version):
>=20
>    Fails with error -22 (EINVAL) in usb_sg_init, because sgt->nents is 0.=
 Can't
>    tell what the root cause is, but based on the message of the breaking =
commit,
>    I would assume that using dma-sg directly for USB devices is simply no=
t
>    supported?
>=20
> - videobuf2-vmalloc:
>=20
>    Fails with dmesg error: ehci-pci: rejecting DMA map of vmalloc memory =
(this is
>    sort of understandable, I guess, just wanted to be sure).
>=20
> - videobuf2-dma-contig:
>=20
>    Fails with dmesg error: dma alloc of size 520192 failed. This seems qu=
ite low,
>    it shouldn't be an issue to map 500k of contiguous memory somewhere?
>=20
> So, in summary, my question is: how should I use the videobuf2 framework =
to get=20
> USB bulk data into V4L2 buffers as efficiently as possible? Because it do=
es seem=20
> that none of the "obvious" solutions works...

Ah, I believe I see the difference, UVC driver will always bounce the data =
into
vmalloc buffer, cause the data is chunked and payload in variable sizes. So=
 its
not using any of the 3 allocators you mention. That being said, videobuf2-d=
ma-
contig should have worked, its used in nearly all the codecs driver, includ=
ing
for 4K decoding.

https://elixir.bootlin.com/linux/latest/source/drivers/media/usb/uvc/uvc_vi=
deo.c#L1677

Nicolas

>=20
> Thank you and best, Florian
> --=20
> SENT FROM MY DEC VT50 TERMINAL


