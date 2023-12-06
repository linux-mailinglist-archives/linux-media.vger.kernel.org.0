Return-Path: <linux-media+bounces-1738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1882806BC4
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 11:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F291F21761
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 10:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8F32D7B7;
	Wed,  6 Dec 2023 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m67S4TBW"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6888E112;
	Wed,  6 Dec 2023 02:19:39 -0800 (PST)
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 63DB66607337;
	Wed,  6 Dec 2023 10:19:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701857978;
	bh=mjgfItsOqP4PFb5uiNh38eRZZOSIpCl5Be6d6JwRK6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m67S4TBWJGoCE++hlGeXKmjI45cRDdU9lm8iaqdR7ahzfLo6OT6U3LO6cRR9S6bih
	 uCj5BNEvpF3OYNQG3mKAhV3VX09ryyOUFrG8UjOiqK7CCx630PMfCj56NcCJc9zrzQ
	 LBjEthQUPbth6qLOBk2nQEQqt7H0nA4L688Jrvbam9J0HJZ3uAFa4ebvA9qPAZmbCY
	 3Aluv2rA2Cv199JeYQEg9VW/scxbheo+pDRmgjZ4P2SQW4FV7V4EWLCdqgK3g16pjZ
	 fTpdvPTr6AOr0Z0VoaZGSe0qeF4WIl3McFNXT6CJnTE+93DtnZ4Mi/fQMaWpDBDPIl
	 GULkbwqENveWg==
Message-ID: <3528639f-85a3-4756-b04b-c233f6c84276@collabora.com>
Date: Wed, 6 Dec 2023 11:19:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: Drop unnecessary variable
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231113123049.4117280-1-fshao@chromium.org>
 <20231113123049.4117280-3-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231113123049.4117280-3-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/11/23 13:26, Fei Shao ha scritto:
> It's unclear why only mem->size has local copies without particular
> usage in mtk_vcodec_mem_alloc() and mtk_vcodec_mem_free(), and they
> seem removable.
> 
> Drop them to make the code visually consistent, and update printk format
> identifier accordingly.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

That's probably just about personal preferences, as mem->size is not expected
to change during the flow of those functions.

That said, as much as you, I prefer not having this local copy as it's using
(a very small amount of) memory for no real reason anyway, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



