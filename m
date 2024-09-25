Return-Path: <linux-media+bounces-18553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8E98647A
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 18:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB8F4B30974
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 15:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF979482EB;
	Wed, 25 Sep 2024 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TwhdQubu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0BE3B796;
	Wed, 25 Sep 2024 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727277225; cv=none; b=XcwPmv9k2rfFBzsGtmafqMtZESF+qr0EE970OWOPa0wGItfSvI5r3MifsGCQi8lPyn1Yjop/G1urlz4guSnHMfBwzklD1FUfkEcrBmhU92Hb9hN2UKtS9fncpt/lbAdy+O5QlKHlQ5HND4302ERKrI0oQPMBOiQbSbTqoDlW0Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727277225; c=relaxed/simple;
	bh=uxbcjAmptvie1W4Mx7yaaLpA7Q3f3F8RvWBLg04aUdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HNNhBPnpW4hWs2hWSfrCOAOmiYLLQpdOffWBOlP6yGK6LChQKYKsX+9Bo9ktKNwChinTsV/yenmhackhIyiQxubnByeucVtc73f87z7ge1iHONE1KKl7ebEt2CvRuCOJnmt8T6NtQKcB0Dw71V9kP9zBIZ8khEOJicXPKWNcOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TwhdQubu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P86pN2018535;
	Wed, 25 Sep 2024 15:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8B3AA1Oy4YgLejJwIJ71AljxWMCbFNvodY0+wutPHM=; b=TwhdQubuZXSGyHXl
	nIlMJtzZjMsmG83okX99sQrqkFl4jbWjpcnfRDxmudZgwWhTi/ZHpJ5BS/SRMMMk
	9VrKYduskpPaVW36NnAAvPk8hoPaOoLl3UTqDY49EZoQwGxpoL+lkX3pnG/GYDJQ
	Yo0Mn7mwyX5uzUIBbdgvlWALdeUGrtK2kUy9stOrnN6AlqmQasgd5mLF3bCBpmOk
	ehFT9Tfn7Xk+4FQKibnihsBpKWSNcpXm2FoMPqQiH3yXOrjmlV0F7+a5mArQO+/J
	no2Utl39PFOcAB/SL6VklxeznZfnLoqXJ6fwfRNiTveo5Pjw1+VFzAOp8ErYXzg8
	JtyYWg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakm8eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 15:13:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PFDPMh025682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 15:13:25 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 08:13:19 -0700
Message-ID: <ed012367-1bfd-4eef-931b-37e1ac839176@quicinc.com>
Date: Wed, 25 Sep 2024 23:13:17 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <9ed92660-5f42-4a1a-9261-b8800133972a@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <9ed92660-5f42-4a1a-9261-b8800133972a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ixBl7qkO5m5ncWrhF8ZbMhffXrEYOHnL
X-Proofpoint-GUID: ixBl7qkO5m5ncWrhF8ZbMhffXrEYOHnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250108

Hi Vladimir,

On 9/6/2024 11:56 PM, Vladimir Zapolskiy wrote:

>> +            compatible = "qcom,sm8550-camss";
>> +
>> +            reg = <0 0x0acb7000 0 0xd00>,
>> +                  <0 0x0acb9000 0 0xd00>,
>> +                  <0 0x0acbb000 0 0xd00>,
>> +                  <0 0x0acca000 0 0xa00>,
>> +                  <0 0x0acce000 0 0xa00>,
>> +                  <0 0x0acb6000 0 0x1000>,
>> +                  <0 0x0ace4000 0 0x2000>,
>> +                  <0 0x0ace6000 0 0x2000>,
>> +                  <0 0x0ace8000 0 0x2000>,
>> +                  <0 0x0acea000 0 0x2000>,
>> +                  <0 0x0acec000 0 0x2000>,
>> +                  <0 0x0acee000 0 0x2000>,
>> +                  <0 0x0acf0000 0 0x2000>,
>> +                  <0 0x0acf2000 0 0x2000>,
>> +                  <0 0x0ac62000 0 0xf000>,
>> +                  <0 0x0ac71000 0 0xf000>,
>> +                  <0 0x0ac80000 0 0xf000>,
>> +                  <0 0x0accb000 0 0x2800>,
>> +                  <0 0x0accf000 0 0x2800>;
> 
> Please sort the list above in numerical order, this will change positions
> of "vfe_lite0", "vfe_lite1" etc.
> 
> Another note, since it's not possible to map less than a page, so I believe
> it might make sense to align all sizes to 0x1000.
> 

Sure, I previously sorted by the alphabetical order of reg_name.
I will update it based on your suggestion. And will also make sure the 
align all sizes to 0x1000.


>> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
>> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>;
> 
> Could you please put the &gcc provided clock as the first one in the list?
> 

Sure, will do.

>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc 
>> SLAVE_CAMERA_CFG 0>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt 
>> SLAVE_EBI1 0>,
>> +                            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt 
>> SLAVE_EBI1 0>,
>> +                            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt 
>> SLAVE_EBI1 0>;
>> +            interconnect-names = "ahb",
>> +                                 "hf_0_mnoc",
>> +                                 "icp_mnoc",
>> +                                 "sf_0_mnoc";
> 
> Just a note for myself, interconnect names lost "cam_" prefix, and it 
> should
> be fine.

Krzysztof posted a comment in a SC7280 camss change and asked to remove 
the "cam_" prefix.


https://lore.kernel.org/all/087e7f29-1fa8-4bc2-bb3d-acb941432381@kernel.org/


>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
> 
> In case of a single child node #address-cells/#size-cells could be omitted,
> if I'm not mistaken about it...
> 

I tried it, but dt_binding_check report below warning.

Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dts:221.29-39: 
Warning (reg_format): 
/example-0/soc/camss@ace4000/ports/port@0/endpoint@0:reg: property has 
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: 
Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: 
Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: 
Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: 
Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: 
Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dts:220.48-225.27: 
Warning (avoid_default_addr_size): 
/example-0/soc/camss@ace4000/ports/port@0/endpoint@0: Relying on default 
#address-cells value
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dts:220.48-225.27: 
Warning (avoid_default_addr_size): 
/example-0/soc/camss@ace4000/ports/port@0/endpoint@0: Relying on default 
#size-cells value
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: 
Warning (unique_unit_address_if_enabled): Failed prerequisite 
'avoid_default_addr_size'
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dts:220.48-225.27: 
Warning (graph_endpoint): 
/example-0/soc/camss@ace4000/ports/port@0/endpoint@0: graph node 
'#address-cells' is -1, must be 1
Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dts:220.48-225.27: 
Warning (graph_endpoint): 
/example-0/soc/camss@ace4000/ports/port@0/endpoint@0: graph node 
'#size-cells' is -1, must be 0

>> +                port@0 {
>> +                    reg = <0>;
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
> 
> Same as above.
> 

Same warning..

>> +
>> +                    csiphy_ep0: endpoint@0 {
>> +                        reg = <0>;
>> +                        clock-lanes = <7>;
>> +                        data-lanes = <0 1>;
>> +                        remote-endpoint = <&sensor_ep>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
> 

---
Thanks,
Depeng

