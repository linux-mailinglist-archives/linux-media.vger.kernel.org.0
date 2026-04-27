Return-Path: <linux-media+bounces-59687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBXJH6Fx72kBBgEAu9opvQ
	(envelope-from <linux-media+bounces-59687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 16:24:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F24744E3
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 16:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EC5A300FED7
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537A83D47D3;
	Mon, 27 Apr 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh0mNiGJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZnSCGKm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7872E3D411A
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299769; cv=none; b=nl47pG67GcWy+ASJzmwg75ATsDE+BvPkoIhgf4CzZStdFz8I1Ue03qVhTQFmQu+hEYp04YwwioCrntjYXCoEwO+NjnSVj6k2dB7SP92IwxXeAOL08njPu01esnQVPJlzREWAgkYjsDmbwaYWsaEZy9NF11MWlYrimAPZhvTZId8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299769; c=relaxed/simple;
	bh=//5y8usvnlLYIU6Nfwsa3ikRzmN9fsBFZ2GRchFaaCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTn5KgBSUOlDTSVxgETsbjc4Tb2VyiZGeE3f44/H59QQhNveR/eo/xWacJeh+rNsyCvagTREXc0TMTmHXYMSvFtcRFu099jkuBkVOjIxzPedKr3RTdJnwmuz7Pr/NKB7VlZBNIMOTGDrwqnup8n5xc7JNr4tfWfD8DjEg54yca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh0mNiGJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZnSCGKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDxnjk2913820
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=; b=Jh0mNiGJnaEQYxKK
	omUPGyG5j1o8r/izROyiLXmknMGdYdLnYKcpkqfA3k3TmiLW5iQTVZGncB0Ou0J8
	Vx3yu4YEhG/ZuIGgdCaooPiLGcV8+S0QEQVkBcQytIYcibuTiZ4Me2evpAT2U8yw
	fNbCfLj41pdpXXR1wXaaUNbiFRnez2VMzwgZEvUMzGjRkc1wdUVGIcsI8w6Mvofa
	sJ69vuFcXPtLLceNPR5p+tzVPVg79t5Q8hRJfHzjWM4d+sq18Vk4fjHFhk0TIBe2
	Etb2k4lt+cnTxZS7HmnQnZb5iZ2ur1FIyijdiUlv+x8AuyQMkQxmmWXUZ20QtrL8
	1pNVGw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xhuh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:22:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605a884731dso630908137.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777299764; x=1777904564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=;
        b=MZnSCGKm60ubRgUHscjOi0lUffsmH38o11RlQwBLtcuvPVOo1VtLhe6ulLvf9zFxak
         NialSHyF3xur4V6N0As/ANT9fxLSlti2ZIrXwny29D6gIMMYkECGjFGmpWaYXXUedCHl
         zFF4V6rOFlv2n001EABBW+aoYhcKVhx6IAEXkXSxc/dx4ZIst8E9dYhwojA5j+1iHTbW
         FWiz5ZTrMJvRnXmbA2lkYVSxke3f9CU58m/F4wM2hRJiV7qyKnYVt0SOSQLiIG5LMbi7
         s/+EilXYhGISIX50U0EkSYTDk3qmeye9yPp+Pq2K2136jpyfkTxdiTP3DmsmW9INKx3+
         buQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299764; x=1777904564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=;
        b=h+DeqNc0E28AQpL58NMhiU8Vztb7aESW154w0i8y1S/uXuvqLPGEm0/d1tkdMfcAZW
         bJWlQxWseZBBmFgcMFlUtkJ93zxQZqQPtSMPuNbpNXhkDvLy4pyCzNLyanMMbaHvW1Rk
         No/fQs136uoZige+tbOT9nYZacorMTHqiXH/XGP98zW6BpUe8BpwscZSYX2QkaythUb5
         1FYf9kT/Q7980MZAzvvtrdvZ7w+s5aHrmozQOyRT9vqMn9sc39SCO1RnmF7zwVMSpkEo
         7JkPCCl0t2NKwFRhIz6HxQ6XFK+vNC2Tn9RrSs0O14wRG+as3nWaUNMgffo+ZhepR5fg
         IAZQ==
X-Gm-Message-State: AOJu0YxCiqXOGfSdkphIyBDGyoyqpa2pOOCenOzHr2+e424K+fMHMZHD
	WkVD8ALoLOO37xWOo3foFJyN4ewE67kAhqfggg1tq0TrRFYr+3HHM56k7pReEYYxVlC9oPVaa26
	JzQune2sZr1q5UxJ2aa8vdJxu8q9C5oB/JnO+0cIxCJIq1w+kPDBrDd3SLexySxItxA==
X-Gm-Gg: AeBDies0HGcqarqaBbBSdZCkwVtDTgvH+2/8owNiFwxbvEr3HqnqX1o6KPPL4Rn4UK3
	kcBee3ocBb4WWoaK0x6f8W9/k/8G3z0cN9PvgfOz8BuUFasRH5FrQt1mCmXQpFvsFyRAcVGfZUh
	qiS8jnoqjAsKhEk9Ue3KNjAuwfX3iNOIS+5Yz6NC8cHQ1wapygGiUSBSnN+nBtDbZ6EpG9ig9EK
	NOS6XhF1UiOmJuJeqLvkRsP43JdW4ALY8jO5XtqZ6NozlazCV5MBJhnReUwfCWfY2fOXoZZdQvd
	O0R0ebQd5Cm15tPau8uHz6xpFon5NqzW2A00ZZ8yVczzp+IOUapC54m8rOzKeYDAzlLYQouPqlH
	3O2V74Dkw+vFfoD0QR7qkj2JSJSjMTOn0JytocLafApOv76DXCl+uHv0aYO5uphlrVbF5qeXoG4
	E2V+RNXD1lbPj3UA==
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6671751137.3.1777299764468;
        Mon, 27 Apr 2026 07:22:44 -0700 (PDT)
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6671724137.3.1777299764061;
        Mon, 27 Apr 2026 07:22:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553223bsm1134937766b.55.2026.04.27.07.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:22:42 -0700 (PDT)
Message-ID: <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j0m-8_iLd1om4l09Ths78HtvxKgF1dtm
X-Proofpoint-ORIG-GUID: j0m-8_iLd1om4l09Ths78HtvxKgF1dtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1MiBTYWx0ZWRfX6QrXjBdsr6+1
 ZOoCLMNW6fqZKz5C5nsf6f5E4MwcBLdiQ4Z6I7v7P1NLiI8AjvFbTPnNte+7Q2F6lX66dawrOLm
 HH92TYsGhgbppYMQM67sDlFyyhwvTOu7Z6AWctMu73X+9DbVh3pOUAZAQkc3AJndkslnJqTDvq+
 jPz4AZClY6TmkVGMUmsBrj4jecPNgrMWpfOabIchjJL/J5DXcIOWejktlZCZcPqVgxp6k8SG3lx
 fqc3CarAh1S2kbwn2kfcZP8EZW2RQydMc7rXuHBgD863Mo4ylqlCL81N4dWAZWQV2eTEQgJsqiV
 FbCvtxfFsOmll/Jv0UF22H0TijfNATUAH4nNlBZ8tXNsizoLGDOK1v2lGn/MH9OTxXLoKbUO5lB
 vpdN4YSpBG5I16oZneJ97GWWMZQg3+FCc42PnWmnpaq0OQpAAwB66GFyxYUwLmd9sYCb7mVxsKu
 vxILt4TBrjdUheFZXfQ==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef7135 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HtS05e-23YgY9VhomDQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270152
X-Rspamd-Queue-Id: 242F24744E3
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59687-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> Offline Processing Engine (OPE) found on platforms such as Agatti.
> The OPE is a memory-to-memory image processing block which operates
> on frames read from and written back to system memory.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;

Should the two AXI clocks be aggregated by camss-top instead?

Otherwise we run the risk of the OPE driver setting a rate of A
and another sub-device setting a rate of B

Konrad

