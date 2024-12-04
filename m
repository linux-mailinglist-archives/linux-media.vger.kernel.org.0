Return-Path: <linux-media+bounces-22645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3225C9E452C
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 20:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E13562816C9
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 19:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340001F03D0;
	Wed,  4 Dec 2024 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="FzjcNFKU"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC913D246
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733342227; cv=none; b=rR5m4/M26Sb6KP7pOoMYDutQaDByjLpgD5yVNcpN3x5+2y+jvH7gwAfFrYAD3saodK/mkThwoOx98aXRr4ukOryXiGfgLFiaweA2f8JWWf4Xfq4eso0xXL1Tiqc7bRuxitT4TaO4WHwNXeYB+RhfwccyEBGEL1sS4I299raw2as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733342227; c=relaxed/simple;
	bh=tnEGsW5DltPimrCk5ilWTlKiopFYLYnBkwGoGIVc0jY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S7Dn4cPGYanPt0f2aLxzRjn5kMcvxVFvvEWoQUtnez9L6ZCGiiPudevuEwee4qWt8cqMN+XWLy8IS9WolZ5sz2t6h5qYxP0+KqVIbAzEpEuLSSoKguYHEO4gT5x/GZOkkTG8XfQ0fTvd+7kX5mfwUUafNUXZqRScwrIQQtlnlAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=FzjcNFKU; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KB0hf/bYFUfoptfsCcXrbe9AwFirTQVpWPwBqDtB/RE=; b=FzjcNFKUKR4UWjumvw6gAX62lu
	7wEXBlidOc4kLa2OEybT3BM25UGgufP1CmrlGH95Cixrnn7Q4W5RrpR+986NtOHOC5NqnbJMJIfbR
	DwVsaHSOJAeDuG0fa/WrSH3Eb6JElW9ZMa/iqFKby/aAUyL6PYXBii2OKCwVRA8mkOJL5veYexkOx
	O5kqhRi3Sxnn7AIMAH9Xamt4FCU8MWILRb9iR/FLCbMlMrpS1VkYgm4ewmMA9bxZ+hE3CzEBXYSGk
	jfH7G2Bew8RpyYOeeuHuIh1JISYbcZbklTRfSoxAxxvCyRCaJOOysDDEOqMcCza1T1GtM38MP9oHR
	0PI494xw==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tIvUf-000651-0z;
	Wed, 04 Dec 2024 19:57:05 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tIvUe-002SRW-0H;
	Wed, 04 Dec 2024 19:57:04 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.14] rkisp1 miscellaneous changes (#105738)
Date: Wed,  4 Dec 2024 19:57:03 +0000
Message-Id: <20241204195703.585981-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204193935.GE10736@pendragon.ideasonboard.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241204193935.GE10736@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/405010/
Build time: 00:07:21
Link: https://lore.kernel.org/linux-media/20241204193935.GE10736@pendragon.ideasonboard.com

gpg: Signature made Wed 04 Dec 2024 05:05:15 PM UTC
gpg:                using EDDSA key 7804022A38B7D13F41738C3685F1965061424BE1
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]
gpg: laurent.pinchart@ideasonboard.com: Verified 5 signatures in the past
     4 months.  Encrypted 0 messages.

Summary: no issues. All 2 looked fine.

