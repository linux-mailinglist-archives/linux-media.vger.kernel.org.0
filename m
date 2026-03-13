Return-Path: <linux-media+bounces-55569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KUuBHGps2lWZgAAu9opvQ
	(envelope-from <linux-media+bounces-55569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:06:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6348527D920
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C6DC3092AE3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6035C337BAC;
	Fri, 13 Mar 2026 06:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJfMvUBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeU7AxGn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DBF325491
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773381912; cv=none; b=OYBF/yzcMAwOjmDUF+yBH1cYNGM9ue5pAfJGEOgtEmZ9XtU9UbHBl3EQXGZtHbpk2S0/ua2H37Iuoh2uDFpBd2JENUEIjApSKzX5oYmoRZ7fp0AMalvTl7IjKi51qQTwBS57F+0rqvzLs3X/SPahwEGwTktGmm9KkivHx6cmEZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773381912; c=relaxed/simple;
	bh=JB/usJN3+rbRiZIr1+8g7VPqy6EEuWzOH+oPf8czcUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJCDw/dfBLF8hlsKPAiiRtH0e8W35KdX3vffiWnZc578cOiUCX0yx54jlTxCRE80h/Pe7WFoS8XC5jXX5JLdMdGgoGcrDe0H8AA+f1u3xYCkewgpLk+HCQEiR/QTpoPTHzKkBn6JjNo+e7Xt1epkEQqPTiSK19Qo1/V27LBvkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJfMvUBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeU7AxGn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tbPL070440
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zeM7gmRvWE3zPnFK+DBIUx8d
	4QuC9ACWMKfdIK3rw1I=; b=QJfMvUBqwcfY9u+taSrVQqTd80hEJj12tOwH5Q9j
	xaX9k0s8mlDbhIGsyeV7Sv2muOCdElzAqOAi1FkgvuzsypAnc9KVBF/OhZbRfuI0
	eP3/swrWAVVyoStb5e+YPt30JEOc7NG6psZJycX4CZ0mekZSKIfbVV2E1p5/Ff1p
	UXQnYl2ePnKSwUKn85QTF0fvIYjitY+MK2kohDZ7/b+AXxSNk2IYy0TqJGFJTwzA
	PuKJfdmvTc5N2rmnW1mvZXsxdjvfMVtx5kAOry1BM8k/Jy/nrsUlXLxe3dy8zJDP
	OluuQkZYpex1FDmbDCQwjYuzgihFZk+Hwmeljq/GFawn8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ymqhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:05:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aec07e8aafso9140745ad.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773381909; x=1773986709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeM7gmRvWE3zPnFK+DBIUx8d4QuC9ACWMKfdIK3rw1I=;
        b=NeU7AxGndEWvTlbIu+rGi8hAXScOCSM6lVidJHAf13QLWJiRjRarEiJ52OV9FC/t8C
         fw8mLzlNM/ajeNlgNdYitWZz6nLZTpS8Akt+wZUQZUzVwifVlqA7iEoFDh0ONpzxQP1u
         JNc4Uof5ODbUj4b6n0+4EbzXOpsTvHY3ehpXP4K1cJAZB9ve2beajZaTXV1U3tpIDol/
         z5gbpbfw+0rkTrySn9fFXj8IP1aJNhMO0gleUgl5QgLIKcbsrxLWnsqtL6vtRslIxwa2
         R89ifkNclMVrDwDHtH6aqmOb7Vx/t5FO2VWzs+ATUBBeV3ke3Mu+0/XvtvZhOI7m0io/
         C9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773381909; x=1773986709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeM7gmRvWE3zPnFK+DBIUx8d4QuC9ACWMKfdIK3rw1I=;
        b=DMTUgQXNteHvx7dc/0W99ZyN3DplLoz35jbodeGxs8DA7J6mkIjXbz2/S3b1Fmaisa
         C/ZafkEoR8141AfgBGZ751Ujs6qfhv7dchiRxCICpbzuHrGOIMOSMe8m30gqRcJKzSP2
         88BYrjAWPZFnpA5Wt+TZ/zMAUPGkidx/59a8YDjBYjL8mB1eYn2z+b0keL7T/F+HgAaN
         7eURVgGRF2iaCk30x1IIUM/+t5IrITWOjFPZqiH4HycMxOcVJvYM3kjIAJDHgENyMs//
         a+HcCPjJIbzi/bePxZzLpPtkLLfysCdqRUSXjQdB7z/zTFMXM4AyVeHBKXRO4B/ckA5Q
         M8Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUFHRYkCg4mzOw5O61Gs6MHvKCKor4GkWkZhIIFXGO+lYjeYs2o57OC22TghiRx8oAYQKnxmJ2M4lBRBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgb1vMS2uH+RPlKD+WahpCKl26x42b/9nnNLF1QH2B7HRKvP7
	SzHeRzVajqwQ0q+X9eSwAglf5YQtNglNxqasF+Vokuwynbv/I7Rj8xH8zVzuD+XHstqs1zcxdUF
	eHElu03nBkIn5gNHpSeJbTjGfOXcgccfzvl7dytV35aMhb28Rwi1xPntChL3WUM5PGw==
X-Gm-Gg: ATEYQzxXJE0TQZnY22j3w5QCR26Dhob5jKVWCqJf75gDXKIMRY9lIyPYJBiuGEHIrxP
	CSh6FMVW09aohVEoSFagIW96YgWdC8nguGGFjcDctTLcbZ30N4BzDBjtkGfVEr5CHsZlHMLwbhJ
	0rnfCVR2OqbKT7p4q7jMQZRkUs4FhHTbZ4qCDokyocQHwqC/ocDXszZMJEF1AWth38aOcfc/8PI
	FPqw8+oKEYP36/uU//DXmWVDgjP8fgWh0UKDgh/Rslny2q16yJLmgjsuP2qe+pJ3RH7lXxwzxJa
	nkfVi/HEnCL7pQLVkkoe4VS8mJPZB3w1n6iUlERE5dyaBSXf9Tckv1NqK95BM33UdGdgSvkiEHZ
	S+hLdpTOgD3m+b4k4XgCSl5rTbq2IKeyP4cg7cxkMiC4+41FA
X-Received: by 2002:a17:902:e80c:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aecab1e86cmr19453435ad.26.1773381908508;
        Thu, 12 Mar 2026 23:05:08 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aecab1e86cmr19452995ad.26.1773381907930;
        Thu, 12 Mar 2026 23:05:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee5b1sm10183605ad.46.2026.03.12.23.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:05:07 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:34:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/15] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260313060451.hswg6snnnexchmzs@hu-mojha-hyd.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-2-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312062756.694390-2-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0NyBTYWx0ZWRfX/4qkPyV2kAqw
 PN7QrfyEcbvRoyFUq6BgqaJiq/mvM8xY7oBGdZ1ceVw36fBNE3zIbFl3L9f2JXQ81BHcrYvrF6B
 VStU7iIarLVIYa73wQGXk2B2Io5k21MKQ9hN7SPbW3I9qK4B5NuvsJD1uhaCiLYspB4o+XRkqUA
 DGe0ASJ5M1ufN6lW2rFtGQg8i9SLUF1uJ7kenWRBbvBIQmQSfLRzUSweM9o06dypQFmJ3MexDOY
 R9hM1Pef+O2PS8amnj8oLt3Nj+sHoNfk5HKCDW+vth2iowzQ0lyYo4CBjq51XEprLd8uh7WhqAg
 Ajebmo5yyrtfHY5EbyVRxzPOwKcqHhdFjC5sA3JCWA3khpEm730tQM/NIsrSRLbwKtml2Tqf1he
 b45m4eBhH2CBYw5SQKFwcAiPKYDhDRUQd9bweyryEjAJZNueij7dBODNvEIa+4bV3OypoxaD0Q3
 mL7PVEouEatuU7RFriA==
X-Proofpoint-ORIG-GUID: MJ1JSg9jcdMzvDw-Lpb9IfUHJe08cWu4
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b3a915 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=D5leSQ3MSkE6s3ds0kQA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: MJ1JSg9jcdMzvDw-Lpb9IfUHJe08cWu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130047
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-55569-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6348527D920
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:57:42AM +0530, Sumit Garg wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> All the existing variants Kodiak boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> [SG: watchdog fixup]
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  2 ++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 35 ++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..09a7f943190e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -139,6 +139,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb

We may need to add for couple of more variants..

>  
>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>  qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..0b3a69a0d765
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_wpss {
> +	iommus = <&apps_smmu 0x1c03 0x1>,
> +		 <&apps_smmu 0x1c83 0x1>;
> +};
> +
> +&venus {
> +	status = "disabled";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};


rb3gen2 has modem as well, did we test that as well ?

-- 
-Mukesh Ojha

