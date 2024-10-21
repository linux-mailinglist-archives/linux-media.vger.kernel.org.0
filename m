Return-Path: <linux-media+bounces-19993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2439A688F
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 14:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7179FB28D71
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 12:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A131EABBF;
	Mon, 21 Oct 2024 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h3dM2UN3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782671E573C;
	Mon, 21 Oct 2024 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513825; cv=none; b=mx3+YLit/bmYjz1QOiH5IMH2GzvqNvlNX4sURUuPnnSXnQes6eqxIKeBxLDhuzYLcA4Ta6wqqZazcdKB12WC5z0eaYofJaMOB1qBJ6wyrpmazvjAD9UF/RfnNswPafIi0DCi5S3XmHPe247Bt1/BfY9bXxuA73g1p2mcST3bz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513825; c=relaxed/simple;
	bh=KmPP3ODrgm6S4oV5Bx8ZJrii0qhuvczppRYWff07974=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNBDNtg7T5vzGGk7YmfFgzPnSw9Gl6ZedP3CJjA3oDIin1JBoa2/v9apYZi1mmY7IqnyvO3M9AK84b7dkOB1y7Lz3fFgwU7A7BNzqw2YiV3ILhcXlZtviDtde6dAhUI+eLZ/Esys5Or2oY2xXdsg4qyIBsZ+3EcSmoV7jucz0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h3dM2UN3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729513821;
	bh=KmPP3ODrgm6S4oV5Bx8ZJrii0qhuvczppRYWff07974=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h3dM2UN3KXOOPD4dEZnVVQPxHoe/wCjYFs84Sonpkk3+f9NjgkkL/oKVeWYvfwzc5
	 x3PW2/yumjsP7rurbYu5tO1tXZaEoyPZw+8YHx5rJs0gP7DTzP06tTZ8n7QfgkOcRE
	 fXJx7w6IZcj243nbAzcqIB2NbjNR0eDz3rSCM4ycCf/nlRTEn4VrUWFBFMI4YxvNFA
	 AQZRfidxXc4lxuzA2Op2tDXvQKCt3T6wWDCHl+oyv4GMbuJGjPUiaQZLx9xa7hpiEf
	 X3KtSrOjfARHm1ck3oVzJ+eFl5HbUfu6jjlmDN3zlTuLrY0R9lSoRGU63yeZrTHO4u
	 tkVbCZUGCagfA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BA4517E3600;
	Mon, 21 Oct 2024 14:30:21 +0200 (CEST)
Message-ID: <427feed3-f51b-40d1-8609-4534a2815fc1@collabora.com>
Date: Mon, 21 Oct 2024 14:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: mtk-mdp3: cmdq: Remove duplicated
 platforms checks
To: Mohammed Anees <pvmohammedanees2003@gmail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Ricardo Ribalda <ribalda@chromium.org>
References: <20241017201612.2607-1-pvmohammedanees2003@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241017201612.2607-1-pvmohammedanees2003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/24 22:16, Mohammed Anees ha scritto:
> The platform compatibility checks for MT8183 and
> MT8195 in mdp_cmdq_prepare() are redundant as they are
> done in __get_config_offset() itself. Furthermore
> there are two if-else branch in __get_config_offset()
> which have similar conditions and are redundant.
> To address this, remove the check in mdp_cmdq_prepare()
> and combine the two if-else branch into one in
> __get_config_offset().
> 
> Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>

This should've been [PATCH v2], because this *is* a version 2: even if you
have changed the title a bit, it's still "the same" patch ;-)

Next time, please version your patches correctly.

Anyway, apart from this not being declared as v2, this time I'll let you
get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...because the patch is good, and because it's only the first time that I warn
you about this :-)

Keep up the good work!

Cheers,
Angelo

