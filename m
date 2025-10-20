Return-Path: <linux-media+bounces-45012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B482BF066B
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF7723E4AC3
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1AB2F5A0B;
	Mon, 20 Oct 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CH+UctTt"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F823C8A0;
	Mon, 20 Oct 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954668; cv=none; b=mnPX0aOE9wXaqHINpl/LuPLAa3ujaHolb9H1455dkbsjwP9+yV9tD/4SWgXH0g4W4JM/9DZ564Uhu+ToppSHDN/ygzRKNy1W582U0GP0WDSb/34hLziwPYVVkhzvp6nabLIsgwW2gUxtpggWHFP5lgSwQzU+Kc7wr63n2ZtuUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954668; c=relaxed/simple;
	bh=TSQ1O9TZH171lduwyZFqhbsEFJNX+R5Wl3LdaC6jVCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUhg6GyNPnhIANZIZzx/V0ircrUGmsvTTD+1+sD8gFAgtJmB+R/rNwW7hH+tFkFpRKHx5PjLGEvXo9cXjqhESVKaxWfUxEiIdB1/bfuWNZnxafw6Hwy5Ztz/6WCTP5TdXT3sN/rtqLI1pk9X0WLD+IUDS9C/zZctUOZmED7IwRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CH+UctTt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954664;
	bh=TSQ1O9TZH171lduwyZFqhbsEFJNX+R5Wl3LdaC6jVCE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CH+UctTt8HvyE/iPs6B/wGaSmV4/fgQZ4QkTgks/VTHtuBBPk+tVHooYo76AcmAdb
	 V9wSrjW9FgMJyDWox87nRVHyubDveOY9L8kCbIjJUBDVLeCh3cfDTICNLI7UJp5wsq
	 unGhjv0feF4HdEbbqc42yXzCpqV+ji3+35iHmt1CFXGaiKLGWcWvZ/6TX+6OZFfyq+
	 AZ5rRnYnyPy4m7rO1zH4swC8lpknvbEkcppJbRAKA7Hyv115r9rbu2juj4c6NLEBWb
	 DdgyuFkGqCnM3RZWRjtWHenDZf5va9VcQVQfr4kJDKrubxZayasHCsAXj/MnLyc5yJ
	 1tFBhyUqhoiUA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4CCEF17E0FAD;
	Mon, 20 Oct 2025 12:04:23 +0200 (CEST)
Message-ID: <8adbea9e-998a-4da8-9388-7adc4102c572@collabora.com>
Date: Mon, 20 Oct 2025 12:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/20] mailbox: mtk-cmdq: Remove unsued
 cmdq_get_shift_pa()
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-21-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-21-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Since the mailbox driver data can be obtained using cmdq_get_mbox_priv()
> and all CMDQ users have transitioned to cmdq_get_mbox_priv(),
> cmdq_get_shift_pa() can be removed.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



