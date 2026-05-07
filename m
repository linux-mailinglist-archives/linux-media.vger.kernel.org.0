Return-Path: <linux-media+bounces-60843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPcJIPXA/GnSTAAAu9opvQ
	(envelope-from <linux-media+bounces-60843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:42:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72B4EC5F4
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C0F4301BF4B
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 16:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AD6428833;
	Thu,  7 May 2026 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYo6HLmc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7336F3BED23
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172139; cv=none; b=aurwNlRUbMaGiGskViZ/dSzkICVgUj4qHKPVAFgaCVn+5wgCoozCI1zaa7OVAzkYWpPJuIxtWocHe5r86OY0S7r/HPQrr00GMXLH5Az2QNoYcauW3lzyWIH5fhZAB/SJZukcNcdJoKieNXM8MZJMMb/1A25wuEg+Ug6d2AmhLqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172139; c=relaxed/simple;
	bh=u3ror31K/SolR44VKWPc2Q+Mua5QNfnvH8pM9AFqtMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Winw0YWnj8Z7FP4VLm2wLB97ZwIDZ9BE7ZQ/98vJXE+P4Km0vSK2Y+tlTJZcAHgZvBE+4g4BP+11jWmfAszDZPXr5MFxZMWwXElwCP5cz3IvlqVQGY9cFtAGrA103+dXVJnVWSrxSK1AJaca8r48rdoKTi5SXxMkY4XXZxiXQI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYo6HLmc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-453903ee4adso603687f8f.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778172137; x=1778776937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DkH5pLwd4aVz/xgL9vdbm3vW9Cqx7RecqkkEDJ2Qoyw=;
        b=SYo6HLmcA/7cUnwilfUm6/CtbKmXwozCBUWp2IaNRmX/NhSO0flDRhIVU40qmuDRXA
         G6ax/sog78LNnmRqkSbUZ6fF6njKMC09dcMDFDgzOtjGJ9ZTP/m5OMEFlx9J8l7WWaOt
         T7n1p1pfneAeSea3eYFItA9dSEoAZ98J/s2uI3wOzT2E3NQALy+C7ddDl8gJQoK1NUPb
         l7KLUce7yWSiR/5LFiHRvfWefJt000+ijd8+2+9RBlekbob3rClAhbwcnNpKKZLj/5er
         09IZaNNBTPDCmpfhglVhYoyX2ojRKjuMeFS/FtJr3yLRT4jZwO/ICnaqtx5uyP5oA8mu
         ELlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778172137; x=1778776937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkH5pLwd4aVz/xgL9vdbm3vW9Cqx7RecqkkEDJ2Qoyw=;
        b=SA1gyoLu3yd0G525KVfLDZ4OLKwG0XYJAL2A2a4YnYrjGGCGJvT0ZnyD20Nep8mypz
         D4fUciAsSKix9gzSonooe1X6SJPmCg0NUprWNPZ8mdmERtKHk20UiXM/2ih3xaSLcFyd
         XYjz8c9lCbAvUKR2bi88O0oM9R70u30ByKzmrA3hgoDXmGxXB8WJQ8d80YuJw5xa1fkz
         Y8PpXBIekh9h/PN3XjUEQg+4Qkme2EFLqIJ4Ja455OToKmaWMHBKYJ9UrbgsX9yNY8+l
         SKHneRI4SZ2lzqpAycKyFKB+S/ShNqIsdSCAcVW6a9+hqmwPdlTHpCe4p3Dc2ttMEFo1
         oV6A==
X-Forwarded-Encrypted: i=1; AFNElJ/oFq60MvMAMO56ZL1yvXqQwZ4x04dcu/pHW0hfLLTHT52KQwWYh41Ek+RRk0Sjq+2w/NUxUpSCxOqzAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2+6CJQtAf44cZ8FVKcpO/ZJhR8y+C44BSbr0kDeW6Zv6Rl/K
	w3nVgK8dnRRtKVZ/mVUiWGbfa8JcuaXYPkpUDO5nZDgFIAx9F3uyOvdY
X-Gm-Gg: AeBDiev7vsgv7U/5bXfu+Sa69njpV9IvaeGJ0xqHcypdttvMnADLoj69KGBrfCWUIFn
	wBUcRCHAnuQGTTxD534FSdRMg8fA5lIKCybRN0j22tdgB4QoPs4RCt3Yc05vB/DYteuGrMQgqCC
	hAdNjtA+yQPVfkHQwASsax9UcbpMiWYIIbIhSAGlwBDiW9SUho8mWHtAnJJ8ANP7FCVIB+mi3Fx
	Gi0/1ag0rfrLlFhkOZzGCheZe4MaI5PBG+VAYv99XB47jgEIakygax0fAKyVcOCjlvID4JOwID0
	q4pD3J4CJObkIj5xA5/8ZtjxFzvYYQbdoMRCBNkM60Rt/AdD9XnbV3XjDPZpW0ebSh/PEm1r9AD
	U5ai9OBp7br5zKXQlEmY1bxuQcIK+JAx4OhRfeDtNFFooOL2xNioFcb5fcHcu9YkkNNM2VOge85
	xVf5EgcarMwD4Sw5WCmpSoOQ6pYQAQsSw864WYIYPHVME6bI+X8bZxvwkCxkO4RwFw6XUmAADT
X-Received: by 2002:a5d:5f48:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-4515b056b4dmr14242651f8f.9.1778172136625;
        Thu, 07 May 2026 09:42:16 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:d9bb:cdec:69e5:2f8e? ([2a02:8109:8617:d700:d9bb:cdec:69e5:2f8e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820340sm309996f8f.2.2026.05.07.09.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 09:42:16 -0700 (PDT)
Message-ID: <7a353450-770a-4820-ad23-8066b736d87e@gmail.com>
Date: Thu, 7 May 2026 18:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: i2c: alvium: Fix controls for WB/AWB
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: martin.hecht@avnet.eu, michael.roeder@avnet.eu, stable@vger.kernel.org,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505142513.1551721-1-mhecht73@gmail.com>
 <afsJz1vVdd3o-pe9@kekkonen.localdomain>
 <37aa90a3-7909-4605-a0be-1545db1fadb0@gmail.com>
 <afsh2tmV5AFlMCML@kekkonen.localdomain>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <afsh2tmV5AFlMCML@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0B72B4EC5F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60843-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

Hi,

that patch has been superseded by patch 
20260507163443.39794-1-mhecht73@gmail.com what addresses more critical 
issues.

Martin

On 5/6/26 13:11, Sakari Ailus wrote:
> Hi Martin,
> 
> On Wed, May 06, 2026 at 12:16:13PM +0200, Martin Hecht wrote:
>> Hi Sakari,
>>
>> thank you for the comments.
>>
>> On 5/6/26 11:28, Sakari Ailus wrote:
>>> Hi Martin,
>>>
>>> Thanks for the patch.
>>>
>>> On Tue, May 05, 2026 at 04:25:10PM +0200, Martin Hecht wrote:
>>>> With that patch the controls for red-balance and blue-balance were created
>>>> only if the particular camera supports that. Otherwise the pointers on
>>>> the control variable are initialized with NULL to prevent side effects for
>>>> clustering with AWB control.
>>>>
>>>> Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
>>>> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
>>>> ---
>>>>    drivers/media/i2c/alvium-csi2.c | 37 ++++++++++++++++++++-------------
>>>>    1 file changed, 22 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
>>>> index b62b45a4f2fc..4c6934e9e177 100644
>>>> --- a/drivers/media/i2c/alvium-csi2.c
>>>> +++ b/drivers/media/i2c/alvium-csi2.c
>>>> @@ -2108,26 +2108,33 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>>>>    						  0, 0, &alvium->link_freq);
>>>>    	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>
>>> This is a problem. Can you move setting the flags after checking the
>>> handler's error status? The functions adding controls may fail and this is
>>> simply a missing error check.
>>>
>>> Can you submit a fix, with a Fixes: tag and this patch should be rebased on
>>> the fix, please?
>>
>> I'm preparing a separate fix for that issue. It's the same situation also
>> for some other controls like pixel_rate and link_frequency but not only. Can
>> I combine that into one patch for fix only that in alvium_ctrl_init?
> 
> Please do.
> 


