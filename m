Return-Path: <linux-media+bounces-24255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED6A01CD0
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 01:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98BDC1883288
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 00:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C917879C8;
	Mon,  6 Jan 2025 00:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAvn1XiM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D656635
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736121980; cv=none; b=GU4W2jV7LOUwXUNjt9xSnUs42mjZKq57PANcYyqMiL2au1toUhoifNXOqoAdEMe1LNURkt19jDa5wO0PQCB1JOIQi12STcqPY+ZlzTiay2MtwbVEU4GrPUTA/jqoKkGHjqzb16xDYToAdkN5bg9jKCXq3fjqZzjlLUwT+KGRaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736121980; c=relaxed/simple;
	bh=oA6J0g5TF/QPJwoe/r7VTCId1g0D4HuEHJU+6/4mICA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxZAUpYSGLikMprWw7cko0jXEtlYBFKfctey52lOnS3aQr1HqbgyQIqIHnSuqy4vXqw2EzrhvIHVybFCGrbgVbjXvpM+oV2oQwOWSseRBeWRXvw29e1j8bVkJ6P6u/9GLHpFDTwzTV4jnAuZCrt8m9eQZSENtUpMiEAm2m1bKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XAvn1XiM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862b364538so7907753f8f.1
        for <linux-media@vger.kernel.org>; Sun, 05 Jan 2025 16:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736121975; x=1736726775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhwNhcGJukSSNRtJy+BQbZn/P7zCXQmPoIWo8g+FW7g=;
        b=XAvn1XiMS9hXscgzhMIH4YJKSL6zpQaBU5AF5Lez7osMnSb9QppzI0XtnhCNU8XXK5
         EvKiSrvqLnypByfVLJO+QQaKLEbVaHiHNLkHjrGVY57Id9OTJeHVX9M1KZDIOw3mK51D
         Zmt+H2gxUwpaJULZsA4kNf98gc6efPgTbVx3y6pWQsZ5K8mOXCOrLjZj87OI9airnnQ5
         txcb3m/EoJ7DUakm69MqoeX74errk9wm9TXiwBZrsVaN4XpCcIwD8OJlWnNtjNisiVOM
         ahfmGJi4HzOCfEy1qL28gyTeUi3DTRktmNoqO7drDYHN3YwaQxKGRzm6S42BMYXRiHx2
         SZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736121975; x=1736726775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhwNhcGJukSSNRtJy+BQbZn/P7zCXQmPoIWo8g+FW7g=;
        b=pDBn+tyWwbIR9/Ba3kLJXY8BSQ3f1RCJzVG223cF6SBmLDT99QREmjXug8WXjF2ED8
         RmbsgN5vHc8NEGttd7BBQ30iL0cEJAqX93+uCGjhhc/yXul3myA9VMLjIkeMPoKVGceQ
         6juegEWqD1VnSDtSMRKbnsgJ4PngMFxAbeAYTA6tdI5YhfHgnHqgInKkoylHSkAyjZ2s
         hK9ewTXJOyCzi8ASXDqmXBU+AUuHySx8JXJEIkiFLfjYn6gvP0XxN61cJy28ueyg/XP+
         gi15+/OQ6Ndka44oryDm/7OGGpYTd1rpo0mSxfRDZx7uRzkd+wQy3MD9Axrh5aXQXYvG
         nadg==
X-Gm-Message-State: AOJu0YyEvVVuEsYgxfXs0oX3HaNHvo75NePqrJj5ZFr/U8i2t8UChrM2
	HGDa/60Y1xLC+mN4gJZ5wyU7DeqJ/9/7rk7RPwuV585r2MvvMl5ovUz1P6declG/cxTG0ZK1in1
	f
X-Gm-Gg: ASbGnctc1xVcEQMQAuOuasAqqwDLnCJcFSv6VhWnwQSU7TzWu+QNS5venOZ07C6A5mo
	gbpZr+Bmyskt1GLbzQ+GoV3NrvPPQ71BDGop+QAIKCKMLmDQ6OkP4KxRrrjfiyotbdzT/BFL605
	c+QSV9qgjCxhl2CdVe9jIm1pdtbA2fxb6cHc49tSUVtDXtAeFWyMuWxh/d2iRh9semeF2BVr4QT
	s7zlzKANRELBw2oZpzRFW8np6E4/NoPaaC3inA4QFtoL3BHWkxH7bdbtPGtF0QBragT1g==
X-Google-Smtp-Source: AGHT+IHtD0cPqmxdavlPwilipaLcchXkzdRzmlDpwxXuPTk+EK6FZYxYiqrnx+VfEI1fkKR9R0goAQ==
X-Received: by 2002:a5d:5d09:0:b0:385:fa30:4f87 with SMTP id ffacd0b85a97d-38a2276a0a1mr54181265f8f.0.1736121975480;
        Sun, 05 Jan 2025 16:06:15 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45955003f8f.38.2025.01.05.16.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 16:06:15 -0800 (PST)
Message-ID: <2b0528f5-f9fa-4cfd-abda-a0e95ba4a2f1@linaro.org>
Date: Mon, 6 Jan 2025 00:06:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-2-9d0dd4594cb4@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250104-venus-security-fixes-v1-2-9d0dd4594cb4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2025 05:41, Vedang Nagar wrote:
> num_properties_changed is being read from the message queue but is
> not validated. Value can be corrupted from the firmware leading to
> OOB read access issues. Add fix to read the size of the packets as
> well and crosscheck before reading from the packet.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Please see Vikash's series on this.

https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-2-483ae0a464b8@quicinc.com/

it seems to have exactly the same patch title ?

Is this patch supposed to be a follow-up to that patch ?

https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com/

Expecting to see a V3 of the above. If the intention is to supersede 
that patch or some of those patches you should make clear here.

On the switch statement I'd have two comments.

#1 is everything really a " -= sizeof(u32)" ?
#2 if so then this ought to be factored out into a function
    => functional decomposition

---
bod

