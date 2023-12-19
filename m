Return-Path: <linux-media+bounces-2645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE3818705
	for <lists+linux-media@lfdr.de>; Tue, 19 Dec 2023 13:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602E4286FEE
	for <lists+linux-media@lfdr.de>; Tue, 19 Dec 2023 12:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CC4171A2;
	Tue, 19 Dec 2023 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iWaSXOj8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A53F18629
	for <linux-media@vger.kernel.org>; Tue, 19 Dec 2023 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33662243274so1354116f8f.1
        for <linux-media@vger.kernel.org>; Tue, 19 Dec 2023 04:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702987610; x=1703592410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QX0/am4IjBACVtJR4SW9C9khWxbgbpT1N87hAG7O6Og=;
        b=iWaSXOj8ZxeKTjuWY9iYRCPBfwGDILkaMEHeG8ba6e2MgV6Mh7I3Ed0dNcynCCU4h5
         2inOync0si6oLnwjlBeCxv7eYMmUOe9VZRpz7vxkWilYsu3uNv6/OqVLKNemA8p6kSw0
         3ocFVkq1FFuv7JUhFa4V4Jm7GFlaV3mT8VQlspLnEWIymWgcyd/Lf7zQn/A/9trtGV1W
         e4zsTuw1AI+ft8qod85ZWmGa6gHOlsU77LHdUvyoaaCC5KjAJBI4nZ4G5FYIKo+x7WHb
         SCF/lzVn3TqKJ85s3H5Kwc3d9xrnNDl9qSq2LlLeQk7WyapIM+ly3dcy8kEqZ3D0VhKE
         bnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702987610; x=1703592410;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QX0/am4IjBACVtJR4SW9C9khWxbgbpT1N87hAG7O6Og=;
        b=GbdIXis9bNLnGZeDN6avm6aWVXcwCTtXMehW+v/YGSU5e+THY3MX9VZvDo6rvFTDvy
         9QU+rgkjjDetmv9Fj5CPALBb4W2+fETYfKm6z+q8nZSQk3aM7cAW2ugBD81oEfkurntu
         i8G8NdcPt7yd84zB4EmnN2fUvGErsnompXLJNSXuhHAYasu/YuTmb01ybO2bkCMUoRi1
         v15Qxqrixt+jYWG4Ba9Dt4qXoseyC2ZGyyeJO5c5tLmNU+3Vn6EVPpiswNqAw6B/ozlY
         CJSHOpWhZO7UD4s5NiYM3zGzEPyf+7Uj/6/UH5c5dSS09d+Oe+j+iPg1tge23D7PuN01
         6PiQ==
X-Gm-Message-State: AOJu0Yw4V/UMmdF+US+oeNlmzObLTf2MEBiFu3ApwBK9KdnhnoQXXvNQ
	4b9RxbYFZjpXJ/2GtV2RBBgjlihfWfSbww==
X-Google-Smtp-Source: AGHT+IGSAIihGvqaHjcpOebdWipkh9SAM5JtqPaEB0yEvTNaj3ZFMVRnPkWiy0/0hyFf/q9cZmnaIw==
X-Received: by 2002:a05:600c:5119:b0:40c:6e48:a5f8 with SMTP id o25-20020a05600c511900b0040c6e48a5f8mr480826wms.17.1702987609862;
        Tue, 19 Dec 2023 04:06:49 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4cc6000000b0033662c2820bsm7241359wrt.117.2023.12.19.04.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 04:06:49 -0800 (PST)
Message-ID: <cc2da776-9aed-476e-9654-8ad75496db8b@linaro.org>
Date: Tue, 19 Dec 2023 12:06:48 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/34] media: iris: add video hardware internal buffer
 count and size calculation
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
 bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-21-git-send-email-quic_dikshita@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1702899149-21321-21-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2023 11:32, Dikshita Agarwal wrote:
> drivers/media/platform/qcom/vcodec/iris/Makefile | 1 + 
> .../media/platform/qcom/vcodec/iris/iris_buffer.c | 48 ++ 
> .../media/platform/qcom/vcodec/iris/iris_common.h | 1 + 
> .../media/platform/qcom/vcodec/iris/iris_core.h | 2 + 
> .../media/platform/qcom/vcodec/iris/iris_helpers.c | 13 + 
> .../media/platform/qcom/vcodec/iris/iris_helpers.h | 4 + 
> .../platform/qcom/vcodec/iris/iris_instance.h | 2 + 
> .../media/platform/qcom/vcodec/iris/iris_vdec.c | 1 + 
> .../media/platform/qcom/vcodec/iris/vpu_common.h | 8 + 
> .../media/platform/qcom/vcodec/iris/vpu_iris3.c | 6 + 
> .../platform/qcom/vcodec/iris/vpu_iris3_buffer.c | 201 +++++ 
> .../platform/qcom/vcodec/iris/vpu_iris3_buffer.h | 845 +++++++++++++++++++++

So, unless the code you are adding effects existing upstream venus, I 
think it would be a bit easier to review if you squashed down changes 
that pertain to Iris only.

For example this patch seems to relate to Iris only, so why is it a 
progressive change within your series.

Similar comment for "add vb2 streaming and buffer ops" and other "add 
feature x" patches in this series.

If the change is contained to your own codebase, then progressive 
changes are more noise than content.

Please try to squash down changes - to reduce the number of patches and 
the total LOC being proposed here.

---
bod

