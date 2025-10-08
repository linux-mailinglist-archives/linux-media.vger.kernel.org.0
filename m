Return-Path: <linux-media+bounces-43938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8EBC3DA7
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 10:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEF763AC10A
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 08:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E192F3C22;
	Wed,  8 Oct 2025 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6aWXshp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01C32ECE96
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912384; cv=none; b=N5wukp9vlVDS5rsSGYz7vj75qMNFQuzQ2ccNxyoIiwtblHWrxXZN5AqgmEDphMf7AaWlhyQgF8ORlXoAxVigYJMGFgbTNkXG1RdfYRMQc/s6x/R+azCmETULQbgvoJBWbLYak/+QsXdE/zpJtFyg5RmIonD7QxBYJYaxVPSfaAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912384; c=relaxed/simple;
	bh=2FdRN4XC/5R1gK9m2+eqi8KynMVU0ghurM6LZd7Jgs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8nxoTWNXOg4cjrDh7+72hm5zpzxSl4YWwq7zeNDE1HfoTMSOWdHp7y8wt1TVQs34YNt6OK2oXGXgc7U7UPSzh3UMjKcEKD4bIrVwxRcm+Wi6x4FtiuXvTX1vFhquPBvszVUxvBR4B/BsEMUAsMWnuzfLD/ds5CVP4rRsPxQSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6aWXshp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso48045925e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759912381; x=1760517181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8obpc78oiviT69lCe869kt2HhJ1zlsm8uDGHlOfvmwI=;
        b=G6aWXshpk25VB9D+GQ7FXFtNd7zLl9xaJH8XJKk7BGT2kj6fRbySNqHJAzRL/Icvc6
         zTZ986UFR3cH+MHADbHJvwRUGrzeRAYo20JA6fdmxRpOejoHUHqHUi+KjG4HPQjSB+5G
         lthoQ7Wq4vgnPERo7GNor4j+Zjo1HxS/ONm5kRENhAKBFRLNwCJBGqKMUcd52RUcfm97
         28WON1B54bVAsVhszlSNJzSoPnqIBMeuTXq3y3ckbdmToC8KFF5QvmwuSPpGS/wCf+mR
         WPab9j8SVtM5tPb93kJmVR/EfKKT5DXqICl+DcoS6EuaTMj0+/X1yoSUnzBO2rmcJCGE
         /1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912381; x=1760517181;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8obpc78oiviT69lCe869kt2HhJ1zlsm8uDGHlOfvmwI=;
        b=J+0wRpcCHhekr/IwrxyuHYA/Anre9qHzm5wWkKbI+iThcfiFGEY5x5NwtcG/ossTBQ
         BAo3NVW4CP3NlnzPgBKmaHZbX3g/5gBDFBJYUixmDPa/6ZQAM1jcYvnPtFU1OlA69840
         wPkkp1yzQODc2SBTdA3WtPBzXoDdbFP9YI2lKopekqXHPyL7bi3x6c4fXTeKyOKcq+IU
         u2qvzLEfAJKkm5WxAf2OLPwv0tKCae7wRnGsV4/WCxX6UvkjFXzgtQagkQChnZkWPIE2
         0dqH3npjmqpC9A+HQry+Y8PYNVWZOzJsW/Idpq1BI6PsCrivQXqaX9gaS+/ynSNoD1Nu
         OTYw==
X-Gm-Message-State: AOJu0YxIo8NPIGA96sswHPRGHPUFMOZu77dT3aapnfmICqX1U15eb0sA
	YLg9BTvJ3gbvl6T4KFC3bvh+GxAxeKhnxVolN1D9r3hoF/QPmoj9OewI1t7KUUp5qIo=
