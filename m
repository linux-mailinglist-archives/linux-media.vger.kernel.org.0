Return-Path: <linux-media+bounces-63687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fgmnGG+jIGpf6AAAu9opvQ
	(envelope-from <linux-media+bounces-63687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:58:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AF63B7BC
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:58:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=IJx7vnNq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63687-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63687-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E0BA30242E9
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4BF4C9557;
	Wed,  3 Jun 2026 21:57:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AF44C8FEF
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 21:57:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523871; cv=none; b=G9LOrYwFODyWTzcdDW6lyQ7XgMlMc3GSLfj7duEilwxLpnYRTvw+Pj0zDTWXgFwVoyRY3+ka5PTjWkEZdQKJUMOXUDMd/o8UV0/gw/vppdoc60UERdN5jjukzPa32BLdPCW/88q6Kq58MjeeY/CKirHAcJ9IZAtsX42EAVF2JoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523871; c=relaxed/simple;
	bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiqSMB9Ghbz035ykSBgUHVzcd3TE6H/koF1mH6/y0ZRDSg0T0iirQzT4HZ7UqaUT1JDtG+gAN7uj0G7Cu4Ohpt/YJvUHowq1r6E/ufjAlLIBQWXArZvNZn/1SrxF3b7Mo+lRS8ju47MKBvxd4eWpF4wEm0pD0EBF34Rqet1DMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJx7vnNq; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef29c5561so7893f8f.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780523865; x=1781128665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
        b=IJx7vnNqQBzKZd/0rWN0eeOfdRyQZdvXWwHtEDISpCc6yxtYnAn9x7qbu7cgxpPPCt
         lTgP1PjeLCCMiy1NpAAL4arYtENDV7uGoSM20GN9LCGvSnMxzmOuzKT+YcPTCxfZynlZ
         YwdAVOKbGr4+e7XGrhCw68I/q4jFKyDE35ImjwPP2RCfKk1vKQtexfIao4JkAaIbBQN0
         i3OE1ST+rLg0Rieu0v0Dc6fjtqfuUf+FlIu9DSTs481297OPNWPfBZ58OChSYBgLCOti
         bWAHNZR3mhsAhu45X98Ds/HhGSnd5NilvN52MV0Nt2pqQ4ycCfZsOei94ccE5Al/rblg
         kEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780523865; x=1781128665;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
        b=J3u8WW7ovMBbeNVlkPKGgjusylcE/qaxBKsAl/jzPTQvYpYUY8s9gTjOx6aCP76Std
         47HQ+fRa0LpHWUnEKWzGOt94RqQibR0da4GFxhhelWt9YCb/uyUJBx4K062pV93GSO4b
         klJUT50wkCyGAxifBch8KqF/5nPDdbzWU/AXGu/lmonrNZYR33WXQzGFsG672LrjXBfX
         hnx/5lxyyws/Gv0x991U8JM8hK4vxNrVzoZacRXYGgf6kYvL7fMKlUSTYMlgpHyPQwXX
         fO/I3IvvnxmokYrlEiyhWq6IaXsE0ER45fUbJbt25WtisiDZaos4zbvZsf4LtAOcjPJG
         LP9w==
X-Forwarded-Encrypted: i=1; AFNElJ97FgpjKdfZsxc08pNMoEEAZvXT5L+aVfol7eL5a+awN8BopRHnvK1deBIpj8XbBbcCVD1VGRYUF6063g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG1Nuj0hiHb6aR8cqs3yZdvBYASA4dvvD752H89iffGC4crsSs
	oLVZA6y0OHhSMY2EY95jAHMsT1SqoG8vyQMn58EoNhccGLgbyXzmKOSrNp0acIzzuME=
X-Gm-Gg: Acq92OFMSMBN/HsAspGL6eWkyMb2xLzN9dlBki2PBA5iobdJGtFXfhTu0r07Q0onFc9
	fbZJPLaF5ORfDV/Ejghl61z8nhHxk7ixqMdq/w5czMRpcS8wDo2QqV2JRH0TLxAzX8cVOFq3mzf
	A7VmmnZMlNZRlCRXPMtq0qsONkdkmRhosul3/fmTrli5kjAT1nSosn/XDaQqM5RKrbw/gsZn4s8
	azqldMIkP1UCkY4QvkznlRfO/DHmb3idPcrrczwL5bxJR29CUyHzExB8NxbwY4/sN89XzmBbmI1
	FmUmJM7/sV90JxPkaf6zoETgfiMX//dre9qZMq9YrEJeX9qE+9A+4/JiJ4bigGJe0uxYUuREzVw
	KTdQWvqqv9OXP164RK9w9s3xe+1Oke5PrmG+ySP6u7G0Ty8ncN9CmU9Uht/H+RgyR+fUuPrDhxC
	HVy+HscXnuc4+279+Baqrgyh9HTxLnrFV3W9DIiTV3+SzDU9Uh2nN8RzRB
X-Received: by 2002:adf:f642:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-46021876fbfmr5427191f8f.35.1780523864910;
        Wed, 03 Jun 2026 14:57:44 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm8068755f8f.10.2026.06.03.14.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:57:44 -0700 (PDT)
Message-ID: <958b2eda-8ab0-4eb5-9b43-d74c5872b160@linaro.org>
Date: Wed, 3 Jun 2026 22:57:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>,
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
 <20260603-qcom-cphy-v6-2-e50de0b557a8@ixit.cz>
 <aiCfzBAbEg27S85_@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aiCfzBAbEg27S85_@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[linaro.org:server fail,vger.kernel.org:server fail,sin.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-63687-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 561AF63B7BC

On 03/06/2026 22:42, Frank Li wrote:
>> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> Acked-by: Cory Keitz<ckeitz@amazon.com>
>> Reviewed-by: Bryan O'Donoghue<bod@kernel.org>
> Suppose two Bryan is the same person?

Like Dr Jekyll and Mr Hyde Frank ;)

---
bod

