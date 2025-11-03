Return-Path: <linux-media+bounces-46202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ED3C2B602
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 12:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FDDF4F5FB0
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 11:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F8C30498F;
	Mon,  3 Nov 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bF321jTF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC9F3043B4;
	Mon,  3 Nov 2025 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169233; cv=none; b=E5rbsPocNs8Dv/1FVvkPEY8qgbdau3bjmj/CyiGHMfIlZ9O8DWsx2sJfwf+tHQgnQRnaqnGvJ+1BWye2SLmGkhnidROteoOXsBU3AFggg+fV2lSzF2yUAmCPavCDgCVqO35i1cYzQFrE8yexlPn2KKXSzGY41xM1XmXcn7VPbbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169233; c=relaxed/simple;
	bh=lCr++ebewb1+f2CweZYOtPgaVLQowiqSXuLZvJo4kmw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D2rUDTEpdMG/sKla24KeY/wEUogPDMJd57PWQJZY//cJRgBXnTGb+2X9DzrEWHoa83s8fKKLZYeV35SdbMhFLR4WB60NInlf8FeZo1hTBy8EebZHf/sWwXlI4LlJASUfCscYA5pMOlAYmKN3EPDpsS8FOpyBXtMoLLnrlwScg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bF321jTF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49098C4CEE7;
	Mon,  3 Nov 2025 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762169231;
	bh=lCr++ebewb1+f2CweZYOtPgaVLQowiqSXuLZvJo4kmw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=bF321jTFfe5hxb5+FKzfBx032yTBuCT89QY0qtm9ARl5wJfANWr/I/WhfgiokL9uM
	 Soj5twHldA1n7/4+YiaiU3gvIf+dfLiFaZ8fwRfDXGDPj6GcuZCoXPvyKo8dNcpt56
	 nOhh8cSR6NYr9ESJPsNmGuZvDMQZyzHoy6GRTGmcasFQ90+InJK0mxhpFHA89H7S1B
	 D7qae8eIZkKRifdClUUYyPwhhpCSpI3KGuE5TL7xq9yQU1YKoV+2xTRpYFOuhoJ5Tw
	 HddtEbyV7u1tHVywp/Qprn0zeHo8Ic3LgTQADYzCUw77fBrkw2XQhRR9pQOzpUdmqb
	 z0qxe1Ad7vEYg==
Message-ID: <adb2b4eb-b41e-4c1b-b1b3-05bd0ae93f45@kernel.org>
Date: Mon, 3 Nov 2025 12:27:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH]: media: USB cx231xx: Remove unused var assignment
To: Michael Estner <michaelestner@web.de>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Colin Ian King <colin.i.king@gmail.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, linux-kernel@vger.kernel.org
References: <20251021054217.16005-1-michaelestner@web.de>
Content-Language: en-US, nl
In-Reply-To: <20251021054217.16005-1-michaelestner@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2025 07:42, Michael Estner wrote:
> * Remove unused variable assignments.
>   The status variable has multiple assignments which are overwritten
>   before used once. With this patch this unnecessary variable assignments
>   get removed.
> 
> * I got the issues out of the report from:
>   https://scan7.scan.coverity.com/#/project-view/55309/11354
>   The exact findings are:
>   * Issue=1226885
>   * Issue=1226861
>   * Issue=1226879
>   * Issue=1226878
>   * Issue=1226866
> 
> Signed-off-by: Michael Estner <michaelestner@web.de>
> ---
>  drivers/media/usb/cx231xx/cx231xx-avcore.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
> index 1cfec76b72f3..d268d988123e 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
> @@ -760,7 +760,6 @@ int cx231xx_set_decoder_video_input(struct cx231xx *dev,
>  
>  		status = vid_blk_write_word(dev, AFE_CTRL, value);
>  
> -		status = cx231xx_afe_set_mode(dev, AFE_MODE_BASEBAND);

Is this AI generated or something? This patch obviously breaks the driver.

Nacked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

>  		break;
>  	case CX231XX_VMUX_TELEVISION:
>  	case CX231XX_VMUX_CABLE:
> @@ -910,8 +909,6 @@ int cx231xx_set_decoder_video_input(struct cx231xx *dev,
>  			if (dev->tuner_type == TUNER_NXP_TDA18271) {
>  				status = vid_blk_read_word(dev, PIN_CTRL,
>  				 &value);
> -				status = vid_blk_write_word(dev, PIN_CTRL,
> -				 (value & 0xFFFFFFEF));
>  			}
>  
>  			break;
> @@ -1092,7 +1089,6 @@ int cx231xx_set_audio_input(struct cx231xx *dev, u8 input)
>  		ainput = AUDIO_INPUT_TUNER_TV;
>  		break;
>  	case CX231XX_AMUX_LINE_IN:
> -		status = cx231xx_i2s_blk_set_audio_input(dev, input);
>  		ainput = AUDIO_INPUT_LINE;
>  		break;
>  	default:
> @@ -1865,8 +1861,6 @@ int cx231xx_dif_set_standard(struct cx231xx *dev, u32 standard)
>  						0x1befbf06);
>  		status = vid_blk_write_word(dev, DIF_SRC_GAIN_CONTROL,
>  						0x000035e8);
> -		status = vid_blk_write_word(dev, DIF_SOFT_RST_CTRL_REVB,
> -						0x00000000);
>  		/* Save the Spec Inversion value */
>  		dif_misc_ctrl_value &= FLD_DIF_SPEC_INV;
>  		dif_misc_ctrl_value |= 0x3A0A3F10;
> @@ -2702,8 +2696,6 @@ int cx231xx_set_gpio_value(struct cx231xx *dev, int pin_number, int pin_value)
>  		/* It was in input mode */
>  		value = dev->gpio_dir | (1 << pin_number);
>  		dev->gpio_dir = value;
> -		status = cx231xx_set_gpio_bit(dev, dev->gpio_dir,
> -					      dev->gpio_val);
>  	}
>  
>  	if (pin_value == 0)


