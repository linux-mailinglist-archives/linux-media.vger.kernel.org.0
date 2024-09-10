Return-Path: <linux-media+bounces-18056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D34FB972CF1
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 11:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE512829DD
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 09:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A289618A95B;
	Tue, 10 Sep 2024 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bbxiucwa";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="VkR/KWY+"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-39.smtp-out.eu-west-1.amazonses.com (a7-39.smtp-out.eu-west-1.amazonses.com [54.240.7.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488B6188A1E;
	Tue, 10 Sep 2024 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959289; cv=none; b=JQKlvyy1DBbTnnNdmJoGKZXBepbiOG5OpZoNfmagRJQnpJqXjzuPLl0bZkbrm2G7j7zv6kx+BvxAg70a0lO6lNXw6Rzweedmi/vk0gPG7qd7MDNhwgPsz8igytMJxq7qbsvW8Ed/h3ZGpDeHTdzKRu125Pbp8Pr2WoXYznstP3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959289; c=relaxed/simple;
	bh=YGyux75frUROiKBR8BVeRnZtNkiumWKzL/r5Z0b2hbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ageD5Os7nqSdxdtKg1JRHMn5wlDI2AuLSj5N2oqtnq00ew2itDiPeF7h+Q0AokNfkkjCBthkyUlY8VKOim20FloemjhtUW6xH7SHiTV5W6ekDfGIw5R1kGhC1l0vGnJHXsLpgZznWSusWSkDXBpLZCtHp7FbKja21ugWYu7CiFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bbxiucwa; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=VkR/KWY+; arc=none smtp.client-ip=54.240.7.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959285;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=YGyux75frUROiKBR8BVeRnZtNkiumWKzL/r5Z0b2hbk=;
	b=bbxiucwabcZyCrhB80nPa4ERQYA6FgwGyvd0fLQ3V7/2zbkLYDPifjLib5oN5lLR
	yn6i6WntdBgB9Wywrrplvzr3kvir8NYJtj+aUMlnjRWYN8/n9brbo89D2Mp/tG2ODRN
	ZDasfjKcMQzCatg8BAoleQEzWFNal1Zj18CascZzMhDqRQa//KISy7z5CjQN/7oqTMO
	zQHd1H6vMwGNryZWexG5G6cQh9zK0UDDhYzC0pno0a3gTiU16b2jw8g/lUYEK1QcsWM
	TVXDekupfQvPVn+5K0mGuwIGQGplwErXKzFKBGiTdYFqcMk7aXtIETW53+AYfn1cNFg
	EcdlzaMbIA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959285;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=YGyux75frUROiKBR8BVeRnZtNkiumWKzL/r5Z0b2hbk=;
	b=VkR/KWY+y/b3osPFjQ2o2gopU9IojQUgApPoREvkFxYqVhICTsY2mwkvvjWJk8cB
	nty2HcJBOaVLI+9wQuUkGwSJZ5kfx2eFFhFiJjYD3MoBKlzZ76R31o/FshMxhfXJO1S
	ODViL/FRWBZ54yZvXDmT8kxV+X383W2FtHoyfPuQ=
Message-ID: <01020191db30ab48-f8d1ad5b-7468-4675-a11d-46b1df659e32-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:08:05 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: platform: mtk-mdp3: Remove mask parameter from
 MM_REG_WRITE macro
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
 <20240823-mdp3-comp-cleanups-v1-3-1f8c1395ecd3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-3-1f8c1395ecd3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.39

Il 23/08/24 23:31, Nícolas F. R. A. Prado ha scritto:
> There are two macros to issue a cmdq write: MM_REG_WRITE_MASK and
> MM_REG_WRITE, but confusingly, both of them take a mask parameter. The
> difference is that MM_REG_WRITE additionally checks whether the mask
> passed in contains the register mask, in which case, the 0xffffffff mask
> is passed to cmdq_pkt_write_mask(), effectively disregarding the mask
> and calling cmdq_pkt_write() as an optimization.
> 
> Move that optimization to the MM_REG_WRITE_MASK macro and make
> MM_REG_WRITE the variant that doesn't take a mask, directly calling to
> cmdq_pkt_write().
> 
> Change the call sites to MM_REG_WRITE whenever a mask wasn't necessary
> (ie 0xffffffff or a <register>_MASK was passed as mask) and in other
> cases to MM_REG_WRITE_MASK.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



