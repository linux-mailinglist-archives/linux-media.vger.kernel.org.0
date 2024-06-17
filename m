Return-Path: <linux-media+bounces-13397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FED90A81A
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E84E0280D7C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2BF18628D;
	Mon, 17 Jun 2024 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M27ogRyL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933F190474
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718611543; cv=none; b=gI6K+h4WVj+kNRRysXagpasFPHEQMlHd6Gnz4MtrPlQj1DycwUGQBr8nRq4MBvzgCcq+1LLKjN+pCi+QDXqR9OYJdcvHX/1OnHdp92wS5Q5e6qG8BZ1UJ+60umz9nDddKmzFFT0nHkVFWCM5NECJAt8Y1ouxwUWxlqVLRhHNIiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718611543; c=relaxed/simple;
	bh=jJknf9JjCF3QX4BKrwowK8j7mwdmpuB67UlqCB88zt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgttYDLZ0TMObQtfosdqVugpffUkJnFblubfy+TTiS8aUuaFotCRpmdAP+9mfzuA4MuyczmAjal2u6LuYrURxj1NB8/g2rcVOAEQM0sLIaM0OpymlafdmyJrilHGIdzPEMsajgf3ne2IoatElwVxcAAVq4+EGLlor+QQqfzDTQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M27ogRyL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-421f4d1c057so31946615e9.3
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718611540; x=1719216340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RhK0l1wiP2QqjV41iED4AMmcoD6qMZOANZydgxIA9xw=;
        b=M27ogRyLqqJDYSYax0gkBfghsm3QbB66bTsHMHrev59VUVxA0Yg0V8HUI5yIxrE+8Z
         BtLTY4NRJCyCOZIvqgqWqoMzyq1sokyikQs9QIzqWXcHEp5kL9rQmBR+CC47qs7Wm/bN
         uk3PMOLC8w8befLEkHMcSEwA/eQCrUBvTvPT5HggkPceonbChvQKizbmg2CVsyG8DVVT
         BCNdeDS4ZB2412qUy08+9YLuhU5tuBGzdEqN2RBjSNbEdnc6X5QtsxiNe2x0rFT/s+B8
         s4x8eTTPj7eKf75UxX+WcCj9p9E7dm8YngRfEJ1zzu/ufdMDxm2Xym3jZXSEMwMfxGbx
         CwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718611540; x=1719216340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhK0l1wiP2QqjV41iED4AMmcoD6qMZOANZydgxIA9xw=;
        b=tVSw8n19rkRBjJxyrzEWfK5dBYY5Msl2b/VYoolAQDNOnBC6+S2Xpa0knwV7WSaDwJ
         YGRWNK2IrwQCzF8IzXi5VLL3D8BSzKirv257G3moSYNKv+nMWkXF/W7rnaNTfWwd+ODy
         lHlJPzoUC0lBF2gqaU17x7/k25JZkqnO09UGbLnTcuIF9jXxEzfxX+QZ45+jLwLGnz53
         eMImUlzi5ZerkGT+0c/nxeJoXp78HYkLlQ9BhaM9GqhKAUKFCtF+jozZOHYvPmm1ip8y
         ylYsLsI7v2bhlfU1NSRxVb6At7v99Ccel9u08fTVMKzfC7RR/p56yNJ0TSCH65KEyVo+
         YV7g==
X-Forwarded-Encrypted: i=1; AJvYcCVKtK0n5hPh6QCAVaV3vICwxVcqpjwgXdPRky3cNCYy1YZ9K9Zt1KY/cc2NSsKGyF4uAvyWmi4SMP/LJVzORQKgZnYNWAoy6Qbxpgs=
X-Gm-Message-State: AOJu0YwB+AnqdVXgl54QtIsNkRre2c43k7ByXXKVU4HQTrXcxiCbxdJy
	FbYSmV6k01C4fYh4Bku4V+c+Mr0ukYccUxva4G9r1E47//knRSzoxeYesvBwPEs=
X-Google-Smtp-Source: AGHT+IGAPWtrsBoKqiT6NA7h3nhAEtNjGh3ZlArWedHKrxD1LJKsjTkfQ0ARrSXU5FBmgRUnhtV3jg==
X-Received: by 2002:a05:600c:468d:b0:421:2ddf:aec4 with SMTP id 5b1f17b1804b1-42304844f6dmr74278975e9.30.1718611539796;
        Mon, 17 Jun 2024 01:05:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9263sm187819725e9.15.2024.06.17.01.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 01:05:39 -0700 (PDT)
Message-ID: <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
Date: Mon, 17 Jun 2024 10:05:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/06/2024 11:31, Mark Brown wrote:
> On Fri, Jun 14, 2024 at 09:27:43AM +0200, Alexandre Mergnat wrote:
>> This serie aim to add the following audio support for the Genio 350-evk:
>> - Playback
>>    - 2ch Headset Jack (Earphone)
>>    - 1ch Line-out Jack (Speaker)
>>    - 8ch HDMI Tx
> 
> I seem to remember you had review comments that needed addressing from
> AngeloGioacchino, why resend without addressing those?

I don't see any comment:
https://lore.kernel.org/lkml/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com/

-- 
Regards,
Alexandre

