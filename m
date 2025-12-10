Return-Path: <linux-media+bounces-48534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04989CB2125
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 07:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FCAC30CCA7E
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 06:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F62D2236EE;
	Wed, 10 Dec 2025 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsUg99qR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK8pJ7hV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E911A4F3C
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 06:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765348088; cv=none; b=FXZHFK79fXYTXQwi8Ngo/bjyisyq5wGi+byNaPcmkjvI/tUjdqHogNcHZFoRjR++vGXLURgXa5klmMvVw0/Mx0K6MhTRtFm1X5cwFMUOx5616uNI7mUNKl8xF6gK/BZpF1jFLIUDtzdFDrUE6miCJu1F945oYspiV0BE/x1YPk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765348088; c=relaxed/simple;
	bh=U5cOkuDeAX5IRsDNTMAVxmncrKp928poG3Fn0wYef+8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mgClSFZxmTghpuhwIFsfORlaw1foGkS3O2ieCTWYj41laVCZ04bl++XDQ1kUJtt9iGV7LW6FOZBwC8AoNN7tGZyiW2XOAMYi9UZVhPa2VTJOaWHkJohocO/lkLzaq8Fl1A41KF3lbYf753ItW9doyVFdwCv1mf0mqDiIuGIM+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsUg99qR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK8pJ7hV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Dvb91954056
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 06:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M70/PMAPDikZYkLzh450XJp+8kYBpa3eFHpFKS4kGyk=; b=ZsUg99qRcSpRSqPT
	v61sHRfhu9bOeDGzR+B6pk4ntjhRQ/f+zYBRkI4Z/egQHOF2SUWJDFbmOtDxPMiC
	NWR/Grpo3owi3XmwfMuG5eo9mOAHb6SJwXYCQ6VfIShTblkR45gsPq3hwaGxWQFm
	lVvsRGLHLyS7FrcBT9XcbMmqUEVKpQOtKkCGepx3DKTtbqFzMlkuQIvR7AxrDzYB
	RW50aO0+kZjXIeIrizjllUmRj6ONnbLUVCAQB9rk7pDrncYy8f7phXykImmaIYX6
	ubjkUQmXh/237eN+JkAeQdt7/kk6hS5/jEV5oIJQw6zo8JRUJC4PQ0j3ht+xrsZ7
	vJqKyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p2nry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 06:28:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343e262230eso7273939a91.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 22:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765348085; x=1765952885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M70/PMAPDikZYkLzh450XJp+8kYBpa3eFHpFKS4kGyk=;
        b=VK8pJ7hVIl6pfLYXjHZUvsACX16HvBO8t2fbqOTN6D1NCsEQxYRzP29lXNINVaNPtF
         1mgxwLPbxVkerAyZ/Deq2Fk96aZ8ob1T3rJfxS2yg573cUgmDFKgyTBbuFkovVduVsZe
         pZZvslwngKwhSsTd9wEOSUEYR3dNZuzjXcRZIHFQc9OuvGgK3FS3UN52DkH3WDVua8Co
         gLBwd5F1L90JQxWDg2cKfwJQhfgbBr93bux6BUXWs3635C7Unzh08QM2Niph13jMHp+P
         s0vdP1EG9+HW1VjRp+KmsW3wzr5oI5FWwCDA6p8O++gHtGsu6ivfrQfMqWPkMPT7Rs1w
         ptLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765348085; x=1765952885;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M70/PMAPDikZYkLzh450XJp+8kYBpa3eFHpFKS4kGyk=;
        b=Mmdo254cPtTtZ7vhNK3//ZrmLQkKYuekoHQjZo9mSLiuqF6X547nMrwsX+rd4e3OCs
         QtnRuKhSW6o0EBZkURcNlJRxpgpbbK3q5TBObpWt/BTA6mbiv030zaRC8eqadIsKaXvW
         OUe2FkbdY8GDt1gxBOYnZNeHdAIXj/yyWZM1dMHarvjC7q8UzWMF+u34jGtu6KCDPiZ8
         lCHZ55zgJkrTn7C90lq92EwqAdPB/Pbuh7hTpqp0o+q5BpwS7GnOtKe6RtFULI3Kcwuh
         zD7k4f1+TwqJ6uWNVcXsvZUnA0ud3ytT1LKOIWmSGmjTjZgUJTcBtOlEV9lWB2NXcBWO
         5VNg==
X-Gm-Message-State: AOJu0YywGAajK0xRmylfyc7tQiD6RYIxjfGGwusCS1PXKqfJb5X0CoJJ
	3pcwGAiO62pi7C0Pdp4jWGdBAf7MoyhVExLpucZNvvOKyXhJ8COXd6vgW9YGrO0rgos44sWhWrh
	O1QgNrJOAKxGulT5oI7brKxoEFBXcSPqWZkFkCGJJqZCUg+WC1kZGfG+roR+S1/FqLw==
