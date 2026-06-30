Return-Path: <linux-media+bounces-66092-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nv3AHQC7Q2r+fwoAu9opvQ
	(envelope-from <linux-media+bounces-66092-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:48:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94E6E4663
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UT9LN4wv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OMntgcYH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66092-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66092-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D072A308DC97
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9005B41166B;
	Tue, 30 Jun 2026 12:46:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F9E40E8E2
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:46:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823564; cv=none; b=ufyZMavHJQ3LaqbnpwJfm5XlwaXL48/mfYWKREKzWDRje0dUualtWsCddV2pNTwi2MvPj6pud5K6PpzBaALdCQLaYsMONL/4F9ENf7uafZuVAyV0Ryy2aWI4EOwBHsOZkEqGDyc78gLh/tUAXdokO7bgXtXFRF79aoGBQ6PnIvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823564; c=relaxed/simple;
	bh=chBZiGh7yrHmSBv8RUwYVeMHSTVTeDhaR08RhaJsvHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4P0tPm9cH/66MgwM0/a8fJjeW0FTI2BsZDhNIJOLLZVTc89xQTnVgS4q5VbFCv+N+T1noxztaRu71Vaqii8EfzdtY5okmuK26DxPVA6aUbG6y9Zjb5rPLlp1CfjeLK/1/xZ4fmQt4V3tix3QARdkdzx/W3GTJ+ftfty7XHowis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UT9LN4wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMntgcYH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDau1590648
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=; b=UT9LN4wvBVpM64j3
	F2jAsfAILiZjYRi/KlD2eQ0MOKeqL67WC5X0+CrsUEriaIWFUiaGoLlo+n3Pwl9J
	uHDa0/8eFWFat/YWYLfcEJwEd5QF6bX9Z4OwXSJPbGg0GoMUjJkAUkQYMeCuapko
	T5OrkD9h97gJvlQSqmdsZWKCDQzeVfYFjItUkRfQjt7L4093O0XaIj8fw+CsdQzC
	6IzFQuULY5XFAu2s+/EvblbwfMuHoMlkrDqXKEflaNf/oL5S1uzyQqnYyoqrWkwx
	yTqAI/l1hiSsDIEpN5kwtUvgfTLuPIyzfTdhrgxG+nHg7+1/Cl2Pv2f0ACbtuBXG
	VvR2uQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3k58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:46:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so431269137.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823561; x=1783428361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=;
        b=OMntgcYH257QLHSh/HIJ+MQFm9qsxmm+XmK+Y1Iq6ecUdmdRl4MZ3YIczrzS3PjRAl
         nuPA4mDk7ypqSrDazuV9ooVrxfe000mGjsrLzycfo+mB3RY+HB4q9nQij/+7MdUj9EYi
         DLrtStZzR9y4Os0O2O743yF/Co305KNLT1ISNQkhatnLYHe9M5DE0ANeGd7l0KeYf9CL
         3fnCmc2ceLz411iWiVhw35irUmLGswTpGXWTAsYJouw8yevd/ew9gPhCZ6u+b14/vgd8
         mUxUmxLFpL/+4RPffLMX2grQQ5dgTt/3hniJzM4L+pCD3AZHhBhcXN7bt+SoSQy8A6nx
         aPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823561; x=1783428361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=;
        b=pL6a/JcLSeLPEAnPKuzKwNySA4sKoCTRc/i/3OMpYbtAcQbnJxRglBR2/OfDSoIEaZ
         D4HN7+eOOv+zoGG5RPlabVU4m02USfTHiEUezaBeKXFpj/p4tcTkbs8QIWKUNEII6VB+
         ePCreD6V+Tcz5nRO1ZOa9JG/TqKYqfnZL3f7D9m4+HoOfAlupnyeDRP6DwrinhI6uinL
         H11hR4v672jpBvLlLlGSUiaQXr2RELPRlnYjcLOmlGF9EKWkmXnBFoRvR9P40wZrV8u/
         ceWKvBXEkbrMxLbEIzEwFKSNuOVu26wLtCN+0bP8trxv2HtE9xDK8qYsKF1+SAKwpmQq
         IkFw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3lAA15v8SPPRwwvluwPNYvL67HiQvbgaHSWTQ8pY3rA2Kzjm5lP5e/W3u/KCyE1MrUAHko+RZ5Th0jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8kTcAlQvtPUd8T5PUBrFxqy2VQI2nNGCQw7dalxwJqX5lalR2
	i9+cTEFQrcIoKZpM6Fd4xrbt30ATICj7S0P5wcIu6XoEShilh92MbYE5TnMSsF1WoxK/j1lGSI0
	3X0nI8+XFGE4K7etzaRNmoSnpE4Xl52YGgJFYSBzrgI413Cd5bUOyubOK2Ya2rHEGBg==
X-Gm-Gg: AfdE7cn7/N0RSJwYqmGt9CzBRVTJzTD/8lpRyihVCR3dEdZtKd/ZVAy0zS1IYlNGpaV
	jYAzdOqnonARVfrpIO7nlPMO1OTpk9MTpuVKmqfih88N6NVHCuhTpx+EpIO9HrDWoT2ISI9UaQ/
	Ghr0ZzpvVHC6VAjx5WJbcR1KD5l7qSs0gID/0G1OBUpwcLo89qG6U3EgqyAfhiChL+er99Tv3H/
	rsi6DOQummGYuSbl6TIph/hhpwsjKlfu4+RwwlllAg4E4uDfaHht3h3+xY0AbP6Dw5mQNnHwGsH
	2LXzIRfrDOEyrXheVWoYjV0MAa/rnJEkIE09is5v+7EOaMxJU9rxDHRWPKLm6xagglomxFSDj61
	WmZjJ+6am7iDKwiUz0iZOb+z4kQAV3f56JJA=
X-Received: by 2002:a05:6102:5802:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73a38839d2emr587902137.4.1782823561056;
        Tue, 30 Jun 2026 05:46:01 -0700 (PDT)
X-Received: by 2002:a05:6102:5802:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73a38839d2emr587855137.4.1782823560577;
        Tue, 30 Jun 2026 05:46:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968400sm1131274a12.25.2026.06.30.05.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:45:59 -0700 (PDT)
Message-ID: <b14466a5-a064-4723-8ea0-98239cd50437@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:45:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] firmware: qcom_scm: Remove SCM PAS wrappers
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
 <20260626133440.692849-14-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-14-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX+2dPFEaQ1Sux
 O3UaoA4p6zAdg3j0b6Rys0XGNGYL6L/dCR5oe78WHNs4dmqs9acVjg5QBXnhgfBGF4Kna+2LJR/
 jRh9lxKqro58GSBKyXZMLl9jEvrllK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX7TfOdB4IlijS
 vOAo+62g59R7y1Rty7aM+kDS4FwJ7a7L5ETR+lrnnmu50Wsszf9f015JH+CqJh1kSaYo9OODwcn
 Zzpyyufz4Ox3uwC7ojzBxxnaENqwDJLh5mmOTypeTQAXHJikZDqc/mk9ZkLlSuz12EF1CdVcuzs
 yeqSMuD9DBBd6B2GZUurryhzcixgFfivoyLrcxO1JLbYXd4gTmK5aTpW6NhenakUiDagxuZ5TCU
 QQPbnHnmgMJcFDSITcvq3fbRE9v4Th0hsURnqhv0Vo+9SUNFTvNsnZkYOR2ecqOm0h/ngJoV1zA
 nQk5WqF7YS6FHC59Jz0hlzgF6KoPgKZDq04fWclHVv3Vrio8wGw43tMJJCx0H97+bXL8TcDDazw
 OA9FoEBiRQVxqnC+sdVKCGhWl7wftpF0kgDiK6v40Vklo9ti+XK40E+X24AQ8qZDVunTzL0Iv9J
 AZMTQLzlZFPPav3KvyQ==
X-Proofpoint-ORIG-GUID: o64RRSwiC0aNBwdz9Twd7cHRKhmTmSXy
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43ba89 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=n1VOVlC_Xzu4QXtT9DgA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: o64RRSwiC0aNBwdz9Twd7cHRKhmTmSXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	TAGGED_FROM(0.00)[bounces-66092-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 2B94E6E4663

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Now since all the Qcom SCM client drivers have been migrated over to
> generic PAS TZ service, let's drop the exported SCM PAS wrappers.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

