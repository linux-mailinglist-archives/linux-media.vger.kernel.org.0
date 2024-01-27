Return-Path: <linux-media+bounces-4262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74683ED2E
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 14:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD5381C2106F
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 13:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0350C25602;
	Sat, 27 Jan 2024 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hTDoHkus"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86B264A
	for <linux-media@vger.kernel.org>; Sat, 27 Jan 2024 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706361100; cv=none; b=M6Isrf8sxOURM2811sTl/TTXnd1JTPEUI3fTJCnH5uRC/qKol7xuk111+d3TYnUJJMFb4Rx0O2aQtiilIrR3e/UHjN7EfAdp6+xHomH0unNtoLgPoQsNAu4GcYlZfjR39Tqdo5y3ipepDQZD6I6qnTPkWRHj9cnKVxrFx4zvASY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706361100; c=relaxed/simple;
	bh=b+gcDUIUpKvK2dsGLrJzlntuA/8UMOmzat6IslTA960=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iB1av8IIkxRefH/4i3NruzMPZ5ALpPbnUyQ2RQCSzsPGS8ar0pXok0Tlqv9yAtWK5d+yEQLYUsvmD0spMmSzRPOo8tNv1d+0tIgvuN1/WvM6zE2yDPtOZnq6fFgWBNUVqo7f0mJa/RZ4SN8ufIkPqV4p0Y3SDlIlq8QhILEjkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hTDoHkus; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706361097;
	bh=b+gcDUIUpKvK2dsGLrJzlntuA/8UMOmzat6IslTA960=;
	h=Date:From:To:Subject:From;
	b=hTDoHkusG1JMJ+NOpPtS3ifq6DtV4mPmhH7C+c7WG00bRiXPx4uTpolir2/KszrSe
	 a7NXPmaN7k/MyTKUAH2OS071iPuGKQrTcdzmP1quxwMOYbtk05t22V8N/GFbrsm6K9
	 VcEee95raIcIhZbuII4W+Ym4ryH8IyEk+usJNPPBegsFkym4hITSIdWp1cioYWR/hR
	 QS/jbItoVRI0uyU0p5GjSMoG1DEwbODZEZpn6a5cmJFXC4XlPpuTjke+e8OCuiwWqs
	 Xhg7E7WZiIZaGMX4clAFh6AhqYUuE2T0aDQm0z/r8qsXi/JuhBSOzwyYe+xGmqyTKv
	 mWlgKCdNYb5Zw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C08303780629
	for <linux-media@vger.kernel.org>; Sat, 27 Jan 2024 13:11:36 +0000 (UTC)
Date: Sat, 27 Jan 2024 14:11:35 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] Video Codec support for STM32
Message-ID: <20240127131135.xvedhars37emy3xh@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Mauro & Hans,

this patch set introduces video codec support for the STM32 SoC.

Please pull.

The following changes since commit 04447d48afd365a837e23cde631517f166045b9d:

   media: mediatek: vcodec: drop excess struct members descriptions (2024-01-24 11:38:34 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9.0-stm32mp25-signed

for you to fetch changes up to 4e484f39ec3cd0bbc9853905515a3b41e3267d41:

   arm64: dts: st: add video encoder support to stm32mp255 (2024-01-26 17:41:04 +0100)

----------------------------------------------------------------
This patchset introduces support for VDEC video hardware decoder
and VENC video hardware encoder of STMicroelectronics STM32MP25
SoC series.

----------------------------------------------------------------
Hugues Fruchet (5):
       dt-bindings: media: Document STM32MP25 VDEC & VENC video codecs
       media: hantro: add support for STM32MP25 VDEC
       media: hantro: add support for STM32MP25 VENC
       arm64: dts: st: add video decoder support to stm32mp255
       arm64: dts: st: add video encoder support to stm32mp255

  Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml |  49 ++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp251.dtsi                                |  12 +++++++++
  arch/arm64/boot/dts/st/stm32mp255.dtsi                                |  17 ++++++++++++
  drivers/media/platform/verisilicon/Kconfig                            |  14 +++++++---
  drivers/media/platform/verisilicon/Makefile                           |   3 +++
  drivers/media/platform/verisilicon/hantro_drv.c                       |   4 +++
  drivers/media/platform/verisilicon/hantro_hw.h                        |   2 ++
  drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c                 | 186 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  8 files changed, 284 insertions(+), 3 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
  create mode 100644 drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c


