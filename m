Return-Path: <linux-media+bounces-40385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D92B2DA7B
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98D9517E3C0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB80F2E3399;
	Wed, 20 Aug 2025 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcoiVQ/J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8F4414
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687801; cv=none; b=jzARSPpSxwWTGsDfTgMqV0BUaOcUIQiwtHWGeXNqjL5ovSTOjtlNMkUyPFxzyevUNdRTg2evEuXfpQQFp2reJtYeMod3QLOLVueUty6LCx6KwB7zwU9qb50VyC+cne6dQpR17uXCoPqdrzbkpLjuef/ebp8Zq1YHBN7MoEbVUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687801; c=relaxed/simple;
	bh=u3stZJZozj1Ykm8shsxVmP+agbKEMYkuhg6zzlZscwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ed/qjy4Set8ujKYaen/XyE6D6G5ka8ULI/Lf6ixKyXZIfqidy9vcIFR3ARv8k9BEnU2CrbaNUa11dz6NSlyYtd/57/A7T4IANrWBU5nX4gqwas/2FZkn4WwHZBylVQZvRqShQ1ZJd6Q7M0br3tmpvVZzJJDJOdXStG8cJa5OIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcoiVQ/J; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so5235665e9.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755687798; x=1756292598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkwhUABhPBNZeZgOhl20sSl/xqev4urG4lq3t9jsKjE=;
        b=kcoiVQ/Jr6XEtOCKhNAre08GZOrIVtYDbNkBfak8MU0Ms2Lhbft7lBrZTjZielEdku
         qGO1IYQYNEC4IujhCN9+XxOOvStMx7D1NfVIjkPKVS/dz4H3MWpZZiPudMZgubGGdwzv
         8yljkqZ4FbTMvONAFg1QRuCDWxI3F+HPL52EvIH+HUr4fEv4gm45efKkwjc6U245xC1L
         T5w2rtRhfUkRu5qktPiLXzu/PRt/FNndjbRYY7zip9Jd3zoGxU7Q9mGo6voyFha1jGW9
         Fitb2siNiGUABwf+gGz0++2JyIAviX36u7LiT08J8eetwegYwJ9/N+btP2GEQKFjdJXB
         62vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687798; x=1756292598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkwhUABhPBNZeZgOhl20sSl/xqev4urG4lq3t9jsKjE=;
        b=cTeSfFobaXVHgrg59Bn/h1zT7/GvX6surHOensp730b/xFvv2QnCv1JdQ+624zwJy5
         cq7e3hXvld35IaFttjCJCv8VeRQN5962WwfY6JUXbmCNRuiR1y3AvBoIK1izy8mVSAgh
         ALBceQlJoPpQFIqdHXy6TRRIOatdiiMFynD0ETAi09sRhwX5GkK5ViKT2Dop7m8TV5z6
         a/MloBsIgOxT/CkDtejuA8jkaOdc3iJomD9ueYgIQ664j81KzKSgMWMZGCXfvBzIYVtx
         VpSdrcuuc2eBwKMdIXrWdmKpx0aS5eXp9f2DMC2BZoWolAvU1yMiyGqkPBGujqkVXe+y
         W4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKZF+L9Wh36AYW7y3sKGVWseZMtWvpxOZjtSk/aN6eAAWQaJM0KfWZ8U/kFerwtRqyHq06z2gEbv158Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO4W1Hs+qPMqHa6slCTBTI9QWcoRWFaxmNFw6AM6TDRO+af6Z8
	mdvc2Up1ypP4IOAcjLm/9kpi5glJ/W26XSuN52gPxrWqFoBh9iwcL7NomWDmGjZFe/8=
X-Gm-Gg: ASbGnctHjpXwcMhzqlPkFBm3NYhZ2W3QryDkHchA/sRD4jc+38MCQfZkiGawcEQKHYU
	mR3mMutc0N+droeSmQ/HIJbjwj5gYXeeslLW+lNR/gvDhl+4odW0d3wK2aMsZWBQN5eaRvG5b8L
	fYWA70ZtokFi3SchxFZdC8AIoe2SPVb/S53JfCDxNl2y+txWYhoBZkXWsiVmfkmXnriVt+pL1Q/
	XtAlTGGltCbpx3Z9xBj+D0MoeYqGdR2TLPhU7+kGNCZ28VIbw0UHPiKmBa+JOd4lw7davORmxPf
	uGSLVWqZGUpSgf0govFB3Bw+sJhHHJW8X2OQ7AhYsLljDh3p2oEdN7AFrGRFJfZ57RK3DfVlDXk
	hOJtOhmCPCgWq2uOUZHJfSgMu3KRhMUFZyJMcLHQuqxRf/gQ64kFGBlKweazIB3s=
X-Google-Smtp-Source: AGHT+IGWRDOeJaAPpLWfekSMtMXpy4Qbpyr5pWYSFND6wauYCuulJRLUbo01wH9DLbqwq7ctNEf/Hw==
X-Received: by 2002:a05:600c:1d24:b0:45b:47e1:ef7b with SMTP id 5b1f17b1804b1-45b4b3b2723mr5193455e9.17.1755687797808;
        Wed, 20 Aug 2025 04:03:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c90cc4sm29805385e9.16.2025.08.20.04.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:03:17 -0700 (PDT)
Message-ID: <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
Date: Wed, 20 Aug 2025 12:03:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> This is a further continuation with a new approach to the topic
> discussed in [1] regarding the enablement of Secure Peripheral Image
> Loader support on Qualcomm SoCs when Linux runs at EL2.
> 
> A few months ago, we also discussed the challenges at Linaro Connect
> 2025 [2] related to enabling remoteproc when Linux is running at EL2.
> 
> [1]
> https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
> 
> [2]
> https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> 
> Below, is the summary of the discussion.

Which tree does this apply to exactly ?

git-log-graph linux-stable/master
* c17b750b3ad9f - (tag: v6.17-rc2, linux-stable/master, 
linux-stable/HEAD) Linux 6.17-rc2 (3 days ago)
*   8d561baae505b - Merge tag 'x86_urgent_for_v6.17_rc2' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (3 days ago)

b4 shazam 
20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com

b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com 

Grabbing thread from 
lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 18 messages in the thread
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
Patch failed at 0002 soc: qcom: mdtloader: Add context aware 
qcom_mdt_pas_load() helper
error: patch failed: drivers/remoteproc/qcom_q6v5_pas.c:235
error: drivers/remoteproc/qcom_q6v5_pas.c: patch does not apply
error: patch failed: drivers/soc/qcom/mdt_loader.c:302
error: drivers/soc/qcom/mdt_loader.c: patch does not apply
error: patch failed: include/linux/soc/qcom/mdt_loader.h:10
error: include/linux/soc/qcom/mdt_loader.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"

---
bod

