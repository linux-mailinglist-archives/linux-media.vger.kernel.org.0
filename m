Return-Path: <linux-media+bounces-51002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF5D39CE6
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 04:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57B5A300EE7F
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 03:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658C4274B55;
	Mon, 19 Jan 2026 03:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WV6UOlup";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtbJ7VnS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93B26A1A4
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 03:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793386; cv=none; b=ObAKR7McGgXpHQAS4WGuKuB7TTEQMVCpKNq7GCN4QpFBMnrQFfuw5YCPhVTFvrljE5ihkBIULSzi7nMYUwhpq0+NRkFx/Qq+CjMJqQldubXwHstImVLeMW8Z/ryJfLQXh6fqGSpk/5cLR2DpDT2qF1TJgiYYQlU//dbR7xNMEzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793386; c=relaxed/simple;
	bh=XKokGV6nJBeV8Ykvrref9NB0aDhf6y/i+zKihICRNu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7WYGL40Qmzq1dvBx0koTI3aqzw4dKoD8N1Tj2Q9O2WG8EwkXIOS9Xq1ck0m3tFj6jocYFA3LQvGQKMKFTAnB/3V/5nPIAiP//V0lMhkeuMiHYb2afbNM1i3iHkp7Usc5p5fh4vI0UJ15RlEkRV02v7P6wbFRJKd19fdBP5pmIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WV6UOlup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtbJ7VnS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILPXRD095176
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 03:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IedOsx2UwBWPqokFudsvttOoQ3/XzPZmQL+wVeyzb38=; b=WV6UOlupRrzIsXIu
	cpBG2i6rhc+ZnfU7tDntt2JSa6ix3lmmdjZmZa7S6bzNeYjB0e3JjAmnxLBpszQX
	BLvjfOvEsHTqLq/2wAgK5n+wJBI8VHZuotZF4OZRxoehgKxdt7KxNJC2Urpnh0uq
	4vNC+nNXTQjLcMJWEYaY6DAVEzhCcSPW/nbmeitUIl/ZcT0xesAHXFG7fVO2EWaQ
	2xBOvo2LNtS7HAgKz0BE0Mm9A8xNcSpBWb04JjjcFIMFMGPWbXiPLC8cHFtcgwlT
	opfjY5EhqETVltMo09lyb7iUXgK+6hyeP71lPUIG6MmT61UoSuVdzKzvqQ2me42E
	VoAkbg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dbfcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 03:29:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-890587d4e87so114198106d6.0
        for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 19:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768793383; x=1769398183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IedOsx2UwBWPqokFudsvttOoQ3/XzPZmQL+wVeyzb38=;
        b=AtbJ7VnSEzrOf/AUtPCvJrP5xfumz7bZaXz3FHYe8OhvA5yNgu+IL+q4OrLSkjpdux
         GhC/w5Ap0l48w/PtW/myDts8C3G2yXgYNs7aoVXUt6nrcMW9YLk536Dko8wTh4/iT2VS
         KMyetjDYmKOulkHLu+JECtguH9aNE2TZ1HIVNRL6bVS0uRevnnhhSL4ah9lyu8nzvmZ0
         cauK2/HEI1Vb+BAhlmbSmcMf1hkXXpp0yg6AzQGQr6Z/rCJC3NlfeHV5mm9JXO8u8UeM
         RzoNIF7aQt+YNc8HZLxOAmZWBsNK5lVYmtISiirR7TBp5qCTmVmuRTGrsscpLr4yLfde
         UCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793383; x=1769398183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IedOsx2UwBWPqokFudsvttOoQ3/XzPZmQL+wVeyzb38=;
        b=QBak6rvszTz/38xZ4wRu4fUbuGRcVsaPJCPSGJNrQ81Aiq4dj3s/OSY5OWYThFENJx
         PQerGgom4R0IAKzfVXhrLe3rvbDy+EYOAzU+PJxyObbfPmGBy2xSgdeNs9VVuduzseaV
         gtZm3Y4N36bMiXtKKGWr+3ONmsN7NI+jeIyU6w2ub4OkyPMsTKifU2DL+LTGPXBzn44Y
         wq1yZuo6B/o2KFouWt5vDvxD27JevRK2+5TUZR6KEkXNBiZzjIdvP5g5FdEmsB/LeJPC
         +o8E5apWD1kY4cjuE4/VOaK4kiItzOMUYkaigXF2fxFd7XNqJHJf9wwfwdjptJRKKPRS
         3big==
