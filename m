Return-Path: <linux-media+bounces-18057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC9972CF3
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 11:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E721F260F4
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 09:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1383E18CC1A;
	Tue, 10 Sep 2024 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bCFRAajk";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="bFEm71YY"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-39.smtp-out.eu-west-1.amazonses.com (a7-39.smtp-out.eu-west-1.amazonses.com [54.240.7.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E021891A1;
	Tue, 10 Sep 2024 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959290; cv=none; b=WzpK1wA2kRSEO9qnGqC/oVSYh83fshScnDHSz4xbFCjNRWUCxn0uPFuOLaqo29tx5usFmRbwpjdOYweffjGtTna0TlNKtmU0JvrlaYmtFExOsp6+ggAmdjXOLf3XaZ21tLVNp8n814o+lCc39+eAblv89syxXJ3Lmukppvaw4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959290; c=relaxed/simple;
	bh=Ap9MOG3CXdyjhNIqu9RwhMWZU+OT3wDOHRUFW/Y/OMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxgZCRnSQ9sLvq/eJwvLPd6UzjYvKqflA0+/AQZ+NoMW8q7J7+8VkKKa6WuZjLvESFLnKD7Ul8eFVWI6OULGbdZoZ0QQvm+pQ4TiCIdVVPcnAENFe8HLJwuT9L5RSY6smHoReTTSHEW3HSxN7szEGV7rRwOAoa01Be7AR/Xg518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bCFRAajk; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=bFEm71YY; arc=none smtp.client-ip=54.240.7.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959287;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ap9MOG3CXdyjhNIqu9RwhMWZU+OT3wDOHRUFW/Y/OMw=;
	b=bCFRAajkH6DO7bl5wHG4/onrjBY8MayVa4VwIdFXeivR5gIlM7Qwj1mU9wSIvYmg
	JX/DBrFbJDPEC8pOB545qmg8GxtY4NLmN4ts0zJxwastvsMjOsfsXSUoCFl2PBpduOq
	2H9wSeovCX98GhUBVlQdJxzaWvvdVYaE560lrWj6pSf9byg48cAmWwZpiqP8lL81uAs
	o0jPe76Vx59Sr1YacP8nCjBG9oE5Mb/0oWUCfj52j5kyGahEyv6mLwqSNoU40pv7PBd
	yBlYUkxChphFVmlZpASkdbOZ4obtxwA3WlsWOb79GuD7C/HkZZNyKk1zMYtlqo91clo
	iiwKJZF/mg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959287;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Ap9MOG3CXdyjhNIqu9RwhMWZU+OT3wDOHRUFW/Y/OMw=;
	b=bFEm71YY9eP7DZF1XyG/d/vJz3Pcn7pBRgeBbCt0UegboODNJEqdvwwmvyBvRogB
	RonFXUoCnx84EdsiwVOUXZM/hx7P3FWSSLRcTI/b6RO5Y1MPGbPi+2jkFdbfC9/SHm5
	4zoohbdaEEfij58aw8CAosYYEsoGSAh8dYI0txvM=
Message-ID: <01020191db30b13f-7c843665-0c84-40d2-ac68-6f21dac57bbd-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:08:07 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: platform: mtk-mdp3: Use cmdq_pkt_write when no
 mask is needed
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
 <20240823-mdp3-comp-cleanups-v1-1-1f8c1395ecd3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-1-1f8c1395ecd3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.39

Il 23/08/24 23:31, Nícolas F. R. A. Prado ha scritto:
> cmdq_pkt_write_mask() boils down to a cmdq_pkt_write() when the mask is
> 0xFFFFFFFF. Call cmdq_pkt_write() directly in those cases to simplify
> the code.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



