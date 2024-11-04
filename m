Return-Path: <linux-media+bounces-20797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A53E9BB4AE
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3CB1F2150B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EBD1B85EB;
	Mon,  4 Nov 2024 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY8JfEoW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD01B85C9;
	Mon,  4 Nov 2024 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730723449; cv=none; b=KvPIoMvbP0y+BYU0LSdA1jK7L8FGROO85yibDy6wBsXR70HhZqn+fm5fXJKgVlMAS5EMQ4Id2SfZK2mQxtPKl8ZdnsryDxoAFK2NHSpM7xNouCPnBAaFGv0VJf9Nikdb61K+vePyNUBw78KRpe68ll0cO3L0D+25wT8Y0k13rYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730723449; c=relaxed/simple;
	bh=+1pwXJjkDZruvn5Q37+5AIlc7Gon+baz3RnyTJMSWMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o82eYEwol0RL4QEGfC+J5Qf02hkCgdQ2IJL1h1VZgb3fT/g0jgwbGvFc5PXaVYAEvwpTlLr8mBm/HHkYv+WQuPtUSPnU1ukUoHoD6s0g9BmdKEzN6CpJ6j/OlLaooJt8bp63uvsgg4NIA7ZrRy+e93SJTEfRxKYCI2+U9ltsM8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY8JfEoW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a850270e2so695299766b.0;
        Mon, 04 Nov 2024 04:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730723446; x=1731328246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1pwXJjkDZruvn5Q37+5AIlc7Gon+baz3RnyTJMSWMo=;
        b=FY8JfEoWXrhlbiTpgEGmMsdUyyA+khxiIAOyNarP2nGd8/HssTApfRL+ON1EDZ37Iq
         MCj8PTAoMDj5hKpVutU6InitPqDt1cbTH6nUkWjlJv+xSLoUbprqQ4yD3Kwchq2wpU0a
         4F45raUa5yfXWiIOqfnWa3FlWznllkq8Aq9p9cQ1QeSCVlB8oVOQDxe/lYp2r1F2PbhG
         kCXvSPdC+tRG6/H/bdLKj1OyiXNhQnLDe0fS3eo2QCJCLuFvLeXcHoBwuXQTGKe9RId9
         bqZ2EeNXuEU8WJD8RF3JAoizOVeLjJhd4p5k2JVOoeMD7noP2rsa1GPw8bWmljOW7/oS
         mg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730723446; x=1731328246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1pwXJjkDZruvn5Q37+5AIlc7Gon+baz3RnyTJMSWMo=;
        b=VfB/Oj3YZJohGK9nTN/92PKXMJGsU6rIvpWWbTWb3/vOYPibAMoZ3n9/7d8U4+zXO4
         ZK94Vlmq5saDdBlGHYHsKA8E2aaPRZ6I5evOjFaX0LM5EtNK8G7noBFXOILvUHHKdrYN
         /fLOio0DjkUErq1SHQ+4yDIk/cO8ip9O53eTZyG9DBtJylxPS3NRPJ4T6Pnn/uLJ4nqA
         s4pKVcqCbUKuwhAnRgBH1pNTzi/Eq603xBVGL4CPbVTZWxrOZNC4w50phFnBRPJ/EVuU
         KcK/EDYitB+vfuyGOAO50at350A2PLUu8UyFwReIpo0s4J5ro5IYm/ZX3kbmegb4p26u
         3YWg==
X-Forwarded-Encrypted: i=1; AJvYcCXZHxyqVnE3YOmKp9AG/KFhJkSGkoqRD4QRIh6a4KuK75iqcwHRk8+8Q5ALZCtyTco8DE9+xrsfNRpvOBA=@vger.kernel.org, AJvYcCXjTGpcHOO208y1BM4kW9v3NqlWm75vWvopIi79ORX1vdpr1je/k8GuPSBaEBhWFoHR9j7gzZGTpEPVytE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtieekJl3kQ27yjTogJLHQwgUGIWzisNaRizY3q3RXGpytYmUr
	ZmrjhF+rxhsGUkskAM4GgXUwFh783urFwE+anUKHeDEvkgglHtNKZAo0li454sf0yh6djMwbz3q
	vc8Hzf8wnMcDRSRRHoRzCJQwrjOY=
X-Google-Smtp-Source: AGHT+IEShXixc8kpjb5phOvkzq0l3fuUH4YReu8ywuTqRrBUzx5Nyz7vJc+3JDwOca7Pwgn6G6QcRC4P5M36beuY5x4=
X-Received: by 2002:a17:907:2dac:b0:a99:6791:5449 with SMTP id
 a640c23a62f3a-a9e6587df7fmr1354587266b.52.1730723445505; Mon, 04 Nov 2024
 04:30:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com> <28958f62-9051-45a6-a26d-585508e2bd11@redhat.com>
In-Reply-To: <28958f62-9051-45a6-a26d-585508e2bd11@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Nov 2024 14:30:09 +0200
Message-ID: <CAHp75VdscXFTB+mfUgKBnut3_idT88mas20ZsohSd6nrcVOnFA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] media: atomisp: Remove License information boilerplate
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Bergh <bergh.jonathan@gmail.com>, Roshan Khatri <topofeverest8848@gmail.com>, 
	Dipendra Khadka <kdipendra88@gmail.com>, 
	Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kartik Kulkarni <kartik.koolks@gmail.com>, Kathara Sasikumar <katharasasikumar007@gmail.com>, 
	Tchadel Icard <hello@tchadelicard.fr>, Kate Hsuan <hpa@redhat.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 1:57=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 23-Sep-24 12:53 PM, Andy Shevchenko wrote:
> > We have the respective SPDX identifiers that are already being applied
> > to the files in question. Remove the License information boilerplate.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Thank you for your patch(es).

Thank you!

There is one patch (marked rft) left in the queue. Can you, please,
apply it locally to your branches which you use to test AtomISP with?
I'm talking about 20240923085652.3457117-1-andriy.shevchenko@linux.intel.co=
m.

--=20
With Best Regards,
Andy Shevchenko

