Return-Path: <linux-media+bounces-57617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHtnKy17ymnk9AUAu9opvQ
	(envelope-from <linux-media+bounces-57617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:31:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6EB35C008
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B30C300A266
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512273D649A;
	Mon, 30 Mar 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sa8cQC3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5xvxzub"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A148F3D5225
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877191; cv=none; b=PZ4Xb3sigdrOxgEAz9TVC/aayzNHm7vCmdI3Dl+johOTj1dZ1L7gjdxuyG92oN0qDK5c4SFN93QVJHRfpsbxDDEmWReXUv+I6+440wCp3y+6qmurQRR6bfU+DKM0Rg4s9yFWQoFXLg85N8kSLHVxRr9GUg2gG3qO50TegOMo0jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877191; c=relaxed/simple;
	bh=RfNWszHTO2Nvc57M9NR92O08D0YgcuMmqvV8J4kXTPM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=poxFp2Tscua0Yqt5I21JnsWPHF8bA1AxxL6kYkJD/xUIuFHFYh80w1BZrYq4sEl0634ALG4v3hc9s109CK8S0/gdppwBIG9RkYgAEm50oKju2sZSJD3t32pwluyYaLqAyp27oMh6tv/6NrFocThlXWgc8s8gSUS/6iNIrKGKoZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sa8cQC3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5xvxzub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA7ev53539591
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 13:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWcsJ96jYY6nPFiisAJE4z79KpWsCLLflxwR5XxpFcw=; b=Sa8cQC3tviCDCn+U
	QjH/lYXlyXMRq9EfqEYzPR+ObREgArLRx2WvzHONCHoI9GpeYhlFq4KRiVfw7UHV
	CWQh0zRqVzDH5cl+Urkr2nhYo/5cXPQSkFxp2f3UQXbgkQh+DH15DQbdOIaOtk5h
	YMuLuavDfmoP8eebUCMqpWr39lId5lDMj3etp+99NUCsaRlCtmHDyEjulDsYfrfg
	wW4CPpfzksgcOhDrJYObsnsRXiewaJvAUBPFfnlzZvXGkaL1daaG+bTlO5bPgClQ
	6mFkKFBz21hX6oY7PweFiMd8q4ehGwPemXtS5+C9Tt6ULBnOYO1VIMt/9MKGOhW5
	2g1Epg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59rrey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 13:26:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso92442541cf.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877189; x=1775481989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IWcsJ96jYY6nPFiisAJE4z79KpWsCLLflxwR5XxpFcw=;
        b=Z5xvxzubIRdWbj33HoSqMzNQNrXXDaRgMz+e7mSX5EjiwP/EijRcFsgrZBKlEJyU2x
         O/2D7hiTxxVKuvkLElI9ea9YrYKEdYQl+T3XC/BYHwRMLNI2uljxPaueHAeg2To3Nq6J
         hZTic8z6PA1NF50zb1YDeNUZy95dncmoQLIVRYUcYbXMSciQX2ANx3g0n/fm8IjMbKsr
         UeLNHe+CODTqYlsYaGCHA6kGyekf5H7Ors5nFsqUDU0O1tPKeUGXw9UBt40kDSQqTTeQ
         4YFvtmYufZoSCfNLN0nay73Hshd5OnPG4vHEaYo9+uEsrw9M32fLpTQRZxK+leqaMO1t
         KRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877189; x=1775481989;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWcsJ96jYY6nPFiisAJE4z79KpWsCLLflxwR5XxpFcw=;
        b=GkxUTSnjSHEmqXqHEwJuFbVmzklBn8nl7/mtDpaE/ASYBSvDTUB1i5H8fTSDmnScUl
         iO7B7cNL3rnHPYC1/XrQZ5giI3KnKmJ7teBE5gtX8y93+/X2Ut5G3dSCtLndNRdQl8TP
         1OCHFtik5TMKy9ws7smNXoSXu5FI+I5+tPKvfyX5nn7tcJu56GI/xNDUUueBiUCUA1Ht
         Z8O0qxRiO8/lbnl1Gv7tQAFW46Wbinkl/77L2j+5bs4jR+YiixhwedpkuDudhif5c5I3
         b0d8cBRF1JhbWw/yVkA9quO+pWttiMQlWJ0vY8aCsiUaRHDeHGDbJOAl1VMlEfL91fFr
         ormA==
X-Forwarded-Encrypted: i=1; AJvYcCViD4CqLYzxL9exe97TAFFqzJwViCDlK7HFrMilNq7duzo7Z6KMxjikzblvmcyopPLNhlqLwV+trCsIWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq+00wfT3ZMd3vHLgOnd/JUHDizy42nqZPWAelw3V6isOPw60j
	IXABUzq8V2N56JMlM3lKaBiG+HKGDSk2REji+H+szq81YGnv3fLiqd1/fJLIgsDkbpJG4jOwTGj
	3X135ukpFAUAEHtaRT7HPnvam4MjyAQP+qCoCTTcBSgqJsV10DiOsddZqfAlbdRyO5nAkjMeFYQ
	==
X-Gm-Gg: ATEYQzyPZTb1QHTJcLTFzKE2DAfPBbQCQgC+rE+gv3nRkWKjeDCblmY4HqXulm97nLQ
	EOpi/NnEiMMUdonNyK2tWuGkFE49RmtAFaneQiA/omIOyjkwakDM1zOZsuzNB1ZKvWkwaDX16zf
	qHqeY5tDAoOBb1ZMTTZN3b4ZZIWgyjWUMYmr4yZ1ltEygy0Aq2YfgAssvrsPXP5QqIDvpFD3aBM
	2pFQhvv7NLaercPZ689kpX3kFVZNtsxGtFKF5MG6Fzt+Fa2jzIQAysngJXgZGT+VRZMPQkgtIuO
	FyHlpKQEV1KZ6iZ9K70FIrycIQl3LpH1qfNXv5aBbkuuCuLDnZNN67CzshUKxFrhsMY6ox8/eQS
	wLh1xHKvZZw+p7zWJhpWseqTlmA0i54zVDlYwe7r1m7luaBdLaIGWvZMpS2YGZHEfOCyL1rIPbr
	z0JLzNGfQCi4pqRKFxZIfKp89lfaB88ydrgJHqUx9rBBaz8ktaO7ER4r6dm4VOiuzRWheqdu6tt
	62oLEZLlIz4fRq8
X-Received: by 2002:ac8:5f0a:0:b0:50b:46ba:d271 with SMTP id d75a77b69052e-50ba380812bmr173865821cf.12.1774877188469;
        Mon, 30 Mar 2026 06:26:28 -0700 (PDT)
X-Received: by 2002:ac8:5f0a:0:b0:50b:46ba:d271 with SMTP id d75a77b69052e-50ba380812bmr173865251cf.12.1774877187874;
        Mon, 30 Mar 2026 06:26:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae527d6sm312074366b.19.2026.03.30.06.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:26:26 -0700 (PDT)
Message-ID: <804e6983-d796-4cea-95a3-c8f18a15914e@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:26:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] media: ipu-bridge: Add Dell 14 Premium DA14250 to
 upside-down DMI table
