Return-Path: <linux-media+bounces-29272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04CA79736
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 23:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4B4170ACD
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 21:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836331F3BA9;
	Wed,  2 Apr 2025 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6vSiDTJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6336B19ABB6;
	Wed,  2 Apr 2025 21:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628122; cv=none; b=mVW9ghxPoT0GugmB3Q0AO/OxlJRo0tTmF8bzOKYGOISjn9LS+o9HN5tTZg5jAeNvn/+dqHGJ5V/wbIlvfjME0PqyonTQdK0wNwhQ/vp2W2QljcYUbJhTtJ4ZyoECt37+148mpxHiOgfa70D+JXhdKUsB8s3VHkIJvbg8ispp1HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628122; c=relaxed/simple;
	bh=F7HL0y/zfsqBNb6XykbzgkKIAC8f1sRaaFgXsmdNq4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ru2Fc7jr/rF0ws8qFWwpR4UeDDCrJ72JsEIzrjzP/zozxZucRyF1H3z5mWAdfRQKm5V5cDkiUNKe/JYxHeNEnrTGEoHh/8k9IIWEXSeUH4M+ZTkjtaJsqTx3Qr3dmvq8igNhqM745wZEq+PVDaDRi9OIsyYd4lKNeS2Ie2AY+kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6vSiDTJ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so433923a12.2;
        Wed, 02 Apr 2025 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743628119; x=1744232919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAztVybJddT2puyJxDJlz12FV+391zEWO1Z6LgN+3ZE=;
        b=d6vSiDTJZL+a+HG461X8i1gEOlz/VECikvpon3rTtIcRUXrfpGJl2S2eEKqktE9XHY
         Xt7o79w7K5QTTUEkcMCab9nxRPsHLRCXFdp6SAOzmMnRx+AmcD4xisXQkE4X9cVgczRd
         849i7ulosZpczati7n6uGDgF8lDv7q+/1SW4r9MLrwhgMzZ89sQQyDpSLIintr3P7Knp
         jH6TzeCu/NmdfyxaGcbTKinAk6ykjv02ZqZGxGALsKTIzZMvmuec/m3cO4Q6kTTm0jur
         2JBtAIy7Ustfs3KMzCmGzpiAi3ty8J3VYs1o/1TPM5UPmyl/4He/EAhpOWicZSadkvx7
         5FOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628119; x=1744232919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAztVybJddT2puyJxDJlz12FV+391zEWO1Z6LgN+3ZE=;
        b=W2n9mGzmxxGp8h454gPbt9Zg8CBRuX3z3nrxCMnCzjtZ1L3rtB8BnIbQdzEHfGMtqo
         SRTbej6v6q2VexrtFJJlEUcTVR853HW2Jg0JfsHOvOwD+gVvA1sXjv2x53DXIfKPnOVj
         acE8hGrR0dEliJTcx5mVgCZSUv3TXWAfnIE4OkrpkFpAxeDNUit9/b3L6wszS85e8bTs
         mOVdksHpyHlH/TvB3Ol4sYr7uF2Yl4qBBzyM7bdcdszQT1Kl8p1djd92R9ilCkomhbVI
         TtaJnTzHts7IhP4SgPDUxQYoRYP4o2zgP7mZSoj2bgYFl6xIJtg3v/dYFFPytWjMQKWo
         /LsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBwSzmzsketYjvzXjgUabfg1yNocJP1dh3AqBeTCtgX0Sd8I0DadIeYsZ8kEaFhhoiiWg3sAdZf0DmeuPjVWdV48ea9g==@vger.kernel.org, AJvYcCWOL0HTY5q3RH2NtLpB2kpZ0oTedRxdm6C/bVYY34cKhldvOeu5L19HVM9+Ycn81dlJeZ4ad/jfMbEXGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuijSUXm291mGfw9/+BwLK8gpM7W6fX4GxgiJJ0R98Obx3rc5g
	x3tQMK8IM8tyGVbIx8iZunFmVCNnikNv8Ru63CD5gnFLrWujLuKjP5mU+lMv4NyfqoCFYzVlO1O
	Pwdk/t/Av7+oqdhrGXpY3zuaaCfE=
X-Gm-Gg: ASbGnctHjwFQ1PjDgIb6l8CK374cUkucpKzxoN813oUWMCFuU024nsdimNB9Xk82fQ/
	EWQto5lZMBeYRfQmTWkUNX6Oc6Nl8h1a8lghanG1K/foY0MLVDdIDKEnIU3rw25eDN69+Y/JCJo
	rcPBcJm2b00zWlbh3Sajl2D1LXxg==
X-Google-Smtp-Source: AGHT+IG98hI0tAbjEKdav3jq1sQCdQZhpbQF3Z+WVgwpGErv0vINe2FTpd7w6PHE6W3WeXwICjiviF7QwsuFdzNSr+A=
X-Received: by 2002:a17:907:72cb:b0:ab7:1012:3ccb with SMTP id
 a640c23a62f3a-ac7bc0cf31dmr21075966b.14.1743628118356; Wed, 02 Apr 2025
 14:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com> <20250402202510.432888-6-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-6-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Apr 2025 00:08:01 +0300
X-Gm-Features: AQ5f1JpxbwUBsZcOyMleCe9s--k83dQT8DW_GAkYIIeq43tC8YQ3FFq7IEZnwJU
Message-ID: <CAHp75VdUtQTz-nArxX=seDgN46=2q4OAyrsq42jwXRomxDmedg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] platform/x86: int3472: Make regulator supply name configurable
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> This is a preparation patch for registering multiple regulators, which
> requires a different supply-name for each regulator. Make supply-name
> a parameter to skl_int3472_register_regulator() and use con-id to set it
> so that the existing int3472_gpio_map remapping can be used with it.
>
> Since supply-name now is a parameter, drop the fixed
> skl_int3472_regulator_map_supplies[] array and instead add lower- +

+ --> and ?

> upper-case mappings of the passed in supply-name to the regulator.

passed-in ?

...

Would be nice to have a comment explaining magic 12
> +#define GPIO_REGULATOR_NAME_LENGTH                             (12 + GPI=
O_SUPPPLY_NAME_LENGTH)

...

> +/* lower- + upper-case mapping */

+ --> and ?

--=20
With Best Regards,
Andy Shevchenko

