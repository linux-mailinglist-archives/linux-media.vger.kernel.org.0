Return-Path: <linux-media+bounces-7019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4013487AFB5
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 19:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9E6E1F2D6B8
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 18:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6121F7A73A;
	Wed, 13 Mar 2024 17:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gSLH53Zu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A221C446C9
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710349918; cv=none; b=DzZaFsf44aviz0ktyDrvdDaKTO9ealwxjE1YxoPhoKvIHWARhAtmT3dRre0la+N6tBir0RMBrtmAI+A8gPkIghO9fOjC+B+eT9I4AuPlvCEXag684kBYZtuWz4WO3C7uQ1wzCR1KPF4gAl06cqHyvtIzRBnoacp101LZf88avJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710349918; c=relaxed/simple;
	bh=yxoN1G+uMZp38YC1jCCVFNGNRYjvjcKz2fKoJoCswhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwpKrRzG1sNmbuOo3q3aO5CseYzG2WhSd4wOlB3eSZDSusOvvAsLx+4nDedjo17P6QwhDKoesA3kYmf2Kn8C2nFhvEw8U6X0PQk8Vm3tIZZSTHnPFOZ1FBgvGxr/xFjzis+qU0ECLmcAUvHWFQe4DeWhpS9D1rSEBCYluhFpH0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gSLH53Zu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4132a5b38fbso694575e9.0
        for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710349913; x=1710954713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DfCyEn4BBkDtIZTeeb4WXSUMa8UuweDcHmhz18/rnUY=;
        b=gSLH53Zuf44lWqdRb6iA7fAwPJb93ikqPpRNFOPpYfvooXiydYnU+odaOlRyO42z6u
         VXotUZw8YSGf6fcHH6+NQ7MX58v2AMxhatFk4F/eFXsYlS50Xk5RhDNN2rGQuaCnuMUa
         7YifQyaqQs6KJfmP8+OKSAHjcHg8uoq0QdKQnfhnIt4goBeNoKKf92fO4n5O7XnzDuSP
         4DpQisXF63e9RiSfAGbfJG98E2cGKIVJ4Ikw++1/+DL/U5RQ1Ht77cNgLT9OWfHUCxkt
         yvu7t2IdNmeLpZJVWzthSlAVsSTgSl+zUezXUkoUuX5KJhsGLxUU35m+CRGs1DRoFR2P
         U9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710349913; x=1710954713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfCyEn4BBkDtIZTeeb4WXSUMa8UuweDcHmhz18/rnUY=;
        b=NH5kT0MUO5U8DNj2rq50wLMWMSJyeewt1ta9Kj8/5SiKE3lScd/OP6aWpiD0kbDHs7
         aU7iM6GFw+gQ4zvIdl3XhO/NmQBx0gZnHdnQgDMjPoSy7wOHQ3yLpBZ8Rl/Wcx7GZ5Il
         xrXgP4lbRoTaA0JuaWFrqHT+oQssXOg8uroPf0BqHGbclyPowVHmokgMAhEPYk/fVaZy
         v88dRcOH4Gen7az+pxk3CgCw6s2t1BrUVGMbvmxKJYl6v96MqW7elcj0EcIKMvu/qKWY
         ws+qT/TuAHxr1usDJSqikdZfhHlM4kcGZNTUprEEB5GRuflOdqIPp2DeqdxGvr1wuNBA
         SSqg==
X-Forwarded-Encrypted: i=1; AJvYcCWFkWtFFEEdBgu76Kkw4OfsKzdrW6YrcLw4yMyIZq4/HT/iifVXvgncM3YpmyFzg1ycFd9HB1ZoIAt3xH67Yeojt7rDYzt+Y5wxH8E=
X-Gm-Message-State: AOJu0YyebFgTFO1C6tMbXyYGCJ6nn/Hjnlb612E52J4OW36coKnR+goK
	VAjdXlNvvfpahYZxdMse+ScSbjNsPdqXfNl4jodxq4jLdhnsUp5GLEWUA+9k8mM=
X-Google-Smtp-Source: AGHT+IFz1KXw55V676KHOL/rzoBQjJ9Rihc/CWALu4Z7kIN17vZX/My8C/6xcsm62UiChBonG2y1pw==
X-Received: by 2002:a05:600c:450c:b0:413:1285:6e40 with SMTP id t12-20020a05600c450c00b0041312856e40mr442329wmo.20.1710349912671;
        Wed, 13 Mar 2024 10:11:52 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ay23-20020a05600c1e1700b00412ff941abasm2920026wmb.21.2024.03.13.10.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 10:11:52 -0700 (PDT)
Message-ID: <ef4da1f6-d3c5-4484-8df5-1a04df4453a0@baylibre.com>
Date: Wed, 13 Mar 2024 18:11:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
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
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/02/2024 17:09, Mark Brown wrote:
>> index 000000000000..13e95c227114
>> --- /dev/null
>> +++ b/sound/soc/codecs/mt6357.c
>> @@ -0,0 +1,1805 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MT6357 ALSA SoC audio codec driver
>> + *
> Please use a C++ comment for the whole comment to make it clearer that
> this is intentional.

If I do that, the checkpatch raise a warning:

WARNING: Improper SPDX comment style for 
'sound/soc/mediatek/mt8365/mt8365-afe-clk.c', please use '//' instead
#22: FILE: sound/soc/mediatek/mt8365/mt8365-afe-clk.c:1:
+/* SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#22: FILE: sound/soc/mediatek/mt8365/mt8365-afe-clk.c:1:
+/* SPDX-License-Identifier: GPL-2.0

even if I put:
/* SPDX-License-Identifier: GPL-2.0 */

IMO, the checkpatch tool should be fixed/update first.

-- 
Regards,
Alexandre