X-Forwarded-Encrypted: i=1; AJvYcCX537C7UaKYKHwlZ+yDvC/FvRa1m6sNt82rPmn1dmMYlnlfnsAtAycgMYMHYLXeWZZxVpNK2jOdkGo3MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFWYm3uKhX7pGK2MZ2/qAoxUP2CrpBV7IQ/hFwcnGHxGNw/eB
	w+e/HHgpKNdf1SsT0f+76m5JnZdUJJl969E1QpUSLDXV6EYI2V/tlOUaCM4d1tnQ5/sVDgCNgiE
	8ia/sdg56K5PHN0WhDluMmNYrffAk92aZClf3xwfRe+PvGN2k2O52HRJ3RQnaFW5M9w==
X-Gm-Gg: AY/fxX6SjFoaKE3qPnglTV0TTBA1P58zYDOW310S+XlNqGw0MdRcTqxfUTq8SVIju9t
	uKhDIud90pUKEHObeOd4MCmx00C3c6lwNSO4uDW6fQdvIHKvgU50aK4nguYvD6ors6a6iwj2561
	KhQqnuU4T0R0sjAaD4O89/5d6pLJ/fZC14MRO+L3CUHGVoc55OLlXua7PomW223S55fCRpClB4e
	dQ0Pi/FK/9FwaquRlQYF8CIWyDX339pj5Y9sjfy9tfiUnv/PPlGU3g7jcNc1dIzJAFAWlzMNaKx
	5kp0GFD7WyUbOjIxVlL9v99Gjw9BGGyfH9eANieQTs8BTFFyPO1sjkTOF0K2CtpUgZTHp1leoQZ
	z0rPz6mD+Fv4ufxpXtN8mKlcOemw0HJpOa9vzm5MQMu6lznd6sMXVqL9NUfUXe0dmlCtVBMea
X-Received: by 2002:a05:6214:3018:b0:77b:2925:a85b with SMTP id 6a1803df08f44-8942dd87f14mr144860826d6.44.1768793382657;
        Sun, 18 Jan 2026 19:29:42 -0800 (PST)
X-Received: by 2002:a05:6214:3018:b0:77b:2925:a85b with SMTP id 6a1803df08f44-8942dd87f14mr144860586d6.44.1768793382075;
        Sun, 18 Jan 2026 19:29:42 -0800 (PST)
Received: from [10.38.246.226] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ad0eesm72002416d6.32.2026.01.18.19.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 19:29:41 -0800 (PST)
Message-ID: <0353c460-dc47-4171-a434-d52b58b50859@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:29:34 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-3-fa2cb186a018@oss.qualcomm.com>
 <fb402d00-ee2a-4437-af09-200ef7203420@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <fb402d00-ee2a-4437-af09-200ef7203420@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAyNiBTYWx0ZWRfXyWKv6WYu95Yp
 g9QSbVx1ugEoAIjCpSWIRSLDyIy8WWiMsGRGNlcjENaDOcMbseexiRHAH/ty3K35vlcjs8t14S7
 zGZTQ/NcmVIbHThta9AUXqxACd92A1+CzQS19DHAdye66/BhPUehnfAmLh5ZeZWHckZT1L9CXXO
 icIr0M0Bc2tEO/6xuVOPppu+EXe+7e0vptoMczis0q7vveTza/usd5dROp3CLayxSALSJj53PLV
 wi8kKpByAgvL8CNIzq3QPNmogoc7QGs5eY5taFI8g5ANppuWbf5DUS9fi0k9mlJlMaIAjMI+Iit
 UbqFT8guNBAqABdWTEpbBAZ5LxZo8gTfREj5HilEt2PFlJ0TcdQId2SZbSyjEeHaJBIl+uYveZr
 D9r10oUtaLvIjU+CKTmcyR3VQ8Gfhg5YqpbYHvMOMdNcDIrOrqfQjQ2PATOedkG+tSi2w0upq4q
 pNDoyMB7IhwugDyCBaA==
X-Proofpoint-GUID: -IJsKydYq6HpvsnH9IjxcJ7Uoj9vEhxU
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696da528 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9V-N8hGnjtQyMxvEodkA:9
 a=ux8SKSwu-4WW2TTj:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -IJsKydYq6HpvsnH9IjxcJ7Uoj9vEhxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190026


Hi Vijay,

