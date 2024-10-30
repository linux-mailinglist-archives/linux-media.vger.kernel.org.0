Return-Path: <linux-media+bounces-20596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F132D9B63F9
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 14:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED16828303C
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 13:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB95C1E47CE;
	Wed, 30 Oct 2024 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HlsMC1ls"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03161FFE
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730294596; cv=none; b=tdVWGN7A0nGG6gc6QWOZA3sX93ADKNV1jRGGe2XjRBZmamAIrudyzD5EMnqSwXASihvK2sTBBG90H/BRfc3gArxSXsS2KUAprdcpzdjH5w1DhQ0TUkudcGb/DJYObaD8wmLR3cnJKqacVKjqSJi8ADD0qnEoKO/vKcj7d0Oec7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730294596; c=relaxed/simple;
	bh=UZdTEXmqadkkHt28rG2dAdukNK3vdNFsyhUL7P/hmVU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oYCdWsDn+BlGTKgCmfNxOeOq3onO6W/UVhSRsclhjUt/uxJXaWXbi20TVZpc/YD+urNIL3gc7qH4bz7eLCoH06J/hfOSHjF7sr62hv6NI/axhMkoEK7Pd/wzxs6xRZ5QYhinZPnyknMDY3NdEQPw8tMcYqi0XJF3CudBrkdnRqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HlsMC1ls; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-50d494ac189so2033941e0c.3
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730294593; x=1730899393; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xqOd1GRqoUCqzf3wqicTqRcRpHE5Pp00F4b9OuTbBLs=;
        b=HlsMC1lsRYrKs1Qbw8jceMPJP4E43C45h2G11tuWHFS86ESAY+CHiKSHpWTPgjvZ8J
         aMKeB/oTHXSyRHB2AWPDImpb+WIoV5qHpRcXMUCtRZFyqjgLScbMI3tjXpCAn3kkJuJ2
         su92ljB0KG6am2hplO3GWtBlpyKiX1Hi0Zt+Aa8Fylz1C6iwB28CJgzAQJ49sTVco3qN
         kV7WSzGTgj7AevqkUQDnnuq+duA3DuLzPTHghPruxulvN73ejBfr0gz8LoI16Tn4Gkkk
         2fQ7K94RS60jTE97uEl6W8HuReorwjUiGHaLOKNJYNEJpiE39qoV80k35kTuU+Eefn6f
         m1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294593; x=1730899393;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqOd1GRqoUCqzf3wqicTqRcRpHE5Pp00F4b9OuTbBLs=;
        b=wh20rXldihPe3JLNCYqH+lrjYgvzheZYZI2ZoMvDrH9266kW+1fTmUYb3xHPG6oA+6
         8YaeIEMR+lEqIxG6GcpKsi0DhOAfze4/acKhxxc675MVDxWpU+O8QIZbZT7RlbSuGHmA
         x5EZ+ErUx2+G1lNZqjPIkiIIHKm6wn14JixIyTx48pFY7/4FK/fEZ4+yr0JpG1U9pVF+
         CJkBhNwJHp7nUlcEdFIUNisMmjf5h6pjAEoKFa3cYfg+tRwfslvFghytoNvuxilDZwsz
         KemcGp6jUQroXqE1pbwChei8qc+IWiAAJJEGRUyrYtSNUXmwdAKpRVFIOnA7gxlHLzen
         NVhw==
X-Forwarded-Encrypted: i=1; AJvYcCXFjP/+RngHKXg5sCsgZOUca7qyT7Mc74uL6A8Rd9bjm11/gdjlBKn/WBb60rEVy9me0i5dXnTinBulXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZvYuUQ8gi4oU/SznlXOW5yI78is+P9ntUf4uSIgzuv4riCqF
	w6p8sgAnHYzEHD54bhoFDs1icK76SO3qMBERaCoTPgdldNPZdgjxeJHmq9kBwgs0yBOPdio+ZRY
	qdZr4+g1enwRskqHj7husFuvtBG2s634ue5tyPg==
X-Google-Smtp-Source: AGHT+IH+WumONmNdzunnvczfZxAebXCyl/J6gvEjlXtHtquei4NUDtL+2W3YfXhmxPl83u3TC15QF98lawvQNCJ4xU4=
X-Received: by 2002:a05:6122:1697:b0:50d:3ec1:1534 with SMTP id
 71dfb90a1353d-51015071471mr13246416e0c.7.1730294592926; Wed, 30 Oct 2024
 06:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 30 Oct 2024 18:53:01 +0530
Message-ID: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
Subject: next-20241028: gcc-8-defconfig : ERROR: modpost: "__aeabi_uldivmod"
 [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The arm builds failed with gcc-8 on Linux next-20241028
and builds pass with gcc-13.

First seen on Linux next-20241028 tag.
  Good: next-20241025
  Bad:  next-20241028

arm:
  build:
    * gcc-8-imx_v6_v7_defconfig
    * gcc-8-defconfig
    * gcc-8-omap2plus_defconfig
    * gcc-8-davinci_all_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
ERROR: modpost: "__aeabi_uldivmod"
[drivers/media/dvb-frontends/cxd2841er.ko] undefined!
make[3]: *** [/builds/linux/scripts/Makefile.modpost:145:
Module.symvers] Error 1
make[3]: Target '__modpost' not remade because of errors.

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/build.log

Steps to reproduce:
------------
   - tuxmake --runtime podman --target-arch arm --toolchain gcc-8
--kconfig defconfig

metadata:
----
  git describe: next-20241030
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
  toolchain: gcc-8
  config: defconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org

