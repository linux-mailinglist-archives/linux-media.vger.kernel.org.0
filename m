Return-Path: <linux-media+bounces-48797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A7CBD965
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0C723010E4D
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 11:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1461C3358B7;
	Mon, 15 Dec 2025 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="2Dzjn248"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFC73358C1;
	Mon, 15 Dec 2025 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799267; cv=none; b=CdZgsW1QQ19f/S2NL1j5run0EdBIl8cRbU0jA7OYFB9MQ5PU/aSak/pMKKCJ7rb9uzfSCKPJ5kROcEJsvzNLQYFavnM0DpuibkxRByI1FCMsj9kMwoqCHI9NMoV7TPzbZFnAhnLB5NNHutlzfYWlaXMy5vWSkkiy8VWutPXPQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799267; c=relaxed/simple;
	bh=0SEq/x8X0QFfkPvW8BGjCa3AjDAXeaQG4E5hn3lfYkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHZMxMRpVL2jorQoLCuYS+DcrofxzNY52p5qcSg1HbalSIlAtkKSXUu2gL63AWYx6K/EmmRQj/ouD8CUkr0tABjj3DgFzd7hJwxn6hhaS2MZi8cK2xi0SjEkUfh4BypiiJEFRz/wwghstEzwyHje995N2haGESHpwR5JB3H/cn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=2Dzjn248; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cDCAdTgs2P3VG3lCGDQQe/McF+oPTUo+A/A40/PgerU=; b=2Dzjn248o/8afFCxkZtum0p2YK
	UeeI0k6+K3TX+bhvV4nXMAl0Tdupum+oSRjVFAuyILhnSbylG2RUPmjGTz1JRGzgkaLAyZ8nlHNLr
	E74vxWg27sFGhmXD/VpHmzqNH/yZ8uBUu+mZQLihafhQANSQUkJZo6x14UOUrXXd6XspUqwOganxy
	ITCUq33LKI2lNOrCCGmUb8UCYqpLMPCjkh9Rln6ogMG5UpRE1k4xalNHY58Og9p5LCM1aOyaHBdVT
	Dv2Dvd69Cs/qhMiGIN0xfFRR6SDPzAh09oS7S9Ybbem3rPaKdGJw4mUis4QjL/clKv9spKBeEa598
	dMRqw7JA==;
Received: from [192.76.154.237] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV73A-0000On-Pb; Mon, 15 Dec 2025 12:47:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/7] media: rkvdec: Add HEVC backend
Date: Mon, 15 Dec 2025 12:47:33 +0100
Message-ID: <176579924020.1404176.16613704782665436214.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Sep 2025 16:19:18 +0000, Jonas Karlman wrote:
> This series add a HEVC backend to the Rockchip Video Decoder driver.
> 
> With the dependent H.264 High 10 and 4:2:2 profile support series
> finally merged there is finally time to send a v2 with minor changes and
> a suggested code style fix of this series. v1 of this series has been
> fully functional up until recent unstaging of the rkvdec driver.
> 
> [...]

Applied, thanks!

[7/7] ARM: dts: rockchip: Add vdec node for RK3288
      commit: e74470cf3101da79666f20186c9406192223e9a8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

