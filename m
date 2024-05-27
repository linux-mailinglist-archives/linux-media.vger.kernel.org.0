Return-Path: <linux-media+bounces-12011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF978D0A2D
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 20:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6588F1C2149B
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D6215FA85;
	Mon, 27 May 2024 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4V5v3v0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EF42F2B
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 18:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716836150; cv=none; b=Oi3VZoN4oGoiAwUqHIXeQ8anz3rSKy0L6zmMcBwvvRSSagLP4AtK1TfHbaT+BFNUGz/z7uOt5ckfWqDu8Iew8ya7xLdNMc10EcyorFUCgv0ciZw/eNYvkB+RnbyX7PWRfZOfiYDvDW7ciro7scmxsG9O3vl0zebs8sTeGlt4OVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716836150; c=relaxed/simple;
	bh=VLHsvwOg3TDx/WeKQnVMYH059GaVmHPIqcpyY8TScYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTkPrDt49QgJZrrRs7eMuq/xCf3QUO0rC+QZsytA2q0DWGImsBEDLR7ghtbZfh+coLQ49f2xwPHD6QxIOBGTVkX7DAjJEJnycbsHutQ/cXexsdsfl0FIgbCj3qCl78AlILkJ6qk/f6Q4+JPGEj49VTMZ6e2lvCybP4js9Vz9c0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4V5v3v0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5a7d28555bso10900266b.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 11:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716836147; x=1717440947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ef9PEVFIZsixq3ZpG3jm6CuEgR8uaMP/CKdoII9sZmo=;
        b=o4V5v3v0uzKEPPBGxKUy4M8+laG5xR8eC3UxDMpwf0GprpIPVo+bQNTKrIgRZsSCh4
         YJa1coXXKx1PVesVawDnfCFfdYogNkCatendVPn1DJQtK1M+ytDUPTm2sQP4WPCA2t4g
         AgBx1f7uqF32yMlADgM2i2wzBMkbJzLfAML1FFXM0kReqsIg2IzyruH0UNWMqm6WqxTs
         1Wjm8p1DR/XmORKxa/+VfGrF9rlZBiZ8LXBd5bK8quUI1wT53GHoCKt8J+4BV+cx2GKh
         4Y/shWAFDbHnFWhQwminyT2CF0qUQai/2SwKmYurQQXpDWogh06tm3n/DS3o7oHDkpvB
         oh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716836147; x=1717440947;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef9PEVFIZsixq3ZpG3jm6CuEgR8uaMP/CKdoII9sZmo=;
        b=LEQe3SxEGA8GEiFUxRXJlrb9GwOGKLStFC9HsWzjF1TBaz618SfPecAQi7+yv1PEKr
         RGDGPwmxpLDdRf3106mcZ2FTDheUSjWRZxFWB+PtrG/VD7F1LZpXG0yQukZCZu+Ye+a0
         QwDEZw47aM5APFwgiTGV4K6MIPyO8qwRv1PbqGF6y0zWG6avHSeUo/LwS+gdFG/n4bhO
         6+m1ZHt53uEt1wxnoo4RvHu3K2g4LaMUweWAUfx2SSDUCv8jj+CLc42ZP0kd5cc7MDYt
         6APTvhjKo/GixGUbMadD9gkiC5vD6iPgMS13N5XWcqQihb4JjjU1BNeNsSXnAut2n/4l
         7qNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbSe/iRNcuqx/UU8NTBKK1ddIErkP/mSa7YrZda2QyosoKN6gzJBoYkoBwMrTkWRqi/fui18VujG51lm6l4GVQtjXShyJsCO0oCyg=
X-Gm-Message-State: AOJu0YxqrqWePFDD7ttiqdvEUMhDZNpw51xDR+QEUzEm6qvR8wKouvP5
	FHjlQhQ4QOcN6dX6siEZ9JmXeE09aOTVTyDWIffTMO0+qRoZK78XdT/SD9ly8Ns=
X-Google-Smtp-Source: AGHT+IF0X8Mx/+XatizVhklLRpGpOrq4VEojtbh2UtW1543Ne+ChMninQI/tTOIuHDV7M99PqC2oiw==
X-Received: by 2002:a17:906:c214:b0:a5a:8b8c:6203 with SMTP id a640c23a62f3a-a62646d7f32mr659233166b.45.1716836146860;
        Mon, 27 May 2024 11:55:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8a742sm515168766b.153.2024.05.27.11.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 11:55:46 -0700 (PDT)
Message-ID: <686a4786-90d9-41c3-b17b-cf24168e3fae@linaro.org>
Date: Mon, 27 May 2024 20:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: renesas,csi2: Add binding for V4M
To: Conor Dooley <conor@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240527132046.1680595-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527-sip-retention-43e2a16a7a41@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240527-sip-retention-43e2a16a7a41@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2024 18:35, Conor Dooley wrote:
> On Mon, May 27, 2024 at 03:20:46PM +0200, Niklas Söderlund wrote:
>> Document support for the CSI-2 module in the Renesas V4M (r8a779h0) SoC.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Another one not in a series, this should be with:
> https://lore.kernel.org/all/20240527133221.1688830-8-niklas.soderlund+renesas@ragnatech.se/

Niklas,

So you send three or four separate one-patch-sets for single compatible,
without any links or hints about driver submission which apparently goes
in parallel with impression of undocumented compatibles.

That's not the way.

First, if you insist on sending this separate for whatever reason, this
should have been ONE PATCHSET with cover letter (explanation + links to
users). There are no links: neither here, nor in driver submission.

Second, bindings GO WITH DRIVERS, so sending drivers without bindings is
posting undocumented compatibles. I would reject such patches to my
subsystem, because checkpatch would complain that you have undocumented
bindings.

Please resend entire series together - drivers or bindings. For every
separate submission, e.g. DTS separate from the binding which is quite
expected for media, network and USB, please always link to the binding.


Best regards,
Krzysztof


