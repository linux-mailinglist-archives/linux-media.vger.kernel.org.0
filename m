Return-Path: <linux-media+bounces-51990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LhfCJN5gGne8gIAu9opvQ
	(envelope-from <linux-media+bounces-51990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:16:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C5CAB91
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2F0E3016881
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E761A356A05;
	Mon,  2 Feb 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aotjcpyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBQsV3oT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E017C3563FE
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027182; cv=none; b=HNi+/Pz8r25ENsDIuiwG/WzZ7vCCSfQ3vDVoUwcHfTe+yyp6Y8TCgzp+MMuc053jkLACsSlIQ39l8PKfBEumLRUUYxto2XMQ7kKog1oF8ujdeBwgYuIPPlg43PA9KUBVmVAfpoBSvB/E4q7BXuQ+H4x3AkODaWmzTda38Npykxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027182; c=relaxed/simple;
	bh=1jmLK14LqxG8z+7yjYgdbBHNfz60JYyrT36cz58Vb6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zjln//KTsUM1pMfuWY0a+4+/LQLCg/4DGb6XH3LngUvkqQBhd61TZajlCTu7GmhhPLft9/VYPqHWJ2AxAezFHhmBWgNrB/I3PaOsGx2RUS4u5T2J2S+gK8W6tu0q20dI3bHCJcgb1Aw1azIEqmjEdyDRoHQWycrk82VPFd2aMYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aotjcpyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBQsV3oT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127KANt2028246
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=; b=aotjcpyM4a8MpgJ+
	cycnt1eKnB+tpLvrWvhhqGTOK2grvTyzbagbBbmBfvStkuvNviWy9O07DrjoPfNn
	lKGxVEE0uJvJXTAZxTdqHL4cvKsX6UpHclbmD4MSEDVTG9Aqg8GUmBsaqIx5z5fT
	pX0wxcMstjQXRnePOtLX0rVHPrXL1ptKY1z7geyELgRelpjcz9pPDMlLl7ZIElCk
	7TcFafuRpVw2Ckp+xPqjLpILYAnI9XXbOJwyR79G8RoYOoVkJLtUALTBLsqIPA1e
	fbu4jVTD5caGJayRSPCYY+hqr7f2U7V/rYqdYhAr/UO+gpJA+5VcbA3UxVCMFue4
	b+iJ6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdd0d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:13:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5015175bbb0so145887541cf.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027179; x=1770631979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=;
        b=KBQsV3oTSi6xU0o3O5q1TXbWnCyhwh86wFYINz4tPEIHBL9J8QvsM2Zlnfa+wq7ukV
         4hmSmFwkoUzcoVuvsny0psZdSvCfy1mvKh1elewMgLrvPchszIBQqq8N14MWs7+MRDaP
         j0HpliMAHq5s2jf2VRGEGncVAMFNQdQuQeVftb+cBQbvzPNw31Np2rNVoMKZOFGUdIL9
         iZt02kxfKXPMhCAHBGJkMEvHaYbAS3rfbXgjTBKIeP1tCXFBITT4HdOozf/PUaMUtWE/
         7+R2EXfjr2C8pyJK2OtfYm2Lzxnqh0aBdgkFjWHkona/tu5coAxzj+h1fwZUZkvQo54J
         huRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027179; x=1770631979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=;
        b=NX/rsCuWW0qTSt1ToAahZuYe/177Uj2TAxXiF+nLQzONWzb5mdalb6PIMXMLInKS7w
         gPTikckfoQQuPoIdyTeSNrps+ss6aZmRyoQf3t+rcOwTVDnE0ePPMwRVAqgDdZgv3tF/
         UqJ7ODmG9THC3YhnNOOOS75BLG6j4K7pV3/YL2FrmW7YAAMea2YLO6CS07sCTqxev3m3
         PtHK1D3kxHK8PnDltxwh5EUfbVXSioFjkrCcwXq3eJY4tPDh4/uUIibj28vPeHC+94MF
         U6nC/BiZ0bnXaav0Pp1TrpAk6WpZAOwuLYBPRfQZTv30dBa6JM4ivHfNvwxHwMCJIE1j
         7kng==
X-Forwarded-Encrypted: i=1; AJvYcCUs+2WUVHKYu//OsKQIseNB5wr6Ks9z42GJMySHes1jpYDWs8jW0cxDTSqvZMvqXDU7T8Rcp7TpW/gjCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQj+q3HupTvYcfMgaZC+vkvziOhbO6hewlwqxffqDIcFULvu5
	a4OYP1ekuKx4sGWzgQmXcI+Yf7aH5XL2m6JzelIsOVMGuz0H01Tg65E0YIsmFeS91nFw7ElxMlz
	eFA+z3qk0+w7tQdsRnOPQjP8aMjsqCO/xrxl1DRCjUTfbQYoOh5W7UHQbJpap6aLp3w==
X-Gm-Gg: AZuq6aItL7NUo3fZaNQBk3QjgHzouf7kx9ogC1A1G8Y94ZS+2mmzPbNko4FN03CvOJT
	pWVGafIbT5ViHI6VWMyDE/8/R/WL+As65IaL4GmlSkBgi8kD71/lNVrZQAEKOE4Cq2700/byWMT
	ir2nXkToMxawlpTN5Hke7trk69WsH7bAnobGbAzoLECag4iZkWeq2aoxx9QfL9M/iJaBJDHoCTn
	QdEZNC4W1eS2PgWRJVBcxAPT1b3uFxWcpd1GF+Uao0REe4uAXuIuI8A2YDrq6/+dCYlUmYScJWG
	7snFavO3zD/xVnjbeHn2GyO2JBwISVETFo0p8s3HrTJ9NM0VaPEGWLViYXV+6/VWG2ZuO0OV3oP
	Vc1wDo9W++VFGaSCRWfCCx2fndC+kCgETT+k0fSDM2Slv0DpzQGpC2Ykdbygb0o7tdrmB18TTAK
	K5VLe4pDbA0VeqVxgcvboQRE4zxE1DADkp1h18IBeZQW6+obHusr/TBUzFuaPOedQ=
X-Received: by 2002:a05:620a:9489:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8c73ff0d649mr1145393985a.15.1770027179096;
        Mon, 02 Feb 2026 02:12:59 -0800 (PST)
X-Received: by 2002:a05:620a:9489:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8c73ff0d649mr1145390285a.15.1770027178630;
        Mon, 02 Feb 2026 02:12:58 -0800 (PST)
Received: from ?IPV6:2001:14bb:15b:d5bd:79ce:863:9a22:aae2? (2001-14bb-15b-d5bd-79ce-863-9a22-aae2.rev.dnainternet.fi. [2001:14bb:15b:d5bd:79ce:863:9a22:aae2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c44cbcsm29528431fa.7.2026.02.02.02.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:12:57 -0800 (PST)
Message-ID: <ace931f9-822b-4756-8c23-f69963ffac02@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:12:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: iris: scale MMCX power domain on SM8250
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
 <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b-kfeRehOlwoTh5BfVcl4nGHWorZj6Dy
X-Proofpoint-ORIG-GUID: b-kfeRehOlwoTh5BfVcl4nGHWorZj6Dy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXzxoSqGmgijoe
 LiF7dVbbKUL30BGNoiMe8/32lzORr/vA0JaeU6KTRKWwFhN3V69V8JYCOHiMooTG+0Nak0pASxF
 7ir5yPCUVemLmke+qc8OltJDPWzt+54t1IkzPhx2TTF4C2zuZLn3vmXMUKZyhapOLkhfT1tM67X
 MjRJcT17hzpG5WZoAEIWkkq6wW+Fg+n7dOqcsWUdGeGigaGit1b/MSCxF2J9yzDz3aSIXFLse53
 W5NLu8Htz3oEoJOymEEWsaUDyHL5CzPeQZBuufTpts6Kjhy6mIH6PrBpy47XYD7un/JbQ4DD96C
 4QeVEx6eeh1FytFp5m+xPPJ3GB8UJc0jo0gMeH74kQfdFtTBzCSQn9gcErBkBhTwInN1ROakRTn
 SxQmFsVYXsngcBGLo4ELDnW6Wtv3ZKvJLZ3dVVYtMdZ+G88gAY4lcLDq04eymvkWwdfXkTwspTa
 utUWOy/9rNKXxAEN2gg==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=698078ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dCPk7noOixveXNiBySQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51990-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C10C5CAB91
X-Rspamd-Action: no action

On 02/02/2026 12:07, Konrad Dybcio wrote:
> On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>> the PLL it powered on by the MX domain. Extend the driver to support
>> scaling both power domains, while keeping compatibitility with the
>> existing DTs, which define only the MX domain.
>>
>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>   drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> index df8e6bf9430e..aa71f7f53ee3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>   
>>   static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>   
>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>   
>>   static const struct platform_clk_data sm8250_clk_table[] = {
>>   	{IRIS_AXI_CLK,  "iface"        },
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 7b612ad37e4f..74ec81e3d622 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>   		return ret;
>>   
>>   	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>> +	/* backwards compatibility for incomplete ABI SM8250 */
>> +	if (ret == -ENODEV &&
>> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>> +		iris_opp_pd_data.num_pd_names--;
> 
> You're decrementing 1 to 0 @ this point in the series

Why?

  .opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),

  .num_pd_names = core->iris_platform_data->opp_pd_tbl_size,

So here the nom_pd_names is decremented from 2 to 1



> 
> Konrad


-- 
With best wishes
Dmitry

