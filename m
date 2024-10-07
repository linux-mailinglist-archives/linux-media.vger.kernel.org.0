Return-Path: <linux-media+bounces-19151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C695992C37
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 14:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D82B5B25663
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 12:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3DE1D31BB;
	Mon,  7 Oct 2024 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DTCrIOnA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FA31D2785;
	Mon,  7 Oct 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304881; cv=none; b=QWaio821UNZYQ2SIqZ0Jut2hRMQTNlQq3UDY1vlNCbaxG1ZaoMifWdtHV+JeWw1ue2lZPcwzHMm2/gpOR2mQA4SJ5Ox0Xys8qc+AGLmUm34QBn32G1kUWKdTkhXSyS8QD+E3n8d19zWgQRwSxt10cbGJWVa6GaPcNTtBtUTVdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304881; c=relaxed/simple;
	bh=PVq36IESnKw/X3bf3UpaGBcKE2tXoKWFgdQEXARI4bI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fkU47ylPGD7xV28efi6WQpdMFbyxF4qFn83v1tRi6sUjakswrBDOcqBvDB+foh0Mtp1pjCUyTaLPrWBCjkrTJYR4GfxqNQUfcNFSfrC2JJlWpuq6EpKNSDGKfhCfAx7jTNITgpJM44fUnWGeVNW4c7KheWQJtebrU9IxEAId1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DTCrIOnA; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497BPTlL022185;
	Mon, 7 Oct 2024 14:40:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	o5R6EmDj13EYvGXoR7n55gK22/+2Cz7sf7mbsQlwMfU=; b=DTCrIOnAgidUQ5DS
	Fbo49eAV/6/eiy3ChBOXqHakNLQ2oH//W2BrmDUYJCzHzLhRYAPtvVKUPONhDfE2
	rL8nmEHrNoBspUv3f9PdA4is4M3yOI+dDBH9AUhQ/sRxUqml3uYoIKXqc6NA/zbv
	mNK8m7FDHGHtLYcpmn+RJ23FC8silVme9YB3QtPIa5g6em/PMM+1U5Ru42hLy3QN
	AT5u23H6bZArnJY47P0Qy77gKdx4bf+yGfIERe0ZgLuP7clhnnR2BwQHm6JPlVuP
	ddyOIlO/xHPvyUK65XDiF2Aub6bka2DUBDwD3OPazNvqe6nT+0NVnEIdkXXsdAfi
	d10gkQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423gdmdvbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 14:40:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0566F4009A;
	Mon,  7 Oct 2024 14:39:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 041E72764E1;
	Mon,  7 Oct 2024 14:37:11 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 14:37:10 +0200
Message-ID: <c00e8977-ee68-489f-89b1-5ba78bb238df@foss.st.com>
Date: Mon, 7 Oct 2024 14:36:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: vgxy61: Fix an error handling path in
 vgxy61_detect()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Julien Massot
	<julien.massot@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-media@vger.kernel.org>
References: <666ac169157f0af1c2e1d47926b68870cb39d587.1727977974.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <666ac169157f0af1c2e1d47926b68870cb39d587.1727977974.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Christophe,

Thank you for your patch.

On 10/3/24 19:53, Christophe JAILLET wrote:
> If cci_read() fails, 'st' is set to 0 in cci_read(), so we return success,
> instead of the expected error code.
> 
> Fix it and return the expected error.
> 
> Fixes: 9a6d7f2ba2b9 ("media: i2c: st-vgxy61: Convert to CCI register access helpers")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  drivers/media/i2c/vgxy61.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> index 30378e962016..8034e21051be 100644
> --- a/drivers/media/i2c/vgxy61.c
> +++ b/drivers/media/i2c/vgxy61.c
> @@ -1617,7 +1617,7 @@ static int vgxy61_detect(struct vgxy61_dev *sensor)
>  
>  	ret = cci_read(sensor->regmap, VGXY61_REG_NVM, &st, NULL);
>  	if (ret < 0)
> -		return st;
> +		return ret;
>  	if (st != VGXY61_NVM_OK)
>  		dev_warn(&client->dev, "Bad nvm state got %u\n", (u8)st);
>  

-- 
Regards,

Benjamin

