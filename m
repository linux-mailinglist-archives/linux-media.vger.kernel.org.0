Return-Path: <linux-media+bounces-63979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F+8KAaZLI2rXoAEAu9opvQ
	(envelope-from <linux-media+bounces-63979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:20:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8042364B9C6
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:20:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=v9qFIcGf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63979-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63979-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34FAE301C142
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628F4314D06;
	Fri,  5 Jun 2026 22:20:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D35332B99E
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:20:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698013; cv=none; b=cdlKCccA/rEkoENSUcs71k322RPUnDR1GWHhTmKujSWXZIKu14lh6QFMZWRTKi1NvnswJfy7Y3LMH6nWGKdc5S5byk4uqwW+9b0YnLjlW59U/yd9/19dm8JUFbA9I2Et3ADaGvUpbDX06h0iXpbL96ycrBnRo0aJIgOdkhInfto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698013; c=relaxed/simple;
	bh=/fJR9ObIjB90E/QkVHybSi2y1A5XCak5hCNjolyBIsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDDmren0mqJX9wkQeUNH+O9Vb7oraJE7a2PPF+4hfRI3ZIJOK2FIfiE3Tl555cQeXtWL9D4nwFIxZE05sneelw2DH4FSBLVGZ2VI3TsO1ZJytD9ip06kIxTHMrhDQjGCRU5jVNM2ck2HlRVokbOctcynPLub8w8aU4NdD+wVi40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9qFIcGf; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4602e2a0372so1509714f8f.3
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 15:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780698011; x=1781302811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/HB8G1yTQPOAvgzKZeKYVge98Lt9ZnLKHPu1l7zZb4=;
        b=v9qFIcGf3AzlWTMlJODbm2DBzIdu3pdSB9KlLvoOgaTA8nN64Jb61RDdKdVCLNgnlM
         aCDmRUI/U0Ee5CwyRPjMDWUvAliXoPY3dLNnLzswOQGKmxsaS9bWrwleM9TzZt5WfgV3
         cmJc5xsjyi4QT9RQC03L2Boxtr1yu/xacJ36vkGXcKV30BA4oRpCHJojx/pNdDyrP7Nq
         NTKAv9ZXSJB4H5gPlX0xc4QfP5CTwI83/Fy0A+5V9skGxkDCHOjRjPOm9gmxz5LRWKUw
         OoAqeGVMiO7VRAt3p+7mhdL4VMqOps2D+kBzKZQH/ijRjkXOSV28ciC4NvxcZlkfK9Jy
         lc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698011; x=1781302811;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/HB8G1yTQPOAvgzKZeKYVge98Lt9ZnLKHPu1l7zZb4=;
        b=JIKLGgtlrZEXztduXu6p6SV+vLlashkdGaWdt5na1+9hNpzPJaWIcBr5DFMqlywwGR
         Z3MVRV4/SvUch+XuLmSLW2tKeBPNs9tEvuua0wddv6yLt+8DJaGor+iGNCjL6SI9y0ym
         zCfRpM1TKIOZ0fzFFJSyXqpPOQqGXHCz/m/k0akunnO+mArUZYsb3ipcDEeiYHq7Jcy5
         ZDtBP8N+QgOR3FIPGCPivSYMYB1OqxiBhvQxoUn66iJlaEhzMn4+YoztsYdTAuBQtBx0
         iL1svr+91DIl8VDK+xtdorO762O18OzRY1q2D8DiQlNUJPnj9B2AgRAixdj9iL6LBTbo
         Jrpg==
X-Forwarded-Encrypted: i=1; AFNElJ8bjmos3EmWRUgXAw4HZ3WbZr7/SSdzW2P7D+RevmIog8CuxHMG8lFGGznH1wc1UUCCyDkOBWDIbjH+vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeNy3P4US30qcXxKnSz7zTsZEDvr9lAzRSjFLt8i4dYlPDbJ0
	dbjvanuTXLW7/uuSg02IpI5popnTMM7G4Spml5LHa9HYdUw6oVhdUqEdnLjTOqo02Jc=
X-Gm-Gg: Acq92OG4p3ltJHPYXL43fSZl/jlp0V8bQCJdTKSnSlhyZcNHivNQBNHZ0dNNo3/Dm1P
	zX4U31oVuorRAk7aejwb5LstWrwpZINL4pYHJSC1pSGN2uMCm9V5qb4JuueJ76ZsgN8nqsk6lAB
	4b9VCJl+Y4RqxtviCxNBe0HQEuFwCOYEvfOfiwM+htLek3lKhKSjtVLGBd2SD/35hzQ6mUT3z8o
	7TECxywCeXUoebkqAspUw/KUv2ar95/cZyFyTayWSmblYlqBDmaBAHDlqQamQcrSc7+0HJtm0bY
	gwMFvAsOFzUhjMUAW0CW5C06GgXJIdSckdyleYpzTpTxlBrDjWu2ngb3+q3mDU4CjcH34VMsA1z
	0dqDUahL8h40Yv+aMj4SEIRvYkL4/rBsflCecP2smo4uCsYkNms8gEYnJDkgXTa5xL+b15XoJPG
	DJW9GraF6OqW8hLNPbJJYO5RQPPCh9oHDLOHnjN3Tygml/
X-Received: by 2002:adf:e743:0:b0:45e:f1c5:709 with SMTP id ffacd0b85a97d-4603076cb46mr6547079f8f.37.1780698010560;
        Fri, 05 Jun 2026 15:20:10 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.32.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm28849253f8f.26.2026.06.05.15.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 15:20:09 -0700 (PDT)
Message-ID: <87ed4bcc-aa66-4a1f-becc-7fce1fe795c1@linaro.org>
Date: Fri, 5 Jun 2026 23:20:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 C-PHY init
To: Michael Srba <Michael.Srba@seznam.cz>, Bryan O'Donoghue <bod@kernel.org>,
 Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
 <8azU3NvUdGCvWCxLb0gz7FWkTGFL4k_xiBUPp170jiYIQjwHyRqynP_oLG4pjFkIRSY_bo91FQh9ECYlXdXrsw==@protonmail.internalid>
 <aiCiVe_LRA4DXTCL@lizhi-Precision-Tower-5810>
 <8b9f8754-48da-4b61-84b8-3688520c7f63@kernel.org>
 <c7f35621-2bdb-4e66-ac8a-6c7fc6f80f1c@seznam.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c7f35621-2bdb-4e66-ac8a-6c7fc6f80f1c@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63979-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michael.Srba@seznam.cz,m:bod@kernel.org,m:Frank.li@nxp.com,m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[seznam.cz,kernel.org,nxp.com,ixit.cz];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8042364B9C6

On 05/06/2026 15:47, Michael Srba wrote:
>> So, hex values from downstream in this case are acceptable.
>>
>> OTOH vendors can and should enumerate their registers in an upstream 
>> submission.
> I thought this was the policy indeed, but this made me wonder if ALL the 
> magic numbers
> in that file were added by volunteers. And weirdly I found this:
> https://github.com/torvalds/linux/ 
> commit/7803b63a1640a0a39e3ebad487b33cb2d26e778b
> and possibly some other commits look like they were made by people on 
> Qualcomm's
> payroll. This specifically is QUIC, and idk how much documentation 
> access they have,
> but at minimum I assume they had access to the CTRLn register names? 
> (fwiw it's entirely
> plausible that the registers don't actually *have* better names).
> 
> I didn't follow the relevant ML discussions, but it seems to me like 
> they should've
> been told to document the registers?

"That money was just resting in my account"

There's alot of technical debt to digest, which I think should be solved 
in the new PHY API driver.

- Move to new driver
- Start enumerating registers correctly
- Transition to QMP PHY levels of lane config instead of long lists
   of "mission mode" writes.

If you ever rent a car in Ireland and get lost, you might ask a local 
"how do I get to Tip from here" and we'd scratch our heads under a flat 
cap and say something like "ah well shure, I wouldn't start from here" ;)

---
bod

