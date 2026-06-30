Return-Path: <linux-media+bounces-66090-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9uYfBz26Q2q1fwoAu9opvQ
	(envelope-from <linux-media+bounces-66090-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:44:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE76E4593
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:44:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F3n0sFhN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UedqZOc+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66090-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66090-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C846303F480
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8780640DFDC;
	Tue, 30 Jun 2026 12:43:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C764C40BCDA
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:43:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823424; cv=none; b=MsXvJg7RNoepuKRJKgkhuf9ben3hZBjs/3X8P1yG3W2Tr0StSV4SWvPSeZviNqFP6PiAbqmIyWme89Jt/vSMa4hvBM7S2wVeeRQ2GlgBRStjKGduNAxWayFPAu7ihG8zmV4Da1P92C3QQJIW4P8TK/qOTWepFbZVItO66WFetns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823424; c=relaxed/simple;
	bh=BgY00mBvxWkHejgPkucyLWTBpsCWCY5fK1NqMPCqd+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC9EQ7xyw8V8emMdaFExC/3e/TyNhb0L3HPGEl5DNmx/zzy4g5cehLtNYtbesmjhDpHHJzrFR9LOHCAUVvpb7au4GblmozDgHtY5JV5txfrMneQyKaWQvDYtIwddigQ6QwRulzSrrb2Wvl61wsAqcShM7bubCFn694W3tCNzcYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3n0sFhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UedqZOc+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n9s01605917
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=; b=F3n0sFhNv4vOtoPY
	BXpZieU5OTwgT+HxAP0Ui+awldHBAbEr4vblIJ9IdeTx7g2gtRrx1GseILh+9/Zz
	aUmOUzW30aW1DfxX0b6aivoylCA8dyu5nTTHJxTXKFcXYQeJpUqRYcH+cRLQPY2L
	mgBawKtvZMT/4MLeuXXScRU9UDEzx2vtpgQNU524wiU4QVKVdS2TJuOs1bU1B4gY
	PP3d9nugzR1z9WpP3ZipFIsVzxeM8o5ivIptJ8TRF5ogVjGNk69Bk7kkhKrB4KZH
	SX87UJJTfzONkxOeiEhrA3XT5VKplB3UT3HP8JIyDOMh/eDIuUKMKAkX4IkMSFbr
	Mib4eA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5tcr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:43:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bdcef50495so3959e0c.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823421; x=1783428221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=;
        b=UedqZOc+rqU/MtSH03B7AJY779it/pTkJP4J5i28GgIC0o8ho1o3hdu4M12l3vyfjN
         kbplrwRR4jfH0cFYyJzfnokej6LAbjM6XJQ3iRiaorwK271KhRx313fiiDeJo7iCRz8g
         VIZPshhB1UvppaFlaV2hZi5NF2mjdfCVxJqd2ZagYf/sjh/SIZZ50IZ7jIvogIqfZSX9
         sMCQQRJMpzeUwgcDy3NZ1OIdWSgb/8a7JlIC1kQht9dQIVSEzXt0B/R3wo5fFUn0fgxr
         tUVDb+oBKfz81nK0FtNw/e66791FhD5e/BrMVGI5lxzBOZlJJ0kviYWKk0V374K5Ja06
         SZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823421; x=1783428221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=;
        b=QVpDu+DbnqDFVhGZDJnk3mnbHsPMIv2ZpsnzFYIzMZiXTFHyeWsrFA9PVcHLlrUU6c
         M57Uz5i6veanmMW2+/DlyDlLhMJFcV1FRhFTIAn1LJVWkqjcS19YTS82Q0nq56I8/jRs
         52RA6n7Kz6eGZqLCQZktDEtZg9ouJnE5CylpIFzyQg19+pDabA02EBM4sYEsFxMXUBht
         wUDR1bNuTYTU7swjT3N1rLe7LrOy+BD8Mp9NnLjV6hJAbVNQyO9ETOoyIJptfY8I8GOO
         CX32vg3WwDOfDxGwcHVAKp8RqA5hTLn2OXMccb2qTBiCz3uyixxCgPlXP3bx27FgBRB/
         RhgA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6pP1Uw3vf8PVSpFw8hkDiD3tnogJcXrqV+QiW6uBWfRjND4SuFDwZQlOrVgToEOoUOPQjTkdMe13BEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lRbqeSoJMX0EVxc3LAPyqKARYMahEQfMOVragjUODMMc5pFc
	Jz+sfMkMGoxC+iVe5FQDyd2hRkkgHApU2qI8aPWfAXCHfIyg7RZDhB9wWoilgqp2bbwwqOcM5n7
	maJVd46XPqNCjPGe8o6VNVMUOvqDkvujFx9QM/SVM7cI7zqSpgcLtyc/t1JuUzwXTHQ==
X-Gm-Gg: AfdE7ckWT5mzr9qla0dp0pWidtS6gmAHAAzDwUqfrVa0IW4uUSkazgpiFnEX/D1jMm5
	4xy7jrb8Q5S4LliV5/rk9s+PrN7YMAQZKHzzx3KxaYtn6LsD5jf9J8TYigD2Jqrw0CXIj0+Djxw
	kLjvjrpn8eR0WVr2+z+QlwXYq69Juq011C+H0jxT4nhJzyqsUIrJRkZovyu1YReRmVMwIYRF6lq
	L6MpctPCEPI9sldsbJRLC5nc025ThkzY1rUiH5fdfnqH7Jm16mEVLajdpInbV5D/4uu4hnu8OaD
	OPsG8BamnYkGnPoTjbGU7tC338wm4Vpq9YxU1XSoQhO94OCH8rHy8g8St90S2MRwViIOEw4wXi6
	FZb0hDKpiUT5zwjfC/vZlAaAGXgkFthOcPtQ=
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr493257e0c.0.1782823421024;
        Tue, 30 Jun 2026 05:43:41 -0700 (PDT)
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr493224e0c.0.1782823420597;
        Tue, 30 Jun 2026 05:43:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968400sm1127666a12.25.2026.06.30.05.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:43:39 -0700 (PDT)
Message-ID: <e05fdb45-0ebf-4dee-8d25-05dfc65042fd@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:43:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] net: ipa: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-12-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-12-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43b9fd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=smRyAmGWe8i0dDVrb1gA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: XR83GuqHSRJ5T01JBWc6-wUDuEKbet2Y
X-Proofpoint-ORIG-GUID: XR83GuqHSRJ5T01JBWc6-wUDuEKbet2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX7mN7R6bEUxoC
 DgdajBFHZHcPSSgszL70OreJHFhogFsr9IgdPaXqkEmAiczZ9Ud5EGTI1l/bXBW40sYv+wljUDk
 vj9aH7y3AxwEwqc1k7WxOw0KAjDP7Q90uslvO3WI1tsLBwPJOQFpDDDyVOxFixR3WzPxbrdjEuU
 DK0dn8SOEAO3yjDU5u17R698EUsjaUiKpaG6PYI6OaFOZkr7fFbijbIPiCsuQ/CkEIEdv4yF9LG
 d1m1DUXvRxn3XO5J/BaAQp0QupZSOagl1kOmKeciMrKMPnZMIDb1hz7kEKE+41xQgZnuGMUoPDg
 vjJvDQIA4rdHM3bmVW6dLI75b0F6Pt1nDAKrBp/J10NbCiYhW/SZvRFwDe34tQEWntn3DngCiGE
 +mA5mruK3y6huyyVBMsYWl+vkSWnKpKd0cDiZZ+ySG6M16r07qST/X7JXdMwZH2+TJdkOhOIBxT
 bQAp63ApJXaBk+zNE3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX3oQkaQ2DKs2c
 eEkPV1AepYN27OQAzdcMPN0Ewn9itN+16ZTNdfB5B+E6k7eL9FJcg53o2pOHyU3iDL5Fdpm1M0a
 klRlGPKsU28fxU0PdYLd6X7+MeclcfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	TAGGED_FROM(0.00)[bounces-66090-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:elder@riscstar.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org,riscstar.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,riscstar.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEBE76E4593

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/ipa/Kconfig    |  2 +-
>  drivers/net/ipa/ipa_main.c | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> index 01d219d3760c..a9aff1b7977d 100644
> --- a/drivers/net/ipa/Kconfig
> +++ b/drivers/net/ipa/Kconfig
> @@ -6,7 +6,7 @@ config QCOM_IPA
>  	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
>  	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS

"meh" for the reasons stated on rproc patches

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


