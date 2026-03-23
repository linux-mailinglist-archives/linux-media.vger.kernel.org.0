Return-Path: <linux-media+bounces-56748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEvsNABmwWlQSwQAu9opvQ
	(envelope-from <linux-media+bounces-56748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:10:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0E2F7A9A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EC2B307FD94
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B7C3BE648;
	Mon, 23 Mar 2026 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awUdgDUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3JjFUST"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0674F3B9D85
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279347; cv=none; b=t9WjRY3owL9cPwEIl9mjEtO+2szlCoGzmDW7pKj3sqEgrSRC7Q1TESfNdOvLXXYydASWa7KPRAVBYdygu4t7BC6t2w/ViK76buNdnDIXDS4AejO+Ygj8pc4rJv9k4qPCodHj65jjmdmgcCYWRj0ZidWbimWlLTUFDOR1p9/Pul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279347; c=relaxed/simple;
	bh=gqtcrGTFr5nvODLGuJoR5tYCC5t26GFYZF492b0TvA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5+NvG1OExS8lVsN8BOHNb67ZkV5er1crMVUizE6m/o/wNxOSteSp6w1FD0lY5GkKL+ozOanB5bYn7Vu6dzI99PVOL5Ca0qKp2N27bYMFtKAfjNQDBXvTMdT6W2Tanv3iHT3WQjlScw7qqoRXVjE8reKVPWXYlsSpemLKPposl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awUdgDUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3JjFUST; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFHkEh1422601
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 15:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=; b=awUdgDUOtA9GKwW6
	epj58chBC5hgvDphFBS3cJCt0leEZW2ZTBg6+HzWewYubr3zRiiKmdCtSgb0CHlm
	zeNOT25pYTOiXzO35p8ZGm6OSdG63filyTDx8tugjgSY4AzlvvU5phViBfcIfqEl
	GmksDUY2d8vBLY3tZO30+KpVwTFG43DuHJ62+atAd7X7WZLDzi07Y5h12cg9Vbr4
	mnUALKU3zP5dZjodYaIPPY1Fg8W33MHVXYJs3O8+qrHFMrnAncRdD6uficI1VA//
	+Mh3++CmBmoaxegzL3VJVhFBv4jRYUqL7aOTvxkF77nktkY2/Pt6gmPqg5jUsZJX
	HQV6hQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f08e1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 15:22:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ddd9b0f66so461385241.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279344; x=1774884144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=;
        b=F3JjFUST42B8ylZh5nRVPCpPoZqV/AYdbhxd6feCd9FJrR5tBC0IaVC11utxmYUYNR
         3lwV+a9yH+1aMzIdibj5hpe8dpSA6oRAFjTmenTn22xq2VBHh4LV/05mOsHCDfdZL5e+
         TX37zNVtn61okvpRiVaTNxs/bL/g3Ga7kNKJgZeDSHkmep0CI6ZHapsoxBNsitmsyCVv
         etZaqIkg2csagYzVr2pJjPyW0ZrKE1mjV+2sQr45d0DnuL3du9vtD5AHHCSLnPFmTahB
         W8lGVWllW1fi2kex5eZC46GibuyA+EwKYgpIu3GwpVVI7axxbKvGl/R6HanjP6K5QmE6
         sgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279344; x=1774884144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=;
        b=CWBYf2/rPsi2CBufBxitRdp7sOB6U1VqGzZ0LHKuIpBqRq1kHXuAZZ19tNWqxI6ons
         0/1KNfD/+0458pp43+RSXXZdSVHENl0O22YcS/EEeDP4jH35ibA6N1HvelU3R2TFbQNn
         ip0fc9HLHyH6ORC53CQgsU4hsZMAYABY+vgKX3Jj+JIaZBqjkR1+bn+FcbWdpGTVMzl1
         l1IOZnuE6b3QsiEItRhK3+1G2o9lwpGRV2xcWT2wMpxw1m8X3iFVgGSbgT3Iz1DFdhZZ
         dWHANvdztR81MSA1af4HreVNYhoB3Obfxw4iZcIDrvfR/xq1ACR9BDUZpcyqX21urMaT
         Levg==
X-Forwarded-Encrypted: i=1; AJvYcCUB7URam1n8INa5k8ofQxpnwQJ9eLZ4L8uT20Y4+W0TNDD26N6tYQYrM8pNGT5h24b7RS1UGB8eL0kBHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yweolx3W97v0c6htnc/IQzu2MVaktOEExMtZbr0mCwKxngEULFt
	QeorA7RDjm7w7WYjLltER/fPdnC4U35jUl7NEVzGVdr9pNIOd+ytH3sOOXMgVhkXdjCAaR5GM7D
	IwIkgtuxOGXyi+XDfjHpyCit0qPzhuNqqY5YYACDuEvoX6teRDS2z9cDV2el6VD2AVQ==
X-Gm-Gg: ATEYQzwOCfseMaBZrF+BE6vpv1qULiCx6Z+aFFuXVr1hGI5KPuFiEek3NOZw2o4++aE
	UXTyrwweksushblnFiRzah7TbdDW15aJu9ZXy0QXYJVSGQlgK3x0gnKQCeb86CGMVqwVpD5GqjL
	IdebjtVSB54kBBpPX/UMblk3yrDiJ+TGthV18IhGEIRh1BGX+dHmfrBMbUAZZD0z8W8xhO/fXlJ
	nXMxv0HDFvma68OpoSKJyroH4jn2b1DVh6m8dquUMiRgDvW8TmjVMq3V9mIHdv35+ONdpdKju7F
	r49lY6jO298PtQWoePORycnG4v0jnaVHitpflG4JJOBOOz6yhM7+bzsK1cQT+TBaqZb1gxpwdWL
	JUOtnntNbYbUQ/RRVsGeDjdpN8kLyrD8M+5OgCwrMTOM8AnzeIlxdXtHneeJHVI7ST0pCnoNfKA
	9lyDQ=
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2333013137.2.1774279344350;
        Mon, 23 Mar 2026 08:22:24 -0700 (PDT)
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2332997137.2.1774279343875;
        Mon, 23 Mar 2026 08:22:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a281b6fb0sm86875a12.19.2026.03.23.08.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:22:22 -0700 (PDT)
Message-ID: <2e13c91a-6d87-4c2b-8a98-0b58f97023ed@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:22:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
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
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
 <20260305-sm6150_evk-v6-5-38ce4360d5e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-5-38ce4360d5e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c15ab0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hKTp4ChWe8y635cLtM8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xxtxlatdkyzHSM-lbMlCdqiuEnFjX8dZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfXwyPJFIhYEd+5
 L68OxrNrxhDH43zyynSt6mgy6flc0q5T0xduVhO4drRs/11tP9GYTskLqyQM5ItamahoSfIMkzi
 376ISbkLi8WXmOdlwotjsAZ+gW/FVIwvNdF4fMx3I3PgRkV+MUFuy5v1CQWeQ3O9J/y9QHtZVke
 TOZyYTrO5rI1Ob4gjaZgKiIXKwp4HnBT1yT+dmBxPTBGHQB4H9K8wFazO+pL9oDr/xdcyRUkSIL
 0Zaghq9Q1AJBI14sy9RCcAaWUHYMd6ykYJjl3jSeFrNq22u9PVnU33fb7seQ8RSy2j7xTy+cqju
 h04VP7c4nbefr/43ZIzKCHwHNN+XmYQtgT3iVZ/XE9J3xot9+mp31AYzRi3DemBezkGgQcmHXDq
 pkwanfFSDuMMaJElWdTTy5dlV4TyhUtFsQUxIXiX+MOngbXfBRp4gPVC2PKdG82KIHIkd01hGws
 f+RzzNFATrMgz3u5Uew==
X-Proofpoint-GUID: xxtxlatdkyzHSM-lbMlCdqiuEnFjX8dZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56748-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CC0E2F7A9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/5/26 10:48 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Talos EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default. This DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> CSI-1 interface using mclk2 as the MCLK source on this board.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

