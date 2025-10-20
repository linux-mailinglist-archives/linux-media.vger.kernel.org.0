Return-Path: <linux-media+bounces-45020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383CBF0684
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23D7918847C6
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68322FB637;
	Mon, 20 Oct 2025 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kU21S4tL"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976222FB092;
	Mon, 20 Oct 2025 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954683; cv=none; b=QROpHcoQ+P0YHQ12iWkdxqUuwkVcq+/OMsiCAPOlEbelEQpJeWUuwAE9Rxk5iTzPhnoD00ghtk27bQiCd53yRSJTfUSRlsXo+Ikpqe/dfIvUA1ftTHmVhzPC7JuVgSr5Bx3kaou8ByQOmnrcpKUtGUudm2FTDu0Q8cQZIK5kbU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954683; c=relaxed/simple;
	bh=LemVXctvae+74luWmuzpmpLlI7eUe5tI3CrLuksCccA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQPt3mxrRIK7cz9Mp5oVEuU/LJJg6SjXnGaCc1JCPJXRbbVAmk83JNnA2//7v4KR448KfQ0vzzAov4Yyw6he7ROjCXij59dbIHTIX7Rc9yJqJi1zZHai8EunkMa7qGn2jExD8yiogJAAgtbUubTc2ooUskDU/8PPrFoxO2vkZWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kU21S4tL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954680;
	bh=LemVXctvae+74luWmuzpmpLlI7eUe5tI3CrLuksCccA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kU21S4tLVJoq2/DVWFB4W4qUPhpmUJj6xfUGAniqDZ8p+j1ZKl4uDfGuU6pU1DPxa
	 qkjIWZQeGS6KQmeSZcyI2/aOBzQs9ncrA5rXUQmik0EMQAGuylme1T/Q+jvyRiOSxd
	 dLJBNRurrOH8rUct14t8hzMm97GsfE46qQi67Sx8+ccpEMwKxgOMGqXdomEabFYAv0
	 /ESc4H4PIplRZ+kfSZ7Nm4olrLMkX7STVREMXRUYdphIowPQQuxa6G0wq158qVY9cO
	 oIyB7UmCf3TyVdVJIs/ck4D2Tvpl4rHD/I/t62ZCnl9QG4NrvzdEEbz7s5jenEWjV3
	 pgAeQ368TPxfQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5242117E108C;
	Mon, 20 Oct 2025 12:04:39 +0200 (CEST)
Message-ID: <a44bf667-316b-4e20-81ce-41902d68ba1b@collabora.com>
Date: Mon, 20 Oct 2025 12:04:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/20] drm/mediatek:Use reg_write function pointer for
 subsys ID compatibility
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
 <20251017065028.1676930-14-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-14-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Switch to reg_write and reg_write_mask function pointers for register
> access, enabling compatibility with platforms regardless of subsys ID
> support.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



