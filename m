Return-Path: <linux-media+bounces-25089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E86A188F3
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 01:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BEAA167686
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2BF11CA0;
	Wed, 22 Jan 2025 00:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZC03cXb9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8838DF9
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 00:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737505757; cv=none; b=cA1uii/G7B1s59qQkU4zJNUb2oQt0TfOlJCruu6Cw/ASb96E0CXAmH1c2gle3Cc6WxMfQ0HC1m6/O9cXqOZdTBQ7QeUitFbP/3/6BHErZw9syH2Qj89VTU7s5bgWTKKHyy7NNo/w2EpOyx2unVj/AvQsf5usr6ljBT2J5V53cy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737505757; c=relaxed/simple;
	bh=bcwXAskIqGr1StGwxVlB9b7rUxJv3MdpM1sJzy34Ca0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVR3XbA2jqOsRTHsmhotgLCWiupoG1mtMz9TjRw61juFgMD/q8oAy+8kZGIZm2ecvkazV1eLEv2UJ5xpaxBG7Z0yfTu1ucXlaTlNyy+ZVWL5KgmZbAnsu19hr+Z/BNRZi+OGeoLRqZJxw3HSVtOUTbFy0mFUAUtpFccEcTzsi04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZC03cXb9; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30223aa0b9bso5630731fa.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 16:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737505753; x=1738110553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CCcgB3VhUvKOT2h2jpUk2KSrzV7zZ3MNXEHDhSA4U4=;
        b=ZC03cXb9ODy7l4b8l8cIhqtIrUGk0JoK67qth5jlbAac0GEhazaN+tapt/Pmt7EmdZ
         VHvGwPtCN6rK5dQlrpD9ubHohdM02DxrgdZhNuSysSc8R64i5mYkAJctsm24Cdiag1uM
         JpAXD3suKRxYs9FQJ6oDF8nRwFzM5PgJ1slfgPd9VCHOM4MbVtp8V2tICjNm52kvdO2M
         6wUvhKJtey+CFa+TUU/BjD0wnTZnAM5osds5FExkZ59V5nRDPGBVZQJ+9+4m63yBxfbz
         D0fTnXLWeKlUhdv2OWo+Y1y7hxcprbweowh2VZnmqGn65Lr31b2vp78CCZ5Anf9VIUsh
         XFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737505753; x=1738110553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CCcgB3VhUvKOT2h2jpUk2KSrzV7zZ3MNXEHDhSA4U4=;
        b=aPcNgRyMIcHj8BVJjukUdYsGjcSHdV478otfAlJXqee7coC7zaGooQZNlAoo+38L6h
         Sa/elfnw11KPRoi5ueLewfxqbvatzpUKuaM1pCT2zGcgSR+buw2e6WbLj+Ep+KsNNcmU
         igxRO1K8xrvlkqmHago7PAvoxm5eMzbgIuIMcVTLgSICAebqT9yLkrW8/fVhHZwjUofS
         gx+GjhVsFK0f/RhxD0zM//iZRnCHYLxR6Nmrx7yz6hf7yoSbNEeloh8qxI/7G9BvygCX
         JHxLALj1ePjEuhtZUfYDIkqPARXxTK1jH+WnhC13TZWb1Us+YqDyZ9i0V7LQLcpciE2p
         nh8A==
X-Gm-Message-State: AOJu0YzE5MTTHHdZavxlENQSV2bw9+hBHAVFgFBQXtUTTn14zorNy1Um
	K0C9lSaPylOOAO1Mz5f4C4BnHYP1atSfvr1dZLwDLn+6DHRi+AE0sglLQ1UOdyY=
X-Gm-Gg: ASbGncuHevELNER6B59WtIF5iBQoCBcVFbswx3G2ggAWXepLuC96XxcskwDRYMyjqwB
	SZH4fIrDI844VknAFI5+LB5frN/hiutPa3iS4zh2X/VfcBNzPs6xG6cfY0cLQgzB1qNsimVa+9b
	a/szLf0ek5wgQNGbOovNy2LCqaF8doC24CRLcrlXwa0caCXrLq0JI2RrIZ4hAfH6pXlPYsppG2S
	VOxThyWR98XqPwqxkk+8dD8vAGdhuupknR1iMco901NPNwaGVbJKxbqBStafZVM0DFZYrWp91bH
	N9CCM65tacbO7xpdY7zCeEripEZ6XlxwieZVJWCoZcaJExCo
X-Google-Smtp-Source: AGHT+IF7mcEikAAqzQurIt0klgWl/Kv3joNL8utk6/DOwSEAOdrnD4QmUkP3MnIQQmIPhmc2Hja2aA==
X-Received: by 2002:a2e:be9c:0:b0:302:27c6:fc98 with SMTP id 38308e7fff4ca-3072ca8c496mr21689281fa.4.1737505752745;
        Tue, 21 Jan 2025 16:29:12 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a33092asm24397481fa.2.2025.01.21.16.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:29:11 -0800 (PST)
Message-ID: <00989990-85dd-46d7-a100-c986fc1fb066@linaro.org>
Date: Wed, 22 Jan 2025 02:29:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph
 5Gbps DPHY v2.1.2 init sequence
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-6-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-6-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/20/25 17:47, Bryan O'Donoghue wrote:
> For various SoC skews at 4nm CSIPHY 2.1.2 is used. Add in the init sequence
> with base control reg offset of 0x1000.
> 
> This initial version will support X1E80100. Take the silicon verification
> PHY init parameters as a first/best guess pass.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 126 +++++++++++++++++++++
>   1 file changed, 126 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index b44939686e4bb..fc624a3da1c43 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -55,6 +55,7 @@
>   #define CSIPHY_DNP_PARAMS		4
>   #define CSIPHY_2PH_REGS			5
>   #define CSIPHY_3PH_REGS			6
> +#define CSIPHY_SKEW_CAL			7

This one is not needed, having CSIPHY_DNP_PARAMS only is good enough.

>   
>   struct csiphy_lane_regs {
>   	s32 reg_addr;
> @@ -423,6 +424,130 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>   	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_x1e80100[] = {
> +	/* Power up lanes 2ph mode */
> +	{0x1014, 0xD5, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x101C, 0x7A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x1018, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x005C, 0x00, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0060, 0xBD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},

Double write record, which is anyway ignored, but one should
be enough.

> +
> +	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},

Writing the same value to a register 4 times in a row, apparently
it's not needed, one time write is sufficient.

> +
> +	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x045C, 0x00, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0460, 0xBD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},

Two equal "ignored" writes.

> +
> +	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x085C, 0x00, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0860, 0xBD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},

Two equal "ignored" writes.

> +
> +	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C5C, 0x00, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C60, 0xBD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},

Two equal "ignored" writes.

> +};
> +
>   static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>   				   struct device *dev)
>   {
> @@ -594,6 +719,7 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   			val = settle_cnt & 0xff;
>   			break;
>   		case CSIPHY_DNP_PARAMS:
> +		case CSIPHY_SKEW_CAL:

Having CSIPHY_DNP_PARAMS is good enough, no need to add another
"dummy" write type.

>   			continue;
>   		default:
>   			val = r->reg_data;
> 

--
Best wishes,
Vladimir

