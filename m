Return-Path: <linux-media+bounces-64126-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VPbXIWxZJmr+VAIAu9opvQ
	(envelope-from <linux-media+bounces-64126-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:55:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E095A652F8F
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:55:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WaUSHASV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hsEGMhgG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64126-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64126-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75B60300FC5E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4602338238F;
	Mon,  8 Jun 2026 05:55:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC06B3590A9
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:55:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898149; cv=none; b=TI+tf4XukZaopCh7pUEExYKsZNeffVHhVQP8KpReud76S/JqtEyVzd4biCk73fyc67vIArRKHEtsLKDe5KbxcgPmVsGXjbbmG72dZZ7thG0K2P4gDz/jPFCJvfrVlyzYTN5ErjTDic76IGaashqdQOJnlZCZIbVw2jx7VrHClao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898149; c=relaxed/simple;
	bh=lg2DgbPwBLHogtvNmaTCgs1u2gHUDZnx0Yqh6XoBWnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKsW5X3rhp7M3X1ZzV0bhAfF1Vu0FIpUjUHxiS+LBIArDeLoVayXsAgIXh3OaBhQW+aL3bzLjVFJ2a7wi+1X1vmlowGetnwt8MzLyxOMG/wan4PQDwCUAwP9v/df9QTD7XiKmPbWoJkHN8ONbdq+7uc/TuoWcaNA/6F9cI84L7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaUSHASV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hsEGMhgG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Gxog1933806
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=luzPiyxgZAG14iAJcnVjDkWg
	HoqsvHzvRtaW6X+R/so=; b=WaUSHASVCqICihMkuQJ/O6Mh7HQilB+NkWIfd6IS
	rj/7etYN1IV+2q1PBBXT6S0bU5bjX58VrfBCOy+7uYMfUCRpPCkbmyBwgSuTV2ud
	d+tAKnpaWVZwEQlhlFbmns2i23MibgvhvEw00B2cxdeKnm0YqNCGXHQHX6nS9h2H
	KAMJVJ2buGNnGZU5KAQHvbo4ItbJxAbRr31WLltc3m5X/QXpUBBtg4aEzUCAUuEI
	2T6Duw+aXSh893NDsGexUj62E7dgm9HWmFxAT3kUMWvkBNjhVhvTPJ7+YRC0hwu/
	PPkKA+p27zJ/cIAlRabPFzLQ8lDYMtIlUQ9Fc7BCfnNE3g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf68us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:55:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfd441619aso1544076137.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898146; x=1781502946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=luzPiyxgZAG14iAJcnVjDkWgHoqsvHzvRtaW6X+R/so=;
        b=hsEGMhgGOCl6C7Gq3GiA3s9m5KKGmYde+1EfcQNWh3AgL96xGYHfivwfg4Oiai5ZTT
         pMGYLgC3qACxYWM1szfqN04u6ykgGwdFjwsAlH19BV+W9rxncSm2gZAcqtqkOihS9Muv
         Eaov2tlqMfVWqMGcdehyTiNCH9u3ne89bcPpXw4+hXJOlynrKoSEqG6V2j9/1DAxthZi
         Ra6hqG94YxtkgIoidljBKZ6Cvr2i+sE23ODaYW6e2V0XgsoBEuaMNQ7ulicHoVZ8RyM/
         GmEWL6h9QqhyDXN0CVUxDMqDQF7dQhrCwIIfISryidFSOH+Ba2LbzHPLb7GYOAJWu6Dc
         xuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898146; x=1781502946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luzPiyxgZAG14iAJcnVjDkWgHoqsvHzvRtaW6X+R/so=;
        b=qtHKCPy+kbqr63hZIdncRZW+rftsJ+qDyj/a+V5/rpjvRdWO8hiFb1mY1PeDjAFglX
         /gyaYDr6Bo4ohLYcWjiGdvEcLqLhbEeic+lWKzf6QzixuE4O8G+AbdhNjHd5IfaiF2Xm
         5VHMf0tTXxNXAA+1tYPQNY52XmtvVUwAx73lDJA1wc/v6rFw4NNgCc6NLBx7IBKVCXfK
         5yPPIm9rhVGoi5Z5rrgZU/Eb+YPjk124+Je3lDOSBjEkgyg55DjZcksyuFvjbs0jMNZQ
         ABijng7m57XL/m9XW3oQErr4Eae0RnjZ6RduEgC1VZzF1apsYh3RJPIoD8JDlxFAvL3A
         MTqw==
X-Forwarded-Encrypted: i=1; AFNElJ+9cWGJ0qaSFzSr7l1r/fET4tJ9o15Nbkcm2gac9eSrnzqtVQWAOd46usUBMt/hmFwjfNv/LtiyK8rjwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOkJq2iF1LOHCUVDAMFhK9bz3u4tmkoQb2mTyJew5Ymehef/y
	L/shb0POBvL4JYSXMz30mywqYgp0XMtVaRl3kfJoYEpukG/HikKcifH80POV/wqBOJxxRGjAP/d
	MTMaRBTvLrcyrVXVzqnFDaMCJlFullGS2c5ymRZysVswF2H1aJtUWrmn65alCZ36xfyuqK1J6ww
	==
X-Gm-Gg: Acq92OGcwbKsAJaFlgP65JwemzrZjqQdp/PV1NxRl0SIZfCmmM8usKfD+vHfg/cRQab
	ZcTOCRNdahrStBUtokffAaF05jFIU+24fjm1inCTfV0AdmstzNr9TWS6Fyv7INbtPuxlwnecaaf
	ELOzmG3946xlo+iY4pnbKV8j2I8iUsG0ZbYgkKS0ytIdm3WL1cdHIFwKK16TpwoxPynEQ6Fsz3g
	RBGV0Zf1QOTqiVd3n/MPrL+XrTKL+CA0WCeTIwkQOSYJBaaivnEFt8xlJ0vG0pifxhGAYGpQtWI
	9KAhWE3mX8h31h7BCwUiDR+KJK89/1CzEA7I7o1E3GYLUONdFUw5WkG7jYfRKeaLwmUxGpMScEo
	QY5Ng0BO7/E/ktNGuvjhcMqDcqtrlnc6YAL7bncaalUdObI8sf8TqYRch2t+9Swk1fOOa/cb+KZ
	jiT8db/RBO9VlfXPA03xv6Oqn2UVLDyUWUDNljiLfL0MWZ5A==
X-Received: by 2002:a05:6102:290e:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6fefee62e5fmr6355201137.26.1780898146012;
        Sun, 07 Jun 2026 22:55:46 -0700 (PDT)
X-Received: by 2002:a05:6102:290e:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6fefee62e5fmr6355186137.26.1780898145570;
        Sun, 07 Jun 2026 22:55:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b04esm3656975e87.40.2026.06.07.22.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:55:44 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:55:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <57owm4mtcve4t24cqjnpvpcbzljxi4eugmxnop32sraxzqrcj6@z347jmrvx6v2>
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
 <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a265962 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OdMo0-_2X9zdE8NeE7AA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: diYJmblg12c0QxyUWA3os7VxFL3fx3ti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MSBTYWx0ZWRfXwzMqvT6w6HTU
 1g0E/lttqO9x5sSkIRAqPVqLa9WayCgQonjivjH1ut2B2yEyvAklWx1te2ylpp3D/i81JDiq/xq
 EYOseA3mP1QUapDQ4bnoN1120u7bvELz3WP1WsnuQ2kHAEZywGh4xLdkb7keTZ45R7Xhpvn/r6/
 lYC2B06qzGla+9V6q+HKFvQ/ajs/o74woVrUpy/oN8wJMcur6iGO0zwLQKaE5Qz3W8K8J02ONiv
 MsM04Zwe1YsMZbO58qUJ+UVmUblv9sBZE2lpKGCTu5ewp4qMKFNXVkxAu4FaFZsxE02KOYS8ObJ
 VRIHl6QQ4lgaTigOpLhaVqNkFI3523v6rNl3G0Kv+o0Ltlt7dhWA1ing0ojn2wJlYODoV1sGhyN
 Z8mc/oKgL8DUqx5M/TbXosZWCoA83tQR3KHFdVdxSnvqraj7t7+vShwpF1Qqd018qJRdnslWWd6
 ZyrJH5N6TQwKwXx0Oug==
X-Proofpoint-GUID: diYJmblg12c0QxyUWA3os7VxFL3fx3ti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080051
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64126-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:sashiko-reviews@lists.linux.dev,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,z347jmrvx6v2:mid,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E095A652F8F

On Mon, Jun 08, 2026 at 11:08:35AM +0530, Vishnu Reddy wrote:
> 
> On 6/3/2026 8:09 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> >
> > New issues:
> > - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
> > - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
> > - [High] PAS metadata memory is permanently leaked upon every firmware load.
> > - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
> >
> > Pre-existing issues:
> > - [High] The sys_error_handler delayed work is never canceled during driver removal, risking use-after-free and locking crashes.
> > --
> >
> > commit 85711dbb43a8f02c3f39064784fe37381f80c2c5
> > Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >
> > media: iris: Enable Secure PAS support with IOMMU managed by Linux
> >
> > On platforms without a hypervisor, Linux drives the firmware loading and
> > authentication steps directly. This commit extends the Iris driver to support
> > Secure Peripheral Authentication Service (PAS) on such platforms by creating
> > the firmware context device and mapping the IOMMU when the firmware device
> > SID is present.
> >
> > Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> >
> >> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> >> index 1a476146d7580..8bdc9273036ce 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > [ ... ]
> >
> >> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> >>  		return -EINVAL;
> >>  
> >> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> >> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >>  	mem_phys = res.start;
> >>  	res_size = resource_size(&res);
> >>  
> >> -	ret = request_firmware(&firmware, fw_name, dev);
> >> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
> > [Severity: High]
> > Does this unconditional devm_qcom_scm_pas_context_alloc() cause a memory leak
> > during repeated iris_core_init() failures?
> >
> > If a subsequent step in the firmware load fails (e.g., request_firmware()
> > returning an error), iris_core_init() returns an error, but the device remains
> > bound.
> >
> > Because iris_core_init() is called upon opening the V4L2 device, userspace
> > could repeatedly open the device, failing each time and allocating a new
> > pas_ctx without freeing the previous one.
> 
> If the dedicated firmware device is not there, will check and skip the repeated
> allocations.

No, the path is the following:

iris_load_fw_to_memory():
   devm_qcom_scm_pas_context_alloc() -> succeeds
   request_firmware() -> returns an error
     return

Now you have a dangling PAS context. It will be freed only when the
driver is unbound. If user is persistent, the driver can eat memory and
possibly other resources.

> 
> >> +	if (IS_ERR(pas_ctx))
> >> +		return PTR_ERR(pas_ctx);
> >> +
> >> +	ret = request_firmware(&firmware, fw_name, fw_dev);
> >>  	if (ret)
> >>  		return ret;
> > [ ... ]
> >

-- 
With best wishes
Dmitry

