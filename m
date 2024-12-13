Return-Path: <linux-media+bounces-23398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C89F15E9
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 20:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 693F716A9E7
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 19:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11771EBA02;
	Fri, 13 Dec 2024 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SiXy2iQh"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357571E0B75;
	Fri, 13 Dec 2024 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734118465; cv=none; b=dATa1cGHOUGqrHm30Exu8aENybseMISRDY2+GMWJnC2wLGrP3U4Blrvbt6o/126l9+hvgZ5wR/iBnnyucUfJ6nSbolPBemdIs9W3z+40D2hnslucRYHaiu+asKlSdDMiXs+0Cvm6ANjggeuoY7sJZkdDE/AsCXelIKefGXiTil8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734118465; c=relaxed/simple;
	bh=WiLw78Fu2MfdYXFWvpfnuLS6ygLLJwiG366txN7q1GI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UAvNcKNYyseIx5DnFt7xmUgBqSAooPFoOCOPEETX5t0H6FIOLUAgwe8EnILLX+3t4B5aHp1j+eZbV+AQQ+iOa8wy3XfaB6hmgifJxH2xYMUdkHBtzEEZVhGXAyMIKawHajsaavL3zNNvqVJsAc/YYoe99BpbHQQNgKeE7W089/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SiXy2iQh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734118461;
	bh=WiLw78Fu2MfdYXFWvpfnuLS6ygLLJwiG366txN7q1GI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SiXy2iQh7fbVutVuDZxfiiyvsEjTDHyiZSY7kzwGfSs4bNLVgoZU2DyJxMXQOFcmG
	 pYiZHhSDqN3e1unCuWSiR7SNzj8AWthH8EeYskZX05kOxosn5bxBTVugh5qDHpI7aq
	 VPUUUzkxs3IEA3vmhi6UlaX31LgqOaCmNP0+fDOfN+lSN64L6NVu6nJD/faU1hXC1v
	 sd05tmf/o1WfGkx9UQAgj1iWiPttMbpW7hZ2J9mTKbdB98tSM4PEf6D4Id0tyJRtXt
	 bm2hCW53mkvbzZ8W1+awsxvcuuO/DFdnFRerVjN62EPzO+6g7pMUi55AT2iZj9+czT
	 A4f0U2NUSSrWQ==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7250317E37EB;
	Fri, 13 Dec 2024 20:34:19 +0100 (CET)
Message-ID: <e8f00be35f9859b5112793a42fe13191eef050cd.camel@collabora.com>
Subject: Re: [PATCH v1 1/5] media: chips-media: wave5: Fix to display gray
 color on screen
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 13 Dec 2024 14:34:17 -0500
In-Reply-To: <20241209053654.52-2-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
	 <20241209053654.52-2-jackson.lee@chipsnmedia.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 09 décembre 2024 à 14:36 +0900, Jackson.lee a écrit :
> When a decoder instance is created, W5_CMD_ERR_CONCEAL register should be
> initialized to 0. If not set to 0, gray color can occasionally be displayed
> on screen while decoding.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/chips-media/wave5/wave5-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> index c8a905994109..d94cf84c3ee5 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -585,7 +585,7 @@ int wave5_vpu_build_up_dec_param(struct vpu_instance *inst,
>  		vpu_write_reg(inst->dev, W5_CMD_NUM_CQ_DEPTH_M1,
>  			      WAVE521_COMMAND_QUEUE_DEPTH - 1);
>  	}
> -
> +	vpu_write_reg(inst->dev, W5_CMD_ERR_CONCEAL, 0);
>  	ret = send_firmware_command(inst, W5_CREATE_INSTANCE, true, NULL, NULL);
>  	if (ret) {
>  		wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);


