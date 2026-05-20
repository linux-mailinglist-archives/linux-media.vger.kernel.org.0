Return-Path: <linux-media+bounces-62342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBecIqnrDWrM4gUAu9opvQ
	(envelope-from <linux-media+bounces-62342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 19:13:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 878AC593180
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 19:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BEF73191519
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529663DE451;
	Wed, 20 May 2026 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdR1oXdM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkhKthQQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C647F3DC4CF
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294434; cv=none; b=RDae/HBpE4hlyNq08zPQJzghPzDRYn5xxaKYgkE0MPKZIlM76FYRi/BDUxH1rtmDaXt3XP8zglPdDmBKCvw5kspS9/5VW2terBEaVmXdd0vxXxW5nP3qDiGFU8Pd7vZZ3mvm1ARWW7OiDarV+0WGvq7mRolBb+MKWZm44Rf4RE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294434; c=relaxed/simple;
	bh=f+dG9TIzUjhRvUAsEfKGG9zAI2ESdGT0E4fdHz9mDTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYphiVsKJDZBs+BpZ88ImJWPppaGQP2/+xgZEHRCvkCp+jGSdBE4r3nOrEDS8AB6svnGzU+ISB3iAijgIzygtayl09ArVN1CbnVUsnqKYhCxo53TiH14c0c299+TxXjmoHioPzrllwht6PiCKSzWcEL/+emMDavv6+Xm0QGuHqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdR1oXdM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkhKthQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGFtlp1177853
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDLA1uFh89hUYoc7hHwlt/GqNAgX4/LhiZU83C8g2Wg=; b=GdR1oXdMGPiV/UyL
	GmRgMOjQyNdBFz98dduco6c3ld9VmhYxkarRT5XKZzJBXClsklr1Jc9bipbMHYQJ
	1hg4r/TkKvCKcumPRS+F8P034HDgXtCAr29x5188qAkjmUarQdRb2mgF6cK8fjRp
	VjLJ5q1jQA+/NMV/LgjZchOg9W5iNThMNTHR/XqWhkoe2wA6rqdZyWC1cQT2Ym2O
	GrgeQ1VwB1zro+46xv1NiyhQcknwiRrwZZYBuNHms1032nqKX9dKJrNI1ZcadK04
	VWBvWAFHJvmt+KvIE5zXRGrhrwRY5aborInFFJmgFtBMbJnBmP9tU8nSxSOxe3Ou
	Pl8SkQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6shj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:27:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3041ab826ddso1376627eec.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294429; x=1779899229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDLA1uFh89hUYoc7hHwlt/GqNAgX4/LhiZU83C8g2Wg=;
        b=FkhKthQQod5LYHcLWzM6alXLmbh/kM4W7JScApZseNWjHh+76zIdyqtd5if9Xh6MiS
         V8ddq1mA3DwcgRofwTaLTlDskElpN4QyfWfAYOo7ci20ThilI/GvNr13MNAF8pXsoSxk
         cBuOsYqWoL1NrhbMoM0DLmOws3l6XqFdhP0/J/xXH4wLNGSGvPmlxkjIYxVb6xNVM6Bd
         KrbOQvgCO+Wy5PvjD0DMZn1VKUZjM4u+qPvCFDJA+EFYvvpzu7R/3F3QAx1X5e3r2P/M
         73Ozr7c3oD+4bFFBwdqhGHhVYrCl51XzTt0d9bOlTOTMBJUCxSmcvx/n0vBio4aSDU/V
         yh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294429; x=1779899229;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDLA1uFh89hUYoc7hHwlt/GqNAgX4/LhiZU83C8g2Wg=;
        b=g/7Wp7ao1QhBLmxfa6FSDSjmvxvuAfA+zAcQPX/BkdzE7Suu8p/5qYfOVFrwwGy1+1
         jjSKxjiMZw3FZ+D/Jvmk9kkVPJnXA0hIG4tXEz9DowT+VAS/WKqUCDMdyc4PvyDRrAwl
         ki3h8s/fmht0ouoV3SIyrXlkoHdDXtmkMa28GXb5nQgjx/Zwpce0pdE9VLj78gprTAQV
         G9BJnCv12t7AQutyylsKZTEsbVDr7qGa9Mo5jMR2mK+S2OfMUm5PdF8sDDgwpyb9hD+k
         1LHAOZRIMqQNPE/m7X6ibXVS5H0UdA8AKQZSQte+XDZkGxdptWSeKgxBb04/+UIvWDno
         pxdA==
X-Forwarded-Encrypted: i=1; AFNElJ+otJHstTvv5m0IV2Fet4p+hO6pFFaNlr837613TOLLePyK9DqYx1R4RAftZkCDwIpS6GZ2qCl34sbrCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhROu0PVMZCBrKZbpxIY88tcnmUHFPHES+SytcHRUfeTnvLZmA
	wUCC+dixysLWnE9K265AahnBNl4tqetkfVDhbRPW6YX8LxkXdVrrC/fKXe6jPSJZj4qqAqS9hdE
	FLOibHBg6BurTd6OkWwsZLXOi/D3Hvt3xAuCdHQY5o0Rgt75bbxyjY0Q+Q12+wg0KhZh0XYCNpg
	==
X-Gm-Gg: Acq92OGqLZb/Jv5kh89gwiGLkUaANaV14o+WR3N18MPIulyg+xZH43fkeiMNU28RimY
	OHpJAomfDJCILvoXg2R0J9AY8X1aTwyd/GK5rtaoiavlTI0HHZXmDkZwa8qfjfxgrsHfRTry68M
	urh/ZrlJPQ0Gq64q+rhrs7YzGuFjPPxDG68rBHBbcU/Yb6gmIRyGS/rEoaz7BMmPEy1V84JqADD
	6WhS5ranewN49w/Q9ulHnCduF5i+9zMjLmAR3pxO9d0YHDam2NXTdUcnpzEHmyh5YhXx7Je6Jl9
	Q4KHycvetGS2mKCF8ExilDEMWLtRF1Wut1Kcg9HqqAUJ1/53PncO7CsjFOi+n6DOZFpT3M2Auh2
	kxfdejGkJQKZrwVnhX8PHXSaPKiMah6PA3Oc/1ojUbIK1xDcenR+JlPdzqwPLpuH9hM8IRmCjt/
	WnomhGUA==
X-Received: by 2002:a05:7301:fa0b:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-303986a6856mr10450882eec.27.1779294429124;
        Wed, 20 May 2026 09:27:09 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0b:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-303986a6856mr10450814eec.27.1779294428468;
        Wed, 20 May 2026 09:27:08 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e3c0sm24600310eec.3.2026.05.20.09.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 09:27:07 -0700 (PDT)
Message-ID: <bc3eb187-d0a4-40ce-b72c-1724b33e28ea@oss.qualcomm.com>
Date: Wed, 20 May 2026 09:27:05 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] firmware: qcom: Add OP-TEE PAS service support
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
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
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260518072856.22790-1-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260518072856.22790-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0LjWZS27yvY6UBubAev72C9JTNz0rJ3B
X-Proofpoint-ORIG-GUID: 0LjWZS27yvY6UBubAev72C9JTNz0rJ3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MCBTYWx0ZWRfX+cNarSfI+U9v
 b9Nd/+Bir5bygZjCaf9A1lshuRA06zqF6Pn1+dGrIlE3hFylfI9obd4kKogNpCjuThR1u0NH17/
 pRnr8FrbUfw6c6pCleHLt4SDMnCS9MPzci3zeH/SgGXITlG5jzuoOa2gbv36QSX05sstrQiBaBJ
 gAfOfuasrRIsD+JKgeDTo4d/UTYWSxyYPrfiUnn3Qb22e1t6E1HoZlHA4L+kb8FvuTEvgvSt8tx
 UIN7d+SK78kPm0giuFD9igOAecOGl3pZoPHbf+sJD/Hl2VNNBjT5+xgBdI15ClehZD4qkaKeTYE
 gAw57pVAYfeJsUjd45Ng58DRZEJPczcVX3sLBZrG8UpT+ZedoLhnrGifCatGGpTWiVNnjI81olq
 TytQqnOf6R7yujmmC9bhp5mYpWHzn2lAWo1ACnPz53DvARhGSD4G+WpJNPBqyEy5cmeixWbsYtU
 +WFsgO47UE18Ks4ZBGg==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0de0de cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rrczaL3BcTaDGf8zvC4A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-62342-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 878AC593180
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/2026 12:28 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Currently OP-TEE support is being added to provide the backend PAS
> service implementation which can be found as part of this PR [1].
> This implementation has been tested on Kodiak/RB3Gen2 board with lemans
> EVK board being the next target. In addition to that WIN/IPQ targets
> planning to use OP-TEE will use this service too. Surely the backwards
> compatibility is maintained and tested for SCM backend.
> 
> Note that kernel PAS service support while running in EL2 is at parity
> among OP-TEE vs QTEE. Especially the media (venus/iris) support depends
> on proper IOMMU support being worked out on the PAS client end.
> 
> Patch summary:
> - Patch #1: adds Kodiak EL2 overlay since boot stack with TF-A/OP-TEE
>   only allow UEFI and Linux to boot in EL2.
> - Patch #2: adds generic PAS service.
> - Patch #3: migrates SCM backend to generic PAS service.
> - Patch #4: adds TEE/OP-TEE backend for generic PAS service.
> - Patch #5-#14: migrates all client drivers to generic PAS service.
> - Patch #15: drops legacy PAS SCM exported APIs.
> 
> The patch-set is based on v7.1-rc4 tag and can be found in git tree here
> [2].
> 
> Merge strategy:
> 
> It is expected due to APIs dependency, the entire patch-set to go via
> the Qcom tree. All other subsystem maintainers, it will be great if I
> can get acks for the corresponding subsystem patches.
> 
> [1] https://github.com/OP-TEE/optee_os/pull/7721 (already merged)
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/log/?h=qcom-pas-v6
> 
> ---
> Changes in v6:
> - Rebased to v7.1-rc4 tag.
> - Patch #14: fixed ret error print.
> - Add Kconfig descriptions for PAS symbols such that they are visible
>   in menuconfig to update.
> 
> Changes in v5:
> - Incorporated misc. comments from Mukesh.
> - Split up patch #11 into 2 to add an independent commit for passing
>   proper PAS ID to set_remote_state API.
> - Picked up tags.
> 
> Changes in v4:
> - Incorporate misc. comments on patch #4.
> - Picked up an ack for patch #10.
> - Clarify in cover letter about state of media support.
> 
> Changes in v3:
> - Incorporated some style and misc. comments for patch #2, #3 and #4.
> - Add QCOM_PAS Kconfig dependency for various subsystems.
> - Switch from pseudo TA to proper TA invoke commands.
> 
> Changes in v2:
> - Fixed kernel doc warnings.
> - Polish commit message and comments for patch #2.
> - Pass proper PAS ID in set_remote_state API for media firmware drivers.
> - Added Maintainer entry and dropped MODULE_AUTHOR.
> 
> Mukesh Ojha (1):
>   arm64: dts: qcom: kodiak: Add EL2 overlay
> 
> Sumit Garg (15):
>   firmware: qcom: Add a generic PAS service
>   firmware: qcom_scm: Migrate to generic PAS service
>   firmware: qcom: Add a PAS TEE service
>   remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
>   remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
>   soc: qcom: mdtloader: Switch to generic PAS TZ APIs
>   remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
>   remoteproc: qcom: Select QCOM_PAS generic service
>   drm/msm: Switch to generic PAS TZ APIs
>   media: qcom: Switch to generic PAS TZ APIs
>   media: qcom: Pass proper PAS ID to set_remote_state API
>   net: ipa: Switch to generic PAS TZ APIs
>   wifi: ath12k: Switch to generic PAS TZ APIs
>   firmware: qcom_scm: Remove SCM PAS wrappers
>   MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
> 
>  MAINTAINERS                                   |   9 +
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso      |  35 ++
>  drivers/firmware/qcom/Kconfig                 |  21 +-
>  drivers/firmware/qcom/Makefile                |   2 +
>  drivers/firmware/qcom/qcom_pas.c              | 291 +++++++++++
>  drivers/firmware/qcom/qcom_pas.h              |  50 ++
>  drivers/firmware/qcom/qcom_pas_tee.c          | 476 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              | 302 ++++-------
>  drivers/gpu/drm/msm/Kconfig                   |   1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  11 +-
>  drivers/media/platform/qcom/iris/Kconfig      |  25 +-
>  .../media/platform/qcom/iris/iris_firmware.c  |   9 +-
>  drivers/media/platform/qcom/venus/Kconfig     |   1 +
>  drivers/media/platform/qcom/venus/firmware.c  |  11 +-
>  drivers/net/ipa/Kconfig                       |   2 +-
>  drivers/net/ipa/ipa_main.c                    |  13 +-
>  drivers/net/wireless/ath/ath12k/Kconfig       |   2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c         |  10 +-
>  drivers/remoteproc/Kconfig                    |   4 +-
>  drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
>  drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
>  drivers/remoteproc/qcom_wcnss.c               |  12 +-
>  drivers/soc/qcom/mdt_loader.c                 |  12 +-
>  include/linux/firmware/qcom/qcom_pas.h        |  43 ++
>  include/linux/firmware/qcom/qcom_scm.h        |  29 --
>  include/linux/soc/qcom/mdt_loader.h           |   6 +-
>  28 files changed, 1119 insertions(+), 320 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> 

In my automation I do bisection builds and it fails when I bisect.

At "remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs":

../drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_load':
../drivers/remoteproc/qcom_q6v5_pas.c:244:44: error: passing argument 1 of 'qcom_mdt_pas_load' from incompatible pointer type [-Wincompatible-pointer-types]
  244 |                 ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
      |                                         ~~~^~~~~~~~~~~~~
      |                                            |
      |                                            struct qcom_pas_context *
In file included from ../drivers/remoteproc/qcom_q6v5_pas.c:27:
../include/linux/soc/qcom/mdt_loader.h:23:52: note: expected 'struct qcom_scm_pas_context *' but argument is of type 'struct qcom_pas_context *'
   23 | int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
../drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_start':
../drivers/remoteproc/qcom_q6v5_pas.c:322:36: error: passing argument 1 of 'qcom_mdt_pas_load' from incompatible pointer type [-Wincompatible-pointer-types]
  322 |         ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
      |                                 ~~~^~~~~~~~~
      |                                    |
      |                                    struct qcom_pas_context *
../include/linux/soc/qcom/mdt_loader.h:23:52: note: expected 'struct qcom_scm_pas_context *' but argument is of type 'struct qcom_pas_context *'
   23 | int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
make[5]: *** [../scripts/Makefile.build:289: drivers/remoteproc/qcom_q6v5_pas.o] Error 1


