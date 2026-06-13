Return-Path: <linux-media+bounces-64753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KItrFdvgLGoaXQQAu9opvQ
	(envelope-from <linux-media+bounces-64753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 06:47:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41367DB2C
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 06:47:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FbdGHNk0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Eij5fCpI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64753-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64753-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 993CF319D344
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 04:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDD032F749;
	Sat, 13 Jun 2026 04:47:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7242C24A078
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 04:47:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781326021; cv=none; b=boD16Au6ZfOxHzHQlsE5kBAEz1mQQoJ2omAESoc88P3TC0ThH5ASkSxGYdNCakDjUfZ4HbUrbiS4gpa3w58QsaSsvSA/N1Nlb5BKgcrUI6aT4x6ttfS8HP48iaS8u/tZP5llPy2CD1TRaLzDQU4t6pTwOODCmBIp5OMJdtEu+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781326021; c=relaxed/simple;
	bh=Va3NT1tqZbe5IMgKWr3GK0oOwzn3cWko4YKcItDxgYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlAVXOL/woy+GGDIcbKRGEGuJDS7qUCncQaxUUzMrZXYmdOdxC8QlNT1MswM+V4k/sSeO7N7kqkOG2zzStoXQLaNMHGRbjwNgtRvu4uiZ+boFL7ahV3KysD8wxD0rH1vGOQaUfUsSWTC9eXNpnFCst4PvY8Mwrm6eOE2ro1+f3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbdGHNk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eij5fCpI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D4dbnt1519957
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 04:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=; b=FbdGHNk0J3dmTF7E
	VbQOfepA/30dcFFN0K2Pz+a7TZTVL22LrVnCHKwb5WTNq6hXW+woyk+osv4XI4+i
	nf/o2NnppS+JkMLl1xOrxMjvVHirBcdYkmMu9YI7Len5y2pRp2v19aHRZlR6Ph5f
	gkyfvYO7LzTNC23um3t0QNvDuDuJIr3qYRSP7HgkkjlMmt+628mNI71JcF3HEpye
	dUEu5ltfJnQVrSU4oC3RAgda7qx20KjVjQ0J6zKbZ2k8puErNnYYn9n3fA+SuHNj
	YT7FLed7i+PdajDeJ4/Q+9lp+rb/mzEqwWx1RxjgG9p5/X9mDhwYgDxt0lL+Ddce
	5mjpRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgg0fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 04:46:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf3636d6c0so16252975ad.2
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 21:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781326019; x=1781930819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=;
        b=Eij5fCpIzO465x1E3lLBbbV9idvsDJncQyn6otR1fiwEVxKD6v6pZGs1IKrKVg7Ckc
         SM/UdhcGpUaOKXZKYzaxRrIrSJ2NErefj4G8NAa9IwUoa56FnGgMfu9IpFbxCb8rvn89
         82XwnJx8a7/urAFZl/a8FIcWn9ThiJBMUBzwUFrfbe2kr+fCaoXdnjxwHJdm0aRXdvDn
         3PUf6Ep+biWpv1iHa9DBbsgwyAIu9PP11/EjaVEnOi4iySxUbwGIepGf9Dz35F4Vr7bM
         4KpcqG8LVBp9YLpoVh06hwSN/l4PKYCNJjbjCz4ChOS0wneoeAToNCWonJUOa6d+x+ss
         fDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781326019; x=1781930819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=;
        b=ZnvArORXulpajBoW19JyRDDmTQzs17NOSDgykNBg4cMpOJ8nFY1IkMozFpni0x3XWV
         Blhg3imbP2waLGxofJNm8mqgdYqyy9Ih7BqiuE24wohgFXNouOOjTzIPegF6swpKrUiO
         +rBm2uTiE9DRYlCb0V8DB0ZAYsZSYmJ/BL8ZeMrzll2e0UKiSlliIGaWAJtSRKa8Mktu
         B/5prLpLjvC8P4tMijm8aggGpIasGu3DfLrrC1AhL9vi4QlCAxWKqPNib6/7DqO1JMbY
         B0xTz1kDC2tauUig13b2H0oITW+h59B/wbfywcsoA/jRmM9LG016SN22eK30r87I26m7
         f5Tw==
X-Forwarded-Encrypted: i=1; AFNElJ8xf6l4gHMSXF8fGmdc8Qfwv1Aqr0uBpsKKfgZ2JYtalFzt8O2qyGa6i45W3iI3vzt16FPIKa45AYH61Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98e0dacIZvyBbit8ALiCJReigkL2DFJ/BVAMtHY7eTPV3T8Lw
	yFuzvLr8cJ29dEyuwQNBh+mzKiP0PiNUdZWvB/6er01XrILoFWLN/jLqeP+mWED4K250z7hv5mz
	oyGwM5D0Het5AdETow1A1Q3EsFVagk5hiSltTagOJkkmBBvuTpvrh05jFOOsvTWBZbQ==
X-Gm-Gg: Acq92OFFMiU4btCTowxUCOqM/9e7PU0ItcPY3a0HxIjTnc64gom1v+b9iLr7BHCBfbo
	22hoSt/bPsO7anOZUzOZVY2A3jr+GncPlnOC4nP7tWGyS7G6NXIL61wWk8/40BAXSuqtlRPOxgU
	EN2UjCYLVtSEVUDa7dnPzTPidWuXcLBacchCIlL2iTAwc7V/9knKCJ0QyNuETKQ9u4Di3o9KD3f
	hMp/qBLOTFj+icWwiv/mPik1ZZjVEu79+fa18acRh+n2E+2p07Oxz+QCAa0z1pDUhaAkVy/rnbA
	E0lROe1nQn97pPalCYtsUgd9SVGTf+apVCqbMWGa/AvzBJtO5YvLPYiHCN/pOqRJEscvYzKM827
	qsFMH5chQmcAMv2lN+MoVVbMH0XQCjqyNayBu7klym3kRe6TxRdg=
X-Received: by 2002:a17:903:3d0e:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c4110b38d6mr61050715ad.11.1781326018942;
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
X-Received: by 2002:a17:903:3d0e:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c4110b38d6mr61050515ad.11.1781326018461;
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8becesm37162965ad.56.2026.06.12.21.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
Message-ID: <83594a83-64ea-4c52-b0b7-fd0070f03f04@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 10:16:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
 <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JB8y2CJrRhW8bgFphNwFapB_OK0qRtm8
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2ce0c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=iljdq1zszXl5pgKHGr8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: JB8y2CJrRhW8bgFphNwFapB_OK0qRtm8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA0MiBTYWx0ZWRfX90LL3sRKRjum
 00uPTgOIyGNQ+P6/eHQd+itFpD4OM4zIULCsumTqKsYKd7eanlUyyw9yjs8f/+49ETWVeadKxuW
 hwW3axaeX8cHYOSJHpBziuKnv5xcom4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA0MiBTYWx0ZWRfX/bmHob0vSOUj
 AMlzWtQT6SnCdTqWrNRso6qgq9r0mJgsFMqRIe65y3v/jCp8Pk7hS+CdwhqFjTlFU92CUjtLLLc
 zDGEALs9klIVbSuJ5hgFXWer39vfrDwAOdbDgcGaQFcgeeeBlLux7pTGGTQr+IRixwDEzqTbjrd
 /ffDHt2LbdiC3yvwUBep74cdfca+3oOuCnidCEgvex/Go3bHP365imITO6emJwHlN/GL336rGHG
 hGqz7sQI8V3BkZ52tJwPtZZc+SKLq3d3yvmJETNBQ6sHFWnOtIfad1tkMddYvW0tEVtGTKLsVwI
 V9U6ozrvySkZIyyLGeNoaYASDGmT2Exob6NKD3/8yQSMmaPvt4a9BTdxhoXksbtZ50ClZtmjS0J
 IAWYBBAzG7tGi9iAP94IP8i9uOm0rE/AahGgCVKPD1/5VqUhlq3NleMFihKchagde7sqIxOeWf1
 ZxOCFf8/eehn16A/ICQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64753-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB41367DB2C



On 12-06-2026 13:40, Vladimir Zapolskiy wrote:
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <0 1 2 3>;
> 
> The numeration of data-lanes shall be started from 1, this has to be fixed.
> 
Thanks for pointing it.

Will fix in v3. On MIPI D-PHY, lane 0 is the clock lane, so data lanes
must start from 1 as per video-interfaces.yaml binding spec.
>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    }; 
>> +&tlmm {
>> +    cam1_reset_default: cam1-reset-default-state {
>> +        pins = "gpio33";
>> +        function = "gpio";
>> +        drive-strength = <2>;
>> +        bias-disable;
>> +    };
>> +};
> 
> Since it's a mezzanine specific pinctl assignment, it shall go to the
> correspondent .dtso file.
> 
> It's a concidence that one .dtso file is good enough for describing the
> mezzanine for two diffferent boards, but let's exploit it by keeping one
> dt overlay file as it is now.

Agreed, will move it to the .dtso in v3.

This also eliminates the identical cam1_reset_default block duplicated across 
CQM and CQS board files.

Will incorporate this for the IQS dtso file.
--
Regards,
Nihal Kumar Gupta

