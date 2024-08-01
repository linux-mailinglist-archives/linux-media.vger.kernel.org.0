Return-Path: <linux-media+bounces-15678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A37A944645
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 10:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 157152824B0
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 08:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB12116DEDB;
	Thu,  1 Aug 2024 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ndZqa7aB"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E3316D4DC;
	Thu,  1 Aug 2024 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500085; cv=none; b=rDsJM38p/5hHxNvI0K5rYtS41qT3f24dCUvWJC0OyKd2wdPa6axyv/G0PpUZC6bkO5hbQhRDJqaHvIObt7vLUjMfqTBqmEx+eacwYY6GnndQE1Dx9PaQJ+SVs1+5wb2v33QdqZQoXz9YuzS3zqWV2JksyE4QKfPJp8RO52dafIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500085; c=relaxed/simple;
	bh=UifA/xUfuBeMroDvmUo6h0V3Cmjxc25gWtbwKwbHEhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXjwLnDXqIDC0kdEtEZkfiEv9whpdrKRgQee6mTIfeiNustBDW4b+IMQHBAY3SB7i7ei5S6X9xGml+dAPtoUWIYGR+pCZjJ0PhyBXXFqqzCrtlV1zaQg/4YYiHvBa50QqtuU19Kx4I7AU8Zvz70lgp8nKP7ecoyKNUKAvKfX25Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ndZqa7aB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500081;
	bh=UifA/xUfuBeMroDvmUo6h0V3Cmjxc25gWtbwKwbHEhE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ndZqa7aBvgclabACijMRdZqSfK9fa0KW0pMSVN6ezMa8u+ODZT3GFE90p8+wKZbfC
	 3mTtbYYhN0UNWaJYbIxUml7wdLvw62JPgzuG+vw+uMXRWodM6QTa/xF+y8yup4Tpgr
	 7DB8XWYOBwP6xu0jL71SJk2QyUqzft9RuV2ltzMVFnWXYj7rMBh/L4pavDSzXvi1yo
	 gnhWqgWGAWmWbIlcvsDMM8TvvDWapaUj7ShJnyTdWDhhVX0LCPtHpblsPz0OdGZCzd
	 GziXDabKX+Ed4PkbsuM1YMaMz6YVI5KivC+qCL8cmXUx96sU1b9kppQJECwAjBcrAv
	 cr/n4W0mT1pMA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A283D3782209;
	Thu,  1 Aug 2024 08:14:40 +0000 (UTC)
Message-ID: <607b2b34-cc3e-4f75-8a2f-4a0990afc758@collabora.com>
Date: Thu, 1 Aug 2024 10:14:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: mediatek: vcodec: fix h264 multi statless
 decoder smatch warning
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240613093357.583-1-yunfei.dong@mediatek.com>
 <20240613093357.583-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613093357.583-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/06/24 11:33, Yunfei Dong ha scritto:
> Fix smatch static checker warning for vdec_h264_req_multi_if.c.
> Leading to kernel crash when fb is NULL.
> 
> Fixes: 397edc703a10 ("media: mediatek: vcodec: add h264 decoder")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


