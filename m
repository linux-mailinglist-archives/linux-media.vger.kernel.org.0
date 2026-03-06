Return-Path: <linux-media+bounces-54806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDnSCAD2qmlaZAEAu9opvQ
	(envelope-from <linux-media+bounces-54806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 16:42:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB731224110
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 16:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E4A6308B43A
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 15:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9923E3B8BB3;
	Fri,  6 Mar 2026 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3mV1Ri4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShdBiLoF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF3533B6CF
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811612; cv=none; b=Gx8sKhcakX7C+Yi4PQowCpL2f1e+udeRrJTBpfIPHLDGAcu7CXokxkdQFzMhdtdP2RQhYJmKqk+z9Vw1TG7MY8KGQ8xQ4WoeadBH6G2DhUNepQV7+MioHuV0wahjJCjMAab7wc52E/+XZcrUfXl3JFlHJhfF60wZBfxk/uvvAog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811612; c=relaxed/simple;
	bh=Bt9Qa0S7HuAqxfWE+5XT2Me1HGCFa+NbCGCJteZtnfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPDqyI7rKRVlVYXxBKaA431DpePJXUc1mt1FZPZuIHw+Y2nH3SZnI58sUAcjfNqbQpSLyIcQVRW16HTEaoy826EL7qAT/eUB/xGAO5LGwOasgZlM0ouLb5ulm6RzYtMKwjb3/sSTjRfsqexKEOS0dwZd/nwrMMoSH3JLGjG4h28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3mV1Ri4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShdBiLoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT1oj1687346
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 15:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=; b=W3mV1Ri4C0Kr+8NY
	z48jIL/Lo5XCeSg8j7D2tMGiz+BixeS5WwAv+77z6Xtmt3pR8njgOFeAZk6HFWcR
	Oe0ZKlLov/jk7pnvYIKXwyH7MfJKbX0HuZ2GueDvAeOb6k9QaQmPqWmOKdAR59pn
	xQjhDSAc5fiGNCDUU7FsPAQh5WM+mj27lJKEClXszb72kWsUAoqrv4mtMbX+Efv/
	m17Hp96OLfYiwK9tX1eSetYWiKUrZXXbobABTIeAuNZmIx4touC45LQCSaHPVUyp
	yRgXXe4KghrLLTAyBzGs+Hpwb/FHWFSoJ1U6gIwIWeqQFSbJtg7+w8atgfY78i8S
	x/xrPg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14grur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 15:40:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso4755338eec.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772811609; x=1773416409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=;
        b=ShdBiLoFgVKC/kiBbz7d+MJ0PJCXwWOaXQk3CfwGu6Q73SBV0Tvlxj+Pj25jhwzYjl
         X4rpvQuYEcQstENZTZoVQNtOhpOaig/vPoVoLraEzid9O/xQRikKXrbi+vWKPfwRaoY8
         C0JcJA/V/dv3i+oJxpRYZn42KL0O4fdW97Ull4XOx72B1pm23uBpoBTn0GHaF/njuFsg
         HVgPNppP+pgOdT9rZF9hOodJSIGisC2oYy5HEJC4tbnN/6d4vkNZBwq599Yc5Gf1O9G9
         q2G8dwZcdkyZdI6JQuHpDoR6fYKSPxswDNMc/o+a9Oj/xfmxfHxEuac28T5Su6e5AjNS
         ZiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772811609; x=1773416409;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=;
        b=H2evWLPfUi/D1f8LPS9ZEWlmduXEkqMQjEvB8z0NYrBLwQWZfkPp12Kw4wVXVToqvj
         QHwnH73Liv5KKtiCh3vuBtZLdvOEI93mkfBsVuHn7dL4e1tB0rONWf6pOXJEYZvy5kfh
         W2Wq5kL4WM8U58TJBmLV6o0v/mup4VDzFq/GuxSS+oDAG9jxOkXaVW3JpgLjiuLTn3L6
         a9e6kQ7FyEib3bZHIYo+piXEfXbqeTfnchMijE2YeLGP4Ek3qBY4eM1Vow7RAJauGeoZ
         Ks2le9u4gkYXMsuhqGC0NysrfB4QTCLmB83Y6l64BwDjzeBqy7iZ8lJLvJjUaJ9arzR8
         1LTg==
X-Forwarded-Encrypted: i=1; AJvYcCUCJa6S9584Or3nojzLMDBqhfAQKcKn0OTW2UHomKbUSgTV/YxeAvgi+F3SU2DcVRA1bnTG/E5BsvFpQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ9GdrbK9Dxp0qFhWVpml1cQJivkNPdC8aePcA4xc8yphfVh2Q
	lChECRg9LTjzxY+xFX4ktRLXmmqocjUpM+KNXKKoPOjByIBGEWSvQXp3HW88TjWmhCZKcH00t0I
	yBG6lGxHL622bO5abDZ+2W+iCaDjGE/NsMCDJylIwbLLZe2QOkKUjKwovL7sV67uEIw==
X-Gm-Gg: ATEYQzyjb6b+se3zoqmKqG/WD+adG6XlaKmCIWOEsSTZJAm+MlDkhPmAd5NFtMbgPah
	m2yGIV/MOyEJOuBcvBIAboa+KM/wzb7IIzQ6S5j2BF20vCgoOKnKMtXzGxCjidnDfxRfeMXWU6y
	jVGqTf53k4XlBosR3WdogRA3iN5aE5VgjkME7v69Q7W9Ry7WqTUdjk8/iOuTFAADAU8r5NEI8OE
	Iaqsk1tP+QeZMXHFKepa2Y+a2ralAWbRdmKBA2UCNl+A2iKAzp1dN7Wo4Ii5Yrbp2y62TxC+0eL
	B2iYguJeWtt6Xe3waQo7kwKfjC2GOJThw5RdtaRzQtXvD/mk20KCgbMhIGufzA0o2IOJbhZuLiQ
	R2rmLn73I5g6psVCWZW9QXCTl6fjP5hVZF23LDJim54Rv+/959i1BEWO//J7hDGUDO+LQ0LR1HM
	NbaBtB9VFPNIsTHQ==
X-Received: by 2002:a05:7300:ec07:b0:2a4:3593:ccba with SMTP id 5a478bee46e88-2be4e56f9f9mr928817eec.1.1772811609173;
        Fri, 06 Mar 2026 07:40:09 -0800 (PST)
X-Received: by 2002:a05:7300:ec07:b0:2a4:3593:ccba with SMTP id 5a478bee46e88-2be4e56f9f9mr928768eec.1.1772811608557;
        Fri, 06 Mar 2026 07:40:08 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f94833bsm1356612eec.18.2026.03.06.07.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:40:08 -0800 (PST)
Message-ID: <9741588f-e6a1-4749-970b-3ed814399a32@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 07:40:04 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
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
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260306105027.290375-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX0up5atVs+Cix
 /ZI+9zg6T8v+bqzH6BFFO3l/PFBUhmlFk4nB3hWHDvrRYRTOG3NWqXJrfWjfc1Bn6c7vegQAQdC
 M2ZOrDzvjeIkFLLi0wO/rK9xFkg4581f3Jbp7Th4RBPDK9nKAfUEf0j4upFFC98yNNI3i2Y1loV
 lAJ63qywHyrVAFfQtG27U1ydqh7m256NHAgSHI2k/WIFlp5Aw84jtk7wnhZsW/sGBCGF278Ho8e
 vN4nHerKN8n3o/f2mhwVrxVsPsdfrB/gyjnIjWd3WkmW+60EXXhV54qkXqK1KjfAZXg6FkpP5uG
 XBgXpRGmalBR68tq3KeSseFtUp1+cxbTKzk5J3LdJ+BLHN2ZGoouVdk3Cb8fnnKDEfXhhez09JW
 pPiAjfsKOm0YqTi806dZ/M/mhEtebDk3OlLeAYv3NPdaTG+k48IwCflqG/IBsdA3c60CH5mu3yW
 eHn3wQECux1C7Uwn2sw==
X-Proofpoint-GUID: PnSI_bb3MdCoX0EaWPcrbtkJkWwYVH8u
X-Proofpoint-ORIG-GUID: PnSI_bb3MdCoX0EaWPcrbtkJkWwYVH8u
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aaf55a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=40pWYZonmZhD7659SdoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-Rspamd-Queue-Id: CB731224110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-54806-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 2:50 AM, Sumit Garg wrote:
>  drivers/firmware/qcom/Kconfig          |   8 +
>  drivers/firmware/qcom/Makefile         |   1 +
>  drivers/firmware/qcom/qcom_pas.c       | 295 +++++++++++++++++++++++++

kernel-doc is throwing some warnings in this file which I've listed below.
kernel-doc is also throwing warnings in some of the other files touched by
this series, but since those are presumably preexisting I didn't bother to
mention them. Just want to avoid adding new warnings.

>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
>  5 files changed, 398 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
...
> +/**
> + * qcom_pas_mem_setup() - Prepare the memory related to a given peripheral
> + *			  for firmware loading
> + * @pas_id:	peripheral authentication service id
> + * @addr:	start address of memory area to prepare
> + * @size:	size of the memory area to prepare
> + *
> + * Returns 0 on success.

kernel-doc complains:
Warning: drivers/firmware/qcom/qcom_pas.c:103 No description found for return
value of 'qcom_pas_mem_setup'

should use the kernel-doc Return: tag

 * Return: 0 on success

(Returns: is also accepted although not documented)

> + */
...
> +/**
> + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
> + *				   and reset the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return 0 on success.

hmmm, kernel-doc didn't complain about this one so the script must accept
'Return' without the ":" (but not 'Returns' without the ":").

Suggest changing to Return: to be conformant with the actual documentation:
<https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation>

> + */
> +int qcom_pas_auth_and_reset(u32 pas_id)
> +{
> +	if (ops_ptr)
> +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> +
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
...
> +/**
> + * qcom_pas_set_remote_state() - Set the remote processor state
> + * @state:	peripheral state
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns 0 on success.

Warning: drivers/firmware/qcom/qcom_pas.c:217 No description found for return
value of 'qcom_pas_set_remote_state'

> + */
...
> +/**
> + * qcom_pas_shutdown() - Shut down the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns 0 on success.

Warning: drivers/firmware/qcom/qcom_pas.c:232 No description found for return
value of 'qcom_pas_shutdown'

> + */
...
> +/**
> + * qcom_pas_supported() - Check if the peripheral authentication service is
> + *			  available for the given peripheral
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns true if PAS is supported for this peripheral, otherwise false.

Warning: drivers/firmware/qcom/qcom_pas.c:248 No description found for return
value of 'qcom_pas_supported'

> + */
...
> +/**
> + * qcom_pas_is_available() - Check for PAS service
> + *
> + * Returns true on success.

Warning: drivers/firmware/qcom/qcom_pas.c:262 No description found for return
value of 'qcom_pas_is_available'

> + */