To: MaximeD <mderaspe@imarcom.net>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, linux-kernel@vger.kernel.org
References: <20260328150957.22380-1-mderaspe@imarcom.net>
Content-Language: en-US, nl
In-Reply-To: <20260328150957.22380-1-mderaspe@imarcom.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mDCcetTB2sTrzwitRd9vtdMO7APrebA1
X-Proofpoint-GUID: mDCcetTB2sTrzwitRd9vtdMO7APrebA1
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69ca7a05 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=DrCXJf7-AAAA:8
 a=EUspDBNiAAAA:8 a=VxxRKz_Y2x_0aIFPVb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=RISatZfNcGsLLIt_GDCg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNSBTYWx0ZWRfXywOJlQSPN3dl
 8G9L6OQCHf9MdNr+KKBwZSWap8Hxe2pyar3mNDdzehiMc6ZxVverVXrhQY4aZYmR6+lYc+6d1nB
 0SlCNEjBPtOcatjRaDiS6TySmYupbbwvfMGJz4U84HINCAkt0OeqlAiDL2o0MboNK8DHhjyJ66m
 Ck1vwC66dJBtOUa7Ozczb4Zw4ERUGSy4mPXk6iGjDLZElLNwwDw0M8ytNw6wSf1pC68pZ0IoDLI
 w/NC7sOTvMNQboGAOHJg1WwumKvk0No2LDnWd8kCNU97Z8VVISeGj6cqgPQowOxVCttjqC7DlqG
 5SJUV/aRV9e/cVBPY3MM06QiylMyn5ifLo7PdxfBib+h+goujRVjXBJSxR7sC7u4Q8VT6vXZR1s
 uMlFAUx1qLNZ5NFFl1ef84Uu2s9NmbXGtEqbY2d/MTXqM5x1O9gQCfVwTnMZpZvfiqNt9bMgYP+
 FfJ0LLT4Yz5H4RjpANA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-57617-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD6EB35C008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 28-Mar-26 16:09, MaximeD wrote:
> From: Maxime Deraspe <mderaspe@imarcom.net>
> 
> The Dell 14 Premium DA14250 (Lunar Lake) has its ov02c10 front camera
> sensor mounted upside-down, but the ACPI SSDB does not report a 180°
> rotation. Add a DMI quirk entry so that the ipu-bridge driver reports
> the correct rotation, allowing libcamera and applications to display the
> camera image with the proper orientation.
> 
> Signed-off-by: Maxime Deraspe <mderaspe@imarcom.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index b2b710094..2611a96fc 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -118,6 +118,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
>  		},
>  		.driver_data = "OVTI02C1",
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 14 Premium DA14250"),
> +		},
> +		.driver_data = "OVTI02C1",
> +	},
>  	{} /* Terminating entry */
>  };
>  


