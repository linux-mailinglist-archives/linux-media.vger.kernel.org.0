Return-Path: <linux-media+bounces-56889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L2OBtS2wmlilAQAu9opvQ
	(envelope-from <linux-media+bounces-56889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:07:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E24318B4E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0790230A41D3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 15:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B32E38C2BF;
	Tue, 24 Mar 2026 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cySCBaT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmIXZAZ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AF38AC75
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367886; cv=pass; b=epiOUiRvDLRjh37HyzBDxeKYIEqBwNegusVDHxx6JoaKpyiZ0rj/ANF3oJzUTVsYUhvtXMhKL+wkuKPiUEdEXHQBX03mERtVexshos5k649XG/lSPy9vqP+BE+nHX6/qVU3huRDT5kWoRyxlcezjZAYn6CrVqdRMmZvBbv+WMKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367886; c=relaxed/simple;
	bh=U7DMFwg+q2iJjApPB0UHhcc+bNMMjYSNE1WuG+detXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KE32z4ncnl7r1W9rqpgfQK+C3QMZa8F2c9CBcd627SvJ5fOFR7tX7nJxgLRThg97Qp/7Lw6I075akrcAi1FwsKpngAZD355gSYyxbTSVDAGi/bxCW+9RGCzlUWJeMt4/q07wZSBJzWGQES7q2IRj3Kq1daIrRP88WPG5BQUNEU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cySCBaT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmIXZAZ/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OFmf533903834
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 15:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=; b=cySCBaT/y2OuNHrX
	DkTABeKgFJMbEng+rFRYUXROiAxqfKXnKkmITqfqE332GOKySzw0tOfQQnf9kLbP
	Be+o4um/oujWLcHcuGPHDkqTFpJW1PhDXquyWyFvuJlD/WdmHDLDU5E82ItL3/lN
	qhT8as0JmdZyyltpcyfeINr2FrFDQLCxQmPCAyMy7QKBztVkUF1YsBzyrXBp9PlS
	Je4Jh7uZufVsGQ+DUOeZcFz4ywnIBKfqydBMRhOtfta3O9fCZ+5ZFzcen5xT/KXx
	5hlkMb6HsWer6xgBozy+DDiaZWCzzaJ1DnjauxgRLpkHRYiE1g5K9piV+fYZAGYg
	HRst1A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0jqrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 15:58:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954803bd74so7215856d6.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 08:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367883; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3sjhAGl8biDGZlNTm6VvL9Lr2z9yuyqolUm5PP3rdTLExv1Ntzk4Nyqm48aIXoTeL
         fhO7WZhfy4Ww38o5wPrFYvzaMlfi9o90UGr/FnyoWY5AAtUjl0b/Y+ZqlXDxUN/PZuIh
         m34ht5GS4mR1QA9vB/Wbfu1dltscreiLGpOLvqJ9wXKazU7SxmV+iIMfOmxuxm6/xADT
         EXrBez9cyYBGXpUbjSv0JX4uFp2NXuEqNKfqcctPurLZrumyYXVtLMmo0YshUkUFXOsK
         NGaafNFi0OaViGB39pZh54xkI1IpiFCSr/+hSO6hKC82PPLOV3NLS9usTpRutw2jsFz6
         ByuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        fh=gv39W1Ypt8y15+q/qGrZMZJeqF1R0q6lTvBTNGoi+ss=;
        b=c8ZxgY8tdDUm6Q3kGrcmyRinf9EhYw5BzItuwsYjfuRFY9HO22+s8BlE+Z5w7zxwke
         Q12mLNjbBvS7XMqmg637j5I9FRToJfkRYP0VsFB8G0Os8Cx1uxD2LD9/RU+wk92n7rku
         nYByxMW9eyHlpUnY/pho7/w/GK6BySFQTn1RGYV65Ngc+V2QUGH5Hj7IWnM9agwkzqUY
         BqqVUtqf7Xs6VrFpMUPyIIAhIKgqE9pThrnG9t+r0jzVZuSgc+Cw2qKBeAZWTzFmCOqi
         e247WTZygBOkr9vnmhGPc3LXQY8d0XjuhJxCocYbKLRzatNb+5yQtItIhW7zC7kvvAkS
         8Cyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774367883; x=1774972683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        b=AmIXZAZ/D21yR3LUKf6hLOhKzqWXl6tR2ijkPFfAcW/ijsxR5HctPo+/XBCrK2YxkR
         nwWmEw7BU9t0yUfPeqmILfNR2yeFhZq6q+SEWqRFkTh9nx03cXIQ0KQEJJiX+qerRYa4
         5NzLn7nIUT5ERZP0EksUbptYf0H+CyabCQzfRmJgp0EjHD/54HJV/p3q/SxcY9nniAFV
         z9rC1kG2VDAadZYu/eglDZ79s5u6dPYQGCmxqVm7jxcgFn+RB08DbeP0zx2wK3/RuASz
         nQc5FlhHSP6KncqUDU7uT5rVzvvagIJpVCfmwXzA1Nk31TcbvDx0Fw29XtR/f+9qC2GV
         ec1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367883; x=1774972683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        b=UCQbRwmSkLsDXR7OtU/VX8TmlndTini/JW9VUWT+jVCGds7IzQ4VWkhBkKHOIKvTm9
         9hO+1eRWnXfQkfyPAHw2xqUwhj7uU69EV+nUKYVpZQvmf0HX/la8rU6RzeO9daOKUW/p
         j5U0p7YGAULP232OXS3leYwkJ4DTnZmYpub2Ooq6v23k+h3lgxMhxmY6RR8FzyMCXkqW
         PuM/DRgW+zeOxY56rgyabt5HtTxgOaeIukGpFAXmnS/1V1cfHfHH/ZBG2vxBEE7Gp/aY
         i03inRqfoLxtZEO/+MORxvhPoPR0dsnHExUbXoT4pOHa4Z14qfTTasCC1nhRZaT2EDAZ
         RV1g==
X-Forwarded-Encrypted: i=1; AJvYcCXdVLGYSe8XO6yUbYEKwfZ33NAjqeA74BcJzbV8n2RDDK/784bZjgpUmWySiyK09pir493ho6qxzVVUAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfatpllqxszJ9Rccb4AUvO9RzVNdrCLkTHAWWJMgxRbKRbVbVn
	EaOMTpEIf0PviKzH9BWdfuJ5OgIzw/SaMTqlpVqxFQLaU8ui6q0Bf94ZYWbmoY6fPhsGZ+rnJo0
	AXoe6FlC5jF6zb/ccdTowWdUsx8+F4w26tc1aRjSyC5ONSoKefSOOoS0Q7uGA4FPfK8n+O43YmS
	PisHmoCBJRB0RSSKJMnHuHiWmPfpaZGhVxSwy9vDjo
X-Gm-Gg: ATEYQzzFN/mH9P2jdE58YjgBCed4Nuo05GahIZt+C9rBmnGO4cnhNbt/lSAWH4xNwuF
	awO0Rnse/Z50OEdqHMYR5kBrIG/tx2ZZEzGeUlrJb+ZSeWFdamkbQiOrM6Lyfs6Pm5wNzC9qLeh
	Bdzbw1n3T+SDRBAfXBMS0gD+cvd2c/4DjSPWL8YDsdXFhJOFJn84/NdXCuPgyegunASRSFJq2QH
	2n0WXm38ynyWF2VfrIhAxAbl8eTLCQzExGnsDo=
X-Received: by 2002:a05:6214:570d:b0:899:f5a4:8110 with SMTP id 6a1803df08f44-89cc4adc756mr1982356d6.56.1774367882637;
        Tue, 24 Mar 2026 08:58:02 -0700 (PDT)
X-Received: by 2002:a05:6214:570d:b0:899:f5a4:8110 with SMTP id
 6a1803df08f44-89cc4adc756mr1981856d6.56.1774367882087; Tue, 24 Mar 2026
 08:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com> <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com> <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
In-Reply-To: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:57:51 +0100
X-Gm-Features: AaiRm52QkkxQCqRqr-Jt62eDyvDcyXaIOYwIWRquF6V_Pbmf84Rb_fN-zDuHgQA
Message-ID: <CAFEp6-0qb4SUrNZ03+EsEj6qAynH2RL+AQG6F1F8K0ceX3JpUg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: IKf1APEf_YfxffG3aw1_JNgWVNhpsJH6
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2b48b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=lx2B71hQoDIPyAvjx6AA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: IKf1APEf_YfxffG3aw1_JNgWVNhpsJH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMyBTYWx0ZWRfXyIwfe0JvP3QL
 JKigUXKFSaLilHuymTDJpIJX63e8HR4oU87Jm+uU7h647V5i2z3FTIESEtsQ1e/N+RHQLUZApAy
 /THuRs4k7SeJ/tHmq8CctFhc5XIoA6S6S/jmbJu07ihi7BKUGkOMq7Yv87V9YyUCw7ifNI06wLR
 MLjLlcwQoA4tqUNIE2OJJD0QFb0Yn0z5Qj6dPjFO9A7HRWrBc//Tvos7Yg2vwN9F96mKVUXv57p
 ekQjwNd4LL3t/NQH5f+j5WV9poCBfS+libpBO0RcOiZJpdX8F6IounwetcXz7Hc6RNKZWxZm9y6
 eLPiDOa1uxWdHCC+2BpzRbfRqBojW0hxTRrXIRF5YmnvhnN3hL3nUkjlqbCdBXWsG1QmKWVIPyW
 rHavGcpZma5x0FGhzpwYvpJm6wSIta+5BaHmDZUCuXWNEXfr4Qnonc/1wWQB0NOdtMQcqT/pyph
 5OlMwytoqPHJek2iMGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240123
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56889-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 83E24318B4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Tue, Mar 24, 2026 at 12:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 23/03/2026 15:31, Loic Poulain wrote:
> >>> +
> >>> +static void ope_prog_bayer2rgb(struct ope_dev *ope)
> >>> +{
> >>> +     /* Fixed Settings */
> >>> +     ope_write_pp(ope, 0x860, 0x4001);
> >>> +     ope_write_pp(ope, 0x868, 128);
> >>> +     ope_write_pp(ope, 0x86c, 128 << 20);
> >>> +     ope_write_pp(ope, 0x870, 102);
> >> What are the magic numbers about ? Please define bit-fields and offset=
s.
> > There are some registers I can't disclose today, which have to be
> > configured with working values,
> > Similarly to some sensor configuration in media/i2c.
>
> Not really the same thing, all of the offsets in upstream CAMSS and its
> CLC are documented. Sensor values are typically upstreamed by people who
> don't control the documentation, that is not the case with Qcom
> submitting this code upstream now.
>
> Are you guys doing an upstream implementation or not ?

Yes, but some configuration will be static and non-parametrable, I
will check if we can at least document the layout.

>
> >> Parameters passed in from user-space/libcamera and then translated to
> >> registers etc.
> > The above fixed settings will not be part of the initial parameters.
> >
> >>> +}
> >>> +
> >>> +static void ope_prog_wb(struct ope_dev *ope)
> >>> +{
> >>> +     /* Default white balance config */
> >>> +     u32 g_gain =3D OPE_WB(1, 1);
> >>> +     u32 b_gain =3D OPE_WB(3, 2);
> >>> +     u32 r_gain =3D OPE_WB(3, 2);
> >>> +
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(0), g_gain);
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(1), b_gain);
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(2), r_gain);
> >>> +
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_MODULE_CFG, OPE_PP_CLC_WB_=
GAIN_MODULE_CFG_EN);
> >>> +}
> >> Fixed gains will have to come from real data.
> > These gains will indeed need to be configurable, most likely via ISP
> > parameters, here, they have been adjusted based on colorbar test
> > pattern from imx219 sensors but also tested with real capture.
> >
> >>> +
> >>> +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *=
stripe)
> >>> +{
> >>> +     struct ope_dev *ope =3D ctx->ope;
> >>> +     int i;
> >>> +
> >>> +     dev_dbg(ope->dev, "Context %p - Programming S%u\n", ctx, ope_st=
ripe_index(ctx, stripe));
> >>> +
> >>> +     /* Fetch Engine */
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0, stripe->src=
.format);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE,
> >>> +                  (stripe->src.width << 16) + stripe->src.height);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_ADDR_IMAGE, stripe->src.a=
ddr);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.st=
ride);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CCIF_META_DATA,
> >>> +                  FIELD_PREP(OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN=
, stripe->src.pattern));
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CORE_CFG, OPE_BUS_RD_CLIE=
NT_0_CORE_CFG_EN);
> >>> +
> >>> +     /* Write Engines */
> >>> +     for (i =3D 0; i < OPE_WR_CLIENT_MAX; i++) {
> >>> +             if (!stripe->dst[i].enabled) {
> >>> +                     ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i), 0);
> >>> +                     continue;
> >>> +             }
> >>> +
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i), stri=
pe->dst[i].addr);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
> >>> +                          (stripe->dst[i].height << 16) + stripe->ds=
t[i].width);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_1(i), str=
ipe->dst[i].x_init);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_2(i), str=
ipe->dst[i].stride);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_PACKER_CFG(i), stri=
pe->dst[i].format);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i),
> >>> +                          OPE_BUS_WR_CLIENT_CFG_EN + OPE_BUS_WR_CLIE=
NT_CFG_AUTORECOVER);
> >>> +     }
> >>> +
> >>> +     /* Downscalers */
> >>> +     for (i =3D 0; i < OPE_DS_MAX; i++) {
> >>> +             struct ope_dsc_config *dsc =3D &stripe->dsc[i];
> >>> +             u32 base =3D ope_ds_base[i];
> >>> +             u32 cfg =3D 0;
> >>> +
> >>> +             if (dsc->input_width !=3D dsc->output_width) {
> >>> +                     dsc->phase_step_h |=3D DS_RESOLUTION(dsc->input=
_width,
> >>> +                                                        dsc->output_=
width) << 30;
> >>> +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE=
_EN;
> >>> +             }
> >>> +
> >>> +             if (dsc->input_height !=3D dsc->output_height) {
> >>> +                     dsc->phase_step_v |=3D DS_RESOLUTION(dsc->input=
_height,
> >>> +                                                        dsc->output_=
height) << 30;
> >>> +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE=
_EN;
> >>> +             }
> >>> +
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(base),=
 cfg);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE=
