Return-Path: <linux-media+bounces-48974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD098CC70E5
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 11:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 846C830DA92F
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 10:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06652346796;
	Wed, 17 Dec 2025 09:50:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9885A346781;
	Wed, 17 Dec 2025 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965055; cv=none; b=G2EW8yCwcnFt65IQStvU1yX1rISgKkcoD0n/Ff2mvl6SXp8J4QWfrcosQTl6JUWnr5g8SxgMV9PIYQPJKGWtH6eazpB6tZ7hZ9Y2OTm9HpKrYx6MMgHtnFPxKPvburP9k1Dn6mWdxuRU14DWKb2b7ATjtErfWMLWNnlfUUwvwng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965055; c=relaxed/simple;
	bh=1UfUUf/LdJqLR762cb7AnyzWQWeVnRdyMD5TCfAlSAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0qpNpWo/wsL5HBB0WIgAU2PgBK+WjZo3Ul71LagL8eLoGIwHhnkGabeGqblZSzwhGe/7pwRXpRwWqCW3DP4OUl2+V1LucrY6IjLNTwLCVL6Zd7v5p41Qtuj89lBTmaVF0zAWIdHU0+thipDk+IMKU5owf4MbRlvqIqG6fqrG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2C5C4CEFB;
	Wed, 17 Dec 2025 09:50:53 +0000 (UTC)
Message-ID: <d3aabc61-bd94-4ef7-b419-bd93bfde28f3@nxsw.ie>
Date: Wed, 17 Dec 2025 09:50:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Documentation: media: mali-c55: Use v4l2-isp version
 identifier
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
 <qHuyxg4frFKDSJM4RD1PqtVx7G5pItw_7wb2dRhy0G61Mis29jlLftxor8AgitMdn3wdzpzsKMEgM-cSxWaemQ==@protonmail.internalid>
 <20251215-mali-c55-header-update-for-v6-19-rc1-v1-1-69f56dee3c71@ideasonboard.com>
 <6e62636b-5164-4386-9782-3e8197683e43@nxsw.ie>
 <viEzeHY0bt34b1qVnunrfcbbdhzxH9_k75nsxfUqlKmqR9mlV_2tYwhTV3WwP0gyGZwFCxUswG66mAKlwHTXmA==@protonmail.internalid>
 <5ofqq3rgst3vlynls46nqwngkmzanxpe6mnbbv25oj2khr26ux@qkbp32ajgswn>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <5ofqq3rgst3vlynls46nqwngkmzanxpe6mnbbv25oj2khr26ux@qkbp32ajgswn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/12/2025 08:11, Jacopo Mondi wrote:
>> Feels like this should have a Fixes tag.
> I want this collected for v6.19, the same release the driver will be
> collected in. Is it worth a Fixes and a cc to Stable if this patch
> and the driver that it "fixes" land in the same release ?

Ah no not if its in the same release :)

---
bod

