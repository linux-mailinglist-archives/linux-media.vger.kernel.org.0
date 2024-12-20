Return-Path: <linux-media+bounces-23963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 363959F9C79
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 22:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6706189128F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 21:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD528227B8D;
	Fri, 20 Dec 2024 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HL7HC3j1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9009F227565
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734731555; cv=none; b=ndi29AjY09FbeECR7a2fO0/SpoPiZnrbiZs4yND1moYsJ7iyikYh/t7v7lti+4WXDRtTUinCeBGM3jIbSYa9mLqRMQmGWFhCTmVxwTBwz+RMGhNN4tRg995CGZdi/5ckIRNhXLCqJYhakPAdyuJKMeAFopfCbB8Z7v8yfz5xdrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734731555; c=relaxed/simple;
	bh=TxFGmQcANXITCMUakxHMaHhUdHC1WG0U9GuIL302E7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9LZn3gNA5og4FBJT8A1/qB28aYUaB8t8rAc86PvmX2XGC7EuPlmOqOhpca4Kv5GDaScL+xjB84gU6HizMRrHjBQ8ELXI15GBNGsQarL4+2zGC09dqhb2YU+mePjLpeg20RE0ut+66P3vt4SKtacL8nAnxTldyip+nAX7j4QGVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HL7HC3j1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43618283d48so17575045e9.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734731552; x=1735336352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GflyhNrpgauFrgfc9I2Wz9BvFOz7gh3MbKsXw3O5BoM=;
        b=HL7HC3j1S3oh15u/8hiRIUM20dHx4hXMg9mohX/krsSQVHTF7kM4j6UoX2ZgI7Fmn2
         Cv5B7QNJIVj7Q6cdsYfAszGAzzZnHMyaDyzMoZLr6xD/PBoeMQD/hMcHeveoJurQeZMs
         5S7IJ4eq2P0lFD+mM75pglyzSNl3twzyxJD/Lwt7xb+p/G2igGQAQzzLXMunhlSXn8x/
         GeFSrbUoiSHNA2bkZHA3r1rQCKrUKTmfJUMpRrYUl6ShhEliSgnR7nV6c3hjahZAAIiP
         balWIsJ/ggSh5fQbNuL+WxvEfkQP8IX4wINHQxVL9v4E0zaL+GEeE7s9mbgva88m8F3G
         /WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734731552; x=1735336352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GflyhNrpgauFrgfc9I2Wz9BvFOz7gh3MbKsXw3O5BoM=;
        b=Rz3MCJPUfrcu3SePzJjUIzE4RlpF8IYmdHXjGE+FBZuRfa3aHdILKimJ5MumWURTCu
         8EAjTWvtp0gny2pt2acOcH+XIzIzX0FvVKPiNKv4bMk6ABfRjuUgeT0N1XIGK1VHDy8E
         L/PJ9RKMLdZRhyN8HCkDjgvKEtv+L22ViTv89uKZ8dF0T+VO6kSEu0XOFdwuNvQYbe3o
         vVrHisKhZixqjxaFveJzPOKGAuQ0drX/WZAxLaR6HuB71GNe/OlbLwomve9HQ+GXFjEQ
         QjLa81hnmy7H88c5FOn4JpaVsIgudyKvSB9KdjyuwzNoP2F+uzypxFEkq7JhJOxLXPvB
         M1Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXT2OFQp4GOsllur0CTNKzTs4IEROEtauSMBgCdaEKSe+txi5Sn2V2McDRfhMjiQzBasWRngAoIIHu8ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC7BRd/Z9BU5nEGjWPRimBqjzjoiC5kzrnLHqjO4BYfliFox9r
	BuJlqwoFf4Fox5569UnZ8Y97PneDyx927/pg5nTPSSgQsFPEUNP60DESSdo3EO4=
X-Gm-Gg: ASbGnctgDliu/WyV654koW3NjzIxcZfw6L/3jjQSdp+mk0QOc3wr7mH/DRLEF7MYrUN
	OtrQZlhnUJjWfvNL7r+7NGHRb58NNFjJlCVzJ/8UE6NRmvrcn2hkByxIQxnAPIvGBX7x6FtQEeM
	uF1ckPOm36yNDrq/tuEACpoS7yPtbo9s7AtZZUJn0vnzpUR0SNfGwLN264q0On34v+tEUFHew81
	ztKEqv6l/ZqyzKxIOZiOeT+JOlZ0Zon2LArPjBKvfOmjfITJfypEjdBRi3ruyCR1mJRmQ==
X-Google-Smtp-Source: AGHT+IH7vIEbheKazph9ZT5a6ftFzGeh2RAJiHIoxWCMAH8baip69+mG1QKRv8RjjtVI2BCtr3AUiQ==
X-Received: by 2002:a05:600c:3150:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-43668547374mr31563915e9.1.1734731551890;
        Fri, 20 Dec 2024 13:52:31 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a8d3dsm4906298f8f.94.2024.12.20.13.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 13:52:31 -0800 (PST)
Message-ID: <3ad46a7f-e2c7-4b68-b6a9-6c5e093d14b2@linaro.org>
Date: Fri, 20 Dec 2024 21:52:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] media: ov08x40: Various improvements
To: "duanek@chorus.net" <duanek@chorus.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media <linux-media@vger.kernel.org>
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <b17e044e-b219-4245-9c03-88cfdce2f65f@linaro.org>
 <c8975cb9-3d57-4290-8ce9-7b13fd9c2639@redhat.com>
 <21fb2807-3886-4559-a7a0-dca3031a5388@linaro.org>
 <759031849.104848728.1734717736340.JavaMail.zimbra@chorus.net>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <759031849.104848728.1734717736340.JavaMail.zimbra@chorus.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 18:02, duanek@chorus.net wrote:
> Dear Bryan,
> 
> I appreciate your patience. I'm a total newbie when it comes to fetching patches and applying them.
> Is there a patch file I need to download and apply?
> 
> Sincerely,
> Duane

I'll offlist with you about this.

---
bod

