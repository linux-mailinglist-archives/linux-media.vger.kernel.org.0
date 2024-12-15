Return-Path: <linux-media+bounces-23429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EDC9F238A
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 12:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B91EA165171
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 11:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8984D16132F;
	Sun, 15 Dec 2024 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+loVucR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5FC15B102
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734263918; cv=none; b=QJhqJTayY+OyklMbZjlSdDk6cMQH3e5uaw2Wt+mmgQlbxv0hweYkYN71mXBbDAb/wQ5U7ZUj8Uqrj/oSoDsHW09EsokX6V86gQWAA8NgUmQ8ha3BLepMm5Q5SoE+IYFMWNhNLK/u3k/ncEMV3mp5mqMmTL0MnuTujPO4P1eGW4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734263918; c=relaxed/simple;
	bh=d+pfu1XROrpeafS1eYKpAbT78e7jb/FH6/Nsca/bRPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqZXGyKalAng/ljYdTnGc5TtiJHdHli3emu1urnZ+i3LZGPnE4gagf0nB+UdbPf3Qq4A89ghiWGhORzY/SrXigGh/ycsoYgn7gtH8kEDPwUjwboVScL0PuXcRHgr33T1CiZFs0rz4qMePzUJ/4ljzjUkLvWfTtJrGNni67Ke0DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+loVucR; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30156c52c25so1768391fa.0
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 03:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734263914; x=1734868714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/kPa7EZggbMZnJnKi8Z8wUeoKFvdbp7AEN/NzD7/uM=;
        b=w+loVucRhsmWiDbf82U+klvnYYUpP0/qVvu+HehD3bfOy0Q+273ILHDXzUePgZCOw0
         Jx0FB0E0ZISQesSqMQxhGM+a53/0VAIyZfIt98Tz9p+hTjigbBNnj7X9dH+AC/LTYXwj
         OQiyFgsp2mSoE8SN+Jkdf7aJRT1V/GEwG+1oiTQxNNRQwxZxzE9DVnNXoWOlM4R3DwLq
         t1C4SyPLBQDL5ZPRFgdu1WvaulBCDtzWqFIzLV329gMIu8exyasAI/N9Zva2ko/bxTvf
         twKRHr3MBml0vlOsQlyslRz7QOasBRr+/ihV1/AzBggkNs7WcVjeMBUZBlA3JqXVKmdl
         cKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734263914; x=1734868714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/kPa7EZggbMZnJnKi8Z8wUeoKFvdbp7AEN/NzD7/uM=;
        b=jfhpDHXDWZ5iU0SOBD3NGz8dPa3QzMUJARhM61Qm9qHiOPFgcacBYhqrT/Rcg8GnZF
         S1j4+DZ1EW12g90yaMH50oYN21fqOsW8a6TON28D1K6mF/eEZ4cNlKZbEr+Y6uBbI42v
         n1E2ys4t9N8PCS1WgG2qDgkLVI6hXZ5nxGo/2DqcCPcBV7LNiRTWpWQYL/Y2WjhaeUUw
         UY2CdQtJ3jBJIwmdQKH7zKF1xVKoB6guXdoTeq23/a6Een0/RQSXad04D7M+5RgPkKTE
         5nQp1aFDgWFk0QRSV+8hqwpOWTKZkw+fmupsF1vkrYMPX+p/sxo2UbS60eZIS+MQ1TJG
         VLqw==
X-Gm-Message-State: AOJu0YxddVDvlVaxgpvMWtTZAX+PTUvTK0pqt7RfSNOTxmBEwRKq1HT4
	9qEYfi29Z92r8Xylib0bjK453jkV9PixSNyPKQ9nnzkDgU7vZvFO0vwAkg4L0Bo=
X-Gm-Gg: ASbGncshVh80j9gTsjlKtqpfRMk4h7VQUvkdMpIjzHrfdQ7dXcDFdXVP7ODawq5bN4m
	dSKBUOKNbUlmpxKNZUHHKGwkAP94VPB7k2Omh3KbCmaPqbIdt6D0rrqSRlH4dKH7y+5xigAg/c0
	VrntfU9oIhwZvt2lU6PGBNomKgeeY6KY3glS2RWhuiFy5bKcBwUcNBMSDo/ppnrvT7fbPkM/hhb
	cAlBHkJrwipkQB6FNWk9Ah11mf9kg6DT/cbfPW73n19023sZr1mUJC+5O1kdi9ajuhBBi6nH9Gn
	LEhBlZr2SM4iskhAuPS/7uy9avp55LPR4Sk=
X-Google-Smtp-Source: AGHT+IFTUZ3GMs7Nz8u9GUpy5ovc0Jqqr01QOzyL8po2NQJCJYBql7UOXcPOqTrAeb9lNKlyvbQa2g==
X-Received: by 2002:a2e:be9e:0:b0:302:3d74:a18b with SMTP id 38308e7fff4ca-3025450026fmr10348671fa.9.1734263914271;
        Sun, 15 Dec 2024 03:58:34 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045358sm5491911fa.35.2024.12.15.03.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 03:58:32 -0800 (PST)
Message-ID: <60bfe389-cea9-4aea-9175-fc80f1e9f594@linaro.org>
Date: Sun, 15 Dec 2024 13:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "media: qcom: camss: Restructure
 camss_link_entities"
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241215-b4-linux-next-revert-link-freq-v2-1-62d5660004ea@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241215-b4-linux-next-revert-link-freq-v2-1-62d5660004ea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/24 02:33, Bryan O'Donoghue wrote:
> This reverts commit cc1ecabe67d92a2da0b0402f715598e8dbdc3b9e.
> 
> This commit has a basic flaw in that it relies on camss->res->csid_num as a
> control to index the array camss->vfe[i].
> 
> Testing on a platform where csid_num > vfe_num showed this bug up.
> 
> camss->vfe should only be indexed by camss->res->vfe_num. Since this commit
> is meant to make the code be more readable reverting will simply restore
> the previous correct bounds checking.
> 
> We can make another pass at making camss_link_entities look prettier but,
> for now we should zap the bug introduced.
> 
> Fixes: cc1ecabe67d9 ("media: qcom: camss: Restructure camss_link_entities")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This change is very welcome.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

