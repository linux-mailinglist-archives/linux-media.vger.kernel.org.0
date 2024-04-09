Return-Path: <linux-media+bounces-8933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522B89DC1C
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 16:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 673FC1C22FEF
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 14:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBA412FF63;
	Tue,  9 Apr 2024 14:22:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B585935
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672568; cv=none; b=f32DmXj5hIL9p1dbh2wqWauW9ErNyQzD36t8b7LnRKF1aIh6oAXQfXF0l4+OosUnWYOj0hbB4BhCp1m1qv8PhBli2kf5T+GdtY6JECSHf9mf7ebwYvE/U6GLwEbVX0gjcKZ435GRrteBR9IlCWoHaG6r4ApKMcp42iMa9UklcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672568; c=relaxed/simple;
	bh=g6vILvSlZAOCTOSkt7i1Jgupdu8U2goE0MQ4G6ClPE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WCL/GP+RbATNOrFTjW0JFcqrjtiaE/FWoQ50mIEtj2FnGyqRb/nPEZPSU+oRLbJxxKuJYY+euIkY+x+EuJjHSm+uvrxPpV5cniAxVGeBDNwKtl2B3VJQKXreOc4FWWvmRqKevQdqbOOUmDtKvwSy8V0zr1sM/MLNYs9AET8lCaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1ruCN0-0000pY-2f;
	Tue, 09 Apr 2024 14:22:42 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1ruCN0-00BMGO-0J;
	Tue, 09 Apr 2024 14:22:42 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.9-rc1] media updates (#99930)
Date: Tue,  9 Apr 2024 14:22:41 +0000
Message-Id: <20240409142241.2707179-1-jenkins@linuxtv.org>
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
Build log: https://builder.linuxtv.org/job/patchwork/394341/
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


