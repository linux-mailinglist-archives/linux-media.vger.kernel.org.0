Return-Path: <linux-media+bounces-47317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D1C6B441
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 19:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id A6A7E2424E
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 18:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A976C2DBF75;
	Tue, 18 Nov 2025 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6IwqgP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjAuwQM2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3472DC323
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763491457; cv=none; b=B+56EobKCbh2QSO+fq6I0vTipYbBjcxEsh5+q2uXnQ02XR8LT0avkTD5v5sApTdicF3F6yrLqYeW+LJVib+7nqkH9LZMW9YjMDUdEd0Kx8K73JipEIV3pUgl4yewuJJTncSq3Fi1ivy9UgAidVPHhBjfCvMrJFjiTnI80q0nOy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763491457; c=relaxed/simple;
	bh=jOUJQ8PL8cIVunV5Nq3P/tsyL6RA7+GohwuxioCFr4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqBisaMr/7wcjwxPGgGJ8TIhHq5iHL5IAeKQYNOg4RGvQLeTOh13MkHyPWfxEixsGAxleXmW2R192KDZvcpcEzbpys3SARcxKGur/Z660g4/w0gMtA1/yDDVgvNs3TVqZs9NlN8SdS74F+4/7lB7edhKosuVE49N9wx1SgOYUQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6IwqgP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjAuwQM2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGD4Pn2755988
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 18:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pv1o8OEkXFqohWwP9fv/QQFyhfzHqcKHifLmavfpcbg=; b=F6IwqgP9+lyQRgPq
	S8YPLggnmNZNavsyvPaQhWFrS4ANmkxJKYKKcSv69HdA635cc6m0+h+1/aYYJHLz
	gmA9qdnYrHepCUo0zT4w6UiJ3Gi6sKI+Rr52cRFUisfHMyScKYJQhfpBy9/Xmoob
	ralMJNk9/l3EE00SLz+0Pyz4ayDvAXULpuxsZNXY37F6sbnEEXDYcN3bPbSwdI0Y
	wkdkS8E+wSPxwU9elVhjJ1aGW+cS5e0L4ah61HGo1wC+W6tBW6zOZxbqr38wt95L
	fmK3/WIYpXrzM5ubWKkBgjH+miXM5Rvx7oBUoX0ljljuzJigCPWq105oHsgLdEQO
	WqmtrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj1sd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 18:44:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed9122dce9so1475211cf.2
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763491453; x=1764096253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pv1o8OEkXFqohWwP9fv/QQFyhfzHqcKHifLmavfpcbg=;
        b=WjAuwQM2uPuLZzNB2fQIbZFyEfQyTD1zQdLCZGW/OecSg0o6zC3aLX/wNerCSibjfF
         QmHrJ5Jb6Jknn4iQS83G1KC+ShVxqj3iEFOiBOJZCvpso+lcMWtz01yOc0/JnOoBvEqy
         J4VW4RoWXkE6z/0AwjZDQKHx3C2MtIOuF1rZnU9y96RBlpCIcKqbyo6Yt40gG9xz68w/
         nKptqbBZXVLpjd9ID/4VDG8fjZy13G0M49XDeqV/WiQsK0T2CNNmoWzyVXoZ8VbICJ5Q
         eJMl5fgpbaQlVeSse5Lc0l2HFtMObfu2+26ipdlqz12AwWbRieGMz+/lF8ASn85/r5/0
         /g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763491453; x=1764096253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv1o8OEkXFqohWwP9fv/QQFyhfzHqcKHifLmavfpcbg=;
        b=JAVGx7oDkW0Jl0lxjP0blBMGU3MoZDIMzb5zOOoBA7SnfOtzuKZ7P0ARCMMl5YXQ9o
         isuQPQg29CVhbT53fpRscqpzJg8TW0hs7S28BJNlPdb631PVTU1qaDjzE+GtAPYknuL+
         Bw5B64u+34L0kSxOib3KEcLObRRSauhaNb9RBwJ0IadxicpZnDtP0WYwyjkLXbP9hSU6
         IEljU71N/MfMXTvOyHNhtRuwBltH1zNFj1Lv3etQkg6TzNcV2NpWC1HfLUUqZwVrBLOg
         D56ow5HRYEaI37CCh/D/+CEQ+KSWofGAQJXoujOLcPOTRUqwb4RioTLuhJxlXd7DwAf9
         CvLw==
