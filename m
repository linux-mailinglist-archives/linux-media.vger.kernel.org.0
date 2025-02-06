Return-Path: <linux-media+bounces-25716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E271A2AEA0
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 18:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19866165BDD
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 17:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8FC23959D;
	Thu,  6 Feb 2025 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMdSxuPW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF82239585
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862036; cv=none; b=CKnj2oqc8xGIW/jTLT9qorFHjJyQWxAWfAGyrdgjlzdux3X8BUeW2pUL3XsEWEkzsa30u9Lb6XYfzPL2OrIv5SFOAfxYKvgj2ROgx7XQeUP5kaUhegiUjTO40xRpAsaIsQ/KIQ9TZCdis8xwPqUmEltVBtMW0iTcfOkyjVBqfYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862036; c=relaxed/simple;
	bh=GyEJU0L/3MWVHO0datjwyHCsUmy6MpDfg1f1e7CVeAo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FDo1QtzUE48lSvFrtdb7MZjREuZO+pv/ygNCSJO3YWIrC1U/p5lM1kYV0HRYhX7sG9g7rGkQsGybX7o3QsL8wjFCVZ+WPXGgvkFqrmrnO/50pt4VGGtagORHa4UM/X2o+D8k3sVwOMVcHMO2YcgNFwFcgQwegAiT7z68pNkXHcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMdSxuPW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5440ff3314aso114766e87.1
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 09:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738862033; x=1739466833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n06l2ijL01WqUrkNIC0JdabkH8hZdmIZKxet5fVh6fk=;
        b=aMdSxuPWTp4eLRwIwuM4k5eNqk5jvnOR8kAmMsfv3KurIE89/rQTfQeMNUE7f1C/Av
         b5O5hdpdUcuPGd1+8qbqDbmE32qKwvzysa4LiNEz3+zAy9pgcgR9aEpXUMNzkU7P1DJv
         v3rDdIs0qlyPaMU8kOcxi4aMGI8gNaiugZAX4REz6w2VnA6DUAkqp6C/39JVGjFgCUgr
         9xTRXJfzfidzKOzIFFjmWxUAyJM1XOkyu144u6R0vwasd6nCSXiOXq31032m2aR16+OV
         MEHsQoCmtpO9/XX8MTxOdT18OKtnYn1LHlgsSg/Ll7ScLus2UuQC4VnuMI+rx1OSFZbr
         OFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738862033; x=1739466833;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n06l2ijL01WqUrkNIC0JdabkH8hZdmIZKxet5fVh6fk=;
        b=xNW2Tn7XvM1RgNa2TNfUyolIEQXzCjFT+SIBsQMewOql1ZbDzl6dFgTXBhgtoPvPUt
         XtbQednYIc7cN+KdLzouiMLJBjvDb2XQWzgKtMxEt6DsseIP7Im6qYh0vxLm81LpYq+A
         7AL2DqwRr1zMzPg7shKO4/5FvsL9PfUBcUWK7YNJOxnf2xfpqnbbX7eO9ttkiVFXx21U
         Bol0dOhSgMcVP3VylyqSQ7OtzbF9IrYkPvBuCYp4I1YGTDWH8iJkJBDf+95zozz7tp5e
         5Z7sfFiGBBxNP5i9sYFIzdMF48u7Cc7NftYraRKWx0wTk769ODQG2gpkUn2QriJPrutt
         iHCA==
X-Forwarded-Encrypted: i=1; AJvYcCUFmkQshbfrJVruTblIqiJvyiYHJf88Ic3VyJDxMIo6hgsGLIuTLgm7xkrGD4fTRrRhJ7FgNsQeudWHJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy09Hs0PMP6GsUQvPaDfnFjpsn5Q7fnkc84y38hwOlKh/BakB7W
	aG3ayhvFeGo0tKRz4o2d8MriuL4oDWNY3VehD5gXFTbdqDZUfDrOFp93NzP77fg=
X-Gm-Gg: ASbGncuWhI2AlunlTFyY/SuZyQKbIM0Y7Tt6dtBqhssXn/l8tG3yhfJCWsaXjpy0V2x
	1mLDcv9hOZRReoTfdTOiD2vb7kee77WMHvovkDGDOV6WhQsmgbcSqAiBQmbjcIJBKuyqCkzQpvl
	ECOMLcXu7haAg03DqELyLeFNnIqXqhPBZAeAMCLbrLZg2U22pwKHs2eGMCVoN+rHAl3UShchpTw
	eRN/AlBC+WaU29Gke+sq4FKIgOjvtFNbAaocbPV17jNNIqf+W2DJDyDzoQflCgB+zHYqbqqhv+5
	VH4KJ8iMV24RbBREMKbMTvNmlxwc97rQaZpd6CaEyzkeZNlH2NtPToQ7u/8mZ++0aAm5Xg==
X-Google-Smtp-Source: AGHT+IHWWrgv4CCtFsNqLE/vXmG/2vKMIHZ0SThpHyfdpzv1pApRQd8jikvoaYfgBXVjgPTwsprDBg==
X-Received: by 2002:a05:6512:1052:b0:544:e8f:6c02 with SMTP id 2adb3069b0e04-5440e8f6d16mr604618e87.3.1738862032797;
        Thu, 06 Feb 2025 09:13:52 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f30d8sm180156e87.196.2025.02.06.09.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:13:52 -0800 (PST)
Message-ID: <e789ff43-78cb-4ecd-8949-1d0f8beb1194@linaro.org>
Date: Thu, 6 Feb 2025 19:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: switch CSID to defined MIPI CSI data
 type IDs
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241225205748.1515251-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241225205748.1515251-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/24 22:57, Vladimir Zapolskiy wrote:
> Remove redefined image data type IDs taken directly from the MIPI CSI-2
> specification. Non-functional change.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

I would appreciate, if the change is reviewed and/or it enters
media/devel eventually.

--
Best wishes,
Vladimir

