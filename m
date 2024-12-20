Return-Path: <linux-media+bounces-23924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC29F945D
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1B437A43D0
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EAF2163A0;
	Fri, 20 Dec 2024 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcrXfleN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B6204567
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705122; cv=none; b=cH49rGrgF13Bg+8/8KT4/p6kAiwq8WtPvGp/K9lQZmUHd2//wc3FAl7SCs9Cyl1sDVwMtthcyU338inRGvKA8wE+bJxv0cQQtcsfoYaBh0qQ0pUOU7Ep9p2syKZXllNG2CbT338H0aU5X7E+55IqLIJBNO0Co3Bqzyg9vV8td+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705122; c=relaxed/simple;
	bh=+3Wq8Opq8tC1YJ0fDPQWda6MG+vlVM2A8ifHMeYY0kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5EuuPoKYsdOBMLVw8xB4ZRFpQW8hRCFFUR1wIa4mqBaamHe3tL7u58sZ9F4kpeGGg+zdjEOsjX4ri+/Z0fr+LqGlr0YGgtUGnvKhHWThfdVOvSmMiqQFebky7bezzUbLMI1ndirWu7mvkD2iARD2QKXtqVPJa6a1yqHyMjAlGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcrXfleN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso1926566f8f.2
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705119; x=1735309919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOAqRlXQa8JCXVuHHF2DEDlqulTYopq2yk+a+zQWuKc=;
        b=OcrXfleNlG1UoFvU9dVbAjUs4bAzNAGGtKhC071ib8z5iyX2Bv7iqm4eUZG0tvULXq
         fTkl8AoY13dyopijw+T94l6nrOGRuHDT+c3/9aTYIz3XQrLKcmgr221h9oZPgMTuky0Q
         mesaXtDRv/i4bz6FnR+8ishw4F6GI52DxxanXSgg0LQUINKbsrCkBGga12OQGEeMS7IS
         JYU89+q2li9+/VHPatG0r9LniXx6u+bD9NQlwK+9TvAhQDomlhwi+S0r2xNl9ik1TJGE
         UL5siTT1WY6aOQpFDWN4XN91GDnyyCU5mEwKYeQtLCEgWk5kzX2D3nhsHHnb56GSc2S4
         9nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705119; x=1735309919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOAqRlXQa8JCXVuHHF2DEDlqulTYopq2yk+a+zQWuKc=;
        b=VVawmUY8qboOKW5fv8jVXXSX/4Jxb898BdlZ/magU7GGx0p1lS5R1T/NZqknxC5zFj
         lYsKsCIpXuLnwi2ZLpHvZgkc2cT++kSgziCFzQDzqVTDvujZlklMn1W7p6iT5P83GYR+
         5HRv4n0+lObg1VPxkM74vVmWYH4PskR+huZDNpkXNdsi1kcN6OKmrrrFaROWrrpvTUfw
         gg48XorZ4TVATXkZoKJ4qYR0LdaPH8MPc/CS/Msri82UMUg9gzXDcwYmdbbwGbRLlvhL
         NtsuS7TK6Puy5JGX6RKb8bFsSfLSY6uv4YTVHc4v5O8lQLVjkznWO2ltxOVpbGXeeQE/
         yIMw==
X-Forwarded-Encrypted: i=1; AJvYcCUEms51t1t8vuc716kLa9bnCvsR1Oj1HZePu4ZRmeW6Vpx7xY1AuCVPoSRmykDiRay8Aqt+CD0Z355DtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB5Zu/580v5q+hbCLeUk3EGBBTfwggVJg7tgP/nXZHffOMMzh3
	S+IGc89MYDj0P1VVs3Zw7SJdSS+rBa1hhlKpPLUF+kX7RV2w/X38M6GPdL/kHSQ=
X-Gm-Gg: ASbGnctloJBIvxWn0lfFeqaOK4lZiDWvLDqARDglQZphDDub7KU7djBxwTxuC3Mn6cm
	dMI/jgOjNGVxq7xvMDq+ersonzjeCxbxoPL2NLdeqheDq4vxVALN7p+/aP9DAwqms5yfNagFNxW
	a2n3xxqqxbqyPed7aXeN73rlEZ7Nw0p7FKIGm26dpmnGVLEmmr7ZtebbpbiSb0xdF+hKp1P5X7d
	fQoNh4LK3/TZwFZqb/JtS0HOxbvQ58Yw4H8IyJwjS0k276mu76G95I3RVWRRvsz6YYQdw==
X-Google-Smtp-Source: AGHT+IG9+A7tfosiPKy06RZU1gioqBjN0EaOBmHCSUziS+dyb4nGLvmLEPLX8m9e+Zxtnm3T97aYrg==
X-Received: by 2002:a5d:648d:0:b0:382:4b9a:f51f with SMTP id ffacd0b85a97d-38a223f82afmr3575290f8f.47.1734705118675;
        Fri, 20 Dec 2024 06:31:58 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828cc8sm4196440f8f.17.2024.12.20.06.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:31:58 -0800 (PST)
Message-ID: <cd4d44bb-727e-4ec9-a607-f2e316cdbb8e@linaro.org>
Date: Fri, 20 Dec 2024 14:31:57 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] media: ov08x40: Improve ov08x40_identify_module()
 error logging
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-7-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219134940.15472-7-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 13:49, Hans de Goede wrote:
> ov08x40_identify_module() already logs an error if the read ID mismatches,
> so having its caller also log an error results in 2 errors in this case.
> 
> Add error logging to the ID register read in ov08x40_identify_module() and
> drop the error logging in the caller.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

