Return-Path: <linux-media+bounces-10214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034008B34E6
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 12:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5B47288C4F
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4021422D4;
	Fri, 26 Apr 2024 10:04:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CB613C9A3
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125868; cv=none; b=Ca/o/gnffx3C3ado7zN1RWxZKCVqMe38kQhbHrHhKczAaVc/nOXYXLzOBBijriZYwV2lsu1xwQuiyYd5PHb3dZo+Fvv17RK+Dje3x9mrSjO6lls1zoZYJRhb0d1X7SBVKA/ymL81OW4T9vyFXc91iUs1xklCXadBdLKxyPHX9bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125868; c=relaxed/simple;
	bh=djvg4dE39ImRT7zzqFVa5igwCA6SQaKT+s0A2wA/Fec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kaar7UZpIsPJKDog46plcmcP0L+0oImxF0KR5wR40B9qvWA3XhY1m8J8NRgzC0vya8Iz0cLFRvvjyZasJqq9x2zRI5/+RcPWA8vodwwBYPTcQN7P8n/irhiCpQP1pPAcYCuABiIcqSXceuVlnQLU6Eizhx5G6qaxeasNNhzbnc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s0IRM-0007qj-1q;
	Fri, 26 Apr 2024 10:04:24 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s0IRM-00EVow-0m;
	Fri, 26 Apr 2024 10:04:24 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.10] MediaTek Vcodec mem free improvements (#101239)
Date: Fri, 26 Apr 2024 10:04:23 +0000
Message-Id: <20240426100423.3458901-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085939.cb5e4pcp5qoax67b@basti-XPS-13-9310>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240426085939.cb5e4pcp5qoax67b@basti-XPS-13-9310/
Build log: https://builder.linuxtv.org/job/patchwork/399039/
Build time: 00:17:34
Link: https://lore.kernel.org/linux-media/20240426085939.cb5e4pcp5qoax67b@basti-XPS-13-9310

gpg: Signature made Fri 26 Apr 2024 08:51:30 AM UTC
gpg:                using RSA key C114F6B109AD086C02B4920F7D4612BF5E76A4F0
gpg: requesting key 7D4612BF5E76A4F0 from hkps://keyserver.ubuntu.com
gpg: Can't check signature: No public key

Summary: got 1/4 patches with issues, being 1 at build time

Error/warnings:

patches/0001-media-mediatek-vcodec-Replace-dev_name-in-error-stri.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/meson/vdec/vdec_1.c: ../drivers/staging/media/meson/vdec/vdec_1.c:239 vdec_1_start() warn: 'core->vdec_1_clk' from clk_prepare_enable() not released on lines: 239.
	../drivers/staging/media/meson/vdec/vdec_hevc.c: ../drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevc_clk' from clk_prepare_enable() not released on lines: 227.
	../drivers/staging/media/meson/vdec/vdec_hevc.c: ../drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevcf_clk' from clk_prepare_enable() not released on lines: 227.
	../drivers/staging/media/ipu3/ipu3-dmamap.c: ../drivers/staging/media/ipu3/ipu3-dmamap.c:42 imgu_dmamap_alloc_buffer() warn: use 'gfp' here instead of GFP_KERNEL?
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/sh_css_params.c ../drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: :error: too long token expansion
	SMATCH:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: :error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: error: too long token expansion
	SPARSE:../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c ../drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: error: too long token expansion

    allyesconfig: return code #0:
	../drivers/media/common/siano/smscoreapi.c: ../drivers/media/common/siano/smscoreapi.c:650 smscore_register_device() warn: use 'gfp_buf_flags' here instead of GFP_KERNEL?
	../drivers/media/common/siano/smscoreapi.c: ../drivers/media/common/siano/smscoreapi.c:689 smscore_register_device() warn: use 'gfp_buf_flags' here instead of GFP_KERNEL?
	../drivers/media/i2c/ar0521.c: ../drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.
	../drivers/media/i2c/s5c73m3/s5c73m3-core.c: ../drivers/media/i2c/s5c73m3/s5c73m3-core.c:1425 __s5c73m3_power_off() warn: 'state->clock' from clk_prepare_enable() not released on lines: 1425.
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2886 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/tc358746.c: ../drivers/media/i2c/tc358746.c:1632 tc358746_suspend() warn: 'tc358746->refclk' from clk_prepare_enable() not released on lines: 1632.
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:359:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:359:24: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:359:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-core.c ../drivers/media/pci/solo6x10/solo6x10-core.c:359:24: error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-p2m.c ../drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-enc.c ../drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SMATCH:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: :error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
	SPARSE:../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c ../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion


