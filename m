Return-Path: <linux-media+bounces-36107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A4EAEBB9A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B92A53A790C
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C872E92CF;
	Fri, 27 Jun 2025 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BB//J8rE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E6A2980BF;
	Fri, 27 Jun 2025 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037841; cv=none; b=iEgTge47krZdIhV16tFL2B7o7fwGCxjffLc45++ZoZkgui5DXYxS/KIT1Aekhfbpm+odFtLn6b8UaG1XEQ+DYF8QDYlrCK6rP6mMOruKxNaDFrHDjo68gL2WPIsZd7OOX4MH3v2JsuDNfIDXB86eYFPSElMRdJiOv+WmvYR3QOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037841; c=relaxed/simple;
	bh=r2n+xfXhRDuv9Ov/IgGC0ZxL+GLkwG9OhGnLuQ4oVGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tm0EHRYGNb+d7oEJY+gzvpJbs0ZEt3LeMpt8r7cywOAwb9emvVaRggrTqsZafw+UGdUjj4Faio1jCVSPcV1jks7w2aSfDgSmFt6rMEhROq30CZdTQ1/9cyxWXqJa5i0wxM0C0o5MtkSKtQeou/XAyOqII+vsxhPqXNMS1tmC6Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BB//J8rE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCXZ0A008479;
	Fri, 27 Jun 2025 15:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIf4eKZ/KfCGEFMe3e6zMIWkyKh0104BCi7XwIRIBf4=; b=BB//J8rEa8S8gty8
	p8d/1ukpp0ZewEFWmuwG8Xd223TRhEyzAij46NAMel6Qqlkgk07P+t2JxfrWpwMj
	bEQN6qSmsz4b/rtkpL39hVvni/YWJiIaGtdS2FbJ6VBzKWK5chfn9UWQQpIaWd0u
	rM+YKTnV668CmUqiV09AqfMYZX9VSELjwrSyQieqt6mRNQR1P3rvEEuWolaXw00y
	smXTR9KVRiMNE6YVNbHU8OnzuoBj7yFAMbE/wrZZp37UQPHEELhaaKZfALnIOhdL
	ezbNZ65BdgL10RNJG71Uk/x/8qYCZyHrY/jnOIXuMLyit0Mlh6BawCwp0SSnEDFq
	krJ46Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqwnny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:23:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFNsxA021821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:23:54 GMT
Received: from [10.50.11.187] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 08:23:50 -0700
Message-ID: <a934bb78-587b-6aca-2fb1-38605d3b385a@quicinc.com>
Date: Fri, 27 Jun 2025 20:53:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jorge Ramirez
	<jorge.ramirez@oss.qualcomm.com>
CC: <krzk+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <quic_dikshita@quicinc.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com> <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com> <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
 <bac1e5e4-ed18-4e26-a883-2a41bf8468a8@oss.qualcomm.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <bac1e5e4-ed18-4e26-a883-2a41bf8468a8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SBwKJcpAv6zTN20i9YiDWMQZYLEIjk8p
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685eb78b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=g1O4AA6D8fIF7pZc-Q8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SBwKJcpAv6zTN20i9YiDWMQZYLEIjk8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNSBTYWx0ZWRfXwNB4G/cV9DV/
 yPrTDb8QOA5FMoUK+LbXq9uY5vzVWWDPHdGUP+AI5kUoFhiqWXy8lDXmXO5UpEWJpc+iEmexjGo
 3VCqfkOHbDH3MffMBgVDCJkawfdPmFkvHx1bErcZo1w7lYSABt9PLG4CEb1bM/qExLGIGj8Coqn
 Q9krRr7ve48BEYPHk5hkodFJfXyVnubtncOQ45KPpqH1mMza3lvXkT5C+zFcUH7Vqs9zon/aEQD
 4A+Dzevje9mb+sIa5wszmEx2+RI8J9VR6p2HNTn08tVHK+ayhZXqSWmkNOqarGibbZ4xNxoAzUm
 6zt+EDkBB1LeUJ4uJaiVFU5L8fFWqLa2b/COy64wBHNL8jDNsQGy5I8AZUr74O0I6o3mHYw+5mD
 XVcLglI7Y8ZybH1CpyKTouqky6JoMgBy7K+4k+O8NFFB2MrjP6MHq0PK8zsuMYfu0EmEVNKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270125


