Return-Path: <linux-media+bounces-55206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN/DIm1BsGlLhgIAu9opvQ
	(envelope-from <linux-media+bounces-55206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:06:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C61254429
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29E50324A456
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F726346ACD;
	Tue, 10 Mar 2026 15:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZjavMOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkOJlREO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D85632ED40
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155996; cv=none; b=pbEPVSy9pTy5k7CN0U9ynaGCAFGcnR9f4WVdn4VAtJ7NWYVWoHzqxonT/o7+RMGw53Ja2pQcCE5Zh/tiL8e4sYGSmP4mTKBwq5JqpTJ1KT/Cpu0y1jhRxL6qh9/u06TsUJCZBOMeenN8yloy8qy/6fFhDnrI1ZJBajxS8LyHLiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155996; c=relaxed/simple;
	bh=Y0Wdue9Hov/jeRThd+ve+ss/+RVIzkAy4V1Rl8ezbvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeguoZBjEGmcSyFg91OSxCv5DpPjG33rxpQ6lHwomOpktwu7vXYQ8w43npPc26q7x1oQTqj7new4aSCO+KQfhtt6+2DytqXJ/ibjD9Wkx1Ghd8ZBAdtr9OpXXCiI2IBR/WqorLbjtbthSFyZDlZ/pLDviKleaA0RzhvJpGNVWKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZjavMOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkOJlREO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACb2j23760660
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wr3E3KZIgt2SmLWl7S/JE0LCYCkRItSsKqlqEkGNm9I=; b=XZjavMOu0f5qzxrD
	rsWdh7DQEHy+VXqOGyO/zY7uzEcmTphJp0ImC/5+zbeOl5SkoL/8EbkAx6RmLhQ8
	snayLccF3TUh301ZjzHD54VijsdfSDbIqdlUTWh/0jSWEvx3qtN26Mpfqq0cOdrB
	lUWAi8guEa03bX6CGmpbFlxvYUFEzJrUC37c1Ze0RtFHXG2N1gWrBV3kyT6t7wzJ
	sLuqWjvAytMKsae+bXZsPrXBPMXfAh/XdmTGmfpieBBnMdAZJqiJcF/ZUyEgz6j9
	CgmnaoJz7RGlg6ZeTJ2ukz0fd/9QQ8vTbK+pG4GHV3nkNxwII7K8xL6NhDm5SwzJ
	ngNC8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ugp1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:19:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506549eb4b7so903286121cf.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773155994; x=1773760794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr3E3KZIgt2SmLWl7S/JE0LCYCkRItSsKqlqEkGNm9I=;
        b=GkOJlREOX4271PTuKfFN8W8PqGo/3eFiVUzDdI3gPoxPu4dLVGrHdJUNpqNElHR/S/
         xsT6HMbRo0Rkj1Toz8JwAkvWppj+srS03p/LaO3sKlbLVzj9FD0mIwKWg5WaIy/XbWnf
         EJzFl/Il7VD9j+yBfSTcWXj8hgZeSLiCiWjLHO8g3MuodF6SAOPXo3GxTJHa3ZIDokoE
         8AjArYBjFttToRpx/6E1cgdTlzIsS7OLFfi7O5Rscky+JRSbgYbhlrDSPqCYqAVsSCWZ
         T+fjhRU49ZFf1V52eBqQ4QIXsxcWIfaPZcHNtAAOw35XjbuvCRJ6Timcc84ergp1cAQn
         fVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155994; x=1773760794;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wr3E3KZIgt2SmLWl7S/JE0LCYCkRItSsKqlqEkGNm9I=;
        b=e6QmzTLhRXYfCOP5V3v1CJ7Phq5EEGFtzXneNKoDr0qf+5o2iLM1yoJDHxB5KPWfM9
         oU+eBeFyDKQEgdv6DCYZ0C6RdZostj3UItsQO0nf2gFJFVLuHw3Rjse61ZNjS/0Zrg7f
         /wGGHQm9xYmn+IudEAyjel+we0hoodeNSO9885oJlTgBNNVZvUyq+EKRSdXjPz0sgqhM
         HVW4hzzjLxGULf7NNH2jCOTplPQq9oXCLIRSdy3SgrdsH2ubD31Npm/GQYY1qnj4meuI
         i5thvw9MAGiFTk7ra23U6vZYFsU3ninZ/7ugQDNdYNRc2sGlPPd9pgibLz6eVcXzvrSu
         y0XA==
X-Forwarded-Encrypted: i=1; AJvYcCV0A6YServkm535oSItJ4LFyV7MfSMBdR07grc7YWk8QqhJWRZoskfwoDBYVcyx5YlsjYy/C0jByZ83fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCrOaQ2tmXZRgLTD4OCpAk8+oOfzMn6jI677xlHYQNRRtooW/
	mgnLM0UKUKlHOksNpm/V8uSWAqnwwrGvCthuY2s1l3sAOjVhZOivRGHv2Da55LbM18lRNJIyXsX
	oVM6RoYPzt9fEdD0D7LanlAaTdWfBFMZ1GwrDkddkBgQVV8fSDx6JpsJSH7jsvvuq9w==
X-Gm-Gg: ATEYQzzoWQeBH994fnDz4ZGUztBwONz1twQklYQa9rkpHZ+hst/rMvv4Ox+gHcKE6PN
	GC6ZCsF0CBC1x9bXLpn9vUxf3NTVY+wmBP63QX0CiXU9QABeKGOTwFqBk8vjP0CGOOiEJsbFYwJ
	9adoJohyiKUexppgLohyRXgS5x4pFVaqsMuVCczYMY49CLaDmgHv99L6Ri/6IqcCRNcrg/eNUoF
	cl6om9w5LtxcPrbgDzC7bD0Xohg+Fwm/HIh+99PxJXdjz83zxhXMzIKhoqd92fmfC6qqOA7YI7z
	IQdwyqoIN9C/zpORUHQ1k27+f4XGTDgR8KizWcDNqwX7vsvZMOcAs5Upg5AHAexu/gAP2Pwx48w
	UMablZdq39TYDBFsA0mWMfhaWF8nqHx8NQmxC6qZcPx/gq+Su
X-Received: by 2002:a05:620a:4485:b0:8cd:94f9:1bd0 with SMTP id af79cd13be357-8cd94f93e31mr348407685a.48.1773155993637;
        Tue, 10 Mar 2026 08:19:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4485:b0:8cd:94f9:1bd0 with SMTP id af79cd13be357-8cd94f93e31mr348403385a.48.1773155993066;
        Tue, 10 Mar 2026 08:19:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3c80esm32983764f8f.29.2026.03.10.08.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:19:52 -0700 (PDT)
Message-ID: <11a0280c-052c-4cc2-9761-44acea55ac33@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:19:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
 <8d965895-c77b-4d67-8365-3ea6a8ef5fca@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <8d965895-c77b-4d67-8365-3ea6a8ef5fca@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fSKEI3f_Oab4zsRMKCrmJuSuIe60Vgu2
X-Proofpoint-GUID: fSKEI3f_Oab4zsRMKCrmJuSuIe60Vgu2
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0369a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=y30i2QHNpJnWzB643pgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzMyBTYWx0ZWRfX8IqhismFSAur
 AMaoqJFA7ysvgcp5c8uucdQtoa2Iuegh7pUVciO0GbE/XFvK5AcJPb0haVYlSdWHyVmrnfqaT1a
 7gh3ybWSBGiUgHKFtvuoKm1XhedPm41eh8Ro//EZD4FigI6/mgiqWOJapSNRdsl2nFBum1/RKdO
 trh5LTjhmqxh2ihHmh0yQjjgLWIVGhLTbDpNOlYnPGo+zyWrTYBXoc81azPuwNB5HjLujNHfTYP
 pzGDTJ0gRP3VklYZC7/PW3ynwlpW1bHPf5NvrqaFmnihyUGD5ZzhNlY9bOdcwgLwECTJPVlJR+J
 KbDirnoUn9WSwZ7Z3uC6KtPCyW0B9IfrJZollKFYsqCMNep6N8XRPM210JJu6Iwi1/Ud48q0lbN
 y4lz/inTvNy1EeAD4onKL5Q+Ci0Sp3B4rZ/U4UonoiEmVOc9xR2KmN4SmVMljekCP//l84PSiNS
 UUVz1hIwxndVtssRXTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100133
X-Rspamd-Queue-Id: B9C61254429
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55206-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,linaro.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 10/03/2026 15:35, AngeloGioacchino Del Regno wrote:
> Il 10/03/26 12:22, Krzysztof Kozlowski ha scritto:
>> scp_send_ipi() should only send the passed buffer, without modifying its
>> contents, so mark pointer 'buf' as pointer to const.
>>
>> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 
> 
> Please fix the commit title - that should be `remoteproc: mtk_scp: .....`

Ack, thanks!

> 
> After which:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 


Best regards,
Krzysztof

