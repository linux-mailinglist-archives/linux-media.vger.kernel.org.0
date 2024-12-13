Return-Path: <linux-media+bounces-23396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF7F9F10FF
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 16:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D72E1883038
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 15:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DC61E25F8;
	Fri, 13 Dec 2024 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="srroKYJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCA61DFDB8
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103665; cv=none; b=Rdp1z2RvMW/cGGaxSY8/G77W+xnj3HGe8XBRPS1irvcQEMZxejxoenlrRev0Bxc/nkrwPVSmOw8Aq5A7xWrPrtY1C43/CY2HlUrLzYBgxS2YPMRtwMH6pNEQco1sNUNax7BqfrU1DY6K8nERecqCm2DrWHP3LREBrzhHZV7EPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103665; c=relaxed/simple;
	bh=O/CfySKZWttiHbftN6+rGEItHFbZ9ff9vONPYfofRBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uvjpPQC/oauJYAQUwB92MsGDPqRqatCyxywgUVvH9vbv2nE28mAJ884eDtX1YbzkF4kl6h6aqVKck3EzBGDnz2g80uxn5LEJJm7o9YRYHYr71OHUftX+5/t0ywdp5y90KWxCBpP+59znmtTBGG1xqhuzoiEwlujue0ndtJZqTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=srroKYJ/; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bvfHNBq63CRMK2TQ7YvZPjUED/Ns/LzGthTMGazPo4Y=; b=srroKYJ/PUsp3T6YZ6NA04C1Dg
	EMAyUGCEmzEIWtpKnVPjv4uaYl+QL4tfIbbVeDxm6xOSlBkc+pZEqY3YcKw72MJf+bh2eYYvfIeQL
	cGC3PEUBO/fdztBlPFb69wxm8rIgV09GBSxzBq1b8sWxrfTAoS6o6J7BnMHku6M3L9tqtuyKyzjDe
	04mvugbq1hyZuoUHARr0lug//uo7hzHQWGI6tYJoFqXoZePyM5LsJuoL5MMXOhX3X49C5mUxr6lj2
	95/SfDRLN3JdkOqKrb7Bt3HbW8xf4oZNPqp6Hk7mGB10PHAQlNYRfklpk/GmGaEmJIMvQim9KFkW0
	snlHylQg==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tM7Zu-00024A-2B;
	Fri, 13 Dec 2024 15:27:42 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tM7Zu-00AGlp-1O;
	Fri, 13 Dec 2024 15:27:42 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.13] FIXES: Vcodec fixes (#106071)
Date: Fri, 13 Dec 2024 15:27:41 +0000
Message-Id: <20241213152741.2447736-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241213151415.7opofgiz25lpmn5m@basti-XPS-13-9310>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241213151415.7opofgiz25lpmn5m@basti-XPS-13-9310/
Build log: https://builder.linuxtv.org/job/patchwork/407542/
Build time: 00:09:31
Link: https://lore.kernel.org/linux-media/20241213151415.7opofgiz25lpmn5m@basti-XPS-13-9310

gpg: Signature made Fri 13 Dec 2024 03:11:21 PM UTC
gpg:                using RSA key B71AEACB392868D77606602EC26580EBB1C88525
gpg: requesting key C26580EBB1C88525 from hkps://keyserver.ubuntu.com
gpg: Can't check signature: No public key

Summary: no issues. All 2 looked fine.

