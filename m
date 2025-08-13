Return-Path: <linux-media+bounces-39755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40250B244EE
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F229E3AB079
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13552D0604;
	Wed, 13 Aug 2025 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="u19ygZB0"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CA520EB
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755075923; cv=pass; b=k4hi0XRoJJdpE0dN0qW0kSabsNbgM3vSP2og2WR/opClkOOrjWVMtD7lnKmW1Bo//Pch1drIwEoD6ACbS7W9QvwO08QczNIhkN7FtkN9TCgohiV7KRdEVaYlP+lF/1SQSI80pNRW39KTfvT1eHCTvWolSmT2opHTL/FUk2mlWII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755075923; c=relaxed/simple;
	bh=uMW0eYY2hRvYKNM17Z7sMEAMlDn40+7NdRmw6q0QErw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NZDfH0+1h1Nn2gyIXtU0dTIxb/6sj+YwkZX3/z/ScUysxf7O3/CBzNhSf/oqMtjwHPEkaijkBjdqfqVEE6vxPEb9aZaSELLjMZ8Qu8zY35R5wAomA72YiAHapYygYVeNsiFsUiyHfcRKEdVgBl2MzcwN6YauNkW+WPtzoM5AYuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=u19ygZB0; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c22Wq6rWfzyQx;
	Wed, 13 Aug 2025 12:05:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755075912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=OcjAxx9dW9jtmVXxBN+GuPeYeQW5O0Dr+qbn4TUFaDE=;
	b=u19ygZB03IX3dClN1e0PgUuixa1OhCJngnYs5p6sXyjxsn6WaoRt0T3uPeOGGclBylN9UZ
	2p1/E0yZ4qSPb+eT0hAW39ZxR5/jLkyqdIDFBRmuASYy3nFgDpi17K7nhwf5c+2B5QwrHE
	xgeQsRj5SQjO5EeQxh1FXGJzJOnK5Ec=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755075912; a=rsa-sha256; cv=none;
	b=V34XM6PnS8+tD/zTc5OVSRQ2bdmXHO/xNCKqnQsRvxqpV7Df1zke9keLjydRbymjqVv/aw
	MidzHky5aa1AKYgo1MtfgSp8gVJu09Rf++dozZ7kjaGy/NnCKXr0TmAmNQhZTGJaDOuf5u
	3XZp0696rqSoLFxO725yEtuMuHzGrsg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755075912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=OcjAxx9dW9jtmVXxBN+GuPeYeQW5O0Dr+qbn4TUFaDE=;
	b=QJGdbOR5KTVhEB+yahpKY8ZqSQ28gfO0KjnX6gyh1SwG5KTqoSXraK7jQ0cPUUGhtBC6d5
	4KKgNRWOvzle+ivGF0dZWrsSAcBAHRYBkStCcQgHuSZZSlLq3OPbQXOWcsyTrQlRjDvLVl
	9Oj6h+3NPQmneXR5d0YEKYvqJZDhqwU=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D7F60634C93;
	Wed, 13 Aug 2025 12:04:22 +0300 (EEST)
Date: Wed, 13 Aug 2025 09:04:23 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT FIXE FOR 6.17] Drop redundant pm_runtime_mark_last_busy() and
 lt6911uxe fix
Message-ID: <aJxVF0MpevVhsH0H@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are the patches to drop the redundant pm_runtime_mark_last_busy()
calls in drivers and an lt6911uxe fix that should also be merged to 6.16.

Please pull.


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.17-1-signed

for you to fetch changes up to 7947309bafb07bc1b2eb63c69aae13003b53dad1:

  media: Remove redundant pm_runtime_mark_last_busy() calls (2025-08-11 15:43:44 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.17

----------------------------------------------------------------
Dongcheng Yan (1):
      platform/x86: int3472: add hpd pin support

Sakari Ailus (1):
      media: Remove redundant pm_runtime_mark_last_busy() calls

 drivers/media/i2c/alvium-csi2.c                          | 1 -
 drivers/media/i2c/ccs/ccs-core.c                         | 7 +------
 drivers/media/i2c/dw9768.c                               | 1 -
 drivers/media/i2c/gc0308.c                               | 3 ---
 drivers/media/i2c/gc2145.c                               | 3 ---
 drivers/media/i2c/imx219.c                               | 2 --
 drivers/media/i2c/imx283.c                               | 3 ---
 drivers/media/i2c/imx290.c                               | 3 ---
 drivers/media/i2c/imx296.c                               | 1 -
 drivers/media/i2c/imx415.c                               | 1 -
 drivers/media/i2c/mt9m114.c                              | 6 ------
 drivers/media/i2c/ov4689.c                               | 3 ---
 drivers/media/i2c/ov5640.c                               | 4 ----
 drivers/media/i2c/ov5645.c                               | 3 ---
 drivers/media/i2c/ov64a40.c                              | 7 +------
 drivers/media/i2c/ov8858.c                               | 2 --
 drivers/media/i2c/st-mipid02.c                           | 2 --
 drivers/media/i2c/tc358746.c                             | 5 -----
 drivers/media/i2c/thp7312.c                              | 4 ----
 drivers/media/i2c/vd55g1.c                               | 4 ----
 drivers/media/i2c/vd56g3.c                               | 4 ----
 drivers/media/i2c/video-i2c.c                            | 4 ----
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 4 ----
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 -----
 drivers/media/platform/nvidia/tegra-vde/h264.c           | 2 --
 drivers/media/platform/qcom/iris/iris_hfi_queue.c        | 1 -
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c     | 2 --
 drivers/media/platform/verisilicon/hantro_drv.c          | 1 -
 drivers/media/rc/gpio-ir-recv.c                          | 4 +---
 drivers/platform/x86/intel/int3472/discrete.c            | 6 ++++++
 include/linux/platform_data/x86/int3472.h                | 1 +
 31 files changed, 10 insertions(+), 89 deletions(-)

-- 
Kind regards,

Sakari Ailus

