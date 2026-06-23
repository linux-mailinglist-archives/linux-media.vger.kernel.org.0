Return-Path: <linux-media+bounces-65440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/A+B4kjOmr/2AcAu9opvQ
	(envelope-from <linux-media+bounces-65440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:11:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 328176B45E7
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:11:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bJPmCmu2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xq0U8KgZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65440-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65440-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4DEB300D56E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 06:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14974390990;
	Tue, 23 Jun 2026 06:11:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3998339EF01
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 06:10:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195065; cv=none; b=oCVRE+DaePlUHEaVCsio8/QymrSgVfCcfKwChGXxpgrX8bbLEXqF26L87V4Z1PXxfvq2wpG88Aoda8u5W5lM03p59zr10RM8FuRXj44H0ldUFxIK+LfOmnWYAy4rllun/ekaUZ0BCFuShVAzep0Hug/dST7IsuW0ZJTXZh9XpJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195065; c=relaxed/simple;
	bh=An93r6atHIL6rwjLrAyy+PRR6c90xs2VuccXAJ0FMvg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XrjOqMSLbtsjKOR18sm5tkPDwOOiEonqgjqgNEkEAPgCRVzT953QttNISLUF1xGoxhudeF6k8JtOL2841wDM3/p3rSIBFHYmnGFQjnNOdrGrKijtvu1/siwGKVCDiCWalR8LsCNjrFnL64jsntIXXNkmZfbLVqj02kchnm6Vuow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJPmCmu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xq0U8KgZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0l1Jn2869351
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 06:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REGPcR4Pi7Z05BCfV22gSGTbkuS69uSGblJRXEsBRvs=; b=bJPmCmu2sH9jXztE
	GZaO/Xg+MKHfkJEn5+MD8qpWbrDuk9wDxhWoh0QeLB2ctiJlZnv9GJiJuQsj/XXb
	qTHwM0BKsjejOjfwmrEYztvRtPH5dSUBBwXp3IBNOFsBkThzQNNc47MHlvft1+H5
	Xqy0Vg4OOQ42BqvB7zBK4Y8Rc7L0cIvxrJCj/MHrPhG+4pkuvgsGFIxiPTGDQNdZ
	g8Q5tpE8fN4LledBpsOY488zHtqntCZtP1DG0PWcrybhUB7nDHLWSt0UqEdRzpNn
	vsXByBxQUGEkSWccwQDjtmg1edSUssCXRsUVyrhGiIEoGOUt0Pil4/uZfWBiqA1E
	cPEWZQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey6tmtxyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 06:10:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso4879946a91.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 23:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782195057; x=1782799857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REGPcR4Pi7Z05BCfV22gSGTbkuS69uSGblJRXEsBRvs=;
        b=Xq0U8KgZmizMR0FQ5la1CIehILKOCi3qBnMUxNhKF1+lfwTSOS0ZX61/GmqQATmKkH
         lehwzgmJG+3E4XTvTfiXyESw7mLuObDC29/iDsSbAzoZy5UucqSWGIkNaZuHSG/jWe9U
         679WJ3udJtKsJpKqZNZ+a88bH2C66rxTLrzDpflJLXU6SwwXAjw1fk2Mn1fNb1om7/GI
         fWThkNkzr7p4b9xckrEq8UAK9Yl06nC81wqrrrm1CqwdVqt4yDbcTjP87Iz+2+ewEUbs
         65EKBZA38iFgLB+mNhG7eIaqDE++zVijkFqKaMIyDSbiWsk9HqM2RpoEWq8XOL7x28JS
         rZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782195057; x=1782799857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REGPcR4Pi7Z05BCfV22gSGTbkuS69uSGblJRXEsBRvs=;
        b=Eg69t1bDWvk18BSEAMlbTUW2jTgMWPvlR7qaS99ZEGyqdJ4IBXFq1ZL4WvcudbbLu6
         ObDe7aO4mcA2qdQhURwiUbJAoEpan5ddCHPytjJcaYRjNF/TztkwUv4v0qI6zb6zKMEd
         RlbZeFonHdkA1reLMauoGHr4L5yxtR6oKJWlqrMwiEvnao5B584E9KVE36SmADJwMluA
         8VuomCYWrolkRwclw+3J0UHx8Aisn1XKkek9vZ5Xeczi7F84kKAcIQF3ca9UtOZ2/9vU
         rZTycsq/2w8uZhul5m0GXOywAoY9hm2YbA4GU6Lrn3iKaemrbtHry7YJ4ySCo/xDPt5j
         tNLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeDk2FpPl2xaNt981ul0fHnJ4wh/z1I2tRMZB6QeHL8WD7BKcxhDO0LJOIl90gm4H3QXSia/vq6QvVmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAZtzASYQ67cQrIHYzcrtykaYINNbdx5WCfzghj3gNELC4lbRM
	Iv1tGjwdxiUxUPZSKRtah1NTlpJgUyrtk7ErudJuMsfYwj4UFs7Er6DMg5I4RyCr421djMF9KUn
	CK7fC/G2wJywPR1MbrCa3M4njvNc0wZ706yjBelZzwOFMoQOzix1nHyRb1IN3FzseiA==
X-Gm-Gg: AfdE7cm7XayMT5O5H/A1sgIsVaLBCmQ96snDVEeVETp9HX+krorkqTYsGp1v8l3pn5O
	3yHxlpcu9euq2MeiF3nXjBMKPu7fkHVkF/Tn5lJKigXseDvFeW9XE1a/QSe7/xycEQvLaVTLGOL
	Tkc+zvA11A8BCetXBN9djejsY93ryj+eZQ/J1dI+beKbq8Q3QrBmkBCJAPSWlAhb8lV0W9AFaWo
	VO1o/ynkqZ1juaaHF00T0E28jc/ruPgBeoBc58CdeorYGUppgX7F7++vmvlOD43vp1nMaIdrXwj
	pFB4SNWZ7X8S2XmjaXUpKDe/qIG2rOVbr8jcmffo3XUvFokK4ft61oWKjS+BqpyJEauCO70DVqa
	eefJtoaJro6nQNTw2OyaVU1NOiAk7tJCWHq4Kvwr9Z/cKrldKnDpu1KTLPLg8HU3dpYyF+aGLP3
	SWDX1FkA==
X-Received: by 2002:a17:90b:380f:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37d160489famr16689081a91.9.1782195056640;
        Mon, 22 Jun 2026 23:10:56 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37d160489famr16689047a91.9.1782195056152;
        Mon, 22 Jun 2026 23:10:56 -0700 (PDT)
Received: from [10.249.22.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1536b541sm11655278a91.1.2026.06.22.23.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:10:55 -0700 (PDT)
Message-ID: <be7f6f19-6c79-41fe-b656-01065a69064f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:10:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: qcom: iris: Add request key frame support
 for encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
 <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
 <io3zcir73kgl7fglv5ryaayy6jdozbifodia2bkatecinxrmeh@5cb7e3lrflr3>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <io3zcir73kgl7fglv5ryaayy6jdozbifodia2bkatecinxrmeh@5cb7e3lrflr3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0NyBTYWx0ZWRfX/IsCp9tPeA4y
 lrAaqZK93CIVwP20ejxM/vBdROj8Uoe2LU2mOspsPdDPl66qBAEckC6n7berAdIJPfTzbiLk40u
 3y9yQFs6bmlkDBkDwN5C04NHs4PciSo=
X-Proofpoint-GUID: KEkPfozGMLkDkIrUZz2CE2jgvs1dtydN
X-Proofpoint-ORIG-GUID: KEkPfozGMLkDkIrUZz2CE2jgvs1dtydN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0NyBTYWx0ZWRfX1QHPLoMf7Cd/
 uR91CVAXe0vv0zvYeNk9sRGNHPkgyqFy2MFMmXZ/J1CaANEjYEeEqhq/4cR88c0ew+MMUjRq4/v
 tcyBRdjIVazPmbKstMTKodVwpYYpWr3bYt9lv25mHCkR5fLdvHT96wLshw5D8m6KGWGxkky0QbP
 r+jxYjjXwsBjitaKCM2pVA1rh87zZ9SZPC0nZCwo8UYKdF7XI1BQFpzuJKTwPZ5PwfD1ipcUbrX
 /5bzela1lQGPvCdYKdKiXPEenCJwVnafG5k0KUxIwJZJ0O4RXplnSdzec1seE+/JGzY1Abnky17
 +4nLyWWABuVPhl0XJSlIKfhcrHVTB1O8guuHNHl6Wig73f+TvIOg2Du7o3oYCczcoSV/6KxRYYt
 SSgxMU8Ig+SwXWEPOTCFMOamXIZOub3ka6U0i8IFe9h2sTAtkQZQ08I/gATUBnVZ0BfQX2clg5J
 zfH1wxUt6svKUKd82og==
X-Authority-Analysis: v=2.4 cv=H4HrBeYi c=1 sm=1 tr=0 ts=6a3a2371 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=wAVQDYQ2tgOr7hSGGKsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65440-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 328176B45E7



On 2026/6/8 4:37, Dmitry Baryshkov wrote:
>> +	{
>> +		.cap_id = REQUEST_SYNC_FRAME,
>> +		.min = 0,
>> +		.max = 0,
>> +		.step_or_mask = 0,
>> +		.value = 0,
> 
> How does it work if min = max = 0?
> 
>> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
>> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>> +		.set = iris_set_req_sync_frame,
>> +	},
>>   };
>>   
> 

When using this cap, the value here is not actually read, so it runs 
fine. But I think you're right — max should be set to 1.
Will be fixed in the next version.

-- 
Best Regards,
Wangao


