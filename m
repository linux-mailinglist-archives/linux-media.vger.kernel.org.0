Return-Path: <linux-media+bounces-11507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A98C71DA
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F94E282B7C
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 07:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BE129CF6;
	Thu, 16 May 2024 07:09:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529892744D
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715843362; cv=none; b=TxvSTLd2C3diHOgN8nB0CNy3iuWQuM1d/dAjSOGOyWMRpUN9/ZxdGioVMh3IgKNf4OH7FI6qBvp2silap3Y/WHbricoS/zWtavUy7WtW7ATSKHl7Ub/WKvR2O3nzApgkD4+kioduWthUd8ojBCYemzPnGYC9NFB0Ia3X6vUY5GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715843362; c=relaxed/simple;
	bh=OSbV/nMPiRT+Gorn91Mon4ldkmAjVSPLjFfSz+JxEMI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tm/XACLsYd8iXy2I/reuuyvRpKgBnEFSzT6Dfv+dwJexv01fpRIAbygkmDRW2WqfUijGQpykkftEyOPMSdwHDHmiZEhQ36EOOSykj7xDY4sq52mdljEim3MD9M9zCdK2mxKpm1vxmRMeZ0pfKEzkBXBlxN/4kO7eYYP1ZNdIqnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s7VEu-0003Wt-1Y;
	Thu, 16 May 2024 07:09:20 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s7VEu-008IGk-0G;
	Thu, 16 May 2024 07:09:20 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.10-rc1] media updates (#101746)
Date: Thu, 16 May 2024 07:09:19 +0000
Message-Id: <20240516070919.1976841-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516080159.76e8b45d@sal.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240516080159.76e8b45d@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/404581/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240516080159.76e8b45d@sal.lan

gpg: Signature made Thu 16 May 2024 06:26:00 AM UTC
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
FAILED: patch patch patches/0001-media-chips-media-wave5-Add-hrtimer-based-polling-su.patch doesn't apply:
Applying patch patches/0001-media-chips-media-wave5-Add-hrtimer-based-polling-su.patch
patching file drivers/media/platform/chips-media/wave5/wave5-helper.c
Hunk #1 FAILED at 52.
Hunk #2 FAILED at 71.
2 out of 2 hunks FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-helper.c
patching file drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
Hunk #1 FAILED at 1810.
Hunk #2 succeeded at 1878 with fuzz 2 (offset 11 lines).
1 out of 2 hunks FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
patching file drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
Hunk #1 FAILED at 1554.
Hunk #2 succeeded at 1740 with fuzz 2 (offset 11 lines).
1 out of 2 hunks FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
patching file drivers/media/platform/chips-media/wave5/wave5-vpu.c
Hunk #1 succeeded at 29 with fuzz 2 (offset 3 lines).
Hunk #2 succeeded at 86 with fuzz 2 (offset 43 lines).
Hunk #3 FAILED at 51.
Hunk #4 succeeded at 238 with fuzz 2 (offset 50 lines).
Hunk #5 FAILED at 232.
Hunk #6 succeeded at 320 with fuzz 2 (offset 41 lines).
2 out of 6 hunks FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-vpu.c
patching file drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
Hunk #1 FAILED at 756.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
Patch patches/0001-media-chips-media-wave5-Add-hrtimer-based-polling-su.patch can be reverse-applied


