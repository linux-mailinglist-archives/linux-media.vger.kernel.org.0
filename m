Return-Path: <linux-media+bounces-44388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 618A1BD8AD9
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B492918A709A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACFD2ED14B;
	Tue, 14 Oct 2025 10:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENOCMBvR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343412EC0AB
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436651; cv=none; b=UxWhuHa9aEAK7ve4onE8Ud2PS23xPCN2kLl+6c1/s8+uMTIZhbNLI2PRJIo5oltnI1gc/EuxoBPKf2575M70D3h2tkM9Zqk8uZZdhtbZuqXQvyCriRdQMTXcabOftzJmEWOsyvuiVCh/SdiMhgzGMPYZBbMgjzHRKSBymn5PpWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436651; c=relaxed/simple;
	bh=6UNxFkPs7S0fth1zlm3KPMvDq2slzrLkx1c/5aAf7/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvzMBU8poPzvdgnh1g/ef8D92DvNGkDSuCnM+jbmxqWVP7Hrx4tx1yGQvwvMhP9gAn8tpA/i9SI7GgyfPH9g/SB2XCUJKzmJ30bOweI8a/ilKcp2Zt8X5V/v0RDx8+E4/9P/VuYLjC7d9rI+XdHjFcjI8nOXKX2V3HC5AKBccac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENOCMBvR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Nph021106
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 10:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GDf+gAOY9mdDvVU8qCaZ3Le3uxmX96IsgcRA5hA398=; b=ENOCMBvReXNVx7ga
	EOmOXAyXdH53PeiVHByaKn5Kj9ItG2NqsAfiLnOYhYzzWx4blee9BcF02t4kmF1V
	rpN192Yfde/xFzrBfqmsDIOYMdb1zNfWRDZw4AFZ7yU/gDklvhabmz0A86zSctqW
	XLFZILWJbSNltVWQ+DvyvCqzRtg2swzbAa3EjoYA9PfAyjtWBHmKVFiBVT1e01Eo
	/HAgtSa5LWRik0bYhf9R55jn9rgUNXmrrDwkO2trHXRiWo9DEV6ZMtQTZbokyRve
	SCKnXwaHDDMYqJYbzLbxDwhg8sLi7PHvg3lCVk81BI6ghjhO4fnO7QqZLA514ONs
	cRGK6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwjbcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 10:10:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5516e33800so12267023a12.0
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 03:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436648; x=1761041448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GDf+gAOY9mdDvVU8qCaZ3Le3uxmX96IsgcRA5hA398=;
        b=AzOfjr4/txe1g14XDAhfODGHFqdIpPhiMSBCqw9pWXyjl9ZkxCRO7vyHjE5DuazfRw
         oNX+TPkAhKnAO+tychcNBB3PTs2M+KRJt8VLVrvafKhL5xC1hcAYE9UahWgzjafBFcu8
         PGYgzMJSitAzFcWINClRRiZKmy+TBvAqMSnkfl6u9bcgFURZAYeqhxzOjq65HVI1AxZK
         UGw16gcHjCUJbZDUhRVG0ZDNbdXwTolQ+7SNyMaJVLTi3Sk7Nk/gp7EvIU7g2FgblDLB
         QKiA/1mZMmckz3trT03wYWW9vUQ6TKZ51QW1GQYMl5qgojAC7yW5VFZkw1Tmqg5zmExJ
         ut+A==
X-Forwarded-Encrypted: i=1; AJvYcCUxXkT8b5uq+/jRs9ywmXaYSFLj3Tq1pqQ/2Hg641qtXBObc3XE64GGx0HS/RNHzzADtcN6sJhtwKnvHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7uPCH6tlJEFH55PvvsIjcck0wqbiF6JuDOWGpXQ7UwcsyP5eg
	gt1QtkWuapK5n4YKuB22+uH+wAop6YcoJPVRegfGNNVPWS6rS8IgZgbz7lHEonzOP0jtsR+yolw
	xoa0TnGrrKG+OvbhZhlZTSNzWsTWP0ypYnsYy4PKPJC6XdqmjDzt5473L27PfBiRqjGrYrV9E4w
	==
