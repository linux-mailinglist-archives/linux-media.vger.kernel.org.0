Return-Path: <linux-media+bounces-15072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B476E9339C6
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 11:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0C721C2151A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 09:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7E9374F6;
	Wed, 17 Jul 2024 09:24:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1959445
	for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721208288; cv=none; b=cE5X9wHGG3CysXWaPcdQljhRN8wmC8ktQTncDkm41Xos8lp4LW886W8v+y4ygI76vGOxR5041scl8/8HU76iEkt3xaC0xFnHSJX4A5kYXScDBvHiE5iN1r1IGMm2hFSy+LIVuOZrJGFe4KNlpqaTQKqorJm4LuWj68pcuje4nrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721208288; c=relaxed/simple;
	bh=Nnmva7EHSIRz0vJTGujO1H3RKqwStDVUWfdIpBp3pQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FmhRl9+o5Rc/LgG5gOzM1Zz4zHKKvzZLJjp3U8sGSgu1wRoC0E+eczjrjVDyhm6/zmRsDOd9TxxETdbn7BvEFA7mmRj38Fdx9362NnOvMtmRXi9hrXSYfxN2X6O/0ny859eFK8jovaJ77WchOH9NCgbNCHz7NX0SlkNHsD+2DxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sU0tw-0006hi-1Z;
	Wed, 17 Jul 2024 09:24:44 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sU0tw-006K6D-0x;
	Wed, 17 Jul 2024 09:24:44 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.11-rc1] media updates (RESEND: previous email was (#103050)
Date: Wed, 17 Jul 2024 09:24:41 +0000
Message-Id: <20240717092442.1507220-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717111607.66aadf19@foz.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240717111607.66aadf19@foz.lan/
Build log: https://builder.linuxtv.org/job/patchwork/377028/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240717111607.66aadf19@foz.lan

gpg: Signature made Wed 17 Jul 2024 08:09:08 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [never]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mauro.chehab@intel.com>" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-dt-bindings-media-rockchip-rga-add-rockchip-rk3588-r.patch doesn't apply:
Applying patch patches/0001-dt-bindings-media-rockchip-rga-add-rockchip-rk3588-r.patch
patching file Documentation/devicetree/bindings/media/rockchip-rga.yaml
Hunk #1 FAILED at 24.
1 out of 1 hunk FAILED -- rejects in file Documentation/devicetree/bindings/media/rockchip-rga.yaml
Patch patches/0001-dt-bindings-media-rockchip-rga-add-rockchip-rk3588-r.patch can be reverse-applied


