Return-Path: <linux-media+bounces-19407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D39999F26
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 10:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8971F1C21645
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 08:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAE220B1F6;
	Fri, 11 Oct 2024 08:37:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA884A07
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728635847; cv=none; b=EF42ei5P188ewxSzXRtSUi1JeQhlV2b/uxHWlQ5M8AfKG6BrbeJfPFxoLtkwBLsaKAxRaU8SpZu0hwoCPFCUsNCVFmURjR/yIkxVDen1Xul8X1UZjlAwfMFZ9X88e+AjkjG7pHiFKe/HGw5Ay4sDHoBqbUSQX92r5osc0qL2R5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728635847; c=relaxed/simple;
	bh=bYoXHir8iajwrbfYLqKSNgmdmQlpqDtJyjuAezvJGpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e6FMOqPJyw6FPQr3NqvprMtLYqwjGPGy+MY87WoS4PNjClVKf64TXk5h+4lXHfEkmbi9U6/AgUrFak8us3nWQHLO70xewzr4KwbqH4ejchEYyXDSE+BoRu99UEOYmiWXJ9hLVK9iH6yiTs+bA3En30f+Gy2RRxZILZTjZyGIA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1szAt4-0001no-0u;
	Fri, 11 Oct 2024 08:20:39 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1szAt1-003s3O-02;
	Fri, 11 Oct 2024 08:20:35 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v6.12] media: dvb-core: add missing buffer index check (#104492)
Date: Fri, 11 Oct 2024 08:20:32 +0000
Message-Id: <20241011082032.922757-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <215237b3-0e88-4bb2-8a7d-84a2d0c2093f@xs4all.nl>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/215237b3-0e88-4bb2-8a7d-84a2d0c2093f@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/389543/
Build time: 00:10:13
Link: https://lore.kernel.org/linux-media/215237b3-0e88-4bb2-8a7d-84a2d0c2093f@xs4all.nl

gpg: Signature made Wed 02 Oct 2024 09:43:35 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [marginal]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: hverkuil@xs4all.nl: Verified 3 signatures in the past 2 months.  Encrypted
     0 messages.
gpg: hverkuil-cisco@xs4all.nl: Verified 3 signatures in the past 2 months.
     Encrypted 0 messages.
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and these
     user ids, then this key might be a forgery!  Carefully examine the email
     addresses for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad 052CDE7BC215053B689F1BCABD2D614866143B4C
     to mark it as being bad.

Summary: no issues. All 1 looked fine.

