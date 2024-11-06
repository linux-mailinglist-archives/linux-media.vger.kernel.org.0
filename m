Return-Path: <linux-media+bounces-20990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 672059BE1EC
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 10:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 937931C23418
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 09:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60BA1DE2B3;
	Wed,  6 Nov 2024 09:06:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439011DDA2F
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883977; cv=none; b=MC4mZ/jQWHdI99gKWeKwVpQwC5IgcgkZLuxFuiTgP6OJ6NL+dS5opXqDNFsCrpGjQje3jKTWn/6vRyHgNQ3/u1jWPjoMly0yHPimf6ZBTU+24d/oCrx7sKJAYSG3d8LcK63suHuhNXY1MuoVu6+bm2sM6GwZ5en0KyuAZdzx8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883977; c=relaxed/simple;
	bh=kqZ4TUXhxQ6btohOg4X15htAEYHxuSKXEkUMMyxLKTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XL+ji+mVi7P6S11hO10NXt/Oj1EPHdLVy7niLaiNK94047z5eDquZNeOPPsSI7459pYTYny3FSiU3GvSmGbRYd5TzIvhO5SkfsP+Syuoh5jpZFG8I9O1qZKlnozejFX7SF3k/oGr/3YaR+s6kIF1m7mQrG8IhUrjY+uZJHpztY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t8bzQ-00034e-2V;
	Wed, 06 Nov 2024 09:06:13 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t8bzN-008tZc-2j;
	Wed, 06 Nov 2024 09:06:10 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.13] ISP, sensor, other driver fixes (#105188)
Date: Wed,  6 Nov 2024 09:06:09 +0000
Message-Id: <20241106090609.2120239-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Zysg6Cm0KaAsjOIW@valkosipuli.retiisi.eu>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Zysg6Cm0KaAsjOIW@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/396926/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/Zysg6Cm0KaAsjOIW@valkosipuli.retiisi.eu

gpg: Signature made Wed 06 Nov 2024 07:26:03 AM UTC
gpg:                using EDDSA key 5873A1DBBB1EBB81535A470C7A13323D00AE6FDB
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]
gpg:                 aka "Sakari Ailus <sakari.ailus@iki.fi>" [full]
gpg: cannot open '/dev/tty': No such device or address


Build aborted due to a fatal error:
FAILED: patch patch patches/0004-media-ipu6-use-the-IPU6-DMA-mapping-APIs-to-do-mappi.patch doesn't apply:
Applying patch patches/0004-media-ipu6-use-the-IPU6-DMA-mapping-APIs-to-do-mappi.patch
patching file drivers/media/pci/intel/ipu6/Kconfig
Hunk #1 succeeded at 9 (offset -5 lines).
patching file drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
Hunk #5 FAILED at 803.
Hunk #6 succeeded at 816 (offset 2 lines).
Hunk #7 succeeded at 835 (offset 2 lines).
1 out of 7 hunks FAILED -- rejects in file drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
patching file drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
patching file drivers/media/pci/intel/ipu6/ipu6-isys.c
Patch patches/0004-media-ipu6-use-the-IPU6-DMA-mapping-APIs-to-do-mappi.patch does not apply (enforce with -f)


