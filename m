Return-Path: <linux-media+bounces-55708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKudKosrtGkEigAAu9opvQ
	(envelope-from <linux-media+bounces-55708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:21:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F3B285D71
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0FEA31197D7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9191E3ACA5B;
	Fri, 13 Mar 2026 15:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GC8FSReq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6QxsaZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CB338F649
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415027; cv=none; b=SMUmSd/UIEGTgfIYnLZUa26BzCUClO/3J1jSgtKgkYLDDzlp5eqmJ+ViKLEzrn6LCwySxzqNvj29tn1n70i5ZsibESIRfm9mfwlxcX/5HVtibC9OnouKo0Dwfb44CHDY/fs0k7btZ6nd1SamDm/qlrCgulKul2uPopGRvWZr9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415027; c=relaxed/simple;
	bh=DUcBuDzR8Vt3nmScARMkm9CX8EQAoi9nu6O26gVJJkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+Xx1yRQBwLohuExKFRL2Tpv5XOI7wQu1ThQRu6IU2VNLOBkqmTIw0wAbMRHIAFmfy68i1WvFyhgUTg16sZ1eXiOndo3wolXVSIOIqbRHGsGrAfIbfVV9mx7Mv0+VXj3zB2c5dY1MZugHwdZuxxqJNEuyasFp/so0dhMxCh7BJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GC8FSReq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6QxsaZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmvZN2391114
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3eFun+R7DEVcMmqGCgOvog+ta9UM0shehTjUam8d9o=; b=GC8FSReqDP4KXEVA
	kT3T4Jm95n6NHAPATSvGU2N3ykZH2lgZ67lLED6+Kr7x1uLvwNDhy43IfHutxHBj
	TIpAM2/ufzxc6RPbMK0X7NZu4uFz6rtgXSXGHqxm0jEGMMb7BvpZQ09XRUc3K9dF
	PfnRuWu3FGvrt9iD4SCawjNnQvPY7I4dazEhTub17g15pyoWI+wB8toIcxmWdLY6
	s3L0A676DvMNI8gJf85B3wCQiiyxFhNg4uj74+jHe78BJ+mm66qQAE51LW6Hsg4P
	2HorpL4g17CafVhlS5p+CuX6/6X2iID6ZIKN61NKGdGPgLKFrUwav9+HXftEetXZ
	WvqBOQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m8vb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:17:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so1763463a12.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773415023; x=1774019823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3eFun+R7DEVcMmqGCgOvog+ta9UM0shehTjUam8d9o=;
        b=c6QxsaZGUVTSQdtY8+O/zqCaD3is7jwCOzy2pYmQS6i3FJoQHBaqRqEUaWx8xdd6iU
         /+WWo5FUr11yykjV4uh6usW8yj0wEMKHVviyDJW9Id+z/A/iem3UNNu2gzUjW4sjt98b
         6t7ZMOglGixoZKvd3hRPHF8CVZvNTMrXmBqNlEH+zaw/77dnELsUwZVIC+M/76DG0ieT
         xMuLjv2qaX5A3Z2Q628aXFMKkPvGsF2HkJKOHhGFmEfLh7PGZGQZisCKkenpARAc1mOM
         +4K6m1IZb/W/7lHaldD3Eh1+y/L+pAoAF3xTto/yYkGpbTgBy7hvR9RJtYu1X8ob2DW6
         MevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415023; x=1774019823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3eFun+R7DEVcMmqGCgOvog+ta9UM0shehTjUam8d9o=;
        b=X7Jvhj0TyRfclHy0cpZ4hRKQqXnpMMwGRK75tfnrTTSGfv3c21j8KuqYZ8Knk6IcfX
         sT6g9I2OhcKgztKuaZrpd4/qHsJeGkCqnSA34G+PP+LgjD2oPM1XfsTy7assNkANc7vK
         8m61aEvJuwR+J1OPYHlA2nTWwXoXWJTelzpCMTpLkrH+TJBq5e816dWd2kU+FMq9ac9g
         rzE9WJXUGvEjOQVWFJblbLMZPKfRp4cLfaH+Zt8YMCuiLdgfvC2PP8pNeHkzxSZ3FsX7
         NlFO3s7rNDXn7CGPA9w5MCrmpsDAOUmUdgPwNfz4XpYx6F7GBgti8s0HB0HnP8K3aIZ3
         LGAw==
X-Forwarded-Encrypted: i=1; AJvYcCWBpUmQA1h2BBYhFOBLfKEwg43i32fPCPuSCEff8y6Nu5yKv9gXV31OZA/6GTJAN3LrONp2Suhqpd17sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNhMMVZCVmDr47qF3eaLyvo9+Cd803ERAG9yxufQSYLbacmt8
	pOQmYcGciDJhDRQzopDEiFTsJQ8DZcIQElOFjXW+hY/CM2vmYhsDShq/+1nvyG5jdSIO5zyeBbO
	6wHXZAmn/Fw4l1VMzuQ9anVUtvqDZ2hWJ3jgqcPXxZX5cnXgtO7N4GzAVlzjZW6w0LQ==
X-Gm-Gg: ATEYQzy/l3zg7LmEcA3PehxVe6cVgx+VE54ussCZhHKvzlvYoraLSpC6PsZAhn/szYX
	PDH7fXouz4nn3zhgDO2flQhjr5tFW2rapOjaOX5oFJpSrOZZ2ZDsPDWGhVBcoVFqRKgBNv/cMSM
	hQxokKBYRJywejm09aQwpI8hSCFDCs4TNXSOoo7fzUxqHev7hhKaur0tFGPbI6JuRcgcsDP6A1E
	03Y1Elm+PICt8tf0eg2Nn18v5GBIBqNo5MGFdqSawp4E0v1C/ntJYyXxYTYZFHTzfALrMJj1nEJ
	1ieqI0oEyv+K43gMcjbws/fhyO0xw8Bk+KX5S+SQ3A7yoxvYDNJSDO0t46TLStzjvj1shwv3yPP
	767XZHWyN8BcaojpX0DrYp861dGpT8/1wV9g6WoD7ugZtcwBfeoebFzb+
X-Received: by 2002:a05:6a21:4cca:b0:398:71f2:59d5 with SMTP id adf61e73a8af0-398ecce998dmr3321265637.42.1773415022652;
        Fri, 13 Mar 2026 08:17:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:398:71f2:59d5 with SMTP id adf61e73a8af0-398ecce998dmr3321202637.42.1773415022008;
        Fri, 13 Mar 2026 08:17:02 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.254.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebaa4338sm2047210a12.15.2026.03.13.08.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 08:17:00 -0700 (PDT)
Message-ID: <62027e78-4b7a-4b94-a51a-13a9ae77b722@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 20:46:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
 <hfuqu5uwjuh4ie55zwaqqbsflhf5yn55hnjva356nivoq46m2i@o5pkjnfrwycq>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <hfuqu5uwjuh4ie55zwaqqbsflhf5yn55hnjva356nivoq46m2i@o5pkjnfrwycq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 443hLNlpx6zx5P-mO1Xpyf7tj_J-J5j9
X-Proofpoint-GUID: 443hLNlpx6zx5P-mO1Xpyf7tj_J-J5j9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMSBTYWx0ZWRfX/ECG9C031f54
 kN4JNaedRjSo8gyEV7I+ggrHqkZy/AK3FKXAdA+CRgVNYLF1lIWEXk9Mzk+0p8Iyzkif9M9baZi
 a8izfPx4mSh+ys36iabdRP7bpdlpka7jAxsDBjmIu6in4DJJ1SOr+2DqqYLbLsryvtny6pi1sIT
 epYspulPdl181KFypnrLr5qut7tb7dVHcSBf069GeTfX71tHiI6ro1460uZLW/jGu/FjUmKSZbv
 H+o8hIK1mykkMK+SICv9w2i/2+kQPiYOXDxIqfP6wQbKqkY5AS/OUHfXy3q7I4MPYRHNokritPG
 E7+rZK3ZmL3PMTlN39SafHDUv/c1W/zQmLfwAOgeCuLR4Foe4dBEuFlVcGRPRe7Q4uD9Xdp4nsE
 FDOWII9ZKCJ7lmRz3pexl27R3NxrZKqU2qOhbt0J7K8JyIZfPVWyfYy9NyCt8RZB1qwZYOn/Irj
 pRj7xWNZhLtn5sFJMiw==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b42a6f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=EbT04XG53EGSLiegdi54Hw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=H73U6gjSJfwdDiR_EpgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55708-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.30.132.128:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22F3B285D71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 8:32 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 06:49:35PM +0530, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>    (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> This patch depends on
>> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>>
>> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
>>   include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
>>   2 files changed, 272 insertions(+)
> 
>> +
>> +    video-codec@2000000 {
>> +        compatible = "qcom,kaanapali-iris";
>> +        reg = <0x02000000 0xf0000>;
>> +
>> +        clocks = <&gcc_video_axi0_clk>,
>> +                 <&video_cc_mvs0c_clk>,
>> +                 <&video_cc_mvs0_clk>,
>> +                 <&gcc_video_axi1_clk>,
>> +                 <&video_cc_mvs0c_freerun_clk>,
>> +                 <&video_cc_mvs0_freerun_clk>,
>> +                 <&video_cc_mvs0b_clk>,
>> +                 <&video_cc_mvs0_vpp0_clk>,
>> +                 <&video_cc_mvs0_vpp1_clk>,
>> +                 <&video_cc_mvs0a_clk>;
>> +        clock-names = "iface",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "iface1",
>> +                      "core_freerun",
>> +                      "vcodec0_core_freerun",
>> +                      "vcodec_bse",
>> +                      "vcodec_vpp0",
>> +                      "vcodec_vpp1",
>> +                      "vcodec_apv";
>> +
>> +        dma-coherent;
>> +
>> +        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
>> +                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
>> +        interconnect-names = "cpu-cfg",
>> +                             "video-mem";
>> +
>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
>> +                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
>> +                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,
> 
> It think we still haven't settled on letting iommu-map to have several
> entries for a single function.

I have described the hardware aspects in the discussion [1], if there is 
any alternate way to handle this, we can discuss in the same discussion.

[1] 
https://lore.kernel.org/all/21fda4d2-72e1-4e5b-aee0-a799886f53b7@oss.qualcomm.com/

> 
>> +                    <IRIS_PIXEL &apps_smmu 0x1943 0x0 0x1>,
>> +                    <IRIS_SECURE_BITSTREAM &apps_smmu 0x1946 0x0 0x1>,
>> +                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1941 0x0 0x1>,
>> +                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1a21 0x0 0x1>,
>> +                    <IRIS_SECURE_PIXEL &apps_smmu 0x1945 0x0 0x1>,
>> +                    <IRIS_FIRMWARE &apps_smmu 0x1a22 0x0 0x1>;
>> +
>> +        memory-region = <&video_mem>;
>> +
>> +        operating-points-v2 = <&iris_opp_table>;
>> +
>> +        power-domains = <&video_cc_mvs0c_gdsc>,
>> +                        <&video_cc_mvs0_gdsc>,
>> +                        <&rpmhpd RPMHPD_MXC>,
>> +                        <&rpmhpd RPMHPD_MMCX>,
>> +                        <&video_cc_mvs0_vpp0_gdsc>,
>> +                        <&video_cc_mvs0_vpp1_gdsc>,
>> +                        <&video_cc_mvs0a_gdsc>;
>> +        power-domain-names = "venus",
>> +                             "vcodec0",
>> +                             "mxc",
>> +                             "mmcx",
>> +                             "vpp0",
>> +                             "vpp1",
>> +                             "apv";
>> +
>> +        resets = <&gcc_video_axi0_clk_ares>,
>> +                 <&gcc_video_axi1_clk_ares>,
>> +                 <&video_cc_mvs0c_freerun_clk_ares>,
>> +                 <&video_cc_mvs0_freerun_clk_ares>;
>> +        reset-names = "bus0",
>> +                      "bus1",
>> +                      "core",
>> +                      "vcodec0_core";
>> +
>> +        iris_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-240000000 {
>> +                opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
>> +                                <&rpmhpd_opp_low_svs_d1>;
> 
> It's a DT and not the schema question, but please cross-check the OPP
> points here. If I understand Taniya correctly, we should be using
> corners from the PLL type rather than from the video_cc clock plan (they
> differ for some reason). Downstream videocc driver also should have
> correct rail corners for the PLLs.
> 
>> +            };
>> +
> 


