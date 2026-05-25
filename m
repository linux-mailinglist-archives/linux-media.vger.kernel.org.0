Return-Path: <linux-media+bounces-62715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPeVFqkmFGrfKAcAu9opvQ
	(envelope-from <linux-media+bounces-62715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 12:38:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0C85C94AD
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 12:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CD06300680A
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B9335E1DD;
	Mon, 25 May 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsNHIcq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFYoLbAA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1022017BA2
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 10:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705510; cv=none; b=rk1Ecn05KdcvJsFFcjCA28AsrrcrpnStZwOX8PAUxdzIDWT6yKzsR5kslmdZqnM6KRvLsTUSf4BLgciHKyP9/IlXKSkgMD/nPUi+yKPs4BoZPVyJ0gUIqIUa2FyP3TeQ8BHab7ZoGk+WyoCl3hFNOj6lHymvgx83XQutjC874h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705510; c=relaxed/simple;
	bh=YSz8kgUpzc5nXAU4kAzKN2Q06f9VZ7HLu7NW7kG1/SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndC+s5rMyUGCZU0yWc15W3I5YcFDriS5m2PyQZLVK5ieGslHpa9d4UjKLMGhcKanSMLaRi3RD2QHeaqd6Xe4zAZrcT7bGYy10GAuiJDO0mDPozO6cIZQFCRlhStZzn+lw2EcS+VhlnWowrkcPMf/GpsnY/NncU+X9nguuKVTl2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsNHIcq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFYoLbAA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7c2UT1889308
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 10:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=; b=IsNHIcq+AVy807g4
	XXmfIHyW5BPrLDfl3RunYSkoLFhWFVmhUyUjDQMmN7oIU9RlCgo27AgeyyH5uQ7S
	08WfMHu+tyOkeqnugJ7DWyNG7nqsqgDIxtmF9GtIfEogAXCG7XZnV/KJ5Ig+pOWW
	iE+70dCBAAruiUWSyKhB6Sni0SaQNKLa+v5XlJdq/z7XjwyQCV0AUUeY9KMfJPIB
	gLSwp8S7/zVs7nmEUir1OFAKDGqikMwndVRsVzvtCXKCLYjbIH8t7XaawHc3NAex
	gbJdbg/zliCPv7dKXOQvsN9G5WMggLfMWIXN/Pyfhy1v2VRvtS8wcrsh03Fq7ahQ
	w2gM+A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0wg2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 10:38:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c850ff84ddfso6193171a12.2
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705507; x=1780310307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=;
        b=VFYoLbAAVOtLMENrV+0Xrqng7UvWw4p7DGHIiRmwu/4NvoNop9uCCYBOJGxzH6+VRs
         LclKQcPTFpfir1ErJw1R1+pyBWmPxkPLPUG7n8Jvg/lwRA+n/5lcFwGKqPURaQYPYbyn
         rCcfWkxXXwE7QXsvvkGtaDxhHOH+r4BpTtypcu1IpVArQu6ZYzJ1TrJReJ9krWwAGCpN
         Kq8AnzmrKwLMSVdmRajDLxvIXivV7EyzmekoeKU4txwnixsoXFPGAmU9WO/VdqBkt/9f
         33lwPHZ6nKoKR3N27zh8ykYhQBmiN0/DftBVQhkG6GVxeq0l0ocZAeonIVzAxp1iqdyp
         wCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705507; x=1780310307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=;
        b=iMeqtT0HZAnlCAg52Ff53INi3EMji91578uGkBzcpuzF/IKN1W3Z+EF8EKBYsq7EB5
         LgOB0da6bsiV8lFTY4LR+pj8gWZ9tFA3pkvZnVBKG0ygDw4eRL9iDfyjl5qCeh2OePPk
         2rZ5nCzXjvKUjYhzbvtnuj5CW9c3gze66H5k31GEO2oPK+lzDFimBvrsRCEf7iWqmeLc
         lkMgo7n65eilCfqZSUbIrZ3vg0EIiMvxEDSZIyU16MUhkRzwkuy9SsgzA7oEdQtJUyRF
         xbM7oIDpPDyOULRbNCguibjiy/9H2T8OeuNZhqM5cMjGsn6Yohs7OflH/pZq+LOMfR7R
         zIJg==
X-Gm-Message-State: AOJu0YyrlX9C3hxSe+yGIukRIcs183J0Q76fdGLgwc8RvyGoOo2ry+M1
	730oHpfgnQPes0olnktpwc1u8I+MinDJQU3TYwXf8I9lG2644MZn6PyWUrgcdowbZ7bQY53mgI1
	jpe1JOgBW4yN7kL9mvDLnpOA5vC/z8lM/j5dF9dcX/vH69AsbOsFH+wKFMYVqbiJNJg==
X-Gm-Gg: Acq92OEL/DCyXk816P4OVY1XQXnzzWBy0pOfKM1zI1IINYRPpy//xNSgnCukhAZvDvT
	IPisVBuwABR58K/tlfVO9GsnmzZsnTDAM1UrnBj5dPg6CypRQeackyrPEQ+T6o5jk79DbtGZMTP
	NJJ6U4vou5Pgf+9TG/bfGAz++1udm4fDL6oOKFt0KaRGpUVrw8V4u/fC3rQeCvzHbzER8SSYY2I
	p2NOMkXJrLrSa1RmsgKaN3Bsgn5YwQLmX4dtkDXdd8hUe6H3Y5srZX3E6a2KlLoDDtGZpA63IrO
	rcJuCkh4wz7ToIfNGPah3WBm7S9FycJpwdpCJ7gEyMh91wLpjxivz82l+PFNs1edUJUOe1DooHU
	DQPSEF4epAzR6Ec4I2/ItiE9W+Bo9/hwNTrHtATSkFzpfeTQeLamf4+gJ+Sw=
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr15349721637.47.1779705506602;
        Mon, 25 May 2026 03:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr15349682637.47.1779705506118;
        Mon, 25 May 2026 03:38:26 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164affc22sm9242136b3a.21.2026.05.25.03.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:38:25 -0700 (PDT)
Message-ID: <d4473a79-0629-4a62-bb59-a7b7a917594b@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:08:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6jqVzQ4v5DC0W8M_K5PBeEFogx1K9TCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOCBTYWx0ZWRfX4AyeUFedXghw
 aP1yp7kEaQ68qg+ZRHhlW7gSJXHOKHOdHvBM1gcQVFU15VTHb+b/s+XeEe3Hdul5q1klG6tlInl
 2hNRpZKTZMPcMgUOBZsP0C5XFEKCsZVrRjNYi1WNfhG03dhAkTO2TdJYEyzoyvyLA1IeZqW0+3y
 jbtCAGthEUQj65TyKWnnzf7fNHP43g9MsvmHikom8vzcl2tBHWKe5QNAfIb56ns7F+T8mjQLoGu
 o/O7dAz0afwKbqrpaLu9odaL360Ou5Vpp7V2q3tYyaCtmPVz3kWmJCGVzTZHdW74FCiSfrn/MlT
 eVJ01yvqew2yLSWlxdCNz31HU9zJmOocAJytxDO+i/mBZUiKM3GJFXoRf61zVGJPp5LwpyUDl7Q
 Cw1r3TGYAauxBM79VU8JBVxAfso23jBwD5fXXj4ol5JM3wWE9sliAK5npahUaruRsjmneuzyauv
 T2aS8h/9X/2TtmtBjLg==
X-Proofpoint-GUID: 6jqVzQ4v5DC0W8M_K5PBeEFogx1K9TCH
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a1426a3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=plRfSYbjXIbEfgUgcesA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62715-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED0C85C94AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 3:26 PM, Erikas Bitovtas wrote:
> 
> 
> On 5/25/26 8:51 AM, Taniya Das wrote:
>>
>>
>> On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>>>       .halt_reg = 0x4c02c,
>>>>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>> please use .halt_check = BRANCH_HALT
>>>>
>>> If I do that, the clock fails to power on on boot.
>>> [   20.324488] ------------[ cut here ]------------
>>> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
>>> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at
>>
>>
>> I am hoping the Venus driver has enabled the GDSC before requesting the
>> clock enable.
>>
> It does. From 3/9:
> +static int vcodec_domains_enable(struct venus_core *core)
> +{
> +	const struct venus_resources *res = core->res;
> +	struct device *pd_dev;
> +	int i = 0, ret;
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev = core->pmdomains->pd_devs[i];
> +		ret = pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +
> +		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			pm_runtime_put_sync(pd_dev);
> +			goto err;
> +		}
> +	}
> 
>  static void core_put_v1(struct venus_core *core)
> @@ -320,11 +410,35 @@ static int core_power_v1(struct venus_core *core,
> int on)
>  {
>  	int ret = 0;
> 
> -	if (on == POWER_ON)
> +	if (on == POWER_ON) {
> +		ret = vcodec_domains_enable(core);
> +		if (ret)
> +			return ret;
> +
>  		ret = core_clks_enable(core);
> -	else
> +		if (ret)
> +			goto fail_pmdomains;
> +
> +		if (!core->res->vcodec_pmdomains)
> +			return 0;
> +
> +		ret = vcodec_clks_enable(core, core->vcodec_clks);
> +		if (ret)
> +			goto fail_core_clks;
> +


Please check this sequence is taken care or not

Power-up/Boot-up
1. Enable GDSC
2. Enable clocks
3. Request GDSC to HW control via 'dev_pm_genpd_set_hwmode', true

Power-Down
4. Request GDSC to SW control via 'dev_pm_genpd_set_hwmode', false
5. Disable clocks
6. Disable GDSC

-- 
Thanks,
Taniya Das


