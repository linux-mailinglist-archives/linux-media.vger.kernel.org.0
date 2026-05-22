Return-Path: <linux-media+bounces-62619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKNKHvxKEGqmVwYAu9opvQ
	(envelope-from <linux-media+bounces-62619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:24:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2ED5B3DEB
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 519DF30F4D83
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76E137CD4C;
	Fri, 22 May 2026 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FugQIAt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AT0CMmra"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FAB3793BD
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452084; cv=none; b=bpvp6VmKjtS28UFsy0zQXkvnE3cr51vEri0uskYJMNPfoM/PJkefjHL448W9mml7iq9SXaHbzOev0schUuPEo1qpfMGg57ZGsqtDCEgRORyxKkmt7/MX2SMmCTCVMtSPtQoQ3ujieHuEEQaFfwgbsT3ofVRAPOUSJL+g3fpAFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452084; c=relaxed/simple;
	bh=BoewX65LG8Pdfndl1vDtiqts2qaJrLH8LBPXD1duB8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGegxwj/X1bESnq84lxG0bchpf6VXnl5eFerF8K3ZcF9wIvekKJV8ocnj4+c9SOoL6+iZbHLKdLql2i4uSv2x5jEWvwlOe8VQ33bApswR7qpxs5U8D3kwy+4Hi2RvS27uaglJDexQiulND6cGVvdZZhCnFXhQr/GM1rLTetZ4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FugQIAt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AT0CMmra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9uUxK312917
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 12:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=; b=FugQIAt0Y0vZOnpn
	3T4xrzy0T2ZCd59gvPtKOItV3Z6562kZxq6ne01WslIBDaqAwycNCG+jBxqLG3fD
	76TRkOJ7WqqH/W8YxcNQ9jyci2SYoO0DDv356X80oj6MAoAiBLco0NwYRdkm5TEH
	Mxt6oUoE2ZdQi85xeRce42m36z0uJEJztVeNOjRYlWWk0+7FxW7wUAovxXm5LmoL
	y1vwJe/xPBlAeplVlRb8Nn5jiHZBIjZsvA1rnWLxUQViUUu+mHM8hoKaPo5Hri+1
	1w9mNh1G2rqFbOE++tWXIQBVfo9wj2WO5agXSJ72Jw7exjsuR1CX75tkvtXtVmb0
	xPU+yA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833qjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 12:14:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914ae48993dso36649085a.3
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779452081; x=1780056881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=;
        b=AT0CMmra04gdQS7TxPA2TwODQeE+eEjKn3n/pccRmJXWHN8ifSEAgznU3t5ZLpV9qp
         K+H2QGLFOPfxNLg5Vai0PV6eEvgrOphRn4nhs3ttUW63mikqjFOmmg++vgz/H7SfXDFF
         iaZRB78MTWfvLQw4U94T8ObQIY5m+YvPeHTX0NKK/PbCyhiZuAuPDlAEUN5ymqdGj1vM
         w4MX+ieVTLSTkqCBTHyFBpgG4khz/ijEh5SdswLfleNE6FQYJ37L515Vk8mR9b9zlMTW
         OXPAxVhFhC4JA7Rk1kH3hYivmUjoYQzpRUkc5GnD1Q3iwGqkBXEogIdVrUOuN6+aghrL
         ksBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452081; x=1780056881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=;
        b=ckrHul9HvnC9XesskzudFbIGJRCybhvR9R/9edYYJTmeoSOuLOKVzn7p+L6uhb3wXn
         vITQ34TQTTuWai2PwFn8ipdVJchH7eJ/93cByGvLsBzVrr+sYF3PY1xilxCted8BFPlW
         YpJ3w2xvTHkWBG3I9mqoiGl3bKbUVba2Oh9Nju/yjWjKpnN23zNR2Mml6aJRQknbnRXW
         smKKUHoEf1cmLv/PhU4VhxYQk/GY3BD3xgCfjdWWK+DN7HWCs/4YnSI40pVOnWkGTrNv
         cV7LcgER2meCyvmbKSgtlm59GBNjXpYMFVKZBi26tWWF0k4/yDGC9eC7Q2NhtAS1JaXj
         o0JQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nkuuUMXhSu48pCpKXvxwI4nUf+V9+A6zoxfLv3ApvZFzgEJsephoeXSkpWFtACekoeUu+IFw3260PWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDN3uBNylNNZg5AoayjxmoTzygt5svULxZ8durhu2THDN197K3
	UYQlqLBntkMNFXujMgYC/0bwQ+Mn4RILInNHV2xQa6BUJeCusucAMayTlGvdziKi79Wp07tnqh3
	sXvZKFS6pKg0zZMt/PMSeJ+gp/lqgi9X+Tljv9JdFJXGg4eU9FsBcgDc7avIfl32UmA==
X-Gm-Gg: Acq92OFKX1UpHvHdZDvo1Fj1dFwtsdvH5KGBjuClJv5p4Hi3A1zdJhhBk8KcfrXuaUa
	aJOekixipmvT21s4N5tWvhreSXLVbo2ij2xKt1a603/jIzQeBR2JVwgQpP73Y0qvOSNXhKXj1IT
	GEOkGBBAT6o+N9aIcaEKC2q0YUI0lKlHOLhe4FAimI0Mvz4Rr6rdc4VlKBIE4Vl9Zds659pyngo
	CjHSa2ARPWarOIdMmTXIY8beCbdV9wPPsAtl98d09IIc7Q0V0Rwb1iz3FrcUurLb7LGYg5RqPOE
	j6bnd5VBnzJhTGoGifvoOQJfVpi8Ba2s6KFZWare+bikbg142xp+AaqM0WeKuPR9i1jcjy4zZ9K
	T3XW9mRTpiHgK4zOpYdcwMiUEWFT8/5EZDLa0knVrgAmTSg==
X-Received: by 2002:a05:620a:2985:b0:914:aa0d:aa79 with SMTP id af79cd13be357-914b4a2ac9cmr338175785a.6.1779452080926;
        Fri, 22 May 2026 05:14:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:914:aa0d:aa79 with SMTP id af79cd13be357-914b4a2ac9cmr338170285a.6.1779452080513;
        Fri, 22 May 2026 05:14:40 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd5bsm50436466b.5.2026.05.22.05.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:14:39 -0700 (PDT)
Message-ID: <5f5950f1-397b-4a7e-b88f-b6b74388e310@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm6115: add venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX220wMqB1va0q
 StDo0/Oan0dNIS8GNcUK96C0DJSukqFXdll9rSyMNalhUlXmzcZq4dd6/KQLhDbRMAsN9FL9Sqf
 Di+/Fx7sQwIXs8Xu6lLhy1ntwIy/u/L7RXtv4sVMsSz0uiWDIUDD/pXwV2gPONreZ+yWu02KL3b
 nH5q29OAhwRUPIerw36asaLpzOe0RglM/7ksD/5QaFG3RYu4b3cvpkH6gvIS96s49bOBtrCUh8Z
 VuyS6UMlnrxYUG/p7V33KHziRd8LNHljP8RSiWSoAI/eITcaf8oqbgqoNtk+eG3tOsnEsL/d74Z
 mKDDKYoAcaLTSZ8fIQ7e7sw7wvlKZMJ1ce9CvTuPxXPUmequhmg2ThOCUbsuJWrfBmovmtzV9yF
 x9k43yFjZSvbcST+4IePeOJhP3WF+ewE73at4bLlBffpyTfyet+U7dGN9OxPgLvXyY7hXJgF6cV
 4IYL31gfDxNfq5X1pTw==
X-Proofpoint-GUID: Y9EpTdArLSvjskFJJtChi89s0K0ZbWpA
X-Proofpoint-ORIG-GUID: Y9EpTdArLSvjskFJJtChi89s0K0ZbWpA
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a1048b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=N9Plf5D_esIoL16y4e0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62619-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.105.105.114:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[178.235.128.140:received,100.90.174.1:received,209.85.222.197:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE2ED5B3DEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> Define the video en/decoding device present on the SM6115 platform. The
> core, AR50LT, is mostly compatible with the one present on the Agatti
> devices, so it uses qcom,qcm2290-venus as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

