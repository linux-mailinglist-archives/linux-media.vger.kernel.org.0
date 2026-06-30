Return-Path: <linux-media+bounces-66087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8GICN326Q2rLfwoAu9opvQ
	(envelope-from <linux-media+bounces-66087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:45:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DDB6E45D8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:45:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PZsvIHOw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D3Wa7LOv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66087-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66087-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E819305B97F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766C040E8F9;
	Tue, 30 Jun 2026 12:41:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554040E8C4
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:41:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823292; cv=none; b=KJY6NAGTXHHTm+tM4mFeRXFpVtBfUJ4oNOMTHibI3q4xpDYU3Mhq7+ErUQ68FOJQc3eNZCpgoFQl4DatzxQ81gIb2YUU88MzPeq+Uw3w/IOwugZiILdncZSmg+L54BeV9bzTGRyWxh+D6x2kWO98MRLvQ9WglmcFXwQPvA0jaUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823292; c=relaxed/simple;
	bh=jQD23j2vf2XXCyCGAPYr1v149ZU5HdPGAyLFjjrpeEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bCO7W/Mp0Gajna0F2rtBesFuWFb12RXbPpoo1SBw7u2gKscI1lD9zV0YCQGwW8vAMpZPP02V7T9q5iAk7KVdGB0u4qhv8xqvfAc50PY/oca78x8uU7pttCYJiGl9LEwynxlWqaRQVZNZKZ0ev7qB5LDZf+ildpx5s9ApIe9Avxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZsvIHOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3Wa7LOv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4Kh1508630
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=; b=PZsvIHOwGcpw1Si8
	mjM5tSeCEW73QMW3pin7A9aNwjptzuikOdaZziRc9EWb+Lwj8nI/lcJb7cE6za6h
	cLx9tEcWyKYljPLsaJkqt1rhRwJpacz3La/f77wc05T8v2A9GTcBWr9dJtX341vN
	bUqEp5fLEOESTWBWc8CY8zeqUKgJqBiaG9dsmhBfd0CJHqYaEq/2IrW/rwR53imk
	STlC6MpL8J2CK4lIgUtWLqlG8+r4dS8XU1CHJMlU1ZY7OU5Cvf5uHI9dn6uDylJI
	C/7DwbOC/0Viob79NGAGUiYF4EqwK0c1g1SpktXNREopXQ82rQFYORYlJIwhpBe2
	jS7SEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j3hxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:41:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e69a569ffso2748385a.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823287; x=1783428087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=;
        b=D3Wa7LOvjmBkJYavabaQ8mgETBvsgtzdjDsT8a0wu3B1DVlxP6GsCBP86KZexY2F5E
         SxZ7n5cm65Yo3im82xyheP0ZErTuL3Bgh7kp9VHOY6hGWsccqju433wAbVqqFaWqGT0O
         f53oYiW9dPLcEoKjLBHePv5icI79W9fvAr2Ym20jl+4T0NDWIPCntfG8owBgfkrnSb+S
         6XAX+OL4H6V4fOKAhTTZXtLgF9t6gJEkFeTOHxL6hdC+M1bnU8SiilHRb/hhoSBdWt5f
         KdMsB1cV0HKvwYpyNdBsIy+PTD+SObCmxTPmI6T74QPdRSqG06bH9wEOUz6Gpo0SK2Kz
         JO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823287; x=1783428087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=;
        b=UuSh7O8IvNvZyeSHXbb0ThsbiGzQWzkfD5iABpXl7CunYsNKVfVLF07rAxP8KbBhpG
         hhDOFSmPssFyqGEnOfBP92GsifyilYZlrsrXpF8EYwwIWLMleVdRzvnzrbmDdIqIa+5l
         0Vu672P1JzgWzwCORyhKmFFRQTf8SmKtEgI1VpW9rXwIeQsji69WnzDeAnReiesHTyRP
         GzzZo8QKoXJU2ZCxwpcizFMf36DHpJ/AQvUf0xtxrUqgOZ6eNUs4Szm4BlwJnypgVvKl
         71y0LVXM0zJcXy2Ce7PNzbIFiV3p3ooXkspPIpQS6VIhOdCwwHJLD15/IEAmw8h10L1B
         Przw==
X-Forwarded-Encrypted: i=1; AFNElJ+ChLCTBjIgHcHDAWB8/2ooEzNw9Z2YRSCmIkJFskTiklFyPf3dE+a3xnyFkSLNWNj80STYTnAM0iRd2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAQOk8Nf22fdtXZuptB18D+X0EPfhKNdTxhiRQ7euvE3Xl6gv
	7tmLbHAMoyl9rCjGgeMdVEzn1uN6KbvOqXRyX0o66kLEKJPvBbHp6PfHIo1fYivEQwbvxMQbh30
	tbk7RYoSiHEYlPfmw832Prm7pfr4rjNMXy78U4E5xjKQyr+98SenxikSgYiycf+Botw==
X-Gm-Gg: AfdE7cnsVT1xghhIssrMcKmK8qO/hzR/Nir+uXB/FXVfooeWPcYTTjPiBLvMImpr1Do
	ONVaW7r1fUKDGvLm9PavYIR2Cw+eId+9gU4gr1psnHnkviO5tXUHmkzl8B6lTmy+rRVub9cyxiY
	CTqi/e+sV5GEcuIYq7I+1eBUR58J7BXliptx8LcCKGwxgfLZjw9F7cu/bSICDCYMAgd8qyTuxwx
	3lyiuyb1AVnppcrgcAE/bUzPRQKeEqDRIdtpGBkZlU0MqVedmPinqf7OEypN/rBdGhdtrFiFmws
	rkqVByzsZb1rIj6+dOIke4KWwdgn7PUzqbnPQqqrctcqP1bxLmYjdi5q4Fu72poCiTvg/5OmAqh
	LuDAU3aCXBUjcnhnC66b3w1Srnh4r/89WXxc=
X-Received: by 2002:a05:620a:8813:b0:915:4ca0:1210 with SMTP id af79cd13be357-92e62689c4amr349002185a.3.1782823287426;
        Tue, 30 Jun 2026 05:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:915:4ca0:1210 with SMTP id af79cd13be357-92e62689c4amr348998285a.3.1782823286896;
        Tue, 30 Jun 2026 05:41:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d18735sm121211466b.6.2026.06.30.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:41:25 -0700 (PDT)
Message-ID: <ba22eda5-bc7b-4ac3-92e8-c14c4dc13483@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] media: qcom: Switch to generic PAS TZ APIs
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
 <20260626133440.692849-10-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-10-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZYKxP4f907as-F9INYXx0KDYtmcAXAuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX1u7RPZoLlv+h
 YJU/WlXXxZqS4ypJYbAxH7GnIJ2EB8b0Ggw+ukqBqg13zX1yaHz+3IabF/a2XQSnDdjyAAv+b6w
 6mgf7eAoKisO9JHHrjFbaPpegxxEVw0aMfPk+GREnM83ZkrAB42r/U2aUtweYlpUiIspoTxckWU
 IOY14m9VQBCsY/5Ef2y8wzY+KgWu1KQwLK9g02BbKYIrImjtcqlwsRVrij2a8NrXVE6V1fnzGwL
 HbBq5vamyCKEYum3W1F1GLmaRc/in4TV5/Bz+5H8tL1iwFqHFWD16hGB3XIpvTjVdP6Ieh8pBxf
 MfJ+prh8vxzrZvCM1IWslYqT3xi5d2TPGFMzmWR2vRAxWw42Fyc2k5OLx2T7WoLN3LPcTAaAKC/
 leud1sBy+jGcg/MhRKorXBYWHscN7fD2j4VYygxAvSdi/WMo6P7C45M2G1sSiIms7osa4HzJOLt
 j9f2shFRsEZl5/W5OXw==