X-Forwarded-Encrypted: i=1; AJvYcCWLWiYXv+a6vIJXza445X/4/Eyfshr6mCRwpovd3swp/CiowRiCCW78e3xFfMkgDKvU907gq4fiKzkKUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMz/YpEKJEBJjv3pgLuDtAYcZm/hoSMcQcLQ5lme28q06LV/JC
	DqwS85kObWfqeo0nu/SAxTHF2AOQ/NWLOokgyNvEoqa8p9QHz6nsr30M4jGA5C4c7Knd8Cq3cPk
	cnT7TrAmtT+id+Cvq4bskkvERXwI094E0z1KWs79jL8nqt3OSqhldQyAUIMirRqKlWg==
X-Gm-Gg: ASbGnct7fDfgwFS12dOaFblubE/ti85LqZPi8tQRzj3IHjRhnEGJdXv6fRQO+evacWE
	ZhGBahyzWdjLzMSaRwc195jVJhLoeuAaQHc/4KvAKJQtpx/gREQQdlEC4VZQtFS5yi3mCKGEQkw
	IwD+cHQ/Fqy+JEqPqOZNRW65exuPdRL31Iacgi5HyLjkD65t0H61P4nKIuvUG+M7HwjCTxmGDGm
	N6rnxyduesWDkIeljXj7+/w2/jRES0auotSA4l0yXhaWfAO7tGiaIJHa5W4KHdqvq0gjrgMXIwF
	KICA2Deb3ZOzfbp3VHefL3hz0+fo9kMXXQSgA8ydJFjxeZWgtxgHTBiPjzQgz6C2IZuxNKaEwYM
	uoYdLQLVfIU5MV4M8/2wp5TsMcfRFP4l00fU7Q/w62DkgOJkkGimSwUi0VclOZOFtyZw=
X-Received: by 2002:a05:622a:1801:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee313e82f2mr40911231cf.3.1763491452960;
        Tue, 18 Nov 2025 10:44:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIwui5GnGarvYrQ5avyscL/Z3HNJT6/IFHRa9bAAnF6MobSMqfihfQL5VLSyKjx8jFCUExnQ==
X-Received: by 2002:a05:622a:1801:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee313e82f2mr40910961cf.3.1763491452526;
        Tue, 18 Nov 2025 10:44:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm1400674566b.15.2025.11.18.10.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:44:11 -0800 (PST)
Message-ID: <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 19:44:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DNagR6XJykwbkalmohrTepBJWgNI-6w-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE1MCBTYWx0ZWRfX9Ofg5wJzZrEg
 U+W7yzYAaiRCZXSu+uw0uShNRHeiZH8j4hTvXUB5SqZA2DAodUPE5cKe5yXt6rRs/20Qo1dKac0
 H5zIisMce0KsL9t33OzCOR+39HkXaF8hXQcyK0GMLgkqAVtTqRXxqLhmZaj3H99g9o3gLMl5IjL
 KyElrPTjJBlc/jpjR1lJaZgBv4ldt3sDr0iB01qU9TPzCdcqZwWCskxwom3xkocJOG2m7v77xur
 rhLUhZiN/XbHv9K5uPFluEzv1c1Rtiq/EgtbNPSr+vOAB2rX7Oty04a3xpkxdsaimcbTIlIJTDC
 fzw13EAnhVcJLN73yeSHyR1C+EOZU5YotQj63AnBXZUrj72OGJjdUGDUbl7MKJQInsfB6XqqHLH
 EClKUqzblgpJvyNsgwjGZmEI+RjQ/Q==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691cbe7e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nEpCki1jQKL9UMwIy64A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DNagR6XJykwbkalmohrTepBJWgNI-6w-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180150

On 11/18/25 7:25 PM, Vijay Kumar Tumati wrote:
> 
> On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
>> On 14/11/2025 03:29, Hangxiang Ma wrote:
>>> +                  <0x0 0x0900e000 0x0 0x1000>,
>>
>> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of the registers in the ICP block. Should start at +0xd000 not +0xe000 ?
>>
>>> +                  <0x0 0x0902e000 0x0 0x1000>,
>>
>> Same here.
> Hi Bryan, HLOS does not have access to those registers. They are configured by the Hyp.

If that's hyp, please add them. We already have platforms without
Gunyah. Remember, bindings are defined once and for good and I wouldn't
call it impossible that someone would want to run that configuration on
Kaanapali some day

Konrad

