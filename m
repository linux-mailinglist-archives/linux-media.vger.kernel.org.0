Return-Path: <linux-media+bounces-35846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF167AE775B
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 08:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 943FE17A2D6
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 06:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D2B1F5849;
	Wed, 25 Jun 2025 06:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs6+urbb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322891F5827;
	Wed, 25 Jun 2025 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834098; cv=none; b=Y+LVDBU3xEG67YmA9HniisiLovy5gagJEt/jZVcR9dhj1gKt9NcXLcyXZbEy1SdPQJdQSC5xs+oRe48+XO75iUrpibIbjQIV3VoHF/VVdrrbtGekVpPHEjb7kVFPBu8ZGz56NXCaGU5WjUwEsy0OMmYOjvwfiGpL6KpvwsSuPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834098; c=relaxed/simple;
	bh=1S+vYDbLA0s2WG1o/HuAVK1qLit0osUBrErElzDk2/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enVGC/coQJti9/eyAlf5Dl4h9kL850demvo2ZAsJXEQ9LBNpDOIKnM5Brl8XRCvPvkrr3iGX+e5UgcLSOsjCBaQk713WmKy/slDhzEyS7GzROcGeNquSXJC+THtzeNuCKgOQJi9c5jNgF5kSgtN2DLF21BPvGsRTkdA4C5qSphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs6+urbb; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b544e7b4so6466304e87.3;
        Tue, 24 Jun 2025 23:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750834095; x=1751438895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KjyRtilrvcm2L/AXtGRLJufhbX/zHrNcNL/3/DavrS8=;
        b=bs6+urbbr+zrhrG9ZKr0aWzWAJlTRem4A8qO1Ufku1Kqx0MsnvHij6doprLfUDPYyx
         cqy3nIzwgHp2f5NgawRMQ3woApP1Oi5EprBGdXkRNDUhFvZw+vFJ2C7dFVG17tLmPrm0
         9FjwX0vB/5WXr86CfyrINDcddOj/Sca3dk+OSXmNGy4arulMoHjZSbvXs7Zl9flhmtnO
         AVDZuQPL+qZuIf67GiCtQyYKV/uaRZZit+Oknd/zFxGCWgn0Z64iTWY3ursVW3t1SLyA
         4V17paaDcAfkBvCvtR91IoFtnxrCW+g0/x53GTKmwoEUrAy/E+FauKuhsy6D6WLWMJlu
         c6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750834095; x=1751438895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjyRtilrvcm2L/AXtGRLJufhbX/zHrNcNL/3/DavrS8=;
        b=XNxoRph0bNmXauXO8seXZXVzQVTKxIvFkA3Ilc7UfEI8w9Nt5k/p1yWvRuAfgxS/4u
         ZCA1YA6P2ZuE9osfpVQEoDdPdVzZWD/LVCPTCo4OYJoBbC0vfj6pRy3zuLwxI5EKG6dW
         lXhMDNv3bO+83ac4HwPphQL7yHm0CyRQ2kO4U6Pkbrpdr7jmS55KMZuMiTQSlCdWs+2h
         lNvWsKNxdVgyZjJEHRZIwDg6v2t8eQ1HFC2siqyOLy17dK/MGzyEr03AtaUpQ6/MS4p6
         Oyfly5UPZYYQ6EngOfDNGy+KtKh3zAoSQmBHHmmfaozq5sqQrMjLIubkM8iMNOVZ23Hy
         Ur8g==
X-Forwarded-Encrypted: i=1; AJvYcCUanFrLwCOhuMs9uOKvbnunH5JP9DNqpqtHoKLDNeSKzzq46rtmHK6OMtoiXw0yRQZHVwMr9NdEQpr925g=@vger.kernel.org, AJvYcCX9pIFK6oKPxi6Bu7Mv0gSqrWFIAjGZstNox3mSTA7j6hl7fkRrYZuE13ygH8gkQa8kZVNyWsfMOFu2PxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVoHtnzvyIoaiv3ESbnHsOhhAhnGZ4LW+b+WwnmQR2YtW3LyAj
	p1nopjEqJuAkrRTUGXaWMnV2ndtyhLuIQK/9X1U/P3Wr58nYyOYhAZfT
X-Gm-Gg: ASbGnctDZAePbf0uZ8YO5rr5+GHz6Z+8OKKUnVI+UarFZkynCVmAI5HLCj1zLT3KUGX
	dU8ulI8f7++/VeQtpKt3MCFd/kstcDyRbW/NkOWdbAqgkjZMr+jDWlRgLquom1fZPkMRXpYftrc
	XVf2k/xYFIaT8txCq7FLhqMtlYCGCdoWtTptqQgSKeQxnoxHrKQBtXri6xen1MvEyHrgE20jDbj
	Y0asAjQMEog4b9S3qSM1AXbak8QGytlJyidOqrEjUKb98qap7GGhXgtcnU91pcdWLH2oU7RjdSY
	Ut19+jOMFQQIw84cgJUd+3pmUoFMBiQ8fNKNLl+SlcbN/2l/n2gHmhh7Ai3DvEaxybXILxBaHOg
	iJUGVng1FjYdnUzc+uEwyH+WsOV5nU7036MnCWFWO801USI1J09JvO6t0obLQwHGpxppg6wLeUB
	5ds7d07T/gEGWdYdHukqZHPGGJfTyhVQEHmTk=
X-Google-Smtp-Source: AGHT+IF/vlkFOWlLSTtvWsBVj8DxXv4ulk5QjgKHzBr4J5t5dfEhRd96ljhSekQ87pmkR0ybuy8Qrg==
X-Received: by 2002:a05:6512:3e1f:b0:553:a60d:6898 with SMTP id 2adb3069b0e04-554fde5873fmr509004e87.45.1750834094964;
        Tue, 24 Jun 2025 23:48:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:5c31:3ecd:351c:36bc? (2001-14ba-6e-3100-5c31-3ecd-351c-36bc.rev.dnainternet.fi. [2001:14ba:6e:3100:5c31:3ecd:351c:36bc])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbc36sm2077343e87.94.2025.06.24.23.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 23:48:13 -0700 (PDT)
Message-ID: <88c6b6ad-d867-4db5-9893-0c8cb4a7eaee@gmail.com>
Date: Wed, 25 Jun 2025 09:48:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] docs: Improve grammar, formatting in Video4Linux
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, hljunggr@cisco.com, ribalda@chromium.org,
 hverkuil@xs4all.nl, skhan@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250612172703.32293-1-hannelotta@gmail.com>
 <20250612172703.32293-2-hannelotta@gmail.com>
 <aFqKRyntONqsxJSs@valkosipuli.retiisi.eu>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <aFqKRyntONqsxJSs@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 6/24/25 14:21, Sakari Ailus wrote:
> Thanks for the patch. Documentation patches should have "Documentation: "
> prefix, similarly all media tree patches should have "media: " prefix. Also
> the lines may be up to 75 characters long.
> 
> The result is:
> 
> -----8<----------
> media: Documentation: Improve grammar, formatting in Video4Linux
> 
> Fix typos, punctuation and improve grammar and formatting in documentation
> for Video4Linux (V4L).
> -----8<----------
> 
> I changed this while applying the patch.
> 

Great, thank you! And thank you for the guidance, I have updated my 
notes for future reference.

Best regards / Ystävällisin terveisin

Hanne-Lotta Mäenpää



