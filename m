Return-Path: <linux-media+bounces-54394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m4FrOW8vp2kLfwAAu9opvQ
	(envelope-from <linux-media+bounces-54394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 19:58:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6A1F58E3
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 19:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF78C301AAA6
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 18:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E739437269D;
	Tue,  3 Mar 2026 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgQ//7No";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZjGzShsN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3577C372687
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 18:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772564332; cv=none; b=LHNfGjGe1FbTvQ8GpV0h1QVP977H/8x0nXC82u10pje1dfKvBgA+7WlsWNYp3dTNZpcRKs/0O2x2qBZzZwU0JvQoPRN7eiofcowTVkVBUPG4w0MUcWYqchAKa46M/Ul0GwNMOl5x0UJNIk8ZbOkmcHuLorpXbK6u6F0COt4h2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772564332; c=relaxed/simple;
	bh=ctNiVpFgI+g5fqJUA1lUqb0Ck7ixmxvJ2X+MG1TYJgM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GLAVWMOmNdC6CuOMiL1O73/HeVzC20+7yhmY4Br/OAH242xXdxUtB8SjZF+HmvTXPWsA99FnxppU0iSvF1lw4EqGlVSWicR8iL9mNIYrInsoJAGLMMw8NAna75bIEO2mj4LiWoZFeXez+lFqIcD+udqYYzoAxbij7DGmmZ98YiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgQ//7No; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZjGzShsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0jos087596
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 18:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mgXWrJl2w15tZkyYqMKFf/LP5i6WrIDM0ESMOQGxoto=; b=CgQ//7Nok6T3aEgt
	PGktN55Uoj9Ru54AkNy0t9aq0Zu4p3TcCRqKt6Kk4yUeP2xY/PuOuQhlrPxk6/jr
	3czisgKC3O6nkKPNUaoHZZmxVaE0MCNIH0BEPYaCWyeOD86odHSgmH8ItQhXDO5Y
	Wno40z9PRcJmCseObtnt1Cg+ncbPVLMQoJL+MDn+HLvVHlDtvIrnbKXZNgzFSNPD
	SwVPApm5KfHR1Qwoa2c7zFhIRIEDZ1k8OWTHX/zhKfdqgjK3zq8/W+tvRpxeqKV+
	5TH3DGzbnLYyX0Q1vna+CdoHPw8gIGzhR6s1JfJBJ32NNnLUAX8jiJ5PJ0gojVPW
	MYwc6g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsc3pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 18:58:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12734af2ca4so4745076c88.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 10:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772564329; x=1773169129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgXWrJl2w15tZkyYqMKFf/LP5i6WrIDM0ESMOQGxoto=;
        b=ZjGzShsNR8fA+rfJuD7RnNxgcU5s/C/3Q3mZKdzak0Z8gpjvNKsYolyuzhB4n95YmM
         gFDQkiq+A7wozA3yiRmnlnwBOj2j0RwYX2ap8/ag1o0pO4mW08h9eM9Fp1XAsg0SSJna
         EFimX+nih4/LAsLwkA/o8SnBSXI6ixlGtSN1KhVXdwD0EV1r0g43Myr2L/ph54FO91oz
         5ZfciuZ6kS1xi2nwJGC4YjGA30LP2xqq92svZ94JwTYBGi9I8r8jlgyMCLaRLiSzA+PH
         8Huv9MtFMS/tMogCaCqxoWxgtCc4gn2a2mvbFCTd3vQcV++/rNsi+botv0DvKoW8+scU
         bX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772564329; x=1773169129;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgXWrJl2w15tZkyYqMKFf/LP5i6WrIDM0ESMOQGxoto=;
        b=MS8miK7LP/cFpBx6rnvASRtdBB0lw+tDzMNHgFkfzU+0mPWFw3Of5jnFntec43Oe7B
         t9M8yk8VN1yA6I8Jt4ukZQ8FUZYLh1tkJgi7bJ/8MKAx599AxWnaWyjK+Jp/nQIIx5P6
         Ek9muBhgyQCTjIn7KNDhMTSJsFGdiJ+cCtRw3F8GIQighHWxFrUp849mfdNOy6+DPTdk
         yWGEYY71U6ssES5E4XRn2MWHw0qf2WOp8KX6pJ4aYaAbh1PRzOiPfUsJrgK/uKyaZR1f
         NDxw3UorqGMg2gRXWIsmO2M52iec1J8k57XHvlkhFxsZ+OLC90WvdVKPEt3ed4rJ+1af
         Az2w==
X-Forwarded-Encrypted: i=1; AJvYcCX4CPbT4hBlRCPJQP4SDPIh9xowwlGL0rC2+BnYUWTGWCaiFAoxeak16hRW1R39ZrLyElAtCq3w2LrzPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykH2IDX0ZIjcpIXSAhKK8IaTVFijDPB/0lOPbk/VyZIo8Put0t
	SERYZSdVRDJdn7ZPl0lhH1sIBi+l/NSlrW+4Bq6XyotLWfVTZwh63kBxiRzT+n4Oznu+JfkLvdq
	Snu22nH1UAIj/sPIuDwYJxJ4iin9gmEmP5PW9/ZcQfUOSMJkl6iiB/48CLzGu/PKIVQ==
X-Gm-Gg: ATEYQzwbmBFtjKSudA8wdIyp/zs5X0bFNJhVmJUjX6txfOLtlFTkFbKzAccbe+H8l5I
	bfoUU7Tmdi8CBQedBVNkkt7vEWLg3L9GRadd1B7l6FqWC7jA1BHGlOWFc2sQLx2H7d7XKjS+ZLA
	WNjzwwRdj3ra6IFibY6416tVg0Z5KoW2pYxFuw3DGyejFPCjTFF3iVM/jNBhzWwehp/5L4kA4lE
	IIAzxwD+O3SXs9+7ds7ojBowEkAoczyKcAU2tX9W5A6FfK+Eda+95kKyMFyfWEpB5kr6mgI13fC
	X/RborHOYAS2C/PBrO1j1N0cTDVnwKz6q4nAf92RgQqKl/DOX07hmRSio4uORaBY2qVLUD4LcY3
	/d9UOWVj0NLTy5h42mvqddS0h9u7sC5GZqFSvmggrP9YQWPzfec/oNIhFDxlAO7xvN1C8Qu4W0K
	bu
X-Received: by 2002:a05:7022:127:b0:119:e569:f875 with SMTP id a92af1059eb24-128b0da99a8mr1348148c88.18.1772564328549;
        Tue, 03 Mar 2026 10:58:48 -0800 (PST)
X-Received: by 2002:a05:7022:127:b0:119:e569:f875 with SMTP id a92af1059eb24-128b0da99a8mr1348120c88.18.1772564327940;
        Tue, 03 Mar 2026 10:58:47 -0800 (PST)
Received: from [10.62.37.55] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a5312dsm17177876c88.16.2026.03.03.10.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:58:47 -0800 (PST)
Message-ID: <2a1155bd-7dc5-4ed8-b1eb-ddfa483c75ca@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:58:45 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <4pFL6wOeTKUt-Zq4YbjqJdacMgUIPSYJD-4-5DcIMEZ1sM7JsNFYcSv1bd7ZRVOklTsmkEfxM2b6tTflmiECNQ==@protonmail.internalid>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
 <4440a3a8-7281-4bea-bb84-7a9d19ef7ce9@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4440a3a8-7281-4bea-bb84-7a9d19ef7ce9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HV-LsPHaVP2gjKtAdm5BjlV7xUwKN5Nd
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a72f69 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=SNpfbsHd_ZTzF1W5vAsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HV-LsPHaVP2gjKtAdm5BjlV7xUwKN5Nd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MyBTYWx0ZWRfX3+qjy3dmNKRN
 chMVOKvuzWezMQI5OXvUp9gr464gNSWJaeTFF5NccYsj3z9HTMNhKZrlnX1tAR/HAvGi1OZCcZK
 sjoZhTbBZxkC6DbKGQR/8ITACUdRGlbA+nIQrPetD/e8hrDKKmABXxz39R1d+0v2YvlPNQNm9uP
 pctflFtPbeS7KFO61JCKMGSC9dxTsZrsangYkM7LKMln559xaGXIlNtU5/d9xbGaMGMPaT8FfAP
 CZ/ugLHNLDqjRAlLigwOawcbNWta/cph1e5yn3sozLAxGB12HscmFg5vPXkVXkfAunc5JCLrE2V
 iOXcczDm8MH7HHxPvXYzVx3YJB7EDBuV0NuZU+ejaVm2+eqbbmm1z4hm9wf4YO9NHDLV+o/3qC/
 9QaymzWbnQ7L1X93lXjWi9E0tMIgC09h3W6Ku0gnGW8Xgp/Bnc0lGINU2qCfp6gt0vrlcVFnoz7
 Ou2A4FVeHqIUOma1LEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030153
X-Rspamd-Queue-Id: C7F6A1F58E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-54394-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ace4000:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 10:08 AM, Vijay Kumar Tumati wrote:
> 
> 
> On 3/3/2026 1:27 AM, Bryan O'Donoghue wrote:
>> On 03/03/2026 01:51, Vijay Kumar Tumati wrote:
>>> Hi Bryan,
>>>
>>> On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
>>>> Add a base schema initially compatible with x1e80100 to describe 
>>>> MIPI CSI2
>>>> PHY devices.
>>>>
>>>> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
>>>> have their own pinouts on the SoC as well as their own individual 
>>>> voltage
>>>> rails.
>>>>
>>>> The need to model voltage rails on a per-PHY basis leads us to define
>>>> CSIPHY devices as individual nodes.
>>>>
>>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>>
>>>> 1. The ability to define on a per-PHY basis voltage rails.
>>>> 2. The ability to require those voltage.
>>>>
>>>> We have had a complete bodge upstream for this where a single set of
>>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>>
>>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI 
>>>> bus in
>>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 ++++++++ 
>>>> + ++++++++++++
>>>>    1 file changed, 114 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>>> csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>>> csi2-phy.yaml
>>>> new file mode 100644
>>>> index 0000000000000..c937d26ccbda9
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>>> @@ -0,0 +1,114 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm CSI2 PHY
>>>> +
>>>> +maintainers:
>>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>>> +
>>>> +description:
>>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI 
>>>> CSI2 sensors
>>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and 
>>>> D-PHY
>>>> +  modes.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,x1e80100-csi2-phy
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#phy-cells":
>>>> +    const: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 4
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: csiphy
>>>> +      - const: csiphy_timer
>>>> +      - const: camnoc_axi
>>>> +      - const: cpas_ahb
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  operating-points-v2:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  vdda-0p8-supply:
>>>> +    description: Phandle to a 0.8V regulator supply to a PHY.
>>>> +
>>>> +  vdda-1p2-supply:
>>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - "#phy-cells"
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - operating-points-v2
>>>> +  - power-domains
>>>> +  - vdda-0p8-supply
>>>> +  - vdda-1p2-supply
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>>> +    #include <dt-bindings/phy/phy.h>
>>>> +
>>>> +    csiphy@ace4000 {
>>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>>> +        reg = <0x0ace4000 0x2000>;
>>>> +        #phy-cells = <1>;
>>>> +
>>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>>>> +                 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>>>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>;
>>>> +        clock-names = "csiphy",
>>>> +                      "csiphy_timer",
>>>> +                      "camnoc_axi",
>>>> +                      "cpas_ahb";
>>>> +
>>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>>> +
>>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>>> +
>>>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>> As we are cleaning up the PHY device nodes, we should consider fixing
>>> the power domains as well. Although TOP GDSC is defined as a power
>>> domain, it is not the power source for the PHY devices. Rather, it is
>>> the MMCX, MXC and optionally MXA based on the architecture (Refer to
>>> 'Voltage rail' column for PHY clocks in IPCAT). 
>>
>> Feel free to send me a qcom laptop and I will :)
> :)
>>
>>  From memory though I _thought_ only the TOP was required for the PHY. 
>> I'd be grateful if you could confirm yourself in ipcat.
>>
>> - TITAN_TOP_GDSC
>> - MXC
>> - MMCX
>> - MXA - first time I've heard of this rail, from memory I don't remember
>>          having seen this in ipcat when I could do so.
> MCX and MMCX are comminly required power domains across the PHYs but a 
> subset of PHYs have the dependency on MXA.
Actually, it's a bit more complicated on this target as 
cam_cc_cphy_rx_clk_src also depends on MXA, which means all the CBCs 
connected this RCG do as well.
>>
>> There is no
>>> parent-child relationship between the TOP GDSC and these in the clock
>>> driver and it was just working as the required power rails are getting
>>> enabled by/for other MM devices.
>>
>> Well only the GDSC is supplied by the clock controller.
> Right, GDSC is controlled by the CAMCC to suspend the subsystems. But 
> the actual power supply and the voltage rails are under the control of 
> the RPMH. So the clients need to enable and vote for the required perf 
> corner as the core clocks scale up/down to be independent of the other 
> subsystems sharing those voltage rails.
>>
>>>> +
>>>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>>> +    };
>>>> +
>>>> +    csiphy_opp_table: opp-table-csiphy {
>>>> +        compatible = "operating-points-v2";
>>>> +
>>>> +        opp-300000000 {
>>>> +            opp-hz = /bits/ 64 <300000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs_d1>;
>>>> +        };
>>>> +
>>>> +        opp-400000000 {
>>>> +            opp-hz = /bits/ 64 <400000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs>;
>>>> +        };
>>>> +
>>>> +        opp-480000000 {
>>>> +            opp-hz = /bits/ 64 <480000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs>;
>>>> +        };
>>>> +    };
>>>>
>>> Thanks,
>>> Vijay.
>>
> Thanks,
> Vijay.


