Return-Path: <linux-media+bounces-24248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72947A01511
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 14:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527AD16388F
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 13:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CC8155A30;
	Sat,  4 Jan 2025 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="li7Akp5d"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8802914
	for <linux-media@vger.kernel.org>; Sat,  4 Jan 2025 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735998209; cv=none; b=W7wpThVrqdT9nKBA+EYwAQmARGa9KBoeGZthbwdOoUNW+vKGqE41nNdcHA/e6aT9V7VKMjiRTmQSgc5FXFMBNHPzrQUUcfQgmr86KnJCS6uXoq0BPOQGxwPCEXenb9M32jNv52zUamm0LzIWxalSA4iQxdhAKaWegwmO/YpsxUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735998209; c=relaxed/simple;
	bh=9AWrdDx+btvFSC77Qq8twlLItZzeHSWOwsNNelu6Rzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dOupTRKYDQA9Kr0u2VJB/mYHyKsDaTOSZe4E5MOmnut81dP6kFeOXUwz6Wetk7F07idL4eBeTbkCmSczzsNLae7gFRLqa+fffs0qU56bFYftpaNIqnte3ZP7ANOJiD35ccP8oGzAWdzdl+C3q48H+Pl74RhAqRTKAh3JOa8GSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=li7Akp5d; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wBK/LoAM/NNFSwTY5VZEyKA01kCjt1J0eMUuUSlg5Ro=; b=li7Akp5dmND8ux9on6gVkfRyRH
	II+R5eYpbuVkaiis7dzHI/b430ekzC24onr/qSMVD1giSaCuFKZKJdu7tKxqd6ItdgMcDXBnO5hic
	9S7G9aJI1HcS/3PpAgkcuOXAOQBLOan/k0m38gLf8cOIFt3gxEM7xutQ5axCCJvf6r213x8dNV10t
	6m6zSp1gr0QBGlKIk7rQUY9kOLD6zRUjz6YhBEa76OsRJVcvlEh+bLRjE75CT8aNb1GuKnbOVbUAv
	jQa4ru8i+mRCFz10HXoXHjqZFQ9xMBZ4zFz69bnkje2BwYffE4fMrPQ1xE3QkKhX0Q9fsUm2IDLnx
	Mm3VzJvA==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tU4R1-00042U-3D;
	Sat, 04 Jan 2025 13:43:24 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tU4R1-002897-0r;
	Sat, 04 Jan 2025 13:43:23 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.14] Venus updates (#106400)
Date: Sat,  4 Jan 2025 13:43:22 +0000
Message-Id: <20250104134322.507960-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250104133626.352432-1-stanimir.k.varbanov@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20250104133626.352432-1-stanimir.k.varbanov@gmail.com/
Build log: https://builder.linuxtv.org/job/patchwork/413777/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20250104133626.352432-1-stanimir.k.varbanov@gmail.com

gpg: Signature made Sat 04 Jan 2025 01:22:47 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanplv@gmail.com>" [marginal]
gpg:                 aka "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [marginal]
gpg:                 aka "Stanimir Varbanov <stanimir.k.varbanov@gmail.com>" [marginal]
gpg: stanimir.varbanov@linaro.org: Verified 2 signatures in the past 8 weeks.
     Encrypted 0 messages.
gpg: Warning: you have yet to encrypt a message to this key!
gpg: stanplv@gmail.com: Verified 2 signatures in the past 8 weeks.  Encrypted
     0 messages.
gpg: Warning: you have yet to encrypt a message to this key!
gpg: stanimir.k.varbanov@gmail.com: Verified 2 signatures in the past 8 weeks.
     Encrypted 0 messages.
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


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-venus-destroy-hfi-session-after-m2m_ctx-releas.patch doesn't apply:
Applying patch patches/0001-media-venus-destroy-hfi-session-after-m2m_ctx-releas.patch
patching file drivers/media/platform/qcom/venus/core.c
Hunk #1 FAILED at 506.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/qcom/venus/core.c
Patch patches/0001-media-venus-destroy-hfi-session-after-m2m_ctx-releas.patch does not apply (enforce with -f)


