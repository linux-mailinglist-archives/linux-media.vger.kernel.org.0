Return-Path: <linux-media+bounces-23393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AA69F0D26
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 14:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83067168D0A
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 13:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A361E048D;
	Fri, 13 Dec 2024 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="FIvXSswD"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503801E04BA
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734095806; cv=none; b=AKI6PgB3t5YPKeoFyY3EIaAhyVtVY3avNtMSz005mQgAADfVlrc+WZE2zgmITwjmgiY1UU6GEb7a/OT6OXE6yMO8EzWMET2pOtfhm5+mMN1YQsJNJjerEWG3115632Ls0kpcoz36M+/QQaz2hXXKxM/Q54MWDvBfXPMvbPEjYOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734095806; c=relaxed/simple;
	bh=fqMXtZFTJ5yfaA98zLUtbOkCk8pf17Unml0ehfUInRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gne2po7MleTfzwZOSg7myzQQ3czSs/6VCdrsl6IGLO99uWzaS/UL7DcPPbV7pFSagoY5l4dcUP+1ox26SN1VFiMc23dzmKIv6fcfveZbJ1EwPzKgS+pdkcD1VccQSYsx/SfIhaIw+fVT246LkCgFbelOphuUOfU9t906NHK5cKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=FIvXSswD; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DHeWm/40OdxIiWFGAW+gp6smy0EiD1ry5wX5+E15cag=; b=FIvXSswDvVEbJJ6+1Hoh4dtexN
	LeJKbsbzLCINuWzAhr2D/y4QHxy1WKqlqzqD0bRoEcUihGLjN6QdMj3xXeHqcAZdDKdqOKrKdN6Ws
	0IJI/yhmMt5iL1ED1Fnwst0ZEL3CIUQ3tVcB33Tp2EPOcK6PIwIbBGvbanVxFcOF7rq9TCaK6gCPV
	WB6ta0BA0Pko52GT5FhNhVxU3getJWVuo9FSNlHjCaKkbWi6lpoeKwp/pe6djhv+N4fbnuu6kaDjl
	AatAeDbQKa45iYtm5jW/FSbFmqNxJPZKLrPXk+nVYCFiJW5DstjCjPsDsDgdkeKFxT66o31wG/bzx
	+CIS/WTQ==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tM5XA-0000CC-1n;
	Fri, 13 Dec 2024 13:16:44 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tM5X9-009m9u-0f;
	Fri, 13 Dec 2024 13:16:43 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.14] Various Hantro changes (#106070)
Date: Fri, 13 Dec 2024 13:16:40 +0000
Message-Id: <20241213131640.2330065-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241213130024.wacav6zbxg74ist4@basti-XPS-13-9310>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241213130024.wacav6zbxg74ist4@basti-XPS-13-9310/
Build log: https://builder.linuxtv.org/job/patchwork/407517/
Build time: 00:08:34
Link: https://lore.kernel.org/linux-media/20241213130024.wacav6zbxg74ist4@basti-XPS-13-9310

gpg: Signature made Fri 13 Dec 2024 10:54:47 AM UTC
gpg:                using RSA key B71AEACB392868D77606602EC26580EBB1C88525
gpg: requesting key C26580EBB1C88525 from hkps://keyserver.ubuntu.com
gpg: Can't check signature: No public key

Summary: no issues. All 4 looked fine.

