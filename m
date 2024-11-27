Return-Path: <linux-media+bounces-22123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8499DA05D
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 02:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17CD284750
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 01:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2765E18E0E;
	Wed, 27 Nov 2024 01:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/bnhy1F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194BA29A2
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 01:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732671379; cv=none; b=oDCULeTwvZYpDjruzNlEViWXpFXO3FpyeRjRKsw21fO0T/uEAjk5eyEpbi7WqIlT7h2S3alBBrzqcL+LgFzyNqFqt3IB1Fk6vpW2S3ti7wYThY29NghZ+yoCx93IS7tmLAhcz9nPVvnGgU8cTb09qy503Yk5h8bAh3eJ7gn5Imk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732671379; c=relaxed/simple;
	bh=j/9n6Za9yhYCyRQjsfHUclnxN/mvHCeUHXHImWo7hGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs0uueaoPpuF4Ro1LX9ByXRvb2mceqeN5Fzeg4lOlaGizpWGCIPzYICLCPWlJQd+k2SyVI4SuJpe7Ieo8pVRORhZ5AjKDdCBhXzlPr0VcLZKZEdhUwBNFLGSS3FnqNwQ2H/nE5r/g55SlWBSVqFtUq+HxM4cFvT14nBQBGWwgng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/bnhy1F; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-382456c6597so4371663f8f.2
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 17:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732671376; x=1733276176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpOgem4g+ZZv/dbRraYyKDaj/RcJPybY/mGeK3o1lmo=;
        b=q/bnhy1Fla43jdxmLSbLEqb4x3VSf58mzPaMhJqp+qyC7NJnDzW9aM9oQt1dTZeJeM
         /fU0YejTdAJHHkVeCKjoT6P2CCtb5Bz4x3925pWXeiDYVOr3JMRLiflY9PE2HxM/YNdS
         JdCW3iwICtj2yAC1+hAh+7gIBak2kfbpX65TvZFg4eLbAbR38QqS7WKJqh9h1RcQWGcF
         4s5aFBork5AW4i6kjdkd2Cmo+9baabtour5TlZwuHi6+/cIhMCh7sEwYRl5NX0B2hx87
         VD/IVIEOoo3+OZkI1ewxzu4Cu6M7VLHfu3BcY0R/r9rq/ogO2FSPHBZj38+cDVDJzq0/
         SUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732671376; x=1733276176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpOgem4g+ZZv/dbRraYyKDaj/RcJPybY/mGeK3o1lmo=;
        b=Umvt778yYCwrETRKpTo9w4PNYcnE5njL5NrO3mBh9uhrwIDvhCKJjNCAeFrXbgr6Fd
         ASCRPdQ4khRhfK7sVWEUaSb7uwr1fkZi56wIc5aQU7XFnpNuMK1y5fuByEq/0MIwhCKk
         Z8rTHIH7akfL05v/d5bY6rnR9ocpvaXopcVYyYYJxVx/gYmUr3aNSaIB0EhptkMGZKjH
         BJNXfTkDQYKYQ9EzU8iQW9E/brwz3igH3Lxlk1yqlQvgsOCLb/abRWEzdT6Z+Cjcy0yk
         WG16/CEAx9C73n6lc6WFcE6I7ux6q8aFTVBPxr13MK7F6Xh5yl8+LY7sq4kSXpP40PLq
         LOuA==
X-Forwarded-Encrypted: i=1; AJvYcCWI5Y7NS/JIH9D18a5np7RoP853TrjXzW6C9Du3jHG3aV68jGnGu7rntlg3zbyRVvfnN8ivRZxP7gcD4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXhhdh+iHJ6CJl9xYXGRtx/ks1SxOkmsjUartaok1EPSr5P4+w
	n8UAxRI2yz1OLXsIm2IniKHLBHUHW6ZBmYFeu/t7eHw9LOccUTZ5jvu22QWRhqU=
X-Gm-Gg: ASbGncuLfPJtBcwSHq1UB0vhYV66t8aJMtd/h4RTZTyug5XhRBbyUNYsUZCVGsQH9vb
	jJwTzeOcvguzfT1ICyuaHYFSHkLIpEruFlGd9qh39RUsJ//PiDOlBlBTR12kg51P3Ra+vqj12AG
	kPSrVcnrbJ4W2QOi+ky03tQuV+1XBS7XZZootXi70VAxoOuMaQ9Aw/JzylA8Do3J2snNUCnYDxK
	p6O5uVZtfoK7MUVUaR0lP8DN6bxTCQ0tLLlfW32XiWje0rKu5D6/zS8rcl+VbA=
X-Google-Smtp-Source: AGHT+IEpbHLtWg8lNUOXUaaQS8O82eR9X/UQB+mnwjGo6BbrwjJB9gQXGsQNS+GVkkxaUp5WX319iA==
X-Received: by 2002:a05:6000:440c:b0:382:3f31:f39b with SMTP id ffacd0b85a97d-385c6ebd533mr615614f8f.25.1732671376593;
        Tue, 26 Nov 2024 17:36:16 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm14712225f8f.91.2024.11.26.17.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 17:36:15 -0800 (PST)
Message-ID: <ce9ac473-2f73-4c7a-97b1-08be39f3adb4@linaro.org>
Date: Wed, 27 Nov 2024 01:36:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2024 01:34, Bryan O'Donoghue wrote:
> +		dev_info(dev, "Node %s exists won't create new\n", node_name);

Bah I meant to remove this before sending.

---
bod

