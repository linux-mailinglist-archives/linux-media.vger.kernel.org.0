Return-Path: <linux-media+bounces-20627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CE9B76E6
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16E8AB24093
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 08:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F253189B8E;
	Thu, 31 Oct 2024 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AI1DdBLC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C317BEA2
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730364913; cv=none; b=LzjKvY1WubkcmPgalAJG5hJESWYNdewjXGIcQescstJANVKwlAFwKrBXQr/IyoudT3wAgROQoax4LY+PmesHmH1aAe+2j7d4aYE7zaGYJjdWyKxOxu0CGO5OQOR22wJBWxjIkIM0eYsfpUI8E6uGB2rfPBZs9yt+w6wnIrCoWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730364913; c=relaxed/simple;
	bh=ZDySzFsnKkeFXp+VFDI9R1fVxxjBMfiPXZnrcfMngKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5w1NvVmJuMdU6koh6USxhmcWGooPNZUBMDkTtaO0XwC2tQgNIIteO3Md4iH5GI0EL4Ggk7Sqb+lxhrijjREIbOTk85qvAm6WufeNRMWmwGyQoz0AdMaCYEPJgAwYP9RrcXjJsxuWZljxcHhpi4ozpW0YbzFmnG9pbXz1AOVqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AI1DdBLC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso9860701fa.3
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730364909; x=1730969709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FUDcheiK8JhqH6/QyyEKBcuyjmkqcu9I4AhzOv/eO7M=;
        b=AI1DdBLCnxJwFfXtsm5I9acHfe9NIXuhOWAcrovyxOo3b8KDiadRE9VrDd9Pw49+/S
         0vbEL9JQPptIoXsriGdeeePyuFu1cS1dt03iUbKPnibifL/NXxS7qkBEF6pvmprF4oUz
         o7nTcoAiz25q+C9uy7HvQPFjNVXBNIii+8KzdA0FDGcJG4yEm8SRs3vo2HNxij9bIxHw
         g8rdh8l5p1ses2vHG4iwC9knPgkLQo80uT9ezWVIuG/a5FQsx5ZepvhP0cYKQyV6I9Qz
         eoc/rtDv35AHE7xmhGUACJdIIHHBOoaDK7hd1NQ9DLasyRBmBPHwo7ortNPm5QzOkEmA
         zOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730364909; x=1730969709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUDcheiK8JhqH6/QyyEKBcuyjmkqcu9I4AhzOv/eO7M=;
        b=EkditxUIamo7qWYUBfHsrnVDi2bGIUQmp8he0R8BPnPGEzkr/15RRew6haPgLsNyAm
         skqobxkolV7qsmoBOJRy+fSFP4VzKYlyuvmviWIdjJADcAQ+Yhd0+XzWXuuO4hz6FOcf
         NGULmDHuFNlRYf9Ca7EZLiXeu0WpsAvmndTW8gI1qNrbQHOQTHD/Y+2nyZv/uobv93jV
         OISD6Tb228LbVzSbUQ37txiOmZKqRIIFTgvVjvLeAl1L7GFcPJJRx7YqV2nBhQh9btC1
         ZuCzNesaA3KnvHxN1A9FnliFt8nLLfhoQHxr4FaAE9zKwGjTGRTBqqh5ovCL5Dhapgyu
         /QAg==
X-Forwarded-Encrypted: i=1; AJvYcCVL0nIL1kbswe5geDfHSy4drV4derU40/LCQzJdv/LeZ6PSU1/6luw8hqmp/Pnk7GjOPisa9H4y7NgY1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuow2oyH+7q2R1C2CzOfyG4Un7MDBcKsjMb8lrEXStU5JkkEjp
	VRuxEYVNRxe+6giV0dSChma6PiahGE8Ham2ZAPXinjyq/lIEijPBW6QzKADPX6U=
X-Google-Smtp-Source: AGHT+IFBFiCfVxYlwTElhQ9iaN5niEh2RqNjHdUElsmI/f4MFMMrn30OPEc0CN4b5u1SgxFe8qNHmw==
X-Received: by 2002:a2e:a984:0:b0:2f7:7be8:fd89 with SMTP id 38308e7fff4ca-2fcbdf61db9mr168289041fa.6.1730364909453;
        Thu, 31 Oct 2024 01:55:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189123sm1440859f8f.115.2024.10.31.01.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 01:55:09 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:55:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: next-20241028: gcc-8-defconfig : ERROR: modpost:
 "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
Message-ID: <456c79d2-5041-47c4-bed2-44d257524ddd@stanley.mountain>
References: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>

Is it possible to tie this to a commit?

This is a u64 variable getting divided somewhere or maybe the divisor is a u64?
But there haven't been any recent changes to the driver so probably the change
happened in a header file?  I looked the differences between the preprocessed
.i files from before and after and nothing jumped out at me.

I don't have a copy of gcc-8...

regards,
dan carpenter

On Wed, Oct 30, 2024 at 06:53:01PM +0530, Naresh Kamboju wrote:
> The arm builds failed with gcc-8 on Linux next-20241028
> and builds pass with gcc-13.
> 
> First seen on Linux next-20241028 tag.
>   Good: next-20241025
>   Bad:  next-20241028
> 
> arm:
>   build:
>     * gcc-8-imx_v6_v7_defconfig
>     * gcc-8-defconfig
>     * gcc-8-omap2plus_defconfig
>     * gcc-8-davinci_all_defconfig
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> ---------
> ERROR: modpost: "__aeabi_uldivmod"
> [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
> make[3]: *** [/builds/linux/scripts/Makefile.modpost:145:
> Module.symvers] Error 1
> make[3]: Target '__modpost' not remade because of errors.
> 
> Build image:
> -----------
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/build.log
> 
> Steps to reproduce:
> ------------
>    - tuxmake --runtime podman --target-arch arm --toolchain gcc-8
> --kconfig defconfig
> 
> metadata:
> ----
>   git describe: next-20241030
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git sha: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
>   kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/config
>   build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
>   toolchain: gcc-8
>   config: defconfig
>   arch: arm
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

