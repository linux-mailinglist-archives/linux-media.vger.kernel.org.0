Return-Path: <linux-media+bounces-23688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2CF9F5FA8
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 08:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 457FF166A89
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 07:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F047C156F44;
	Wed, 18 Dec 2024 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="WUvytowy"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02242048
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508317; cv=none; b=JnTHNlFicEBdUg/NWlgSzXmnjy+vCHFv2cAMcYgBbjk9gJBxThSJ8egZ1BvbSZxXdBHDcmcSpdpnucGlHY/krVibZIWRXSwqmaegpuH+CxbJPM48akwYiScMNwvi/AAFlkr6AON/ZASN2FspzB8YP8jWZHeB1OxJ1GbQDUOrf+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508317; c=relaxed/simple;
	bh=nsfLfUR+IkSmjv8VtFVbeok6DjZ4WnT2L747hugPIzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QcLIjCS3p/y2sQRQg2JM2wSB1yBiNJED+tA9BfiyBn1vn1YRD0Pn0fzplp6pfSP67PyksRmUTFnwTZnGr7vjSD05EmWnu787nWzbY0Qyq03l/G02r1i2QMK7IbNCsC4bk8XA/7HCTpXzjYIODecpDItDJkQ+9+92Doxhul5JemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=WUvytowy; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IGs5w8uOmC6ccpeyl7XbxAph6F+gz/sI/AGrVHdLSnY=; b=WUvytowy0mi2zIKC6yUCiBuIN0
	EUPzf5yrLyoeGoFDlNnE4EyjfZUw96A5qWisXDQ8RAHLgySDjkijnxY1bm/eZrCQTFulDYHDyGnzI
	RXjt2gRHfBtNn2PlNaZiPF4Lo6t7bofjC2OnuORc2KFqXSY1RFgOkOCOfwayVtP81Mgh1w7nhsi91
	Q/vhcpiZdHFim1CY43t0dxpxMtbAX4k8a/JlFXOmVVFRAl8oNTihQ5m6ocxgMN4i96UbHT+HgFbwk
	7JbG0gh7lv8M21gOvV1hMGySu5YrK55+LefTBqsosdpz/F4tyixWesTFCoKelEDhDC3kBFeioB2i2
	gKZObkFQ==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tNoqV-0004mS-2p;
	Wed, 18 Dec 2024 07:51:52 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tNoqM-0069CW-37;
	Wed, 18 Dec 2024 07:51:43 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.14] V4L2 fixes, imx462 support (#106187)
Date: Wed, 18 Dec 2024 07:51:33 +0000
Message-Id: <20241218075133.1465327-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Z2J4arwqzIl9ltXC@valkosipuli.retiisi.eu>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Z2J4arwqzIl9ltXC@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/408869/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/Z2J4arwqzIl9ltXC@valkosipuli.retiisi.eu

gpg: Signature made Wed 18 Dec 2024 07:21:40 AM UTC
gpg:                using EDDSA key 5873A1DBBB1EBB81535A470C7A13323D00AE6FDB
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]
gpg:                 aka "Sakari Ailus <sakari.ailus@iki.fi>" [full]
gpg: cannot open '/dev/tty': No such device or address


Build aborted due to a fatal error:
FAILED: patch patch patches/0013-media-rcar-csi2-Allow-specifying-C-PHY-line-order.patch doesn't apply:
Applying patch patches/0013-media-rcar-csi2-Allow-specifying-C-PHY-line-order.patch
patching file drivers/media/platform/renesas/rcar-csi2.c
Hunk #1 succeeded at 173 (offset -10 lines).
Hunk #2 succeeded at 577 (offset -97 lines).
Hunk #3 succeeded at 636 (offset -103 lines).
Hunk #4 FAILED at 772.
Hunk #5 succeeded at 979 (offset -151 lines).
Hunk #6 succeeded at 1076 (offset -151 lines).
Hunk #7 succeeded at 1436 (offset -340 lines).
1 out of 7 hunks FAILED -- rejects in file drivers/media/platform/renesas/rcar-csi2.c
Patch patches/0013-media-rcar-csi2-Allow-specifying-C-PHY-line-order.patch does not apply (enforce with -f)


