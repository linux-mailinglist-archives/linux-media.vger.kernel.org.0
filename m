Return-Path: <linux-media+bounces-13309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 132F9909A38
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 00:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A87BE1F21AE2
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 22:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E1761FFE;
	Sat, 15 Jun 2024 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GZ8gRDmD"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2E17C74;
	Sat, 15 Jun 2024 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718490308; cv=none; b=EW6H2ybXP2lUdvpSFFuH62NQ0VnxhXD5/bbo1U7mF7mpdQI+oMLYGqflW0ZdaZfI2A25ygRE+LOeocdMuxSM5ogGdGNEB1SRaRLSqIi0QacC6OTIBFGmKm8cFIayA7SX9kNo9oS6ophIQYqS4O1vU0GvJa8zrvpRSwpd7n9aXo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718490308; c=relaxed/simple;
	bh=DF0mGyVb2ch10JLEOTK+vaR3v2RXWZJObNDqqoXwVpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKL+3CnLwYz114Ca0SPTwvFu7DbwbZGVvet2Jj1kfu08EDPxQNFotee2p5f5GzGjqdJhPLviHLWimwv0DDnO3Ue8co6oltNUHXG8118/Vvl9tfYChaEc3GGdgALL6dsMR6yE+dd0FhkCLkpC7peEsfLBajDXTgi9MlB4UTCA0Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GZ8gRDmD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718490305;
	bh=DF0mGyVb2ch10JLEOTK+vaR3v2RXWZJObNDqqoXwVpM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GZ8gRDmDUEff4jpkGY7Qy7Gfmm2/4xB90nA7YAOZpcj+v7T3oASQLLv5JulrqPXIt
	 EGkgp02QzHjkbe7uYrVMYVz79vnpZXG281NpHyFknU3c2ckzfCDWLSDwMX2IwwbfPL
	 A59jfWVuQeAYMpUB+h/vpNc/RLUfAW0EPFdLtSTf0g4KYaL5Ctw6x7+o11Y38SFyt3
	 MBBlUzqMcLdh/ojyBWau4DubLtSOEq7Qa7hX8AiwJ4V5g+p5Jaal6I1OZ0HOMAW2yn
	 RX9ukhSRfVDQhi0F6+YqBirSgplj+w+J5gURKb1yJ+2hpwvTbhzadwcDLiu/4GPaAo
	 9A/Kr2V+9mf4Q==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B87663780575;
	Sat, 15 Jun 2024 22:25:03 +0000 (UTC)
Message-ID: <09db1c27-b802-4cf5-95f0-d08611a5cd74@collabora.com>
Date: Sun, 16 Jun 2024 01:24:59 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Andy Yan
 <andy.yan@rock-chips.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20240615015734.1612108-2-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/24 04:56, Detlev Casanova wrote:
> +int a = sizeof(struct rkvdec2_rps);

Remove this