On 1/17/2026 3:32 AM, Vijay Kumar Tumati wrote:
> Hi Wenmeng,
> 
> On 1/13/2026 1:03 AM, Wenmeng Liu wrote:
>> Add support for TPG found on LeMans, Monaco, Hamoa.
>>
>> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  14 ++
>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 ++
>>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 +++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/camss/camss.c          | 128 ++++++++++
>>   5 files changed, 414 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>> media/platform/qcom/camss/Makefile
>> index 
>> d355e67c25700ac061b878543c32ed8defc03ad0..e8996dacf1771d13ec1936c9bebc0e71566898ef 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -28,5 +28,6 @@ qcom-camss-objs += \
>>           camss-video.o \
>>           camss-format.o \
>>           camss-tpg.o \
>> +        camss-tpg-gen1.o \
>>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-680.c
>> index 
>> 3ad3a174bcfb8c0d319930d0010df92308cb5ae4..a5da35cae2eb9acf642795c0a91db58d845f211c 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> @@ -103,6 +103,8 @@
>>   #define        CSI2_RX_CFG0_PHY_NUM_SEL            20
>>   #define        CSI2_RX_CFG0_PHY_SEL_BASE_IDX            1
>>   #define        CSI2_RX_CFG0_PHY_TYPE_SEL            24
>> +#define        CSI2_RX_CFG0_TPG_NUM_EN                BIT(27)
>> +#define        CSI2_RX_CFG0_TPG_NUM_SEL            GENMASK(29, 28)
>>   #define CSID_CSI2_RX_CFG1                    0x204
>>   #define        CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN        BIT(0)
>> @@ -185,11 +187,23 @@ static void __csid_configure_rx(struct 
>> csid_device *csid,
>>                   struct csid_phy_config *phy, int vc)
>>   {
>>       u32 val;
>> +    struct camss *camss;
>> +    struct tpg_device *tpg;
>> +    camss = csid->camss;
>>       val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>       val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>>       val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
>> CSI2_RX_CFG0_PHY_NUM_SEL;
> "phy_num_sel" and "tpg_num_sel" can be in if-else. They both are not 
> required at once.

ACK

>> +    if (camss->tpg) {
>> +        tpg = &camss->tpg[phy->csiphy_id];
>> +
>> +        if (csid->tpg_linked && tpg->testgen.mode > 0) {
> If the tpg is linked and the mode is not valid, shouldn't you be 
> throwing error?

ACK
>> +            val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy- 
>> >csiphy_id + 1);
>> +            val |= CSI2_RX_CFG0_TPG_NUM_EN;
> Can we rename this to CSI2_RX_CFG0_TPG_MUX_EN?

ACK

>> +        }
>> +    }
>> +
>>       writel(val, csid->base + CSID_CSI2_RX_CFG0);
>>       val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index 
>> 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..5f9eb533723f2864df64fd6c63e2682fed4a12ae 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -66,6 +66,8 @@
>>   #define        CSI2_RX_CFG0_VC_MODE        3
>>   #define        CSI2_RX_CFG0_DL0_INPUT_SEL    4
>>   #define        CSI2_RX_CFG0_PHY_NUM_SEL    20
>> +#define        CSI2_RX_CFG0_TPG_NUM_EN        BIT(27)
>> +#define        CSI2_RX_CFG0_TPG_NUM_SEL    GENMASK(29, 28)
>>   #define CSID_CSI2_RX_CFG1        0x204
>>   #define        CSI2_RX_CFG1_ECC_CORRECTION_EN    BIT(0)
>> @@ -109,11 +111,23 @@ static void __csid_configure_rx(struct 
>> csid_device *csid,
>>                   struct csid_phy_config *phy, int vc)
> Same as above.

ACK

