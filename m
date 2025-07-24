Return-Path: <linux-media+bounces-38365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D88CDB10733
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 12:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43E7858698E
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0F625B2FE;
	Thu, 24 Jul 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KhWEsc1g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE725A626
	for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351163; cv=none; b=PQgsZRC9HipzIz22m3nnoSqS5ve7rZxYOd+UcVfEUonVJ7IFUF5Ny8eZdjf3Uxramuy38kiA+gDxTRIDJ/TJd2w7MU3lwVYGJpkrB0CkA1LqyFQ32HqKwGl70fv6NUI0XOstmmN1NURqYyWGoABAMVpM6OAmG6p+2XsiRCSaPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351163; c=relaxed/simple;
	bh=Mb7Inz480w151UZyKAwiCb96cBzXuYWMullMv0nJPVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VN5t1SQQwl3I3A6VPlNF/f/9o13MMReR7eCePoE9JCMe3XTMhfYaLRfcahg17wHT6Tsh0HNesNVZ5FpjDgeXp5lAnELTepeMSUioAOfmSs18msR43ZWXJFCIdwQ0fng3/i5yaLDFWyB2C8ERns4AtMbNHegXH9gQROUzlye19XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KhWEsc1g; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso1057959a12.2
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753351161; x=1753955961; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4UaKwh5IJYpiaFnLbein8rzkhfpQ+t8tr+rzAQBDK48=;
        b=KhWEsc1grTY63HK1UcFYf8BqS42OHR+OEyKqunM+zXKUJXMKhQ9nQgd9MqohK9c5Tx
         vgD490VqntR4DUJC7aiqa2/W1Oi/Lrhzmq+vCvK4lDhjNewrGgySAGLMDbGmYQ4T8/BH
         VB5zJDYp9vipZBArme0kU24HRoXthESo4Fv/t+bt1A7JyO21rKwOiw960GH8mzOHC8Eu
         lnviDg/iBJhdiX7c7KbXM5kPF6CP9uWb1LxzYoSqQgwPbJnThq40o++GcAD29tog92Sc
         AxHurspKlr5n1CZ6y+hWHKBGEwXH0WjrlwC2OkiG/oRZC62NBhN599geJ16MsSH86tE8
         iW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351161; x=1753955961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UaKwh5IJYpiaFnLbein8rzkhfpQ+t8tr+rzAQBDK48=;
        b=gB2oTC9VVkALqVZGR+NuuoSw7a3bF1w33gLnv/wVakoGcDa8n0NzR4NubjSM5GR1MH
         6fH2ZjLixwWWtwU/Afk3kMJi4ObFdWcGCXp/I1c9suTPlijGEHQhSLk839tup6PcM38a
         +yc9uIcETDgrOtFKT7h9iFgM0Vj5q01FjPmI2Kj2xz0QAHN9wVgFva6bYJbvLiYsoumw
         WP2miKGU+dzJFJhdPotSRCLAHGHzgFFAlD+ZU4D9g24uKiS9vE7QfuQTW4GLMo9gox87
         gPYEI2ySV8JmJKyLjMvZjImDwWo4Ow3uu/l05p5U4bczHKL2kUBqvoezIHXp9oz2/zxj
         vnxw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Pvep7n32qurfMHf0y1h1RGft4yT319wJHIms2c1/IQF6qmIR1LE9rysQDY/9lhvNH8UlDzrx4Kg3Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmxnVkLTOQ1pgY4G7e8bimmuPqrVRwmMg3gRtL8o2CZy0AvZ3t
	Fh4UGr6pGiVgYuSCED86UEjJmrKGv70zUQmyVQ7PEOlsXcpVrr6MrI8JggLCJ5orisX3bw9e/lE
	5ElvVPIO2zQ3uM6mj9vpyUOAJAH6wMx8IppQ+IEId4Q==
X-Gm-Gg: ASbGncuwjIjIV84pA/iJGjMklBhyoVhtWqCVcXi0r+utTTopfxCRJpmZVmG0LMK9z7W
	54Y3klX9/bonH1wqpiT9mIOQLPasz2VqkZtVw+B61YzeKh7QawBNZlP1fu2P2wZaHI+89zDN3Nr
	YG1ufg9ki+JpmERzNArqLxG+b5wWCu4AGHX7+Bn51/spGcgB/qUoOBTaatLgJWQ33qsbopqRee8
	UV/t+U9OpQgiEAxCFBgKlZEUFNXBVu/UO1qEcno
