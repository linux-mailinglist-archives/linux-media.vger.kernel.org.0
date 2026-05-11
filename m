Return-Path: <linux-media+bounces-61078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC87CmGoAWqFhgEAu9opvQ
	(envelope-from <linux-media+bounces-61078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:58:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E11B250B758
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC850300AC8C
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE663C0610;
	Mon, 11 May 2026 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfTrO292";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R71ugVG8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A043C3433
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493533; cv=none; b=IIcLnA9x2MDufruA3sy/q9Ltt3f/6AM4AL0vqgi2LYVMC1gcMpxCqiqZQ9zPJJifJi0xSxQAurX0A6YhtAS4XHKzCB3X0BBcFgqy/msZVndMhP6xhU5wJgx5JbFtR9hZmjDRK5oAEsBvVuyecR6anGbhwINsMGI7/xXKgjKVvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493533; c=relaxed/simple;
	bh=Y2OjlnCuQlb1NvQcRqlakOxq6WkVluCIr8bKCkZiNNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNxXbLYfas3ZOlqW/pp0z1KOO+DSgl80Bix4ZFaBg3079RBMQwPVcEH3AG3oXGWw+RZ+rMgqlQV2DrXJMev0Czuirwhppd19LxidQZyN3lBYBunSIey0dSYZCEBhRlJsLjW/y++NUGDyDQqAsvarzxIyUqzKJJuGnjJc2c+XOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfTrO292; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R71ugVG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6gLjT774832
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=; b=WfTrO292h1oyY7SC
	H4ICKr8oF7tHCFWjcH+eL0ZiE49TmC0BQpNU5g3PJfoTG2u8zWPKPIf5EYwAUVVA
	nt0cGR1qtAyZLliu/wkNcKQKtOiukarUHvykj6oScQYBdJpf9Kf0nSQhFJGyBjXz
	V8G62bC7lIXU3a8bTu1GP12w4zahouKasI9ExRrRxzLzb7uguS346OyNx1SBHCoJ
	lw0W+9ipN6Ldwx1Hotglj+Do2Y1Atup88qBQfFI5gux9derobu0yK/QQxoxjP7Of
	DBFgXdE2tVU7jr78yLxEFtofZ5dDjvUwN7HO0106vlN4ruS7JtzVZ710hb5j9cG7
	4s/fTA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32gpy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:58:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9569074317dso175641241.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493530; x=1779098330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=R71ugVG82566FOokZZIe0slLUCGspYrGMbf1yEBNsBzg1UD17npGGozQEJid7EJql5
         CZWO1A/xbMucjV76QsFn6R+VXU4eoZ6bmJSK7g6scJd5aUgw7peluqFbAL9BYiJDPUJ8
         rHZqtIbslWc/X3eNjWPORqw6CjD9uK34KBTKcDG5WtlVvPpczWu77fqhADIjwTuYVl3i
         AY7MCzExWPklyQyHDw6woX4B27Y+SNIDfshook16oZSF8sCyPz12iKqtPNd9KF/SgyK9
         zDv6APz/EeE/AlSnucEzUaenLbnIwu75pmaH/fk0Q8jpbSkIWnsIj9IAmraNLnev0Q+s
         OfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493530; x=1779098330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=apeUlUjfyTLPBtVucApN8exsrQvhyZL6+n/M1T3GxcI9sGV0AkEag5S/cZv6TYOBw+
         Orp6Nc38O6l5kqW5hApJY3aWz6m79pOdoR/vQqb/Y98hqBS0z1CUx3NVrPsmv9DUDA37
         oj/eEWKN3rpqM1mmEmWKWl9awCaLK5D8I47bbiUgDpPKf/NNdHf1mefFjPTAnl165eed
         aL2fvvmwsamVMY2UT8VzDGHHhq37tYgXLYa68g1qLa1o/0OkrwaSZER3fdIAG0/hdllg
         NiMc2DGXm1VzDbino3Uma8C66XinS5iKRAXlpwAwNlk+kSHuBgVjq+GonOXOppBDTNPy
         lucQ==
X-Forwarded-Encrypted: i=1; AFNElJ/roBqvYfEtewoGFXUam2H5HcP/6Gm+BcoqTjtoG8dmjo7PAJS1DSRht8QHpIhGpa83jQolP1FJIjj9dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfHPE7Ku+TmsobQ4btDFXPFAyyjmBONnOCnRMwAH2fIo+qAWtN
	N6CigX+K2XTuPyFUJDk7PT1mpzE9T1xBAqrOGO4i7xd/DqS2zXZhWaFR/RAtp91TWyQR7dAy9ix
	rB99CJ3Q/pZTFZOomPFfCEFWEHjkEwLZxB1HkA8oIUYUTzGkMm+0sJ2iYrZX5+ncCJg==
X-Gm-Gg: Acq92OEUjty9BqvrZs8TMhC4CT15ZFwWvw8BfCWwdUuufYXZ9GhvIPUqtVvl9YGlIJS
	fAv4aiO5gVxGjXrREf+7f9ODgegEsXe++/NA0QWeUAg4bXl7f4u9yrH+dSJVYKvyc7xVmlmBsub
	kMjgLqVmu67V6LYoAFAcsL98HvRDkpsMK8+CjCcsTBkYeWUwffaV3dHA0eTxnGmo3utXZNmix9b
	WiCBKIaVhw8/2tejS21UIP1I32rkELYRi/i66l6jzogbO8dGcSHNg23UD6pTGiVk/Fk+xzXDvFn
	T2CwcBiYrP3EsKVEVIRjA26VaqiBXygKR6LVriI6ElTuE9r4aXV3/Yv14Uks5KRa++wBmOsZoDD
	DkMINvsMyxmtYT712ERxCKk8BXlvDWoEkgdHEooJ14SuViwdKY0m8ASjOBIqLHK5Q5FL1Rt56SD
	Q2pek=
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451656137.8.1778493530177;
        Mon, 11 May 2026 02:58:50 -0700 (PDT)
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451644137.8.1778493529767;
        Mon, 11 May 2026 02:58:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468659866b.28.2026.05.11.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:48 -0700 (PDT)
Message-ID: <1b32c112-916c-4e7e-9600-e2d95bbeca7c@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1-ZLMyIRoYpPifhgCGMtgtc3OYEDLycu
X-Proofpoint-GUID: 1-ZLMyIRoYpPifhgCGMtgtc3OYEDLycu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfX2cV3fmkEvvn/
 XzUJ69NkJBjNzjC9CN4FCgqBB3NbKyP35xkYEh8NxhET0Y8igaBR5xqvdhX2SuuyczpZPIbdSfQ
 5h+fjYqQEGrLEDVzNS95+7ejzhvL0+42kl5EfB2SNnxoobjJ0smwRCZZ/xeVLtZJyUonbfDRrBW
 xCnqxtZAVe5xD2J2fp94BnypXp+sUVMPlAzIO6Hj11cC3LMkIHF2M8yYG5pwt7St4qvP0L0+O0W
 qFGv8ylK4xICM0R4TBkKS3xJwobOTyXGkajpRLFdhoaGSpaG0qNlbAKX659MI39JhypLVNR4qGC
 ufasEG8cfarHXHhbhCfbhPHQ6eu+QroGlqYAJUqt7Ctib0AM5NgkqkPT/VujjVLE8+dr/x0d93T
 TUj25+f4mYbfuVhWrbAQKxojRPOHMWyvux97EUlawwK4isPRaAYG/KiJIOdn8s74omtyzAIdWNl
 /rj2bkK71w6BK8NeiIQ==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a01a85b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GLZNN3U5Jx1TMTuK2tQA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109
X-Rspamd-Queue-Id: E11B250B758
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61078-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Action: no action

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

What about other regulators on that PMIC?

Konrad

