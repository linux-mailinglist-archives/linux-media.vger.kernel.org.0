Return-Path: <linux-media+bounces-21584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA7A9D260D
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 13:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FD86283993
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 12:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E121CBE89;
	Tue, 19 Nov 2024 12:42:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863701C9EC2
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732020124; cv=none; b=eeic/7XO0LzRhrxYThV0G+RRbHFIERcEsTGnWJbxuGEnux3VbSqTNZuwV6NRmzhhCU8KsGmVHGOLiw+Ei4xdePdRPtDJ6o5I0Pxaa1nWG42Urglvit8SZWAl8YOfJFVLSXEiOLXwccm+F1Q4AHDNIxNsz291Bs+3PMuVI+Pch34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732020124; c=relaxed/simple;
	bh=L9mYxkuF15QQ3+rLTE5zKVK66fPaeQY1u2LO5UnfPD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M+w60+M62hCr0FglfAW7klTv1YQ8Bs5QwMqN/tPJ924ARjoxqfXD0j14IcIJSMCO7Go5pbDEiaIyMhvRo3KtX/2QPI4hqQwm1An1xBJUIF3f1ZUlCaNmUgHLJRAqRvdtmYxAirlIBY4rkha5t13OVNc6raj3GjaQ67Avzgfi9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tDNYP-0007Mf-1B;
	Tue, 19 Nov 2024 12:42:02 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tDNYP-00ChbE-0A;
	Tue, 19 Nov 2024 12:42:01 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.13-rc1] media fixes (#105404)
Date: Tue, 19 Nov 2024 12:42:00 +0000
Message-Id: <20241119124200.3027523-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241119094008.06a199f2@foz.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241119094008.06a199f2@foz.lan/
Build log: https://builder.linuxtv.org/job/patchwork/400639/
Build time: 00:06:50
Link: https://lore.kernel.org/linux-media/20241119094008.06a199f2@foz.lan

gpg: Signature made Tue 19 Nov 2024 08:38:40 AM UTC
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

Summary: no issues. All 1 looked fine.

