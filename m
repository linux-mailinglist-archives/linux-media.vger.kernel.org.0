Return-Path: <linux-media+bounces-45126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFB7BF6055
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 13:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2C8718C6509
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 11:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA31232C922;
	Tue, 21 Oct 2025 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dRNc9TcY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB8F32B994
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761046074; cv=none; b=KxnLbXhiwKZhCM3uRGqDBYo4fzpONWQrmyZPsgAPfkxf8YFJSQ/nEeYSMa368IDqEYUVh+4p8T0MCSKmSSqQa0n9is5Qeh/CqX4i0IHK+3Y7Cf9aFYvXaIMMLM09ysx12ahiK26MCHNVuAoY/RIWzCVrai6H6cNuz+XgalEMVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761046074; c=relaxed/simple;
	bh=XwK3B4eFqi6bqCPYWqhOCbr8BhBcCJQPVuxdp+E6HLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaQNNveZi1V83oeRxiEmG1FcTCO9OL3O9T6LFiMvCDIYgTNRRPCb3PLVzkN01ER5+iuVul4cOrvsJp4gIqIJ44rPtJgEdrlT5fiSt3g7TgC8+awKtDf1DD+RsoabRxh/0/O9hncam72kc/748tb3AspezfFfZ13i2iIj62PmLLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dRNc9TcY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso5449355f8f.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761046071; x=1761650871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4sFpzlVevSmJgUzGev8ONEttz1Yf2GX70+x9wdfvUro=;
        b=dRNc9TcYSN8QzpABLT503/Wn3fgyLWxoIX/Lx0HzWXV6cLmvM08qk1us94Qr3gatuO
         l6lJQJsrmEtfmVRJYryYAJqdXa0gS0lTip0UfJw7//Tcf/A9ykBQyySakyDSZ7XH1qfR
         duu1tNMLzTbqY9zEGLI662ZuFlX/s9fPnE+KJbOG5Gx7T6NKW5wiyNxBXtZWil50V9Qn
         RtwsneBImVBWt0FBYWUbrset6K33+RFlvlJAFzcgRpVDH7zQdFZwd0D7slg8wAL+Klng
         s+KI/0bH2ERsz1awpgOs52b5Wvz8dLSmzPzwNYSBbaxSHxqIm1rP6bMNT+U3xtjYVNXg
         WCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761046071; x=1761650871;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sFpzlVevSmJgUzGev8ONEttz1Yf2GX70+x9wdfvUro=;
        b=vvjWEzDW75GWulhuevxfv0p2Jx3Vnu9bhUNWKJiUE9eSHX3sruHrv5LUsDyx771X9v
         a7zR0mqPKdmieaWnhIj6MZjFVjSzqXdCHhz5H2qUGelyYCG06JZRSkzV1bNQYTQNdSTf
         m50+2PZsn0xdbb7bVuRVvhVUC9xcRaWiR6QcrdoOeA2mdAoGuq9s3McqURDeXE2ng6aa
         ony6GrACF0r7GWU/nv4JQ7HpgxCyrBvUnavLufk72WPuKAWWKLdyail37aMHWv194T8V
         UvywJxxvGDo0ZCS5aKmFBGsRgXfz0H1pYbofCmuKZwZ1hTgTaRMXMSy5TE8V2YBxDLaq
         bBhQ==
X-Gm-Message-State: AOJu0YzXmO9xlp/5mlRoHsTAEPzHe1bwp2T1ClIHNqvmYxvlRattSYvP
	oRCkLszECqDTbbgMc/R/pGwYPEdVFM2uNokASKUvMGX5sdWDgK7LetAATnkiS3zihgk=
X-Gm-Gg: ASbGncuHOBGXnsWR8zR6e3EnNY5EJQ3IWhAKIsMt/ZaEnMGLeqf9fmWNFpBnZ12HfPj
	W4ldChgK7L1SSReh5YHFO+wvSv7rn1bDt0OJzxgAgi8zqoNRP0jvBBMyPMBuUEpSnL2cn1L0oWY
	qLnpc58crteOyy4pjy0ROq0sE4rGu2+qmfZB0fRjgWIRvUQx9yJP98t8f4a6Qxj9my6P9HORiG3
	9Y1qgSbKcaPEfcYJHUH2RGLveLiHTx/4tUoRYRgWMGkE9kL5hvHJGfeNDZfgE/gQ3iPYcxvIznY
	os3luHP1X/UQZYFcyDxUGP/ThjNvZb67S7haYS+Upb9528+35+PIEeFko3skNz3/Jh9Jqh02yAm
	CpLr2xAPwIkIHWPGWjbm+bQcnY/y1vVCTLBzI9cw+XA6Orn7vmCN1FxVAiSZw07Vqns9kWQKeAm
	fQ2m+loVAXHRJBRr0F36JqIBCHgyugO6T7w2JYHl5iNGhR0ZP0qDaZamIO56fCWoL0
X-Google-Smtp-Source: AGHT+IGV/ABVqWV8MsAww0waMr7MTa0bjI7NdLpLREyhUO0GVPuR0EgaD4ahBwL15tOIyvx1SltTMA==
X-Received: by 2002:a05:6000:400e:b0:427:9d7:8720 with SMTP id ffacd0b85a97d-42709d78893mr9365897f8f.24.1761046070736;
        Tue, 21 Oct 2025 04:27:50 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce178sm19861570f8f.46.2025.10.21.04.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 04:27:50 -0700 (PDT)
Message-ID: <c80e6d85-e1a7-4b04-9e84-7f0cf1a983b8@linaro.org>
Date: Tue, 21 Oct 2025 12:27:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: iris: Add sanity check for stop streaming
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
 quic_renjiang@quicinc.com
References: <akmAGosBEsOFS3HpzbJdYH2z103MndEu9B6T4EBnkbPiuBpzCzjn8LtnVr-lJ0PHOqR0jYiIXbnPTwJR0B3L0g==@protonmail.internalid>
 <20251021-iris_add_sanity_check-v2-1-476b3107a8ef@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251021-iris_add_sanity_check-v2-1-476b3107a8ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2025 09:15, Wangao Wang wrote:
> Add sanity check in iris_vb2_stop_streaming. If inst->state is
> already IRIS_INST_ERROR, we should skip the stream_off operation
> because it would still send packets to the firmware.
> 
> In iris_vdec_kill_session, inst->state is set to IRIS_INST_ERROR
> and session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Requires a Fixes: tag

Then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

