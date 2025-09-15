Return-Path: <linux-media+bounces-42548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 280ACB576C1
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 12:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C76CE1A23969
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 10:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED51D2FE58A;
	Mon, 15 Sep 2025 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JgIIq6Pd"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4812FE042;
	Mon, 15 Sep 2025 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932809; cv=none; b=Qs5NwZ4f3wi+8RGhAye0KltXKn9Tr4Ewzp0dsqTBrC0pvvaZCHaurkpiYhQ2Vo2XqxaNNzXV90izTfH6avV7DPveqxLgbNomLE7y7xiTJ9/5z/qGrqtc6RbG8BTDxD6xT7YHL+JN+6Vu19j5F+PKwgBVHrNuj5CibyUigzV6pIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932809; c=relaxed/simple;
	bh=UP6Mcdhgx9h/IiABxHuPAIji2/BSzer460KD9eI9Zo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCWDypHA5yrGQAn7O0AaYxlf3JwnGe4a0tbc7fSSbkD/jnrt2YnYwxstZaatQgW+cXNTXYf1NfHsfO7rNI2tOVt+iU92o3c4/IzmecHQMgBXHHUnt6lWBGfUlyKfu6Y6x+AjH4LtLliXF9XunUrk/L6XBV0UOhOH5LPHvC/GP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JgIIq6Pd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932805;
	bh=UP6Mcdhgx9h/IiABxHuPAIji2/BSzer460KD9eI9Zo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgIIq6PdT6WWIYPlXeQFRwP4gji6X+PXRqtG36ww3ZG3Ewns/kcAYNvzNs/e+WZXf
	 bPVg5NU8c1rztgcEITUVepGht6FY0ZDIRc42DuIpVXxOA0Ab/1bYaL7L89HLkHfW8s
	 8UXql401+GVugnasScsJViG+DvE6H1eSBEGsIOsvsZiko0SKSMxIIqYF1TzU9L3aQF
	 YY6/349fUy4OiRBpbHFNU0hgMQJD7qjiq2BVViRjeroyz2p/p4GIArDdB37n/RxLoQ
	 TTAHHda0tPTYYc0PqnZh746qJ5K3ScW41MKLG4KVYyBgcNvmyqJBv+J5bGgB4g2Dc1
	 qI5qIRFGFYfuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1794417E137B;
	Mon, 15 Sep 2025 12:40:05 +0200 (CEST)
Message-ID: <31ce8038-51f6-4e63-b277-b19c79de38fa@collabora.com>
Date: Mon, 15 Sep 2025 12:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] media: mediatek: vcodec: add profile and level
 supporting for MT8189
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> add profile and level supporting for H264 and vp9 of MT8189
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