>>   {
>>       int val;
>> +    struct camss *camss;
>> +    struct tpg_device *tpg;
>> +    camss = csid->camss;
>>       val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>       val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>>       val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
>> CSI2_RX_CFG0_PHY_NUM_SEL;
>> +    if (camss->tpg) {
>> +        tpg = &camss->tpg[phy->csiphy_id];
>> +
>> +        if (csid->tpg_linked && tpg->testgen.mode > 0) {
>> +            val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy- 
>> >csiphy_id + 1);
>> +            val |= CSI2_RX_CFG0_TPG_NUM_EN;
>> +        }
>> +    }
>> +
>>       writel(val, csid->base + CSID_CSI2_RX_CFG0);
>>       val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/ 
>> drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..d7ef7a1709648406dc59c210d355851397980769
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> @@ -0,0 +1,257 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + *
>> + * Qualcomm MSM Camera Subsystem - TPG (Test Patter Generator) Module
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/bitfield.h>
>> +#include <linux/completion.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +
>> +#include "camss-tpg.h"
>> +#include "camss.h"
>> +
>> +#define TPG_HW_VERSION        0x0
>> +# define HW_VERSION_STEPPING        GENMASK(15, 0)
>> +# define HW_VERSION_REVISION        GENMASK(27, 16)
>> +# define HW_VERSION_GENERATION        GENMASK(31, 28)
>> +
>> +#define TPG_HW_VER(gen, rev, step) \
>> +    (((u32)(gen) << 28) | ((u32)(rev) << 16) | (u32)(step))
>> +
>> +#define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
>> +#define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
>> +
>> +#define TPG_HW_STATUS        0x4
>> +
>> +#define TPG_VC_n_GAIN_CFG(n)        (0x60 + (n) * 0x60)
> I know why this is here but it may be is better to group this with VC 
> based registers. In fact, can you please segregate these macros into sub 
> sections with headings like "TPG global registers", "TPG VC based 
> registers", "TPG DT based registers" etc. Just for better readability.

ACK, registers are arranged according to their addresses, and I will 
mark the global registers.

>> +
>> +#define TPG_CTRL        0x64
>> +# define TPG_CTRL_TEST_EN        BIT(0)
>> +# define TPG_CTRL_PHY_SEL        BIT(3)
>> +# define TPG_CTRL_NUM_ACTIVE_LANES    GENMASK(5, 4)
>> +# define TPG_CTRL_VC_DT_PATTERN_ID    GENMASK(8, 6)
>> +# define TPG_CTRL_OVERLAP_SHDR_EN    BIT(10)
>> +# define TPG_CTRL_NUM_ACTIVE_VC        GENMASK(31, 30)
>> +#  define NUM_ACTIVE_VC_0_ENABLED        0
>> +#  define NUM_ACTIVE_VC_0_1_ENABLED        1
>> +#  define NUM_ACTIVE_VC_0_1_2_ENABLED        2
>> +#  define NUM_ACTIVE_VC_0_1_3_ENABLED        3
>> +
>> +#define TPG_VC_n_CFG0(n)    (0x68 + (n) * 0x60)
>> +# define TPG_VC_n_CFG0_VC_NUM            GENMASK(4, 0)
>> +# define TPG_VC_n_CFG0_NUM_ACTIVE_DT        GENMASK(9, 8)
>> +#  define NUM_ACTIVE_SLOTS_0_ENABLED            0
>> +#  define NUM_ACTIVE_SLOTS_0_1_ENABLED            1
>> +#  define NUM_ACTIVE_SLOTS_0_1_2_ENABLED        2
>> +#  define NUM_ACTIVE_SLOTS_0_1_3_ENABLED        3
> s/NUM_ACTIVE_SLOTS/DT/?, if you really need these macros. Similarly for 
> VCs enabled.

ACK

