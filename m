Return-Path: <linux-media+bounces-8929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FBD89DB54
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54E5C1F21A43
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192B912F5A3;
	Tue,  9 Apr 2024 13:54:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4587BAF3
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712670854; cv=none; b=TJ7wldL1VxuY05PbvKie20I1x/c452QGhG9IhX7jOxBU09OALg6kvRzglSNSRCwLg9jIUi/qFSPo36478tfQRAGH04Xc2VE3S+STamnQQGoITPp1DL8KYrSYSHoM/QqFN1FEJ076/Vg5BH+39HJjyrR9/wXfd+7CUBjwRDBWkgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712670854; c=relaxed/simple;
	bh=9e0mVl7IRZhe0xwsCBUJ/DnXLmtS5BpBknX4Ifi47t0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cGkCiEZBpzlb+nXrChTNBs+DRJz2UDRE/eQe2TmQiFWFUjeLJtlJLpdyQRUrVqjSoTeH+kCpX608pDIrF7Xp3dhLovvUJvkpavp3oMdW1DjBLaSrAPcoTxXUh95bHnGhCZ4w4MYb6t9gzUsAerKp3/b3DZHBntCuG4v1z5jCBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1ruBvP-0008Lv-0u;
	Tue, 09 Apr 2024 13:54:11 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1ruBvO-00Ap5A-3B;
	Tue, 09 Apr 2024 13:54:11 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.8-rc5] media fixes (#99205)
Date: Tue,  9 Apr 2024 13:54:10 +0000
Message-Id: <20240409135410.2579631-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240217100808.58ef40b6@coco.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240217100808.58ef40b6@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/394341/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240217100808.58ef40b6@coco.lan

gpg: Signature made Sat 17 Feb 2024 09:04:32 AM UTC
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
FAILED: patch patch patches/0001-media-Revert-media-rkisp1-Drop-IRQF_SHARED.patch doesn't apply:
Applying patch patches/0001-media-Revert-media-rkisp1-Drop-IRQF_SHARED.patch
patching file drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
Hunk #1 FAILED at 559.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
Patch patches/0001-media-Revert-media-rkisp1-Drop-IRQF_SHARED.patch can be reverse-applied