X-Google-Smtp-Source: AGHT+IGgBbqETCdYXqkCDv3Xdf3DYFAHcB3/99F/8XFC3iGfdWKp9wQNATBmpOAYkeL/nrq+kCpX+uoUSEHtoaSUEbk=
X-Received: by 2002:a17:903:3bc7:b0:23e:3249:612e with SMTP id
 d9443c01a7336-23f981a0b45mr94173785ad.34.1753351161461; Thu, 24 Jul 2025
 02:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com>
 <ef216301-a7e6-4c9d-9153-8ce8b0a4111f@app.fastmail.com> <4f506337-3481-41db-a2a4-5b4676f22eda@quicinc.com>
In-Reply-To: <4f506337-3481-41db-a2a4-5b4676f22eda@quicinc.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Jul 2025 15:29:10 +0530
X-Gm-Features: Ac12FXwSH-tonDffdzQola6o5OJixZN0fswngpNfmWoStiUzFGt6E6s4psUF8ng
Message-ID: <CA+G9fYuGdo0MUeF0Du3oAtwzYQZhc999pBrz5x5v9P4qw0UbTQ@mail.gmail.com>
Subject: Re: arm64 dragonboard 410c Internal error Oops dev_pm_opp_put core_clks_enable
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, quic_vgarodia@quicinc.com, 
	quic_dikshita@quicinc.com, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Benjamin Copeland <ben.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Jul 2025 at 18:58, Renjiang Han <quic_renjiang@quicinc.com> wrote:
>
> On 7/18/2025 7:28 PM, Arnd Bergmann wrote:
> > On Fri, Jul 18, 2025, at 13:13, Naresh Kamboju wrote:
> >> The following Boot regressions are noticed on the Linux
> >> next-20250708with gcc-13 and clang-20 toolchains for the dragonboard
> >> 410c device.
> >> [   12.629924] x5 : 0000000000000002 x4 : 00000000c0000000 x3 :
> >> 0000000000000001
> >> [   12.629939] x2 : 0000000000000002 x1 : ffffffffffffffde x0 :
> >> ffffffffffffffee
> >> [   12.629956] Call trace:
> >> [   12.629962]  dev_pm_opp_put+0x24/0x58 (P)
> >> [   12.629981]  core_clks_enable+0x54/0x148 venus_core
> >> [   12.630064]  core_power_v1+0x78/0x90 venus_core
> >> [   12.691130]  venus_runtime_resume+0x6c/0x98 venus_core
> >> [   12.817608] Code: 910003fd f9000bf3 91004013 aa1303e0 (f9402821)
> >> All code
> >> ========
> >>     0: 910003fd mov x29, sp
> >>     4: f9000bf3 str x19, [sp, #16]
> >>     8: 91004013 add x19, x0, #0x10
> >>     c: aa1303e0 mov x0, x19
> >>    10:* f9402821 ldr x1, [x1, #80] <-- trapping instruction
> > It's loading from 'x1', which is an error pointer ffffffffffffffde
> > (-EISCONN).  The caller was modified by Renjiang Han (added to Cc)
> > in commit b179234b5e59 ("media: venus: pm_helpers: use opp-table
> > for the frequency").
> >
> > The new version of the code is now
> >
> > static int core_clks_enable(struct venus_core *core)
> >   {
> >          const struct venus_resources *res = core->res;
> > +       struct device *dev = core->dev;
> > +       unsigned long freq = 0;
> > +       struct dev_pm_opp *opp;
> >          unsigned int i;
> >          int ret;
> >
> > +       opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> > +       dev_pm_opp_put(opp);
> >
> > Where the 'opp' pointer is the error code and gets passed
> > into dev_pm_opp_put() without checking for the error condition.
> Thank you for pointing it out.
> I have submitted the following patch to fix this issue.

I have applied this [1] patch set on top of the Linux next tree and
performed testing. The previously reported regressions [a] are no
longer observed.

Thank you for providing the fix.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

[1] https://lore.kernel.org/linux-arm-msm/20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com

Reference link:
[a] https://lore.kernel.org/all/CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com/

Lava test job link,
 - https://lkft.validation.linaro.org/scheduler/job/8366971#L2573

--
Linaro LKFT
https://lkft.linaro.org

