Return-Path: <linux-media+bounces-5328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B10CC858E58
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 10:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDC691C21033
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 09:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664361D526;
	Sat, 17 Feb 2024 09:34:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36661D53C
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708162457; cv=none; b=OEfprW6IwsSJKScTdxtkky2Mw0f3aHT5rhAMahaSfIw1p2Ptk+7hMkCtznUejerTOeCaH9O30+d/uGL3YVpN5gk6QCr42Zgdbla3Jc5EfGLNGkYuWTvivGX5ddixuGlp5wU/0k6UnNWccNgjCUfxthhZLJjb06EvCtDsn4BegMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708162457; c=relaxed/simple;
	bh=pZ8/Qw5QUNBVBQBVs6xoT/qwhN+ASkslXAQo7AAl9lw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tg+0wWuUGIeibbHGwJRIGXJ3jBPbgKmJmJG3EjgELnFFFuGxzGelp+v/3kj6DcOjorCq0yd0P9KbTWjkuRH/NFzw12H4+xqCwG3XZrfFd4D7GTvbLzwtzmb1bzkJcfcvEvey/QSc2ktaj43xWRDS6z6pAHYRaOIpv2WDXXLdiAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rbH5H-0006dN-0R;
	Sat, 17 Feb 2024 09:34:11 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rbH5H-00ES1j-01;
	Sat, 17 Feb 2024 09:34:11 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.8-rc5] media fixes (#99205)
Date: Sat, 17 Feb 2024 09:34:10 +0000
Message-Id: <20240217093410.3444318-1-jenkins@linuxtv.org>
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
Build log: https://builder.linuxtv.org/job/patchwork/379484/
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
FAILED: patch patch patches/0003-media-atomisp-Adjust-for-v4l2_subdev_state-handling-.patch doesn't apply:
Applying patch patches/0003-media-atomisp-Adjust-for-v4l2_subdev_state-handling-.patch
patching file drivers/staging/media/atomisp/pci/atomisp_cmd.c
Hunk #1 FAILED at 3723.
Hunk #2 FAILED at 3754.
Hunk #3 FAILED at 3770.
Hunk #4 FAILED at 3809.
Hunk #5 FAILED at 4238.
Hunk #6 FAILED at 4268.
Hunk #7 FAILED at 4291.
7 out of 7 hunks FAILED -- rejects in file drivers/staging/media/atomisp/pci/atomisp_cmd.c
patching file drivers/staging/media/atomisp/pci/atomisp_internal.h
Hunk #1 FAILED at 132.
1 out of 1 hunk FAILED -- rejects in file drivers/staging/media/atomisp/pci/atomisp_internal.h
patching file drivers/staging/media/atomisp/pci/atomisp_ioctl.c
Hunk #1 FAILED at 781.
Hunk #2 FAILED at 803.
Hunk #3 FAILED at 830.
3 out of 3 hunks FAILED -- rejects in file drivers/staging/media/atomisp/pci/atomisp_ioctl.c
patching file drivers/staging/media/atomisp/pci/atomisp_v4l2.c
Hunk #1 FAILED at 862.
Hunk #2 FAILED at 933.
Hunk #3 FAILED at 973.
Hunk #4 FAILED at 989.
Hunk #5 FAILED at 1012.
5 out of 5 hunks FAILED -- rejects in file drivers/staging/media/atomisp/pci/atomisp_v4l2.c
Patch patches/0003-media-atomisp-Adjust-for-v4l2_subdev_state-handling-.patch does not apply (enforce with -f)


