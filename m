Return-Path: <linux-media+bounces-21399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636B69C87F8
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 11:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8304B2A92E
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 10:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF1D1FAC5A;
	Thu, 14 Nov 2024 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EUbp6U8g"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE30817;
	Thu, 14 Nov 2024 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731579314; cv=none; b=C5C9oilDmYkpEZ4MhD+CTq5+c8/+CtBBhyYObU7hepCovJ6ES+47mpSVMyewTVHU3qOBd8TCJc2heI/Q6JhURu3rF3ExKJvL6wVHf/Q20A18FkvzlqwTWHHDgb2DwmMW+SBECnfkCqPSa3qJqcAEIXG6lsW2CfM8HCZNJCZVZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731579314; c=relaxed/simple;
	bh=BDRlZ1ycBCD+bjuZg/SwSLSTmoyMuj7OjThlUTsmJHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SobKn2JX7d51fXdsaagZLk5mjODDk25qShYysUz8KUa+qa57H7ManMHzhXBFo4ZqRhGBHGfOgYQw7ea2Yqrq3xpCJ5DrRO7rAmO+n4HBm305QZ+fzrtaL2Lg9xyroBCtBlwwIvMNAeoAaR5z2QmVtpMXVRiMrXAT5vWI2OvDTPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EUbp6U8g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731579310;
	bh=BDRlZ1ycBCD+bjuZg/SwSLSTmoyMuj7OjThlUTsmJHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EUbp6U8gYbjbmAz90H6csJSmUy+Ed5NAgHo2qxm/riuc1qY/DZBTR7sRCtDeRM5lc
	 lvdeHFmG49a2LZWUuFUOHzPmVpgm0fyFPiyS/4zrw1R1i+C+e0jYsNMPLwoYx9k5Au
	 wCSwd9dC0/59YxZD/RiTh13wTlzOxuyqZj30XAhK4urUs7efoVrBRc0u1oWUAz/66M
	 73n8y9COblMdMhpFw6IVBGen7o397YqPq+2JC+89P/wKfNNUohBF3r8BR7nYFmsHgy
	 NNDrCfkV0Bx16eMx/iCSt6oU4mSDggga5pdZEVwCBi2YRgC/euiaFtNwvrWqpoM2nK
	 7qWImVMBaJ/1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F6DC17E35D8;
	Thu, 14 Nov 2024 11:15:10 +0100 (CET)
Message-ID: <d67ead02-8502-4d71-bb5d-38b80c103e3d@collabora.com>
Date: Thu, 14 Nov 2024 11:15:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: mediatek: vcodec: add description for vsi
 struct
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241108034019.20064-1-yunfei.dong@mediatek.com>
 <20241108034019.20064-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241108034019.20064-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/11/24 04:40, Yunfei Dong ha scritto:
> If the video shared information (vsi) is changed accidentally,
> will leading to play h264 bitstream fail if the firmware won't
> be changed at the same time. Marking the shared struct with
> "shared interface with firmware".
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