_CFG(base),
> >>> +                          ((dsc->input_width - 1) << 16) + dsc->inpu=
t_height - 1);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(b=
ase), dsc->phase_step_h);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(b=
ase), dsc->phase_step_v);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_CFG(base),
> >>> +                          cfg ? OPE_PP_CLC_DOWNSCALE_MN_CFG_EN : 0);
> >>> +     }
> >>> +}
> >> So - this is where the CDM should be used - so that you don't have to =
do
> >> all of these MMIO writes inside of your ISR.
> > Indeed, and that also the reason stripes are computed ahead of time,
> > so that they can be further 'queued' in a CDM.
> >
> >> Is that and additional step after the RFC ?
> > The current implementation (without CDM) already provides good results
> > and performance, so CDM can be viewed as a future enhancement.
>
> That's true but then the number of MMIO writes per ISR is pretty small
> right now. You have about 50 writes here.

Right, it will increase significantly. The idea was to start with a
version that omits CDM so that we can focus on the other functional
aspects of the ISP for now.

>
> > As far as I understand, CDM could also be implemented in a generic way
> > within CAMSS, since other CAMSS blocks make use of CDM as well.
> > This is something we should discuss further.
> My concern is even conservatively if each module adds another 10 ?
> writes by the time we get to denoising, sharpening, lens shade
> correction, those writes could easily look more like 100.
>
> What user-space should submit is well documented data-structures which
> then get translated into CDM buffers by the OPE and IFE for the various
> bits of the pipeline.

Yes it will.

Regards,
Loic

