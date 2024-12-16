Return-Path: <linux-media+bounces-23454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B99F2B7B
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A864918877F8
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 08:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3291FF7AC;
	Mon, 16 Dec 2024 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ECH6F9SK"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9B171BB;
	Mon, 16 Dec 2024 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336410; cv=none; b=jldKw+uQ2HjC57RshRLBhomQKmTOAjfFkkDPq/Agu76xk5B1CuVh6fDLjn7VSakIC6l4t2jKAQUsoM/6uyGpu21LSTSVBAdg77D9UvI3gVncztjA4sFgmjJypA5keM3VHIuPb1DCd50L7FnqjupYHKi9Oji85noOQYZl0jqp6Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336410; c=relaxed/simple;
	bh=HaHnIGeijd6tTpglwZ7rtRjeB8ky6wwz4btYeFZoS7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XTo/zCSrw3adgT0Dp436o53vQV7JtzoGKAvxt4903dGtWl0fKiTOM/kNlgzMeIaj5dnCwmBsjCDdqpUjmNAMIOtor/h0r83wdmyRdOxVKTWnhflndrEHB7l8vT700IBrUKUlMitfQ2kjYBmUe7kE6PrGKELda1Vxha5VU9LZifk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ECH6F9SK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A5bn6knJzryQkL3CzFo6N9Sn/p2Hmwhbnzw0riz5FFg=; b=ECH6F9SKAjLOnyVZlDYnaROKFR
	dvcSxcJHpddOUv1Ru5GftxVGDdyAm9823UZ66e611HdEez9PdFLdwjmefqym0lIgvzvIhuEde5PBf
	uDKGEapBIqJJ6cPAuhdE7W5ICZQzj03g/A2Z1nHfncmBGZibEvdG91sI+4+qhlqAoJhg0BoKWsEqo
	QRHAdUn9FFzsjlXCDHuTOrK5ogk9ImFuTq6jY6ANDD13hBoahgEhsbjcV3E6f+rKXtjHhuNSQCeLB
	lFOR2a1TNlQbRx/+HB2T1GZMIXbnDNaHEI2FUk6aB76RMYaSzvt6CB7iXAyhJ16GYQ96liAgkV1F1
	73qcVMQA==;
Received: from i5e86190a.versanet.de ([94.134.25.10] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tN67b-0002tK-W4; Mon, 16 Dec 2024 09:06:32 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, Andy Yan <andyshrk@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kever.yang@rock-chips.com, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] media: rockchip: rga: Fix Copyright description
Date: Mon, 16 Dec 2024 09:06:30 +0100
Message-ID: <3258928.5fSG56mABF@diego>
In-Reply-To: <20241215093051.3447711-1-andyshrk@163.com>
References: <20241215093051.3447711-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 15. Dezember 2024, 10:30:50 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The company name has update to Rockchip Electronics Co., Ltd.
> since 2021.
> And change Co.Ltd to Co., Ltd. to fix mail server warning:
> DBL_SPAM(6.50)[co.ltd:url];
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



