Return-Path: <linux-media+bounces-34290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F23AD0CDD
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 12:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB933AE62A
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 10:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6E221D59B;
	Sat,  7 Jun 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/ze0UI2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1990920D50C
	for <linux-media@vger.kernel.org>; Sat,  7 Jun 2025 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749292374; cv=none; b=a4OwpKNX0FoxOAKFSJ0UBe2Qxd22CvWBiHiApKvIYvqTkRMrUo32u2ZWH7AX34biBO89C5JR6KrbnKHEZxQ8Qr+M/HXIkLe2jkwh2OLcmlGPWUlKnd4jjrNDpW/YgrcJZ+GUbSvhJtS3/u3iUJKiSBAxx32iz+Fx2+rc8S33YNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749292374; c=relaxed/simple;
	bh=DfkiZuVme3n4FvzxhxFbP8GC088bc6XKMPvAk2xdFY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tq8zx2Gc0wI2eplOrJwyzj9va+FslsU0Gi6yDiz+wGnS7usqvdk3btmeJHCSSVU5/mxKok7I8XfGNUMjEQpRjuukf6MnXj7HBlBe9GuzNjck/rbmxxgkYIvlPrYQ/mC8cN2NmYgbF1a2Mb4Nzx+DvC9Z78GvUs2mBYkpFpi0swM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/ze0UI2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5577kAa1015145
	for <linux-media@vger.kernel.org>; Sat, 7 Jun 2025 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZ6+dp0ad8amdnO4X+sS5UZnq9PAZ9SW1yad5IwngOU=; b=P/ze0UI2u6/lr+9O
	4Tt/m9mo8M793kJIEheDa3FRtgH+yUrbt2HBK1ywS4o+AXVTQAKRtQ2Tv9uuoV2s
	5PKiLyCh0rHApAhzCQVTW6YHk+J980mYs0D1YKXkBqOLSeVTahJQpIT8VBO0Z2X4
	Cn+tIulVyuqd1VZIp5vVaN8Hp5hZDDndrc8I1CbkSVxcmpQXlsTvdkHoyeXeaDVu
	eZ7eEM8Ct69kzkW+Ihfwe+5rgsgosusd9jRjme2Khq6jjtlqDQO7NKEXj6BEhsrN
	KQIngbd1Y4OPSObb1GYM7fT9jT80n7arlecSEiqzGQPsNrnI2fcUI2E0SD/goM/H
	0mG78w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkrgnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 07 Jun 2025 10:32:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d15c975968so537807985a.2
        for <linux-media@vger.kernel.org>; Sat, 07 Jun 2025 03:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749292371; x=1749897171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ6+dp0ad8amdnO4X+sS5UZnq9PAZ9SW1yad5IwngOU=;
        b=L5wjDbOjWuA2jppNGeBVgx3tcQ9CHDHKJjsmaPh2676Rdmivzu/b5rFZSnX2WHv1WP
         cPBIyjH2hMbs+UGLXjBP3dfJawqg2SxckQSOazs2oDoOC4hAvXDF0/kzkuX5PRZAOKHJ
         /eP7FcFveMMmgehEJQSKUu0ux5Pzp1PGOqCBvfpyR5TC+cMCnBfBEqGU3ifJcJvO6lyA
         hqblJD5u6lMvyHCIsDlF67kzNZe72hG39z1wpgKgdCfK98vTa3uIgQNuKcJnnEW52myS
         tdYIwv0bMCFQw57r6YsvHvPm57mho1512zMxTur0FHcCbMLCIx5PImJm77F8blXfHXb6
         bxvg==
X-Forwarded-Encrypted: i=1; AJvYcCWWfhGwFN+jaSiMX/gw7i821hAqLW1zFc9nwe9SNiDRyRag4UJNFD1Yamjb30zq+6vgDP5MlARrMHtQGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuXdz+8rVsv2rjfXqKCW6Ep1IkhMNcfqi6z7WWeK6pVKSh/wVJ
	5kvr49wxioj0vkvCKULvDNGVLyfqs/FNtSHA8NC2jFQmxoUV1BrX0NjTzaZPRr1wENZ8xrVBjAq
	cAIMJoiTbWu5YCZ5odddbI3bCWpUm3AaO5WZr2ncXZIh6IroTeEyp1qPh+ijPQ99ywA==
