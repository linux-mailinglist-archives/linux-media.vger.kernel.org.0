Return-Path: <linux-media+bounces-66094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kOkNG0fBQ2rVggoAu9opvQ
	(envelope-from <linux-media+bounces-66094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:14:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA016E4B31
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:14:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YancLoET;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aSV1N+HE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66094-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66094-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F9F0314A504
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94772426D0C;
	Tue, 30 Jun 2026 12:56:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D12426685
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:56:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824190; cv=none; b=QeRubQEl46/iTJUHd3LEK87EOPhxbsPHRte0ZaYJLlkqI9DYFKSPOHtVIBH+otnPxeX0cPc1k4hFkgNRxIHPj+RomBAfLMAOojKaYhHBsVmBk0RRPc2lUwwJoMskFY2MhccYxCQD2wWx2fQQu3kyqVD0Wg/Upcf7OnRLuk9UirM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824190; c=relaxed/simple;
	bh=3F+8SDZsklC3nLXz2X/RShSvYjQzGV473ZoM0mdbbvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyq381/l/iLq08xGlUtNAb6xFbaypufmxkJQkv86NcR6AxUFBuRavZGD2/qTs5pAkmtTnYhoWB5oNgFAUz18EUW5oGJzN+Y/5TriBlzSogYB/6yw9AJmJyURMFReuEu+x0Z+lzr7X0h314Y4jlx2GeV6herfo2NmvHfcmvB0bvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YancLoET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSV1N+HE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtcn1522265
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87eEz/XRAjsptTgfnRt9issLsRCzcTh5AkZ60gdDDAM=; b=YancLoET95ViIOoq
	I/99vdkGYQlyCxpH5G8SeSnj7wp63gcW96xAaPjnW3WtYhF8JJ+4sjsqNsSOnIFK
	rMJ0v6dPwMsdXe9Mw8hd/PEMiM6d0k0RgJEvtQz5GJeTgrTYbaOAaTtDWxy4aVH+
	X+Jgnd3z7HCfZMgiktY4mBiGlDq5O+tVk4+zw1IlVLd+QVhZSd81L8AjJLVPL9C+
	MiUwfa/a8krvO3mk9Rb8A4eWbGvxcxoR9upcrHNwcWrP1nEmxhtIlRyCd5G6R4fx
	jwCpl9u6vNt5s92zaAmjl87nB5lCDiHo0UXL1dUdFJE8qOZmJkhky6SP5Xh4hzfY
	LuirkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93f0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:56:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1857417aso220301cf.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824187; x=1783428987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87eEz/XRAjsptTgfnRt9issLsRCzcTh5AkZ60gdDDAM=;
        b=aSV1N+HEp7PWNFMySDZsCqVqZquSf/2mSdlb7WGHMSz0mzoPwai7/L1HFz7/mxk5Eh
         jPXciBC1lAx9Wqd+Sa/9/A5mzeL9tX/O7JjBqtu6dnpi2BckDkmXKWGzYrmNqQwX9naR
         FkST7WOoTwb3p8y+wt4SvPHTrB+UxveCgo+CVshU7W2PcHRiN67oIPT0XOgdrOEFr+K9
         Ecw0XZ2OggABTGqlYeKf4rAuMCdmJbRgr4NseRm5OhX+h0g4R6YyuRz0gRkacd//dFHD
         +t//oblmCfk2HEW1/coC15GT8FSVv4+s5sOLRg0pM2qfXSjdIPjjbtP/TzEDvHbWoQIR
         4UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824187; x=1783428987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87eEz/XRAjsptTgfnRt9issLsRCzcTh5AkZ60gdDDAM=;
        b=aCS1W8HG5/jgN0Cffwupu2DS0NYEqqmVaFqTLQkbKTVyAPlfxFf/4dHBMjpgkbIQnJ
         YCIOUmuHu53CzEZyrJbYJgt+FYIxi9+Se0nA+1x3g6/5d1ATmJnwC1A7S7n2nVIn30hY
         iG2CaC9coEsepmJZiMzNadHPvTtgmmPZeA3hMA2oR23gqGKR4mKi6KfGdhN0dEmbwWU8
         3zpCL78QjGh1ThEExXOxjXqdnm/S8MPE/BypIr27ldEgPIm2oiHlXCr3y6n3dpsNIeXD
         wmiWBhOIVtGxdqLa+Xbnzs8FZDenm/DZCEw31f5rei8QDlvu1Hg5cxXywt4PoILPoPw5
         qK1A==
X-Gm-Message-State: AOJu0Yy+PpI7c415mv6UcWmJPol7QKz81/3545OSTQE9zTak8ugVIwoA
	M+IRVmyauxNdYshAPD66AmPInqnamiFY1RlQSHlUfMN4HZpZYfUv3VZaAX2GOH7LkHwlptxq9yy
	m1qfl258oirWSL4vZIwAb0RrCFoyLVR/n9XwajJSJfrMk8Vhx9FYo2H1DGk9+T2eYUA==
X-Gm-Gg: AfdE7cl3VEvPB8o78DBln8lQQ/9I0rRCifoL/yIq4vJRXNVmlYCh2rqfgnw4cOHbZVR
	uYB+NPpipsscx2s5mYHqL74ZFtqYsw30qvjhnKffnX9LyPu4gQMDdON8/ktpMk040IgU/z653B9
	s2euEYnVfsbNV+XwQjzNplhxyIvVb5s8XkOwiKwYQdsMTf/KRUIfJLqhKKBzvwlTGGnYidWQLan
	YriErVYWuS04BUnzGe5+jViKn6HBEJm+bEvTMDetXaB+4xhYHTMJAQQic1cdBdes2fozKxBDCD/
	oLgfpFVG5V2HIAAVyWYli7HMheTrg7VA4x9UWcPhY+XRCRylPCUuFqqfRLbKat5YQ+eLjenBG97
	kMfDnlkICciu5MnGZsQHwn157Ku+82jxxmQ0=
X-Received: by 2002:ac8:7e8e:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c1070ea79mr30011541cf.1.1782824186952;
        Tue, 30 Jun 2026 05:56:26 -0700 (PDT)
X-Received: by 2002:ac8:7e8e:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c1070ea79mr30011191cf.1.1782824186413;
        Tue, 30 Jun 2026 05:56:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb7csm119984566b.37.2026.06.30.05.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:56:25 -0700 (PDT)
Message-ID: <ae5d0817-5187-41df-89c5-0acded391fb4@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:56:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] arm64: dts: qcom: agatti: Assigned clock rate
 for CAMSS AXI
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-14-bb1055274603@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-14-bb1055274603@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX/jpjx65VBfOs
 n/qDcS8TaN8kPtePzJwH0jAOihdKNphqQX2sUMwH56x+OOIUhzASOVs0Zoyrt1HJfmMHy8U4iKo
 aYqslq/Z6rCIhTQWwgxFU6BWOq53mUE=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43bcfb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=J8mUrxzbJwspoeTAiOAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 93vz0IMpnRHwGbtmq2ABQGoy1KlOhYE0
