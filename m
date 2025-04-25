Return-Path: <linux-media+bounces-30995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7AA9C099
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D713046186A
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174A4233133;
	Fri, 25 Apr 2025 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6dRx4G0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A036E233714
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 08:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568910; cv=none; b=PQxXovH0FQ+842Z5dcBWWAnR2h3dU8aBh+98OfeeF7Yf1ymlG9P+0s21wJhcqWPbfjApF8ll6UDuBztblsbHXSGDR+Ew5XvxzmPAoPM9e0ofv2Q5W8vpjL5ZIJUbRTJFQIwo7+bAnSphLF0iiiqmSYvKfCB4UuOz+ZK25iyFXJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568910; c=relaxed/simple;
	bh=yhR/DMNUsLoXzxcZzTVbpy7dFBpSONfeh5OrdvCdI3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMSWn9ikIArYh/9PXTuCULb5D9uUKDl9JWaP9bYZsxz+bexfvK1l65FsPFhLC2DLRrU87EtxSOmOWyNyCoEkfe2AhJdzHjLQ1hngCtyxXuFIND5BMKOP9qd/f3pHU26atb96Y4JkxUijd7DUtfC3ZIwuunRkdZXGO6YdnDwkJqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6dRx4G0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso18694905e9.1
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 01:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745568907; x=1746173707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOmCjcRK+hAIBdlZ1c/8FuJyTCPWLjtB+EaWUg4Zww0=;
        b=G6dRx4G052CQoBQh5rGjKVajJpRTFD0wkw5Moe8Czm1xl4FXghtWDCkk0B1Yf6mF1n
         WDhrDtZYwZa3NyDfw++PvsH8WHKDq40ovW3LL+MSQjhY/OqQX54D1tQNcGDl8gMMw6pO
         GJsSdR0yjM5892wqY3zMa1pZvHUeT3PkiBdKEHREWuvk9uN2vAh99WAUXoW9+/9TVFn4
         ON/5cmx5kckBIMk6Dc06qt3aiHuVg6ZwwVXA5bqvdA2IZwXSygBiZwDyJo2+iNIbKhdO
         yNfpkQSuSVZY0Oj797yqdgn9vFV2KRNt5vMyETRnQkcEXDRNB43f+or7s8ZraguoUREc
         8uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568907; x=1746173707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOmCjcRK+hAIBdlZ1c/8FuJyTCPWLjtB+EaWUg4Zww0=;
        b=GFpl5+A6/CrEYw4FIiCC0XUMkcpW+lN4PYK9MdVYtlVYF2EcOQOBUQwFUz+w76C0dO
         JwhmxQaTL6o+cOHdUpkIvyCDsXywCT1U+4MyuwyUe5xgzErocHaionvslDcvLOWgwWzt
         1N3d/BeLYyZQeqE3JOkNkPuiA4X4P3/uvQaOdrNccXvMsxIjrgZzUtlzvguADzfb5yFu
         XAORT3mYrMlvM+rDB87rjoZUb49mrG/svnqrGQ1dBPeNXvbbz8vX7aUDkpcpK3pEjOLx
         DAAY10mkTHSwYOdVbxinMhWE5MhQVLKwEV6fNz8jyrDB2kUjt+Dw6B3mymRoaOVdJHlW
         bjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIMENFevsQnv2gwOt2DDnBFVFCiWO+WHTf7DdqDN2NvY1TZ8qWX6NLgaEXlOegx75D/q8C8AFN19LZxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjfS47Lnol4YA+r9BML9oAeei/pjSEORbwOEUQhOFMAw9PDdpO
	ilvp3BEuoZA5xsCuTXtPPEbGN9+qDX4qxT1KJRZ/sneTzTpeKdxo0vfm3o9zdYU=
X-Gm-Gg: ASbGncv7Zlrt/XZ0zYQ8sZOpdoX7usTaVNwjUFJl09aeCukw8RdULiKgn+EtxgIXjqT
	O5fd7NChbchSETyE6PIkUIcAXTWBWg/LvI4ZEWonHJ9NglRfv66qVsMk+jkw4dxiTCTbmwCyymg
	U94SLp5PJW+EW6AZ1GpJ08iAdILhe+PugOS6RoKegHr5+75YjRmMXHTewfxDgluyS27JoMoktMh
	oWbTnBqCprMzC1m0kPC2VGJbChXpJnIOju0rH8M/umNzqi+f6Lqwb4HQtBRUgLuk8BYJsfsO6Td
	QEwSyjoMzyucdbmcKKsLYa2tXdYGhwQb2IFPBlXOBWazXtK2lH93n3Qu9yaWQqLoINhC119xFJQ
	HzlIo7w==
X-Google-Smtp-Source: AGHT+IFArmYr27DA7ibx/id0mfkgHdEKBaqJPnFVAg11wc2hZ8+jtUfhrut28no/zrRJn8c0h8Oe/w==
X-Received: by 2002:a05:600c:190b:b0:440:68db:a013 with SMTP id 5b1f17b1804b1-440a669e6c4mr9343505e9.25.1745568906841;
        Fri, 25 Apr 2025 01:15:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b8efsm50087765e9.6.2025.04.25.01.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:15:06 -0700 (PDT)
Message-ID: <a1a42c49-a73d-4107-ac48-f0d1a4d078b9@linaro.org>
Date: Fri, 25 Apr 2025 09:15:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] media: i2c: Add Omnivision OV02C10 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Hao Yao <hao.yao@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Ingvar Hagelund <ingvar@redpill-linpro.com>
References: <20250327164927.30741-1-hdegoede@redhat.com>
 <aAs689anIBXqRbyG@kekkonen.localdomain>
 <aAs8seKtD4DUJ7Zi@kekkonen.localdomain>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aAs8seKtD4DUJ7Zi@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 08:41, Sakari Ailus wrote:
> As the driver has a DT compatible string, now it'd be a good time to add
> the device to bindings in
> Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml .
> 
> Bryan?

Ping, yes on the way.

---
bod

