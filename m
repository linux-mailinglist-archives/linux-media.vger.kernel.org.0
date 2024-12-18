Return-Path: <linux-media+bounces-23678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 387EF9F5C0B
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 02:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB51218949D4
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 01:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541202557A;
	Wed, 18 Dec 2024 01:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="pDm7Pxa+"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151C1320B
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 01:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734483746; cv=none; b=JC+VS/bynyZfSR1weK4JtM4SBcQFmwuVMoISOmvTvtM91+1rtUlkX2DBhyE+7LAIKV0n/azibCAJ20fFqTQqEG6doo/sZXwqnQ9yjQgpDtlClLduwbJwooqKK2EwNcC7Qv4Z2E5/FCuhsuO7nZSY7Gp4vOV7u2UfCvyqRybkd7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734483746; c=relaxed/simple;
	bh=oRMqXqY7G4AP0UeamBrMnCwFO1ubaRhPKSIoLBgrJhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K5vc/0aFUSTlJvdEgSumrq2rNvojQW7NszTfRVNv5twVMmulTzzZHftTD2EWcQLqtm7cVG2gej5ClTlg4J+uvz5mOfSnf3PAyP1QiolGguSYKmKZPCCVjBUbsChCp0t0P7Ywp3YeraApPDn/r6L6mCN90k6HYFNuaeGEhKbHRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=pDm7Pxa+; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4oUoPNeixB8N/KE9xorCYiKyn/ANbpoSpR6WmyVvM2M=; b=pDm7Pxa+WKVrmGHhP25MpTuKwb
	jgCC+BliiKlBnHJpZ0Q5xJygBkHCBnAE/cIkFPsoBVsJSJLr0whA2g/QqFRdpGD7bg78Nkk3BwN7g
	uHmw81H88INxmv5U7R82uIs848zvSTk5pwQCbcI7HuuuL+5WPQ7l/B8OMkmy/sqTPBVQde7blfxDC
	lsbc7Ol1f6LP46Qt/TZ4WzhqIbPwgfCnkY39nLFgpuVAgGWmZcX1Q7c6SqeY40sPLMZreflh0vB0r
	HQdMkbBkiZgvOJ4838GIyGtCRvR2pppNjms99zuuW3TIX8Ek9gWSDZOvteF4MiQmIiji+7fEjbayb
	JP/upeCw==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tNiSF-00074Z-1k;
	Wed, 18 Dec 2024 01:02:23 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tNiSE-0058gA-2P;
	Wed, 18 Dec 2024 01:02:22 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.14] imx8-isi fixes and improvements (#106186)
Date: Wed, 18 Dec 2024 01:02:21 +0000
Message-Id: <20241218010221.1224993-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218004058.GA24802@pendragon.ideasonboard.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241218004058.GA24802@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/408806/
Build time: 00:14:03
Link: https://lore.kernel.org/linux-media/20241218004058.GA24802@pendragon.ideasonboard.com

gpg: Signature made Wed 18 Dec 2024 12:29:26 AM UTC
gpg:                using EDDSA key 7804022A38B7D13F41738C3685F1965061424BE1
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]
gpg: laurent.pinchart@ideasonboard.com: Verified 6 signatures in the past
     5 months.  Encrypted 0 messages.

Summary: no issues. All 3 looked fine.

