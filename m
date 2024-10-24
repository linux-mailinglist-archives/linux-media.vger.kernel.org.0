Return-Path: <linux-media+bounces-20175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5989AE145
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 11:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80EB11F22DF4
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 09:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C0919CD16;
	Thu, 24 Oct 2024 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AnvbxUNw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086D7170826
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729763038; cv=none; b=j8uY9PQ/uVEm9OQGdZNfI6rf2+Rjb7uZxbD3uiWvt/BmDd2W6lEnemlspdD8yUepIT1d/jdM4Rc44sbFec7LXxBqQVbrKRdr3oHWiUEMseq5YTgm9zXmK8Mx7Fv4XpAEJue4SsJ6YQfknwGORydZajp4gDVVAsYBKk8miB+O3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729763038; c=relaxed/simple;
	bh=TrcuEorroCqiG8aJF/Su8Y9aX/UU3AU4rJyH7xqQIwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/t9G6AgdsEy6wjsxvJk6nHHiHlX8DtoPZ4GMhyF9fQsdTn+gFaELlKOZ545VHNBMyypqi3pgGRP7TmJDlvE0xGcTdDz0fr3fOoX6x5WqzQFdh0HB2eUDh4RGqjSWKJMoNEZXEdMVbYuhwst+gM6TCwFUh11YZAU7CXxlnBlJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AnvbxUNw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso87933266b.1
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729763034; x=1730367834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=peO/rXf0Tq3jGX06VweS3LG42dv1VhryL64e2w6n8kg=;
        b=AnvbxUNwbR2fur/hoDZtldqsp/0NKnkolwI4D6d3VLS3aFqGuIWLm9oIKILibEnxO8
         9oeihlONjQC5vrcr72qXMGibZULA4EYExXpRTNz6xOdVf/DbNzdWrvq6QIsbkseYSGOP
         ZcNBaRm/BoWXwSdp4VBskiUWu5edIOcY093vS9gQQVZOjXIxt818ax0Ye6+F7Z+DTVqH
         C9d5bUKYdilJBKLnyfLxkSAv6uGAkwtsgcX6ooYS9LRIj55up6wjn0Vov+pU/UMeIQJl
         YOcqULb6xJjGB0Y2b3N6XMOW8bdN5/+4G/a15rmLbH6MoCCGuLUKiLOjNal+pKJIXbo5
         gtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729763034; x=1730367834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peO/rXf0Tq3jGX06VweS3LG42dv1VhryL64e2w6n8kg=;
        b=o57oWUyoeHsF5MOq8veeMO6ANYisgka1B0PxEpIzOok11+qmEhNW2k8GMzu7O/1S5u
         aSwz0kNmx13rTLYADGl/o7P96w5cE7kJ8QCuDKNkeJp/fM18BnjHsdvXCey7cEZ7zYL9
         qZNKXtSPXDHTPQJ0pyoa7ihnTiPeDYe0Y6KaFFCVQfyQogb1xY391/iXZxSumbuojxlZ
         27XpSFKpATv4Eh/9QQxgNnfeRIcOacp+tXsrgYK2Rf90wMMWTGHf+J5eD7SoRDiN76GJ
         MkLGYkws88368CfhwKbJlqbCrgikuoNprHVCPmxeyuT3w4JGbhVj1waTdZTPJvClq9sY
         ez9w==
X-Forwarded-Encrypted: i=1; AJvYcCX2/C8duYC1t5U9QUWqvTN/0Rq9Bw8ICa3k9bMSreAkyWKAXDSrWWhBNxW+bRIHdu4U3+eqpWDpdZXujw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6zTCpfG0obWSjOA/mLEwZrcChJsDkPpvlZ20sFRpvVJfaaBE
	DMLTkKTKCKo0FHhsH4wNwIGaujySDreMIbnwH8kPzBoLms+cXT1Dbl8eW6Rtxeg=
X-Google-Smtp-Source: AGHT+IH+CzKmwXeQiJ+o5wUbiYmsJlk8RRjMoj9tobA/oUYXt9M4L/BkGynLaPDHAcKS3w7gkHIoGA==
X-Received: by 2002:a17:907:3e20:b0:a9a:161:7863 with SMTP id a640c23a62f3a-a9abf96eb06mr431501466b.58.1729763027681;
        Thu, 24 Oct 2024 02:43:47 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913078cfsm595492666b.96.2024.10.24.02.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 02:43:47 -0700 (PDT)
Message-ID: <b9a42abd-a078-4740-b070-ba5c86855e73@linaro.org>
Date: Thu, 24 Oct 2024 10:43:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 2/2] media: venus: sync with threaded IRQ during inst
 destruction
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241024061809.400260-1-senozhatsky@chromium.org>
 <20241024061809.400260-3-senozhatsky@chromium.org>
 <4b96f1f8-e084-4599-abe9-05039bfac569@linaro.org>
 <20241024093916.GM1279924@google.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241024093916.GM1279924@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2024 10:39, Sergey Senozhatsky wrote:
> On (24/10/24 09:59), Bryan O'Donoghue wrote:
>> This needs a Fixes: tag too.
> 
> Ack.
> 
>> It also occurs to me that most of the close() operation code is shared
>> between venc_close() and vdec_close() a welcome patch for V3 would be to
>> functionally decompose the common code to a shared location.
> 
> Any preferences where that "shared location" should be?

Probably core.c is the only place we can jam stuff to be shared but, if 
you think of something more appropriate feel free.

---
bod

