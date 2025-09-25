Return-Path: <linux-media+bounces-43133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB50B9DF15
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 09:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236273ADD9B
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 07:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF9F2750F3;
	Thu, 25 Sep 2025 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0SppuKH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333B426F2A7
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787094; cv=none; b=ca4sMBDu9bEAblmKUTdLi2M0QMTJ/DDZAf88gUwQ6QRXfuOi5Y/SJVNUZUErscoE9cVj3Xr7Is61fY1Muw1B2ZQYL2RdZlHKkoJjaoQIZqBX6pcU/IzttplBBSaeBC+dneOyQS3BIilmmFefEs1C0/9DO1jXQnRHvxWgpoIoWGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787094; c=relaxed/simple;
	bh=oJBnVWEqis8/5n/SoApXp5MzjZD1R0lPAriYUQuTlhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MI/MjaTUhxf0nWCu6w73V+ADLWgKOUNTmp2xUH+boVvIKOCkK2IovtXR2O5UslAkZiOfNvYcysjYyPP+f1pcTj64C66+6ZrCPxXdfdvdZgHFoOCh2DFFH0+3PU1CggbCZCAsJbIuFAg6XqJsRl+xAYzWZBwLwFJDK9TX2ifitDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0SppuKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0rTTo025119
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 07:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcIbbzo7ckMjjA3PIeSOTCHWD7NrOELFEt61PIG0Skc=; b=e0SppuKHydi+id0Q
	7Ttdxpd9lHG6qvkmuEcecasOJhlEJFCmSALgtQkIXTP396NbWDzxAHbk8mIliUgo
	MXul15jZz8BtXk0QFyIWjxLJdX/cF6+xSbtjiDwUdOl3nNqAu9/J54JDT417lP/t
	9yzjJwKQ4fgo0mk8YO76Px8Z5CK6b2+NXEn9dLGFrVip/FkRC5twhnv9LIEGKLZL
	HiMgfK4rnbiJ6ZwZJ/EgE//zo70xdeSXRk1P2m12A8QPuskGLpNxPwXF0f82ko0B
	qmK/SJBFr13F2L3Opxu6QQ3QqSzlOJc7oQXkIoHZFSHQooQshLIuYjnND04r3Q+8
	kO81Jg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv179qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 07:58:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f180e8da5so896271b3a.3
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787091; x=1759391891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcIbbzo7ckMjjA3PIeSOTCHWD7NrOELFEt61PIG0Skc=;
        b=PZjPEY0kWHUo7uocSZQ42lB0tZMLhEdKPI0GvQmt8Jp1YKEBQM8vdzjY4TNFAjRaXZ
         4/KtCVeXIGLUybq1r4SUjLkWN8kbqNaUsj7mLthN7A7Xi80f+gGqTMf6huleVFq9VsoE
         Hs6vJmpNjriyBe1DcysvkLZUfVJGDOFm+gdJJcpLSGFBnhmSkV7ZP8HJsEqXy5Vu3EEY
         wf2PCgDOGiwTv1CdTDHRs2cRJR9Qjioxaiox4Z3tlZGpVfhWm1hCbu5KcPH97UVv5hnR
         ZyRId4XcbuaTfx49qyK9xsx7qnKZYC1ArsvsjoqIGcavbmrgBmfYoIF5y0yBY6KexnF2
         ryMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqjgTW4qKZE2mDP7RZnpxl8Ah112iIek3O3hw3g3YrpxRkxH84Ei0pLhda5N1hjQci83RN4kEF0+QneA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv7BFp9HDf0ciSpeoV5VGnay7KTL+aqBSUKdoZpNTmwakqomi7
	pcZj6zdUsy1mS6HCTVLcTxPW/BKftbyBbRzZP25sl8TKfARJKezB0PHh82hG06Sn4ZYiItCuLfr
	DG7k0vpMPIcvhMe0pUXIyC4wqp8uvndguvMymO3eGfkafymg3rTj3Kqz0uQWHwQFBXA==
X-Gm-Gg: ASbGnctaNM6rajhfbsPcID2pJXTbfB2010ApwHt32uuEYimxY4hoE1AiuUsuKY8iawJ
	O+cIr0W/kBfiyujogntI+ken/il6D8v5i50d1yQBuGo/qY3GO9cumSbwe2aTTkDvJuLF19IebAg
	BhAQ2fZOmh8oQctK645tG895M8G7ajFJMfB219hMqVwmfPyt0Y7sHV2YEe8ZopiGd1jF4Fx279t
	tZcLSaFqkYcdZ797FgN06JJF/yLdWjkFDJFMeEoCHu7JV0chIWCy0WE+NLQFRPLB5lWLz2ldHLd
	cRZd5nV+14+JHhd1I0IxEwGOTxDGznao91FAOi5FP+JPrsjPf5iKGYp6OXfq+O3bu32R1rXgvWE
	=
