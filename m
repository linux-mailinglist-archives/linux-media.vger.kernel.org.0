Return-Path: <linux-media+bounces-19686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD699F1C7
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 17:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B3D91C22528
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 15:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642411F6687;
	Tue, 15 Oct 2024 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUVYsjnG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411816F839;
	Tue, 15 Oct 2024 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729007136; cv=none; b=Hy+yw5M6YE9rGOaDPxOolC0+Fb9FGePd+7jSz+sWLHTPFrHVXpKcVOJAQMo7fqiRyJ3j1TtEIPBDeIoKPy/iydvYM+AWz2grviIntsAqK8/K69ir8SdWXi7K3a4ubJiygDJj0LFWalTbssZAZ5lz/6ZkyLRPb/ZdCJ/LmWVFObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729007136; c=relaxed/simple;
	bh=boiDaGfYTFqwJTNv3N/+R9W/QQ6h3tyvrcO+eM1dMBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=evi3vlCOX6U5YF8KsgFTrNi1MjJi4hEJxbFhSsPi2F1QYJ6Aq/z7yCNVIZhtgICTZNjJzxb1lbAg5iTooWOjCoTspdAenZ/Dx+onHrjGigMv1rCi1ypfWCNpmbWeG+0TtzpLI445jySRuIlUjJLiZg8mOl0uoCpFfG0hQGaDHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUVYsjnG; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e5cfb970c9so1902520b6e.1;
        Tue, 15 Oct 2024 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729007134; x=1729611934; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boiDaGfYTFqwJTNv3N/+R9W/QQ6h3tyvrcO+eM1dMBk=;
        b=XUVYsjnGAaTXdHmErtYkPO9rVUsvIg1AlswdcK3reLFFlI3dc9QiUrKqKnU4UW8grK
         fKbLZvSGv4+JTdw3WR/rSKh9zbsEOAaR0ImdAH1D4UE5S2QOsLefDV+4mA3Y4+S7on4p
         eTvPXvQ2EnY4KNTw+xz1Rw5qFyP5u5I5N7PvDV2NPkR7IGfZIiep5xj46Y3iqncIrkUy
         Wy1NZ7e2IsrWAVW8NfeVzqLF4me/A0S1fms/kkIWA80+ixScWUP00b0XeJ5ijHp2yr1b
         kNaVcjOq+VGiCgaLCfn7ARcfaQMMf+ZNY17rzskR5WClEl+2TN7sJtvW876QgfN9b41P
         jV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729007134; x=1729611934;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boiDaGfYTFqwJTNv3N/+R9W/QQ6h3tyvrcO+eM1dMBk=;
        b=HVx78lbwTBZXRZG4mV2+JIVMm+qvg8oOTSvs72WXdWOpe38X/DD1t/LwS4imE2uDoj
         CxMHOcA6V/t9CEPs/uKn53nL8I1hXgH+LM/smwY231PT54usDUqMlxE3KyLLXDt3u+jD
         Gli4/GN1fhW+0SuWYel5Rp0X/8n0C8HiIN9WCEq1IfyMHfWnI5l0kG1pHbWF/4NArVbK
         iTWzKrYKLIGVD9irhlC1BRjSrG1thFrqzW4fnCQEVAHSr1ofvw0DMQ4WQorz4iYqGvzF
         o9rCHp7e+106Up61AGSA49lUYDLzB/GpJ9sGVsws++qLwMI6C6zHDmbuuuxtoLEuzLsE
         R0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLgAbwalj3nKwO5kUoiwZxIC9gqJTcKnQi8qarbYYaIQWuGmCAs5m6WLEy0f0eR3MVLr8X13X01vAnJ/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyse8m+ljemro8p106tpf4x3fFPwXdZ+Mw0iqvNAr4z9uTyBaLs
	LsRJ9U0Mgc515cNwoIWUn2fj5h6/fmQjNN4NdZZzKAF+Y31y2AKZrKf+DoYn8kbA+AZs3Mhh949
	levZQoDE7X7l20e7nYKuwAeG1urGOv4InDQc=
X-Google-Smtp-Source: AGHT+IGH2Q9t9T8qeZPSaO7qeb2aQGhdK3HfUY+5lRsvU02vvbnC0yHQWFVmOMgVAdQQIy2Ep/Nha2MR971Hnl1uWuE=
X-Received: by 2002:a05:6808:22a6:b0:3e5:df4a:50cd with SMTP id
 5614622812f47-3e5df4a57cdmr6185552b6e.46.1729007133573; Tue, 15 Oct 2024
 08:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEJPjCv=M-RQhp4MkO9MPETsh8gpGOqrhNqXhe1Wm-nj1UTpUA@mail.gmail.com>
In-Reply-To: <CAEJPjCv=M-RQhp4MkO9MPETsh8gpGOqrhNqXhe1Wm-nj1UTpUA@mail.gmail.com>
From: =?UTF-8?B?5YiY6YCa?= <lyutoon@gmail.com>
Date: Tue, 15 Oct 2024 23:45:22 +0800
Message-ID: <CAEJPjCt_yawtjC-YeAjcJV_VgszM7s7M2c+=1KihAfrqzDjoew@mail.gmail.com>
Subject: Re: KASAN: use-after-free in snd_usbtv_pcm_close (with PoC and analysis)
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi! It has been a long time. Is there any new updates about the
validation of the vulnerability or something else? Also, I'm wondering
if I can get a CVE based on this report. Thanks a lot!


=E5=88=98=E9=80=9A <lyutoon@gmail.com> =E4=BA=8E2024=E5=B9=B44=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=B8=89 14:12=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi upstream community,
>
> I was fuzzing a LTS version of Linux kernel 5.15.148 with my modified
> syzkaller and I found a bug named "KASAN: use-after-free in
> snd_usbtv_pcm_close".
>
> I tested the PoC on 5.5.148 ~ 6.8+ with sanitizer on and found
> sanitizer through a panic as "KASAN: use-after-free in
> snd_usbtv_pcm_close".
>
> The syzkaller log, report, kernel config, PoC can be found here:
> https://drive.google.com/file/d/12ubxzCGrkUVz8BWRwprHjRHYh3l0oMMd/view?us=
p=3Dsharing
>
> # Analysis:
> I wrote an analysis to explain the root cause in an markdown file (in
> Chinese, so you may use translators to read it... Sorry about that)
> which can be found here:
> https://drive.google.com/file/d/1-TjLRqLs1_C_MDgvAy-TURxldUabW2Eq/view?us=
p=3Dsharing
>
> # Step to reproduce:
> 1. download the zip file
> 2. unzip it
> 3. compile the kernel (5.15.148) with kernel_config
> 4. start the kernel with qemu vm
> 5. scp repro.c to the vm
> 6. compile the repro.cprog and run it: gcc repro.c -o exp && ./exp
> 7. you will see the KASAN error
>
> # Note:
> I didn't find any related reports on the internet, which indicates
> that it may be a 0day. Hope the upstream can help check and fix it.
> And I'll be happy to provide more information if needed.
>
> Best,
> Tong

