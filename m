Return-Path: <linux-media+bounces-17738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBB396ED7D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3826B1F210C6
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 08:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093D915821D;
	Fri,  6 Sep 2024 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aSU5dIMI";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ceBrJR0Y"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-42.smtp-out.eu-west-1.amazonses.com (a7-42.smtp-out.eu-west-1.amazonses.com [54.240.7.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD76A156641;
	Fri,  6 Sep 2024 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610549; cv=none; b=mpTMowzAtVeNywi8VX+iQtXR71hXSL6Qm92UiOneUZD280Z7aad6+JRIGi7NxkQW/Vg6ZMDZ+c8smCKSvqTDuHEkN3un0nsrpyI9jp5zZmuamjOkzJZEjQgbLw3M97G1O/rH119Yfj5ET+yX1wKhIg6OScil2QbmP8x6SGsxWY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610549; c=relaxed/simple;
	bh=yM3jGEYrmpmAPT0rz7opuwruNthFWSkw9+TDL4YVBDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pn86XR+4rK7E7JMODghLTV1AA2ZrvPD61HVjnuSXFlhPVG+VsUvoNMsrDbMein0kC0kX7OIZNMrfas2RVM2TEMqbRZhcD2CPqQYJHq1Muwyc4eCz3zN9Syls5EoVRAnym0LxAQLoTQZnQDTDhxhzUSZOxNZTiAlrXnumQpWxgDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aSU5dIMI; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=ceBrJR0Y; arc=none smtp.client-ip=54.240.7.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610545;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yM3jGEYrmpmAPT0rz7opuwruNthFWSkw9+TDL4YVBDA=;
	b=aSU5dIMIVZa+cVJ8YC9WRBz0bUv9ZRkWK5nvrqULiski3hj0PrU0tO8GE0DE5tDo
	tJYkolI1oPcFUfhre3qb8194/JecXFEhraqDF6BGAvjeLDCEN5BkjskujGkw787lkOT
	JhRTqG+8JEPJbuXqi8WS0M4KPo3oeYmR2FNm7ITIAyt6v/4rjAtGbEMhA3nF/r/aSvi
	cvJF3ozvVIhef+8lnEZd7mQykkA6R5favg/l1EJL46lVMIoLa/YccaPcYzHbhSY3ncG
	Si6+iKezpPy5tKLOBX5ZsfXB8Y29Xx+BGuNwtu2ZKwyN4h72SZWyU5Lu12NHxsRBeNj
	qmH0hFNeMQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610545;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=yM3jGEYrmpmAPT0rz7opuwruNthFWSkw9+TDL4YVBDA=;
	b=ceBrJR0YS4QJudMIU1bumx8QW4TjyLwKO/B5IlDefuyExI/7A3gSeecXmcnWI0xG
	IIa1I1+32mFPri3a5FyfqIv201Os4uSGsCSfe0+dXcZR3SV4XhjNg8yiKis28mT1GrA
	LNjnn7XFJjm6ktDTZhX3qWys+vrNabuz4qn9mLEc=
Message-ID: <01020191c6674f69-5391f772-bfad-44bd-884e-c3ce732c19b5-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:15:45 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Moudy Ho <moudy.ho@mediatek.com>, 
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-3-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-3-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.42

Il 01/09/24 16:32, Chun-Kuang Hu ha scritto:
> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
> instead of implementing mdp3 version.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


