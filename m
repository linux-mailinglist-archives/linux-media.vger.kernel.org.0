Return-Path: <linux-media+bounces-54079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGFRKNxjpWmx+wUAu9opvQ
	(envelope-from <linux-media+bounces-54079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:18:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FD1D6478
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34ED530417B4
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 10:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180F9375AD2;
	Mon,  2 Mar 2026 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQ03lgPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORT+6zeZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96534FF46
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446622; cv=none; b=EhLUo/kxexEN3dLRXCF15JQmXTeMAOrGnqNLhxjc4Izrz5xY4AQV8OYSx9wJlQPQs2HNFRXuH7NrwVuvERYyPOAOYJKRT5Xzi9mjUwF/L/oCC66Y7zQZu5Kx+vvn4M0ou3gavIpO/q/mCjU7AgOFmkroqweEcO+6227BEk8KV7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446622; c=relaxed/simple;
	bh=l6qF56iWoRGNqI069v47BtcgH6zLg4aJRqOCSG0CR/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLBSDSSDaxZA1pvVhm1FSWGLprhg2VuqDK0WBnnmMy6EGIRPUkbuM7T6v7T+3Bt+E7ph8QvTFRKo7ACbzJI8bKA8d1h6+Y9wE12csNdzmz/8hsCEQ6wdnvaUJ/HawHB0nK2Qopj6JkbRfMUQjalvyZZALsUYs1RRhwdHbcrPQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQ03lgPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORT+6zeZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228M5V63223961
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 10:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fhbisyq0Dy2Ld9ToYXKJFdDHy1ZBfIVZJkoz2FtTZeQ=; b=kQ03lgPk1DE5gUGb
	C9AVFOjftCdMWNJFhY1UooycvvJPSWzpVDFepfNUEa1TOr9tn5VJLFwAAZURLNUQ
	Hj3bJ4yM29uxWte3LwRbIH1fTcvNXphH1MifJMY8C5XpHglO+I6aGoxvnrRJVxJT
	ShxUnHB4wTvfM75PFWMstEJIgkmIjFbU2WLn5nGZQ+ujiGPPfcJXpbhGmdlqSg8h
	2lTC7UkH44QOblScP/cbmw1Nm716a/EHhDQcfGnDMypJCbB1iG3u6PfaWagDFbJx
	5poGl9ZfYxp/fVOv8d0Oq30KjdmaE+fy+4D+q+0bakTf9mQeSa2L5EnFgu0K4qiA
	MHZKvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1hqm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 10:16:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fcb63705so2942556d6.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446617; x=1773051417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fhbisyq0Dy2Ld9ToYXKJFdDHy1ZBfIVZJkoz2FtTZeQ=;
        b=ORT+6zeZwKTiOBORjWPsBqxtktLYa8UjWYX4vc+ddRQ9RGWv7OGem+NXLvWEEFRwYL
         VVyuMFWMQyuvHbaSh+l/S43axDSfRsPWrh/oSGyhGk2MiwQnvxlZ6okZU/IzIeHvBKV9
         sqysnllTX2pLgrvb9fXqTsMsqdZ1zb5ix7jg0yp2AeL8/o+oPIgjhjDDLqJExYTb/1V6
         xilg+ua62BVcl2jfhvpgfVQen/RGNqy4X8He2oaCTlERJQoPP/ykswFX/Q1pfH9GEbPf
         UmDHtFzhTarLKeQzmBRE0cKLgUICqkcs6ikpOcSjiH2xPsgEd0XWWE9EcLVIuCbA+9RY
         ivkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446617; x=1773051417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fhbisyq0Dy2Ld9ToYXKJFdDHy1ZBfIVZJkoz2FtTZeQ=;
        b=LWsQPwpQIgbR4EhiHL/rpLc0M5GWKnvPkl54mE6elzcsUhNdaybgpcG2OawbxFE1tl
         xgp3Y2a0waNPfRefSgBPEhrUrCqqWvvTgnlA108YRf0Grzn3ZUe0+TQL7QOlltY7+8Gt
         oze0rxaWBgrdOweJmylhCrm4Fe5bP3jo2VXC0jYh7o0jmmxvFW4EQzfxiDeheumFL1EC
         TpJQIRyCJJymz/qgyNkfg0iCbbEuiTEH5d7QEg+oK/5dKlb/+GaXLLZukFHOHfEDXOt2
         6wqTwh/xb2Yh5dzTLdF3DI1jwVXHhvwIFeAeshHquLaYJPJGlM9ur0Fl/YgKKjp0LJNe
         wvHQ==
X-Gm-Message-State: AOJu0Yx9jTWhzyuKs/qo/Fw/eVlpz0KJpOoIAnb/CtrcNhKltAxKL+ch
	rSPZ+3o6dA3cOOQ1X/EO424XPRAql0M16jELNOusSydXbmlxzjSOHslj+U/6Y896oOVVWrgBtLI
	SrHDnHGf4qL19N7WVTVvACLIimF4NjMw5m7VlSio8w2WEdb3B+QinfmFKJQCwdeUgOg==
X-Gm-Gg: ATEYQzxjxHNG/0omLbeT683mFo0Ly9qfzoApV1z1f14C6zr0n1nHF7VoJawxy3OQJfT
	KtRYUbmOj0GDm5tMGbn+1rAJV5UNJW3fBihtCvQa/HYLmKIgMHcE+jveTUpJDzP/gr5DNxXcV5C
	krpv7WL14st+IBv3gZZCp2O8nDZGKjF2+x7gdeRHyt3ArUwOawYuUFfOaP80JyPvjhn7y6d+UM/
	OFSQ5/UYXSJCmwZLwtxCz1IzmoG0/HLhZYRmljuJ6BC5X4QCPOmfnqEw6DjnwrWg8bPz056xH6F
	6Uhqs0V2jpZiiRjoZP80m7hSTiC0xW/kkzHf7XjGID/qBvsA0ntp2p/f5iEIw/tZz9x0vjmWOjC
	MT+VpG8Laq9sREwQ43wwK4lCv2Bm/QrphDxkJHlOL9QsUJJNxywUkZ/l1/ZNd771y+BDgSiOhgM
	Dw4Z8=
X-Received: by 2002:a0c:c24b:0:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-899f3a91c31mr32541526d6.1.1772446617088;
        Mon, 02 Mar 2026 02:16:57 -0800 (PST)
X-Received: by 2002:a0c:c24b:0:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-899f3a91c31mr32541446d6.1.1772446616697;
        Mon, 02 Mar 2026 02:16:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae612f7sm465697266b.36.2026.03.02.02.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:16:56 -0800 (PST)
Message-ID: <62fcfa0e-b65b-4c72-a113-54f8769d719d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:16:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] media: qcom: iris: don't use function
 indirection in gen2-specific code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-6-acf036a3c84c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-6-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NgOMZ7ZwfEcF7ns9m4Wzy6-qZoTack9K
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a5639a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=r0tmI6SDdCBRctQ-yBEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: NgOMZ7ZwfEcF7ns9m4Wzy6-qZoTack9K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfXwCmQmsvz68Jz
 6h5NQeuJFZpLJc/8i4XXZrc6G3Mdqb1BfqUed6JKmQATN6Sk+Tt2eRdzzGI8dAQeM2xo1ejmR/Q
 M44YovH4Qi+C5rHc706yjqURNEtHgF4+PD0sENUurIKiEaQgYmKskUc802CoVyUwEGO9PaSvFNY
 Ffzo6lsQaMoFQk8nFjpIwOUq+IbyRCdSUprKXxX5TJTNg0c90jvvvUeHZRGmiClUlp7IGyVSAgw
 Qc0uzhiQ4o6xM1PWGxN5hS4ek3h36XjbSuMOrdUVugFvEk0t6WwCvLz4ojKXkCMznmttWZqk2jY
 TF5mVZ/gw9O7+9tMwrtOVHSm9MOyTfazt5DV0J263dPo7j6XJsW13Ii4XDIM0XtJumwJ4YO9cIW
 1jaS/xJziJAzeFMHWyrbrn4c1TSSHnv7PQPEIw+3iA1JpXpfVR3B0XcmKKutMLa17jmQLIKiqM5
 guvRdcCkO3Ex+FcJaUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54079-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 241FD1D6478
X-Rspamd-Action: no action

On 2/28/26 4:26 PM, Dmitry Baryshkov wrote:
> To note that iris_set_num_comv() is gen2-internal, rename it to
> iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
> set session property (like other functions in this file do).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

