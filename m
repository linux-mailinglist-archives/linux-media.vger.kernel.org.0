Return-Path: <linux-media+bounces-51371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP1hAYDecmmNqgAAu9opvQ
	(envelope-from <linux-media+bounces-51371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 03:35:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4C6FB01
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 03:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAD0B3024183
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 02:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B7132937A;
	Fri, 23 Jan 2026 02:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoFjCCue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjIW0Q+6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13F344055
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769135449; cv=none; b=I3IvgBD8Jb7r0BtNdCsToxdA0u9xHrdIDK7tM2k2bFB8jz7EubrWh8ApirIy42cDmtrY7JrGjF+H1a3FGEGP3Y/rdWrZJzcDrMRfjn+x675Wx9EPugyI3TNLgslNNA1aowpmO8W8jDDG/DvPqtsth0YV75HLrvLEz73kMrPIvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769135449; c=relaxed/simple;
	bh=TB1IK3oxKC4Pvn5NMkqqLOWwLoygWYshus/E1Z/h6SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Azg4cnbQnz1GMEcdVASMjpmaJqQQHndBBsOEqF1SSL4Ol17tpI+df4tl/Km5cUNB+ahbajQaC3iJhbblkETKEe0WuofZwR6sEbTbf8tPmTn4T5QZzd6jvQUtMkKDVeaTwiWzGzGIPl/bSckmhP2Tas0C8l1Oj5ZbnJleHpLRvkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoFjCCue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjIW0Q+6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7deO4008897
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 02:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=; b=NoFjCCueJEZgaVON
	oTYHY1xKusFZTAAGOfDvHh1T89z90P/vVKRwm2GTje2RPIicO6FGSUsoIMCnlfx5
	2RcDG+k7xgfdpNu0S5ePAd5svYiLbkI86pytAD2+HRqMzJ3LGhOKexJ0rhJlVx26
	+EtJMyIvPBjizO1lA9tUvy6rstRp3YhKMPSc4IA94nYfPOAv/h/wayDMUUtO74hl
	d7mRiYJrRskOFtB1LsItq1Qt5qB+UQcQFjg/jknO6j5MTvq0hJBEj0iykgWJIQV+
	htRWlDjT/vqQG0q9TjA8RS6vNB3qy9mDqypOOVH5cv/p0t9QtBtpXm1E+qan6+n+
	uKT6qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198] (may be forged))
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4but2cs0wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 02:30:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50146430e1dso41072441cf.3
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 18:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769135414; x=1769740214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=;
        b=kjIW0Q+6iIHqSj7jc6XzMpshl1ugnnQtAWeeJUhZEetQNR//snqeSLI5nOTTIEhi1/
         0qx00kLUDt00aMNJPgLO9QU1MYQRjNu66JDb7SDCr1AdW2hQMcR0Fch0HOX040Url76m
         /ciX7wb1YxbyD/qc4A/M/flwInlq1k7G1gx+ANVnxFCqN9OQe2mV3GPDTF8udbS3L6Kw
         6TPSr0dpCj7L99cK04iKdvwBHN375KrHbivXgKihLEqtatUBx/TlAWKAZ3PUqtupt2Pp
         pT90B/zF5q8jtQh+H5FkTgKhZA6otHmPEyZXXvn4/Kg/PCMM3z5ORaXGSSOSKlKkebd6
         Qbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769135414; x=1769740214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=;
        b=R7uES5Yrzuu0LyajnfXqK2kGWKwGJnjNDHDuSH2dV9ydDL0CodR621g8vVKaXw3QBA
         zrqljEXFndPaQ1ExO2M0hPbUTx6q5CsehPzZFm3CdKG+NT2ASmtIB12HnirkrtEYdPLG
         ci0fQZjOszateoNdeaJ4ZyBpKN0oOcSyBSFgV/u8axT7wNIkzeJx4JSP/7YFEqXXVlkf
         BU2np8gZfy+TlG0dEZOaL/g5wD6mJNQCnwW+qiDOA2+c+60JFmETFHaqsBmQsMjq32qN
         5S3uCF7rMeYukVaTYuFhKByw0SG7OQQ0Sowy7JmWCDmY/HboZ0YWa7Qg4a8i4aFFjwUu
         viQg==
