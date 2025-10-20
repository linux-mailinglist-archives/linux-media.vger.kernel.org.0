Return-Path: <linux-media+bounces-45014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ABEBF0650
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B82ED34B181
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BAA2F744D;
	Mon, 20 Oct 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JFlNh8PF"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870B23D7D4;
	Mon, 20 Oct 2025 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954672; cv=none; b=scvGmqOenCXYquLciprr4+AsYe5e13ualVjc2iVO+hXYwpbo2kBSXFnYofqiejrGANGprDGOpd25bgg6sDcNT6AEpkTyYcCEYQm22qWWYKIReyCjIsfZKNC8EoKH8bdm3FN/aLbScVkUWlrrApuvEgBQUE+TbVxQcnVoEb91rI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954672; c=relaxed/simple;
	bh=HAo0u9lj8gh67AIZa7MpgeL6X721kh0HCt2UfsjSGtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ccztk9FPHj8ILnkqCJ/dAPa3kLu4jpMOM3YpzWT0wr9C/4GB6bq0FEYF9VdFLdCl4DLqpkcR1mQlSI6da6WtIFyhXPrDrmXR5iQIVhpnf+O43TzFc8iQ5sU47mNgiLPhZcc4CB4r1RkrGijDS0zYYdoqAmqXu3+otXocqTm+0Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JFlNh8PF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954667;
	bh=HAo0u9lj8gh67AIZa7MpgeL6X721kh0HCt2UfsjSGtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JFlNh8PF9j5E+7YvKhHPr9LB4/23lSOser7ah7FVnzBtfmA/J/VYtmvGVfsWZSffi
	 NmCzTJgHFbxrEPAXJOWwPInsP+bNsJ3kiRQQc1FSI9pR0InRGryeQQWBmziZWj8iAl
	 juTJuqv6ZmiIgP801q25W6eJTE0SAkk7HGtaN+K3gHeCcLsdXA99qEHuOrZmIz9D+5
	 WTVDx+4GHklfMRHSdoTqaTixCtt8/XfrParHHjjWSvWH+uBiF3EGQs4lLHVTmDb851
	 /31UmKpofsFQrAXgJE/zFVBi8oU2TLJ7GY6HndUrd2NLkDutvqjgPakGjI242clXr6
	 XGqyXvP/ltA+w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C7B417E1278;
	Mon, 20 Oct 2025 12:04:26 +0200 (CEST)
Message-ID: <abed2954-8a0e-4b8e-af44-f0b0d9764527@collabora.com>
Date: Mon, 20 Oct 2025 12:04:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/20] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump()
 and cmdq_pkt_jump_rel_temp()
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
 <20251017065028.1676930-19-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-19-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Since all users have migrated to the new cmdq_pkt_jump* APIs without
> shift_pa, the wrapper APIs cmdq_pkt_jump() and cmdq_pkt_jump_rel_temp()
> can be removed.
> 
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



