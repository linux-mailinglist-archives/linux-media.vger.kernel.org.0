Return-Path: <linux-media+bounces-55568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eByiN5abs2l1YwAAu9opvQ
	(envelope-from <linux-media+bounces-55568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:07:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296227D555
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 589B4307F296
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 05:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E262BD00C;
	Fri, 13 Mar 2026 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWkRBaOY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dtwgOqpr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5214B1D6195
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 05:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773378440; cv=none; b=OZwSljBSwImrzF9vy4vkK1oafEUR7C7lJdCSXN2UyvJ7UG2ZyEZs6zLx49sxHsKcujAzOmPpvMv/8MKkyZUPg65y4OwYLWtXi834M62OkBkjB7Pe6OVSPALw+Fcd3MnR/SWlb2fQj4ErS/H0HIRiQ51Jgj8N1zCyCDFjLUiN0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773378440; c=relaxed/simple;
	bh=Mk8tq1fYj+LUFOPyKiSxAe5xxXcsnd9nKLa7hnj9TdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ+WK9l8N3HsMx5ppNK0XQI0rF967b4wkP9Kf8aNisL5CqBAdMTiWRQQZMsEQ1WY4rlXzC0TiPqVEfxnh/7KAk//fCKqAzrBpapZ1wiQ1DFGmtY6DcVCzdlYhEFbMcq4gND6QhgculMENE1I4mSSqcgSh5WWZxRkhzn1jt3LXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWkRBaOY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dtwgOqpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHIP3M509757
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 05:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tmtKRvDIIv8WAEFm75w85Ye5S2Qw6tGLx83eZwEjjs=; b=RWkRBaOYP7GBlNO8
	DE2TPiL/lbUPa4jNQpcLJ5jne33pyBrLnlTs6pPEcV+T7zu/UtaPSiskg/f+x8cr
	Ye+AopQuHXkZNkiN7KO/zIuurh2gmz2SpyJ385Bscr3lMy8XtjP4kysXLgb7g2pu
	NQ1tBvSY1d7OhR0R+XuH8S4yyFHlMqx3V3swCB9Dxnpimf6dDsaevmEao+LKnj1V
	EmF/GamvMpZmmtZJXHDW0u45kt3kPjBH//iH9sl9qzrFH/u6NGrT4GalObB+vS+0
	hkRKAcQXmhXh56xX0HqE85o0c5maSZaMa2uVTkpfsvGnkcl0QXRM8BwsZcZ1lzsN
	q01fGw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w38yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 05:07:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a0686edbcso966039b3a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 22:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773378437; x=1773983237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tmtKRvDIIv8WAEFm75w85Ye5S2Qw6tGLx83eZwEjjs=;
        b=dtwgOqprzCWna6XCJ+QWDPCOxwi1zsJoT4rJyJelNFHOUnP8/6dRPSS+qx2IwN+vIb
         Ztvh676WxKLqNyqmXD9ehxKFvrDItg92QoShKQzV9/j2KXHaqRmMIpvExS25GE8C2EEF
         Alg8/tSuLFctlKwu8s6tT2tQqdTI8LSYbnNn90bcc1Wrbvb51b7EHMGjk3S/CZqsNp7H
         JqpFG6KrOzIqrhNqNBGs/QlgghaQHKiOQy3lIcJpwBxTeKoCoC6GomQER2+ITSYvvzmU
         L4AIsgoz/z3j3T1bBYZPPzB3KYmKl9mX7T5K6o0dfmCPWjvw0hlpBA91yUY3YFtkgh6L
         LsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773378437; x=1773983237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tmtKRvDIIv8WAEFm75w85Ye5S2Qw6tGLx83eZwEjjs=;
        b=jSnXTDXqPyvwC9IJ25EQmrLTTC5+ZFNX7UBy+Wy07pexXew+aSCzks/UEP2d00Vpo7
         +8vKhzEwuyEjiFZXd5Sjzw5XgOPyTYXpPQMLlF3bzv+v6Fp7BrHFD3Un6sfTsUB6E1QB
         98lqUJGawMgpf5ZSIEnoiDXw6gEHYXRilPBybPXJ8HZxTCaXoyWvlAsDgNvO7p7xRH3F
         gJMQUO+WzV6Szd7OFvSudMpqQlqjjfGe7BqKaGSrdIUkE38xzw9AE2SvC6iQPnaAdlWe
         3lN4Epz7gdbfCwjf3xGNl081FCF1WUl0exuwTf7JppmwNojcYd6WjZWtZHb2f7HY4tye
         7CIw==
X-Gm-Message-State: AOJu0Yx48Eb0V0tvkypzw0v+gZvx/mej2LK/SsdFU5YqF36u3J6DwOxT
	NawpX2r1PzrAB9GKD/3D39kMFUDh0MHdv7IhXdVtRw7uXNNK+0J4ZWdbMYpM2c7/sFn8w+zIDX+
	X85fhplYD+0AptKvJQPQtZSMAZXnVshL/lb+kYrHG20JCbeILWxqGJg/3+WX42SaEEA==
X-Gm-Gg: ATEYQzwCGFN/RZV28fjnBkSa+CJevpBLHBjOuFbLlm1O2UUIvO4wc35H0YWrhzoimIp
	j+1rDYKKfSEKwD2+6St6nV6GXitNkxKeHeI6Iz9beNEs2j0/oFVVGcGhYaCu9kQRgaVv+h5dyqZ
	BUZKoRAaFdAXodg6B7ngMZ1InlSWN+66FGe9MM2Qv4kIepb1hjq//JxlX3zqWm6m6lx1PycGrkn
	T0EccgieRMPDfz888ODJJUKZgd6vBOss1xAj6mQGVDTEF5StoxtvSmAatNV0XaY/I7RF4iJZsiU
	jyeGM1jzH19STCYunRjlHIO1jUcV57vf2eUC90lgtcVjlDqGGIXfF9D5FM/tzy3MIgGpRXZSkWI
	fR0ATv4gvqnOQjYzXb7FMRRBJa1y56e5EczvyUuOdhAzd2Z5phas9
X-Received: by 2002:a05:6a00:21cb:b0:81f:993e:ecf6 with SMTP id d2e1a72fcca58-82a198d04b4mr1676320b3a.33.1773378437352;
        Thu, 12 Mar 2026 22:07:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:21cb:b0:81f:993e:ecf6 with SMTP id d2e1a72fcca58-82a198d04b4mr1676300b3a.33.1773378436905;
        Thu, 12 Mar 2026 22:07:16 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07365b22sm4537101b3a.45.2026.03.12.22.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 22:07:16 -0700 (PDT)
Message-ID: <4f053da5-1804-9a75-4fbe-ee23974f3726@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 10:37:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/8] media: qcom: iris: use common set_preset_registers
 function
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-2-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-2-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ITQJAJEx30n7jwRDTWlUehehxVStejVE
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b39b86 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xm1I8ePgU3ACQa9n1MUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAzOCBTYWx0ZWRfX/VAaNOzqwRyA
 RykJHWEz48YCaYfsp6XAdKJon9GTuwoNzKnKm7pmaFRIkW+NTTeqMgZbf3Yr9pPn8U71gAGiccd
 t+IjrTg4Gh530kQAr+5Vj6CZjG6dUI/a9RuCI2Behw0tdkQLTictBZ5SFTADHDYbSHw/oluI+rv
 FhaU3ATvRP2wyhrDMdUEDE3bG0+PbMftK2sXman1HFzRz8eyRBT3sXWbudhd5r/Kvywoob8WiEI
 EWVcxn30gXHQX1LiIQNFXDC5Bhv5CFRqvjZjWu/ZW9LKZ9Ra+Jk7f0tIF3FTZwITmsGtg1Micu1
 pSrtWtte+ENjX0M317bttBAk/+A5B0+fD3Bi7MLuNzXJ9n2rZXa+Iy5ZVuQlFB1u7KmG7LNFIKb
 Gaj3O+u7gMcI2HKmD7cyseTlyXp7TtGo/89ksBYKpGPkF4McSjRLO9BTQojh8roF6mtASmVuenc
 KgmXcZPy3hKb3AZOCCg==
X-Proofpoint-ORIG-GUID: ITQJAJEx30n7jwRDTWlUehehxVStejVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55568-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4296227D555
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> The set_preset_registers is (currently) common to all supported devices.
> Extract it to a iris_vpu_common.c and call it directly from
> iris_vpu_power_on(). Later, if any of the devices requires special
> handling, it can be sorted out separately.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 7 -------
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 9 ---------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c      | 7 ++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h      | 2 ++
>  5 files changed, 8 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

