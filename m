Return-Path: <linux-media+bounces-16275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D86D95168A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 10:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AC4B285D88
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 08:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E971422AB;
	Wed, 14 Aug 2024 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zpuLtBTy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7C13D28F
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723623799; cv=none; b=EPa1gMFw4Pf2L9LrbEbTNcmsu3peKdz5L2PDuHkfSDl4aPMaV4YcXOyxttQMj8/RUpJ3TWTisuKtTekXnTnaHj+6oxeac8NwB4jhljQsEE9ckq0RsdEkP4fJZxCXixbS5/plZDd1jIQotxJxL6wDnrMHU0Wc1bzRot2G0I9vKMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723623799; c=relaxed/simple;
	bh=0CSWgPhv1C1tSHCnjvH3fpngV0BuO55p5vt/diV7PqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czAWZspt83gBw8hKX1jP2RjRaQJUgcQ3CCsA8NNEVOLWjrhGFrzlw1kjQGYheGQ+wRdRqV25LUZhg78Ku82cBqmL7r/8VhRethdx7XzaQ3D1m/VG7cBFWSIYEQg6LZ+5CgZB5HVrzh2ecU2e5XJ+BpBya79QCcYnM5RLTXYW6n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zpuLtBTy; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-530d0882370so6185266e87.3
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723623795; x=1724228595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=;
        b=zpuLtBTydfE1azZCI3cyYdocQ+iOvRBLl6Ms6Tet/7GuwratUJg/VS0tda6q1iUI/X
         72AZhFCMUN89tBjhRar4OnWRqVdgkChboJMrma5jPeDYe9eI5fU4/sE89sJfqaXMVA3g
         uM5e7BkuY9YmbJoJVQ7kACL2V+VrFZOUm8xeW+RizdEMfBYXK3ftHyPXIhJ+0biJDA8v
         5cwNPhzLyH6GJVGobCa3/P6c2lbk0W65zDAIfFUZFLY4bI5hx+8SE9pclcZ7nlKUqVnF
         DX1ZZG0DjyQRTjuswxnw52u/Rl6uTkiLAIVuTNqE4EnECXkoSfPAJQJ62x8HVSFnmyNy
         /EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623795; x=1724228595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=;
        b=vquqc+7QFv/GMx5CpZ+NB4uqIrvskIHtoqY7lBvAILqmu7I3693BP7MlpYUmgJ6hsq
         sd+VLqSy1Ii8r+9E1MWWsWs9YhVGZp7H2KlnZ5tjSk850qs3T8VVfD0bqa4ghXff08bn
         Ns/GniqQVLww9Q/K+1Jm9AnAQurycBw6sHhEU5qK9a6bLXlonYAD5I3z4Nvi04eD6u4r
         8zG8OHgSJwMyXbWz0T5G2uGG+lJtKIfxdpLbw47ByR7FK8FPcgJybrkpsIZU8rcc7cXP
         9b6zmScGpxTDGltZaVqrdz6uipXK39diy3mP9QC9mAS7v2VifOgqKyM3Zgvp6LdWOrfB
         k4vg==
X-Forwarded-Encrypted: i=1; AJvYcCXYP5RvUlUsD/JhZtRbxu7223Ls94Bn558zva0cMN59wPMOsiO8Fb1j0rAFCWPOJFyQB+xt7tVy4wltUWmhOiSFmmLzLcpTmJVvGxk=
X-Gm-Message-State: AOJu0YzKT++RKMxeV60CSU00pjTmzWVQKRRhG8RGKBVfsC5ZitE+TEwE
	Fy5Dr/gWakDF3c4FlF+2V3jqKv5TCT9ZYwn0wHwH5NqacGMG9z2+c0bh4dv6mm0=
X-Google-Smtp-Source: AGHT+IG6QSK40+UiY4L+iFUDmpExRkRbgPPw1TX9OKeTaKxcEceJXBh+o1azq0f3RjCLgFSJ+P0yEg==
X-Received: by 2002:a05:6512:3e0c:b0:530:ad8b:de11 with SMTP id 2adb3069b0e04-532eda8e5ddmr1174870e87.9.1723623795153;
        Wed, 14 Aug 2024 01:23:15 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51ebcdsm12266411f8f.78.2024.08.14.01.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:23:14 -0700 (PDT)
Message-ID: <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
Date: Wed, 14 Aug 2024 10:23:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] Add audio support for the MediaTek Genio 350-evk
 board
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: khilman@baylibre.com, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys !

Simple gentle ping, the serie seems ready to be applied.
Thanks

-- 
Regards,
Alexandre

