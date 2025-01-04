Return-Path: <linux-media+bounces-24240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3CA0114A
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 01:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A770A1884391
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 00:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8151C1805B;
	Sat,  4 Jan 2025 00:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="mOv9RTwP"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43023224D6
	for <linux-media@vger.kernel.org>; Sat,  4 Jan 2025 00:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735950584; cv=none; b=kIKLLR8N7mNOuhdHsZgw/HOwuMTYgkQJxhEKnJgAN39TPmKCTTxsz3S4TaWLKGTCBTIR4f2S2M/92OJZV6jEN4D/ldbSzs/gbRLysxxrzDsb2vfNSotYToFuYmfwZE9LebX/qc1N0wBzMtyYYP4WfAKMbhH8sSZubO7jRN7hRXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735950584; c=relaxed/simple;
	bh=ds3zA8WtGUh6+EuxwmGWZSSz8avs8PI/2XsKTHqWIY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=njswqj7jAFl1BNKCU5WObNkeIzghKQjJG0oSEnqyeLOCjIfjxk/6zQ77CBY+e9IA/6OX5CZLF8jBRPOrKRNAagSp3HbTBq2tsMOQWuJnzswQlclHAd+PEHnj0cP6uk8/WsXPI5S5f4GcHWASI91dP1K/6aIMpTa53FYUB2Pq0Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=mOv9RTwP; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VOZCDN5+HSpwLGz//3KYyLklnwcrXch+PRqkoMTPSr8=; b=mOv9RTwPF6AQbAwU1obt+LRoR/
	Ui5V5nRDx74dMlHtSP0slDv/wV+ytB5zewZvZ8zva4tYS1NgicfNOii6nudSy+JyyLxe60tvOrJT2
	Z202ePvs7xkMwDua4tSSjf19IfRhZA1FbhxSchp2JCyPTd37Vgy8SYNcWbKryQ/U9gorZKdIfZ2hD
	3oPNO1xG6Lv3fbmmULwlRYnm8nyB4629Rs8MA2OsZ8y9ZvahBFnfGSJ3+rc+HYJwuQ0XFPbJarIP4
	qhYk71U/llm4N9oki8f/ywkmMcUdlTCT3HtDqFBJfemMJXHltuJ92at7QHTsEQJki9gIAr2QASAfx
	chXnDbOg==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tTs2m-0003G1-03;
	Sat, 04 Jan 2025 00:29:35 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tTs2k-000U3v-0F;
	Sat, 04 Jan 2025 00:29:30 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.14] imx8-isi fixes and improvements (#106397)
Date: Sat,  4 Jan 2025 00:29:29 +0000
Message-Id: <20250104002929.115550-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250104000932.GT554@pendragon.ideasonboard.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20250104000932.GT554@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/413618/
Build time: 00:15:36
Link: https://lore.kernel.org/linux-media/20250104000932.GT554@pendragon.ideasonboard.com

gpg: Signature made Fri 03 Jan 2025 06:39:00 PM UTC
gpg:                using EDDSA key 7804022A38B7D13F41738C3685F1965061424BE1
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]
gpg: laurent.pinchart@ideasonboard.com: Verified 9 signatures in the past
     5 months.  Encrypted 0 messages.

Summary: no issues. All 3 looked fine.