>> +# define TPG_VC_n_CFG0_NUM_BATCH        GENMASK(15, 12)
>> +# define TPG_VC_n_CFG0_NUM_FRAMES        GENMASK(31, 16)
>> +
>> +#define TPG_VC_n_LSFR_SEED(n)    (0x6C + (n) * 0x60)
>> +
>> +#define TPG_VC_n_HBI_CFG(n)    (0x70 + (n) * 0x60)
>> +
>> +#define TPG_VC_n_VBI_CFG(n)    (0x74 + (n) * 0x60)
>> +
>> +#define TPG_VC_n_COLOR_BARS_CFG(n)        (0x78 + (n) * 0x60)
>> +# define TPG_VC_n_COLOR_BARS_CFG_PIX_PATTERN        GENMASK(2, 0)
>> +# define TPG_VC_n_COLOR_BARS_CFG_QCFA_EN        BIT(3)
>> +# define TPG_VC_n_COLOR_BARS_CFG_SPLIT_EN        BIT(4)
>> +# define TPG_VC_n_COLOR_BARS_CFG_NOISE_EN        BIT(5)
>> +# define TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD        GENMASK(13, 8)
>> +# define TPG_VC_n_COLOR_BARS_CFG_XCFA_EN        BIT(16)
>> +# define TPG_VC_n_COLOR_BARS_CFG_SIZE_X            GENMASK(26, 24)
>> +# define TPG_VC_n_COLOR_BARS_CFG_SIZE_Y            GENMASK(30, 28)
>> +
>> +#define TPG_VC_m_DT_n_CFG_0(m, n)        (0x7C + (m) * 0x60 + (n) * 0xC)
>> +# define TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT    GENMASK(15, 0)
>> +# define TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH    GENMASK(31, 16)
>> +
>> +#define TPG_VC_m_DT_n_CFG_1(m, n)        (0x80 + (m) * 0x60 + (n) * 0xC)
>> +# define TPG_VC_m_DT_n_CFG_1_DATA_TYPE        GENMASK(5, 0)
>> +# define TPG_VC_m_DT_n_CFG_1_ECC_XOR_MASK    GENMASK(13, 8)
>> +# define TPG_VC_m_DT_n_CFG_1_CRC_XOR_MASK    GENMASK(31, 16)
>> +
>> +#define TPG_VC_m_DT_n_CFG_2(m, n)        (0x84 + (m) * 0x60 + (n) * 0xC)
>> +# define TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE        GENMASK(3, 0)
>> +/* v2.0.0: USER[19:4], ENC[23:20] */
>> +# define TPG_V2_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD        
>> GENMASK(19, 4)
>> +# define TPG_V2_VC_m_DT_n_CFG_2_ENCODE_FORMAT            GENMASK(23, 20)
> For better readability, can you make these TPG_V2_0_*?
>> +/* v2.1.0: USER[27:4], ENC[31:28] */
>> +# define TPG_V2_1_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD    
>> GENMASK(27, 4)
>> +# define TPG_V2_1_VC_m_DT_n_CFG_2_ENCODE_FORMAT            
>> GENMASK(31, 28)
>> +
>> +#define TPG_VC_n_COLOR_BAR_CFA_COLOR0(n)    (0xB0 + (n) * 0x60)
>> +#define TPG_VC_n_COLOR_BAR_CFA_COLOR1(n)    (0xB4 + (n) * 0x60)
>> +#define TPG_VC_n_COLOR_BAR_CFA_COLOR2(n)    (0xB8 + (n) * 0x60)
>> +#define TPG_VC_n_COLOR_BAR_CFA_COLOR3(n)    (0xBC + (n) * 0x60)
>> +
>> +/* Line offset between VC(n) and VC(n-1), n form 1 to 3 */
>> +#define TPG_VC_n_SHDR_CFG    (0x84 + (n) * 0x60)
>> +
>> +#define TPG_CLEAR        0x1F4
>> +
>> +#define TPG_HBI_PCT_DEFAULT            545    /* 545% */
>> +#define TPG_VBI_PCT_DEFAULT            10    /* 10% */
>> +#define PERCENT_BASE                100
>> +#define BITS_PER_BYTE                8
>> +
>> +/* Default user-specified payload for TPG test generator.
>> + * Keep consistent with CSID TPG default: 0xBE.
>> + */
>> +#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT    0xBE
>> +#define TPG_LFSR_SEED_DEFAULT            0x12345678
>> +#define TPG_COLOR_BARS_CFG_STANDARD \
>> +    FIELD_PREP(TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD, 0xA)
>> +
>> +static int tpg_stream_on(struct tpg_device *tpg)
> Add function headers? For this  and a few other below.

I received a comment asking me to remove the comments,
if a function is not called in multiple places or its purpose cannot be 
directly understood, adding extra documentation is useless.

