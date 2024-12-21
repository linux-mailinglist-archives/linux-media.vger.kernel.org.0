Return-Path: <linux-media+bounces-23979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBA99FA0CB
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 14:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9205F189017C
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 13:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A511F4726;
	Sat, 21 Dec 2024 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="R+DBVe84"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE852746C
	for <linux-media@vger.kernel.org>; Sat, 21 Dec 2024 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734788407; cv=none; b=tx7GMzAQ5cL3eosr3YtwXglTO9Ngur4+TeHfMclMZ1l/QsedVfu2oikJkaSirW2IFcB4aNpMRMHV/JlUuZRKKQmiIj7fURUScRYkkRSA0//Gh9u/c5pDu8WVDjyEzxp1fzZZEwXjcD1c0E8RbVDS5OSSK3aU8WsCteTr+Rwo1bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734788407; c=relaxed/simple;
	bh=nC8tsAHFyW9oS+ZMoxBrqqS2o7GrGKm9lJrJnuuAkuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tQGVNmpvagSRipDa8WUirf7OjK3p1gg3MhZiMQkCl5j2BJ5bJfip4mPymUGxg5JYwx/YREABMhbbivnXHRQ0RjZbtRB8xyUfUR1BnzVPSZHpKaKL3l7NoD/GSzoAoUhe8rxCpZXYchtRI7b7qKDTMsrYYm7eJ0iZ0Q2oWqg+8RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=R+DBVe84; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6Gd2dIUN1TzJR1SZ8UvpnwVhFaN8hJ4YBg7jvVpIAdA=; b=R+DBVe8451kvrdFORISDAi4T77
	eopV3ewJs/WGqCo3t5OQBEFdnhbX19GXObIg/mzfS4mHcZrw1PnzUKMnTRUkR4CehX1O6dwOcFesi
	1Rdzr9NFlXWIOOUQxjuTH67hPr3XtcSU6tYrp4nYFdxqvnp8uBLXPxyruMekOK4AWmLTcC3jfB1Sk
	WgXVeVmJVWbM5z5ozgYEQJzPoe6SZrNtDsPd/3Wm09s3ixJtAcJulpjOX35/9bxTjUA5QtHtnUxkx
	wirRKTbsX9ayzolGIZfRD5mTu/KegDtt0yfb+LF2L/UhIpzCqYZhiaZ2uFW8Ayr2OFsLe0ezf9w34
	BEnkgNHA==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tOzi5-0002zA-2q;
	Sat, 21 Dec 2024 13:40:03 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tOzi5-00Fhwa-0S;
	Sat, 21 Dec 2024 13:40:01 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.13-rc4] media fixes (#106301)
Date: Sat, 21 Dec 2024 13:40:00 +0000
Message-Id: <20241221134000.3743831-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241221142012.3f43a036@foz.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241221142012.3f43a036@foz.lan/
Build log: https://builder.linuxtv.org/job/patchwork/409761/
Build time: 00:11:44
Link: https://lore.kernel.org/linux-media/20241221142012.3f43a036@foz.lan

gpg: Signature made Sat 21 Dec 2024 11:25:16 AM UTC
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

Summary: no issues. All 2 looked fine.

