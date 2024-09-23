Return-Path: <linux-media+bounces-18469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9997EA99
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 13:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FEFC1C20D44
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 11:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ECC197A9B;
	Mon, 23 Sep 2024 11:21:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C3944E
	for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727090478; cv=none; b=SWslzvvVbAbPe9DeNIE/Ey0r0JFkOlKCXU3Dilkiwn1o2ZHwJI3VvqCXoAkHWNKjK6r9U6dDKpV3ociSybibLUgyBXpVgc6h5UcwoM5N2rFgYhAiAj9MS/7aggzU4XqLS0CPG6ja7unjdcXkaFVq/PwZkMxZ0yLJ3Xsx1PoFn8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727090478; c=relaxed/simple;
	bh=hu48f96rM5qLY7vXp29vj8KNaBrJ/IOnmUNiRePiBFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MMdz8G+ZCBXJTs3KuxiYBBqVqqkXy3LFItImm4XlmCmuMv38hfsVMP8HI/ADvheZTcQZzLkL58cuOR+T2RArLKXsP7/6B2pNiw18UpQktO63nMkIoCNA1cHJVEKFpIFoVU7XFU3DywPm/vWIJzzd2MDFgLcoelT0/UlBd+tjKkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1ssh7z-000617-2X;
	Mon, 23 Sep 2024 11:21:15 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1ssh7y-00AalU-2j;
	Mon, 23 Sep 2024 11:21:14 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.12-rc1] media updates (#104309)
Date: Mon, 23 Sep 2024 11:21:12 +0000
Message-Id: <20240923112113.2524595-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240923125642.7aed968b@foz.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240923125642.7aed968b@foz.lan/
Build log: https://builder.linuxtv.org/job/patchwork/389038/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240923125642.7aed968b@foz.lan

gpg: Signature made Mon 23 Sep 2024 06:13:56 AM UTC
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
FAILED: patch patch patches/0001-media-rc-meson-ir-support-PM-suspend-resume.patch doesn't apply:
Applying patch patches/0001-media-rc-meson-ir-support-PM-suspend-resume.patch
patching file drivers/media/rc/meson-ir.c
Hunk #1 succeeded at 593 with fuzz 2 (offset 26 lines).
Hunk #2 FAILED at 633.
1 out of 2 hunks FAILED -- rejects in file drivers/media/rc/meson-ir.c
Patch patches/0001-media-rc-meson-ir-support-PM-suspend-resume.patch can be reverse-applied


