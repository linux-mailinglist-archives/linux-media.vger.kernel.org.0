Return-Path: <linux-media+bounces-23412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA519F1D2A
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 08:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8EB0188C53B
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 07:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9331547C3;
	Sat, 14 Dec 2024 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="QpuiJHrb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF25C96;
	Sat, 14 Dec 2024 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734161772; cv=none; b=SZETfEF1CguVw8T6d8kdkSALmKGkXykoE4LoHyTo+fTtALFbMUm6fb8pcPL+ykzK1MpmRSdAPWmGtF7HcAa2yfhGOj0Q4c7RNCoVmRg2+Wn1mxbcbVQMA6/3LBDE7Jc7wH3mVrg4CRqycv/XZwJ3t1b6VJys0khQb2bhKsy9iGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734161772; c=relaxed/simple;
	bh=s4AaOkNf+azlZfY20gPtbTuxvigBYFvV3nZ0qN+A1Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDqZWfhgDruDsZTUhcnzM/wRUuwOPpCc+f57kLXf10DIIIYtdJti3f0xKhjjQbwX0GU6Xr9ORGK/poPSiS0YXl07gghaEnNtEzo4Sz4lBrrOJqngDFzpjV2smqQf1xIbIXyIVFZL5bCBh6ayCk5psyg0oeWjZS4c02WnPzw80GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=QpuiJHrb; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id MMgutgiMRSfR7MMgutfZSo; Sat, 14 Dec 2024 08:36:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1734161760;
	bh=b8MTIP4Nj/h0lmCHczqgV9eXb5rzDar0tQOnnZLEPD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=QpuiJHrbm4cQcNg5DuB5EK27j9FMr/gU33YVbR413JEXUPpigGrZUw1MTyxFMk3Oy
	 Wyzwa8uU5c6tw0e3NCNIEnUUUJWWPXTIVYKNABfMeDSSMBJc1F04BM8daVd5QlIxwq
	 izW49Q93zCIeGgaCv1DAFqE/Om1G4XV6Nq22uCIh1K7J95rPMfyKti4UjBAcy5hOwk
	 08u0xuvenPHwQ7gniCpSAajh1rFXzWK4b6vYJ8jrvr172VZujPIhhUAW3g6RQd1vvq
	 zA4o8AGtFYLsBEdvo2+h3O9LF4jdcWMleyTkC7TtL0aSZfIdUoDftJSjhRMKmDpBFQ
	 pptvVbCDy3Ngw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 14 Dec 2024 08:36:00 +0100
X-ME-IP: 90.11.132.44
Message-ID: <95f87650-ac38-4477-9bad-1b4f098c4072@wanadoo.fr>
Date: Sat, 14 Dec 2024 08:35:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] media: chips-media: wave5: Avoid race condition
 for interrupt handling
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com,
 nicolas.dufresne@collabora.com, bob.beckett@collabora.com,
 dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl,
 nas.chung@chipsnmedia.com
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
 <20241209053654.52-3-jackson.lee@chipsnmedia.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241209053654.52-3-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/12/2024 à 06:36, Jackson.lee a écrit :
> In case of multi instance, interrupts can occurr for other instances as

If the serie is resent:

s/occurr/occur/

> soon as interrupt is cleared. If driver reads the instance_info after
> clearing the interrupt, it is not guaranteed that the instance_info is
> valid for the current interrupt.
> 
> Read the instance_info register for each interrupt before clearing the
> interrupt.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>   drivers/media/platform/chips-media/wave5/wave5-vpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> index 6b294a2d6717..63a607d10433 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -55,12 +55,12 @@ static void wave5_vpu_handle_irq(void *dev_id)
>   	struct vpu_device *dev = dev_id;
>   
>   	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
> +	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
> +	cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
>   	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
>   	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
>   
>   	list_for_each_entry(inst, &dev->instances, list) {
> -		seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
> -		cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
>   
>   		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
>   		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {


