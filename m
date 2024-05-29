Return-Path: <linux-media+bounces-12157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D05808D38B5
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 16:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D888284506
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 14:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318411D54F;
	Wed, 29 May 2024 14:07:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03092C87C
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716991670; cv=none; b=IG7wKXZpYZGfNH8OfdsaQJtY2zSDiQldSsjYuJudrgbxAROuallf8Ul6pIsV837Oi1Vnq8CX/1poupfWcr8SnvQvEydrVJr1oFIYxMPzHVCzhqhEPq2sULJjb7HI0e8FIL2LTc//uiIQuz/mNlSq2BT9wUCo2Zv4ubIxhnKuH5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716991670; c=relaxed/simple;
	bh=sdh912PbGGSN5HqMGZtrWMsWwOgJEATxeW/ILsCmhf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=d2xLJICARnbncEc5kVu5EBxQjj3wsnoc6uQIe9Gg0yqMCJNzMysofABDGT6rqdV62V3ldOazIwKhZch8dqDm6kFHwhc9/0wsCUQ7vqOGUrOuPaToVoS3/peHQ2nk3GxqJ440l+xVjNFX1vUkMjANC17RBdbUd6aWwk+/tWEHVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF6EC2BD10;
	Wed, 29 May 2024 14:07:49 +0000 (UTC)
Message-ID: <b7097390-1609-4faa-8e88-9bfe5a00641d@xs4all.nl>
Date: Wed, 29 May 2024 16:07:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] edid-decode: Cannot support NonMixed MS without MS
To: Sebastian Wick <sebastian.wick@redhat.com>, linux-media@vger.kernel.org
References: <20240529100301.127652-1-sebastian.wick@redhat.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240529100301.127652-1-sebastian.wick@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 29/05/2024 12:02, Sebastian Wick wrote:
> When `Max Stream Count` is zero, the sink does not support multistream
> and thus cannot support NonMixed MS.
> 
> An EDID with Max Stream Count = 0 and Non Mixed MS = 1 can be found in
> linuxhw/EDID ./Digital/TCL/TCL5655/1723FF2DC6D1 at commit cff7fe4d44.
> 
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> ---
>  parse-cta-block.cpp | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git ./parse-cta-block.cpp ../parse-cta-block.cpp
> index 4d2afc6..7cd7a3a 100644
> --- ./parse-cta-block.cpp
> +++ ../parse-cta-block.cpp
> @@ -2498,10 +2498,11 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
>  		fail("Empty Data Block with length %u.\n", length);
>  		return;
>  	}
> -	if (x[0] & 3)
> +	if (x[0] & 3) {
>  		printf("    Max Stream Count: %u\n", (x[0] & 3) + 1);
> -	if (x[0] & 4)
> -		printf("    Supports MS NonMixed\n");
> +	    if (x[0] & 4)
> +		    printf("    Supports MS NonMixed\n");
> +	}

I would actually leave this as-is, but instead add a fail() message
if MS NonMixed is set, but Max Stream Count == 0.

It's really an EDID conformity failure, and it should be reported as such.

Regards,

	Hans

>  
>  	num_descs = x[1] & 7;
>  	if (num_descs == 0)


