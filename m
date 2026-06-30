Return-Path: <linux-media+bounces-66088-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JSjuKgS7Q2oAgAoAu9opvQ
	(envelope-from <linux-media+bounces-66088-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:48:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA056E466B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:48:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FDALlAFD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Orz606fr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66088-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66088-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 597923099CD7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DD240E8C4;
	Tue, 30 Jun 2026 12:42:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28540DFAF
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:42:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823355; cv=none; b=dxcq9D9xP76KJSzb4r1WyUHnluNKEyUlNpMJQlCnYozBzEiJfsiZYA+r14M7uPV0xFgrnTibY9lbU7mR11CE+KWZjkBVk/ZhMb6D7O0tSBOX04M8y6eTCwmXR6HLnkr1ZYkPv4MF0fWnPujLe5Tq+nAzNOqrXXktNBLzEizm5PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823355; c=relaxed/simple;
	bh=yXo31lS3cpuo1i5+M8ce0VVveEoe0x91tJ+wogkxxl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EE3fNA4KeLTcEvNzvtQclfW6g3v3FMpOu/cV6UoIGGHsWpPhREGKS4Nz84oA7EjzmQFm6wzipLjCL/OrGyjH5fd6zxhsZzBAR3A5OCFmXF0+dHvCnSmYjiPesD/gYECD1WHqSLD+zgY8fCXNMrZ+//M4GX7stWpBu8cQor25Mno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDALlAFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Orz606fr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muZ61522287
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=; b=FDALlAFDR7huBxwd
	WpIQ6SpAtlJNosB/BjBaKCGSCxBr9UYGDgxAea5BPhA/iJxfpFmvJ7NPOpawWx90
	pSel/yL0Hy9QAJ85bUk+hw0x7kvr04y2alpgbaiqNd3LoZygWGn3rcAfEMyWuuQS
	AaPFT6C5b+WfoAzB2ITk9au9cNNvVTfsSpFdP+zhh9thg3RcFEqDJlKYgwufpqxO
	+44/GUDjNzNBntgDtsGCCSZe53+bCRnzDu2qDe+sLpFixkaqrd1yKCNbNQyysm/V
	Rtn5XnXLAFjqIECmh2rqZt1brTWzVH5CiDI1CUZi9idMKEpcEz8dvnZfx8DK6af4
	7fbMVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93d60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:42:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8ee253caso5231451cf.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823353; x=1783428153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=;
        b=Orz606frhU0Kd6MVGdBznMWsI02BYdsp0Alx5whYLA73cjMrJTAWhl6NJIyGhmiRYO
         P4zEfY6ErVJ9xI6hRFB5XAKsAmfxOn9hNfPHi/gnJ8PoYUvygguUoHIWZdmBU7aGn7+C
         0gitjqpg5z1YMm/fL0CPzYZUp1o9tmeNXJrTlbGV3h/fx25qPBqoyYj6jMtcfi0woEY2
         fiklHezuiTUzfc+QM7SwakXs5cakMTvRI4DdD4Q9166w2aYN6tUbbbBU0kGcet5a++2c
         tBO/4RZJXhKddYOTb1+b20WlM75hO090pldLKeNHgz1XmC6ajKZMajj7BcwhJyznRd6f
         XOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823353; x=1783428153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=;
        b=LOhwTbH0pC3qb/DLcIi92QqKWPISs0sJK0LqcLbU/5RgDFD5bQC4RnXQqlXjMf1onC
         DBc0fKYtY7L6WVehQ6/T4kFFdoRI1iJuSni2nU8o9JagV2fkQy9lFCnJHxSJ8mip66Ry
         ETtN4kQwf5U8iYH6wC3DuJ94WSfE02pYdYuT4UYcQqS+YVJycAEC3MaL0dUOCYn2hLK/
         YVrGNnkR7hZqc0395NAba4HqrH8gPzt1NcOdFSGgdxerfHjf/2/9Q4vfA8BS0eNAgIvU
         N18gY6ISfzTGCYdyN2+8MKusR91R9PaOP1eZ0rliA8KO3NawW3Qeo9YFZSHQ/JdNh7Iq
         B4GQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bTVQVzHHuO8LFxjyfw8+XS+IF9sY9lKgqhSw9Zy9jbv/Dv7nC7FsHf6HC++j2QOyXiRQ36KdBUHak4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzGpcKxj5Hz37kF/wdKLnxP3aQMBLRaeHpYENBtTia7GBvHGz
	xre+7OoVHtbkZb3IntEeEKq6HcAEL1JYefb/F+fCvViEWHcf5Y2xb2JREq7IxgNyEEXYeFukyaP
	0SQILzVgbn/BqHj1T+S93/9sTjHplFnVdBEkQt06h9C9My9aDOLws3vhba8Z84mBt7Q==
X-Gm-Gg: AfdE7cnG2mtaQOVYY8O9YfK72UEFG9iX3XXIv+nduZhVHrHcfNBxH6kELLsMfUjf45d
	7XaR4SMZCiNM4zZjl2HjMdaTPwlG2AfGho4jpJ4JNrHsE6KNgsoo133NaYtaJo3Rui1pdtXnybJ
	KS0YxRz+CekPCiNH8IXFMLgdpvPmmX5ejiAOqpESN/jhj9tHioMlXczGCC5pjP3jR+qPstOD0GE
	qmK1621uVoe0JZoD0wqT2h/7va1BIipWzDYfAOGUYhmxOkq4fwS8MsU2kFkK6fogVr8isTDvnCI
	tFvovlh0jBnPVbarob0wrF78WJvrCvlaZDa8NBSRpy5iXfCfm3hP4BYxGgtW9FXxT3i/Qqb8r3K
	lFVSwycpjqFdaVF/k2sQOxL6F7An9dG5Z/bk=
X-Received: by 2002:ac8:7fc9:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51c10754ef1mr27550441cf.4.1782823352503;
        Tue, 30 Jun 2026 05:42:32 -0700 (PDT)
X-Received: by 2002:ac8:7fc9:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51c10754ef1mr27549891cf.4.1782823351774;
        Tue, 30 Jun 2026 05:42:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm118502566b.51.2026.06.30.05.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:42:30 -0700 (PDT)
Message-ID: <c251430d-2184-4ecc-8d05-9cb47533e5ec@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:42:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-11-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-11-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXwC/ohIpwRi0A
 mnODjXUrTqOsTnOEm3uOZ1MEEIxSxjkzfwyYXkQShJ4hOaCdKwWrokdYvfMuNmrN7ppjXrQSnDJ
 mNJzYCw1hHJJLeffoH6H9+yD9acUxV0=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43b9b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XI7qjyBPQyksM17I1wMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: s3JxELuV2HwgtP_uxEmlEuwzyUc841Ot
X-Proofpoint-ORIG-GUID: s3JxELuV2HwgtP_uxEmlEuwzyUc841Ot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX5+p94xcMEeIi
 DSmPSLtE52dmezCEDCkLcWHdpxQAQd5YjV6ToB28Y+bsQj6GatnUJIajQ+fFq5wPyTnQsXfOh/r
 tdhifjMi7q7KknK7SioKylLEnVqUYPHJ6KPAwuEbBMTLPsvdDLTUFR/NwexBjaeyn6w+rieLvXI
 3+qfsb7bzhRXMEZTi1m1cKQ2FFJjty2VHSuIBqS45WVCAIQXfyU+RM9YfOADdAOMEztULnABsiL
 mAqKv0FvjfP3AG5HGFdp6mHVqWmQisL0ozC71ljVQ0is+bU3t6up6rBZ4tRc2XVLNL0Z9Ekr9MQ
 cepHGafY6NJO6km5CI1zMwiww5bhaKQ3+A1zfwv8cpObBqRnRkaFAsxTtIsthNYZXtRHi9fAPHR
 dQXQrlhNFOf/SFtW2+E9RW46ThIFtAgO5bRYJ+Xgt0sUxCfaGp7kmWQL/0aaLwFRIxk+LWndYrw
 UBmO7y0aWBzBBy8O+dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	TAGGED_FROM(0.00)[bounces-66088-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 0EA056E466B

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index ea9654dd679e..d2e7ba4f37e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -110,5 +110,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..3c0727ea137d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_pas_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);

This should not be in the middle of a mildly related series..
The PAS IDs should be centralized into a single header. And the
name of the driver shouldn't be part of the define. I would guesstimate
that on the secure side it's probably called VPU or VIDEO

Konrad

