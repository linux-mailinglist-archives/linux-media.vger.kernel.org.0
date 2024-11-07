Return-Path: <linux-media+bounces-21036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC499BFFC4
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 09:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D3B11C21351
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A251A1D54D3;
	Thu,  7 Nov 2024 08:14:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5D0192B73
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730967246; cv=none; b=V6/7/PmB6OV2Bf4QgylABtBHPV+a12DtxeqRquTVQ/Kcd2g9CNeMYKkp5RfeBY/OYNwew/JJmIc2riQE8FpvZG0jTUcs/pjkR8yZ0cjEPqjDno1jTO0HrpnYH7liWNCZ7UliHOya0Jbc8ViKGza2x1V/A20zKmJinITaOyEfCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730967246; c=relaxed/simple;
	bh=n/cqKwy+EX9hE7A5ogl61uirlvXJu8fgYPjGo0rM7b4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ov6JCX8C7LtMwIJxJu9r/Wq5RAe75ZKAlVHDaObwjMFj1TeMnST46x3XIXktKtd1SmLoqrcOkPkHCBN86mIcc/OEpSatvHokphlWKyKLZTWxANjM3mENP4dFQTeFCzmhNZXG2Mo/TdBLcz8SNxdDPR/disLzw+dHEtVJSaVwZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t8xeV-00088y-23;
	Thu, 07 Nov 2024 08:14:03 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t8xeU-00Bo5o-2j;
	Thu, 07 Nov 2024 08:14:02 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.13] Venus updates (#105213)
Date: Thu,  7 Nov 2024 08:14:02 +0000
Message-Id: <20241107081402.2814155-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241107075621.118606-1-stanimir.k.varbanov@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241107075621.118606-1-stanimir.k.varbanov@gmail.com/
Build log: https://builder.linuxtv.org/job/patchwork/397201/
Build time: 00:11:39
Link: https://lore.kernel.org/linux-media/20241107075621.118606-1-stanimir.k.varbanov@gmail.com

gpg: Signature made Thu 07 Nov 2024 07:41:44 AM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanplv@gmail.com>" [marginal]
gpg:                 aka "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [marginal]
gpg:                 aka "Stanimir Varbanov <stanimir.k.varbanov@gmail.com>" [marginal]
gpg: stanimir.varbanov@linaro.org: Verified 1 signatures in the past 4 seconds.
     Encrypted 0 messages.
gpg: Warning: we've only seen one message signed using this key and user id!
gpg: Warning: you have yet to encrypt a message to this key!
gpg: stanplv@gmail.com: Verified 1 signatures in the past 4 seconds.  Encrypted
     0 messages.
gpg: Warning: we've only seen one message signed using this key and user id!
gpg: Warning: you have yet to encrypt a message to this key!
gpg: stanimir.k.varbanov@gmail.com: Verified 1 signatures in the past 4 seconds.
     Encrypted 0 messages.
gpg: Warning: we've only seen one message signed using this key and user id!
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and these
     user ids, then this key might be a forgery!  Carefully examine the email
     addresses for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad 34CFE0398A16AD9318FDD5E8A6D026D8E35814D4
     to mark it as being bad.
gpg: WARNING: This key is not certified with sufficiently trusted signatures!
gpg:          It is not certain that the signature belongs to the owner.
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: no issues. All 5 looked fine.

