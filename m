Return-Path: <linux-media+bounces-6663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5295E8758E6
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 21:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFFFA1F24EB5
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 20:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47C313A882;
	Thu,  7 Mar 2024 20:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="yup57+5/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930C013A248
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709844969; cv=none; b=eZ72EY1lhJTum6XaYd7ySverKIVeElKDGpQORzkoMo/Iyn6uHmM232G+6WfBokUD4N/0L22cxdRQm9O3G4JGlJKqnw2ISn1nDLqBL2iwLSXOIPt3LVKIfxCzKChrst45kvW9Y4vue4mEHimch3Z70vqhotied6+MP+TLiNxX/wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709844969; c=relaxed/simple;
	bh=2n/MjL/4X+81aIV4UEAdU1iKxvGLTF8COYlSEQXZy/U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=McYo+E7z+2iPPe+AfZvWTOuim69Amz9TD+SRbnWGAl+qWedqMrIs3Rz+0iJDy2/zHfHGVQWsUM238RvTJGDNKOf8bL+rliUQZVfDtcZwVrJeYBnoR5WvYgn9j9WxPtjtDzSFT6IVIaWvjnjQEUcM2YEKFvpavaF+AOMcvqqVAjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=yup57+5/; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-787edfea5adso12925185a.2
        for <linux-media@vger.kernel.org>; Thu, 07 Mar 2024 12:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1709844965; x=1710449765; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tw1twkim3tJHa4ruEXI5vxr7AEW36vJHstefhfBYjKw=;
        b=yup57+5/OnW1ynH5Wx6P5l+ZYF5hRJqTSjU+n+tt6+huLUOXZRS2ynQ/wRtzs7BOf5
         zYiU679eTbEEZV1/ByHTA8jQZcyQSSuUj8KgD/KOlMul+my3uJe9d7GuvG0qzabS/qXv
         kLggHc2sIvS4rwmVKf83mgvMFdD10mRDHjYZiJbo+E+18rTtzbcnthwa9x8krRBMsRUw
         otcKqv8ie+pQucBhWHJ6L4gDTHhNN1apViL7MCJNQK0ZKt/Z2cNf+SWBBUjAZzXihE2O
         Lvyv+bshmCnAQYxv33D51fRR9541J9Zeq1ZMUxHSk89MP1EVErexUwqVVt11jPgkdrMR
         eBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709844965; x=1710449765;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tw1twkim3tJHa4ruEXI5vxr7AEW36vJHstefhfBYjKw=;
        b=m0v3IFbj7fRbJr1NwUKMfwJUzHBujWzLaMqs5mC2UIZbiPWT9OFmjJpI4hEPr413Xn
         Q3UjrlW5Eu0CBDHd/NMJAWPUlsE+u7SpCpPfbBl8txiQZ8LbYgDnzObnLNt6ylXXQ9sn
         IHYDnwOuIYvHzEJW5ejkzhf6ISnpZ/ctjYEVqndW0dJpy+ADxX3GaRAuB2z+e3Wu6dFa
         /6bCo7MCbSqeem2xp5LKcQdeiuunHbBKZJQY5qWwuH/5gqoYbxpm+ZwbCbqZ9MX/DbPz
         h3tb3ti5ybCnqLNSrV738+4nfHCCiHB3bcYuFfewCP+fXFdZJXTxhRJkPo9fUEEuaiRM
         vV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWISQRl+kPIsr0uh9nMrfFvAKnZd5LMh1mo7J3G8HAIu4RzdE+yrhpz6lkxRosPp6dROyHu/V+No1G/bBj47PekNBm2Bz8ezj2dO98=
X-Gm-Message-State: AOJu0YxqUmiTdcmJevKSzUhfw1LlaT53NGpdrd5GNNXsbVC3AVkHc3Tn
	Hx9fGgOJ0KFCdIFDIKpLUqwBlEEkjBbRj1djIKBX2vuarvD+Kj+tSB0ZHzPWHSA=
X-Google-Smtp-Source: AGHT+IHSboxGSHFyQhRKAiV/dXr6jr+xeGSxmpeqPr8L6HZBuX56WMJ5wkIjORNZwzAww9do3Q4Hdg==
X-Received: by 2002:a05:620a:31a:b0:788:1a88:3cf6 with SMTP id s26-20020a05620a031a00b007881a883cf6mr8869605qkm.21.1709844965459;
        Thu, 07 Mar 2024 12:56:05 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:eba4::7a9])
        by smtp.gmail.com with ESMTPSA id z17-20020a05620a101100b007876e91f392sm6204346qkj.79.2024.03.07.12.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 12:56:05 -0800 (PST)
Message-ID: <c70935815ffc29ae5256b94c0e4880952abad79c.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v2 2/2] media: rkvdec: rewrite parts of the driver
 in Rust
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>, wedsonaf@gmail.com, 
	ojeda@kernel.org, mchehab@kernel.org, hverkuil@xs4all.nl
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, kernel@collabora.com
Date: Thu, 07 Mar 2024 15:56:03 -0500
In-Reply-To: <20240307190841.10260-3-daniel.almeida@collabora.com>
References: <20240227215146.46487-1-daniel.almeida@collabora.com>
	 <20240307190841.10260-1-daniel.almeida@collabora.com>
	 <20240307190841.10260-3-daniel.almeida@collabora.com>
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

Hi Daniel,

as I'm already sold to the idea, I decided to discuss other things ;-P see
below.

Le jeudi 07 mars 2024 =C3=A0 16:08 -0300, Daniel Almeida a =C3=A9crit=C2=A0=
:
> +++ b/drivers/staging/media/rkvdec/regs.rs
> @@ -0,0 +1,237 @@
> +#![allow(dead_code)]
> +#![allow(unused_macros)]
> +
> +pub(crate) const RKVDEC_REG_INTERRUPT: u32 =3D 0x004;
> +pub(crate) const RKVDEC_INTERRUPT_DEC_E: u32 =3D 1 << 0;
> +pub(crate) const RKVDEC_CONFIG_DEC_CLK_GATE_E: u32 =3D 1 << 1;
> +pub(crate) const RKVDEC_E_STRMD_CLKGATE_DIS: u32 =3D 1 << 2;

Regs file are a bit our coded reference information on how the registers ar=
e
layout in memory. So I believe the alignment, indent and readability of tha=
t
file would at least need polishing.

But to the light of your comment, being able to use more modern utility, is=
n't
there something in Rust we could use to better map the registers ? These
variables are just mask offset to help someone write specific bits within a=
 list
of 32bit registers (Hantro and RKVDEC have that in common). In downstream m=
pp
userspace driver, they maps all the register with a C struct.

struct reg123 {
  val1 :3  // bit 31-29
  val2 :20 // bit 28-9
  val3 :9  // bit 8-0
};

I seriously think it looks nicer, and when the compiler does not screw it u=
p
(the main reason we don't use that), it is also a lot safer and simpler to =
use.
Now, lets forget about C, my question is just if there is something in Rust=
 that
could give us the safety to edit the right portion of a register, but also =
allow
expressing that map in a readable form.

Note that sometimes, we may want to read the register before editing it,
something MPP giant C struct does not help with.

Nicolas

