Return-Path: <linux-media+bounces-42666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D936B7C3AA
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 13:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 003A7464356
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 11:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03DF3728B1;
	Wed, 17 Sep 2025 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DJ7Oc3+Q"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8778D1E32B9;
	Wed, 17 Sep 2025 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110156; cv=none; b=Zsh93UD4G+T3Kwhwm0L4n11viwaR0neryQhFkRCeqPZSU/oaMaco95AXbF5abQa+e/RFskqsQznqt/nO7Kb1hh38NECJhohH0mF5WupxbIZWU2Bb2dUSPJ7yi9VbxWB71bVitdABzLVBFcTjjYDgCBk0tLfBUFoUExXvxJ++SY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110156; c=relaxed/simple;
	bh=DmgiD4DEdrbQnNYGlnmAnbNpRT8lQoVsqzh1+ujAqaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMZB/1mCbwhXmKs4t/F8G3GyixyOip18yNdyqtz/q+jKrvuPPFi0arlwkXcLHCgmzZugsabbcDDpBXWOXH0+AoAjuPIZOaTTxyUeZWWqDHp6R+taVJN+T2qjOdrvTNMkrnudjoK6Kp6jvrPIAL6FVPagADnRfqBcr5OiezJ+0qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DJ7Oc3+Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758110152;
	bh=DmgiD4DEdrbQnNYGlnmAnbNpRT8lQoVsqzh1+ujAqaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DJ7Oc3+QEPhXBokQuv4YarUEQ2kkHTmOxbTbYeYB3IXrpK/llD0H0Pc4bjcPjeWuY
	 lvsrZ1OLINCOiQVOn5xW3rtmyjqmX+V1SE3qq9OoZKx7TGw4KnYAX7MfvWKrJULRwe
	 gIusMp4O6ezKqvEe0f5UFrUV71okOLgZXn8JHQ/OITzHj6iTZpQfdtxCnbDpDM3PN9
	 lZoN0ZXCyGdaJTCrvu3HFfKTOjgXcxeGJJKJos7gRFV+yahs+byA5fJxeyFo2VGQaN
	 CAM7DqjV9u5eE1L3h1Q8AKdRCd6FU+GOU8enAD4xyb8QOwL1nqvXU6mn1Qan4btO/Z
	 qSOCBnfjtv/uA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3382F17E0DC2;
	Wed, 17 Sep 2025 13:55:52 +0200 (CEST)
Message-ID: <2bfaa40f-6391-4fdb-8fa5-1cb783c58616@collabora.com>
Date: Wed, 17 Sep 2025 13:55:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: vcodec: Fix a reference leak in
 mtk_vcodec_fw_vpu_init()
To: Haoxiang Li <haoxiang_li2024@163.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, hverkuil@kernel.org, tzungbi@kernel.org,
 jiasheng@iscas.ac.cn
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20250915120938.177691-1-haoxiang_li2024@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915120938.177691-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/09/25 14:09, Haoxiang Li ha scritto:
> vpu_get_plat_device() increases the reference count of the returned
> platform device. However, when devm_kzalloc() fails, the reference
> is not released, causing a reference leak.
> 
> Fix this by calling put_device() on fw_pdev->dev before returning
> on the error path.
> 
> Fixes: e25a89f743b1 ("media: mtk-vcodec: potential dereference of null pointer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



