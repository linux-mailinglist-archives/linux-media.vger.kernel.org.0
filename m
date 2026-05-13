Return-Path: <linux-media+bounces-61402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM+gBeBcBGrbHQIAu9opvQ
	(envelope-from <linux-media+bounces-61402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:13:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A52531FC9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0096D305A291
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C044D3FCB29;
	Wed, 13 May 2026 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ds76VG+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFJYm2y2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CCD3F54A0
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670719; cv=none; b=DXcUJ317+O2hw8gXl0jZB4uGo8Q8KKlgIzW/4tq8kPKIo9qUquW7hvt69/V24/5/Fo+uvyTG1pFl66bOeC8b9n1TexTsOgdKxZrr7PyO8tZHTfv4rvotpsWp+r1w9loKCzjZRM1A4znPTshml2OooRAjHUkYoZoKnKuQJn/HUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670719; c=relaxed/simple;
	bh=mkrXyw6L2iMl4gNbwkquSUXVnpd902cOpp2y5ekRdnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUUIB61Goxr7FSjUX4NZX/+tcQXhQgD3u4O6ubpl/+ZyZfoxvZV/CXBCTGx3olG+VhG8WN3ODMVFTFkamCWgK6y3zmJoa6RdDzlWSLh6Msij8FkgDc9HOzHRXnLMfV0KtZwAF9fn0HeJgmRDESSn8bxJTzODmWTpRyljQ3+PEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ds76VG+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFJYm2y2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgmp3007391
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2NXb5UO5n/Ylg1gWvSiPUzAq
	tabq6k4j1r6q0/IV1rc=; b=ds76VG+0rsW7F6PWsWzLGOfHy0Nssn6NgIuqefj4
	RBaATsdJJcbMUu+UIRBpWIcKep26JPbuf3Zi2eI2/5ziMHtGUISexNll8y7lFhe/
	itYJWRkH3Gv9rEV4LNTDgWigCU3DOUqWeWRE6WRNsCMe84f4T1Ij7Y3/0U+XdRc/
	Y7NaMasVuylKHh6+W3i/mjESa4JH5aPLdKtaUioQXAzkHi7Jfi9P9BXbkVYq4Gk9
	n2GZSzmTw0FcynhjqoseA11M7pbBtT1UcazLeJePHoOUbAx3msoqTmY8Od3ANUE2
	W6WNDPTHOhLqu8JlZPkyhBf82ZT8850PuQbcXeZ1p7RPRg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0ga6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:11:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca29dcd69so160654286d6.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670716; x=1779275516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NXb5UO5n/Ylg1gWvSiPUzAqtabq6k4j1r6q0/IV1rc=;
        b=PFJYm2y2G4Ym8vjqM4M8gTx5b7pzchHIht4BU1UYz+9JuNJD97ey7Gzss8uypoWC2C
         nB/oINzVzwuWSteUIb7PdUd24fwqzBlxnfTXctazM0DjydILBo6qF7z50Wk+rm3BJDlj
         BHwC00oq5O/5Ng1SUmG0H53WZnjcOcEhv4AYnJ6zdRT9Vi7SIlPBc3iCFy1XBDhmDEao
         IDSOndsHsiaKGFq7HVnVI9z2B5dF33z1ZhvJeEIyexazOYFtOg6wIi72tOfuf/tVvN7T
         TghjZxJyqd7HpBUXzNb+yJ6+YICWyQw4/7Tt3gn2I/XWKcASqoHIxUTyfkT5qoWT1Hho
         StLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670716; x=1779275516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NXb5UO5n/Ylg1gWvSiPUzAqtabq6k4j1r6q0/IV1rc=;
        b=kr2s46Qm4FIV2rm/kLZGVqEi79PZWLyvb5tHvQpLfqe1gf8cVY9hzdNAgdjcDW04mK
         2UEHfxIjkhKevBLKwYbOb0xddqNZRROJ+ffW+YhWBY9qJEkxv0zFT8K7SGoCADYeC+OE
         FSkAc+DhK3udptHhpgTv1b+sZ4W7oMFifwG6qN4p1ZHGvUB2J4DLT13R6skz8urm4x98
         d/g35Y7+YcqK2lM/TvuZ++bYPXqw1BysQGFkdkv3nGoc4TzQ+ndnXDFFopNCb6E+PIxq
         ymy3xPL1OWEEngFIOH6MyhYqrSABjNraOlgCrRU0uKu6N9KHeHDyk55U5oGcgq+T3Fju
         u+nw==
X-Forwarded-Encrypted: i=1; AFNElJ/mOVvTsBs21Y+fGl3HkvkxOrPBzEo483GLboRffnWBbfvmpL2rUubui6dfCdOiSQ/tsLEWZhUfu2pLSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsqGMNodVTUFNXQd+lP+G/RjvW/1O9c1SXzz0kYhBJYHWsyKJ
	8FS8WK1rITUrn7qRbeAgRO/NUIb7XQUHxzI0yBrX6cmDfe6YsuAZoZQ6fagO9anyOBWXaD8UNTF
	9UK7/fTmgTr1vfXWgPd3e+f1Yhv5r0jmtTyEXJNzcIgw4ncP6z1YtWx6+XMfnjeJzCw==
X-Gm-Gg: Acq92OGsBvixpB1FbqE5sowK5XP3/VEH/EZNRQExShq37ALfE2VCdxHTFra1k7eUjTO
	MdZo1Hc1o0ibS2/QTYhPEPOEp8SCYNNBePvBeiu9HIWYWG4HepaJVs+di5lSCQ9xlEj83tbjQER
	E0v0pxc3m+k+/8bsDRAsGC1sZPUUpJf5QaciAd8HwFL8sID65BhyEDk007uZbNE21pXUS5tKlZl
	DBf/G2s2tI0Id7MapCJ/XbXwtfNBk1xI802Kc5yA7vqdbdX9rmgm2sl6PRtFMMkpmvMaTXEMAz7
	KDVCx3IPEuh2NW62LRsEYrNJ3Vg26HymVFxVRNzd/G0M5F1+MN9zE+so0IBVlP7VvDooCHwiqOt
	pRTZ1LWN4ifdWT6oBpTqHoaTyjO4F8vR9NVLada6/etLTo62rqL/3biRJ2SPoedvtuCg0EB7oGu
	W6jaULOOpPAosz1wezFRzt4KEoML3f13ma5SI=
X-Received: by 2002:a05:622a:1211:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-5162f453c02mr32992281cf.9.1778670716414;
        Wed, 13 May 2026 04:11:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1211:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-5162f453c02mr32991831cf.9.1778670715916;
        Wed, 13 May 2026 04:11:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956642dsm3889984e87.71.2026.05.13.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:54 -0700 (PDT)
Date: Wed, 13 May 2026 14:11:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 6/6] media: qcom: iris: Simplify COMV size calculation
Message-ID: <idsqqaol2d6ngqvhl7wcyshvxwnpjzfw4564ffzlqbfkm5n4y4@sa5gy7saa4ry>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-6-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-6-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfX5RUYwzFTGhaY
 dZ2LMlKpx8wfJFzi8MmJk7Fuc2ozYYx3M+nSBqeC2Kelj+U6rwg8H4k91gEm/pJRTFHHuXTRyyB
 K7kJ/8zrvU6PSVyveDZ9MsTkwjYyvY/h2HjT4V8VmXnAQEzWUu2aNY+AAmQlvi7UfXH9mdGG5Jb
 K0bnuSQkoqAaPagXcXOUvunrh8JuImH+nq+9eDLKtZv5tgxOY7jtDaUY+hkCz+tvIqa2haX9W4R
 CexrbD0//+tdYyjVHrqjLt7hU39qicWLV+HVEXXmTiW+gl6X1PM5cUZ7FUX11np4ih9qG5XjytY
 z6Six2TBeKN3CFbcNJrdmhJX+VfbGBJWTJEYnPMYV0uLOZkBX695Mlq4ZvRkJTPDrAQcntvz4sQ
 qt1e8OgrGZausc54duYb+3Wdtz2yDZkw/5TKI2pfcVZrxQvv7rZT0sO17NW7Vq5DIYU+yv9HUEu
 WEpAyg+2JJcNJ3nuxGg==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a045c7c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=d2bW74qClOU-8MBEJaoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QICdR-vEDAE3gH-4axcrexqzdEOaItb-
X-Proofpoint-GUID: QICdR-vEDAE3gH-4axcrexqzdEOaItb-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117
X-Rspamd-Queue-Id: 81A52531FC9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61402-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:15PM +0800, Wangao Wang wrote:
> Unify AVC/HEVC handling by computing codec and lcu_size upfront.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