X-Gm-Gg: AY/fxX6jVajkCpX7ApFKfin0at0NbH6E5T76eS0+MZZVi/PXiyUDqVzlMlQc6OhpKEg
	fmBxdpY2Yevqqy00a3FEpiHus2ahxbgqwLvtYO4ZrrETyWRcuAJB5eukIvHWn1zwQHchLRwUgKj
	oYipDtOQZ2MOughy/XVTXcqzp14D6Xp8Wr5QvOPpisNC9NtflX0MBzb94D8OKNcfFjI00AhmSW7
	LDvAQqSlnWTFAkxCGOBbiK97PsdyO3M1NbP3lCD/yVwV+jjoO8lZ+owiUekb6WjWVZneAgY5qsU
	88YLoiIdq/9AP+sy8E5Ytl3XNiKZjknA8zdaZzZcUMVn6xAHSBC8OqMpaKCiQOvDHQ0mWg4g0PR
	QdTJYVY/nTjYpIZsMD39Ok+fJcSfZWT1tzqCAeDqD+g==
X-Received: by 2002:a17:90b:2242:b0:349:7f0a:381b with SMTP id 98e67ed59e1d1-34a72808e7dmr1235413a91.8.1765348085091;
        Tue, 09 Dec 2025 22:28:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe/Bs7Ia+whWjlqwD6bL7cFJ8Td3b8EsM2vVNuDtv1UqVGpNTX8+xLJat6OUl92XeoWciW+Q==
X-Received: by 2002:a17:90b:2242:b0:349:7f0a:381b with SMTP id 98e67ed59e1d1-34a72808e7dmr1235390a91.8.1765348084613;
        Tue, 09 Dec 2025 22:28:04 -0800 (PST)
Received: from [10.204.100.70] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a70a2f710sm1358383a91.16.2025.12.09.22.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:28:04 -0800 (PST)
Message-ID: <bb17e217-2291-4cfb-9bfc-da0a23d0f081@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 11:57:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] Enable support for AV1 stateful decoder
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
References: <XWtaMcg7lGClZ4pwr8czLvqGdhEXidF54raCx36v4Rahfsker2E__wKY0i87ff9Os9OAZxAepPTDFO00wvXLlg==@protonmail.internalid>
 <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
 <611c84b8-e982-419c-9d58-284319b226e0@kernel.org>
 <0c7314a6-960a-4ab6-9238-3a1ddeaf6949@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0c7314a6-960a-4ab6-9238-3a1ddeaf6949@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4tgZk9wJmhTLH_GPZi7VWe7cqnLMefMA
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=693912f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=oAPMRZjQHVih-U0x0UEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1NCBTYWx0ZWRfX2f+sxE1cDNxX
 FtctqfLatC8R+kSX7h6Ls5rmehHVj6475TJYqC6lj7OfJQX4bY9o32qJPWuEpKP1k4+/soc0H6C
 YFs90Xo7UNZlRuowjGU/wUeLlrvzouzEGAGFnCFMsr+5elB+53rB7nKBe47j7cxnzT50GQZDFEQ
 wvuaIRFZnzt1tRqjUZYKQAllQd+sjW9gEN2bplUXRWAjN4foLB9SpKrOlr2OG9Df+fwxXhh5nBU
 jcuUWGGeHLeDBLzeL9hdrSBgr6xxJERq8Ttag3dIzPyRobaEB+G+jeW2VPxfYcM8y8JCAFpSqdd
 BnimYiHYiaIkLxj3Rd+8ojDAgSMaYUdwMBf+jlwtVPVbigyLxF6NavHg5E+S33N6YOoZcsVyYDT
 OhOZk3MYLWeqj/0kb3ZSA2vYwlwEYw==
X-Proofpoint-GUID: 4tgZk9wJmhTLH_GPZi7VWe7cqnLMefMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100054



On 12/10/2025 11:53 AM, Vikash Garodia wrote:
> 
> On 12/10/2025 6:11 AM, Bryan O'Donoghue wrote:
>> On 10/12/2025 00:39, Deepa Guthyappa Madivalara wrote:
>>> - Add inst_iris_fmts tp all the platforms in gen2 (Wangao)
>>
>> Is this part tested or just added ?
>>
> 
> This is tested on lemans, monaco, sm8550, kaanapali, sm8250/sc7280 (NA, 
> as AV1d is not supported by hardware).

forgot to add, tested on x1e80100 as well

> 
> Regards,
> Vikash


