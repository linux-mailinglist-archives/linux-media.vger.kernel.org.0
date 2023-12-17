Return-Path: <linux-media+bounces-2493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F58161CC
	for <lists+linux-media@lfdr.de>; Sun, 17 Dec 2023 20:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BD86B21DBD
	for <lists+linux-media@lfdr.de>; Sun, 17 Dec 2023 19:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D813F481AB;
	Sun, 17 Dec 2023 19:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkxPBSPu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6345014
	for <linux-media@vger.kernel.org>; Sun, 17 Dec 2023 19:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e297d0692so1063659e87.1
        for <linux-media@vger.kernel.org>; Sun, 17 Dec 2023 11:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702841651; x=1703446451; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAxmo44ECM3ZgKBDrRz+lCutrd39bPkYyMjr2DR9Sfc=;
        b=bkxPBSPuf8KesnoZFljWzUUc5VG+v7qJL+uBDltsxWy7Ch2zqObnBnHziDKRePunSt
         Ao1LjB1SgGMX2UyTgiTVYO6pAG2GmjQtw8oCL/REow5C/g+o3sSZx8Bk6XzeHEuiLEou
         UZ0ztAov3vbGrV95nNjkUW5QR+JtYZO2oEnIW5DCkP61nI1bHR8sSYwNo6N4+tRGa8D6
         YSFt0wDO8xD3hzTBBo4N7ggfx+MJaNH55qvvK+46UP1o8PIoO9GWU96BPcvc2Fjq3eYa
         rRgNKMw/egruhIr5jNQHZsYnnJuvq5li3lpMW7HepSq52p3Bi8yZoBMdQEiuzsvy7yux
         6ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702841651; x=1703446451;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAxmo44ECM3ZgKBDrRz+lCutrd39bPkYyMjr2DR9Sfc=;
        b=i0lVMDOVkt4J23hu6V71EJNCyCsxbcnC2275sPfvLJqwTjC269PfNg7H27I1rgQazr
         DkD63pcYPg0xfVLlEVqwiGF/2NvT0/T3yhgNeT5VnbNGzw7KKaf92yu535qepiQZ6Kax
         ikNHARdoo2D0VAeEoSsI4He9iw6atdDh4V5vBrHqqtEBb3KDbRUx/UXH9uTNApZh8tSQ
         MPrMVAWmzNhYsBOzctIsgJjYAkw5D6Vr7AF+yQ8c/nYxtowlf0vOpevYdosGLCBQ9gTF
         +ACiIgL0+0oszN4rLpPvYyy8oz8R5OHM1RXZMZ2afnNe6cK8BHD4IVKliChMEC33QaQw
         njPA==
X-Gm-Message-State: AOJu0Yx0pQ6VjEWMrd8D8GlWosRL0ZS+cLtdqaJPzeCRLTC3v+WiTNwD
	iLIZsRXvvF5D09PqFy4J47Q=
X-Google-Smtp-Source: AGHT+IF+eVGunWBW6syBJ/0GBLT/2ZmAMukLR5RA5l8tufju6ujkC8tsnJ4Solpa7uYMPXnbPzRSaA==
X-Received: by 2002:a05:6512:398f:b0:50e:15de:9931 with SMTP id j15-20020a056512398f00b0050e15de9931mr4541024lfu.24.1702841650571;
        Sun, 17 Dec 2023 11:34:10 -0800 (PST)
Received: from razdolb (95-24-145-153.broadband.corbina.ru. [95.24.145.153])
        by smtp.gmail.com with ESMTPSA id f3-20020a193803000000b0050e36ba7a52sm175108lfa.67.2023.12.17.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 11:34:10 -0800 (PST)
User-agent: mu4e 1.10.7; emacs 29.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
    Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
    Linux-rockchip <linux-rockchip-bounces@lists.infradead.org>,
    linux-kernel <linux-kernel@vger.kernel.or>
Subject: [bug?] 85d2a31fe4d9 ("media: rkisp1: Drop IRQF_SHARED") breaks ISP1
 on RK3399
Date: Sun, 17 Dec 2023 22:14:34 +0300
Message-ID: <87o7eo8vym.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi!

Rockchip ISP1 is broken for me on a custom rk3399-based board in the
latest media_stage. Relevant dmesg fragment:

    rkisp1 ff910000.isp0: Adding to iommu group 2
    genirq: Flags mismatch irq 42. 00000004 (rkisp1) vs. 00000084 (ff914000.iommu)
    rkisp1 ff910000.isp0: request irq failed: -16
    rkisp1: probe of ff910000.isp0 failed with error -16
    rkisp1 ff920000.isp1: Adding to iommu group 3
    genirq: Flags mismatch irq 43. 00000004 (rkisp1) vs. 00000084 (ff924000.iommu)
    rkisp1 ff920000.isp1: request irq failed: -16
    rkisp1: probe of ff920000.isp1 failed with error -16

According to rk3399.dtsi, isp interrupts are shared with correponding
mmu interrupts (isp0 with isp0_mmu, isp1 with isp1_mmu), so the subject
commit breaks devm_request_irq. Reverting it fixes the issue for me.

If I'm just missing something, sorry for the noise.

--
Best regards,
Mikhail Rudenko

