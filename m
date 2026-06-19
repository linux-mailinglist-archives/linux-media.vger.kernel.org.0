Return-Path: <linux-media+bounces-65243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y+JjAjfKNGo1hAYAu9opvQ
	(envelope-from <linux-media+bounces-65243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 06:48:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F6A6A3D4F
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 06:48:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QCpolzKC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K55wZCJt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65243-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65243-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF84D302758B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 04:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B464E31E858;
	Fri, 19 Jun 2026 04:48:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA232D738A
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 04:48:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844529; cv=none; b=n+fwKpXGwwMEghn5GzSUyCZLqLxrGBjRpdNv0z8ybjt3Va5fXtK0Gqm4+RJbbxmoyg1G9/mOU3ykHUM8g3AUyjM+pvUlMJ5MBLNn2oLs5ayBw/gMsGH7f7jI4FfkcA6LrggN5HrXbl1QAtTU5AfUUtDd47yvywBh1Yf3Pt8pKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844529; c=relaxed/simple;
	bh=2ZgH9JicCBPgNw6bTxxQzJNp05yNoxBhSbgRSDqS2PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnJxRlSkHD4z703Y1OKqflZaLivCJY4qUjgIxgtx/fLD3Waywo+LDUEDAB41YKBjyEZDhLZJW6Z1hBXCvUNuJCgwIgKEyLyE+forHGblqrcM5K1PjCWG1TD6jEhUZ1RwibJ2EauSF0QKP3ijYn4oxq/qTM5/yJLdug9pGTUQowE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCpolzKC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K55wZCJt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2t4063081719
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 04:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gpq90L0IYhWDMYyNYTQ1qV2iw2qlBFm7cIYJfW06+QY=; b=QCpolzKCrrG9L9gw
	rQqlyF6kEgZehYEIgRvzgYGT83U0zsVJG0wfPOMGntbgRHlTfi+whG9N8JqN84Hh
	b7Q6+mGh3eKoWg+UK8bUgRawrlQzPGIDwWnalJod7Hlwa4hDc9p8gVFqo4Hh2FMz
	MzdZjNoVGYp1BshOGaStMhlrHzr8txcNzrNuNMn5fFfMA13rqPywPeeqwxpFEfXB
	Y5t5/iIjKuSBEoGdzx2EpJLsSAVPutox1x88myjnxHrF7t+zRaZu7mNTs2Ei3tPF
	uln8H8QsIaXOdTZ2RtlzbGID7fxicktkAJnzIxYee4hyyUHEYXTqKJeNEQa42zGp
	ORJF9w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evdn4444s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 04:48:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842446a3851so851072b3a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 21:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781844526; x=1782449326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gpq90L0IYhWDMYyNYTQ1qV2iw2qlBFm7cIYJfW06+QY=;
        b=K55wZCJtDaUlWke+1HPS3cfsUuKMhz25Twv3+rAfi/69OvP7XJVjIrqB+xv4qJIhb3
         eqO7Xxnqi09F9G8Iy/tCyiqMhZBwfMelzXKSfPUv8zEqZunpytZZVArgYvYBOWDajoQs
         JVx2BPZ6CHSHr0OB+ol1Q8VicoCsOPC+TYjXDQGmm9SSXMuxcXppmcROZs8707FC+S8S
         +QQ2ZNSqiIxD2VTcRm4QY14rOQjPilke1sJQDVMDn457ICQiE13pVudtIIF4FCIc9Nv7
         HFcVSlG20J1+yziWbuJiNOMhmyj7ZsTRurBnQrkkhCTZh8WewmQtgiGkzl6DOeuQf3iy
         KuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844526; x=1782449326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gpq90L0IYhWDMYyNYTQ1qV2iw2qlBFm7cIYJfW06+QY=;
        b=V7nGAUeb/SkwM5G2llqbnr0xmTeSaNQEh5ze5vLY1OrGlSGc8X8FDVZe9Hhf+uFU4A
         Q61p4i5EJY1oV+lUjBu86/kLzYPUXHGRObS8S+xoBC6ituN0c2FK7LgkUvo5wspvZ9Q0
         RzCgB49qjuBAVcFyKdu0dXmH3Q1tesLYV5C2zcRAT5BHyXdMy41BlQAAm8otgPD5TNff
         6Wsayjg86hblZ0OzT1MGPMwvrjzij3HVAbHrnbPsPIAkPuKF3SL7RRZD2qjWRAoODLCv
         tBn7tcwvDpyvZBUzJcC7TB3Ykf8s9aerHKogrWZewTNht9WPFBUX69tR5yRbSKOZmlEC
         m0eQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nE7vV5ALFxb7DqJC2JFRhuKYzLWXM2LacmDO100OgUSL14HP2N6uOvjmah5TWjxg2m8Klx+W1x8PhIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN0gdbbzEbSAve/JMxxgdb3Wq2V0XCW9h4/mIQeYEAwudxoJDp
	No/UsbCPGhMcawzvtgjTcrrMGb2yPEtoRivWKkzcPSCZ10TBjWUEwAujXdg7IJsPJlFKUn8iWCF
	A9nfJJLKrAjs4H2uzM+3imSmcoW3YoAfK41cy8OUOImexpl0txXDB6cLBhMSII5S1Bg==
X-Gm-Gg: AfdE7ckuT56P/ec4o7+t62aXuEf5ovDz9hbkFJ4zxrkzgB2S71MgkK8il0cldI2C/MF
	CcmwP6zuVC4j8/eG4gE7MjiEZIjb016dUGlQQ3KG7hwDav4Uy6Kwy1dw1SrjcxZ3e5uN4TnRxTt
	Us96b9u7fu1Feve9ucma/NFPXFNkE9quxZNLTW/oOwpDhTUfQW2D2f1vHM/YUzsvAved+ysvcTy
	60S27FXVWbezWMvEWlxAsXEW6jnpdbS5m6hRTOkWA3C57pcpgWp3D9pvgEDnitO2n3dF3Gcy3xK
	WrkKj1bZ+T1M9wDO4jriLACfhEczP0UkDyRvPg9fNJtSbVlSTX96/lyCGsGsl/dgka1WagyITQ9
	xwgLokORvvj4Z8+jVzBKz1tiJUrkQRnL/7VbEVWF5AeP8
X-Received: by 2002:a05:6a00:2304:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-845507daba0mr2152960b3a.18.1781844525857;
        Thu, 18 Jun 2026 21:48:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:2304:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-845507daba0mr2152928b3a.18.1781844525428;
        Thu, 18 Jun 2026 21:48:45 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84553854057sm873036b3a.53.2026.06.18.21.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 21:48:44 -0700 (PDT)
Message-ID: <db5facab-912a-660b-b688-c99041d1e866@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 10:18:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
 <20260618-shikra_vpu-v3-3-1a32e26a35a1@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-3-1a32e26a35a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA0MSBTYWx0ZWRfX/LTyq7+dMiUm
 W+hLtt9O3jotPrtmmO2PKwytXzEHVngy9i2BGpQ5x0QPNRx+HATvAVg9XUlVfC6nnNbyB5ey11x
 +AWBYW7kkt7bvMElOxGHwik8aCPTYdV892peG5ImSLKGwnEotEoXmhFjLn8qJd9QLE92rH9BPYD
 tgDSS3YmtahogcHoXkQqgGd5l+EdwDsC3vHts89hAcHHAAue1D97I3wm47MBCxdIV923ft9YQc4
 ZsNTz0ypofZKHdPdcgsJIvVLSMcWDVul6eBIdlLbOReLlxSbprMAAWhHsGqFWR3tD9apFfRFbxs
 NhQg+aW1786ntQsO4J7fo92TwLykbFI5ux13lATISICnIyu3PXucFRqlgRVELB6yhFAolKXdmK+
 CFZWCFrIObGbvgI46KYO3kza2Gy5LGRLOTIOpCRgbZX6okQEx4neA5sPqBz9bT95xbW+SueLrUj
 /HrrsrN3D28+8by4YPA==
X-Proofpoint-ORIG-GUID: WBpFDIdSSP6hQXj34ArCh7dOZEB9HkYW
X-Authority-Analysis: v=2.4 cv=FN4rAeos c=1 sm=1 tr=0 ts=6a34ca2e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=LrD0L7TPytbPiIQqxktYyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=K8JZiejdjy6CsQPdH6kA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: WBpFDIdSSP6hQXj34ArCh7dOZEB9HkYW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA0MSBTYWx0ZWRfXzFMas8hMv5oD
 K2dum/o69UAYORO1zji1VZ0nxYh8xKqCBlinGh6FhMCiQcml6KwHHqbcZWcxu4fVK5Ji7Bam8Sy
 GfLZD/z1lU+9n2ZW7stX1GvY1CaJsZs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65243-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80F6A6A3D4F


On 6/18/2026 4:09 PM, Vikash Garodia wrote:
> Enable video en/decoder on the Shikra EVK board.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> index d0c48bad704c61d17309753ba2a97e89bbfe083f..e2a3131594f0410931122657b12c8a6e70b435f0 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -3,6 +3,12 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> +&iris {
> +	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
> +
> +	status = "okay";
> +};
> +
>  &qupv3_0 {
>  	firmware-name = "qcom/shikra/qupv3fw.elf";
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


