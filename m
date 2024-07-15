Return-Path: <linux-media+bounces-15009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3538C930EB0
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 09:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99FDCB2115B
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 07:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8B2184100;
	Mon, 15 Jul 2024 07:22:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A49C18309D
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721028174; cv=none; b=d4Y6JQPFGImU/wIV6/zMDXAoICyg2BPmEVAgcihf3pDDCiWPuP0kb2rZxjEQ2/wnCxL8Q+FPaMvJ587eAMjmhD6Ib4OWK7x3ZEARBspTyuDSpSqH+QcYSjDtAlfdK92ufFVBCSe1AYCuLKv0oQH0bgOHXMztwgWdWM9T1azrhe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721028174; c=relaxed/simple;
	bh=FARnbudIaUt7KrYWBQh65GTt/J3QZlwmWaUOqulZeLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RrBs7Cb5N089uSRBCTXtasiG1/051tWuY2SsMwgsO3vAQTj4AjNygNb4A7K8DK6dlPKNzMg8D/dAeiOCWNHi4wPso3UVKnrxdwrEMUmG1wgGr0V2udKCsxrSHxb4A6leJxSP4/OJWZrNmIRE2qn0aUX7DpJuVru7VKnc8MmoYp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sTG2u-0000Yf-2G;
	Mon, 15 Jul 2024 07:22:52 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sTG2q-000U56-2N;
	Mon, 15 Jul 2024 07:22:51 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.10-rc1] media updates (#101746)
Date: Mon, 15 Jul 2024 07:22:46 +0000
Message-Id: <20240715072246.115425-1-jenkins@linuxtv.org>
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
Build log: https://builder.linuxtv.org/job/patchwork/376452/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240516080159.76e8b45d@sal.lan

gpg: Signature made Thu 16 May 2024 06:26:00 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: tofu+pgp
gpg: depth: 0  valid:   1  signed:  20  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: depth: 1  valid:  20  signed: 124  trust: 18-, 0q, 0n, 0m, 2f, 0u
gpg: depth: 2  valid:   1  signed:   4  trust: 1-, 0q, 0n, 0m, 0f, 0u
gpg: next trustdb check due at 2024-10-11
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
Hunk #2 succeeded at 1887 with fuzz 2 (offset 20 lines).
1 out of 2 hunks FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
patching file drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
Hunk #1 FAILED at 1554.
Hunk #2 succeeded at 1740 with fuzz 2 (offset 11 lines).
1 out of 2 hunks FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
patching file drivers/media/platform/chips-media/wave5/wave5-vpu.c
Hunk #1 succeeded at 31 with fuzz 2 (offset 5 lines).
Hunk #2 succeeded at 94 with fuzz 2 (offset 51 lines).
Hunk #3 FAILED at 51.
Hunk #4 succeeded at 251 with fuzz 2 (offset 63 lines).
Hunk #5 FAILED at 232.
Hunk #6 succeeded at 335 with fuzz 2 (offset 56 lines).
2 out of 6 hunks FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-vpu.c
patching file drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
Hunk #1 FAILED at 756.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
Patch patches/0001-media-chips-media-wave5-Add-hrtimer-based-polling-su.patch does not apply (enforce with -f)


