Return-Path: <linux-media+bounces-54835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHvJNrxOq2lYcAEAu9opvQ
	(envelope-from <linux-media+bounces-54835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 23:01:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A32282EB
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 23:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC62B3063D4D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 22:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3A2494A0F;
	Fri,  6 Mar 2026 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZFxCCUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asARMDYG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC03F49253B
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 22:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834458; cv=none; b=MDrNIFDSMO4qaqNnpyJI6h0Zdd7BJ2kyeLYpuFLiDfGSd0ms5bDIOV7NMBE3fp9R3uZKnpoBidHFxlwonctDysji9QlVNOQLF4mvnZknq8r0Fs5jpbW+its35mS3RtserbFjyjdTkBPtkZJoZil9o9rYkBKsL/3z/vD53KcYEdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834458; c=relaxed/simple;
	bh=swHjPgms4MZhnC7AecoYqmjnZlbvr8+euga4dr04mLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RU8cgj0/tiOxcO5TP2Le5yM2Rx9+2CaiMhHxqtjh8PpY3WGDYSIHHf5FYdy6hL6+6hIDjpX3kHdPEwn4tcgXwbYIBtfOsYaEDw0yGVPIxmFl/KCTdnIGRhTRxXxa7qRrR4cDJGpsXDckA9wc6+tp7lL/9xXLgnly7nEiIBn2Qrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZFxCCUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asARMDYG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWV891128224
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 22:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=; b=LZFxCCUn6WpNEccg
	RJnzb64jVXdN3+LfB8r8zhZFKZvCxW7dwcQdYCpWhoWQ5zLxLUR1MJomYdDYFV7g
	52tgon9P+7hTkEdj68q9W2y7TrE9cQcZblIsqWVLvUR4AykkuAbEZdh0MT9gpOUz
	yn6Ebl0mn+fs0Z6dg+vdt16RUdTBDUpiWWvlf7fRoTPE4pboJgPsI061h4SS/io3
	Tp1FjnM5LfCpfd+0/fC/vvDevcujlhfid2NYFvI4lIa8Tutb81vWpz2IIkl66HLU
	0uPflehAB6a3WuWNrav5pU+XcrN8ONqkeOcPSYbv0jhXD6lYPAb8BSyHjYt1piO9
	kJQLhg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2ye0x8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 22:00:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so8701576eec.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 14:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772834456; x=1773439256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=;
        b=asARMDYGOd0BTYbG23Zg0nw/Jj8dbfyWM2Jy4xaoCZvRmTfA40oiSPPC2iy3/5mET5
         HyHcl44E1aGLymqRam3/AHB5wE5cjErGLM6fSpHeIwQhUPUDTlSAGmp0BUxOyS8ZBXWy
         psqSSb0Zrg3L0MxE24H/+YCLP6Hw38vVtKTiMPgW2tukORlwvciAdUIJ0WqvlyWM1LJK
         0oJTBDlMsgm9L0IfCWgXCzYRyzzViTlajTxYoDR/aFJWsN7BlgOriULdxh4IeufjlrRp
         1trV4Q+UtuWSO18u+rl+QfTeg4IoybFx1zUx7ckMHapYtF4Dr9yr6H6vUhbXQpx9qR1R
         HSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772834456; x=1773439256;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=;
        b=Dio+d4UW24olGIg/9ts6zcJeNYeRKYNLl1Elm5rQZZsaHk7XYaaxgGokweCS/7OKou
         Uxnr31+SBhU1P0zQSTRcyKlMGft16lt0Fd+sk4CbZEpuiPl1A4vibMClCMip5+8oUUEV
         JS1UQEPzOWz5eNyhz/qxk5s2gXfPUpwuJELjk9Q3AcKo3SDFaFQuxSMLLOSuA0dwgK7U
         +PPdr0qY+mOU03ODTy+bImokzvr3TK5JmQI0wc0njDDw9ApT8JCskrNMg6TrZA+eQJ9l
         gopUgkfynQmNPgKFRA87fTVs48Ya8WoyN6Mh1VHwbAflC3DbDEMJqgJIdmkeXoE+z0TY
         A35g==
X-Forwarded-Encrypted: i=1; AJvYcCU7bT6uvmoHHYr4wpMfoawPcTvpUgh9dD+NCAq6jRIAwgS5+eTjMcnnf+qjjVAgOu94k/IdCycdXDxDow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm4FdJAPZPchjjXfX3e7FgZw6uV0UWao2fZ7EzDEGtwQgKmkPW
	bl9FzJ5bgzRuUc49fm3UpUGRcTa5kdTIdrnAv5FYcloWlXHSG/hYsQZ1U6XdqIondVXFI5i2eOJ
	nvM+YkAXXkzpCIFVaK7Thp5412KQNNVo9CaykUge2kEf62QWK5hA2r3srupzOpvinzw==
X-Gm-Gg: ATEYQzwVMdV+m0m3DUDmIOmjKYt6abnuF5unVqDllNmBO4wRmR6zKi68WPNI1lInOai
	qla/fknqcRqqs9P9ozwgBGKFc/eBK67VcDVwEyXvjxnftBEQgqSe0dzRGxazmsQyXPfjn0zuovt
	F2IZl4+GgoDv5gT2TYS4kGLhtTv+uvId8xOgcxTm9iLgvi/2hDP7f0jR4ej8d3SlGO4AVM8/nWe
	5xnW2rQMEMUgRGFTY64nsKQJlQK9KruxxInxkooMK0vRjzZ4LnrMAggy9qbqndi9MU+cJGUkj06
	ms00QbH/VpXbvvzAggroxV5l0gSr2AUL9IQF/LYJt1MhlS0r6Np1hadhWvry15k2t2NLbjKeaS3
	A0xi6FgVWOZQ02C+H16hCdLJKUyvwap+xFf1R7NhtJ6WTGIHUDLxpQpohJQcPH9goxHDcthDAmX
	sRZN8KpQAP6wIWkw==
X-Received: by 2002:a05:7301:608a:b0:2be:1946:8587 with SMTP id 5a478bee46e88-2be4de8f969mr1272708eec.9.1772834454906;
        Fri, 06 Mar 2026 14:00:54 -0800 (PST)
X-Received: by 2002:a05:7301:608a:b0:2be:1946:8587 with SMTP id 5a478bee46e88-2be4de8f969mr1272665eec.9.1772834452873;
        Fri, 06 Mar 2026 14:00:52 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80cc1dsm1962924eec.3.2026.03.06.14.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 14:00:52 -0800 (PST)
Message-ID: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:00:48 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIwOCBTYWx0ZWRfX3MJfL+qY/BZm
 4raCrSwSuDjbNlRwPgkERob6x9NFfcYKDC3isVkZ55no7/yTLm0Y6NvknfdNMc7gp4YNf9S7EQ3
 ehtOkJ47nfn1oSRZTjaheC0TbTU8Nk6poPyG0uYTRE3Ui/zOVeNm3YHPbXS+hUcd2D/rkdeWcY1
 0b+d1PnDdUxH1RR4naT5WotHXWwNr0uEe/fQ9xFfDe63KRBk2khTiYCxYkA0mJc//H9iq6TliqR
 aaOsutvI/g+0jTDbx9TPKk2v1eRd91hcNkH5pdCPZWRbTEikOE9U/Jt2O8ZlThDHmADohdbqPkj
 htikFMiAH7yHAO9uqPYKVdc0BREi8I0bB/XbzofWoaRqKdPIY7PDsUvGTiMjzjB9bMQE9kyb4dY
 NLuUdeAuKTGrn5sHxAxlCuFKtEn+AKuPPzf8U9W4mpNedsOYWde4cGPkmhTACWJQGOir9ZDKSbY
 meIVXSctoT5nayeI3bQ==
X-Authority-Analysis: v=2.4 cv=Bt+QAIX5 c=1 sm=1 tr=0 ts=69ab4e99 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JJlnT80H4U8AMWgPcGUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _lROic-rTMAzGzb0lUcENO1YF7GZTwpt
X-Proofpoint-ORIG-GUID: _lROic-rTMAzGzb0lUcENO1YF7GZTwpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060208
X-Rspamd-Queue-Id: 547A32282EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-54835-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 11:47 AM, Trilok Soni wrote:
> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
> 
> What is the convention for Qualcomm authored drivers? In some drivers
> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
> clarify it here. I prefer consistency here for the Qualcomm submissions. 

WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.

And in reality it is very rare for a given module, over time, to only have a
single author. The git history contains the real authorship. So just for that
reason I'd drop it.

/jeff

