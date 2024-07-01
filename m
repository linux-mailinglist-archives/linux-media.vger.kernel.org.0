Return-Path: <linux-media+bounces-14449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B791DA33
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 10:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FC751C21401
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 08:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9349476;
	Mon,  1 Jul 2024 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FATPpAIu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EDE82D89;
	Mon,  1 Jul 2024 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823272; cv=none; b=HIyGUmz+TVbR8dkG15aXRmI7hDKTT1dDMJWzbDtg7+jgwFA1pDcikenxTqoYvYqUp7VZ9Y4hMXVmUCJjALr7ZUzAEj35scwzQYExTqp7sZYrmQ1BABVk+aaRoLBuJXC8oHyNWEq0rqJf37Z6Jk03GD3w9Bo/RpbYwUDwnOvdOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823272; c=relaxed/simple;
	bh=iOIsNftd+AUOPQ+Acsg6REjaYC+90eaaV8L3VB0Yp1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQ74Ga8snxOQuq88xfPGoudQCTWPS2N/ZTtJdQMFfo+Tbd4fL5CF39QfiWTddW1TXy2OTp0QPuUYCbmHMd+lhFErLoTi+bo8PRFMhi6vBCVVI88qKYudyMMAZinpoxyD4oBzYAJqoknCIu5/fEN4HaQm0DPkYPkz0TNCf0oUlr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FATPpAIu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so20086135e9.1;
        Mon, 01 Jul 2024 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719823268; x=1720428068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMt7mTb63MOoRef5KMAR+OLG9LjGQCs3Iv9eQzbOgVY=;
        b=FATPpAIuS8kQHdSUKSMeEgjfl3nX18w3aK8SqE/cFFCzfryepebTqzrE5Rgv3/cuad
         Rako7lr7T5MrMptiYetareEX0Q44gPabOdHIoReOXCn5vkq1ibf3j0z7Wd+Us9edg6Ux
         2mXC/gfPzQWR8P4e0wfIv5EpHIGU7oGirGrqAuFP2TCxdFjVU0Bjh8rQ2/I+0SLkI+iJ
         3GhxdMvCztUopMjB8oxzJ3PUzoqh5QO4FlOrfmgKkYOCLk6wyLDU4Kv7nBpXsaDjnXCu
         58XCwqS9EaWiqlyh9ABBaMe06JCYCrT5Qv2n7vCPme1FXuywIfvVLE6mGm+i8rHD7A/v
         Bn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823268; x=1720428068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AMt7mTb63MOoRef5KMAR+OLG9LjGQCs3Iv9eQzbOgVY=;
        b=w6eOZ2v6yWZZunq1cWhzcweWFrEE9gP5NwRrefsAQDD2WhoxW+uQNrsnqgl5ZmMLLt
         /vMIj+QkM+n9HR2FRGsIJSQCrKqpDaJnbzsWZrPhIr0VwPdpT4ZAVIzTjqYWJgktxUq4
         +LGVFtyjk8wpzBPMeNGsu7788OFjDCYyoShXGroFBSwiFFl839QcqYCAjdV93tJ8W3c/
         f0S0oh0UPdvunXNrAe7cYG0vWgQmE309YVLjhvMvitWv/Km/GgnsA0qNWHEH916kUFGo
         6RD2v+t7KczX0wohs7adPrYnqGh+/icDRyH4TVTNlzkc68eI1Fu6RbJvEfoKV/o63ryu
         /rVA==
X-Forwarded-Encrypted: i=1; AJvYcCVPXMvzP5xE9VA24KOQNYiKS8u4T2flkmgOqlyD7L47oLux63qaTFm4LzwrYECRTv2rF26gj81zH+LBfJb5v1gM7JTqRElQxpCQomoPqKAJfmWjX4qoOk//4SLc8GAhmdwSuYVIxsXAxEM/QmSvd77A3c/WyV1u8LgWqsYOI19RHGmarrVs
X-Gm-Message-State: AOJu0YzwehtFt0x54C023w6iLcHi3euHHH52a8HEE4peksPVkwIqodCL
	y59BIHAVL2swm3XOTFX9fyJyPBvQ5K0BteU4plEb9GHDaJSw1HFZ
X-Google-Smtp-Source: AGHT+IFVkP4vxt28218+k2V48TYQocy8Fz5i69HcPxCmln5LU4tWH1iaovbS/2p5BgnSrenoOSY/NQ==
X-Received: by 2002:a05:600c:6a8d:b0:425:77b4:366d with SMTP id 5b1f17b1804b1-4257a02f3f6mr32722375e9.11.1719823267873;
        Mon, 01 Jul 2024 01:41:07 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09a94csm141988335e9.33.2024.07.01.01.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 01:41:07 -0700 (PDT)
Message-ID: <dbcd9a16-4e4b-42c8-ba7f-d6c1dfd9dccb@gmail.com>
Date: Mon, 1 Jul 2024 10:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 2/9] scatterlist: Add a flag for
 the restricted memory
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <183f2ae09c2dbcf687e69cd13a9d258fd24fd80c.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <183f2ae09c2dbcf687e69cd13a9d258fd24fd80c.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 28.06.24 um 22:16 schrieb Nicolas Dufresne:
> [SNIP]
>>>>> Why can't you get this information from userspace?
>>>> Same reason amd and i915/xe also pass this around internally in the
>>>> kernel, it's just that for those gpus the render and kms node are the
>>>> same
>>>> driver so this is easy.
>>>>
>> The reason I ask is that encryption here looks just like another
>> parameter for the buffer, e.g. like format, stride, tilling etc..
> I'm mostly a reader of the thread here, but I'd like to avoid basic mistakes.
> The buffer in question are "protected", meaning that the CPU HW does not have
> access to the underlying pages (or zone in the case of Meditatek).
>
> This is different from encrypted buffers, which don't need this level of
> protection, as without the security key to decrypt them, their content is close
> to random data.

Thanks for that clarification, this difference was absolutely not obvious.

In that case having a separate heap for this memory is indeed the 
easiest approach.

My question is still what would happen if the CPU tries to access this 
protected buffer? Or does the CPU not even have an address to do that?

Just out of curiosity, I mean the exporting heap should then somehow 
reject any attempt to mmap() or vmap() the buffer content.

Thanks,
Christian.

