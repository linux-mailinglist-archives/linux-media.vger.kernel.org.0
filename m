Return-Path: <linux-media+bounces-42713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8796B84232
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 12:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4D46161C4F
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 10:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D192877F4;
	Thu, 18 Sep 2025 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ergZYfav"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB896248873;
	Thu, 18 Sep 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758191790; cv=none; b=eQYSPXnLIL3m1soRciMnknQiOj3mrFklS8BJXWedId3k2lsrjwAuMbKHJCjw4UhQMDww/+8D5mObnVn+EBdOqhWKikPies4wk/kePnbB1jbdkYHOpsQaXiay+7MUdpyLyBmaU/Bp0gEN5DImARuFLZXhfDrGWiOQP4V+mML4Me0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758191790; c=relaxed/simple;
	bh=cKSTVhSvmb5YUS3u1Y6cdzoo5orOzVA1+59PDgLYgYg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=D38URSb5tAvBs+1d1L3UBQllac2W4Y5wBBZPDqJtEaCOCkO1Ncr5/YAMuc8W2VHUt47hekGCKITQ/pRGk60+H5+LbGfhecvp3nIlFsXAPsa6Eup+A0IXWwGWUKHLoHY2+AnAPB/oyI24FmqhTcRLdfMAHtY8cy508NQReLwBfQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ergZYfav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0E1C4CEE7;
	Thu, 18 Sep 2025 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758191789;
	bh=cKSTVhSvmb5YUS3u1Y6cdzoo5orOzVA1+59PDgLYgYg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ergZYfavH31ZqhCSiUoSaQZh1UpMWKj9Kn6YB3Cpman7AtMAbgv7jT1B7DA/V0R9+
	 wKEq6gk52QRCpX+bXAuemhqcrJHqjWAMrvNmQGMs5D70DH6IWoYDCf5JLi8Ap9JpRe
	 /6qS+wI6DujtJO0sN4OM6RJVRHStYPME21+BFj85m1jjOCepRO4KDFavNMQzlTpaCH
	 +M+nFXImmY8Dvd23k3e1QoOQZ+ZpDOtG/l65ib4vI4Bu1CjLTJfp/YXdEt/D4AsTB5
	 S7uR5YlTuOeQTzxhVEzIeGReDyMTmc1qvhVzAkpZAQuxGySw2TLnc48MXykgzLyeyZ
	 9eVHiQdDQSC2A==
Message-ID: <56a6a3b8-bee4-46db-af15-8312067e28db@kernel.org>
Date: Thu, 18 Sep 2025 11:36:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: pm_helpers: add fallback for the
 opp-table
From: Bryan O'Donoghue <bod@kernel.org>
To: Renjiang Han <quic_renjiang@quicinc.com>, quic_qiweil@quicinc.com,
 quic_wangaow@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com>
 <6dc33f02-6691-4ad8-b04f-423e4e5caea8@linaro.org>
 <b19ff26f-7dc7-4022-aec7-49922ab521cf@quicinc.com>
 <b4e25dd2-caf3-48f0-8e1b-622f3db1b7ca@quicinc.com>
 <a59ccd01-1482-4091-957f-740840ff5112@linaro.org>
