Return-Path: <linux-media+bounces-31987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5993EAAE3EE
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 17:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EEE53B00E5
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 15:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957A128A3F1;
	Wed,  7 May 2025 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ix9Caeri"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1D8145B16
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630574; cv=none; b=Ogx3YYspCycymQfobYo1dateZ1Q8sXcn4X6sEMnsQ2UoTApvpdruqoQKIZrnQzetnFiKIXDIhSPbx1S9xEH5Q/F8bhZxCcXaadLzCgpPeTfKRKKOC23UqahIpnatBoQFHUOSCI4fXQ+B/bDw4GxYIeYwBIJq0OYIPhq14uwqG1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630574; c=relaxed/simple;
	bh=rGwdD2sL/1x9KvXY/1Ekk6DKMc0m0UXZv2Ekf1BRjnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERqe9m2XHmWJU62oQybF914E7UsqzJy8XOmYGNHDOudymsRRqDhE+kg1l1Xg5k68wSt/8a9Gu7zXX5AtCa5aZO2STL5s0lzt0swaUjTH/z/vlyns7oSUsoNbF2mlw7jn2j3IMqQQPS5sgivRzSULj+A2gpuGusMk3pPu3NeN5Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ix9Caeri; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso44389815e9.0
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746630570; x=1747235370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gnGxO/UH5ZtoslCnotoWi6A0EHXwJ/OCE7nrpX3PLMY=;
        b=Ix9CaeriSAx19CJBPP6Jzx4tLiQ/f0K6bJWuJ1/35K96Gij1Eu2F9xtHSHMlk36vKQ
         GbZovms3ag/1WgKXTP/PMl4ktqPLekLPk711syDUf5IZDrYLMlitu7o4LCH9q5QhgLkD
         SLHQbHtEY/Q8kr9yhA1n66oz1y7URjFEIeMc2oebaE3imddo+d1AxbQLZ6SnYIq90cBZ
         bnCOVlT9zsDJSnoTz5GRZH4ZSKly9GsF2ZWca51/+BsMBVc39XmhlTeWNFIC+Wpe6147
         IxfAmWFIrxWiTKzYEFxiVhRG53kxHE19Hd4GMM+78gt2piVg+PB6sqHGvdxMuImV3Lcn
         KEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630570; x=1747235370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnGxO/UH5ZtoslCnotoWi6A0EHXwJ/OCE7nrpX3PLMY=;
        b=fg5z2xnxwYLEynrz5SQv8ci5t2SNW75du9ZPs8zb/a/RMOG0liijBf/Fgv300qimFc
         AN7Ry/FpLCiEL82/OM21Fc+DUIYY95BmcC03PcGTjk56eP3SFCelXpJL25hEQf/bUN0+
         46kG6i+G1G57OdR8ZDid/xlxRWmOySbHUkNiDrYmY96Q1Cn1v4PMrRczXibG6Ks184Ql
         36XpLMYZKaNCTrIhKFR6Ur/1KuM6z77TmIFCevunOi0ImEqLc7HZcTqxbuqwTSv7pSL1
         YL7KSXzJ5QkTQUw0qp+MYXJH4fT8RLBBWbY5WzzTfRBSc8P3A5VFsgEdgrrigj7l3Rff
         ZODg==
X-Gm-Message-State: AOJu0Yzz9hcYTKALNxKfCJ5gwq+7gbMVQ/Rf6hvdUAc2v7GAzaxBLGAQ
	F57FA/Jf6MHYe9m75nNEdoKIzDoXt/S+F+sRsXm10fXZwxLjddl4s5sTZ1xKOlw=
X-Gm-Gg: ASbGnctsye0gUn1COgzPPhnYfC/15zb2Fu0xDpkgcEx7XIX3PR4l7TwBWhBgT5n56zo
	vpAQN/8RZLtOpkiBPgl6WKoNJgJn6u7wfcQQ7e5EDvg2wq8HDWR9vfvhdpU5XwBgLup1tAwnZph
	qhbYjJWQHa/y3vWV6CFtEl8iB8SOBgLWvrBi5nVzb3hspvkH3g0nmFl9kC6bY4TpjJaxrpZXWRt
	xJCiPEUOsC3ME3MgBxp0ttch+mja85Bah2pbj6rgvWU1L6mZdgTlPCW831JgGsUZYQL3A2yW4Mt
	YIq3Avc56Vl0OaQuJturb4dOtIeWrVGDs94wC744ZxTihiPryC8XTmoNQgzmxq66yN+/L99XqT2
	e3Z0n3g==
X-Google-Smtp-Source: AGHT+IFdOXDNLQbnntxisuU2JZEe9tB63IzkZJVxK0ls3MwqsOC6APZxiRH/YqCeXjmchonVq6rCWA==
X-Received: by 2002:a05:600c:1f1b:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-441d44e07bbmr32485765e9.27.1746630569703;
        Wed, 07 May 2025 08:09:29 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b1702dsm16875169f8f.88.2025.05.07.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:09:29 -0700 (PDT)
Message-ID: <bcc8251a-3bad-4eaa-8dc8-cc63619a6365@linaro.org>
Date: Wed, 7 May 2025 16:09:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/25] media: iris: Avoid updating frame size to
 firmware during reconfig
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
 <20250507-video-iris-hevc-vp9-v4-3-58db3660ac61@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-3-58db3660ac61@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2025 08:39, Dikshita Agarwal wrote:
> During reconfig, the firmware sends the resolution aligned to 8 bytes.
> If the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
> 
> The alignment mismatch would then subsequently cause the firmware to
> send another redundant sequence change event.
> 
> Fix this by not setting the resolution property during reconfig.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

