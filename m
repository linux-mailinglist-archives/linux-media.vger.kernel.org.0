Return-Path: <linux-media+bounces-23923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A018B9F9454
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A73D37A2B8C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA15216E1C;
	Fri, 20 Dec 2024 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWqz/Tle"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074EE8632B
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705094; cv=none; b=nEJFkyOjh0nN1VzbZOpyb+ZimpEYt2Dmqzt77jlGOooGljgSFbf1J13drBHmmTNZMpeFjxC9TB9H26QrM55KcBYKGquALvmAdEApCUPPmTao+ZqUPml96ihpy6ydXe4Z/C5y0RySNtA7MoyXoVfvpv7FE2EjAMdRnwnx4O90Z/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705094; c=relaxed/simple;
	bh=oNm2rJNQYcfO3sQS54g9cCD4WHP/ylFDc5xj6NwGiN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlEJxa0rMHNsoNBj89jqgOT8bDCQdCGRZi+wZfswRsAjUFgi8QTDt5tX3Av815E1PdWN+pTjbMEHy+VPzQVIdw5BVnKzIio2R/MHOJvoHz9a4AW4G8glEEcfOZ+okkv3F28RFw/aIJmyQf+nHVXDiam8Zjg8u7gw5ji0CmkMRMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWqz/Tle; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e3621518so1069378f8f.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705091; x=1735309891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPE6tyafSbS3BZouLRSJFnj7d36v1YmPzNBTbhUboJo=;
        b=uWqz/Tlendmso/noi+M30gr9hOch6mCTDwkcoSQNDATuSP68IYXg/yQ0FluuMryoUj
         ChcJ8OESH7slftqPjCks44NduBWKDfeKnaPQq/LpV3woZOXacp0jRPPFX8OpGinPkJ9t
         ff5JZ5maQsmU/2msNV34XpvqHV9yJUzoFnnPHs/RM3SWeSkZWjyhOWcEq/QWYiwwpoMw
         OAS2a+y8tdEeACth57YZM2H4A6M6ejfBHlEG3d8JlKn8iG5kAhZIlnVHWpANMkNMLm1N
         EWrrGAMFzsAsJ7qRiirW2SEXXpfN9QscYV9zFZ9wPKseNvvGyIR9NPeKYF4bgDqBawa7
         zGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705091; x=1735309891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPE6tyafSbS3BZouLRSJFnj7d36v1YmPzNBTbhUboJo=;
        b=ckgS0gUQw012sRWxfhWfy2oFClHDu87OXxJwCYslnPJXt+oMFUuau9+Qd91aU1Yh+/
         B+/W6xvgBI0GYzl1Rfp9Lr7/+uafS7Y4wHg/YdY70elcv8wtc9jgg6pLeZ9FoOGSUm+o
         E531LAlK0Li9cS1KSCY0MzGZ6bnzpHYf7jgPopqn9vlcpIXKqAhIyADrf7TbNdHQEdZq
         9hceB4qtnNPsU6s87O8sywOE2Ky5gNOv7+j/Myc2XRldKLA7UaIhlGNb7KbjAyFcE/oo
         S7Hg9UMmcYaEVvPw29Og3DbPfmlmhzltlU5Hl/IWjFdVvxonKbaZCBrbIKHgz417qxCr
         S+6g==
X-Forwarded-Encrypted: i=1; AJvYcCWzXzgFpxzAZnDaFp6QmvsV97D9QYqMdcrann9W+5wprQXK+8NPJ/BwvbQtv+2wWhf6TsHRhBbs1wOy0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FDidUU5Dy2IQjPZUrzlDFuWf2Pizcb7L5nuLSq0gp9OCdQWq
	1r9T/afhKVOlcImcpLo3V9ZvGkGXQmY6iPcCqI9ZLvp2Z5zO5mQe8Hn0/GYfu3Y=
X-Gm-Gg: ASbGncvBjBZA+fgOUQ8HkCyq7AAKYWC1FdyPyn/7YliIoBoJb0PD4OcPCfynPPLW8wy
	O6Ln3t496//MNgKIF2f5c1LleAnmrQ5uIiIpCnkdkmZDnQtnW+TUhzSxdmMnnUKxne7XHzknmDZ
	XcQ/KrlvCHlzfbLUIiB+03RJOo3QgO/FXaYxkng+k7EzAgwnmx/otFIzVX/IrW1XrzjxiuMLYP0
	udELiJVPP5GPDk1Fcnz+sCkCrCU0piwhAjDYMgRBOhk6sdkFcqpKBNnagOvqr3vz7ecEQ==
X-Google-Smtp-Source: AGHT+IHZyHayKARoZwKu731eyR3b2VDgwquhVFvv1Xl+6Rez7frK3qrqEwDWBdEafCzQlUeuLnlWyw==
X-Received: by 2002:a5d:5e09:0:b0:385:e328:890a with SMTP id ffacd0b85a97d-38a223fd7e1mr2892224f8f.49.1734705091157;
        Fri, 20 Dec 2024 06:31:31 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm4198838f8f.44.2024.12.20.06.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:31:30 -0800 (PST)
Message-ID: <2d28b11b-7057-4039-bab5-d7cd1c95ee22@linaro.org>
Date: Fri, 20 Dec 2024 14:31:29 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: ov08x40: Move ov08x40_identify_module()
 function up
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-6-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219134940.15472-6-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 13:49, Hans de Goede wrote:
> Move the ov08x40_identify_module() function to above ov08x40_set_stream()
> this is a preparation patch for adding a missing ov08x40_identify_module()
> call to ov08x40_set_stream().
> 
> No functional changes, just moving code around.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

