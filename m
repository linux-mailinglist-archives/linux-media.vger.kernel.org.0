Return-Path: <linux-media+bounces-33473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31942AC5108
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 16:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4464E3AC929
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4AF278772;
	Tue, 27 May 2025 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRKkMsG/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CB192D87
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356659; cv=none; b=SfmONlqEW8aE2SaBWLuWACMcvBOqMWufAAQBGWoQDviMuvlCI1zPHe4VUlTlCRRlPvJIYb5tG8slt9N4zaIpJxs78FdnuJooE2Fawy+uy8nCac8eBYbkub4GBwegvTVcCwmu4bY7pLbrgCMJObxJ5x8E0LceP9AiFKDpb3R5gNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356659; c=relaxed/simple;
	bh=jvS1PbADz+Us91X2hWOLlEMb1Nws+URp8Zsi3PzRt1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNKXTqVc4paggqjWXrwLNZDbgsX4qTARwyJ+tnTkQ6oFLs6D5KCsL6UQYz/MFKEIzLauhR6yK2Fwl9//dDBRrQEdksIqnDWhq24q4Y9rOfcm/1aENpdR/I5kj7IMnqMWPO72OfwYFpfFA3sHb7nuxEO2eiRb7zN4RTqLLrsRcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRKkMsG/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so2245132f8f.2
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748356655; x=1748961455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvXJBVqr2AtSIqf+uhP51ScRsxX090wAOja9HSyfRT0=;
        b=gRKkMsG/Ra7r8iIVSImB/43nZCSi4IdNNNaz26J3LNRgSZdKASRzklJ1drk1TMUfTu
         Y6Z0d+EyWKnDg20KBE52VJ83oonjQoh0VJ1gC8AwC061O0TGuPd2zPp/HUqtLoAtL0MG
         aidoWwPfwBe701ZwrwK4qGuBQDxvp8FN4PNp1mrw0Q2PLCnI8+YLDH7FmChEqIhJ/0Z6
         6Wf7ICdu73nW2f1mxjaK/ptIUvUoS+9/eY4ODi02xwv0S8pI1/yzMhL/1aewf6ZoZcNN
         37Eq1kXM83ZGryZNcxKbYlEbQPFuoauoDfGLt8r53SZiSrJGwYEaPLbfP738jIbCEmvR
         6SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748356655; x=1748961455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvXJBVqr2AtSIqf+uhP51ScRsxX090wAOja9HSyfRT0=;
        b=CpNTDdQL8Ejd/ifnvnG+8NSkH6kqG+kVGMbDTwQAm0REg6oajhriTvMBrplAkVs1O9
         +jYmDfHvXCTq+IgWI11THHa/AyMo1ejfKQ1bLU50s4DQjkpTatc8x6SiO5RXYnckvQQc
         UFK4hzvdNPv/j2zhYmUiqpN0D3JXmBWxByKLIBJBssMpBEUqjqOSR1lDW9B6y6PnYqcz
         zTrB5cUiw7giZbg7SEJS3ApRElxX/VcgVT/B0TvghcQvhdCX9RHNcKGwPFf/OmRgXa5B
         NiJ+8MaABByFLk8oIBbKmY5teGCl8kK3DZOl5VZNezUet7Y9xwJJNMrLw8+6ZmdQ5k9F
         gn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBo1X+R3x2hLPd72w3grbBGRQXqSg0tQhWsi2qAJbicXja8DV5Lhges79i6ZbgMazi2GKamLNMRkXXuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPssP1JkTsDst2Lj/Of4HzxrhT1oQEPOaYRfXT81mXIaCav5cn
	iBAPmGgYFiK7K707ENreZ2igqrxtdiDIrsGLVOqGz9t/s3J1GM1oZnaQA8FSNBNqHzQ=
X-Gm-Gg: ASbGncu1BKgNnckJBfqTTMRwf7p32URt6Ln2xA8+IbdTi9w9PERbTQWnkyZeQ2APckH
	E/RxANted2NwTffa7U4ijvyvv/uLIrBW8LUDI921B3wSxSSWTIgF0YIwUjnkLja8WKkv3KtcbZM
	EkG1YNZsmh6Matz9C2IgTxoC/8r1xNJVxCackM1nEGsgDZbkEXZEGWpPdL6k4eMZjJqOzRNvOmn
	dUIC7Hzy+5tD2W2S+HpI8jrmebY/eJtKqTZe8lVLJ02Kdiy/5QAa5O3/uNwppDvCmVh+AweWpbg
	+b5DwPqENZkLfLlMNP+zLem86TXRclD2AhLnfnYHnQXWyQsHbWL2Z4J7+XZmPFWiSmpNMCxZB41
	k1tuyR5mbn6Kb2Is0
X-Google-Smtp-Source: AGHT+IHkWKsTTmphkcqPjmLfxusLGxXp8SFULw1PQIe5/AO75A5L3yTYl8KjtZzqIfX32dcuOV75+g==
X-Received: by 2002:a05:6000:430a:b0:3a4:d1d0:6f97 with SMTP id ffacd0b85a97d-3a4d1d071acmr9279310f8f.36.1748356655614;
        Tue, 27 May 2025 07:37:35 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4dc1172ecsm5285610f8f.48.2025.05.27.07.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 07:37:35 -0700 (PDT)
Message-ID: <5c326be6-816f-4417-a715-86fea92aadb3@linaro.org>
Date: Tue, 27 May 2025 15:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Power pipeline only when streaming
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250526232837.686822-3-mailingradian@gmail.com>
 <CAFEp6-2mhuLptwA4JYJm2cvftZxufoJGB0y94LAd5ZWGP1e-RA@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-2mhuLptwA4JYJm2cvftZxufoJGB0y94LAd5ZWGP1e-RA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/05/2025 09:03, Loic Poulain wrote:
> On Tue, May 27, 2025 at 1:28 AM Richard Acayan<mailingradian@gmail.com> wrote:
>> The libcamera plugin for Pipewire may keep an open file descriptor to
>> the video device, even while streaming. This simplifies its operation,
>> as it only needs to keep track of a number instead of a file path. When
>> the video device is open but not streaming, the pipeline can be powered
>> off. Move the pipeline power management to the prepare_streaming and
>> unprepare_streaming functions.
> It seems to affect more than just this specific driver then? According
> to the documentation in v4l2-mc.h, v4l2_pipeline_pm_get() is intended
> to be called during video node open. If we're changing that behavior,
> we should also update the function's documentation accordingly so the
> change can be properly discussed and understood by a broader audience.

True but then the patch that added that comment also contains

@@ -999,7 +996,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, 
unsigned int count)
                 dev_err(cap->rkisp1->dev, "power up failed %d\n", ret);
                 goto err_destroy_dummy;
         }
-       ret = v4l2_pipeline_pm_use(entity, 1);
+       ret = v4l2_pipeline_pm_get(entity);

Seems to me like a perfectly valid use-case to have a persistent handle 
but only want to power-up the pipeline when you have work to-do.

---
bod

