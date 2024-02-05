Return-Path: <linux-media+bounces-4697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E8D849972
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 13:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F611B27D30
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 12:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E9F1A702;
	Mon,  5 Feb 2024 12:00:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535A1A5BA;
	Mon,  5 Feb 2024 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707134410; cv=none; b=GRA8mBW1zJa5v7377Nv/IiqMMM3Y1HwQlfAZnDH8cTfV3RhEZvQf1SY9LPxFGVEXkHULuBcI4CcZ6DGaGsCZhzk27qH7PkmSMtgcwQh42NkU567311iTFlB5ALoloq69TMk8TDSEyiGPxgx3f5nC1/GxteM+lAZvy4xVL2RuOnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707134410; c=relaxed/simple;
	bh=srmUkqDwM3l+DNKrojuZuVgjMzoYMNUPRcJviySaKCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bvl+dj2tK9blq5H0eT5X2u7L95qssyp5p7nFW/T1Nwq3OUHAgWI2yG936PUHLLqji7XpLZn4lhCPbLIAYnKQDqmNQ3w5IzAyWs1KV16aIfsCWx3T5jbN5Jh/AIk7/05FE17dfWbQsefM1ylgdk0j1LlPWP1dnrT+/il13gBOBrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3C6C433C7;
	Mon,  5 Feb 2024 12:00:07 +0000 (UTC)
Message-ID: <8a4447ba-d4ac-40ac-9d6b-796db37f3100@xs4all.nl>
Date: Mon, 5 Feb 2024 13:00:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cec: core: remove length check of Timer Status
Content-Language: en-US, nl
To: nini.song@mediatek.com
Cc: ci.wu@mediatek.com, mchehab@kernel.org, nicolas@fjasle.eu,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
References: <20240125132850.10430-1-nini.song@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240125132850.10430-1-nini.song@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/01/2024 14:28, nini.song@mediatek.com wrote:
> From: "nini.song" <nini.song@mediatek.com>
> 
> The valid_la is used to check the length requirements,
> including special cases of Timer Status. If the length is
> shorter than 5, that means no Duration Available is returned,
> the message will be forced to be invalid.
> 
> However, the description of Duration Available in the spec
> is that this parameter may be returned when these cases, or
> that it can be optionally return when these cases. The key
> words in the spec description are flexible choices.

Good catch, the spec indeed says 'may', so dropping the check
in this patch is the correct thing to do.

It's merged in our staging tree and it will appear in v6.9.

Regards,

	Hans

> 
> Remove the special length check of Timer Status to fit the
> spec which is not compulsory about that.
> 
> Signed-off-by: Nini Song <nini.song@mediatek.com>
> ---
>  drivers/media/cec/core/cec-adap.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index 5741adf09a2e..559a172ebc6c 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -1151,20 +1151,6 @@ void cec_received_msg_ts(struct cec_adapter *adap,
>  	if (valid_la && min_len) {
>  		/* These messages have special length requirements */
>  		switch (cmd) {
> -		case CEC_MSG_TIMER_STATUS:
> -			if (msg->msg[2] & 0x10) {
> -				switch (msg->msg[2] & 0xf) {
> -				case CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE:
> -				case CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE:
> -					if (msg->len < 5)
> -						valid_la = false;
> -					break;
> -				}
> -			} else if ((msg->msg[2] & 0xf) == CEC_OP_PROG_ERROR_DUPLICATE) {
> -				if (msg->len < 5)
> -					valid_la = false;
> -			}
> -			break;
>  		case CEC_MSG_RECORD_ON:
>  			switch (msg->msg[2]) {
>  			case CEC_OP_RECORD_SRC_OWN:


