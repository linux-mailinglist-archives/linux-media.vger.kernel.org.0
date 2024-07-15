Return-Path: <linux-media+bounces-15010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45381930EB2
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 09:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D53AA281F86
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 07:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227D3184102;
	Mon, 15 Jul 2024 07:24:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766FE18309D
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 07:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721028268; cv=none; b=rvarauQjhX7eSEQfD0lEUrk/O5MRT5wd7NnpNf/4ahti86lEOd570qnm8nCBi4lOfqDc48oZb5jrFq5qjIxmP/2Rfs+xwEUyttgGsDyYnyxxfSqrIB7Fboe35vSYATsIfr8Y2cqlmPLNh5rcYoreoSXYY6a9OrALQhyBTDBRB9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721028268; c=relaxed/simple;
	bh=QFbZrmKk4asd8dxuCjNG/9oB5Ymjy8D0FPNgpLKIS+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hiJUo2A26oydu0g7d8wrD1wqiedkC/XeirpTlFpNZnZkdkIUlQ9FsBjdYdZkF5iFLJ8uMNmv4BxjO6K0OpavyIllaYas43Aw568LgH/w9wsjqKgUuDgFzlbuy6oAC4LClocsuP+qNW7JW3k+svZ2vb+ZvEvEPjVn+BuFJZJ7SKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sTG4Q-0000co-1o;
	Mon, 15 Jul 2024 07:24:27 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sTG4N-000Y34-1C;
	Mon, 15 Jul 2024 07:24:23 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.10-rc3] media fixes (#102289)
Date: Mon, 15 Jul 2024 07:24:22 +0000
Message-Id: <20240715072422.130806-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240608173628.05f15fbc@coco.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240608173628.05f15fbc@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/376452/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240608173628.05f15fbc@coco.lan

gpg: Signature made Fri 07 Jun 2024 10:26:07 AM UTC
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
FAILED: patch patch patches/0001-media-mgb4-Fix-double-debugfs-remove.patch doesn't apply:
Applying patch patches/0001-media-mgb4-Fix-double-debugfs-remove.patch
patching file drivers/media/pci/mgb4/mgb4_core.c
Hunk #1 FAILED at 642.
Hunk #2 succeeded at 660 with fuzz 2 (offset 1 line).
1 out of 2 hunks FAILED -- rejects in file drivers/media/pci/mgb4/mgb4_core.c
Patch patches/0001-media-mgb4-Fix-double-debugfs-remove.patch can be reverse-applied