X-Forwarded-Encrypted: i=1; AJvYcCUBioSjwWnNdIeoLM1i3F8jU3Wp9vHjlwpLfrN6xojvFDTTTAi4V+muAx5ePP4Lknj8o7bYUdLvP+0EOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcrqmbhqvmwP6PEWoGvdXVxFPbeqWg8bgy8JHRATMUo6bEugrM
	13ua0W7CVAP2t9z0u7nhvWjIqKz0ehXE6CR8iwjM+u2uyrYx++ZHJEkNciEH8RLVJ/HLdCICnY7
	SRgdZGJWMwmG+/Z0CJm7PFdx19K2LOyr78bPikiydMMdBnedZwuuNQzLYuFxQBIQxuA==
X-Gm-Gg: AZuq6aIK+phf5EXGXi3iGoIgydC7uYkcWOYXQYH9fhckctCOP6iu8IkN+58zGi/tFa+
	azPiPzRXhRkpLO5ppPSH3j61F4XQ1dmB6sgLHHBvtgIscjxfgngodaknOvfjoI4Wbq9QfChbTAT
	dIurNZQmqDx0EdV5FI8Mgkr6YNLm0akn4oQVD+dqbGZr/OuURTrYdmqMltcCz9haMD3u/lv5cmu
	Kek3+dP6yEH2kCiutp7SnsS+E1q4PVcd62x4bHxfaRDnjLQVTHrLuNbv+8NT+atYOPeW70GRzer
	PzdzOILAEYjqDP3YuhlRFILrmdEPmXb+p01LoKlew7unczUEGekBuvuvj3bILNCf386tJ+XHgjV
	3CqZv0+jsURJJkn0qGCtneexh6cdiun7homc//78uyT9ImXe9fdECyl5gWbsVcgoUcEO/LQO+Xg
	==
X-Received: by 2002:a05:622a:10f:b0:501:4236:5474 with SMTP id d75a77b69052e-502f77653ebmr23040681cf.28.1769135413662;
        Thu, 22 Jan 2026 18:30:13 -0800 (PST)
X-Received: by 2002:a05:622a:10f:b0:501:4236:5474 with SMTP id d75a77b69052e-502f77653ebmr23040251cf.28.1769135413099;
        Thu, 22 Jan 2026 18:30:13 -0800 (PST)
Received: from [10.111.171.243] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7ed650bsm7054291cf.11.2026.01.22.18.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 18:30:12 -0800 (PST)
Message-ID: <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 10:30:02 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
 <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxNSBTYWx0ZWRfXzfDjUrJqVV6H
 ntcyeV00T3jHrzXtC9VdUzwFw0kVLPfnho/aaeUTa5a0uVeSRn4ZeAEiWpsSsdvJIJA30F7kQA3
 i8+ZsII6yyiPY1ih8U1JjWtkGefxoh3AaI4BLhe8dsJ9NxUYG7Jhsp46Sc9eh4RcDgC45JwzB/E
 aQ+8gbBTbCFye+PvyAs5VvpUHsY+JhIcldYwakTx6QhK4ByUfL+CvQdWGMG0Q5Ie0Ycvv69N6o7
 xutpn5qaJu+bL8OAef2f9+7xfTm7i8MKW+RynieMSzkFO3+6oUKXKaM4rCasIiBt2Op3RgqZaP3
 PTOjUxjQZou8cLcDEajdaLmF0X2WGQixdfMbbha9JhIU9ur/f1ot++8d4UzXbOHQYQH0Wh1fGAi
 yaC2u1RM54h5eGr5SOamEvQNyumVXygGF+t2+0p379/E4l3EFHKiAI4CrWmonbmOlXO7eS/PIsW
 AIMSFg4jykUQE22vQVQ==
X-Proofpoint-ORIG-GUID: LPADePM3Kk5SPTLVxNKGTTP1CAcdsX4Y
X-Proofpoint-GUID: LPADePM3Kk5SPTLVxNKGTTP1CAcdsX4Y
X-Authority-Analysis: v=2.4 cv=YuYChoYX c=1 sm=1 tr=0 ts=6972dd44 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=yKNFHEXJphivSBQIcCoA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51371-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1a:email,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72C4C6FB01
X-Rspamd-Action: no action

Hi Konrad,

On 1/22/2026 9:44 PM, Konrad Dybcio wrote:
> On 1/22/26 11:48 AM, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this DTSO has enabled the Arducam 12.3MP
>> IMX577 Mini Camera Module on the CSI-1 interface.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&cci_i2c1 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	camera@1a {
>> +		compatible = "sony,imx577";
>> +		reg = <0x1a>;
>> +
>> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> 
> Let's define the pin settings for the reset pin too, otherwise lgtm

The reset pin on the Talos EVK board is different from the default. Do 
you recommend that I define the reset pin's pinctrl in the Talos EVK 
board's DTS?

Thanks,
Wenmeng



