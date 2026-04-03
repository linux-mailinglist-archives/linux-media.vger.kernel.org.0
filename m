Return-Path: <linux-media+bounces-58036-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBh1M8SLz2mmxAYAu9opvQ
	(envelope-from <linux-media+bounces-58036-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 11:43:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA4392EEF
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 11:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DD6030BEBD6
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 09:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AE320DD51;
	Fri,  3 Apr 2026 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isxJvM2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfVQT1DR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFA334EEF1
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209044; cv=none; b=a5BNKgC/qedplzfTELf8hrM/oF7Nzr5YUGBlHp4w70L4SOLNnVUIs7nM2ypluXBDAoG2ubV7zFBV2QM1rP1lCpdTGpodLoz+C2y3YtH4M8esSgZSJXxDQrnU9LCw2CAvuABayk2HrufPLn/NtjUSkoIKaMAb9BcGzcZLGTbIx5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209044; c=relaxed/simple;
	bh=SocuiM4ILZ9cYRA8mSWtuuuo4+IGmqWsxZXNi9/pB0E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqqcUMki8zRtxyED6PP0gAd3kuB9RryU0C+2KVDa6bZn7bUmpl6uZjnQQ0a9J45ZB59B3jQg8UUj9IKSD5zkBb6hI/1o9NFE9Oculp1mD4Uu1DRZ0cDYrVvQ5W4MCtUjonQTZDpiZECoBNP2JuaaWVvEsvRYTsn5230NvwQ1fLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isxJvM2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfVQT1DR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6337d8Qt2707236
	for <linux-media@vger.kernel.org>; Fri, 3 Apr 2026 09:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H0MsR4PHC7LRNEDJ02SXHtGh
	86o8LwWKhT/z44z5dSo=; b=isxJvM2K/Cv3Pm0NShfaaEwkY51/yH2P37+roCBv
	lYrCcgbdhQHUYJxt9ZaYRXWC20+urqqeQP2i3fq42SxtBdpAbOyHaIPnzRWp93qp
	QhAms5skdcgdocGbuW8EEkhEUxZ3sTcKnETvEuiyk1+Pm3OocQu1n8HzYcRw66t4
	536ts+kxzBAJIVeVFBFgH3T8x2hYC18mMhBZriiWcTHzQDNU9C8b+kQqmV4xadiD
	mTBOHSS2dOrTwiGXGNamY2DF5T1mQ/6TJ4GlxtarDcpWup0gReaWKh75SsJBMArq
	yJ0mRgfT8xA5wWGvPp4wQ33YQwu38eZi/2RiBGwkpqwHTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjhyf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 09:37:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so30605821cf.0
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775209041; x=1775813841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0MsR4PHC7LRNEDJ02SXHtGh86o8LwWKhT/z44z5dSo=;
        b=MfVQT1DRrX1sr4Y5q4+oBslMfCFE3B/9Wd1FhRiHHRbNoT5kcK9mfhWr/GLwaAWYxl
         T/R9jD2SKqebQKcZAuo7PuhYOEGPDC9GqClkqlWLpBAYZT7cDAt/Gus8He8Oo0gpP8ru
         5iag4JDbkfitPxFWfs0ihl4I6stX6IaBlvvCVunxjuP0ve3jiYn9KNbMbky6cXOaxHAr
         jueDpVA1Ke/QG/GuKLsBBWYckfOqPOKzfRnngz6K06HqTfNDlJzFieb91VYDwsgu7bMu
         JFjixl7Bqm5bfmee8U2/SCLdZOk7LavWG4pjhjtxWvQ20cByvtE5XS+es5/1j51NWK66
         WlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209041; x=1775813841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0MsR4PHC7LRNEDJ02SXHtGh86o8LwWKhT/z44z5dSo=;
        b=QsQOX078ffq6WmcpMLd8kd4rvreca/twwS7Gmy0Bzk8138OdP0CGrw7OSfFzOb/Oar
         RN5Wz6sgY2vAMU58tsrE5EGLxA+kZYQ4ORiDBLZCjS/Wty++SPjdiBUsQpFOdPoqJist
         fzYQwOEYTSdrgPwpvkOcjRjAGOvcaqVXZ3grdlJaYgFEMaPfKZ3uRsk0lWZcJ3ueASKY
         Uub2MnzyFxg5r8BUC7rRN8+S/F1cqb+AIJgOWLSQEtoEZYPEMMXbSlGXJx9oB8beQh/n
         ZIaARwjq/7roqQ8Kap/ID8W83/aqHee9LasCbOix8zQc1xLUEnx2Hi1wQMIFbW08YbLW
         Bw/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuU1nbJPO1LRVgxS42rdKZoVXMEZyYRmvBwt4sLAYsiorDzuhoWMzzhTPTWyVP0gFm72geeIjq6/cLQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/k8mWwz/OeAo8DL2Ue4j1eJLrPMlSZx3JEf+KrNFpxocnRffW
	1NdiGoaAfGQtTBW04Ncec22rG3Cq/g6mzxTgsS8rLUqrHAGpWe84YnXFBaxPOrPqwlF3/exBedq
	IcUATZxvQA8lCfgYKPOoQJobAHZyF1+r+7e5Wk2RkhdmnX+F/E6DQVZFv3oW0YNUPpg==
X-Gm-Gg: ATEYQzxplru8FBbUe0OQ/XsqkrVNcpkUncrOy0iu3lXUYoi1aSQ042zkaJX5klcflkL
	axjRoQYs2PYkHOZobOVf+sAMA8LFzcU+SAsPyz23+DrI9RgufmY6ot+pHki/Uc/2JBZnS4i79fN
	w5IILnCLQrulyLD+tDNcrty+AvFGU/ZIzI+v+glORNs9cJ0knjx6eI/r9JZ/xZXwq0gFrynO1hj
	v9DrRy3MTB/ReZO6PhQvED9NXPWicgfED7sgG5C+J97eOcf6lZtSIqP9+VKe3ieaxMxrw/g05PV
	eZtJh5OqxWhBQ2vKImGb/o+x3LG9D/jD03LY1FZWudegjX1MFTVVlhURETF+ZmMtfXb7sXGOZGk
	ZeifKM8nniVSXkLp/mlRcGQys5QaVMvayGKuf2WmNNPJnqKnTnLcOq8bD
X-Received: by 2002:ac8:7dc5:0:b0:509:202f:f03 with SMTP id d75a77b69052e-50d4fd24b4dmr66236571cf.38.1775209036472;
        Fri, 03 Apr 2026 02:37:16 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:509:202f:f03 with SMTP id d75a77b69052e-50d4fd24b4dmr66234201cf.38.1775209031263;
        Fri, 03 Apr 2026 02:37:11 -0700 (PDT)
Received: from trex (187.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm15010561f8f.3.2026.04.03.02.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:37:10 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 3 Apr 2026 11:37:07 +0200
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
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <ac-KQ7e8-syph1Zl@trex>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327131043.627120-12-sumit.garg@kernel.org>
X-Proofpoint-GUID: sN1kJ69KdkSxKH608ZrFirWSnG6ucJdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4NSBTYWx0ZWRfXwDjPM/w7owR1
 eGj8Hw2B/3E0cKGUd6OmpSs1MZhFvQ9z44ztduA79tySwE8Kn5aakbpRdunGCPl1PUI1znkIcbF
 kekmxh2ZpEseb8trOQE39elLFh6KXt85mKfr09uwFYKHFTf0WHR9haKRuoRPtAPak7iceLRYQ7Z
 pmx4Hdncsgx8Ish/Zbna8wtdDe+khfKTCcdBcm4QEdzU+dL8Y6ewdXTVK5C+BMYFTSJn1aVV0RL
 Bgd0ZZMpKKPnsT6UZ8sdZcr3DA3JS5f54SfHoJUHiB84ZaDOmVBknFPyzCnYi1qxFODT9b0Tgow
 lGS56SqmloKu+WTbNBM70IREcmOtT7/PI6gL0+/2e9jDiqrmQ5TZw/yg4B/CyR5Af/qcFitWUMb
 8t6Z4L2rCash5WWpeFi7dcwUWg69xAc0vOTNfTjH8zr7LHBDXNPia+qJeELevC0bMeQCVORHYST
 gpPaNQLJ02dytqCwwDQ==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cf8a52 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VPdg2FrOqWfiVCzsz0q0YA==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=vWT0tKtjkO2eN-vK3vkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sN1kJ69KdkSxKH608ZrFirWSnG6ucJdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030085
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58036-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorge.ramirez@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28EA4392EEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/26 18:40:39, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.

OP-TEE based PAS service relies on the linux driver to configure the
iommu (just as it is done on the no_tz case). This generic patch does
not cover that requirement.

Because of that, it is probably better if the commit message doesnt
mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
implement the same restrictions that QTEE (ie, iommu configuration).

I can send an RFC for OP-TEE support based on the integration work being
carried out here [1]

[1] https://github.com/OP-TEE/optee_os/pull/7721#discussion_r3016923507

> 
> Along with that pass proper PAS ID to set_remote_state API. As per testing
> the SCM backend just ignores it while OP-TEE makes use of it to for proper
> book keeping purpose.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 25 ++++++++++---------
>  .../media/platform/qcom/iris/iris_firmware.c  |  9 ++++---
>  drivers/media/platform/qcom/venus/Kconfig     |  1 +
>  drivers/media/platform/qcom/venus/firmware.c  | 11 ++++----
>  4 files changed, 25 insertions(+), 21 deletions(-)
> 

