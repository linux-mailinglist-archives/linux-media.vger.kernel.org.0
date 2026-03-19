Return-Path: <linux-media+bounces-56343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPnEAF4MvGkArgIAu9opvQ
	(envelope-from <linux-media+bounces-56343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:46:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A8E2CD1D1
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AD1531ABDE8
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7FC3C457C;
	Thu, 19 Mar 2026 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV2t3pOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9uO2MBK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F73D811C
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931489; cv=pass; b=oZHK0TaeLTGWZ2yEX2k28BEW7tRKcqffW4CeWi80kqMOoecfRsUnvuUN4C6OhJlCKkMiUALIH60MXAw0F49GmEz3gi8t5Z8uXRzw/yS+74/cpjzw56wmlApIFO3gUDnif4IGuY6vyMWJEyETiZYxX+j3QLCpp5OYSLhIvIfUNpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931489; c=relaxed/simple;
	bh=iScI2R+wXgkBZvtVOrn5WpfJEeko1N1DqCz/XnwMYSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpIP82KVEcJJsN9BPPQkeOiV1Ag/R/H6smxFD8yHm0fGCToo1aVCCY1U1gegGmDS7wHHLHoIEvsPi45fbW/hDjoXVg78MihrGg9FnWMlzAgFD2JvPCnnqc9dmxXIyeUdjo1k/tFJ0BX7TJT9EtqNS/mbMUxBvLZQYKVlb/QyFlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV2t3pOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9uO2MBK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEXVdg3648381
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 14:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Fyi1yt3nTs/xAJSqJrKxvPcn4db4szTYDVPLo4lYLk=; b=JV2t3pOVdBSRpfgA
	iIFRAg05/206birVMfPQThVb06GnTPe+Sfabr7NrAyLW4qsp0uAVc2oCaxaBqFBA
	LTCI+KTg7Ee7Mk7byL3tO4da6fFutzM+fo8alxmhSy8Y5jO5EKQTWGpZAOCHjumt
	EXZclBtKPaBxDxjXwf8KZPprVrjEe4iCwTQ784VLohfuDZ/H+nB6uAy6xJE/QUgo
	VKqfJFD2PN3KSfpqZGNo1ToxBjI1UaaSOHTyUyHGZUtQMs9ymg7b9E5vDTJgeoBU
	K2h5OpNfZIv1fQFG+7aX5It8YIWS13+m8qPNVy1HxDRixlKeoONWdTz+fu7RIBDu
	S80+OA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0v81g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 14:44:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899e89bf366so66339336d6.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 07:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773931484; cv=none;
        d=google.com; s=arc-20240605;
        b=KPEKC28TFuDWvdBoPuLrc1Xw+rM2cyxoG4LDKCk4tZ9z/zGkMBPcxOv5io28nUz0v/
         7ansj+0TiEzh7YKSmQfN30Fcn3FF+IUMEEySzZfHwlPjF+UMQ9nJiBk4b26brRMqoFaI
         vYvZRNu7xV3m7lU31VmhHRXkb2ZGdTbzQ8VAbI3s3ovEoHzy6t1FFF7QsJ+mrne4L48e
         5QTX/T7onmqB3C2olcKhq7c4YMXqxTZ1IFZSHp3kPdHUFHUVvbesHc6GNyfEP5UQVC4L
         zbDu3PsJcBBUqoFOgTisMgNKHKp4PPaut02BzOQzgAMzrbGkGmPXm58i1F+XZLmQh+1m
         DFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Fyi1yt3nTs/xAJSqJrKxvPcn4db4szTYDVPLo4lYLk=;
        fh=OZcuzE8coRZ2YbnvW+JiXi6PC/eUszkXFWzWXzgLHD4=;
        b=l3qimkk7mvqKZxyw343lJsqDS/j1ZtHcUys7wVCqkaVH/zJ5UzbNglqDg2OhPY00Dp
         aECz3jSy+OdlfvTi7dVjIx85BxEeQlsLShxWtLSmugWgOfQquzrexYvKBMF8idnis7r6
         PeQrmlXNq2kgmDiitRC6kGPXAEnejXhZAQnT8g8Ny8QpLC9P/6YKNiOCA43/LzW8qz7O
         kncPIJAJhTckKa6GeRHCB2s43W2PMWIF2nw/DfspptBox2wfqe6Ksul1Nr3gUM76ZaZW
         gMUUuMiEOH/s0lTafxr7IR3N4pkeHyLgBl+xpOlJvqCAcH23+TqLQC38Nxdh6xepo3oy
         z4rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773931484; x=1774536284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Fyi1yt3nTs/xAJSqJrKxvPcn4db4szTYDVPLo4lYLk=;
        b=F9uO2MBK8UUvbbn2bvWGLIQBcw9UXlk3CXcbJA6XUY2DtbxCz7g4/aERcFFhBoiUs2
         UNWqpaVpUcCyRVGh5BSJR0tFBMhjK51oUVDze7scPIqxQfj19rTK+FKk1SlsRnSNqEdJ
         08HDOS6PVNM8gAR313SisAtAd/V6aDcsKrUL4AwKAQ8hxupywPxnAdT+w4UQmSWwyCP/
         9WEHBeWlR1vTptbmn1A7qEIg/R5jcjQey7RXY/5F9tqIhdrVXpKUO+uMw3zqASqSP1M0
         jjMQUUyX5OKB6/SBRTazqw/IKvVuh9jLKiSKe9UbJ1ZM4Dc4mno7oe+J5Mj6WFb+M8W0
         CVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773931484; x=1774536284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Fyi1yt3nTs/xAJSqJrKxvPcn4db4szTYDVPLo4lYLk=;
        b=X030b26kYXNprCyqhh3nnXRQWDD1/fPUD2FedL4h5zYeXom+D1T4sKKbdQlQ08ewSy
         59xTod43VNiaYobJ7RLuoGchLx0e2zMK1GuPQBI1S79dfvlxgFRuol+Zs89UJCPW41Ng
         blB54eXgKygbqxNnCn/XqGvd1/FRnvfEBy8LE3AFAo9ytnCcvZmVuCD4MiDnsvi9rIJc
         vSXcOXIymmWDg0bCxwuyDxxSP+TDvxQUPMRT9PDckJNtmBRGWpzlAQBVvgn+/tzFs3D8
         OhCFVdI3+wIlM9WRgnMnZkA3JGfK1bbzE9gp9qQNgy5EeJti2Nejc3hQ7YJPP3crhzKo
         zEfw==
X-Forwarded-Encrypted: i=1; AJvYcCW7gDwP1Vse3gNqgbj4h1Br1hx6FIVmFnN3YYgxqGCY21rTnLb+b7GE8W6zJl0YPPkQruyNcpWzqqzgYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTmgn/jA1hO5WZTdX+5t/HVtzkwHAjrvFL1tirPobZtsMPLfbS
	oXas8uIMT8Gq4mZ9ydPrqYCYa1hRndTPziEHaD8aIEa3kc6q7DrNVH8UKKcDzeNq0C6V3Yu3ETo
	ageiXIZKpM3szSOYQzLzo6J+AGGpUmRglsLPOispmlXGPW/VlfBZBUyGsLv3L648RfN0uRojeIB
	7fSiOijuYb6qcHWPs6fBXDtD4zCG+TxL/d+Y29GsAQ
X-Gm-Gg: ATEYQzzcPDv06Th6I5SBe9mh1ptmyxWc9E6B/lLAYrHatAwQdj0R9okM8n1X2XiJY6I
	ZXTgVwIQwgOhiz+dz4o/YF6REpnuFOzRJhBg5h3tl+tHAMWHvOxZHqtmJMbWmazvoM6N63jrLLD
	sfG1yGmdrxKdzXbXawKroCC5oLezkHYQrPfF43cot7pULigbuMgOVsUEB2jBcqUnKMg5IHBy+fz
	SsOTTT/x0AUskabuf5DKeAQ1WwqRCV+dYHAFuXg
X-Received: by 2002:a05:6214:2f0d:b0:89c:4bba:1a8b with SMTP id 6a1803df08f44-89c6b5ca720mr110874646d6.29.1773931483606;
        Thu, 19 Mar 2026 07:44:43 -0700 (PDT)
X-Received: by 2002:a05:6214:2f0d:b0:89c:4bba:1a8b with SMTP id
 6a1803df08f44-89c6b5ca720mr110874056d6.29.1773931482936; Thu, 19 Mar 2026
 07:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
In-Reply-To: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 15:44:31 +0100
X-Gm-Features: AaiRm53qCQKTMqG75QzQnxtOWdhLcjw56IMjmkTc-WHUEwdd1sCbYQhDfR7ObXM
Message-ID: <CAFEp6-2XrMkKzA4KAEkYF0v7XzVefFpUEG98VYa7wNuanbZ-Xw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE lite
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NaUcBnlWGLUcoUX9kNyoLEGN2ENI649Q
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bc0bdc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=kqQi33uepLIkosAFTLAA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: NaUcBnlWGLUcoUX9kNyoLEGN2ENI649Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNiBTYWx0ZWRfX0Pfhb3nDOlSa
 EvJ+QE02B212SkaPk1gQzTQdLwtFnRSYg1yOlBf7NU8VcfQMqv2WY4kJWINEf/cb8kECJXg4wlZ
 qS1/dBxO7R3L8B/E0NXH12Ix0cTEmlJ1ZfrgvCDUsz6Cd9J2NDOG68cRTnVr5eOFpaz/jGGUNd3
 6cLTp47QC7uyxrHXam2PU9wmWdnZXC7uv6CrPucZNaRFnebt+4OmcWPTbwKbBt+NNtXwFBJ+vh+
 Z+MpV6XHc/ltaMDjEe7UUt2X0ZlvfbACZJWkyLp9pk2tWLT07VfhBWZLEVoM5n9JSDSz6QnyWVA
 6rut+v9LYVTQdUsKY2sj3wRAFpQecJu40vSPfErwREX7Oe6WxRBHN2ikq0JUJ4ykfWCJHrOoBAC
 DzyaisixpusajN4uBS/FiiP2HRf9jAq+Brj9jAiptZlcsOiI91BSfD4pqfJZgVIuInkg03qM5aO
 +2ZnLF8qpSVBsaOQB0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56343-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.965];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 58A8E2CD1D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 10:11=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
> VFE lite hardware does not provide a functional PIX path, but after
> the per sub-device type resource changes the PIX subdev name is still
> assigned unconditionally.
>
> Only assign the PIX subdev name on non-lite VFE variants to avoid
> exposing a misleading device name.
>
> Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type resourc=
es")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f916736f1=
d1664767bdb6a36 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_device *vf=
e,
>                 v4l2_subdev_init(sd, &vfe_v4l2_ops);
>                 sd->internal_ops =3D &vfe_v4l2_internal_ops;
>                 sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> -               if (i =3D=3D VFE_LINE_PIX)
> +               if (i =3D=3D VFE_LINE_PIX && vfe->res->is_lite =3D=3D fal=
se)
>                         snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d_%s=
",
>                                  MSM_VFE_NAME, vfe->id, "pix");

So the PIX path will be called RDI? Doesn=E2=80=99t that seem misleading as=
 well?

>                 else
>
> ---
> base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
> change-id: 20260319-camss_fix-506ae164a5dc
>
> Best regards,
> --
> Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>
>

