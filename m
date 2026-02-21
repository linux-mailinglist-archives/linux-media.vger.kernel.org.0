Return-Path: <linux-media+bounces-53142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIaPCe7TmWnWWwMAu9opvQ
	(envelope-from <linux-media+bounces-53142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 16:49:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA816D334
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 16:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 785D43005337
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 15:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCB324113C;
	Sat, 21 Feb 2026 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbY0ZSgp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759E723E33D
	for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771688935; cv=none; b=pYwR8Q+veEl5lvfine3aWTFUMl/UKTH+F8CawH20Pu8JAMTe5phkrMLpUXI5kG4EVXfGPjukWDyY+0/ZEdJMP4WSdWGf87vuEmkbWgr/g2l0bSEykO3Zglc6XnMYWgvKtFsZT0bcaQxFgkt2TnBejTnZ05K2lVy9mWeatkyqLoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771688935; c=relaxed/simple;
	bh=vnWocnvA63846HhlJZBx/CXiQhYAUPkA5tMPc5pYk7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFxUIfLJmaoaub72Ohm6IR8mck+AzqOYxkMOnbvOJrOjAe2u0dxiZwwV7+UCiQMEv6+zUnqNytGozIUCQSb/V3LYYao+hTT6Osks0UaX3VWHoVUF7ojLvaSQGX18F+oxp1EKxXSDZRJtJ3XQ3SL5RbeII6lLLuhQyWX58e4J7Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbY0ZSgp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e5ea93a1aso2487199e87.1
        for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771688933; x=1772293733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3y8AY1kiJvcmmu3B0A7ELwunkTenPNVCvL6Mw4W/3A=;
        b=BbY0ZSgpPVkFJLay3Ro6p/VnVN55WjlGMcItiFSWwIOZV+19lycXco82PrVsGH+8z6
         K/ImrsA14QrlLiVNI8gOxyCaqu9PdYgHoYbKf8QKgh5DTlgAK8DRqZRdC3NmoQb6bbFj
         bN2l4AIYWwhfSF3H4IKHL2Ad2+TwdmsndpDbIdG4ZbRk3ImftkrbgOVDctpJY4Pny5zp
         4m234IUHrLxfHqD/7r4gbKyNmoB4ZLzz88OyWF1hXIjUzqXEGdnYsdaEipVV00Qp5msI
         rhMrF3R2Ort9OUXYhaUGaAfzKEPSPF6/1ptXga6L8JhG8dMHKc2KvydLoqe9WntndrZD
         taTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771688933; x=1772293733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3y8AY1kiJvcmmu3B0A7ELwunkTenPNVCvL6Mw4W/3A=;
        b=e+BVEmN7AiIqwhUUIgh4Oj5uX7WJU876xVdhxUz3aIlGpjhMBV55bsuku6dWW4xZ+v
         Je04bcQWkEojXhd21KJWhQ1LubMEZQIUCSZwyYZ7m1pgSM7bXS2tJd1dXV7Rd0JKc9u2
         lMsbiquT4M9lcxIIGJzOZH1c8OrJ17j2Jojkg0FOAX6rsn3xnGvEqKKtCWylV9WIJnc1
         EwcwLYBXQTO93RSz597CaxMmYzkEV58nAw4mdlwRsSjpHT+7pWh/r8JoF70MeVQ6jCsw
         GCD3DRMEHX2RDns+HCcnQ5sJBNdIvz6xgH9kYZoVQfDEpl1tuE+DV3tw0sdUBsA8oP9F
         wm8g==
X-Forwarded-Encrypted: i=1; AJvYcCUiQ+4CzC829xB7GO8B/EKA8zlRxPKVbVuxq2pqg8Jn2uOgGgISRbgjGrtKuf+d2NTPa2ITEtc+3xLgmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lb7TNPppBP/2zlQl2eJtbH/nUUrOTnezmg9LgGcrbmoix2yF
	mF5zMfxjla0xbAl9hnwAdNdzxM5HUKeAjoveV9gmg+f11OdB17MCr5H4
X-Gm-Gg: AZuq6aIjzWHEGHwky171RSFr/121r0gwHHCggwKQ1NehiWauaJmTAthzudp4hpVGVgr
	v3gZKp1aVJ0VLBlsF4UaMqKWuBfEzXAbrHRgOQSgYtMQNua6SjnraOhxSvDQkonWrbd84+rZkO9
	2cJfKykIezM1yhp2A12ejIpdIUbUo+673ggSnaglhukSgYoNKI6JTTDEEM6zfw5e3ZLUEIO5oxe
	JcjWOTSejXj7oF3O2BLbt0KsEhAVH8qdzDXagAHNhEBQhyhYY1ehESr4AqRPImhN8CnVBRHGqdX
	JiAjrFekyodgiolUmbvM/b22+zt4piYW8L1aUzJBnDSm+YSI8zP3xR2NrDzq32dc/wrtuI/cfJm
	JRx8ARXFMUfgaIqgvUV4W+sc11YvYuaNawPpV5pb9nAHp4AM3OYo3NQG/i/l7Lyu1bKabZVTBna
	TPmSsiwkyXJNjQeSDm9AS7BIEETLhJyHqBxuc=
X-Received: by 2002:a05:6512:b8e:b0:59d:e774:db0e with SMTP id 2adb3069b0e04-5a0ed8a4d1fmr1017779e87.23.1771688932356;
        Sat, 21 Feb 2026 07:48:52 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b989sm515119e87.11.2026.02.21.07.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 07:48:49 -0800 (PST)
Message-ID: <f5980192-a878-47ed-9b38-8607fb7abdc2@gmail.com>
Date: Sat, 21 Feb 2026 16:48:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: v4l2-flash: Enter LED off state after file
 handle closed
To: cy_huang@richtek.com, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bryan Wu <cooloney@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, roger-hy.wang@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <1106c60cb96786ade1f60c692e566c408d7d8174.1768209230.git.cy_huang@richtek.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <1106c60cb96786ade1f60c692e566c408d7d8174.1768209230.git.cy_huang@richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,samsung.com,mediatek.com,vger.kernel.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-53142-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3FBA816D334
X-Rspamd-Action: no action

Hi ChiYuan,

On 1/12/26 10:20, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> To make sure LED enter off state after file handle is closed, initiatively
> configure LED_MODE to NONE. This can guarantee whatever the previous state
> is torch or strobe mode, the final state will be off.
> 
> Cc: stable@vger.kernel.org
> Fixes: 42bd6f59ae90 ("media: Add registration helpers for V4L2 flash sub-devices")
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Still cannot pass patch integration check, send v3 patch to fix all.
> 
> v3
> - Remove 'Reported-by' tag
> - Fix identation check for patch integration
> 
> v2
> - Fix commit message redudant space cause patch robot parsing error
> 
> Hi,
>    We encounter an issue. When the upper layer camera process is crashed,
> if the new process did not reinit the LED,  it will keeps the previous
> state whatever it's in torch or strobe mode
> 
> OS will handle the resource management. So when the process is crashed
> or terminated, the 'close' API will be called to release resources.
> That's why we add the initiative action to trigger LED off in file
> handle close is called.
> ---
>   drivers/media/v4l2-core/v4l2-flash-led-class.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> index 355595a0fefa..46606f5cc192 100644
> --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> @@ -623,6 +623,12 @@ static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>   		return 0;
>   
>   	if (led_cdev) {
> +		/* If file handle is released, make sure LED enter off state */
> +		ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE],
> +				       V4L2_FLASH_LED_MODE_NONE);
> +		if (ret)
> +			return ret;
> +
>   		mutex_lock(&led_cdev->led_access);
>   
>   		if (v4l2_flash->ctrls[STROBE_SOURCE])
> 
> base-commit: 8ac28a6642d1cc8bac0632222e66add800b027fa

The patch itself looks good, but while at it I started wondering
if we shouldn't move below STROBE_SOURCE access before the lock.
I don't see now, why we placed it there.

Adding Sakari.

-- 
Best regards,
Jacek Anaszewski