X-Proofpoint-GUID: ZYKxP4f907as-F9INYXx0KDYtmcAXAuD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX9/bQn8XwV72b
 w0dcHQbkfsSaXGnIJeGVK7lCj+h+jyhbR1oN9cJk9A+dVDtAYVkrtmm0zPEj522RyeSzQz+sArz
 P+MgSt6ODdVDkpq7G+2rPlETP0fW1Jc=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43b978 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GN6ll2GKXf5L_uNS5a4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	TAGGED_FROM(0.00)[bounces-66087-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 84DDB6E45D8

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

>  config VIDEO_QCOM_IRIS
> -        tristate "Qualcomm iris V4L2 decoder driver"
> -        depends on VIDEO_DEV
> -        depends on ARCH_QCOM || COMPILE_TEST
> -        select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER
> -        select QCOM_SCM
> -        select QCOM_UBWC_CONFIG
> -        select VIDEOBUF2_DMA_CONTIG
> -        help
> -          This is a V4L2 driver for Qualcomm iris video accelerator
> -          hardware. It accelerates decoding operations on various
> -          Qualcomm SoCs.
> -          To compile this driver as a module choose m here.
> +	tristate "Qualcomm iris V4L2 decoder driver"
> +	depends on VIDEO_DEV
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	select V4L2_MEM2MEM_DEV
> +	select QCOM_MDT_LOADER
> +	select QCOM_SCM
> +	select QCOM_PAS

Hidden NOP addition

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


