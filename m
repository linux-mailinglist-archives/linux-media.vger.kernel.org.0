Return-Path: <linux-media+bounces-41954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A2CB4848B
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA993BCBAB
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 06:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BD92E2EF2;
	Mon,  8 Sep 2025 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rb7GmDuR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DA29293D
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757314539; cv=none; b=NyAFprrnm/mbYCS4zgVnYuc8i8UKKXjVkj/lZf6WhLhSeZvHu1QEGTNGrjNuFerq86/eZHFbt4gEAz5HuXr+QryFCHAZ5Hqr9w/6loojxU+1Soh42NDvb6OryiSVQE4ToH5Uo/2lzpulYNgJd25POZMa5/AnSklngnSOwaEfn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757314539; c=relaxed/simple;
	bh=p39oYiZMi86n+vy7m44myWGD2B71MCerBt0TIeHoJ4Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KLzmXu2m1JqYqYOAnSAqZsyF3l6ZUenW5Wu8xte9KNd/k3rxoggAUeR70w+57tetaxEnKx5Pos8PjVy1mwxZbDw0TetrTneCjJAfJWX0Nb444tFE1i3gCuqyQs4r4gSP2gEW9m1tiruUd4zNylJUAHFJQxz+Mmm0g0sPzebtEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rb7GmDuR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E9FC4CEF5
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757314539;
	bh=p39oYiZMi86n+vy7m44myWGD2B71MCerBt0TIeHoJ4Y=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=rb7GmDuR39tlfelan5gJJiCvAt7cjnrHPrCicw2gcLLQAOkz5wXDJho2naiX//U/m
	 Gz9mbyS5qftfJYLO1MBDPmfz1NGfYtSJNDnJdZbe/4p2xJGPH6rtfALJAVH+65JUE7
	 7tLK+dRTjtdHA+eb/CuDxpQenPQp7zzzBcTUtOkH2PeFlTveuYr+tKJaUOQrO2QWAO
	 C51DSdEIq6ibtcy7RleRL/tdBIaEYG2fJy/vh33FjXjV9c/UmeurqnKzyeUrY4ZTcc
	 31c9ok87QQpxJ5s1FAZfknQdhP86xswiNNFz+WPCj8SqjF+r0n3PfbSMZ7nWa1OcIZ
	 Ygpps11/3VVVQ==
Message-ID: <b5618436-cf81-4014-8eb3-7c27177a45ec@kernel.org>
Date: Mon, 8 Sep 2025 08:55:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: vivid: fix disappearing <Vendor Command With ID>
 messages
To: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <5b0cbda3-0c70-4022-9d88-de9fd372d27d@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <5b0cbda3-0c70-4022-9d88-de9fd372d27d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/09/2025 08:49, Hans Verkuil wrote:
> The vivid driver supports the <Vendor Command With ID> message,
> but if the Vendor ID of the received message didn't match the Vendor ID
> of the CEC Adapter, then it ignores it (good) and returns 0 (bad).
> 
> It should return -ENOMSG to indicate that other followers should be
> asked to handle it. Return code 0 means that the driver handled it,
> which is wrong in this case.
> 
> As a result, userspace followers never get the chance to process such a
> message.
> 
> Refactor the code a bit to have the function return -ENOMSG at the end,
> drop the default case, and ensure that the message handlers return 0.
> 
> That way 0 is only returned if the message is actually handled in the
> vivid_received() function.

Because of this change, the cec-compliance utility also needs to be changed.

The patch for that is here:

https://patchwork.linuxtv.org/project/linux-media/patch/25d4b492-7ea1-4a92-887c-ddd7c64dc0c3@kernel.org/

So once this patch is merged, that patch for v4l-utils also must be merged, otherwise
the virtme tests will fail in CI.

The CI pipeline for this vivid patch and that uses the fixed cec-compliance
which is found in this v4l-utils branch:

https://git.linuxtv.org/hverkuil/v4l-utils.git/log/?h=cec-fix

is here:

https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/1505397

Just to show that it passes.

Regards,

	Hans

> 
> Fixes: 812765cd6954 ("media: vivid: add <Vendor Command With ID> support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/test-drivers/vivid/vivid-cec.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
> index 356a988dd6a1..2d15fdd5d999 100644
> --- a/drivers/media/test-drivers/vivid/vivid-cec.c
> +++ b/drivers/media/test-drivers/vivid/vivid-cec.c
> @@ -327,7 +327,7 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
>  		char osd[14];
> 
>  		if (!cec_is_sink(adap))
> -			return -ENOMSG;
> +			break;
>  		cec_ops_set_osd_string(msg, &disp_ctl, osd);
>  		switch (disp_ctl) {
>  		case CEC_OP_DISP_CTL_DEFAULT:
> @@ -348,7 +348,7 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
>  			cec_transmit_msg(adap, &reply, false);
>  			break;
>  		}
> -		break;
> +		return 0;
>  	}
>  	case CEC_MSG_VENDOR_COMMAND_WITH_ID: {
>  		u32 vendor_id;
> @@ -379,7 +379,7 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
>  		if (size == 1) {
>  			// Ignore even op values
>  			if (!(vendor_cmd[0] & 1))
> -				break;
> +				return 0;
>  			reply.len = msg->len;
>  			memcpy(reply.msg + 1, msg->msg + 1, msg->len - 1);
>  			reply.msg[msg->len - 1]++;
> @@ -388,12 +388,10 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
>  					      CEC_OP_ABORT_INVALID_OP);
>  		}
>  		cec_transmit_msg(adap, &reply, false);
> -		break;
> +		return 0;
>  	}
> -	default:
> -		return -ENOMSG;
>  	}
> -	return 0;
> +	return -ENOMSG;
>  }
> 
>  static const struct cec_adap_ops vivid_cec_adap_ops = {