On 6/27/2025 8:50 PM, Konrad Dybcio wrote:
> On 6/27/25 5:12 PM, Vikash Garodia wrote:
>>
>> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
>>> On 27/06/25 20:28:29, Vikash Garodia wrote:
>>>>
>>>> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
>>>>> On 27/06/25 17:40:19, Vikash Garodia wrote:
>>>>>>
>>>>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>>>>>> Add DT entries for the qcm2290 venus encoder/decoder.
>>>>>>>
>>>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
>>>>>>>  1 file changed, 57 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
>>>>>>>  			#iommu-cells = <2>;
>>>>>>>  		};
>>>>>>>  
>>>>>>> +		venus: video-codec@5a00000 {
>>>>>>> +			compatible = "qcom,qcm2290-venus";
>>>>>>> +			reg = <0 0x5a00000 0 0xf0000>;
>>>>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>> +
>>>>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
>>>>>>> +					<&gcc GCC_VCODEC0_GDSC>,
>>>>>>> +					<&rpmpd QCM2290_VDDCX>;
>>>>>>> +			power-domain-names = "venus",
>>>>>>> +					     "vcodec0",
>>>>>>> +					     "cx";
>>>>>>> +			operating-points-v2 = <&venus_opp_table>;
>>>>>>> +
>>>>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
>>>>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
>>>>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
>>>>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
>>>>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
>>>>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
>>>>>>> +			clock-names = "core",
>>>>>>> +				      "iface",
>>>>>>> +				      "bus",
>>>>>>> +				      "throttle",
>>>>>>> +				      "vcodec0_core",
>>>>>>> +				      "vcodec0_bus";
>>>>>>> +
>>>>>>> +			memory-region = <&pil_video_mem>;
>>>>>>> +			iommus = <&apps_smmu 0x860 0x0>,
>>>>>>> +				 <&apps_smmu 0x880 0x0>,
>>>>>>> +				 <&apps_smmu 0x861 0x04>,
>>>>>>> +				 <&apps_smmu 0x863 0x0>,
>>>>>>> +				 <&apps_smmu 0x804 0xe0>;
>>>>>> keep only the non secure ones.
>>>>>
>>>>> ok
>>>>>
>>>>>>> +
>>>>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>>>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>>>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
>>>>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
>>>>>>> +			interconnect-names = "video-mem",
>>>>>>> +					     "cpu-cfg";
>>>>>>> +
>>>>>>> +			status = "okay";
>>>>>>> +
>>>>>>> +			venus_opp_table: opp-table {
>>>>>>> +				compatible = "operating-points-v2";
>>>>>>> +
>>>>>>> +				opp-133000000 {
>>>>>>> +					opp-hz = /bits/ 64 <133000000>;
>>>>>>> +					required-opps = <&rpmpd_opp_low_svs>;
>>>>>>> +				};
>>>>>> Fix the corner freq value
>>>>>
>>>>> can you add some reference please?
>>>>>
>>>>> I took this data from an internal document - not sure why the downstream
>>>>> driver supports different values or where those were taken from (AFAIK
>>>>> they are not supported)
>>>> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
>>>
>>> I took them from actual documents (which might or might not be obsolete,
>>> hard to say but they were the latest version and as such, they
>>> contradict the downstream dtsi).
>>>
>>> So I'd rather not use downstream - could you point me to the reference
>>> you used please - I wonder if the fix is required downstream instead of here?
>>
>> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
>> is the src for different venus clocks.
> 
> This is not a good source in general, GCC often has more rates defined
> than the consumer is supposed to finally run at (because they were deemed
> power-inefficient or similar, you can pretty much set any rate you want
> on the clocks fwiw)
Count wise, i agree. Value-wise, afaik, corners should match OR are you saying
client scaling request for 133.0 MHz is ok when src is generating 133.33 MHz ?

> 
> Konrad