Content-Language: en-US
In-Reply-To: <a59ccd01-1482-4091-957f-740840ff5112@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/09/2025 11:33, Bryan O'Donoghue wrote:
> On 18/09/2025 11:21, Renjiang Han wrote:
>>
>> On 9/4/2025 11:33 AM, Renjiang Han wrote:
>>>
>>> On 7/28/2025 11:20 PM, Bryan O'Donoghue wrote:
>>>> On 24/07/2025 08:53, Renjiang Han wrote:
>>>>> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
>>>>> do not include an opp-table and have not configured opp-pmdomain, they
>>>>> still need to use the frequencies defined in the driver's freq_tbl.
>>>>>
>>>>> Both core_power_v1 and core_power_v4 functions require 
>>>>> core_clks_enable
>>>>> function during POWER_ON. Therefore, in the core_clks_enable function,
>>>>> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
>>>>> it needs to fall back to the freq_tbl to retrieve the frequency.
>>>>>
>>>>> Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for 
>>>>> the frequency")
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>>> ---
>>>>> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
>>>>> contain an opp-table and have not configured opp-pmdomain, they still
>>>>> need to use the frequencies defined in the driver's freq_tbl.
>>>>>
>>>>> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the 
>>>>> frequency
>>>>> fails in the core_clks_enable, it needs to fall back to the 
>>>>> freq_tbl to
>>>>> retrieve the frequency.
>>>>>
>>>>> Validated this series on QCS615 and msm8916.
>>>>> ---
>>>>> Changes in v2:
>>>>> - 1. Update the returned error value as per the feedback.
>>>>> - Link to v1: https://lore.kernel.org/r/20250723- 
>>>>> fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com
>>>>> ---
>>>>>   drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
>>>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/ 
>>>>> drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> index 
>>>>> 8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390..77c12273dbb9505244e260fc8fa635e4fe045236 100644
>>>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> @@ -40,6 +40,8 @@ static int core_clks_get(struct venus_core *core)
>>>>>     static int core_clks_enable(struct venus_core *core)
>>>>>   {
>>>>> +    const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>>>>> +    unsigned int freq_tbl_size = core->res->freq_tbl_size;
>>>>>       const struct venus_resources *res = core->res;
>>>>>       struct device *dev = core->dev;
>>>>>       unsigned long freq = 0;
>>>>> @@ -48,7 +50,14 @@ static int core_clks_enable(struct venus_core 
>>>>> *core)
>>>>>       int ret;
>>>>>         opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>>>>> -    dev_pm_opp_put(opp);
>>>>> +    if (IS_ERR(opp)) {
>>>>> +        if (!freq_tbl)
>>>>> +            return -ENODEV;
>>>>> +        freq = freq_tbl[freq_tbl_size - 1].freq;
>>>>> +    } else {
>>>>> +        dev_pm_opp_put(opp);
>>>>> +    }
>>>>> +
>>>>>         for (i = 0; i < res->clks_num; i++) {
>>>>>           if (IS_V6(core)) {
>>>>>
>>>>> ---
>>>>> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
>>>>> change-id: 20250721-fallback_of_opp_table-4ea39376f617
>>>>>
>>>>> Best regards,
>>>>
>>>> Note to self add a
>>>>
>>>> Closes: 
>>>> CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com
>>> Thanks for helping review this patch. But I'm sorry, may I ask how to
>>> understand this comment?
>>>
>>> This patch has not been picked yet.Is there anything else I need to do?
>> I’d appreciate any thoughts you might have on this.
>>>>
>>>>
>>>> ---
>>>> bod
>>>
> 
> Marked as "Not applicable" on media-ci patchwork - you should have 
> received an email about that.
> 
> * 7881cd6886a89 - media: venus: Fix OPP table error handling (6 weeks ago)
> * b179234b5e590 - media: venus: pm_helpers: use opp-table for the 
> frequency (3 months ago)
> * 14423fc3a4a21 - media: venus: pm_helpers: add compatibility for 
> dev_pm_genpd_set_hwmode on V4 (5 months ago)
> 
> git checkout -b linux-next/master-25-09-18 linux-next/master
> Updating files: 100% (10211/10211), done.
> branch 'linux-next/master-25-09-18' set up to track 'linux-next/master'.
> 
> b4 shazam b4e25dd2-caf3-48f0-8e1b-622f3db1b7ca@quicinc.com
> Grabbing thread from lore.kernel.org/all/b4e25dd2- 
> caf3-48f0-8e1b-622f3db1b7ca@quicinc.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 5 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v2] media: venus: pm_helpers: add fallback for the opp-table
>      + Closes: 
> CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com (✗ 
> DKIM/linaro.org)
>      + Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com> (✓ DKIM/ 
> quicinc.com)
>    ---
>    ✗ No key: ed25519/quic_renjiang@quicinc.com
>    ✓ Signed: DKIM/quicinc.com
> ---
> Total patches: 1
> ---
>   Base: using specified base-commit 
> d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> Applying: media: venus: pm_helpers: add fallback for the opp-table
> Patch failed at 0001 media: venus: pm_helpers: add fallback for the opp- 
> table
> error: patch failed: drivers/media/platform/qcom/venus/pm_helpers.c:48
> error: drivers/media/platform/qcom/venus/pm_helpers.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am -- 
> abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> 
> ---
> bod

"Not Applicable" -> "Changes Requested"

---
bod

