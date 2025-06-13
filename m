Return-Path: <linux-media+bounces-34765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E09ADAD8F72
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5C293BA8D9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE645192590;
	Fri, 13 Jun 2025 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eI/LasO2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F25218A6DF
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824462; cv=none; b=MfR63mnrBCDlVmEFXhCtZhJBr5CJ7vZJOU+FYDJVStMGrjowwx2JcsgRIYd1zfeApMzFU78GhSR/qDPX5/WNG5gVgXvzam19ZJEO7GO7UJcgrhRD0XItk1pwSw+MLNCqkAOE+KX9+Aw/lv4xXr7urjO5worRvPwhIrWUrzFTCVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824462; c=relaxed/simple;
	bh=8RFkh10HvZ/w2jf/t+vYn3rNmrLXvK7k7dDzREKy4dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8cbZx/httR/3M8Wh9x10ILqI+3dJXFniT/4bMfnFqMBryhYIm5jA20CCGP0TMHoxkcP3A9cmyQaPCCfA69wzN/OsekFpmXc50tgF2wVXdcfM7deww/XbJT+uHbnNe2O6gYIUkVWkw3H1DIp2MNItv4UR757o3gH3z5kEO06Q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eI/LasO2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1436874f8f.1
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749824459; x=1750429259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNv7YJdDrmh1DAA1lS0dRZIzLrEmVq95r6unZgFCZ3Q=;
        b=eI/LasO2tnjA6J1Yf7mSkjnnWC0eQa8CS7Y9YOkCwi70K2w/IRoU8L8lNkKy5yUUR1
         TA4qF83dDv3l9u5low2DaHl2Uq5tURZp4bu1qwM01jIXLC2uEX7otbJ203LlPfGbe294
         I9+DE+UJBwZ/lbR73CqU3xtZ67Vo9MiPuPamra9H28jb2g6+A/GeOMD7WhawQ95xVBz6
         Cc6+rqXD4j3Mib6pKWkq/sb1Ok6rxjyDzYjwLt1MlowG89eHjrUDUyXYwe57Ix6C+NND
         aDwWSVTjoYTzuBfuG2IrxgCDR9IH4+N5kpxbTeSt6KdQtbc6jL4EFaybw93MvKhYloZw
         bPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824459; x=1750429259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNv7YJdDrmh1DAA1lS0dRZIzLrEmVq95r6unZgFCZ3Q=;
        b=oRdL+CsLKWMbeb28BDF2gmkD3GlIrHLdk6H6TC1+EgaFQuzII507iHhhVrK/lvQeet
         WghpPVpth7fRJ5gaPP9ThTjszGUSqLWAOeExghP2MOHfq+OUuk2MjoyunB22UQ005ad7
         V7B+AGHlPiBu+zNn5wEbnDgSszkh+q1GB9E6tuTKdQnsTTScmcJ7fP5+zUMsxWFID24i
         7fYnfPJZBR68OE04WskVAWJ5gIcPzrNHZxCIGLQK3EylzoySq0Xfj+uZpObukw9xOqPB
         oxOTYFW8iY2oI0WCDhsvoNh8YNtOsf/nbTnZoJK4oY6k98tSTEG1JZl3VGfyL+/rF85a
         sBNw==
X-Forwarded-Encrypted: i=1; AJvYcCV3tGAtYkC88Mk2NiCvLt4rBlC8XuRrp7JkXA6Go9DS9jXXkpNRtpGhTbavmHQZeQtt4lqhJxAa8IHipw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJsMFjxm1E8vnVKKlB0R4ke8FlTs4EAp2eXENhVGNHoFU+0St
	g0f0dVqIWIh5ya7x3VZsRJlFh5znT3RxW3jTQoDTTSpeG9aCuwaQfbtJ4ccFkn7bANc=
X-Gm-Gg: ASbGncsGeApYmDL0UlVm3oqBMMoMoLt3VOsP6u3BToXASiNG82tQvd1g28YWb+8GK28
	JFuoBcULGKoNDDgrqnB57g13SvDI5aqtA0DTt3njhqHK4tBb7pa6EjqI7mSSpeMeugLhTmdwuFK
	Pg9gtvdWSBlMvtxGJeRRtAYBTjtT/jb9Hzg1xgkjWkyNPAsFzivTGml+Jbj84O1kZ5CS4rKZZpA
	ssGvEBMWhAU0y70XhGTIYKpqMqSkmLx5dOOe6t+2HIfOPdxxaAqDYnWEhWvDBctWl1phgVSvyIZ
	CiYCdcGGcOo+OaNcqMNJAh5l2UTv71cvJFSlZBtZflRm/84IePkwba0jlW6vvzIhIp5I4Wor5Jc
	qR6K7Fyf6XuD30eY8SAaNxnasisk=
X-Google-Smtp-Source: AGHT+IE+UNToq+LVvyKCGQgv9Z4GcwrsaV/DBnUpsoTzZB4YzEzxKPVKycpy5RHgs0fTAZp+V0+Jzw==
X-Received: by 2002:a05:6000:420a:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a5687298efmr2771830f8f.49.1749824458733;
        Fri, 13 Jun 2025 07:20:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5689e5f3dsm2557756f8f.0.2025.06.13.07.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:20:58 -0700 (PDT)
Message-ID: <98cee94a-c9c5-46c1-b6eb-f5141dfceaab@linaro.org>
Date: Fri, 13 Jun 2025 15:20:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:03, Jorge Ramirez-Ortiz wrote:
> +        video-decoder {
> +            compatible = "venus-decoder";
> +        };
> +
> +        video-encoder {
> +            compatible = "venus-encoder";
> +        };

Not necessary, drop.

---
bod

