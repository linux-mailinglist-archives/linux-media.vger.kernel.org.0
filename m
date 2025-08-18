Return-Path: <linux-media+bounces-40126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B499B29FE8
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43C943B773B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80FF261B77;
	Mon, 18 Aug 2025 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qj5+Ol+U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829E1922C0
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514907; cv=none; b=d4jfqhDlJJwivBfyhYBJXXSJHIn2zgmiPKwgP8rlxHbV53g+m9hF2OaUFCqp925qWZIIMd4TU1w4pgemPNAT6Cf2FVmrgV4/J+2rYXoypEqZkW1gcu/PWvC6ZH8ejwdQrifxwr6zp1fJah/epgAoXcACd3+nkVfUZsTh5WjOIVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514907; c=relaxed/simple;
	bh=9TYaT7DVhh4RqpRijSCAWXM0qbM6HEJ9pElNlwj1hzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iR746wVw3SRDGLosiuUCYreX6NO9AIqtaiH65Kxn+/0RtVsdjLA4llKIaIfuLobVB6TTXwhIdeL8ml2WEMR25fsLEpcXJlNI1Q8wD7Zetgbgr8LN6YPHE8mON8qXbKWS+6CdBN7EXblVNPiv1qxzFmbPrf1egQ8VUK1XTlI9/ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qj5+Ol+U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0becf5so20310795e9.2
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514904; x=1756119704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntD9YtOAPnvdnrNXErbVg7euDwQgc63GGgL/mdtMZt8=;
        b=qj5+Ol+UOphHbjBEI+W6Ame+zM5ilKmkO+tR1eRCQcR17JdDFiRLG/EAalWvPkquKm
         ZrQ8Pvs3uNkKPfjCRn47FYIelUdVnoNVdkNZU6YQa35Ran90BKvnRXxMT/fYypXaat5w
         l7eezaXcEGUFOt6JcRABbVHX0LW3EFdbjxCj75LIF+OrE6GLA2fRlzfzsQfOhv/4csOt
         XeUe/ImDc+atJrzezK/723DBlAUB+EQOjNJLZcxXmxF2v16iT8jR7pSBM4vvpxh03Yj+
         J2oMQjWC6ztgtWAtl+Q7WbLFWi3D5LTlaxAw4snOcZcEeBMEa2XdnlhWX3E0TzmVh6tL
         2y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514904; x=1756119704;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntD9YtOAPnvdnrNXErbVg7euDwQgc63GGgL/mdtMZt8=;
        b=qUQnBs7dWTeFxkfATs7vk7ZSXDufRBVvHmF4L0KrQ1jhhxK5YY8rG3JHaSREPxcWeO
         mcrvmFD7pzhGLEETelWdu+Ho3qetQNHPwcF9or4ylWdYV8wNbS+xLW6SfVsvAwWpFTVz
         p02+Oq9LVN5qIGpgx+dkmX+CAzZ1HpGgyaK3QwC0CfuaW4mH3dP5Gxe7STI4/ZLSmcT6
         v+SGO3fjDNZhaTl3mzIJy2OFWEuYnIqY32hT0/pu7L+aGArAOBVNHOfzcvX//hnneVGd
         AK8ycYqCBpVABuke0tCJ18TIm1r+ZhN5bbO03tunR8q0pRVl4W/h37pl70ak9IB2wZ9E
         T8tA==
X-Forwarded-Encrypted: i=1; AJvYcCXR1bnJtD0R5tOawJVu44XypVvJu+D3DpEFXc9yJw7noHTLvuehyDr4XBvGvnR4nXECJQw1idAMimZLLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHlxGr5IxkVkLPiaBtt1UoQsEtRwoIKDanaVztB1eP4Wx8HB3g
	zKe5Vzf0eB5PYPtTVLG2wCR4KSO86OSl0VF55210Qpg2h3TYuXfi2I4VIpJwX19W+LQ=
X-Gm-Gg: ASbGncvWn1Wv4l4rnEPb6sbTzeMOlFw7jrRClBwshvyGK8OdIKXGddT7gQCEG408FHn
	bDHVDQLB83gT9pEf1Z8shQOkrXYZXsg4Deqo8A32DHQqkcVPixnqqZ/I/5DzOPFddtAuQn0ir7o
	aX567TPcbjwG5l4nM1z+EZ28pC07H1TDIkJHV8qHRtqQAisBufBLK6EZkUVUBJtWwb7RJeTrVP0
	6yIQUQ3aKCaJKGoGM89vJ3x5qf2GWUasgCE017lhewufgMRkXw4e1CsY2D70yr4Z8HJI4u1+kWV
	yItIlVmnp3VJS3hHspjdr+FP13hx8fAhV31h1m+Yxv8Y4ev4TOVeYW3v5qOdit+LJ8guYqJYIft
	RulIGaqBO+A/5Df2d5bq3cHsBeSXEAdFNSGy7w37URlOAaUfC+D9fMuhyBEekoB0pxaSo0xut3Q
	==
X-Google-Smtp-Source: AGHT+IH/1MJvqzbVWRStZFWheU1Jn9W/zKSEPXOg/a1tWJXWqxadFZwQAV4W2k4siiejGTbxIOR40g==
X-Received: by 2002:a05:600c:3b09:b0:459:dbb5:399d with SMTP id 5b1f17b1804b1-45a2183d324mr86473385e9.19.1755514903882;
        Mon, 18 Aug 2025 04:01:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1ce9758asm165995675e9.15.2025.08.18.04.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:01:43 -0700 (PDT)
Message-ID: <61f9767f-ee4e-4f93-b84e-59ccd422c98f@linaro.org>
Date: Mon, 18 Aug 2025 12:01:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix firmware reference leak and unmap memory
 after load
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2025 10:50, Stephan Gerhold wrote:
> +	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);

You're not using the latched pas_id declared @ the top of this function.

With that fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

