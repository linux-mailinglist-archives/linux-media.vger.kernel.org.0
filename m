Return-Path: <linux-media+bounces-61046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKCMN4l0AWr9ZwEAu9opvQ
	(envelope-from <linux-media+bounces-61046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 08:17:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8AB508721
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 08:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B265330028B3
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 06:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039782D060D;
	Mon, 11 May 2026 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldaiBxeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ql/2eF9e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1FC2C0299
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 06:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480260; cv=none; b=NO9/UeZwhPwjV+Fo0L5q8rtbbn26o4lZ3gffXdUzYA+gdXC8bTbz8NHO7+th4UEwZFGAvKr/EiCqn4oSZF+6MfCqlJuouKZCXRx228JdMjmw6Nk7vpVNS5uXKrc+D1ycPDFYvejyor1byh2TWAqoqwVTOT7ZrwntCbsjcSq1AwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480260; c=relaxed/simple;
	bh=F5pftz4nUbpl94JSxfXZG/o12H52F+RH7Ub3ebKkx38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBGmAXSvwHddr+7jTtfBQEJv2GWlEWMILHuy2ibhKy66wLzkcTT7ZKv1LAtd0S0Vnjou2PbP2CzbZbD1akL3B4XftlcCweHZpWwFrdjMOzjDToHE3Hp1uqE8spSJNdANWxUdrpo3kHrbdAxJvMcyV+W5urZJMc6yd0DCX1l/qy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldaiBxeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ql/2eF9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4bPPO1805990
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 06:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=; b=ldaiBxeN6B2UJi4v
	RkfgGLFCe4/NHqdkLrHu8o6xrAUsPdiIAUlw1g58ru308yCieBs1Gmg68fUSvA6a
	b4qeiWyb0sjXYDcQAswpscQYYGktp8izDswNk5VoRYFqpuFj0geJl/j5Jqc8MOJe
	r055bZUMikdCQgA+ANtQSecvU5c2+ezPhaB4taoRMAQY9LOsFFPWfCupPAJApOdy
	T7od/jY0GIslGNUzhgR+w9jSXpWQV90PliNerJrDpMzx1RoM5OGRs7FUdE0AjYe6
	FShXD+B53pkTmi+kw4a4e7Wkn42ck/J8lQhdtTZaKK9BbMzoaqE4NbF7V1xoP8Vw
	WXcFwQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dkstwwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 06:17:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso2010845b3a.3
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 23:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778480258; x=1779085058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=;
        b=Ql/2eF9exI3n5kk+jMkjfuLpqKfnEXwy3a+Qw0t4J+i6Xq9WZqQAXfXzgAtLtZnJgj
         LdmwT95uQjBTKUDLa5bmsXPpvZpihp1bpUfoxxj5p2HJ3mdOTrecrjQ6s2ntCpUuaImW
         cciQnibrFF9cUnX5v53AownXUFW5AVaKpvRRvRQ6CNYhMSX7e4owXBN+6GtjaEVYMHSb
         tSOPCj2gdWLzvPO/Kods61zIflEFtksqzRQW+wIoX1//AtD27Eyz6/MatXVVRhTz69Ms
         uhMpb6MAXPBVY8qdPmtkpvM8EoIzw65yoNb25+bGvqM6y58H0jMjwt/BCYKJtZBRlzoI
         BOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778480258; x=1779085058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=;
        b=Ajd5L6Mm7qkJD5dhr7xXAXYKotdCV81atdTPWHACcfxe0DVZGCrTkpjzCOdviore6m
         o3TSuPYft9LsSigpSEHcIVmv5NS8T2Pj/pAJZCWSxqLJhpL6OQ2ohOgmxud1r+cbc3on
         xSYqybtizOJVtHnwD46IDTFSuHAbSjBZi5mA7vYFhCGYmSwhzwuhZh4bzaJ42sydBwKd
         5cVVcdSfquBTOgrbU8muCKoVhLf7eQqmaha56wFjZeCFmJtCjYGxlKmG9ZMzzTMZdMIZ
         uZsAR4M8+l3LUbo0XrCzhPYRcXubMW2/5ZgZN6xJpEoIYpcQYZ7hTs8iTD2C2503aGPZ
         cUWw==
X-Gm-Message-State: AOJu0YyHOPu5ahUc2QV8BSvgA4LR+8MatRTywtkpKfaCt79R6mqXjTYO
	qwQbvC8sLd0JmhZhsTeNrFLKwh8FzESU/HT2lI9QTirFUNuZ6FRqnqb0ST10+pO0d7lbN9cTLb/
	Qwfl/zvCdkuD3la4QP1Kx3VZEJor9AbL1ujVADwKEVPgH9PZZspsUeCr5IEJlY8jrRA==
X-Gm-Gg: Acq92OEw88h813/ATo91WPp9zmoTKLlLpkCl13qvdMRID1xb+SZvIWwWn09hN4i2VEk
	d7zpO6uMZDWbe1ADInZR673UEytHKgQSHvsobJRjh4LPg+eQxD0vwxEcIt8BiPNQlci2dZ1VGGC
	ET/ydMUlrE/KZt7Juc6y+XSJ1dJMnBAd9Jfjk6HIta8djksJz3y5AdVkLuFfb6wKwUof8gEZ4cV
	BprJp2m4AIDywtr1dvbPzwF85LIR0Hjvo7z/WhmmO+qnbXOCcROHsBxJuWAY/ApgcofMRXsbzMn
	fP74DbCIFng4T5xhfjTGmCKGc/o21xtoWSWInppCYlcvebCM136BiVniQgGOBQHu7CIteJYHfup
	eazKHPu3QdMp+buYn3zwaaT3RAMu+daRyzo+CJb6a54pObAtaZl0NRw==
X-Received: by 2002:a05:6a00:a93:b0:838:127d:a16e with SMTP id d2e1a72fcca58-83a5bec5483mr20275823b3a.17.1778480258011;
        Sun, 10 May 2026 23:17:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a93:b0:838:127d:a16e with SMTP id d2e1a72fcca58-83a5bec5483mr20275785b3a.17.1778480257415;
        Sun, 10 May 2026 23:17:37 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm23840864b3a.21.2026.05.10.23.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:17:37 -0700 (PDT)
Message-ID: <a009cd46-0a89-75c4-8b10-35b653ac8fec@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:47:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 51D9urG1aaL6t_dj69G72QTUTwL2z2lv
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a017482 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=9TuWGWrZIemhly9L:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zf_DQBccePucUUHqg_YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 51D9urG1aaL6t_dj69G72QTUTwL2z2lv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2NyBTYWx0ZWRfX1+LRQEFBEgJc
 qPNpxzg5uh93BMDavqP8eoX+9weJD4QAhzinUZ/atWkIH9FuOwr22JSg6kIH9Ar5NXItAuZ4g+T
 drw+OaZd48DY5str1QcMcXMNDPhqY6WKDBdI050lm/q0c4tGk5YuspzjHgFBd67H6ZK4pQGL1FR
 H6G1iZFwgX8j9FcpC2lOYcOoA5G1VUBOOqe7hm71Ay2Ovi1QPAPXmPGuNe0Wa08OXv98TJLYEn+
 liqECX+25gU4h8P1X2XsGHmYZ0m37+BlVzksvzr/c9ojmBnkZaACn8/11gfjMR/7wt2NIrpyMmX
 cSHl9oJS0r4WinRPACMqH8OEh0+3epfltjwOBQH+m/8Us4naiv5DiyWrw8Jrhsax2PihGM7t8it
 NPwsusudRHqFUn8ym//vbGKpQk9Rm/F8uIfJgIFTvo6hoo9CvmHjfO9YyVy+RmK5M/X/saP6I+/
 oA9MMrSSLpvZNPurjCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110067
X-Rspamd-Queue-Id: 7C8AB508721
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61046-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index ef7adac3764d..f438dddc19ba 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  	u32 work_route = inst->fw_caps[PIPE].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> +	if (!hfi_id)
> +		return 0;
> +
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
>  					     iris_get_port_info(inst, cap_id),

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


