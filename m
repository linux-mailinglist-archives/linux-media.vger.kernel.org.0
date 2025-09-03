Return-Path: <linux-media+bounces-41700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3896FB42340
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE7663A223B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD9130F527;
	Wed,  3 Sep 2025 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKIg3FLB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227130E829
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908805; cv=none; b=n4hhZdC3ohf6OyZlctf7W0qo3raFBa3YREwKM4JIWEO55enDomKzVMKzjeYsaqPZzbm8advL0s4EAQrUxhIJeWr5wD35ROHJIeMwhjAF+NJE9GRbYy1ujR+gfqtI6v5ImdsSIpO7/cQgpq9x6L8NmmlfGYIt4eHJiOEDmLKIlKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908805; c=relaxed/simple;
	bh=jChr6ji3pFwXeMcSXw5YGcuHU7gFFFGKRuwiRoe9HFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEimxc4XFb7OHEslVo9Wg7PT4iiu8ATjz0VS76ZTfr8w0o5E/YQGdFCZ9k4Zvq0xg/4zj1YgjZMJ0Gu1iwVb/wm1VLggL/cMh/5Yq4K4fw5HUUTBGnR1BMfEVzHQWiuaQ5ihOpkVGb1ZTpnrcK6FHvK5z/PwxDxkZPLUHDqqbZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKIg3FLB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b84367affso38932445e9.3
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 07:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756908802; x=1757513602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBIcNf631ef2opWTzbk1POiusCMrfVUtghAbvI2Xsvg=;
        b=bKIg3FLBvw/BtI9Me+i/2aZgCKhsJX+6gxBthc2f0F/DR+ulRLZh5JPcQTHtH7FkVJ
         7FsTWhZMlMM1RIVGPuES7OPWgKvz2A3sojgigdFuUhqXZYtGUnWd1NXG8wGWIVgoxJYG
         bJ4LObn6LZsfyYZMBueMMLktjUXIPiaOFQ2u1Bxu2Rl9CJsMCOra9z87zZC9/Yd3bTXU
         kA6/sVo+bl2g5RBieqssXSTd9LjreaHmVuoCM6mb4EUb2wFyHWwWFOHUb3DMOeqQaLv3
         P/8kUxOd1sUr9iYMKj62EOI3YX48r55bSP0aOFGZgt+to+RptngC2fxJKRt3jpxTtpve
         K8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908802; x=1757513602;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBIcNf631ef2opWTzbk1POiusCMrfVUtghAbvI2Xsvg=;
        b=sVBNk2bPKtjAa5qug6pFSlFSkE6vA7ThEy8yd0S0pVm0MAXusC1NpzmExfdQbPNf/+
         vfuTs+Sgj3APsbjlRUYMmhDVD9COSwSYLVEPr6ObkS5rOatB8cmro9W3BEMoO9yh40ax
         aA7/2S481GgC0N5j5v1LHBiKKNLAVnPZsslsR1/2UIcog+Nkkik+bTiiQ1QkjSMuLP20
         qFH6USzxgs66lEvh9Fy7kNtuLU5N3fa8ntjDEE+bZweN13FErUIQQA7tWQZugoWd0lMO
         ffFJf2D/ffWzMUjWK2rnl2jUluG8mByeKy4Q18RGnL0miJttuWnxNY6zwcsYOkBsksMe
         O/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt9hhS/FZ8E0zEihmfIWiYWUE+yhCrdkUW2WbA1tKyJLbPujRaOORy0DGJeQX1YtZIylmTsjgtttzh7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+YhOnSA1w3BE4+qJpmIyybFobIB9S/yLvNw00k1rpJk3cYjZD
	lFTaBIPT4Jpj3xAGDxW8SV3Epxw8UnojDVVHfAcvnVkl+YXhDJsCBBBQkqgJ6rri6aI=
X-Gm-Gg: ASbGncvo5iMNKMP+20fuHW/6M6TR++mMosEnUW7lTIyYyyVVGOXZf0ZVylQ8vXTwk2N
	kDQHZzrvaA8lHNwPHyXCJbnfzYKAdgvTdcFjDdmQuZmXLB5g30vXsjrVENBTD653EpZowXitwsG
	z+FUnnNN8iswHBuHxE0dVZehkgvA93sR2ukJyMgDN0BCAjIHvLwcVye11cXpVpjIFctBHS2IHNb
	n8reOO2aHaFEdl+2/Ey1Nr86u/LPp+oMNfluxPzqdLVPeZY6vIGnKBSYipMFMge9ACAbREtSAxy
	/q6dNkgumH0eysNhOOd3aOwCDZvi10MInTN667mkzx+mWHV+89fAo/H1FcxQlcMVK1dGcniuLsZ
	kn3psIfY7acpkknUeQqT5CK4nS7gKSxvzYPAK7xVMDi4zUsHy8a0FHEs3U/H1k4t+SRtwKgrPmu
	e3OpGDaUPBVmUUS3bP4K8eLqMRv8+fUA==