X-Gm-Gg: ASbGnctHGbjkIHTAmYjSiTlr7Ad7DYucVuNRYqjIhJTAP0Qw7Iu3QwR0r7UwEvCqwaD
	x89q8LVQbH89B1W3+RZHF3TBKwU9JseRVPriJBd8ZHbdUAswQYTaQfuwXhSefjEhGFiRlsYeTqH
	vXNm+eNy9gC+9BHvi25nmhn+NiekBqzBYFmT1tNNiJ+0OjhwYJJVs3uWzDdlgKOsbvRH16leET+
	vd75fH366kuKQwPE7/UB3IK9LCYhvt55Y3xTr9kRWIeb1WFUe7YYybuHElxkuX0LYOs2uMQfz+m
	S+nroGVDVsoOL0b6tR8N3Hp7oRnn9gI7lmnNxh8mtfnKnuiGal3UmDKxqIojCPWFxWM9gr8L
X-Received: by 2002:a05:6a20:2451:b0:24a:b9e:4a6c with SMTP id adf61e73a8af0-32da845e56amr32763019637.44.1760436648464;
        Tue, 14 Oct 2025 03:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4+I2XVu7f/J1cjzoxMqKeCVBL6tL6m/uv3wlVqh90v+MzZWe5SVtdgYsVmRmojAWrthABug==
X-Received: by 2002:a05:6a20:2451:b0:24a:b9e:4a6c with SMTP id adf61e73a8af0-32da845e56amr32762977637.44.1760436647980;
        Tue, 14 Oct 2025 03:10:47 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060962sm14772927b3a.1.2025.10.14.03.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:10:47 -0700 (PDT)
Message-ID: <2d581ed7-f240-6b84-3bd9-eadc3c1041fa@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 15:40:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 7/8] media: iris: move common register definitions to the
 header
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
 <b7eba4b5-1189-7506-4767-0ef3234fc6f2@oss.qualcomm.com>
 <dzorzudzpjipvlkwik3uylomwi2dy5ticxromzegzgi2jhibot@reqv5ul5ifuc>
 <3802fe42-0c94-8c10-7b6c-6c3adf863ef9@oss.qualcomm.com>
 <t5obao7tm34uilnzoa24shknvdtzqkc5uwek4cxwbof3tgqylb@jehfugyxvups>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <t5obao7tm34uilnzoa24shknvdtzqkc5uwek4cxwbof3tgqylb@jehfugyxvups>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXxXAfueH9oaxa
 pGBzuA0kQEz9VnXDeDNwJHQR7vAXGB88T2RDQ6/JPK7U3koQ7oIj9hzyfefGPoWQLBr3ccu5+Q4
 SCZehP8JfDU9Wngd0IaJ4YzvLEri80YZkioQ+sQEvom/fgj9xiEU9oufnQcfLeOPznD1r51I00K
 EtEgEevFRFINNeCJp9wVKS7D12/i+6TqYLPckns0wC41Zw+9ZyIOe/43JnGFLnLS7VUIAHGhitF
 bLgLlkRoUScUu3+5fUnt/UvyYwGPpjrzHenJoaHHUGeYxg1uvOJjy+Ytc9wCkPaEB31v7THSb7l
 v2KaBmznBOgUTZzBywmwYeZ7T+MxyLt2P+Sp8SVRXpLOWfDJi5u2ZCEeE3E15ZA0eeQ04QjWBN6
 r9bd05fMM7eI7BX6tcoGvB18WQ4FDA==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ee21a9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UHACNdNzX4dSgP2fR3kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: vFH8dMeDa0cwMTyxBTD-STMCrnYeLwoW
X-Proofpoint-ORIG-GUID: vFH8dMeDa0cwMTyxBTD-STMCrnYeLwoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083


On 10/14/2025 3:21 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 02:43:56PM +0530, Vikash Garodia wrote:
>>
>> On 10/9/2025 8:18 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 09, 2025 at 11:40:25AM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
>>>>> Simplify adding new platforms by moving common registers definitions
>>>>> from VPU 3.x and "common" file to the header with other register
>>>>> defines.
>>>>>
>>>>
>>>> Similar to
>>>> https://lore.kernel.org/all/20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com/
>>>> ?
>>>
>>> Yes, but moving more registers. I can rebase on top of that series if it
>>> lands first. Or I can just pick that patch into the series, to remove
>>> the dependency. What would be yours / Bryan's preference?
>>>
>>
>> My vote would be to rebase this one on top of earlier one.
> 
> Ack, I will rebase. Seeing that none of the patches in that series are
> in R-B state, I will probably pick up just that patch into this series.
> I hope it's fine with everybody.
> 

Should be good. I can keep the patch in my series as well, in my next rev, so
whichever lands first, Bryan can simply drop the patch in later series.

Regards,
Vikash

