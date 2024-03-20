Return-Path: <linux-media+bounces-7424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA9881432
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 16:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A71C1C21666
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 15:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF154D9E8;
	Wed, 20 Mar 2024 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nn7BYvLE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82D44F214
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710947339; cv=none; b=BgZi8AYNwwXyRlWRj9VFP2HceCvzQwXXLYaCJ7O8eSCJVLGXH3JQY6wl1BbXe94ZhjXqfYPM24uOR7Qc1Q0rFZrQr2A03e9l4G2HqpDTadAyYpaAWAXUDHUYcTD2NIwk4akBgxAuRemdjh2Klg2lo7HdGxdbvTnvgyl7qxyarlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710947339; c=relaxed/simple;
	bh=yIgyH/r2EB5/MEO9gWrLCC4RceAk2eCf/phpiIPkV+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjLkBacWRhYlpwpsffE5+jYSoaI7TXTj1rP/ATBD6Qut/6UCNpKubXZ5neMuMB6Atv+R+1ol41GxeKIfMmDjczQ1J0RCkQGHSBpBjbpUUox3yH6tpD44+WcTfP3RaE4orYvsnYCmm5tVw07l/TUtDfwmNTS1Tq571ioZl1ZmknM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nn7BYvLE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-413f4cb646dso46003275e9.1
        for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710947336; x=1711552136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s87khQBRpXA/ay3JkWAvGmpLDRjVvlucWNUaDkU9Hpc=;
        b=nn7BYvLEPsw6ZA34PAWnIFZkcCBxMCF53IrlQIJSOScimr9f3rG1ARnKxsJ+Q0Obk2
         ZF/8vtSz71LHCiHMiSf933LsHeiQ52DM7uKrluAk2VsAerDON3dKt9BJ7y+3BT3ailvh
         tmaggJ65hZBDHxpuvSFWg8YSJbkZCEFcxB8vXF/dfG9nIge2Y2vuPaJbSfo+Ur3szCgN
         vlKzWebwtow6y/bpn2QY4nV0iE0HFwqJR/R7JNpBIp87iQ1kp+LlfuyYXIY3CIma8yjB
         m+u7apHGG0A5QO2WVpO0TUyPz3HhPQ07ThOytxXTDFtZ2T8pEk3z6VHUJbyiG7iMRsax
         mb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947336; x=1711552136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s87khQBRpXA/ay3JkWAvGmpLDRjVvlucWNUaDkU9Hpc=;
        b=cvXPPNZgWrco8pGZxFYW8kDQ9idP3s4J5HR0BDmGniNOjjPnObVRQBPMdHRoapB2lZ
         ZtVXqWKUEJLBDEsdaCAtfhpaCNJiRDqNDcA26j7IwY1flsPiZj3iqwDaRG++8ulOf9Uc
         jHMNFC23Mzo2jQZA2iSh7mjasWiMllYYQgu4m0sLP+EPqZRoiTECYsAASKrlosJ5GGNN
         cKJ6pXJpk4K+ZELwyUQsfnkWhTg7jT01SyHeSONcm4/97SXizoKjR+XSBE/nAsUD4JOy
         HtvLbZRaFFNOTvp6Nkedhv+csMgj1BwdVH1+/zEFkw936F2S5q3l5ZzdCCq3wi9olsoQ
         vvfA==
X-Forwarded-Encrypted: i=1; AJvYcCVG6Ngzc6YrIAxYPPMXSuYcp6XEgiE7djJFS/loLwVTCU8DqKriGNnpKlZMLaY7fbCHwPCXKWfvmfn/iJmr293MW2/ky8rZ0N4sgW0=
X-Gm-Message-State: AOJu0Yxu5+pRz6IcKBwJX3DqgughDnG8OWC1AjbgNa829bom/R5rltKg
	KwGfsedPJNkGLXvACbKHCOlVwY4kJaioCipesU7Hh52ji2ku7ZvPhLnaU0kS2EU=
X-Google-Smtp-Source: AGHT+IFSGZhZxYLTyw4pp3cTEskqtwLEAo8K6OZBvsDC0hK3nSYeNFjmjovaqg/1h7ChRwSc2U75BA==
X-Received: by 2002:a05:600c:3ca8:b0:414:273:67d4 with SMTP id bg40-20020a05600c3ca800b00414027367d4mr11282956wmb.30.1710947335959;
        Wed, 20 Mar 2024 08:08:55 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id b2-20020a05600c4e0200b0041312c4865asm2560828wmq.2.2024.03.20.08.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 08:08:55 -0700 (PDT)
Message-ID: <b37fbce6-b827-41b9-a783-81ef07e4f84b@linaro.org>
Date: Wed, 20 Mar 2024 15:08:54 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] media: qcom: camss: Add sm8550 support
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240320141136.26827-1-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 14:11, Depeng Shao wrote:
> V2:
> - Update some commit messages
> Link to V1: https://lore.kernel.org/all/20240320134227.16587-1-quic_depengs@quicinc.com/

Here's your first problem, doesn't apply.

Please rebase on - at a minimum linux-next or on top of this branch

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp-v6?ref_type=heads

and indicate which branch you've done the work against.

deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git fetch 
linux-next
remote: Enumerating objects: 1907, done.
remote: Counting objects: 100% (1860/1860), done.
remote: Compressing objects: 100% (491/491), done.
remote: Total 1907 (delta 1432), reused 1759 (delta 1367), pack-reused 47
Receiving objects: 100% (1907/1907), 1.16 MiB | 8.24 MiB/s, done.
Resolving deltas: 100% (1461/1461), completed with 263 local objects.
 From git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next
  + 226d3c72fcde1...72fb52fb0ac44 master        -> linux-next/master 
(forced update)
  + 00fe0619c6bef...ad58b0c356a01 pending-fixes -> 
linux-next/pending-fixes  (forced update)
    bf3a69c6861ff..78c3925c048c7  stable        -> linux-next/stable
  * [new tag]                     next-20240320 -> next-20240320

deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git checkout -b 
linux-next-24-03-20-sm8550 linux-next/master

Updating files: 100% (18508/18508), done.
branch 'linux-next-24-03-20-sm8550' set up to track 'linux-next/master'.
Switched to a new branch 'linux-next-24-03-20-sm8550'
deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ b4 shazam 
20240320141136.26827-1-quic_depengs@quicinc.com
Grabbing thread from 
lore.kernel.org/all/20240320141136.26827-1-quic_depengs@quicinc.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 10 messages in the thread
Checking attestation on all messages, may take a moment...
---
   [PATCH v2 1/8] media: qcom: camss: Add CAMSS_8550 enum
     + Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
   [PATCH v2 2/8] media: qcom: camss: Add subdev notify support
   [PATCH v2 3/8] media: qcom: camss: Add new csiphy driver 2-1-2
   [PATCH v2 4/8] media: qcom: camss: Add new params for csid_device
   [PATCH v2 5/8] media: qcom: camss: Add CSID gen3 driver
   [PATCH v2 6/8] media: qcom: camss: Add new VFE driver for SM8550
   [PATCH v2 7/8] media: qcom: camss: Add sm8550 resources
   [PATCH v2 8/8] media: qcom: camss: Add sm8550 support
   ---
   NOTE: install dkimpy for DKIM signature verification
---
Total patches: 8
---
Applying: media: qcom: camss: Add CAMSS_8550 enum
Patch failed at 0001 media: qcom: camss: Add CAMSS_8550 enum
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: drivers/media/platform/qcom/camss/camss.h:78
error: drivers/media/platform/qcom/camss/camss.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch

---
bod

