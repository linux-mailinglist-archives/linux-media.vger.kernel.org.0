Return-Path: <linux-media+bounces-59869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP34IU3r8GmBbAEAu9opvQ
	(envelope-from <linux-media+bounces-59869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:15:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED21B489C05
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0880C3093038
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7AF33D6D5;
	Tue, 28 Apr 2026 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="gVFY5SGd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EABF33A9C1
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395247; cv=none; b=MA/Ap2YFipwtsivCLUUPgdWESBa/cfCzurUJiy+PPILfJeJ0WLsDyi60qok9Ow4Ll9usVk25/530nJooVaWw6/+Ma5hWZzkwqL84l5jk9vuB8E1xW/DFHwI3b4E972epgAGWCNiwdGIE3vv2F19UicK/OHlT+s6oxCQGfKzJ6l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395247; c=relaxed/simple;
	bh=rzWf/oQSHbkLcV8GwzpmrSWI0KfR0fCQpV3xi0rt5Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOJzkMpXnS6BXFuqdaGHjBE5U4c12r2UFE3yxZ3zoOJxXirXpxuI2ODCcr9f3Gt+n7gRbZKdi3hhVhGO6bQgQPT0eaSpUairmrfGhacu8Pc/WrmGC0EuqwsxL/ZqXzlhAbBaOXWXWlLdydUwiOnw0uVzVRneIsw5cImQCfwWBEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=gVFY5SGd; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69498319ee7so11698eaf.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777395244; x=1778000044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3Z9r4IpEjJMUHPOqoRO6rW4qYst7QOqGLcntOF/K5A=;
        b=gVFY5SGdeZ2JrpdQhfBOXtmU5OBrbNQbhEkaFelzzC8oIWbT3S+tNOJrkfLM9fewnq
         Oh9d14toNjEhcJm8pUr4qhRqyuMFBdQBuJLymgs//dxzGjLfe2/k7B/8mJIT7/lci9eY
         lJMTxKnO9jwE194fEOlgT0QYHkmt9cDMVFPYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395244; x=1778000044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3Z9r4IpEjJMUHPOqoRO6rW4qYst7QOqGLcntOF/K5A=;
        b=Pqz1yJ6DMzm/9anRZ/cXeZeE5LLdvRjSdyK62+TOs4amH0a7qeXxtu+c0VH0keoU5O
         rfvCMF/yWfULRpSfz3vccTFGbLlT0bb1dbSqS+m/nFkn6OOqxHXoTbnb83oSentCj/3w
         RGly87KmL6iJVtf2LQrvZ7S2y0hZRMPEQ43q404DQygm1q7r/S68fFWOqiumhC2v79JH
         uKSOoTnWgamirLrKryEC6k8PxSWXy09DXNBcU/kprw7pz0W2rUZoeNRcG7EAaMMoj4hB
         LBg6VwmFGYbOrrmJATlZETTBO7D3k7bFbx4+EAHOapKEcW+9q8a8osqPhXbNVV5fdeFe
         n2dg==
X-Forwarded-Encrypted: i=1; AFNElJ9V6NJhfda+3xxhdNmldT6sJ3QYaNgy6TzSruTKYdVEN21o6s/wcbJrADqQyWOK1gmMSD6bcYdUoU+xow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfeGbBthcQJy83oD0VVR0XVIpy/jhqHvJ5ra1qjr2W3P1zVUsy
	JVX6GCGBJdUIURfU2K+gzzOoEOQTIB8ChvCY5FIzIfu1Ykm5unDJYhnWvkqL2lhlxA==
X-Gm-Gg: AeBDietDB9jl+1wPXNQVLwUD1WAq2GN6ODgPIwgxNKCgRlFlkow5Hx+dK7B8fGwKBnd
	qcWqfupyD55qBRgzk9TUp9+0X85DiBsgq07d5ta5yjAMUIkltzWq/bVKEZK1aMn800LLIKT0Sk1
	8MLH16S/9lwH3GuzXl+YR8FYYFQgxCQ9mcCqGKxWTWIBhWRepvP8j1IDV+CFiBlmqskUq//H9gz
	Zxp3bS53nxQJ5F3J7kMN6KYQHbltoG8917Kde9fXEc6wBYEpe+LTsPboAyMYFG3w3Wu3qV4ZEH+
	uSV782ocWB8JXYVCZRdoz9b/jnyy7ZL9yKd/nocBOPd9Z+RoRMTlPwFpIlhdO/KGHhaMsr2DoUn
	g4jJDroVG41DRUahFasozBP7//xzQI5mB/4gMEiaxo8NAy2n+nec6SaMIrDBBProTkWGEeVKpI8
	f4ytEV24Q7BJlBiGFVUUAYGMdKyY447ghruKCYUiVm7Eqg39HILSlXDhLVRnAwt1iDO3VLsYRP2
	FA71Rk=
X-Received: by 2002:a05:6820:4b05:b0:696:13e9:6863 with SMTP id 006d021491bc7-6965c5ee294mr1871158eaf.2.1777395244239;
        Tue, 28 Apr 2026 09:54:04 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-433effdc79bsm2240677fac.18.2026.04.28.09.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:54:03 -0700 (PDT)
Message-ID: <aa2b2823-05b2-49a6-bdd3-622523497a0d@ieee.org>
Date: Tue, 28 Apr 2026 11:54:00 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] net: ipa: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com, amirreza.zarrabi@oss.qualcomm.com,
 jens.wiklander@linaro.org, op-tee@lists.trustedfirmware.org,
 apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
 linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260427095603.1157963-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ED21B489C05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,reject];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DKIM_TRACE(0.00)[ieee.org:+];
	TAGGED_FROM(0.00)[bounces-59869-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@ieee.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar.com:email,qualcomm.com:email,ieee.org:dkim,ieee.org:mid]

On 4/27/26 4:56 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/Kconfig    |  2 +-
>   drivers/net/ipa/ipa_main.c | 13 ++++++++-----
>   2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> index 01d219d3760c..a9aff1b7977d 100644
> --- a/drivers/net/ipa/Kconfig
> +++ b/drivers/net/ipa/Kconfig
> @@ -6,7 +6,7 @@ config QCOM_IPA
>   	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
>   	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>   	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS
>   	select QCOM_QMI_HELPERS
>   	help
>   	  Choose Y or M here to include support for the Qualcomm
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 788dd99af2a4..3cd9e44680e9 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -14,7 +14,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/types.h>
>   
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>   #include <linux/soc/qcom/mdt_loader.h>
>   
>   #include "ipa.h"
> @@ -624,10 +624,13 @@ static int ipa_firmware_load(struct device *dev)
>   	}
>   
>   	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> -	if (ret)
> +	if (ret) {
>   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	else if ((ret = qcom_scm_pas_auth_and_reset(IPA_PAS_ID)))
> -		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +	} else {
> +		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> +		if (ret)
> +			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +	}
>   
>   	memunmap(virt);
>   out_release_firmware:
> @@ -758,7 +761,7 @@ static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
>   		return IPA_LOADER_INVALID;
>   out_self:
>   	/* We need Trust Zone to load firmware; make sure it's available */
> -	if (qcom_scm_is_available())
> +	if (qcom_pas_is_available())
>   		return IPA_LOADER_SELF;
>   
>   	return IPA_LOADER_DEFER;


