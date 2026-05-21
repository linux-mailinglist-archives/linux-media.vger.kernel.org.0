Return-Path: <linux-media+bounces-62502-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCmcCLsMD2omEgYAu9opvQ
	(envelope-from <linux-media+bounces-62502-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:46:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850D5A631F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06CCC332CD61
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369143D75A0;
	Thu, 21 May 2026 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Japs4Eg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtkDUmID"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E9242D7F
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369779; cv=none; b=qreCv+Mh6CEFK3DAG9K1OyPSvIXWWY1a6yeZqzbBsD3NipcKR+25Lq859YOU2fmlsU60+ClAnJC9utNr230Wc52hRLOIyJQKvdLipYFKx1zniXZqiUEj2qWzSd85anwMQFjFlgEquL4hwKCrS8obF3n+3XIp+E2SS1p9ycxiU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369779; c=relaxed/simple;
	bh=3kCSpWp7FEEe9qEqd4X+TLbKQl0Y5QozlIhOMd/nusA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDCHwIfSY+WVot5idGfjncHfCQmuM+514D5xpyJrGacX7siA1h6QOJ3vcaV/+C1l19pyjUxmwMitm9tjXW7x025+OarGq+opXJhmek9pOihE/8pH9eMWZ2rXs7xe4tr80nrC18Dt8pcJ3XcwYaLIrxxND1ykT//x2Te6uyCqksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Japs4Eg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtkDUmID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A8A32633750
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zaKcAvTC/3uFVMXucpCSenq3MlPmMHSE/2mwevUrtlc=; b=Japs4Eg2xjxzbrVO
	3xw2jfDUFYsCwMs//V9CP4nJqTekalHmUcQX/GOyoDo4NLOPkTe0Hw/s/CnZt1ya
	J9yH2slPZP7r3ji7HkGp/cC9fxZrNgJfYmODcxZ6R/WKE6jIat1OZAtIifFwYd4B
	i/Y0xuy7QtafwCiYDWwOxYhZgYpUhOCZnbpO1pbtu+oSp9Ifx+em5Ir22mcEWxo+
	HFS1yBxz+Hd1TtR/678TuML+4Q1eTNYD85HiPAO8+vQqFv49GbTMtQdNRBwoLKa3
	vxtmSlVgt32/nkGNFzyqzJPlNRRj0EyrCUcTdr4PBcGGF5ped1wvKNa1wSBRm5PT
	oNmX8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8d5v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:22:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-841127f960fso1210105b3a.1
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369777; x=1779974577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaKcAvTC/3uFVMXucpCSenq3MlPmMHSE/2mwevUrtlc=;
        b=VtkDUmIDaT7IoCNhlNkCbbu19ezVCP2U74VOm4hGNw5FYjdTY1KsWglp+925cRzLAt
         iiD8ybf7CIpB3CSh/FcRFWGfrTB0VLs78IO48JKaUtEbTZE94BhpOjpkOw8v5SozvpeB
         TB6DrJmA4fT0Ur+HKXWTE3HNW1/6BWmW2b3GbYATcpWHIywWwqOIsX0vulji2G8Ha9Bz
         7CQtJgITKCnG/ZfbJQP6UuAmJgLYJmVw16hX4BROmPqANMD9UBZCzfrHI1Pk8lU4/7X6
         TCPnrG6gGPaHtXFAy9wPfHu0tCWglSWBf1DM9I4LuBjUWb9ci/tEYQ90jwFxXFAc1XGZ
         4X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369777; x=1779974577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaKcAvTC/3uFVMXucpCSenq3MlPmMHSE/2mwevUrtlc=;
        b=B9KAtdp2sQHE7RGLae8DH++KBUBOxa/djjBTCFoSAYaJWX8MFGW+lVdZg+hK9IrhsW
         3CmC99P9MaN0MWy3/jk1Vd/XaeLptoa+tl3O/B3V6XMsV1Cl9qG8KxBzjD1GA7oHlrBq
         6ABaBohAAaOUk0h0iRvrr1J1FdtS8VXkE2joCTpfW/E+RUirKrSOz0vy9rt9CHqgXwNw
         N2gmju/19Pqp8+SqK11caa4ubXZiMG3WOVK9gUBjPWg0b8XNRG7kAmLdW7TBxaoxljpF
         OiZZUAu0fJ5YWRJrWq3/2yZdGLHsZsgO3ZfmP6EuNDk0/OfWpyFiqcCPVBbea2hfR6LX
         bWPA==
X-Gm-Message-State: AOJu0Yx+9M7B4w4U6JS8H10mB9/r6Uc26iGdIJrKhyPuxjwvaK1fArr6
	iBJxY2hVg//76OI3yYwORamb+DGpAVOpltmnBQBWtt7qM+Wq8yco5+Af1ykwtbkZnatCACdxhNh
	qm7aAXjUu3pcYZ7SYGP7Ruo0PWpaGYqBzp9S6IPgsOB432I7eQdHiNRVbtpsGWf27xg==
X-Gm-Gg: Acq92OG1xMMvfb+ASNans4HVEec+3A0vO7fq+0vaAV5XIoxNbwHdcAE0Dd8r4mqp9jC
	ZkVj4f0hBCE3tScvsOz/oag0FzxH66oQyJCaNFAYutVS2vdHFW6VKSMItDkqCsDmXKllF2yX2Ch
	XHkP98joqsWPjLKwl5fAiNfvgm57HnpuLNMCJhVitptVOoFxJZSmO57e9hjRnRq+0XAwmqpOqwf
	LTPA4/3sjgxukphp91FSnyIloyTKrI2ROf0Sazsoeiu/HwVDUnbteLdyMYr3kDLWTw/C6Fr9JKA
	Nwk4X/nKWcxUmcd/JIVKnPq3SxuISep2ar9EWauIfR0jdCLuDDGwBLJEFr/WkC9lDAsqn5L15AW
	+Ar4fFulkzzsazytHQB7SAp2fLauIdvLY/uOf+EkRFGEn7kUk3UlO
X-Received: by 2002:a05:6a00:4219:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-8414ae61577mr3046701b3a.46.1779369776909;
        Thu, 21 May 2026 06:22:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4219:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-8414ae61577mr3046665b3a.46.1779369776419;
        Thu, 21 May 2026 06:22:56 -0700 (PDT)
Received: from [10.206.98.135] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e02781sm1578340b3a.32.2026.05.21.06.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:22:55 -0700 (PDT)
Message-ID: <74304e0d-de98-4a31-828f-d8280e7a728e@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:52:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: purwa: Add camss node
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-3-22608ab9126c@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-3-22608ab9126c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _T02Aj5_Hq_n5-4iBwotFxfVpE-Bted1
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0f0731 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=CUJKaX_r6RFX-KylJRQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzNCBTYWx0ZWRfX0/KEU95AlDes
 1+ao0SB41LZ2rWSDaJMZBelNYOeKLjaZrHT4fwmbVMOVGqJpNIk+DlpLyW9+fvIDZkrYH8E9WfL
 zd51o9T4GBQkIfTekFqMf0mfmqz8fSy63ZCPVKk+dBG9s/QO6u77eWnB65ZrNgS74aHgacuecPB
 F8B3IR/heeSpMHf/W+3WNz3rRcrcDrEPdAurKxb/bS5yJGmS1rJGUjAL8R9Si5e79hHKtCRIoGD
 muGGBuv8fhDykAXPF+OqlW/Rkhynkyq2JRlxsSIYaw3/3EPcOfCD5sThiPc8RgwlQSK0r2vauue
 rdPNxbRh3lg5L5+eXslMe3AAyh7hSleqoC0igStqmubHX0D75+pGYQy1xzWkzprSUzuapnsncvp
 nfLyE25B3kDNnhwLoWjnyTXsIvrbQzrO8zDeLU5y/qlF2SChg0YerbSJbLYpTfgzEv3bR0yLqJl
 eayrvdt/7+IBYX+VQNw==
X-Proofpoint-GUID: _T02Aj5_Hq_n5-4iBwotFxfVpE-Bted1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62502-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9850D5A631F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/11/2026 2:29 PM, Wenmeng Liu wrote:
> +&camss {
> +	compatible = "qcom,x1p42100-camss";
> +
> +	reg = <0 0x0acb7000 0 0x2000>,
> +	      <0 0x0acb9000 0 0x2000>,
> +	      <0 0x0acbb000 0 0x2000>,
> +	      <0 0x0acc6000 0 0x1000>,
> +	      <0 0x0acca000 0 0x1000>,
> +	      <0 0x0acb6000 0 0x1000>,
> +	      <0 0x0ace4000 0 0x2000>,
> +	      <0 0x0acec000 0 0x4000>,


Size not matching with bindings, Please cross check with SWI.


> +	      <0 0x0acf6000 0 0x1000>,
> +	      <0 0x0acf7000 0 0x1000>,
> +	      <0 0x0acf8000 0 0x1000>,
> +	      <0 0x0ac62000 0 0xf000>,
> +	      <0 0x0acc7000 0 0x2000>,
> +	      <0 0x0accb000 0 0x2000>;
> +


Regards,

Vikram


