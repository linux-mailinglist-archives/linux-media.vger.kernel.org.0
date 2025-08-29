Return-Path: <linux-media+bounces-41345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D3B3C07D
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43363A610F5
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C90322DDF;
	Fri, 29 Aug 2025 16:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yk1hHyns"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED99321F23
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 16:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756484374; cv=none; b=CSBLcAClREwA/Itpgw3HnQkzwh3NouKPjW+NuwkcsIQPHYSnomrqYwZboS/ePkXlwE9PnCnQkg490gO4K2aAN8UKVMrUlmEMT514gfCnz2KG6rBR7Wnf20eI2TwHz14FxyGsosfHHIlRf+ugtXfL7VTRO1JJk3lPp02X7H3tifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756484374; c=relaxed/simple;
	bh=DEb+rLyFLAAC2UTbNeB5RKFyMlAT9QhJEkzS1NHnSv0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RVkmwjYBsLvzbzqRYlUSRbAIMUwD4DephFHF3Az5ypa8AqQ5a+wwxs7ZSA8CH/gFa6zCamb0V3EdaMW/Xz3d5YSK47QRA5qPgL82y5RIkC2PeRQd3q/o53qg7/3SSdLYp+XWf+5PhtvP2w29jkCQuVTQIbZgvSg6rYwk3j2q+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yk1hHyns; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f54c9a123so428801e87.0
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 09:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756484371; x=1757089171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDzPs5+Y62RH0rRjBPSWe/GpABAvJ0cBPrKFUSkTbdI=;
        b=yk1hHynsB5xdXf1AF8wE0HiieaHWsthWcJiyL3Hdis4cH66OjMygIoy3SC1IVciZ4c
         5uM2IPHRqb5/vblr7k9O0764DLKhIKfMT0n2Ww7nAKelliommJ/7Qq+nkzAZIVggP4n8
         wGBQG7RWFe+V3Uz9bCQqd8wsTKh/TznCtC5dWX+yBMcQdTJe29cenKr1qrNYBctq6G7I
         YdTbPjDbgyZ6TicwtvunJmWcEX4xPPN4RHZvppwG5EG/C3UnrVIwUIk9yJJprlUbGA2b
         Wp5yT+vyTyDhQJVMcbp/4KN12u+a1Y6/MTyqh8QkezaRkEk2rLQnQU9rvEF38hVm6AXT
         woXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756484371; x=1757089171;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDzPs5+Y62RH0rRjBPSWe/GpABAvJ0cBPrKFUSkTbdI=;
        b=R9WaDZVAme+53hSZwg/UPZVceZWPAS4PP6Fj0+yVUwhiyr/ER3h4tj5y6VZksXNfVE
         wlNFyvMhsWKdgeRRoPMf7qPPRD6tWlyeOwZXRks57Tr/gwY40+BihfLgn1s5acETa15p
         O0VnYorbnNq63SlG9BLd9+eyCWvgsvmHovUZOsHQaUNAe4jVRvHnnTDumxLJ7d9xgPiJ
         8axmgcxxXfkwnzjFDFbvp13AOpXW7btWts3RpcnyTIQ1oRakoKlufpXZM7r9t+k7TYuo
         RHBE2OfFKdWXNLxqRS2EKnbTD3djUstEtZp53/PPazmfnU0ejaNKqGeANhqEg5Ut2h/f
         XGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs2DDTM4hiDOXWlXk68oAZgXTGIAZjnZ79r6bLLKsVdwGDegEk5+PfhSv8nu8O+c0iolbtPJyRJPZNrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEQ52Hb/9V9EDZfMlPZlGyPI+6mg+HL9OtHCcFSZdTS0h+xzP
	wJrJgoosw8qp4y4jSdC2RkbK1zvb0zNbM/LyGdR4tVd0B0+FtX4TDiD8v4bfxFZY7p0=
X-Gm-Gg: ASbGncvtcJcrvhWm+lRiqZ4Ux2YYM3cUrrtE7PUlLdfIuF1h2rBn+Sfu/fCafOvgxu3
	1f+YyfBKz5JtojxawOF7vTHRn2KHupfYZC/QHROnfNkGywtP0Fw7j+JEMFdxin+qPD/51Lh8FLa
	l8fyhaoDcowUSK0XDyEZZbreO+zfDvRSOZ2RZdhdOqkLWCUnLjQL4prsLIq/3eqvPE7bLB96hnf
	LosVGhYBCClPvvRcd8xy/jTOEGT1eNndR5PsfFxXQytb+Ye5XLQIsXBjLSxAxkVwOCMz+qsSQEj
	xsl1YsIk5+4eqQ33UQO/FGjhE9kth1xL89/lfnqVr55rExElJFE+3AhOTqbQ5opz7JaQWExcOYh
	AaJehOsChyEaloOzbh6Y9MFztNtlIO8GGKG0Pmt+xaUuLcoDUbx/N8UIi3oRATrHctfWwVzwjWx
	um
X-Google-Smtp-Source: AGHT+IGBA0Om8aXqgaQfO5bqLiwz99OhoM1dRN5Nb9hQZ+wq5lz/yuN7Lkr8Q2HfRntN3vzDhj65mQ==
X-Received: by 2002:a05:6512:39d1:b0:55f:4741:a82e with SMTP id 2adb3069b0e04-55f68ceae50mr396339e87.11.1756484371248;
        Fri, 29 Aug 2025 09:19:31 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678501f4sm731590e87.105.2025.08.29.09.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 09:19:30 -0700 (PDT)
Message-ID: <f27b035a-91f0-4f62-b90f-3370b25e828a@linaro.org>
Date: Fri, 29 Aug 2025 19:19:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: i2c: Add OmniVision OG0VE1B image sensor
 driver
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250829144242.236732-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250829144242.236732-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/25 17:42, Vladimir Zapolskiy wrote:
> OmniVision OG0VE1B is a monochrome image sensor, which produces frames
> in 8/10-bit raw output format and supports 640x480, 400x400, 200x200
> and 100x100 output image resolution modes.
> 
> At the moment the only supported resolution in the device driver is
> 640x480@120fps (Y8).
> 
> The driver version is based on top of media/master, which contains
> a new devm_v4l2_sensor_clk_get() helper function.
> 
> Output of v4l2-compliance tool from v4l-utils-1.20.0:
> 
> ----8<----
> v4l2-compliance SHA: not available, 64 bits, 64-bit time_t
> 
> Compliance test for device /dev/v4l-subdev30:
> 
> Required ioctls:
> 
> Allow for multiple opens:
> 	test second /dev/v4l-subdev28 open: OK

FWIW I've copied a part of the output from querying another sensor,
the outputs are one in one equal anyways.

-- 
Best wishes,
Vladimir

