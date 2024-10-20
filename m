Return-Path: <linux-media+bounces-19944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD49A5758
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416782825BB
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B1C19755B;
	Sun, 20 Oct 2024 22:23:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D941C77
	for <linux-media@vger.kernel.org>; Sun, 20 Oct 2024 22:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462983; cv=none; b=Rdrz63si/qz9kqy0YnF2kjWckvcBKyqQpM3W2pQT6Aequm7cdTQMOBHJwK2jFS0qZ9AyIOS6gi3gC49zM/f0qYWk6sgxOS5VOJSu1fN3pmVuNFpdvpG6EUD2p9p8aUb8JCl6tOJhTNE0iAb+WKib/3SMz0c2PFYka0IyOPHH7F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462983; c=relaxed/simple;
	bh=PVbOQQBnZ6GbdTvYs/a0qePiR7cTmBI4+GqFkEbUfiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uTRGodwnAJ9hrbxm84gVkVNbGmK5/T8ckw2xqAlj1Cf/8Rz6P/FyfB+EV1fC3qLpXDrx4RMZJn1hMRDZ/KNwlyw/Eaqn0FD3J5C21rWhezAkExXggWZciCXAMN5oQoS2fw7gZmYD3xX+Tn7LPNVjwx9yO2pL9aRyHoxNVZ881co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t2eKE-0006kc-06;
	Sun, 20 Oct 2024 22:23:02 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t2eKD-00Ex9y-2o;
	Sun, 20 Oct 2024 22:23:01 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.13] rzg2l-cru driver improvements (#104895)
Date: Sun, 20 Oct 2024 22:23:01 +0000
Message-Id: <20241020222301.3563993-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241020221502.GM7770@pendragon.ideasonboard.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241020221502.GM7770@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/392239/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20241020221502.GM7770@pendragon.ideasonboard.com

Build aborted due to a fatal error:
FAILED: can't fetch patches from 698b6e3163bafd61e1b7d13572e2c42974ac85ec to 1819a61e4c77189a0183697c0513fefb9bedf462

