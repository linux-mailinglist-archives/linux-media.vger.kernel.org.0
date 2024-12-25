Return-Path: <linux-media+bounces-24080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F039FC5F5
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 16:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C67B81882465
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 15:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFB1323D;
	Wed, 25 Dec 2024 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="k6JJqOQQ"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A53A3B19A
	for <linux-media@vger.kernel.org>; Wed, 25 Dec 2024 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735141612; cv=none; b=rZbll5eb32nYsPeSuhdP8rJamJ8Bl80b9Qv8nLJbo14puuWUDWOadSZg+tkiPNhT65WIwkFabIuJWk+B4Y3mGz4HyOU5NKspiottv9wsCypaIZcnwFAjI/OA8cIGxd4SQtDYV6hatrjUk5jT4q1XrlfOfxPcVNF52cVTKpThX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735141612; c=relaxed/simple;
	bh=hPyS1Op3rNx51keUHbSzkqRuE9PjWHtpMNzkYaCwSvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bK9xRhh1lCAvcp068MhKb4E8zV9JKcj07oRFErtD9IrMzaaf01POGDCw6re54BY+Je4o1Vxcsd1HBS0OPh86nLSIcBFq9zny0NLouPwwoBOjtxk7tksBvVP4xk4S9NzEAyjcH9joGYInkUXAYMblvEo7f42ys3WXlMLfBKwReLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=k6JJqOQQ; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wLKLwQb3B8D42FRW/tXtitqOOp0QcTrK+AjMyqp5V6Q=; b=k6JJqOQQMIO8cxH/98h5t9FQs5
	8oN9vyHhBfU1T3Nb3lPzqO8ZBOvPG7QmQ9EfMuO/I3LuZnvf8cX+VFgoNvEIPbRdZQFbnOUzjyPWZ
	orD1H9ZGHBheDsUAdejDfY8BTq06HFuSoumahoiT/tjwh2ucVOdyHNiBjb+k8YoXB/7uGxgH+XzMb
	BOt3BhKhA+pa4/Yi5AAR1v/Ghh3UbbO5+K4TX2S4uw5ow41MNSBDfGdfOwyc5L+Y7DtX6Pw2uNm48
	0Lwr2Hl1QKgSlKo61SPYPtn1qejs809zZxtqPhXfGxO4Tgg2C5UI8v8wQc91sh+1LVPpNQrktCe5d
	YnfB1Flw==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tQTb0-0000D5-0T;
	Wed, 25 Dec 2024 15:46:50 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tQTaz-009cgS-2K;
	Wed, 25 Dec 2024 15:46:49 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.14] uvcvideo changes (#106342)
Date: Wed, 25 Dec 2024 15:46:49 +0000
Message-Id: <20241225154649.2293643-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241225153056.GA3523@pendragon.ideasonboard.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241225153056.GA3523@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/410924/
Build time: 00:08:52
Link: https://lore.kernel.org/linux-media/20241225153056.GA3523@pendragon.ideasonboard.com

gpg: Signature made Wed 25 Dec 2024 12:59:40 PM UTC
gpg:                using EDDSA key 7804022A38B7D13F41738C3685F1965061424BE1
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]
gpg: laurent.pinchart@ideasonboard.com: Verified 8 signatures in the past
     5 months.  Encrypted 0 messages.

Summary: no issues. All 3 looked fine.

