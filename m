Return-Path: <linux-media+bounces-17683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A5496D8C0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 14:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3182824C0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F66519CC2B;
	Thu,  5 Sep 2024 12:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+DNWcX9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4BC19AD8C
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725539820; cv=none; b=DCzFARm9QkRSFeYa5Mq8uPrY36Z+u+/7QXBrlveXjVDinyiLTC+fPnroqJpEvPokrdjdiLGO6XVk9JKRi2BipgAGMfZTEBhXfJKKKr5o9m13l6ct7ytUSyGKwBqJzgcyC+72USATaGdCKpAV5kJ3RhcDIag+EGZemlJuGdlFprU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725539820; c=relaxed/simple;
	bh=OQ8/sBGiChbcjrtKY5POQPKnSXe245LSYHuTYskerOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUGnODXGE4lFECQoXZsMi5WVlzKWHeKc80s+sl1wxprs2GbXB10JEhJglTpFFNdFDAtFcfiFKNp89Z8HfR46XoE4uFs9C21CqeT7LSIy5+vCMWTGo5j7MXlM4wk4fPdOriuebZ2KGYH/izik0T7Gsu13HJl9hdHzDnZMx3hKSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+DNWcX9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so601609f8f.3
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725539817; x=1726144617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcJQ6CbLoNoUKpf33h9pQfnLdDyothljlCNcjVpGJKM=;
        b=x+DNWcX9hjswGG1dKZo5CfIjjLknzyR9LF1oVdwMC+XDQxLeE6eBzBD6HooO1QSJDw
         CaxGvOIPFFpT04eo729C+q/kuzrmFUZstQDOINwdbrdojsfjwwPApd3vSyyyBeZCactF
         SM+ozpETZS+dHGXEQ1DDkhgsOedw3B9/JRB0wtNHuOwubVoHJLFET5RdDoR2XQOG5dZs
         5QNIV2vsRrxVcEVCDjwgLRYNkKoFS1Eiqao1+s/JbzzGkwZraQh1zAMMFCCkmvkMJNP6
         /a77FQef+ASMobPwQ4i8j8NOGF2QbIoTaHslQmPI7ac1fBnvdoBuuaxcB3u9jjIcjfT3
         TEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725539817; x=1726144617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcJQ6CbLoNoUKpf33h9pQfnLdDyothljlCNcjVpGJKM=;
        b=gC1tul1+1G5bpfU8XtJyuizM1Mb+5rqIJW1SfJETNvJbqaouU5fZ3EoXdLNKzgAWFv
         cpbegGfJzYvxwa2s/9uDe3rkRYFCGDCfHCRNE0Q5b+YMqC6OQr/VkkbptEp2xjxiD1OA
         H7Xfn5pvwQp16O5FZboH+XKMd2AoW+kcLK450fAHrMPUcav6hdCjdy32qRqEDfrwxUWw
         dFr5RfTGS1FCjg+0cuyPFgNJ886Lwxsz+i4ARKr8dD03GLfDFLgk78HdiaB3z0dugcqi
         i1/TOSaEb37YeucJRMbgKkIp5nl7VY+bn6IWCpCwp/+AfOMLsLQTqKrNw7OjlccJv6R+
         ACGA==
X-Gm-Message-State: AOJu0YyeM3anwusVzY6DxHp9PgcWMZ67/Vf4IGdKXlo1v3PAOADjzbM7
	HAalWvpSMuMOvqvC2uZnYcfG/ZgM9GDu1BUFv3LRp8IPgp4NdZUftPx3F28G3hM=
X-Google-Smtp-Source: AGHT+IFnKY2CWqoAVevjfLX2YALDhGW6evQi+sqpvIrnjPk2Ms8HYMqnBQGTJWRqCwAuc9MzdjX08w==
X-Received: by 2002:a05:6000:124c:b0:374:c29a:a0d6 with SMTP id ffacd0b85a97d-374c29aa194mr13366485f8f.2.1725539817084;
        Thu, 05 Sep 2024 05:36:57 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62045e44sm131160466b.78.2024.09.05.05.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 05:36:56 -0700 (PDT)
Message-ID: <06036309-a7cd-4eb8-b7bf-1704f49ffdf1@linaro.org>
Date: Thu, 5 Sep 2024 13:36:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/29] media: iris: introduce Host firmware interface
 with necessary hooks
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-9-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-9-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> +enum hfi_packet_port_type {
> +	HFI_PORT_NONE		= 0x00000000,
> +	HFI_PORT_BITSTREAM	= 0x00000001,
> +	HFI_PORT_RAW		= 0x00000002,
> +};
> +
> +enum hfi_packet_payload_info {
> +	HFI_PAYLOAD_NONE	= 0x00000000,
> +	HFI_PAYLOAD_U32		= 0x00000001,
> +	HFI_PAYLOAD_S32		= 0x00000002,
> +	HFI_PAYLOAD_U64		= 0x00000003,
> +	HFI_PAYLOAD_S64		= 0x00000004,
> +	HFI_PAYLOAD_STRUCTURE	= 0x00000005,
> +	HFI_PAYLOAD_BLOB	= 0x00000006,
> +	HFI_PAYLOAD_STRING	= 0x00000007,
> +	HFI_PAYLOAD_Q16		= 0x00000008,
> +	HFI_PAYLOAD_U32_ENUM	= 0x00000009,
> +	HFI_PAYLOAD_32_PACKED	= 0x0000000a,
> +	HFI_PAYLOAD_U32_ARRAY	= 0x0000000b,
> +	HFI_PAYLOAD_S32_ARRAY	= 0x0000000c,
> +	HFI_PAYLOAD_64_PACKED	= 0x0000000d,
> +};
> +
> +enum hfi_packet_host_flags {
> +	HFI_HOST_FLAGS_NONE			= 0x00000000,

Are these NONE flags used/necessary ?

If they are dead enum values, please drop in the next version.

---
bod

