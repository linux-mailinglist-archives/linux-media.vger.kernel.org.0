Return-Path: <linux-media+bounces-66079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CqEKISG4Q2rzfgoAu9opvQ
	(envelope-from <linux-media+bounces-66079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:35:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2306E4385
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:35:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KKnkbgGq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fTkZyi08;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66079-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66079-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA6133081379
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD4140BCD4;
	Tue, 30 Jun 2026 12:35:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E23F58FB
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:35:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822908; cv=none; b=lXwXi+ejndEQvGApZVaV4N9DbyfV0aQZZlBHW+ERrYoMB9rMd9CJpaDOxQu9CbWKhcDuqAiLcTdSQPTd6f7iHLjG3QdJyCLXt6qULZmq8RTh1tcB6FbGeHdviO//Ye+jCnz0MAe/bvG1I96zbel26x6PMJr4M8u1feDRirFTSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822908; c=relaxed/simple;
	bh=9TD884/1eNmXF43nG6KMGGmoxZbFnZmA8KC/ejMW04w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gce8oc756n6whJ6nCHyXzbNp0yuMtkZvaZGHDMc8sGvmyoINXi9VR6LKBAVNAGo8WU4xnLisqoYp3zJKSYj+VgQMHlq7CQMT3D0NG59lGTrVtbUZhDXJ2o3LTMhyRxbybR4x7lCBlooDlQwdN+xNlvUZQ5mTh6QviaGVEv7P/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKnkbgGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTkZyi08; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nEi61590709
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=; b=KKnkbgGqOr6Axbi5
	m8AFO+/Jphf+KutD3yzjJBOBGMRnZBe0xFfEDCpHsmiMPqrNjMgEqDLg5As+APA1
	d8qxQEA9OWFnuHHrcNzvJN31S1kOhgBbhvh5O/v/NANPH686ogZ+A6f0Jg11XSCu
	L6oDMxUpi66Stm8pQ73m5lflpH04VKTeKA0zFa1EGW2Iuhg6ljJv0qoye7xW45Dd
	HGtzYmxnVhiXD4HqcQrgDjuP53UqQiUinbMagr+sEQrcnIqU0lXA3SKbPhm8FgXS
	fJ6ZJJDxasvRRXyPxZS1CTAR6hpiohrzlxjtTBOBierePcL5Z5NKnDlfpBqAH/vm
	wze8qg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3hr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:35:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso2952001cf.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822905; x=1783427705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=;
        b=fTkZyi08V6GwTZ86ygorNFxoRPMkH3eFEfO36sM+2I6TfgOtjmHxtMP5epbC/4kv3d
         WWzbS+609U4AxUDJCS1uDlHxUcNMIkinGsJGUHauyf3CspEf6cXZf6x/S1bumg6qEyFd
         SscAQVBi6aGKoLZYlxPbTH0oRojgYyTdHyd/ZkfrfpI2JCUYYZgetRqwUOd0F5EM/RL6
         pHeZTiT8cwr/Om39mtWYA0CH6XWhQTNXZsOBDjmAZpw3PF3VN3qYcSj2Rh+KleVsz6av
         eYl5zu3vguKNjo78QRqg48owtxhIOCLx6yFchlIDfN24rjaKSOMC79e4kqKUrWYnWoec
         xePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822905; x=1783427705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=;
        b=dYsyw3apGA+rleIKnzI3KTUkT3NDVV0i0zqtoK416WdzQWr7bmrVClf2pdXv6QMQWD
         l1bG6P3Oja/DKbtrxXkQ544ENpPIwcbZtrnEd4ddck35AEplinmwE3F/vqcnOiuOLOdo
         EgdS0sIldHDTvmvj4JhrmO3Kkdsnz14FUkQ9bWm7USEmp3pfgJ0CM7WfF4w07zSetCwm
         7meXJ1g9ubmPZ0PlK/4A3425g5/CNCrEDDn68HjQaPzqPNj4RWeA0JbO4K57/BIBw/ws
         kJHImx7Pn7NVCpOTqcIiY4Zrv7KP9oFWd7cjlAH5ZrpptOcpENuUzpz6zdzezq8fc+yW
         DTrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oQMXPVxGQAnRrvvRBKUl0cWSBDQZ3j4qkAL5EZ5ZiXUhbsl6UgLAHidFJWLAj62+XkZcUw1FtoidKHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2zcn15Ly4hM7EFIpN+x4mZQ99U4lSUnQePMr1/Rl+TYJVto+r
	vdAjWelyDBPoJuDWjvYEU+QshsDoZHONosoHmu2kdNpfgFqCfVC98uEVZxqV5RgspmZCOpUfMxa
	taB82t28MQ6Dy7rNCluAOFdZM0TV2AMBBxsrVOlAoNigaOz68WnPQupol5kHNFs/3wA==
X-Gm-Gg: AfdE7cnxqCoSkAQR9bmlUBatK+oeSmhMra0FWA0OC4KGVfPWzRGQDu3aUx09Z4ul648
	yKZfHoK4VFOZypP7fLJ6i+PabDvFwShAQYoUwipDrejnWf7nP8U6axC05E7ERK8YSrqbUwMkTbc
	FD+JO1MpPn53lcYYZBqQ04a16dLP0niT9kkN6ERPeDYQadxWFCjcbXfvwoajFdGYVsFPG4kR22a
	tDAxNthaatHpyQgYfPVkG0CHT2qFWcnmRuGvKQ46a0KZGUL+Znpg+goW8fhyIpNpqTFyEbQMfI4
	TWRY0eijvhmWbeC1XIqLIVy0DrduXDq5uT5Y+khXyQJq6dFQxpVLEC6T4LIw1x4eIFu4UGz1Djp
	PBsZZ5/CDRprCAxtgVXoLcIk3cw1WrCO93xU=
X-Received: by 2002:a05:622a:a1a:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51c1744f08cmr12928971cf.9.1782822904807;
        Tue, 30 Jun 2026 05:35:04 -0700 (PDT)
X-Received: by 2002:a05:622a:a1a:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51c1744f08cmr12928611cf.9.1782822904391;
        Tue, 30 Jun 2026 05:35:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm117506266b.51.2026.06.30.05.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:35:03 -0700 (PDT)
Message-ID: <594cf827-819e-4262-9dff-a35c7f69f86b@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/14] remoteproc: qcom_q6v5_pas: Switch over to
 generic PAS TZ APIs
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
 <20260626133440.692849-5-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXyK5JRnhG1c/x
 xUoiD0rC3Md4DRAemrMOa4Sd340ys02GhHsMppZLEcbvwE+bEwAqewoyV0gffXLFRUwT0Mgtg8B
 /BVZQ6+7EG00776B+IMcUOP75RhreQo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX+vfveZf+fCAz
 lQTqZlMSXHZ3bnuVYEycG7xlRoXxnSZH8TiOEgmIsHZnKBrpAyMheI/4xn54ILBPLsIytiLF4Fa
 iwb/xdScJpo6zhstE8sKnFbro9skChKeqZWJORP5U8su39apW8sjFqZ8NVvGZcPQVPGGqeRfZQ4
 U6hFll+c3f2BgSSg2DBfInLN+PBf9zYwBQxV9I7cpVZyrsl4jiPZJByK9vqvYkw9+jQVXYp0aES
 jVTexhM1JGlFe+dPvbCFbWjuWKuZWwWM+8dRKjEHy3fBfX7uu9EIB6SrNtpiQOkBdvSfBWcSDmI
 xOZQtHs/anBqY3qCuYGbztWLWpK0AXybcT9pg3fkDYxLmOYcwQLmfsbpPmtbtCAHi9HJt6ppZjN
 f3t/6MXOCKJjbxPC0XuWJ6BqpYwIRkvo1rt3ORAxAZfbl0ZdnE5CD2+sjEmyBBQnoWtxNkjq8ZO
 HXDoUQUTb+woN3GAZFQ==
X-Proofpoint-ORIG-GUID: 6yViIk4WVi3rsnHwjzEh2r1Ip7YZK8rU
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b7f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JRhjOG_OB-XQkuSI_8oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6yViIk4WVi3rsnHwjzEh2r1Ip7YZK8rU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	TAGGED_FROM(0.00)[bounces-66079-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 2E2306E4385

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_pas client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Since qcom_q6v5_pas depends on MDT loader for PAS firmware loading, it
> has to be switched over to generic PAS APIs in this commit to avoid any
> build issues.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

I assume that the leftover qcom_scm_assign_mem() will be handled
in a separate effort, presumably through something like FF-A lend
on the backend

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