>> +{
>> +    struct tpg_testgen_config *tg = &tpg->testgen;
>> +    struct v4l2_mbus_framefmt *input_format;
>> +    const struct tpg_format_info *format;
>> +    u8 lane_cnt = tpg->res->lane_cnt;
>> +    u8 dt_cnt = 0;
>> +    u8 i;
>> +    u32 val;
>> +
>> +    /* Loop through all enabled VCs and configure stream for each */
>> +    for (i = 0; i < tpg->res->vc_cnt; i++) {
> Here as well, can we segregate the code to global, VC based and DT based 
> configs with some comments?

This loop all contains configurations related to VC/DT.
Will add some comments for this.

>> +        input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
>> +        format = tpg_get_fmt_entry(tpg,
>> +                       tpg->res->formats->formats,
>> +                       tpg->res->formats->nformats,
>> +                       input_format->code);
>> +        if (IS_ERR(format))
>> +            return -EINVAL;
>> +
>> +        val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT, 
>> input_format->height & 0xffff) |
>> +              FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH, 
>> input_format->width & 0xffff);
>> +        writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
>> +
>> +        val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format- 
>> >data_type);
>> +        writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
>> +
>> +        if (tpg->hw_version == TPG_HW_VER_2_0_0) {
>> +            val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg- 
>> >mode - 1) |
>> +                
>> FIELD_PREP(TPG_V2_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
>> +                       TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
>> +                FIELD_PREP(TPG_V2_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
>> +                       format->encode_format);
>> +        } else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
>> +            val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg- 
>> >mode - 1) |
>> +                
>> FIELD_PREP(TPG_V2_1_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
>> +                       TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
>> +                FIELD_PREP(TPG_V2_1_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
>> +                       format->encode_format);
>> +        }
>> +        writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
>> +
>> +        writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + 
>> TPG_VC_n_COLOR_BARS_CFG(i));
>> +
>> +        val = DIV_ROUND_UP(input_format->width * format->bpp * 
>> TPG_HBI_PCT_DEFAULT,
>> +                   BITS_PER_BYTE * lane_cnt * PERCENT_BASE);
>> +        writel(val, tpg->base + TPG_VC_n_HBI_CFG(i));
>> +        val = input_format->height * TPG_VBI_PCT_DEFAULT / PERCENT_BASE;
>> +        writel(val, tpg->base + TPG_VC_n_VBI_CFG(i));
>> +
>> +        writel(TPG_LFSR_SEED_DEFAULT, tpg->base + 
>> TPG_VC_n_LSFR_SEED(i));
>> +
>> +        /* configure one DT, infinite frames */
> Although this driver is not supporting more than one DT in a VC right 
> now, is there a way we can make the API generic enough to receive #DTs 
> in each VS and their dimensions?

ACK

>> +        val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, i) |
>> +              FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
>> +        writel(val, tpg->base + TPG_VC_n_CFG0(i));
>> +    }
>> +
>> +    val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
>> +          FIELD_PREP(TPG_CTRL_PHY_SEL, 0) |
> Same here, is there a way to make the API generic to receive CPHY / DPHY 
> mode required?

ACK

>> +          FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>> +          FIELD_PREP(TPG_CTRL_VC_DT_PATTERN_ID, 0) |
> You are assuming frame interleaved mode always. It may be is a good 
> start but a bunch of functionality is missing here. Just please think of 
> the scalability of the API even though the driver support is limited at 
> this point.

ACK

