Return-Path: <linux-media+bounces-22872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B69E900E
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98F0718865AB
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E73121661D;
	Mon,  9 Dec 2024 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="WcSMHE3v"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402B233F9
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739801; cv=none; b=SkQ3UFgGnuNAvkQPAPFcUtbyeI/muXwgiZsiGDp/VVXJBGKMCchwwuGgGrnmb6Q/ZBXhGLE3L6kHHdnKrDinUvRq0wd4Gcz8Y669S/mTT5Uld8Al/MkGGgMbWISuUdBUomkWZCPrjWOxow4ZBkyFtqsHexCy2SY9YaBXSFMGN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739801; c=relaxed/simple;
	bh=7sTQykOaafgcMwVyg+kDQ0Rk/s7uvxePn7J5q0P/mzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FL0RNiZlZrMoX8UMib54K+SKirFi+zErNVFrJSFXwdXsfbE8OqwanZy+nnD7j6pTTcRCkVFdiLv5fI9Mrusb6w/pueEvgOvayS7JfZIZyjB3T91VFoKahVRKf5DbIwPjuLLrd2Pp3ibzeIAQ3lNMXJE+kqNCBFoFLspsoZLHWgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=WcSMHE3v; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dF7CtS+UJMKP2lFy0fVK6YX/fZWlePD4zu8wcFDxNBQ=; b=WcSMHE3vkttrcAaJxpMyj931ce
	FMAildEhxZyR4I12L28bxjzJMqx5lsFLa8pP5sE2lF6n51ON4i01QUnPZSffhvrJfQTcixhu9P0qW
	qrNDQ0S1hG1ZVVt8g7y0mEAC38ywt8XqmKlQ0WEt02WdR6TyER1/aRySVdniXApgYH2LmOVlPa8D+
	A7ej6f/M9ynd/vsIiAla5gReiDqZqg5ppz+5yTvsp8vkBLH0skLhMBySX+dbrCzcyVr/UJkVCLli8
	veqUOa2puAIWJiH92I41Qf4WBKgQNjrI66cY95uNr4Xf2hy0bgJD/As0FvyNj6rW8ZARmcnE6Kx0V
	FH/rycZA==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tKav7-0002M4-1q;
	Mon, 09 Dec 2024 10:23:17 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tKav1-00FO6G-1B;
	Mon, 09 Dec 2024 10:23:14 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.14] rc fixes (#105822)
Date: Mon,  9 Dec 2024 10:23:10 +0000
Message-Id: <20241209102310.3667551-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Z1a-tW4ZD0vWcVuL@gofer.mess.org>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Z1a-tW4ZD0vWcVuL@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/406332/
Build time: 00:14:51
Link: https://lore.kernel.org/linux-media/Z1a-tW4ZD0vWcVuL@gofer.mess.org

gpg: Signature made Mon 09 Dec 2024 09:47:14 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]
gpg: sean@mess.org: Verified 3 signatures in the past 4 months.  Encrypted 0 messages.

Summary: no issues. All 5 looked fine.

