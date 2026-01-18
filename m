Return-Path: <linux-media+bounces-50974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0BD393FB
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 11:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 529003013395
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705D7238D22;
	Sun, 18 Jan 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WisN+iYo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E33257830
	for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732031; cv=none; b=oVPv5S4jqhiDrBxHYryAa5vkBI8HJEkX7duXx+VX2G2YD5TcBt3hwsVM3chfmPhMBrF7xF6dj1ZTwbXLOACN0WzgxECLtczwsoW4GOY62ZbSzxC4Bvg/s/arwWNAffBmHYgMqgyXbbXTALBEYo2zNgWVCSdGDUIZ6DJT2CVB0wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732031; c=relaxed/simple;
	bh=g3v9aNdNytZLZ6rBo2v8ocKbRD+tgP/M2fp0XY9ZWC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/cYoY8uIVApZ1GvUNALBcdNWQfX0+UG0EuQ2s63dRi95xo/7D+Axe7bcXkDzZ5nw7VsyVPMgjHlsCH1VA65qXkPPd9EzzWUrpFIatlEDk0RXRi6X4SwSZivhC2WrhzUjSjxgp5qJjFGDSKlrVSyj2UWUjzRzSlnbpQu7I/YF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WisN+iYo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so17661425e9.0
        for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768732029; x=1769336829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wVayVrE8vfLjDsbFPedYadpWwsg6eC8hmmLmvT9NIU=;
        b=WisN+iYoyZlLt8E6rcLH8jHzINlF5qvyjphoOLJW/ZzznGjOj4lDpJIgfD8XoNA4ot
         xY6IkwkZ9AiJYXPWD6t7fZ2O1DVDnwoXjIbihHmaISUWs+feLk1NJRyvrFU+uhwd7isC
         0tbCJ4Pg/f+39JD0rwu+toacbbI00n2kY76pMm4oKWsTbF8HEuuZmyQfUbP/PEuvbpqx
         mPA4vYNCMybaruxJuKLuHszEGgvetQU5weXT7528KJdFvqYXYg5lplGjoXJgEe/0Mk3f
         zBq1mpNKhDgGnKpuLKME0iRNpjG7aNSwl64zEg2PrdpnJpeR/AYQBacvYVkqNzSFamua
         9eFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768732029; x=1769336829;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wVayVrE8vfLjDsbFPedYadpWwsg6eC8hmmLmvT9NIU=;
        b=mlztalR+uGgPQ6zY394zV/0SM3el0gs69e2wbHsgzgbFNHbEjk6xiikm9S+udm9TJU
         EVqNU7ITUec9+OdjdYrejPEXAYpWnNfU+JJne0kysHoTPBEi6J+pC9JuD8+4bzeIBo/n
         BWI+FefJaylJZDeGzYOvNwMwNhhenaYFJwFlpRoVwBLLBB2MCNFcl3h8ZYSF6I7Fc6X5
         juCRaGKjFPgyMpiUxt3lnCD1WLJBotbacDsJIQPlYuLAftuSJ/8n/TBWCdX6T4HyofZV
         DruFX5D5EQDNQq+0Wwma6MkdL2bHLkvqMsD4x5GLOI1I0Cm2VMftNhzq8GnOkVw42sd2
         OXjw==
X-Forwarded-Encrypted: i=1; AJvYcCVE2kRGeAoEQ70z7mB0dkt1F/VqVoi74YyJh3cptN8vmYogC/sjB78tPGZ4/rvTJ6/wwM7d9RaoNpcCDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLiJFQuYCOOBnSZl1H5qFr573iSKoF6qEkXmIgcJKnOpK6y1BG
	O9+WmhSRgZqp+78OihXt00sYYhVK9wVcJOD6MgRjcwUut0DUgKAVxCfESgIB3CAp83c=
X-Gm-Gg: AY/fxX7ay2SRTBHZ9sGUTAq4pep3pjD1MbSt3nC7pKPY2NhgA9fQJYTRjMJuhUC3X7y
	BsQOXIb0twfQwMwf36SozRppW1XLh52jPn0m1BTJ779OcemrLtWk0DA/NdcEazJ8lD9uxKJEWhn
	vr4lRBNqIO0IzFdwqtKPqPiAdFuGEoIYXf3rKPDirQXirfjly2aKBi38KyDNBTU9Hfe3DZNUaO9
	4LNtUCKunHCHyQ9dg1Fm4PihkA2MSrVT3isKFj1lE1UvpbENuEC1AbqRDL7hWEux4gnOp+jqNDA
	6IfIU/1kK0+1k1h/qdTRcXb2u8H1iISl5UDMMBE0+bnLeK1ShwKu9SCPw24Uy9m+9eu1h15+bjb
	jdVr3XffBfkw2fGbF7cTjtxDwhGDDke8SrFNjCT/KWiM+SRIUigNJFYTFVcYjYuXtCYB8M/yFlb
	oBR60gNlVk7Uyk2ZnqFdqn0ofEyz9ka/8fNXpN78Jxl/C/NrwS22TsdNEakWvXwVA=
X-Received: by 2002:a05:600c:8714:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-4801e3531c2mr111870855e9.36.1768732028854;
        Sun, 18 Jan 2026 02:27:08 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428acae8sm190955195e9.4.2026.01.18.02.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 02:27:08 -0800 (PST)
Message-ID: <fdf976a3-d386-40ac-99f9-5d6d1a175677@linaro.org>
Date: Sun, 18 Jan 2026 10:27:05 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-5-8ce76a06f7db@ixit.cz>
 <4936947b-f402-4817-acf7-299abbeeb23b@linaro.org>
 <010df7e2-ea01-4b32-ae4f-40bff3ad278b@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <010df7e2-ea01-4b32-ae4f-40bff3ad278b@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/01/2026 09:51, David Heidelberg wrote:
>>
>> If checkpatch.pl doesn't complain about it, I think it probably should.
>>
>> Please standardise the location of the comment and have one for the 
>> CPHY and one for the DPHY configs.
> 
> Then I can rather replace the else with elseif (== DPHY) and make the 
> comment irrelevant. What is your recommendation?
> 
> David>

I think the code is pretty self-documenting without a comment.

---
bod

