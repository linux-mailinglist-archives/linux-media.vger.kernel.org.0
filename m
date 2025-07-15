Return-Path: <linux-media+bounces-37778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CB1B059B6
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 14:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B17EC564090
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 12:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0432DE6F5;
	Tue, 15 Jul 2025 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9qVqk3l"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308E2D979F
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752581757; cv=none; b=m3MIjJi2Bq3HceFhM4e+RhB4O45rymo8pxjl7J4UeRxyHHGGUJjA0zlZAdQhz2NHlhhdb7qwKlBvQhirsVFco1ZPwyePgK1WRKLljt+dO5M5gbGwGX9Vb2iZDIAywEOhho/nrS7rtEPA+yfaS1zQj73KhDXuZKhpyvxUMKNzsnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752581757; c=relaxed/simple;
	bh=RPMIJ06lYpZki9x4OGNT38hsLl9ZRqJRngOVBfL0TkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJvEB7S08RqIipm0dTLwVrEDARuXsBMjTLdvAa0Aub2hiG33OGrAG+O+3LrYpzOK9BHM43c1Ap/d/wrru9cJTPQi5RcWsFU52pIXabIydcRk34f0Pxia0Jr4X7QTapQRFc+Rpn9ug0lQmX8JO7DSGqK8s8wB390Y6NkVWgMudb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9qVqk3l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5Yhbe005363
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 12:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkoL4vyOl+pm49lYyaV0Bkhtxl6H70tCk4Yr8IITAC0=; b=h9qVqk3lN/9/R4G/
	xDSWD+gcL/0teQzBvkGmlmpNLb1kGet1GQ9gmDdVTyDUxVTIZwf5GcpX+nqBp71k
	XdXNUHXjdUlNv/8NJ2D87SkibXiAs6D3NY5q8m4qAViswwF+AhxL9Z03eFQqUj9h
	CU/pWDB6AyodpnOoOZBakz3QdEQ9kVlaGHEM5tyOz10cMtzczMkEiPiiT+5CJIy/
	avwCwSvDPn2ScB51myfnMWqs25hmkRfjJlfwIXQnmP2drsyYCHqeF+u7at2RUI+P
	6AN1ZAhRLcS3f2mThwQ9pEcOnk9WumLIuW5TZKdaJN1SKZ9jtsn0AucOGIZZyNUg
	hiSw1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug3808x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 12:15:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7deca3ef277so131118285a.1
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 05:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752581754; x=1753186554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gkoL4vyOl+pm49lYyaV0Bkhtxl6H70tCk4Yr8IITAC0=;
        b=BLk0OsRjVNKcIbS8Tx1slZuJFHE5Qs5gLSFi78399Aw4GT/bD9XPyud/blTGfii/fP
         42dNRmvmJ1wM5hmGi4MbceQAO6i7ZltQK58N4PI0tB5KXsdeCue8f1qgvzdvsqnG+9Vu
         oI+1Z8Ozaa2pvKy5TZIx3RnP85p93B14v0Uyqkl1rsoErapxJ4GI7fxQ7YGH2R0WQ65W
         AM9lDZpik5CXWbLFqLKSYmcPMAAM1PZlS0ekppN/clKEtY4RaugG0AYFVJNrVK04Qrto
         pKVZ5Mt0vtY6NneYiNcshv36OmntX09epgK88ZPS4c/Sr/h/JLT3O5ysjD5Yr3yMK2Xt
         50/A==
X-Forwarded-Encrypted: i=1; AJvYcCVrx/Au6ZrcM07eqAC2hWj2F8ms6+Xz0NKGx/36imXP0/wxHid1BfKMqRZvdydimKaGW23nB5IArHIc/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgnz/9gC+NzGwC6wC0fghaB4ODadU36gqmbborTL/dOTO75RP1
	yL/bJgnPBnBqyrAal3SWN6lD7tzulznX9DEsp3fk892REOHI+GQEzxHNrsdzaTT0qaYm/CX1OF1
	qqzFtD6Wn7oUNDIKe9aJ8HK1bXLtwtjIGQQtnjzuqFI4Om20I6Mnb5csj2A/dxUnsbA==
X-Gm-Gg: ASbGncsTp1LTbQzS9zHuT7u+k+9g+oSEAUIAkbAvUkK4YYa+jUEBIWZF8VdgTlpXD/J
	CCbefvSqo1qox3NiGjMjo47vXxWlhSAhVteLqt9fRUHT4hc0BIV0JMhsj+dG7JPkSfIZqRzEfaE
	rLVEoWp/klNsWjlYpWOyYe7aWt5KHFVGCbCwSdDNrk+52hcWUj/HzwrD/9OulcWhgfe1iRAcx5m
	uQZrz4ohynkhYDoa1OQggYC63aDnvmT6avBpKQmHthd4U3wJPe/I5a0p3srHylv17mTnKGCJRa3
	17B1T9w8TnUk6jpuPlaFyKzDW6P/ZmqWNyaeIG7225yiD5xKg3sTEMOTKswPm39rJWapt7H/QDr
	E0lh2LujnUTS2+3kny1Ua
X-Received: by 2002:a05:620a:63c8:b0:7e3:3029:44c with SMTP id af79cd13be357-7e33c738190mr61809385a.7.1752581753383;
        Tue, 15 Jul 2025 05:15:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNC0tHGCHaMZe1NNLu7kUu5qixnVltKqW5yasSjlLUM9Lwlg4TzACxjlKTv9RGFtYvhko0XQ==
