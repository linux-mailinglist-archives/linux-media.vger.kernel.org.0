Return-Path: <linux-media+bounces-58365-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDj+C+jN12mrTAgAu9opvQ
	(envelope-from <linux-media+bounces-58365-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 18:03:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 949743CD516
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 18:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C58A4313AD37
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 15:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCEF3DE455;
	Thu,  9 Apr 2026 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jA5ovNtH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CF5331209
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750065; cv=none; b=If3pCaMrAb2oRQaH8qgWCFqb94TNwhPUHQA4UYvjMq1xylviZo33Z/pKG6rhV2s3w5l3OeFtnDvMSAAZbWKxzwffV8G+/y1xeN+npD5c42buU+2LFrJxq1cb8hOAJKlZ+UjS8s/jUfidn8x/0Fu0NCt8smKChPJueuCu7bUtjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750065; c=relaxed/simple;
	bh=eK9MGD5tSEBxokm4T+iGz0HWHdf9PQRcKcx4jYbcqEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceQvgy11hCqEN87yBVYSqqXat0tAl1/Un4qE3wQvqQhhWl92VxPlSUhB8kB8GVa7/4PDmmtEAdnf7ZvWa3EhmagTWp4sJQwz4k4MFIgereyquohM9/iI/KYWhk4I9hr7SxmMCGJgLmhNSDOXFzHhDF7yWX0caTXHbN9PoVqX3cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jA5ovNtH; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38df0a031daso1890911fa.2
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775750063; x=1776354863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6Jt6AukoS7IYn65JxBCNeqqBaBH71CuaQqswHltSRU=;
        b=jA5ovNtH3UqyyPXf2U2A4H7GS71qFQlm2jFbSlsalPZVZ+0t2BDY37ICb/nz3lII8t
         YlETRozbETm6dHnhtVT7bHzeScfpV00kwtoBEDNuAvtfaj+evLY2BmRkOa8+OHRcrEtD
         C+6sOQR26wjn+FJPgAu2piF7Wc6JBqr6u+Fp/ptc4iHKzXMg4Zs88Z4epVB3/OuKP4bD
         Rp+MVVSaormgihUOopKXzxo/kx6QirKUiT9m0HdqFcKNxn5S47sylozDxG59Vvb9Alv3
         yGx9ttk0oJ8zMO1Cdo7qqOvgIVinQDhf1gmsmHw6BfiruUx9WBeSCT5gPwb+9aRnsYAS
         5yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750063; x=1776354863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H6Jt6AukoS7IYn65JxBCNeqqBaBH71CuaQqswHltSRU=;
        b=P87YCY3xrXC7opdGurDSzaaClKBShlG0rikSj8ob6j7K0I0vJwaP8r0Usry8UG2Irn
         +l4N8ZSmnjKj0845g6PSjo9QfzOi1pzrmtkIIryn2X3k0are48kjY+bziOIwTipm8SEL
         LAF6WZ0PLMXir9uDLD26fLljv1U3X/+BKdrF9JrX9mgdV19344j/b/BqVI7v+rOYTdu0
         QQ+pkSy4uLK8WZbJe/lpBM2zDHHmqaP/rov2Oam6/xr3IO9WeefYa66RXAX0IJCyM9Aq
         gZWsprTLxzi+sLe2Nuq4EdKZrpLvrSdGTO8aD95jE/glrPTB9IlU5nxwd4tvFgflxgN7
         N//A==
X-Gm-Message-State: AOJu0YyTQmXTEFa5YpstZ/GTQZ+YH0ngfXPEY5UDZWpgpLgD+zLMtyPY
	uwAmSUbF0AxJ5921j989T9mOHgYTtTlwNtYMvz5N/YidKy2oFyW797dznt1BFrCqddo=
X-Gm-Gg: AeBDiev3e/0Na3qx483JwvLHHWXQCsuWSIJTNGrPqa/LL2SCy3BBxXYz2WCMIMOiUnq
	kTqTAduVfJZjkDmXhmwkagTxOeR0Ywko8WlEQritP0d7YX9Jmy2pPTNl2r21Mg3elU0wWIMa6bS
	37zSJmQwmpXpw7RrBrxcoTccu4r/TN3KT8ssQLfQJ6KmUtbom/wSDLem4U9iu/N6SBSz9ZJPCZ/
	6bAwf59CpSTQXBtOnuYfu5NZ4YdG1D7oY5+VfqhPWqH2vjX1lGaNnOVAOBiU/JOlBwiL5oFq1rt
	OZ+lkNUi7Rm67zfPzL5brc4NI/x4mIoiIZjlJHQbAlb21rV86eJQY18h2I6V4BWX56km6PLGeiJ
	+g0J2JlKHAXwe7D7fxWRplbEByg/9d378Lc1mOUeKcyHtcBDfobGaD/iXtjI4YA9EK1IFg3L6bE
	rzmtLq5miteSW8RX4b3+HF/gMzj3Pvj3rhUIef52hQ1HAdyNzBFK8bgQZFkA7F+j0d9bl10WoPn
	4dYOA==
X-Received: by 2002:a2e:a541:0:b0:38d:f18c:a8d9 with SMTP id 38308e7fff4ca-38df18cc908mr30091421fa.8.1775750062424;
        Thu, 09 Apr 2026 08:54:22 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298f1csm273751fa.12.2026.04.09.08.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:54:22 -0700 (PDT)
Message-ID: <059811df-a19c-4cb8-8f80-bc7b6435ac65@linaro.org>
Date: Thu, 9 Apr 2026 18:54:21 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: qcom: camss: csid: Rename en_vc to en_port
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
 linux-kernel@vger.kernel.org
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
 <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58365-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 949743CD516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 13:34, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> The en_vc mask has always also been an en_port mask. Name the variable for
> what it does a bitmask of ports. When implementing v4l2 subdev streams it
> probably makes more sense to have tuples for port/vc mappings. Such a
> change right now feels like putting the cart before the horse.
> 
> Sanitise the name in the interregnum.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

