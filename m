Return-Path: <linux-media+bounces-23920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C17C9F944B
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 078EA16CE7A
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7382163A7;
	Fri, 20 Dec 2024 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JN/t/EgU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B83C21638C
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705015; cv=none; b=LTnE+uKQCFAcpbDpvWEBrNX3PR35IDciHEh3i9OgsZOG6NGWdH6jZoP9Us7kDziAzdwxrwKqAxRitQObqBC/dhDZ1/tn80GflpINHBa3ekGTKOEC+cXNspO7etSzOmBn33nMhPojpgiT7y4xfa7Nq5JJrAzAZfdidrvYGU92yyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705015; c=relaxed/simple;
	bh=tfeGETRKlYVa8h0Fr+R/DcyESaKI4Knma8lCPG9SQVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0ys+KY9ig/zZEV6jLpPt/NhYvIRjp8R8Tbru6A+FjOEWnhQneUa01IQJQUC3uTkp2oFbGVdoYqMHIQiyLuTql6uByg6Or/o14APK332f5gnjVOr/NJxTjjXW0PvR/bEBmYAnxZHifseR2gPw+8sFdlHkbfHJSP0avHbPdykOcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JN/t/EgU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385d7f19f20so1019748f8f.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705012; x=1735309812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3IcYqs1WDCp0JEOw/vj0KFkPTgPhKODvxh7fP9QpLno=;
        b=JN/t/EgUdaHDzlP6gShKZFm4RyYUsPKHEegS2r2ynyDhD18lm/qZrFg6IoRccqmk7V
         3F30XmSNaxr5fAMvJQeFcSPxEFwvthHvf7ivkFJ4VhZBtqj3dcaRL8h+HcReBA4FI1me
         3jDR8IO/XFiZNF63/LPXiVgW2dqvGLdK9LPNNIYCykBLPOvIwk61E4p3HYnMWP7JOQq7
         6Lz5fKKkptl1Li1tNgnwPIwzc3eTqk65GEh2HccAzAX9bAdpyZY2D4WbU2R/mwTIUjbC
         K07RVNAWgW72hDEpYLs33pXOnnVJirWxYOLGXhLoakEVjmjoRQgUo/FsG4VLgLwADhKV
         18bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705012; x=1735309812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IcYqs1WDCp0JEOw/vj0KFkPTgPhKODvxh7fP9QpLno=;
        b=NmDJfRc+bbsnGZA+blW3pLXv0a329Kd2im7+t1/K5L+v48lkidoZIsMK+Zma5Y+loE
         IGB4AjmbLJg5fYmuddR0Dg1GJXOEcK4uoSUyXn64kr/KvV2o2vbGKcdfMKG4wY0kcjsE
         hwBw6NK+g+BgUC6zA2DCvyJyWtoW5AizeSc3/6L7yt6ZLUlrExerqUK8gNgix6W9oO5w
         KD+hu85WggfWIdMa3vMJqWQBv6tY2D+9yfla5sCL09OexrF4fCoqcmM/+dG8FBZCogR7
         XjFlTxHG+mqweoaTp/D/ANM6syoCyCL+7V5S8QufxzKJma96LBWh0mA7oYkN7qUO7yAA
         NfOw==
X-Forwarded-Encrypted: i=1; AJvYcCWZwlv9ppI1BCa8xeMEYcQo0yLT/uoZhoCRPVHDtA4W8z7OxUZL1eJHIBgc1IXePCsKVlZaWPOP7uusbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUMdRN+LEPdfAUtxN22rOscE43MmsYJihXwokOAWFcCpsaDdc
	u2TJEGrhZ1qv1Dcxpo9AdHaBejNGgdXIClu99RGKvutznuH/hJyt23+TUtdSPJ8=
X-Gm-Gg: ASbGncuJGpZrG+CGjzJ5FquliRQRzzkTBuYsgRsfJilSzWMf2FiZD7ch3iRTk+7OMU8
	7rVnzVVr555XUuTFjyWhsQx+hbITSA+W3JS0mSdMIpgpsR2x8vHiOkZ2LLMGBrMujf8IORxvnRd
	rx+5aYrUlEBWcUY9AD8/j/x36WFXsTi+i72+O1wqwxZe59HvC629UCdqwkuSmDLPFJYCYfMzZC7
	j2i9XcJvCR5VgDMqfXVutWV1dt5jo/U9ytclVMQr3QHai16/l2u72gnYhX4pk8GJV/3Mg==
X-Google-Smtp-Source: AGHT+IFzkgaBj5GZb6FiBLHl/y6XlOIzdo2+VZczsyh3BKGcWMe31J8ysdbF/jQVftyf3sTdVvC0Ow==
X-Received: by 2002:a05:6000:1882:b0:385:e0ea:d4e7 with SMTP id ffacd0b85a97d-38a2240554fmr3450903f8f.55.1734705011904;
        Fri, 20 Dec 2024 06:30:11 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474c2sm4119099f8f.55.2024.12.20.06.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:30:11 -0800 (PST)
Message-ID: <bc775e4c-6870-41d9-82f9-9b5580d54caa@linaro.org>
Date: Fri, 20 Dec 2024 14:30:10 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] media: ov08x40: Move fwnode_graph_get_next_endpoint()
 call up
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-3-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219134940.15472-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 13:49, Hans de Goede wrote:
> If the bridge has not yet setup the fwnode-graph then
> the fwnode_property_read_u32("clock-frequency") call will fail.
> 
> Make the fwnode_graph_get_next_endpoint() call the first call in
> ov08x40_check_hwcfg() and return -EPROBE_DEFER if it fails.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

