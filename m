Return-Path: <linux-media+bounces-7116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00487CB58
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 11:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FF191F2249B
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 10:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6941918AED;
	Fri, 15 Mar 2024 10:27:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710518050
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498471; cv=none; b=lDtvYf5RkXo8LyZcCyNASpeHeCvGZztT9YAmyCP4edaU2NVHaY26wdiYnxqJssztLlNhb8nftnOxwHpocl+F6lnaunqmZjQ6xFsZ6RVaMrqOUlYoDeJeeM9QDEE2JGdBYlO55GC58ufyCPDsu0eCHPwtrsAXsXyLFgXSXDDo1+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498471; c=relaxed/simple;
	bh=jeP2eruWFUgFMxu2DnK40OlV6dygicRJOGlyMU7RJSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q07LjizC7yQZYR4QKNveQcCfaj9ojo4PQuzmlvptbK7IumRfPJ+T4Fqt+uZKQrIVrw3ECa6brloT25n9UX5VA9VwC0WPXQ/xPpGAS9R3fQJfEz/Bu7TCdwIbKIdH4POf+ozrrhm+eAJIMpBL1n099/LFfc1FeQf7sEbB69rFxT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rl4Ov-0004uj-1u;
	Fri, 15 Mar 2024 10:02:57 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rl4Ou-0058qY-36;
	Fri, 15 Mar 2024 10:02:57 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.9-rc1] media updates (#99930)
Date: Fri, 15 Mar 2024 10:02:56 +0000
Message-Id: <20240315100256.1225637-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315103113.26f9dad4@coco.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240315103113.26f9dad4@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/387226/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240315103113.26f9dad4@coco.lan

gpg: Signature made Fri 15 Mar 2024 06:30:02 AM UTC
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
FAILED: patch patch patches/0001-media-fimc-lite-drop-unused-flite_hw_set_camera_pola.patch doesn't apply:
Applying patch patches/0001-media-fimc-lite-drop-unused-flite_hw_set_camera_pola.patch
patching file drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.h
Hunk #1 FAILED at 134.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.h
Patch patches/0001-media-fimc-lite-drop-unused-flite_hw_set_camera_pola.patch does not apply (enforce with -f)