At "remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs":

../drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_load':
../drivers/remoteproc/qcom_q6v5_pas.c:244:44: error: passing argument 1 of 'qcom_mdt_pas_load' from incompatible pointer type [-Wincompatible-pointer-types]
  244 |                 ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
      |                                         ~~~^~~~~~~~~~~~~
      |                                            |
      |                                            struct qcom_pas_context *
In file included from ../drivers/remoteproc/qcom_q6v5_pas.c:27:
../include/linux/soc/qcom/mdt_loader.h:23:52: note: expected 'struct qcom_scm_pas_context *' but argument is of type 'struct qcom_pas_context *'
   23 | int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
../drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_start':
../drivers/remoteproc/qcom_q6v5_pas.c:322:36: error: passing argument 1 of 'qcom_mdt_pas_load' from incompatible pointer type [-Wincompatible-pointer-types]
  322 |         ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
      |                                 ~~~^~~~~~~~~
      |                                    |
      |                                    struct qcom_pas_context *
../include/linux/soc/qcom/mdt_loader.h:23:52: note: expected 'struct qcom_scm_pas_context *' but argument is of type 'struct qcom_pas_context *'
   23 | int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
make[5]: *** [../scripts/Makefile.build:289: drivers/remoteproc/qcom_q6v5_pas.o] Error 1


This is because the 5/16 patch depends upon changes in the 7/16 patch.

/jeff

