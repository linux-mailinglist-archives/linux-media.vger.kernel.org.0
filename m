Return-Path: <linux-media+bounces-6907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EACC58796AA
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 15:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 289E61C21B71
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 14:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70D47BAF9;
	Tue, 12 Mar 2024 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y4W57fqD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AFD7AE72
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710254690; cv=none; b=MVJWJBI3smQ3WY4kFN/IeMbEEO/VL8wQdPSEazkCbNKrnDifrrbOKKmoV7F2SyO3t1c+rEzkT8UOIKV8hp1wSHf3Jv+UuG9wDofPE07WQ9ozInuPAJmOsmXQFOFin0s66xplSHWSv4/Nk2Hq7Gg+7R8fN1k80xfnqDGdMfejLNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710254690; c=relaxed/simple;
	bh=l7PXpZXI01MHCt+hHEmDQ8I/JZ4vbfrmDPTT2vYwv68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doxhJ6SLSLItLBk0sNl12J0lduTPUeptWzuFQsbu7R5T+jeC68qSaoPGqMpXbqUQE7r+lixF6hL0LvkJMVcwcQd8rlu/qQQT8mWHyamntyfRGvAO22enbLKG0CrxZLJJ8nONBsZMrj7rpEMn3iYEuT+qsN7EASr1IWLJ5k5O0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y4W57fqD; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d26227d508so84593461fa.2
        for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710254687; x=1710859487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmj+F0z52Li+K1sTvSePjF0GjlsGyqeJSli7wVVMSxg=;
        b=y4W57fqDpXLk9d6w30F7ClHmWQSP+T4jklHSO7kY6nrPHs2ipWmAxfymt/rToDL6Pc
         KvwIlqIZOVv8zPB+YTf41D627J3/RBSZxyM1ft4GbGMHfMoekm7fBOxP5o2j/PPjcdic
         IJfmjeGuXJ54F7bVoUdDKnbuF1lN2+or/IXwcbcqkeLileMzByz7MyBHtkDP4r1APRZL
         Cayc6H3kpsTuVjnKu/1OtQ/Iec/utwp5OGMRUymFyvxPYwnn6k7BsYQte/k9L0X+katC
         dEnEo8b2OEossfJRoaLcpTFqeOwnRjMEXBhQDYbq31azB5yKWEwjE03HmtO7taSYkRnX
         C3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710254687; x=1710859487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmj+F0z52Li+K1sTvSePjF0GjlsGyqeJSli7wVVMSxg=;
        b=YFHUeZi0KhLzo0iUYiIVjE5ZikD9q42UyxK4l+JFxz0tjjiJJliFKDXbXnrDhhAL3t
         M92bidqtYuQTrah0II0E9ieRtO/2do4nW8DYFDl+I/6arMfPmMm8iwxyyoyULY8Jt3Yg
         /uxlogKDRbzGu/UtSEj1IK6VNheFJIB2c7/b+wV35h2KSbXkY1VLXDrpvHK/zkCA+apb
         jQOymJZaeP0a5XIwa6ED8fX6oTdk8ZZ4QT2ndORVMY6ddAUU7YmKn5HT/LNoLbuplrB+
         kji7+iZ9YP7xwjDP8vohZK+S1VURZci/UKWzmBtqrKiVanydYXGAkO+Z9nQ8rJF7SNkw
         9JDA==
X-Gm-Message-State: AOJu0Ywj/ro1k2psKmY5B0T7Qku/C0n/hyRpBUxOjnYSJ+aBfXTlby3q
	kIgIT4uWzg4PoFzn6LjwDw7httCDSl9qEMWppNuqJ2RzwfC8rHTzu/5YOsz1NSU=
X-Google-Smtp-Source: AGHT+IFFBjF9LuTxcCz5RrKNbfWJ5SkfQz9Wt8O54/LYbK1vtsUcRNeb2QIqZOgtU22jErtQ9pTySQ==
X-Received: by 2002:a2e:9804:0:b0:2d4:529c:f490 with SMTP id a4-20020a2e9804000000b002d4529cf490mr1424131ljj.35.1710254686722;
        Tue, 12 Mar 2024 07:44:46 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u10-20020a2e9b0a000000b002d406e8f01asm1626480lji.71.2024.03.12.07.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 07:44:46 -0700 (PDT)
Message-ID: <9af62237-98ec-4130-8523-f6c9cb0ad281@linaro.org>
Date: Tue, 12 Mar 2024 15:44:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] media: qcom: camss: Add per sub-device type resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240227122415.491-1-quic_grosikop@quicinc.com>
 <20240227122415.491-2-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240227122415.491-2-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/24 13:24, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Currently resources structure grows with additional parameters required for
> each sub-deivce. However each sub-device has some specific resources or
> configurations which need to be passed during the initialization.
> 
> This change adds per sub-device type structure to simplify the things
> and removes the magical void pointer to hw_ops.

I'm not quite sure what the benefit here is, as opposed to simply
extending <name>_device?

Generally, I think the driver state as of today is somewhat backwards..

We define a common set of resources, and then assign them subdev-specific
ops, instead of defining the subdev and consuming clocks/pds/resets
within a subdevice there..

Konrad