X-Google-Smtp-Source: AGHT+IGfAZzD09cWF5IbzY4R9+9G/lHAa3/pRj3XH1WFBEX6L966x/N8b0asy8I8FFb5vuyrdLwPlw==
X-Received: by 2002:a05:600c:314d:b0:45b:8a92:6b14 with SMTP id 5b1f17b1804b1-45b8a926f9amr120090275e9.37.1756908801569;
        Wed, 03 Sep 2025 07:13:21 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d95df59e50sm8541982f8f.23.2025.09.03.07.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:13:21 -0700 (PDT)
Message-ID: <7a7c122f-50e1-476a-939e-9d76e34b1d6a@linaro.org>
Date: Wed, 3 Sep 2025 15:13:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
 <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/09/2025 15:02, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
>> On 03/09/2025 12:56, Konrad Dybcio wrote:
>>>> Can you try with this next-20250814 tag ?
>>> You sent it on the 19th, so it's in your best interest to run a quick
>>>
>>> git rebase --onto linux-next/master $(git describe --abbrev=0)
>>>
>>> and giving the series a prompt re-test before sending, because there might have
>>> been incompatible changes, whether ones that would prevent applying, or break
>>> things functionally
>>
>> I can't even find that tag next-20250814 closets thing is
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814
> 
>>
>> | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
>> 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
>> into drm-fixes (3 weeks ago)
>>
>> but patch #9 in this series stubbornly won't apply to any SHA I've tried.
>>
>> meh
>>
>> ---
>> bod
> 

Unfortunately that's not the right SHA though

git checkout -b next-20250814-test next-20250814 

Switched to a new branch 'next-20250814-test'

b4 shazam 
20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com
Grabbing thread from 
lore.kernel.org/all/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
   Added from v8: 12 patches
   Added from v9: 12 patches
Analyzing 60 messages in the thread
Analyzing 163 code-review messages
Will use the latest revision: v9
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v9 1/11] tee: allow a driver to allocate a tee_device 
without a pool
   ✓ [PATCH v9 2/11] tee: add close_context to TEE driver operation
   ✓ [PATCH v9 3/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
   ✓ [PATCH v9 4/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
   ✓ [PATCH v9 5/11] tee: increase TEE_MAX_ARG_SIZE to 4096
   ✓ [PATCH v9 6/11] firmware: qcom: scm: add support for object invocation
   ✓ [PATCH v9 7/11] firmware: qcom: tzmem: export shm_bridge create/delete
   ✓ [PATCH v9 8/11] tee: add Qualcomm TEE driver
   ✓ [PATCH v9 9/11] tee: qcom: add primordial object
   ✓ [PATCH v9 10/11] tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
   ✓ [PATCH v9 11/11] Documentation: tee: Add Qualcomm TEE driver
   ---
   ✓ Signed: DKIM/qualcomm.com (From: amirreza.zarrabi@oss.qualcomm.com)
---
Total patches: 11
---
  Base: using specified base-commit 33bcf93b9a6b028758105680f8b538a31bc563cf
Applying: tee: allow a driver to allocate a tee_device without a pool
Applying: tee: add close_context to TEE driver operation
Applying: tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Applying: tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
Applying: tee: increase TEE_MAX_ARG_SIZE to 4096
Applying: firmware: qcom: scm: add support for object invocation
Applying: firmware: qcom: tzmem: export shm_bridge create/delete
Applying: tee: add Qualcomm TEE driver
Applying: tee: qcom: add primordial object
Applying: tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
Applying: Documentation: tee: Add Qualcomm TEE driver

b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com
Grabbing thread from 
lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 70 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context 
initialization helper
   ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware 
qcom_mdt_pas_load() helper
   ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of 
auth_and_reset function
   ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
     + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✗ 
DKIM/linaro.org)
   ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to 
pas_init/release function
   ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to 
its own header
   ✓ [PATCH v2 7/11] firmware: qcom_scm: Add 
qcom_scm_pas_get_rsc_table() to get resource table
   ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map 
and unmap resources
   ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse 
resource table
   ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support 
with IOMMU managed by Linux
   ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU 
managed by Linux
   ---
   ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
---
Total patches: 11
---
Applying: firmware: qcom_scm: Introduce PAS context initialization helper
Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
Applying: firmware: qcom_scm: Add a prep version of auth_and_reset function
Applying: firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
Applying: firmware: qcom_scm: Add shmbridge support to pas_init/release 
function
Applying: remoteproc: Move resource table data structure to its own header
Applying: firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get 
resource table
Applying: soc: qcom: mdt_loader: Add helper functions to map and unmap 
resources
Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse 
resource table
error: patch failed: drivers/soc/qcom/mdt_loader.c:22
error: drivers/soc/qcom/mdt_loader.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"