X-Gm-Gg: ASbGncs44c9pLcBdhcgDkY7RclU+WOmKSN9hm9fauj6d13irmE1r2I581bOE0AJoy9h
	9W7MXeZEsVsCPhcI2tHqGfEi308o0YmM6FVajtHuTBFkwnjrjwxRI6JEeYr8Jeyh/f8M3y1Y1Ea
	kt88qHdPV1ExQeHZiAyJpkfkA533jC/iliaswS+8G6b6N1o4veN5dbC+IWtkAKqNZrGFm1ErPAl
	sPT37G+CqqoPnuXhIxJpcNq+cevXoHOzkaRF4z+9U9KautK3ajiQvKZw2Rdma8QHjiUfk+Eg1K/
	V7Fn1Tn9WhdR3W5hOEjarJlYQfW+6Udb0zXYC8g+9caWOHDwA6nFclgYfnz0eNbBaX5SjkJMtgl
	2nqFumNw1lnCba2xCSn7yE/ep/2wXNXeiFdNUzQsGaEgr6tqAzfvZqKBp5qgOQkJW0orpDHmq1P
	h38xZyTTgriPheJTAKmyzjzkm+zWU=
X-Google-Smtp-Source: AGHT+IHbSEhVQrK9K26i7uVsuzXkD7oprvxvvIF6hdVes8bM1RppRrexKFd+/Xrq7JcA8RRcetZaxw==
X-Received: by 2002:a05:600c:4752:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-46fa9aa48d7mr17421505e9.15.1759912381089;
        Wed, 08 Oct 2025 01:33:01 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d6269asm26643745e9.15.2025.10.08.01.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:33:00 -0700 (PDT)
Message-ID: <e829eeaa-94c8-457f-883f-fcd9f272b287@linaro.org>
Date: Wed, 8 Oct 2025 09:32:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] media: iris: turn platform data into constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <3922bySm7KN1DJdbcqTlzVcSdHYtKZ5Esh5_UQl2tsNSBHaL1riPFeZdKfQm-k73T6f9nWXlF3mgd78x1x9drw==@protonmail.internalid>
 <20251008-iris-sc7280-v1-2-def050ba5e1f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008-iris-sc7280-v1-2-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 05:33, Dmitry Baryshkov wrote:
> Make all struct iris_platform_data instances constant, they are not
> modified at runtime.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
>   drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 17ed86bf78bb3b0bc3f0862253fba6505ac3d164..5ffc1874e8c6362b1c650e912c230e9c4e3bd160 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -41,11 +41,11 @@ enum pipe_type {
>   	PIPE_4 = 4,
>   };
> 
> -extern struct iris_platform_data qcs8300_data;
> -extern struct iris_platform_data sm8250_data;
> -extern struct iris_platform_data sm8550_data;
> -extern struct iris_platform_data sm8650_data;
> -extern struct iris_platform_data sm8750_data;
> +extern const struct iris_platform_data qcs8300_data;
> +extern const struct iris_platform_data sm8250_data;
> +extern const struct iris_platform_data sm8550_data;
> +extern const struct iris_platform_data sm8650_data;
> +extern const struct iris_platform_data sm8750_data;
> 
>   enum platform_clk_type {
>   	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index cbf38e13f89e5c4c46e759fbb86777854d751552..b444e816355624bca8248cce9da7adcd7caf6c5b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -737,7 +737,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>   	BUF_SCRATCH_2,
>   };
> 
> -struct iris_platform_data sm8550_data = {
> +const struct iris_platform_data sm8550_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -827,7 +827,7 @@ struct iris_platform_data sm8550_data = {
>    * - controller_rst_tbl to sm8650_controller_reset_table
>    * - fwname to "qcom/vpu/vpu33_p4.mbn"
>    */
> -struct iris_platform_data sm8650_data = {
> +const struct iris_platform_data sm8650_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -912,7 +912,7 @@ struct iris_platform_data sm8650_data = {
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> 
> -struct iris_platform_data sm8750_data = {
> +const struct iris_platform_data sm8750_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -998,7 +998,7 @@ struct iris_platform_data sm8750_data = {
>    * - inst_caps to platform_inst_cap_qcs8300
>    * - inst_fw_caps to inst_fw_cap_qcs8300
>    */
> -struct iris_platform_data qcs8300_data = {
> +const struct iris_platform_data qcs8300_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index e29cba993fde922b579eb7e5a59ae34bb46f9f0f..66a5bdd24d8a0e98b0554a019438bf4caa1dc43c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -314,7 +314,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
>   	BUF_SCRATCH_2,
>   };
> 
> -struct iris_platform_data sm8250_data = {
> +const struct iris_platform_data sm8250_data = {
>   	.get_instance = iris_hfi_gen1_get_instance,
>   	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> 
> --
> 2.47.3
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