>> +          FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, tpg->res->vc_cnt - 1);
>> +    writel(val, tpg->base + TPG_CTRL);
>> +
>> +    return 0;
>> +}
>> +
>> +static void tpg_stream_off(struct tpg_device *tpg)
>> +{
>> +    writel(0, tpg->base + TPG_CTRL);
>> +    writel(1, tpg->base + TPG_CLEAR);
> Why not just reuse the reset function?

ACK

>> +}
>> +
>> +static int tpg_configure_stream(struct tpg_device *tpg, u8 enable)
>> +{
>> +    int ret = 0;
>> +
>> +    if (enable)
>> +        ret = tpg_stream_on(tpg);
>> +    else
>> +        tpg_stream_off(tpg);
>> +
>> +    return ret;
>> +}
>> +
>> +static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 
>> val)
>> +{
>> +    if (val >= 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
>> +        tpg->testgen.mode = val;
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * tpg_hw_version - tpg hardware version query
>> + * @tpg: tpg device
>> + *
>> + * Return HW version or error
>> + */
>> +static u32 tpg_hw_version(struct tpg_device *tpg)
>> +{
>> +    u32 hw_version;
>> +    u32 hw_gen;
>> +    u32 hw_rev;
>> +    u32 hw_step;
>> +
>> +    hw_version = readl(tpg->base + TPG_HW_VERSION);
>> +    hw_gen = FIELD_GET(HW_VERSION_GENERATION, hw_version);
>> +    hw_rev = FIELD_GET(HW_VERSION_REVISION, hw_version);
>> +    hw_step = FIELD_GET(HW_VERSION_STEPPING, hw_version);
>> +
>> +    tpg->hw_version = hw_version;
>> +
>> +    dev_dbg_once(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
>> +             hw_gen, hw_rev, hw_step);
>> +
>> +    return hw_version;
>> +}
>> +
>> +/*
>> + * tpg_reset - Trigger reset on tpg module and wait to complete
> Doesn't seem like there is any wait here, right?

Do you have any suggestions on this? I noticed that there is no delay 
downstream either.

> Also, do you want to 
> clear the IRQs in reset?

Following the maintainer's suggestion, I removed IRQ support, but we do 
need to add IRQ clearing.

>> + * @tpg: tpg device
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int tpg_reset(struct tpg_device *tpg)
>> +{
>> +    writel(0, tpg->base + TPG_CTRL);
>> +    writel(1, tpg->base + TPG_CLEAR);
>> +
>> +    return 0;
>> +}
>> +
>> +static void tpg_subdev_init(struct tpg_device *tpg)
>> +{
>> +    tpg->testgen.modes = testgen_payload_modes;
>> +    tpg->testgen.nmodes = TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
>> +}
>> +
>> +const struct tpg_hw_ops tpg_ops_gen1 = {
>> +    .configure_stream = tpg_configure_stream,
>> +    .configure_testgen_pattern = tpg_configure_testgen_pattern,
>> +    .hw_version = tpg_hw_version,
>> +    .reset = tpg_reset,
>> +    .subdev_init = tpg_subdev_init,
>> +};
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index 
>> 43fdcb9af101ef34b118035ca9c68757b66118df..5cddf1bc09f97c2c61f907939bb54663d8eab3d4 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3199,6 +3199,65 @@ static const struct camss_subdev_resources 
>> csiphy_res_8775p[] = {
>>       },
>>   };
>> +static const struct camss_subdev_resources tpg_res_8775p[] = {
>> +    /* TPG0 */
>> +    {
>> +        .regulators = {  },
>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
> Why should TPG need camnoc_rt_axi clk?

As tested ,TPG can`t streaming without camnoc_rt_axi clk.
For Pixel path, some platform can stream without camnoc_rt_axi clk but 
TPG not.

>> +        .clock_rate = {
>> +            { 400000000 },
>> +            { 0 },
>> +            { 400000000 },
>> +        },
>> +        .reg = { "tpg0" },
>> +        .interrupt = { "tpg0" },
>> +        .tpg = {
>> +            .lane_cnt = 4,
>> +            .vc_cnt = 1,
>> +            .formats = &tpg_formats_gen1,
>> +            .hw_ops = &tpg_ops_gen1
>> +        }
>> +    },
>> +
>> +    /* TPG1 */
>> +    {
>> +        .regulators = {  },
>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
>> +        .clock_rate = {
>> +            { 400000000 },
>> +            { 0 },
>> +            { 400000000 },
>> +        },
>> +        .reg = { "tpg1" },
>> +        .interrupt = { "tpg1" },
>> +        .tpg = {
>> +            .lane_cnt = 4,
>> +            .vc_cnt = 1,
>> +            .formats = &tpg_formats_gen1,
>> +            .hw_ops = &tpg_ops_gen1
>> +        }
>> +    },
>> +
>> +    /* TPG2 */
>> +    {
>> +        .regulators = {  },
>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
>> +        .clock_rate = {
>> +            { 400000000 },
>> +            { 0 },
>> +            { 400000000 },
>> +        },
>> +        .reg = { "tpg2" },
>> +        .interrupt = { "tpg2" }, + .tpg = { + .lane_cnt = 4, 
>> + .vc_cnt = 1, + .formats = &tpg_formats_gen1, + .hw_ops = 
>> &tpg_ops_gen1 + } + }, +}; + static const struct 
>> camss_subdev_resources csid_res_8775p[] = { /* CSID0 */ { @@ -3595,6 
>> +3654,62 @@ static const struct camss_subdev_resources 
>> csiphy_res_x1e80100[] = { }, }; +static const struct 
>> camss_subdev_resources tpg_res_x1e80100[] = { + /* TPG0 */ + 
>> { + .regulators = { }, + .clock = { "camnoc_rt_axi", "cpas_ahb", 
>> "csid_csiphy_rx" },
>> +        .clock_rate = {
>> +            { 400000000 },
>> +            { 0 },
>> +            { 400000000 },
>> +        },
>> +        .reg = { "csitpg0" },
>> +        .tpg = {
>> +            .lane_cnt = 4,
>> +            .vc_cnt = 1,
>> +            .formats = &tpg_formats_gen1,
>> +            .hw_ops = &tpg_ops_gen1
>> +        }
>> +    },
>> +
>> +    /* TPG1 */
>> +    {
>> +        .regulators = {  },
>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csid_csiphy_rx" },
>> +        .clock_rate = {
>> +            { 400000000 },
>> +            { 0 },
>> +            { 400000000 },
>> +        },
>> +        .reg = { "csitpg1" },
>> +        .tpg = {
>> +            .lane_cnt = 4,
>> +            .vc_cnt = 1,
>> +            .formats = &tpg_formats_gen1,
>> +            .hw_ops = &tpg_ops_gen1
>> +        }
>> +    },
>> +
>> +    /* TPG2 */
>> +    {
>> +        .regulators = {  },
>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csid_csiphy_rx" },
>> +        .clock_rate = {
>> +            { 400000000 },
>> +            { 0 },
>> +            { 400000000 },
>> +        },
>> +        .reg = { "csitpg2" },
>> +        .tpg = {
>> +            .lane_cnt = 4,
>> +            .vc_cnt = 1,
>> +            .formats = &tpg_formats_gen1,
>> +            .hw_ops = &tpg_ops_gen1
>> +        }
>> +    },
>> +};
>> +
>>   static const struct camss_subdev_resources csid_res_x1e80100[] = {
>>       /* CSID0 */
>>       {
>> @@ -4674,6 +4789,13 @@ static int camss_probe(struct platform_device 
>> *pdev)
>>       if (!camss->csiphy)
>>           return -ENOMEM;
>> +    if (camss->res->tpg_num > 0) {
>> +        camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
>> +                      sizeof(*camss->tpg), GFP_KERNEL);
>> +        if (!camss->tpg)
>> +            return -ENOMEM;
>> +    }
>> +
>>       camss->csid = devm_kcalloc(dev, camss->res->csid_num, 
>> sizeof(*camss->csid),
>>                      GFP_KERNEL);
>>       if (!camss->csid)
>> @@ -4863,11 +4985,13 @@ static const struct camss_resources 
>> qcs8300_resources = {
>>       .version = CAMSS_8300,
>>       .pd_name = "top", .csiphy_res = csiphy_res_8300, + .tpg_res = 
>> tpg_res_8775p, .csid_res = csid_res_8775p, .csid_wrapper_res = 
>> &csid_wrapper_res_sm8550, .vfe_res = vfe_res_8775p, .icc_res = 
>> icc_res_qcs8300, .csiphy_num = ARRAY_SIZE(csiphy_res_8300), + .tpg_num 
>> = ARRAY_SIZE(tpg_res_8775p), .csid_num = 
>> ARRAY_SIZE(csid_res_8775p), .vfe_num = 
>> ARRAY_SIZE(vfe_res_8775p), .icc_path_num = 
>> ARRAY_SIZE(icc_res_qcs8300), @@ -4877,11 +5001,13 @@ static const 
>> struct camss_resources sa8775p_resources = { .version = 
>> CAMSS_8775P, .pd_name = "top", .csiphy_res = csiphy_res_8775p, 
>> + .tpg_res = tpg_res_8775p, .csid_res = 
>> csid_res_8775p, .csid_wrapper_res = &csid_wrapper_res_sm8550, .vfe_res 
>> = vfe_res_8775p, .icc_res = icc_res_sa8775p, .csiphy_num = 
>> ARRAY_SIZE(csiphy_res_8775p), + .tpg_num = 
>> ARRAY_SIZE(tpg_res_8775p), .csid_num = 
>> ARRAY_SIZE(csid_res_8775p), .vfe_num = 
>> ARRAY_SIZE(vfe_res_8775p), .icc_path_num = 
>> ARRAY_SIZE(icc_res_sa8775p), @@ -4992,11 +5118,13 @@ static const 
>> struct camss_resources x1e80100_resources = { .pd_name = "top",
>>       .csiphy_res = csiphy_res_x1e80100,
>>       .csid_res = csid_res_x1e80100,
>> +    .tpg_res = tpg_res_x1e80100,
>>       .vfe_res = vfe_res_x1e80100,
>>       .csid_wrapper_res = &csid_wrapper_res_x1e80100,
>>       .icc_res = icc_res_x1e80100,
>>       .icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
>> +    .tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>>       .csid_num = ARRAY_SIZE(csid_res_x1e80100),
>>       .vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
>>   };
> 
> Thanks,
> 
> Vijay.
> 

Thanks,
Wenmeng

