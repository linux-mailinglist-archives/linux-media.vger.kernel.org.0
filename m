Return-Path: <linux-media+bounces-6854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5C87855E
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 17:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5771C21A5C
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 16:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C6D524AE;
	Mon, 11 Mar 2024 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExQ5/Xjt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364AD4AEF0
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710174158; cv=none; b=S5dnc5kkCysjdhKlUDj+biPA7sthZfkdku+R/JM5Z2BJTmqtPj36vduDjCmW76+OJi+oP6u1bLj96HeEInqgQI2+qTzbEvGPNdwmIOe66vbC7hbMOI9Xog4nvoeet32K/WP31MfpntYFkzA34ehdMjpYmOkDXyi5YnX3yHKLcP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710174158; c=relaxed/simple;
	bh=TGWBHdhRObFJXZsN7lz4Jh4gFRP1ik+fiRvx0Bj7OEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XM1Gq7hvC/VD30lQjIFs3Mx6+TaUQ5x4fkR+KLLG5umBoZHKcubO2n0sJo90yJunx0RpzE+309WBJHSqvw3PzqbUgnbY3PmVhgsgCZpRs4h6VkQAvlNAKZyfx6TpEOrjXFQXjTQDMG85lWsy7tSZYi6w0ZtCpIp/OE7dYp7nkuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExQ5/Xjt; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso4031821a12.2
        for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710174155; x=1710778955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMW0usQA+/2JDgwiFHaoEUsMDf2P4w3C5kIjpwHZkUc=;
        b=ExQ5/XjtHmCa1RwzS90NWiAM//fTp5HaQ2RQt0Dwy93ty2OFCM97P8JJC4h7SqXE8a
         Egg5oxL2fy4hYe3km0oBjuu/nuw1lAqPa+gOLPyw1sPxn0hJ/gaHDv/dHqnpKreS5b7b
         SnT9sNLpnqTiBcRimXGmp/yvr/rjfDZCxBqvNleSYGfBBirjChBTVoQN0fWOXw/FkSDg
         A7izvROYEBGyNOG+ofXWIcZuUTNjV0EfG+S4kLo/89EI0TQfc6iQfk64LRweSZrsqZku
         u7zDj+kFktKyZh15hmc5NRB8svidbvmgPYj2CRaDFdPrGRSpRcn59zx7Va+UQJ6XFyej
         VMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710174155; x=1710778955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMW0usQA+/2JDgwiFHaoEUsMDf2P4w3C5kIjpwHZkUc=;
        b=QP7Sqr8PvJ7lv1dKQVxMd0ahEy8tgddcgQoYiTQJOGYkm135IiAoO38y37A2gVBKSA
         y9y+InAuwRtTt54gTgtZXxSz4ZQ/J5juUphHjq1REyUXuPgR6nq3nr0RkQOGOjyseNeu
         +1Efeu6k6Z5m37E9Z5osE5aSLZumqeM/iPd9XRjal1iQVZA1m4+e2Eg6V2rNFuVdaw8v
         tlwA11uN90OJfnVLi1Xi8326qLx53fhRdq2w0RXEs6SwuFmffxU781IS0zGEsuvql/JE
         KPKVaF//SP1IaFYlpoho1zJEGcD+BqEt5PM3IyFcWCwdiyHBBIl8cPayzJjVOqQzAe4Z
         LURg==
X-Gm-Message-State: AOJu0YwSzh4tg4miKjt3t/CrGQPEoMqTNQ2JOmZwdQMQ2LSZoMqq7CfY
	JS9rhkWluoI+NatWoi5Aap0AD+1i+QfQDL9AP0J0ZeK5EZBsQj84l2BGwFk74zY=
X-Google-Smtp-Source: AGHT+IENgrDH5fiAmB/1105qTepyqCD7Hz434Z6EiqT/FtseXotKqyuwYDqaF3lUkw+P5xEEJ4kX1g==
X-Received: by 2002:a17:907:96ab:b0:a44:17da:424 with SMTP id hd43-20020a17090796ab00b00a4417da0424mr4858235ejc.56.1710174155578;
        Mon, 11 Mar 2024 09:22:35 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id gl8-20020a170906e0c800b00a43e8562566sm2960425ejb.203.2024.03.11.09.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 09:22:35 -0700 (PDT)
Message-ID: <5800231f-633d-44f1-a056-58f87f1d5c67@linaro.org>
Date: Mon, 11 Mar 2024 16:22:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Move camss version related defs in to resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240227122415.491-1-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240227122415.491-1-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2024 12:24, Gjorgji Rosikopulos wrote:
> The different resources required for different camss versions are
> split in to two groups:

Pardon me for not getting back to you on this earlier.

Would appreciate if you could post this series rebased on sc8280xp 
patches which are @ v6 and ready for merge already.

I will find time this week to test your patches on rb3, rb5 and x13s 
with the SoftISP patches on libcamera.

---
bod


