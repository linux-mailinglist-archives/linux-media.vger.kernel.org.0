Return-Path: <linux-media+bounces-63219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBNZGedDHWpbXwkAu9opvQ
	(envelope-from <linux-media+bounces-63219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:33:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90D61B870
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B82D3057611
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6988338D404;
	Mon,  1 Jun 2026 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lT4GgwPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y70QWgMh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD0E38C427
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302605; cv=none; b=dezzu4EO07GdjJukX5RsraqdrQhYNFnAQ/rLYzEDHW5K54fJZFsI0mFRTMPfbWd+3+R3vJ1guXdFbZ130fwhNIYZI2Iio23zBd2qOlCZo1mLhTu+1WW7kEP18NTPcvqmmx1mPLJzHwZRR4RzrmRyTi1rlubaQRWn6uJuRhm5UIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302605; c=relaxed/simple;
	bh=UwMCGuCUG/G59TsR9qdiEFTMtiemrGM1GHLA+rls0Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuHGAcK1MD+bingY40pBnW17E97vllw30+xuSIrNrC0Q44y/xaXFtZ0iCjXVAhV2hf0kZSe/uvnxzX3ghwS1qvLRbxwoBW9KG3Zs003Z+qVzdWN37cd/PwCVgn7eR42SMl348SyCfPAms5LzeniBqqxcps5PwZ1Y+wbsJPd0RaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lT4GgwPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y70QWgMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511XtgK3146795
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 08:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=; b=lT4GgwPi35xPJOEn
	XEGBJpKinD1t8R14tMZkVO2XlhmEJ9CSJJPR3E1Knp7k+Az5TpJWLjzILODDu7G1
	+bkThFkpkA9KIFBxAQyEyGlXTGp7FDaExgHlXm2GdgYmQeF+0AVu3VrJP2M0rnGh
	Im9cjci/hOIgr+o0fYhuhHlfqJSjjRkNa2bwCSP8dw9mlBYu9GnD+ZBvnarL0UyV
	rWgmJbi/OXf05O/B8S3zIqJkPsiufjpyniny2Gyz8FJvIzkVSHACDKBsikJktY8A
	ucIS0ABJZyAXtTnF9eOi04qE34jUUi4RmpYFrfS/eYGlBCNV8C5i3hNNe0jbv9Tg
	dYARwg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7pq7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:30:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso2371054a91.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780302602; x=1780907402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=;
        b=Y70QWgMh4Zg+jBFIrhXnINsh76yk60nTtnsehyxNDXiAb8T+GZZMvXxj7uRx7TATtT
         JKK3mkDqnreSprmKIJ+eA7rVW/uHltaizugzGLR3sb3Om+f0zVETF27ZXZCODC4sleUd
         LvxNaZnTkdtc8i/7UzSCf2ZL49JxPiNeuUtqaqvR3KiVZZgaL7CgI6pDhC2hdOhPCCf+
         g51p5YiixQtSnM6rQOxfmNWxYhvgrL8LRQw/JOp+/8Tgn750dW2NiXsFAiZWiORx54he
         WYRrqwYaUA7YfN+j9tZjPnuUkio6IUfH31av6IRkAEj310C2dhJJSTZVxSJMNtC2cO+3
         0EpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302602; x=1780907402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=;
        b=gC0oUL53seaulrIoWrAfP7bDhCD9lyBii466Kwxph32PGWRZRTZ7TUZTlBT0dt4wCi
         6GIpCJxAi4ZAx9ajIEZ5uG3XZ3ZO8c2X4aWdBy7UlGN8VX9mfMosHUX+uiJY98Qtzp4H
         43MqeK6ndCpBsBH/d/UftMicVRh4mHulpFqLkJXTZPIkPNzJzD7h3rEIbG6AXkPP8xC5
         nI0RBzANSxIyJWV4wfdCtyG9aAPgNblYp3oI9+P2VLPxhicRBV3Q1QQzvx6G+lixO/ys
         SDf9v3yX+yKVHVlSEMG+ICsMCd0bD4Am3IIpCSlW/V1u0+bIov2J4dtwFyh7ToTd1ZfP
         kivg==
X-Gm-Message-State: AOJu0YyXmgBuJBeQ2+k4H6YqTkSRWFKCo0Tr79tupTXNNJE4rDhfjg/u
	1n37zOGsPcMhMo7mMY18bDvSrwt1MVogLdJQtFN6KwQ31AIKgu0JVTCIOLyxoL52WEbQBou6m1Y
	x+pwmK1Mmpo8BQ+kCp4YAMqYBHNDcdExOo2XsidOezLtEdylwiUgHfif06Ua2MGIzZQ==
X-Gm-Gg: Acq92OEzJyCVh1EuG/Vp/0C8+UueEASIKvYAHnZhCC1UfF9gGz+0/OQ+QneEINpwLKp
	ytlIpEZ/rFmclbV4G/n+U/RurpuML0wmnzjyzNZMicgyjCavnq8YMk4iyj2JVgdrOV7pDSb/ty+
	EcFytqBmZdH91Vcw1B590Qkf+bwCvifp+VanWhp4LGAaS+s3ueY7KGcQ1drNuy8rIKfxZJ59eTp
	0A9PW/whCQa4ICZ/HQ1gcbpqFjtvAKpfkNObiCyjoLwioGCdx99gNUwUc+fPThgOmBn/XiwNkRo
	mVDr+UWrRZdQ92VoQCSj+akwQ96r0fDUoCSsdUZqP7QVPZEFwN8VBE5iYubMn00BLPGS4OX/BmA
	7+sEmc1aOyQUKAxicHL61KgoZzWyLzgEnwa+sNJY9OlN2Z1CjykPcbDQr6ww=
X-Received: by 2002:a17:90b:5101:b0:36b:7c4e:1b07 with SMTP id 98e67ed59e1d1-36c4feeb84emr11044990a91.5.1780302601931;
        Mon, 01 Jun 2026 01:30:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:36b:7c4e:1b07 with SMTP id 98e67ed59e1d1-36c4feeb84emr11044975a91.5.1780302601467;
        Mon, 01 Jun 2026 01:30:01 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdd1a855sm4491346a91.6.2026.06.01.01.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:30:00 -0700 (PDT)
Message-ID: <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:59:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>, Erikas Bitovtas <xerikasxx@gmail.com>,
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
 <4JzpVyRt008YHZIv34VGG-Z_etL_fh9cE8AL30d-uekLUAxGmZNV9os6xkESzPAyzDHFHA9XXyPgWxzBlEfnhQ==@protonmail.internalid>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
 <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aOMdZWiZ6yW9FCfgILtuTMrQa4ONAiWI
X-Proofpoint-ORIG-GUID: aOMdZWiZ6yW9FCfgILtuTMrQa4ONAiWI
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d430b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=uEUO8UhmWA4g_SfyP1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NCBTYWx0ZWRfX6BIoNvHOiTrG
 EKTG/k1jKuq0fH+AFKIkSd5DUKcGXQt3JN+2HESFdkiy/m1aWRpcRZU7p2wCrBRaaETZqkIucq7
 rYDfacR0L7JGJcbpx7D7xf9GCg2KP/yXHzLTUdioU7l14P7iup02SzECbETc5iO81HDHN63o4Ec
 lpAEdFHN8aQV7vRM/b1P8NPFzOBo1W79m8BFK2bluSl18a35XsrZP90llx2tVlFZcYWDZhFPQ0v
 H5LCwVEY8FuWIqHxd6m5C02LyBwkmsaC/gRLRaSTx4rs9YmngsvHKjuwUGChQB3enKq9pmTmIkj
 q5lTFOl1Znhzph54DmxzzOMifGDCBRNEXYDd4BPhJPPsRhF30LLko46Yk1rtWnMxrcKes7W0G1M
 QjPaQZh85GDfg8itwJiYHPOIOpHTj75Fk62Ube2/WXO5dxWrX01oW4wXYsQ5gJ6krn8qKoh9nXo
 o9gs/5VzE2kCjq9s/aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63219-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F90D61B870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/2026 4:20 AM, Bryan O'Donoghue wrote:
> On 25/05/2026 10:56, Erikas Bitovtas wrote:
>> +    for (; i < res->vcodec_pmdomains_num; i++) {
>> +        pd_dev = core->pmdomains->pd_devs[i];
>> +        ret = pm_runtime_resume_and_get(pd_dev);
>> +        if (ret)
>> +            goto err;
>> +
>> +        ret = dev_pm_genpd_set_hwmode(pd_dev, true);
>> +        if (ret && ret != -EOPNOTSUPP) {
>> +            pm_runtime_put_sync(pd_dev);
>> +            goto err;
>> +        }
>> +    }
> 
> In Iris we do
> 
> - enable_power_domains
> - enable_clocks
> - set hwmode
> 

This sequence will always ensure clock can be polled as the GDSC is
still in SW mode.


> Instead of
> 
> - enable_power_domains
> - set hwmode
> - enable clocks
> 

This sequence will require the clock to have SKIP or DELAY as the GDSC
is moved to HW mode and it is not guaranteed to match the SW expectation.


-- 
Thanks,
Taniya Das


