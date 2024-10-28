Return-Path: <linux-media+bounces-20434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 631149B3535
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EC531F22391
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3931DD9A6;
	Mon, 28 Oct 2024 15:45:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7612F585
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130352; cv=none; b=Vi6rBohpx92xn1y7/0kiERRDGy7t7lijV2PB2DW9M2GXD2IK3JvNYp7KHF96XT2Fxh4S90/VJQjk3wAvVtgnXzouXyjkV7IyC2GKb9GC5Jammcv5x63IijVC3pJ2N/OwgrzqBN6NnGtlGys0m958P42uwt2CuhBoNYQRvUFssqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130352; c=relaxed/simple;
	bh=aFQ8///xRzJd1TgeQyrVGSZgs18FySSGThVZDmIOLys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bu1JGeFSPpQ0rIsrAE0vNPQEZgsZneR3ZfzHBsA4u9lt/HprZKGXiEOdp9cpfZtdfcblMRD/stT3TPdM615A2wWYw6CD3JaC7j/NBHgQKMds1FQQT7kUDcGfhmeBi6XAFXsVDcEKywaJBEx3AnmKWJe0L36JeNibA/5PTtjjsTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t5RwE-0000ze-0Y;
	Mon, 28 Oct 2024 15:45:50 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t5RwD-001PFj-2h;
	Mon, 28 Oct 2024 15:45:49 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.13] Tiny rc core change (#105004)
Date: Mon, 28 Oct 2024 15:45:48 +0000
Message-Id: <20241028154548.335390-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Zx-u_AaY36dM1EPT@gofer.mess.org>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Zx-u_AaY36dM1EPT@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/394462/
Build time: 00:07:44
Link: https://lore.kernel.org/linux-media/Zx-u_AaY36dM1EPT@gofer.mess.org

gpg: Signature made Mon 28 Oct 2024 03:28:24 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]
gpg: sean@mess.org: Verified 2 signatures in the past 3 months.  Encrypted 0 messages.

Summary: no issues. All 1 looked fine.