X-Received: by 2002:a05:620a:63c8:b0:7e3:3029:44c with SMTP id af79cd13be357-7e33c738190mr61807285a.7.1752581752766;
        Tue, 15 Jul 2025 05:15:52 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91cc0sm976035566b.26.2025.07.15.05.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 05:15:52 -0700 (PDT)
Message-ID: <bffc8478-4de9-4a9b-9248-96a936f20096@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 14:15:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Prakash Gupta <quic_guptap@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
 <6c6f6bc9-7c34-4961-8b5e-e6d02c4b2f6d@linaro.org>
 <25c64712-960a-50b4-e7fa-398e4bf809ef@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25c64712-960a-50b4-e7fa-398e4bf809ef@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMSBTYWx0ZWRfX/suZkMGWTPDl
 VcvOIads+jVWJYA07pLxupSl4LueBaVF4Nsz6/u6LYiv19g/6GZlvK2oDdLcJCZm/377dvgvXL9
 l9+N9RuXVf7R9rXciiBmZ1QkV4kMUajKW7ZMIQbN34G9NMLwYRrsdymyYIhhnArWmferqE+DLyE
 flZqHG48YMP3Fu5Tccir1i2qFO6VrDGvGvgiroRi0fXm8QOyRvQZb/C19jgizsPsyADZ4hsXH4c
 23/7GJ7FTSFN0noN44odCuF7IExP/Ub7hMR2AjyLWFyAhqAx1PEzfbzfe2ilohBX2NZrbEWhSLn
 mROqYWb8F1t3+p/6hjLFo6onSzHRvkziPTPdDJmhXNLceTrDmC1kBy9yXakfMMCUW9/OKJ31dxb
 mAHuThZewpPP+C1G9JZ8Aefroycu1WGpRQqO+wTPnWFEWw7X3vyuFGzyNoukkNBdcyYL2GF5
X-Proofpoint-GUID: up1yvi4__3-rtyuWI2upxiqtr5NPj4fD
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6876467a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=j_YMfRGaDDqHtg2ur-kA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: up1yvi4__3-rtyuWI2upxiqtr5NPj4fD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150111

On 7/10/25 8:18 PM, Prakash Gupta wrote:
> 
> 
> On 7/5/2025 4:14 AM, Bryan O'Donoghue wrote:
>> On 04/07/2025 17:45, Dmitry Baryshkov wrote:
>>> What about instead:
>>>
>>> - keep IOMMU entries as is
>> ack
>>
>>> - Add iommu-maps, mapping the non-pixel SID
>>> - In future expand iommu-maps, describing the secure contexts?
>>
>> Interesting, we are _adding_ so that's not an ABI break and if I'm
>> reading the documentation right, there's no hard rule on what iommu-map
>> defines i.e. nothing to preclude us from encoding the information we
>> want here.
>>
>> This might work.
>>
>> drivers/pci/controller/dwc/pcie-qcom.c::qcom_pcie_config_sid_1_9_0()
>>
>> You can register your platform device to the SID map you parse.
> 
> I see few limitations with using iommu-map here, some of these are
> listed in [1]
> 
> 1. We can't specify SMR mask with iommu-map.
> 2. We can't specify different iommu-addresses range for specific contexts.
> 3. The secure CB support [2] would require vmid information associated
> with per context. I think this can't be provided with iommu-map.

FWIW iommu-map should probably be evolved to support passing more
than one cell of iommu_spec in general.. For us specifically, it's
only a matter of time before some platform's PCIe controller
requires* we pass a non-zero SMR mask (unless we should be doing
that already somewhere..)

(* we can obviously do the masking manually and put the effective
values in dt, but "eeh")

Perhaps that can even be done without messing up backwards
compatiblity (treat it as pseudocode, def incomplete):

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7043acd971a0..bca54035f90e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2068,9 +2068,12 @@ int of_map_id(const struct device_node *np, u32 id,
               const char *map_name, const char *map_mask_name,
               struct device_node **target, u32 *id_out)
 {
+       const char *cells_prop_name __free(kfree);
        u32 map_mask, masked_id;
+       u32 cell_count;
        int map_len;
        const __be32 *map = NULL;
+       int ret;
 
        if (!np || !map_name || (!target && !id_out))
                return -EINVAL;
@@ -2084,7 +2087,15 @@ int of_map_id(const struct device_node *np, u32 id,
                return 0;
        }
 
-       if (!map_len || map_len % (4 * sizeof(*map))) {
+       cells_prop_name = kasprintf(GFP_KERNEL, "#%s-cells", map_name);
+       if (!cells_prop_name)
+               return -EINVAL;
+
+       ret = of_property_read_u32(np, cells_prop_name, &cell_count);
+       if (ret)
+               return ret;
+
+       if (!map_len || map_len % ((2 + cell_count + 1) * sizeof(*map))) {
                pr_err("%pOF: Error: Bad %s length: %d\n", np,
                        map_name, map_len);
                return -EINVAL;
@@ -2106,7 +2117,7 @@ int of_map_id(const struct device_node *np, u32 id,
                u32 id_base = be32_to_cpup(map + 0);
                u32 phandle = be32_to_cpup(map + 1);
                u32 out_base = be32_to_cpup(map + 2);
-               u32 id_len = be32_to_cpup(map + 3);
+               u32 id_len = be32_to_cpup(map + cell_count - 1);
 
                if (id_base & ~map_mask) {
                        pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",

Konrad