X-Gm-Gg: ASbGncsYgUCFTibTx7zVJIj225NAJ8Cc8BfPwOaYKLyxzIxfcSnfbKIEDrSfNgxMGvY
	n4mymH9f+A0ziNESf6k+7tynCdMxBR0gSD0MhBih7rWHs7l8LOjj/VcaC1fqBihV4MWJFUEddsT
	O++GiCo+I3TXgRfyMlxcBZH7uCGK9kEh0LpXkaLkAoD2sN+6C7fcOgTCk053pDYzQ9otgMbrg8i
	Ff1hXkRpWWBOyKK9CL8FXeJLBiTZSkxuO7ER+Uv4pden7sBQOzPJdlaaZ6C8RJP/KjTTDOZFdAe
	icaQk6li/ooZK0gs/3Sp4yj+4RT3tXcyx2yGIR6kwc0OWAM1o65L0+6fIVwFkmrlXoUNSB2Ahd8
	GubfviVqr5LJP0g==
X-Received: by 2002:a05:620a:3905:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d2298ca7bbmr832502885a.34.1749292370850;
        Sat, 07 Jun 2025 03:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEegvXUEIWt6ZR7mMr3jMuWc8lA4hAWqYVM4uXihi3Zu1Hg0GSu808Wsiprlc5zXotdcjP5gQ==
X-Received: by 2002:a05:620a:3905:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d2298ca7bbmr832500285a.34.1749292370490;
        Sat, 07 Jun 2025 03:32:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772240csm468780e87.120.2025.06.07.03.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 03:32:48 -0700 (PDT)
Message-ID: <c9b83c8b-68d1-43bc-99d6-d2d2b9e445f4@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 13:32:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
 <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
 <e0405dea-bad2-408c-a65d-f9a3456dd92e@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <e0405dea-bad2-408c-a65d-f9a3456dd92e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=68441553 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=1BIh7cnd6DHUqvcSSZQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IEfN1pru-Yy7HZMAFkn439yX18X9DKvR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA3NSBTYWx0ZWRfX9tFAjFMT5LzY
 IcpMcFoY0BCxfTGoFEwJJ58FU+HlAxoSQnPWzouilYlmGjvCue/A8AQnN79dwmXnSSgvTqD1Ne3
 9ZMTZ8w2hgtDAQWuHfXEEmcLpNc7zSX6Qf0EpCu/9Sw8dV1il+hVaJl+VrG1TOtQeC4G0Jk9mKL
 /t1kU3bOpjTAIUtd77TRw8pOAsx5KhB6QXYjUNYsxiOt6qpuhZeyTxAVKK98imR5zwCXUSPNG4J
 O/NnwDufvo7NDuCnXfqYx7g0zPUcmWupAiq4DJ6mKJJKArGCXiH0KgT1g7DiRPvIXV0X3ShNLwQ
 Umx1WRX2vF9e/DAzXb+ZBCCh1DrnteTRHree0b9xQqIBfY8jRUh9NWHWy/XcEqRJfP9s0X9g1Yi
 CJL88T2TsQw7Q5Lu8WD59jc+QfkVopcZSnovcNyLeXSPjqs9CrFR+v+1/vXR+YMvQBjE1Dyc
X-Proofpoint-ORIG-GUID: IEfN1pru-Yy7HZMAFkn439yX18X9DKvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=966 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070075

On 07/06/2025 10:16, Bryan O'Donoghue wrote:
> On 07/06/2025 03:13, Dmitry Baryshkov wrote:
>>>
>>> As we've established the fallback isn't a fallback because it falls 
>>> back to wrong data, so lets fix that.
>>
>> Why isn't it a fallback? With the driver changes in place, the 
>> fallback is totally correct.
> 
> Its not a fallback _as_is_
> 
> I'm fine either way
> 
> - Apply 1/3 and then re-submit 2/3 3/3

Let's settle on this option. I think it is the cleanest option.

> 
> or
> 
> - Enumerate a QCS615 table
> - Apply 1/3 here
> 
> ---
> bod


-- 
With best wishes
Dmitry