X-Proofpoint-ORIG-GUID: 93vz0IMpnRHwGbtmq2ABQGoy1KlOhYE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfXxo9Kq/lSQ3bk
 DKMES5fff1oMiXRgtXPL4RNtiNdytheLn4roU380f2soL+J1f14Gy4atFYdFq+xJ4ni/RknoeqR
 eAoklLuPh1wBu35Za5D1Wm0fiaKGT7LmduIAx6V5G8uDyxKt9wPmtXvuZiF+6pe+pEEqwkukNCN
 NQt4ea1gw21/qnn00lMGJi5gu3X6cYs1QPBcL+RBiAQUO9gSuvY7XboARFOGAuwDQhmdO8ktbGJ
 PEP3SX/hvHz7PUswKpz3qfrP0LTi30ZVC59tRdMwE+LvPOfymgCAsAsRYNpiiuPnk35aJEZmGTw
 TTJEwMq1YxY49/EzsZ2TSj4xcjS9eHPu3bzhLkgFckbehX83A1ZU+7AIfLPzbfyYIPYDE5jb1PI
 CnDsEsCozhghVqcsxwssn2oQk0UzjPKB1UGwAMePNn7HOjSUG2Zfu2SRxGJwIC4YmetZcQIGGd1
 iI1Pgs1Ay/fC4mcNHpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66094-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:johannes.goede@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AA016E4B31

On 5/8/26 12:49 AM, Loic Poulain wrote:
> On Agatti, the CAMSS AXI clock is not managed by the interconnect
> and defaults to its lowest rate (19.2 MHz), which is insufficient
> and leads to throttling of CAMSS-related traffic.
> 
> Set the CAMSS AXI clock to a suitable operating point by assigning
> it to its nominal frequency (300 MHz) as defined by the specification.
> This ensures correct and stable operation while leaving room for
> future dynamic scaling support in the driver.

Now that I think about it, since the clock is already consumed by
the driver, can we just put a set_rate in there?

This will avoid introducing a point in time where the DT has a
suboptimal (power-wise) floor mandated regardless of what the driver
does

Konrad