X-Received: by 2002:a05:6a00:c86:b0:781:4ec:4ec4 with SMTP id d2e1a72fcca58-78104ec5432mr1333315b3a.31.1758787090734;
        Thu, 25 Sep 2025 00:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg0TQxiv57fQVkmmQ5tE7NwpU2R6FvXPKEgVbgNY5wrTB6m01+7v3rANl2gXjzBuF8MNGZYQ==
X-Received: by 2002:a05:6a00:c86:b0:781:4ec:4ec4 with SMTP id d2e1a72fcca58-78104ec5432mr1333288b3a.31.1758787090279;
        Thu, 25 Sep 2025 00:58:10 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023edda8sm1190027b3a.43.2025.09.25.00.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:58:09 -0700 (PDT)
Message-ID: <1af0d19e-30e0-1260-877c-5d6027c3d297@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:27:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <vqzon3svfqvk3poz76jm5x5gf4rd6vkygegonafcprmkejt4aq@5kwlwytg3ulk>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <vqzon3svfqvk3poz76jm5x5gf4rd6vkygegonafcprmkejt4aq@5kwlwytg3ulk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QGSnkx0LRRWU-LKhZXFMRbpjXrCi6pi6
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4f614 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yfRxjFk6VvuiwaCZe6sA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX/lIbPisBVsix
 BcV0wvQYjGIVZc8iXIlvv3Vb77t/i9fR4NoxqOekp0/3BqrKkLAWKX89vTrRueemCcV3+Ld5m9l
 Ec+DQKTd5yl7outavNBWUEGdNzvWXAfGceqLqgHzUoEFS2GxW67omX0eSI+aiOx8u0a8zR8gO3Z
 LPgaT+evdh5zQUvAmnw3xJ+qiXM/7WjXZMUSTzVcAs7hggxI8/Zqy1+IUssbUd/2LCmG6igxVJp
 a+lfzp16PbvBrGgQbK5brvfOESLHnfxnZSy/jgRAbfH5U2AFjKMbJaVoNbKzAF6NhB7Nl/+Bxjw
 XXFed5LM7q9uh7AR5olTyVJdO5PLOVZBq2ked84z1lv/uW0me/sjzq0UGLzX6qJlar6vwh9hRtC
 SA2nDwG+
X-Proofpoint-ORIG-GUID: QGSnkx0LRRWU-LKhZXFMRbpjXrCi6pi6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025


On 9/25/2025 8:36 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>   (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> There are variants of this hardware, where only a single VPP pipe would
>> be functional (VPP0), and APV may not be present. In such case, the
>> hardware can be enabled without those 2 related power doamins, and
>> corresponding clocks. This explains the min entries for power domains
>> and clocks.
>> Iommus include all the different stream-ids which can be possibly
>> generated by vpu4 video hardware in both secure and non secure
>> execution mode.
>>
>> This patch depends on following patches
>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
> 
> This doesn't belong to the commit message. But you also can drop this
> dependency alltogether. Could you please do it?

Sure, i see below works good w.r.t schema and dtb checker. Please review and
confirm.

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
index f3528d514fe2..537e8d627a72 100644
--- a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
@@ -106,9 +106,7 @@ unevaluatedProperties: false

examples:
   - |
-    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>

@@ -136,10 +134,10 @@ examples:

       operating-points-v2 = <&iris_opp_table>;

-      clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+      clocks = <&gcc_video_axi0_clk>,
<&video_cc_mvs0c_clk>,
<&video_cc_mvs0_clk>,
-               <&gcc GCC_VIDEO_AXI1_CLK>,
+               <&gcc_video_axi1_clk>,
<&video_cc_mvs0c_freerun_clk>,
<&video_cc_mvs0_freerun_clk>,
<&video_cc_mvs0b_clk>,
@@ -157,17 +155,15 @@ examples:
                     "vcodec_vpp1",
                     "vcodec_apv";

-      interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-                       &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
-                      <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
-                       &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+      interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                      <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
       interconnect-names = "cpu-cfg",
                            "video-mem";

       memory-region = <&video_mem>;

-      resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
-               <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+      resets = <&gcc_video_axi0_clk_ares>,
+               <&gcc_video_axi1_clk_ares>,

Regards,
Vikash

