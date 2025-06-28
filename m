Return-Path: <linux-media+bounces-36144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8AAEC373
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 02:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B5DF16BC72
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 00:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D97BA45;
	Sat, 28 Jun 2025 00:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFGND0f3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18697171CD
	for <linux-media@vger.kernel.org>; Sat, 28 Jun 2025 00:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751069496; cv=none; b=drmsFl4wBfagEGP8czTQvBKfP1r4Mhb8aSURL8xnkLE3fgTteD4v1qKBRGKpRYVqHodOKs7kvPZpnFMroais4zNdkOki8HikYyySYgbXhgFiTm0ZW7UCFI7VvetcE6G9XgPcwF7W8DvD12ZPV88jmFZwU58VJ46tKBJ29wvFgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751069496; c=relaxed/simple;
	bh=uBQbo5iMVnxUakkWGfQfqYvzQz2JrWtPUhU7S7jRzXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cwt6dxLru81H/mZFU5NqnhJh7wsnyJ+iNpNvRPZEMRJ6qlvMYUsZ+2WrXfYJLyKKDfl4BrNe/8Mfcv3gJqBOjMMSs2hmdIvBNAHEJGdyHMBhSfwBcz2OwnldOnglRr3+DLMW9WMA1prZtAT6L9MNyyOwIBl7Y1wh6DF8gSnq1WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFGND0f3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2429719f8f.0
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 17:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751069493; x=1751674293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s15vDRKUOq7F0Ny0clbnx3xH7J1DZ6HVZAZgi3loRHw=;
        b=rFGND0f30p5WjEO1vcUiu9ZiheRYq1ZiSrzenFFE9FtpH7iJECuodclMRoZdttGwZO
         hEFHwzdayh5wPo8IvQe7uFW5QuiAHLw9nSBHM8fABZmysnReYIo+N7AigwCGgkdS/C8E
         nguXCHTFJ1kYhJA3RyLmy4tVY135dE+8MvppYVAhwr4NiS9a3Llt0BoQx9F5s1n9beyG
         +41fAlCTHkh2gQi1LzQcO90+vMWAmyCTVWezia3GJm8ArchGm/LX5bwAJtuaChVJQSU9
         CjEzJzqg7xJv4bRNmhN5ZwOFgmxhDM1RbFWK8dWaGI7TGr5BlrEkdddqFLEdX9gCnitx
         Sf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751069493; x=1751674293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s15vDRKUOq7F0Ny0clbnx3xH7J1DZ6HVZAZgi3loRHw=;
        b=Y0dMJj9NffeUkoJnMScQivxSA9xU9Q0To9fLiWO1nSbS4Xx/U1ekEgs0AG3ibUCQ8L
         7PhK/IaWOleUDZZQBIn3dUehXdYV6ToCSUyKn+/cI2XMFf9l2kFHsRP/S9uACw1apKtc
         JXve4kBHqfZ8GjmyvPvuyBDHDv/puWJIb+0fKHdNyGOw1mwWHWuBQvH7//rDeGSg/Snf
         2+lQWX7Y/U7mIyJT2/RZ676JFq/rnNcDLWRzJggwMMQqxUG76xYYot3kFD5eDQ3/GS//
         kMxpGz0vHq8E/kBnRoj8lKRAM+uOWX98dBQBDuavGFBEhgIJr3WKGj+CMyjAPGLSiVnT
         cZYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHXw+2iE2q13lWGZzzz+gCS+KsbtD8VVJ8DmrmnGQstFTu2PIYHDkh9DPHMn8qEkTFjjHV0IFBf/sb5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4PqHNYvJ0jMIpc/xsdqGEGPvx/cpxg5Ud7Z6zFx3h19i+Rnd
	rXKOZYHHuXzsj7mVb9Hu54pFilKBM3Lf6hcCD2gGp0OzlXL1oKxOMIoHaJ+RvsfNPcg=
X-Gm-Gg: ASbGnctXbhB7EegmCEmjnW8COQaDwaPKRKZlHfXrIMw/QThwKBdhLhu9bvjDcJbEZrA
	0/jPQlQyx5ywnyp0wyGFtg0vKP7wl4M03RgT/luLhYvZtlidoxnNPgq4LkxxSUCKUpA4hrbc+p6
	3+7Zs2jxVE/Ui2tpOVrk2EKkc2VEe+rGAXq+q4EnpNPBOzQgzDIWmqW7WGHcRPKUFo3T7y5ePWH
	b5IC1TXVMh3vHqZ6dkz8E0KIQTNkMHhuAXRAGAOAg3i4TYZhHUrIh8pVfzFxhzt/vkpQXheeyKm
	GW4epTVlkErue55QEU9qPOzWEaINW7yNs6l6+uMOn3xy+yQ+YHlC7Yt5D12kGPYA+xaWZPu729W
	u+i5/W+cLE18f16kyYDaFsFpM3eQ=
X-Google-Smtp-Source: AGHT+IHEph8hTm/+c90vekydvUYhf3gL1EyaFqW0n09W06PIos/VaFuxZFadJPxaAaE9jmN/YJDTFQ==
X-Received: by 2002:a05:6000:22ca:b0:3a4:e624:4ec9 with SMTP id ffacd0b85a97d-3a97fcd27admr3978325f8f.3.1751069493382;
        Fri, 27 Jun 2025 17:11:33 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e595c6sm4064848f8f.66.2025.06.27.17.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 17:11:32 -0700 (PDT)
Message-ID: <514d6f21-d053-4e2b-b52d-9e05af1901c8@linaro.org>
Date: Sat, 28 Jun 2025 01:11:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: qcom,x1e80100-camss: correct
 description of vdd-csiphy-1p2-supply
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250627190021.139373-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250627190021.139373-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 20:00, Vladimir Zapolskiy wrote:
> Correct the given description of vdd-csiphy-1p2-supply property,
> it shall indicate a 1.2V supply.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 113565cf2a99..b5fbf7476da9 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -124,7 +124,7 @@ properties:
>   
>     vdd-csiphy-1p2-supply:
>       description:
> -      Phandle to 1.8V regulator supply to a PHY.
> +      Phandle to 1.2V regulator supply to a PHY.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

