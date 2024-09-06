Return-Path: <linux-media+bounces-17737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A1796ED7B
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 709231C23C1A
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 08:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D6215820E;
	Fri,  6 Sep 2024 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kUFFKTHH";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="H4SOWUe8"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-32.smtp-out.eu-west-1.amazonses.com (a7-32.smtp-out.eu-west-1.amazonses.com [54.240.7.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BDEC2FD;
	Fri,  6 Sep 2024 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610549; cv=none; b=Tf3l8/bRv+gb5+9ZK92UYontQPghI/4maKtdJSwrmFIsiDi2DB9cRq4UYix7URS/A/80qa+zjfJbbzIWai0vEkK/FphK5m2MpEYu/YzLrYQPqIhL9mkXL5H2NONi7vpKknGYR4UQVfmdW62EKebK0OtnacTT42one4gop3bS2OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610549; c=relaxed/simple;
	bh=c6Ae/CSZxtzebGJwopcs50GFm8MBKWaLfuixS2uzqMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fPfZuWPtcCEnHxH1YGpocKGx+KewQQiQpB+DcgtWlW0iYRaYX8NsX+yT6plaYLPto7brFZoeqP6cVRtmusvfK41nHDNK8grLURjsV6Mc6CyjUQAeWeBGaQqMRrkXQQBVhBlkTcWjQGGDn50+C9WShD4ISRUd/1wquSE1ur/68Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kUFFKTHH; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=H4SOWUe8; arc=none smtp.client-ip=54.240.7.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610546;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=c6Ae/CSZxtzebGJwopcs50GFm8MBKWaLfuixS2uzqMg=;
	b=kUFFKTHHBd/JqEo+8xtUNUiXSTdiKf1TVC21fUrLGXz912Wp7bTIpwt3o4aMlXN7
	eI3CaYLsoOg0sn7ECQkYLryyqyiJ0F9BcBkYN9pY+h6XjciEqvZyH0rZOQT0Pa9xNFS
	rQZr1+to56I7wILAZJVVJX6XoMuWG7BGi+PHigEaEiRgrDL2+8fy/vKhnILqcqVL+2w
	GtYhzrQx/PBCEeo1FD0egxIPrwO0HzCGidQ7wZX9cCtrpj8BO/30HOdwWCnD/f7hTye
	DPktdonfuIBZMxKbFA4FVradAcr4E5HntroxWs4MyQMW9U5idKwodeFciA6NgU6+lkQ
	BnQcE/7qBQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610546;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=c6Ae/CSZxtzebGJwopcs50GFm8MBKWaLfuixS2uzqMg=;
	b=H4SOWUe8qRqlOzVrsykccb12OFxX8XUYslSv0/QIq/FiNVwLK30PLKhfdFgt3dvK
	+urQXrGjVP06HCGzU6GfFJdzx9fq00WBGMXlDBw3SkeDpjwfp4ZIeYy/CHU8P8rTSw4
	UtVp/4Ay+RHL0tncUd+2RL8kzP4rR+8EVhf59Vjk=
Message-ID: <01020191c667530a-66e8f4db-1b0e-46d3-a69b-3362e84e0f02-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:15:45 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: platform: mtk-mdp3: Get fine-grain control
 of cmdq_pkt_finalize()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Moudy Ho <moudy.ho@mediatek.com>, 
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-2-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-2-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.32

Il 01/09/24 16:32, Chun-Kuang Hu ha scritto:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



