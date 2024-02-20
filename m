Return-Path: <linux-media+bounces-5510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A186885CA30
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 22:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578AA1F22E10
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 21:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AE7152DF9;
	Tue, 20 Feb 2024 21:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ggk/O8Es"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845A151CFD
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 21:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708465511; cv=none; b=IX8DPB5+wVLTBhNo5om5Ll+Fm5itGwxu1hi/5WhQIhQYIsjMJ9CqOhd10mwm34rxNODSNTcA2CGWRGlNFRe1DcxONvXPPNn/JGtONBbiahF0S/TvmDfKlaw9qje4O6+Br5K2xUyJ30+3WtqitQZbRvZc7U3ZPj4dEBzcT/9fWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708465511; c=relaxed/simple;
	bh=UEui0s6V28sWMfEUHl6LqMaOVpgoXIEPXXvPPkx8reM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihFG8cchPYS+abogNCIqveyK4GSzuToCT2cY0Ypbtk5+aS0VBB0py4ycXULdFx7+P8nMzCl/nvnkK2YyRB/M218GgrsVWJHcyvRjg6H9z/1h1AShoEixnwOITvtp3x45F04x1g9PVJuyLTqVC5rB6z2HYfLJV7XnBoX1MzLwYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ggk/O8Es; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-363acc3bbd8so5519325ab.1
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 13:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708465509; x=1709070309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEui0s6V28sWMfEUHl6LqMaOVpgoXIEPXXvPPkx8reM=;
        b=Ggk/O8EsqmjD8rehAeUDCfHRpdpF/h9el0RD39rocyV7hof7fa7tJ7Z3gQLUiSdkZR
         MMKU9MN9niMlaZhDr0KZEjN5tsOR6az9vFLfuH7UYpNccZKFkbsWQlRLLNarWOUfD+MB
         JMelWZUbKAcUE+/qEIDmbN+oJHkDN7+uE5Xl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708465509; x=1709070309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEui0s6V28sWMfEUHl6LqMaOVpgoXIEPXXvPPkx8reM=;
        b=lP2YoGDiSPHfzu4+8b4hj5lHqmfxa+mp9aze+1wkMN9xlgaU79R1QBK4rRtAcnCUwp
         CoWNrgqJouNLx+vQHzm05iNcpaAyFQBuA1a6R5X9pZcqP7LwV3JcYnnKzI63RC4fwXAo
         LllIXyvHJnhLDQEp9YndeYsgRfDOJQJwhuh/uyO/Bkk1rGVjDCeqgfFknL+A1+iI2pbU
         mmixivHQ0OpqDDKePl/VEIc0HG1mLGqef9qJPxxbjM8PtxwVAsVp4kiCg40ehg1+yv2y
         u7bYed2AVBlMpHA8yL+uOKOZ15/tdzXFdEnsVOwY2mVAQeK1R1IwZOgxAFMy3agqSdch
         RjGQ==
X-Gm-Message-State: AOJu0Yxy3v5GDhIUwR3i5aa0Hhcd1Uc/hlDZ0tC2nn+5ZAYjXP4lUMfc
	h3+dPxUXfAD13eUASNZK1hsqmo/TkzhcSXs/6tt4sRJVMbEIyTlRBvgY+WWhBDQ=
X-Google-Smtp-Source: AGHT+IFOVgf4hVeQjVESSY+ggbpz68BsoWauoggn89sDMwFWL/rPxd3AtWFF6ezQRMu04/Di9Qho2w==
X-Received: by 2002:a6b:c844:0:b0:7c7:224e:ae90 with SMTP id y65-20020a6bc844000000b007c7224eae90mr12163072iof.0.1708465509026;
        Tue, 20 Feb 2024 13:45:09 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id i22-20020a02c616000000b00474415415a8sm94935jan.100.2024.02.20.13.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 13:45:08 -0800 (PST)
Message-ID: <663c539b-deb2-4cb0-8e9c-325bc841b9a1@linuxfoundation.org>
Date: Tue, 20 Feb 2024 14:45:08 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Spelling correction patch
Content-Language: en-US
To: prabhav kumar <pvkumar5749404@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240217074353.19445-1-pvkumar5749404@gmail.com>
 <e2b42c87-f87e-4d09-b17f-82ed4002e989@linuxfoundation.org>
 <CAH8oh8U84MGb+9g5013NHcBcO=9sQzpBFEm_-7sD1eu7JmTUbQ@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAH8oh8U84MGb+9g5013NHcBcO=9sQzpBFEm_-7sD1eu7JmTUbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/24 14:38, prabhav kumar wrote:
> I had missed some names from the get_maintainer.pl <http://get_maintainer.pl> , Will update and send a v2 with proper change log and a summary.
> Thanks,
> Prabhav


No top post please. Review kernel submission guidelines
on how to respond to review comments.

thanks,
-- Shuah

