Return-Path: <linux-media+bounces-31457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D1DAA4B6A
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54AAD4E15D6
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF16C25A645;
	Wed, 30 Apr 2025 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0iMH8AR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C72512D9
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016791; cv=none; b=gBPIG6tVT7V52WeIh7nGOWXXX8c/SNZFJDrHHBUoriCDQB9fJqch7BFkJh8nIbebmYC+M5bNsxjrgVx48PJjRxFT3gKbsRKHcdBM3O92ziblkk5GGOFXybCy7PSjPI4HLNph343NXKRgzjo/Cd283QbjW+Dgbfe8SxbFtv0gyqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016791; c=relaxed/simple;
	bh=EPNKpKk8JZWaARHFAYyvjGyRCL3qGuhrQzvghiPj5/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ia1s41a3ep6e8S2wuEg6L8bVkSgRk42DYlps5BXH4mA9VTzUYczVxi98viNa9xLyHzBXhkRawORZ35hUx1+da0ysRY+pIxjWyQOjavSF6Mn7K1hqbIdyfBfjnjFmKbe/S6zJsRTyYMnzcvMdtq2k9H0elFMm/cL46bgMYlu9DLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0iMH8AR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9LnfU032422
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 12:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFs068+EJ0khJe1SOIZavrVMIyHZZWaL3/ptb8Omy90=; b=P0iMH8ARfBEGM2/N
	xQIsqOy1yqATbwMeMf8+4UsH6jqJOqYYmyiiO+qz/Fe7mpnv93aA6e+IgaRNuYtV
	9cAoOTlGL8eUqOpCGEfQ2dlf8+ObYzBSWfklyJZPLbSaCivSPnVIxKsoPsuvkqdC
	c83Py2UKCVzvnBAfoNLq1GKYFPB+FmlHMAw8S1hkP0KGXKjMMm8waqKZsrF6Mrqm
	ZpopmUFzazgswNPDrL7C+AQ22NIFNgROkwj/RH30AEypefJi8Kpd+Ng9bXhjXnbR
	x6e1iQJS61MKfcqkOgGHSGXTNR30d14JtT+PUPpEArMimXLsajQJLJLmIFPbhTAi
	DKO4mg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2a5wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 12:39:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c8929757so17199256d6.3
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 05:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016787; x=1746621587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFs068+EJ0khJe1SOIZavrVMIyHZZWaL3/ptb8Omy90=;
        b=twmyTbtfU++w9811XOkyN9RCtiQ8s+rdr/rLRKxcZuOcAA04E31y5+/mwgW3VmeKla
         xzCvZ55XIrs5uQYmC+k4f6RBWtpT93gpu8T3xBLEjE0fpLJiPe9TA5KoJfnDG1tK/OyB
         tBpKNpspFx3BzrtlgeqzJEORsbmgHOxmGiYbQS4VF5vMLPDtA6AIQyFN3fZCp/VgRrrb
         3d+wh/SQcf+4mHlQ0mL+0HXez3riitd5bxzKNrpxq1nKW1i9xWmiquQUCti8Irx1MCXa
         WfcW2aKqbHuE4KFGLQMToqJfHY3RTac8gWur73f2rpDe/3pnrT9o9tozoJOxX76auFmv
         i1Hw==
X-Gm-Message-State: AOJu0YwCgHVOJkfSlxd7Elf+CMQ5j7Hhf2dDSEQ3lcMf5f/CMHUcYeaE
	+tU3tEXejMkJ3i7JxT8ekI2FRLj5fxKQGifU30FHyfuedXe3YMf0nbbvkHQw+5P7MGL9Kh+oNJ3
	H8omzBGLuy8XIHW6UIaa0s43nn84ph8ZJYMqCPlmQf++SG6wgs8Mm4UL8jgAskA==
X-Gm-Gg: ASbGncu2JQNnrN6fOKe9dDME9Aht3FwAQssEmWsJ1z/r4dOabZkPLGGPgZy01WVY/Mg
	Cf8mxnGMbEUGy6M4oD7wvWl+LOrgomIcLyvA4pITNQE8AmMrCBZU5f0AGn2yk9dnopXbqAWxHYJ
	kXf7zMqFhkXkKtd7PHDus0JVmDc899trnhODIRqY0VnUQt4g3R0Y8/kOQt4ZXkCu8/zH735oVKb
	09gPf77+O6pkWDlWDqV+stEK10/xXkiruuCLebdAZ5mcGVr6GUfAbtFkzwa0xkhikL20FZQSQya
	1jccnZhzR7apQcC5eJHkFmnWeajNa2wf2NXtNGfUhuKaGTo6r7bhDnMOlerUTFM3weQ=
X-Received: by 2002:a05:620a:2544:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7cac87ed1c4mr109529785a.10.1746016786823;
        Wed, 30 Apr 2025 05:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzy9QmlF3UAfzA9JatwWwapnmKlyl6GIQvIPJ3qNu0J5MVk7h7Gpa4KEY9LvySiGhpANkstg==
X-Received: by 2002:a05:620a:2544:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7cac87ed1c4mr109528085a.10.1746016786250;
        Wed, 30 Apr 2025 05:39:46 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f8814sm935494466b.69.2025.04.30.05.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:39:45 -0700 (PDT)
Message-ID: <5086f0d3-d097-4668-b195-5ee00e84aad5@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:39:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: qcs8300: add video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
 <20250430-qcs8300_iris-v6-4-a2fa43688722@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250430-qcs8300_iris-v6-4-a2fa43688722@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kbMh2pJwEsLlcySsR4lVBHrW7l1vUXDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5MCBTYWx0ZWRfX42Z+VQk8o8iV rLtkDVavb8knRT5v8jGOZ64sxlWOJ+611odQBETpJXagcCoFlDWLemQJFkxWC3cOgMQgbpfkh+k CsCDtbQrXC4mHkVn+TJb541gCPrQBXK1wxENelcQ2dCA5/tMEQCWzV3xSI8AoAN3P9X09H4TMbq
 4GzmyS7GBmn5GLCb0ySY+uN3Vt/8HBFaYC5AahvtT7YjW7csWZqNYJ93hLOdCtTJguChHvPBJQC swYwrahoNUh0fPKWvXuRn1TeLbiqy/dBqVKmbOK5vxlsQYrAdkbUDpszorAkOYhh6Kh2+0lb5q/ tANIDwPBjhd+CAypksnJ94k2YL9M1enLFN+IjDUFlTZShgvxOMRutVmkKfYfdFo+b+aeisu4n2W
 tonU8gQQp4BjL17FiQ262XjfOICLdyhLpMDIC/pCnbg46g7tvObAFpTp3wW/aCoplxA2J+a1
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=68121a13 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=aRA5hjehiSxC-sjywyUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kbMh2pJwEsLlcySsR4lVBHrW7l1vUXDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=792 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300090

On 4/30/25 2:17 PM, Vikash Garodia wrote:
> Add the IRIS video-codec node on QCS8300 platform to support video
> functionality.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---

[...]

> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {

533.00 for this one, 533+1/3 for CVP, it seems

Konrad

