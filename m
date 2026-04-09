Return-Path: <linux-media+bounces-58362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMFVF6XN12mrTAgAu9opvQ
	(envelope-from <linux-media+bounces-58362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 18:02:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CF03CD497
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 18:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A399B31ADE90
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 15:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0CD31327A;
	Thu,  9 Apr 2026 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p1ILTGxc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C222BE056
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750000; cv=none; b=cL73jTsymCoY7CrPXbdhDPq/pUnPtmtU5UIOuo1vHygKC6sEtEDdTm/WLckAqMvH1UKqtrAM8JVDen47CmM6EXCxbcurG30+qT0vxhOKcu3rTWl58UAzHCiTMH2+m8/HSygj1FfF3/RljJxAqf8fXPsJ5sP5BjFaK4MoxYhhETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750000; c=relaxed/simple;
	bh=CcfeUTBqdrPWX9PLWNaqEnioi2DbZM/+yoVkROngFHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFi4alqfhJGFlc/pyxXJfC3xAp33vUSIj91zB6yqHs8Xp4oDBkL9Bd9/V/S8lXCzJhF6kQuzIRwTCVWcflWqhaPJFegK3ZZt/6ckUKVV7luya2HX3HcFGsCXNJob4hI+VGKYLtIAzIFK6fVw15X3yXqmxltE9PUrpXZ5e5Mrf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p1ILTGxc; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e203fbe14so753071fa.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 08:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775749998; x=1776354798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dePcqvygy03K7J//IlqvJIbf/FJzL8WZk9xUAjuc8o=;
        b=p1ILTGxchXHgH8PufWY13xJvOeG6AEee3Hyla1EuSPb0chDVpiY7yMtzth3G0zASU1
         d+NwNqx40G5eWz6uf49gau2wZqzrAl6aeTTcCv4ZCqWunL2hCb1rjPEpasTFoZ2u7Mjj
         9qLlpWP/Xron5nn/RsgCkm+0Ze6nvYvnhZYvIDC/erW3eNmmfFrzP6/unawA63uImEEO
         2b3tbjoCpUlKRngVYS2+/DA1o7CvXmsQ9bPlE9HbTzMLn4rttz8GEqqLvws8F333Dos1
         3zfpX029enhSWrRPaWjdLqXeypuAClQw3R59xahNjb09SeB2K7zzKJed/GC2x8FC39sX
         tTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775749998; x=1776354798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dePcqvygy03K7J//IlqvJIbf/FJzL8WZk9xUAjuc8o=;
        b=dhjCRKb/BUZV4ugIaSrhX6uypyBa+O57XV4PYWf88flZPtCfSublY9P7ftheBrACO4
         2UbuvJ4PE6j8rkEdbkUXBzJArUefAvyba/OZJnGy46DB/LzbOhSzH3UAjrHuGBe570l6
         Hl5RGBMcfOSzlo3ou0c6XyXJzSohE3KoFf1GElUVq86DrHCni0GF5xJvWuo6T6gqV/Ge
         MLyqKPi/gCwIjKncjsq7gWGaSj7C0zpKX5DU7I++NJDR870lzqgUOEGVLWJn7ycapw2l
         Bxv0DXcSul348tXN6omQSVHpsCZZRkp1gQ6iA6TeIxpQOofbKBrbMQrD/Fh9PMqd5cGD
         V7WA==
X-Gm-Message-State: AOJu0YwlL2uCNKcn4Wz7AeQPGLfEMJRlqs78ZmzKYOQKfgpGkWu0ZccQ
	g6xj9OFFA7JSTqja+qnL7b45JXg0nZ4llQ03NhlfB7shDoGj3SrESHbVWDh448vqJY8=
X-Gm-Gg: AeBDietXTp84MWbPs9747PUrAofIKIEXVKwKW1ARJy2lqYZwKhOvwtjrzG52bIm6fkm
	oyZ+k620P4LGtjOt52W5Z4/cUbkunt+DawXM6dqZQIs/uplZ5zX+ANCItodEo0zTMJ+WSV5bxrC
	+Z1qijOckGr3FLIqeABccA2poNf/to/Jlt7S+aoikldP3cp6BQjjfQeI6PXi3qE29Yww1icLTF3
	2YoHdCEgxBnIVAjezbMbKFNhBJ+ztHoKJ8IzQCU/GxvxmwF5QhoYtfcxfbPsRgN9Q040Q1IwZlC
	J+3dD2GZkU676RWh/1gtiM6XiOYERarIba46bsTgWhIrVO+9TC6unuvJAWYzHLTTot0khpcrARc
	F90quAi2XDEbwWWhWHoYYO/UpzmGa3nv/EtWpqtquRUlt1flPnwFn690QrrG6um0zpOr4HHSjEr
	1O1bYP6gJfHltXLMhiNhwWav4TNSj5kdUU0Zh57/reP7gMlBWHvVp/nn9RXzvFnhvoxWf8N4jW6
	Smv+w==
X-Received: by 2002:a2e:a813:0:b0:38c:6616:e2b3 with SMTP id 38308e7fff4ca-38d9d4e188emr35046621fa.7.1775749997451;
        Thu, 09 Apr 2026 08:53:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4957eb57sm210041fa.36.2026.04.09.08.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:53:17 -0700 (PDT)
Message-ID: <d3c22f40-28af-4ba5-90e4-61643ad6d82f@linaro.org>
Date: Thu, 9 Apr 2026 18:53:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: qcom: camss: Fix RDI streaming for CSID 340
To: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Milen Mitkov <quic_mmitkov@quicinc.com>,
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
 <20260407-camss-rdi-fix-v3-2-08f72d1f3442@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-2-08f72d1f3442@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58362-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: D5CF03CD497
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 13:34, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern we
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice only
> VC = 0 on CSIDn:RDI0 to VFEn:RDI0 works.
> 
> Fix that for CSID 340 by separating VC and port. Fix to VC zero as a bugfix
> we will look to properly populate the VC field with follow on patches
> later.
> 
> Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

