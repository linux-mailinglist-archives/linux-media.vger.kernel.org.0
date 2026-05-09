Return-Path: <linux-media+bounces-60995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLWEFhdF/2mo4AAAu9opvQ
	(envelope-from <linux-media+bounces-60995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 16:30:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A05000AB
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 16:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F6FC30157FA
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 14:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8F539658D;
	Sat,  9 May 2026 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pOpzOajY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aA/lnsBh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34B138911F
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337043; cv=pass; b=fT4NamhopSyV5e/PYIXWhv3hSeGhKp7g7OZy3hnI1m5z8ofoFwaIV+fKjACQ7nhnfidj9Ja0Qeevs0plLN0K97+OU6L881DUieZw+hHoPopXzSSMQHSJLkTx9vCbaF+F8kKiGT61HYHHL8AdrF52Ue8F9nWSU37IlXUH9TQU13I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337043; c=relaxed/simple;
	bh=qR4wL5XttJUg7TwW9yDaV59E/TQb0zyC4nYBUtxTJzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4UztmeVz0+WoJKRzTaBscJsmld97rkp6fFUzjSDGHBroGgcPqDsiUy62QPEPlnFp+3UrdL0H2IUXVfA0n3OBM5nyPPEWJJxeYUCccze5Z+LTwT+TGHjNXthENTFP3sF4v67G6vTpFdxnF3GoMw0pFFny3zGKoU/VDgCBWJT26s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pOpzOajY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aA/lnsBh; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6490Jnni1768118
	for <linux-media@vger.kernel.org>; Sat, 9 May 2026 14:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qLoc4zG4PaP8yM0Gui5KMUEYFN7xKuV0cNDCyxDDm54=; b=pOpzOajYONIpyxb/
	gDbQtFCP65EO8g3xaOlrDSUpyNO1neWO8LpGOhMLq/mE7YbzHEikwklEBMiDyjHG
	/bdxuvPTVM2khktnsTG5y5AJTzT4cvWAYSb0VBWtQBfGhsgMbRPZ1aUp9mjKLpRl
	MGy23rsUEa7uGz4CQbsYNaLD6aXyGM9HrEtGFu4Rp1/Yn74G9+W7R5RGHBSTPEJK
	u+3g+/dggGSlURzzvd7FTjoU0QCGC1wZXlVY7cZqiLHRxj9o8PJZv0kzHSwusxxo
	bSHu9YHzzaWHx0zamVMrlSb5uQuBwUVMX3FWdyHP0H3wpTWSpcayOT/XcJ/r79J7
	QUgWNQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q1e7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 May 2026 14:30:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b597b14a22so3378156d6.0
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 07:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778337040; cv=none;
        d=google.com; s=arc-20240605;
        b=GaSf3CeDsMOKCMHq7j0piaohKEMxO2sKgHy6DY0Y3T59XZU9rjZn1uLQnkTNH2uLz3
         HteEfbRq7hJkM9GIcDgEBAfU6ICzrfZf5rgqjEiDaxrwQeTTxRhu61MKGJrUHvttYtGo
         htWeTMhZ0ifgDfORvAz0zsVkoR1S/s50ydcWox//Y6zl+y8LXZEyER0XRWcCbkWjQPDP
         Xx3I4wYT+2zZCoEncXWXGW7CBlHCwZvuuVnX81iKJl+lt8JofU/ZY2slishu5ZQw9UWg
         J3FpMKqYyvd3MuOD8h9ZnU8x6galwiS/teZdBIx2TH3shhxBSrLIQBGLntGo1ao5Tpwv
         HCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qLoc4zG4PaP8yM0Gui5KMUEYFN7xKuV0cNDCyxDDm54=;
        fh=iaZrSRifsL6UwFkZtC9zDG92t6apvTCNbaJhPuKIodY=;
        b=RsmOGZVO1vuUEkLUGqbABGq9G8qaD8wIzPTLiMK9JlJowV7VV9eKYt6nBzpSMMQm0j
         XpAjhGLoDzwPFXzzNk1UlsCpMNNI62YTbU0L+zy4cnsCTbJikTJrAYWNU6T4ft9uzwHf
         v1wbSPlbZ38tSlgG4k9nLWpwdLkHB2qi698LdBQWmUgqaKRntXmBqgOgaFLipYS+sTJP
         gqa1mFjPt5ZjGsZdyuFtSbf6NDb/piU25b1Tf/X5kuGIBcO/jlSlSKbe5TVXBZs+jKw7
         r+8Gq2byZKORW93VudKZIQs5W5ODiXhlLcUfb6t1vRSlkf0CKy8kecREyxzOrzaCcz3N
         WzBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778337040; x=1778941840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLoc4zG4PaP8yM0Gui5KMUEYFN7xKuV0cNDCyxDDm54=;
        b=aA/lnsBh4mTID6HlUwGZLtdjVGE9OJTF8p2IsOQfA90ELCZg/ZUb0L9IvSviEmWeOd
         PqQuBEV02b74A4zzpAEeaVrMHSEJGPwFwxneICcXVFMcoFCVujrRt4mex36XQ/oK4c/s
         oOj/a9xxmnZPBToaJVz5S+UioQM6AI1l1pdnecsln1aISjl7dH8mxAN/137FAPAxAIKP
         iC/cYlzHIHu1dKOhL+hfj8ooqzoNRYF7F4rriCGuh348v/F7s4TLMfLLWwpsNwYggcs7
         xsqv6jwgTdG7CyBFFGTf0PO8HdxvsE+gNJ31bLdJEdwXXVdai2l4xkc6ChIn04oLPaW2
         ngIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778337040; x=1778941840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLoc4zG4PaP8yM0Gui5KMUEYFN7xKuV0cNDCyxDDm54=;
        b=bMegpjaEPa9NF0i3QPFtFDg/zIseG6Uey+6YqJ3iqfnn4hubM4l0im6i2Z2nDp664a
         oxucWVnXmmMNMhB3ikow9WASLNUpcc/cXU27Ob0cDoYTrPl4+yMfy8PbvbPCv6ZshJPa
         2jmf/EupVFLU8E8zsIY679Ef5f7JknaCN5i9JGdXWAyQf9GsT+4w7gVfaLLOsTD/1gKa
         3zNekgs35a90+9NPVqIfsFy4n3nFuiJBHixZHXjqoSJHv8n6lwPRC/s2B4+DHKPoDW74
         vMl+Qr64HDpqAlE8jygX5fi12rWwUPuu1htMC1vGeyYa1IXaop2lLg2SUspVbZVCaFcZ
         mJpw==
X-Forwarded-Encrypted: i=1; AFNElJ9XsV0vGpakazWGCnxEz11nxweDctZDqht0t9sn9EMMxE7neSLcNCMcrCGDWMSCky0zfN/nSLQseLtiIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlxYJTkV+urnemXiPh7+V/Z7hdXU3+A1R6uoW2fQbxFo3KIeb1
	/hqOacQhpmpo+inFzm+G5rJE2AKoUc3GWFFhQX4Ksx/n8O3i0rLc4KFRVsbDgbjN0T66x63FojP
	sd0PDBpYI/Fsqb9ZfN7nDLAsK+e8A4jIm8bvVkrPyByDpwJZ3a6X2yrxsxpN0BiXTi8pO6wMkQJ
	dYHxkAmoEMrUGPGfkqVRxUq6vpDZ7CathmaLFwcqyH
X-Gm-Gg: Acq92OHe6BKpKk4B5qNA3ejHMsUE1qlh9SXLneIbjcs8eV+frnzhvLfxOzhBGSHo5rg
	0MBxSYQeI2IJlIGdjHixEPo4IFNCqaIYq0Y5orC+hoxsxEyWjwbSdmF5eIb/0/quzLEf7hCPwp2
	pOTcer92rirMJZgpwWjb+WiusOZT0cIYkjXnfI6fP3ei3YhDxvdxB1z7/ltQYBZ/EhaYPS9PMqH
	mDIBPi5EkBGecqUHvOq+qEzFrxeWzdUz8xWco9P
X-Received: by 2002:a05:6214:ac6:b0:89c:cb57:6227 with SMTP id 6a1803df08f44-8bdb787ab26mr169124756d6.12.1778337039902;
        Sat, 09 May 2026 07:30:39 -0700 (PDT)
X-Received: by 2002:a05:6214:ac6:b0:89c:cb57:6227 with SMTP id
 6a1803df08f44-8bdb787ab26mr169123296d6.12.1778337039012; Sat, 09 May 2026
 07:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-4-bb1055274603@oss.qualcomm.com> <3c46545a-64e3-49f9-a2db-7de154e92daa@linaro.org>
In-Reply-To: <3c46545a-64e3-49f9-a2db-7de154e92daa@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 9 May 2026 16:30:27 +0200
X-Gm-Features: AVHnY4LaIxtaxRLQlsLTNzpoxqkLbKq5CQju--zUlyVSjph73J3Ssds_i3lIR7c
Message-ID: <CAFEp6-3z+DTU9E+RwKQYshe5KjbTxjkWWCsjgzAhnj=bf0usZQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] media: qcom: camss: Add camss-isp-bufq helper
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: QWgeA2mJ2tduqeiTo13QKOw5DiKyu0vw
X-Proofpoint-ORIG-GUID: QWgeA2mJ2tduqeiTo13QKOw5DiKyu0vw
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=69ff4510 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BQXfQ4Z-Cs0ksQ7NdlYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE1NiBTYWx0ZWRfXwzJrmxoMS0EN
 UIPkj+vnf9FP3TbnFF8Ncq9fry1IqIf+PRYvK1kidS3K1MzNbRDKbPf4s5jGhYhBSPDE1G8IS7a
 EWYXlVP3Dqr6ADBJYNwtQuGuC4h0gMUiVfIqj6Xj6duMVJ5aP84TeVW9DaZlsj5dasI/BEg+OuT
 7qRjR2RactqZpE8qWrKr8Bo3N4JeIKZqWLlavn9Ve7dI+MqMa79m1RErCYYScXkn5KofszRkWyb
 sNiUUj4LVdj7N0KHiRT3M0zi1bq70zWMuus62Lp3LWtrKVGMChvtsfCfqCMiNTlDOCznfcF52Q0
 6XUv8l2CgABoExOFYaMl419fERvrJl6K0OGSC+CYGh4K70QsgV40ZgZ1mJLiOKxiFKtdq5oCksH
 vLk+QUH3rricSVmRO+Y5FFE11u9C9SUaTBUi+4q+SagQ9S3Nmd1u/S4Xlndhp78dxhcybQ1e2ei
 wlXyrioJfNT7io5VZgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090156
X-Rspamd-Queue-Id: B96A05000AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60995-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Bryan,

On Fri, May 8, 2026 at 11:57=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 07/05/2026 23:49, Loic Poulain wrote:
> > Add a per-queue ready-buffer FIFO helper for CAMSS offline ISP drivers.
> > camss_isp_bufq provides N spinlock-protected FIFO lists of ready vb2
> > buffers, one per queue index. This can help multi-queues management
> > and synchronization in ISP context.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/Kconfig          |  14 +++
> >   drivers/media/platform/qcom/camss/Makefile         |   5 +
> >   drivers/media/platform/qcom/camss/camss-isp-bufq.c | 101 ++++++++++++=
+++++
> >   drivers/media/platform/qcom/camss/camss-isp-bufq.h | 122 ++++++++++++=
+++++++++
> >   4 files changed, 242 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/=
platform/qcom/camss/Kconfig
> > index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..d77482f3f5eadc65856806b=
9b237d65ea484f267 100644
> > --- a/drivers/media/platform/qcom/camss/Kconfig
> > +++ b/drivers/media/platform/qcom/camss/Kconfig
> > @@ -7,3 +7,17 @@ config VIDEO_QCOM_CAMSS
> >       select VIDEO_V4L2_SUBDEV_API
> >       select VIDEOBUF2_DMA_SG
> >       select V4L2_FWNODE
> > +
> > +config VIDEO_QCOM_CAMSS_ISP
>
> I think this config option should be dropped entirely.
>
> > +     tristate "Qualcomm CAMSS ISP common helpers"
> > +     depends on VIDEO_DEV
> > +     depends on MEDIA_CONTROLLER
> > +     select V4L2_ISP
> > +     select VIDEOBUF2_CORE
> > +     help
> > +       Common helper library for Qualcomm CAMSS offline ISP drivers.
> > +       Provides buffer queue management, job scheduling, MC pipeline
> > +       topology builder, and ISP parameter buffer parsing.
> > +
> > +       This module is selected automatically by drivers that need it.
> > +
> > diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media=
/platform/qcom/camss/Makefile
> > index 5e349b4915130c71dbff90e73102e46dfede1520..bfc05db0eada1d801839ceb=
8a3b157baae613053 100644
> > --- a/drivers/media/platform/qcom/camss/Makefile
> > +++ b/drivers/media/platform/qcom/camss/Makefile
> > @@ -29,3 +29,8 @@ qcom-camss-objs +=3D \
> >               camss-format.o \
> >
> >   obj-$(CONFIG_VIDEO_QCOM_CAMSS) +=3D qcom-camss.o
> > +
> > +qcom-camss-isp-objs :=3D camss-isp-bufq.o
> > +
> > +obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) +=3D qcom-camss-isp.o
> > +
> > diff --git a/drivers/media/platform/qcom/camss/camss-isp-bufq.c b/drive=
rs/media/platform/qcom/camss/camss-isp-bufq.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b1dcf60afcc63d112eee7bd=
143f08a7b4aac9a18
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.c
> > @@ -0,0 +1,101 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * camss-isp-bufq.c
> > + *
> > + * CAMSS ISP per-queue ready-buffer FIFO.
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +
> > +#include "camss-isp-bufq.h"
> > +
> > +struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues)
> > +{
> > +     struct camss_isp_bufq *bufq;
> > +     unsigned int i;
> > +
> > +     bufq =3D kzalloc(struct_size(bufq, entries, num_queues), GFP_KERN=
EL);
> > +     if (!bufq)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     bufq->num_queues =3D num_queues;
> > +
> > +     for (i =3D 0; i < num_queues; i++) {
> > +             INIT_LIST_HEAD(&bufq->entries[i].rdy_queue);
> > +             spin_lock_init(&bufq->entries[i].rdy_spinlock);
> > +     }
> > +
> > +     return bufq;
> > +}
> > +EXPORT_SYMBOL_GPL(camss_isp_bufq_init);
> > +
> > +void camss_isp_bufq_release(struct camss_isp_bufq *bufq)
> > +{
> > +     kfree(bufq);
> > +}
> > +EXPORT_SYMBOL_GPL(camss_isp_bufq_release);
> > +
> > +void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int qu=
eue_idx,
> > +                       struct vb2_v4l2_buffer *vbuf)
> > +{
> > +     struct camss_isp_buf *buf =3D
> > +             container_of(vbuf, struct camss_isp_buf, vb);
> > +     struct camss_isp_bufq_entry *entry =3D &bufq->entries[queue_idx];
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&entry->rdy_spinlock, flags);
> > +     list_add_tail(&buf->list, &entry->rdy_queue);
> > +     entry->num_rdy++;
> > +     spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
> > +}
> > +EXPORT_SYMBOL_GPL(camss_isp_bufq_queue);
> > +
> > +struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *buf=
q, unsigned int queue_idx)
> > +{
> > +     struct camss_isp_bufq_entry *entry =3D &bufq->entries[queue_idx];
> > +     struct camss_isp_buf *buf;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&entry->rdy_spinlock, flags);
> > +     buf =3D list_first_entry_or_null(&entry->rdy_queue,
> > +                                    struct camss_isp_buf, list);
> > +     spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
> > +
> > +     return buf ? &buf->vb : NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(camss_isp_bufq_next);
> > +
> > +struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *b=
ufq, unsigned int queue_idx)
> > +{
> > +     struct camss_isp_bufq_entry *entry =3D &bufq->entries[queue_idx];
> > +     struct camss_isp_buf *buf;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&entry->rdy_spinlock, flags);
> > +     buf =3D list_first_entry_or_null(&entry->rdy_queue,
> > +                                    struct camss_isp_buf, list);
> > +     if (buf) {
> > +             list_del(&buf->list);
> > +             entry->num_rdy--;
> > +     }
> > +     spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
> > +
> > +     return buf ? &buf->vb : NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(camss_isp_bufq_remove);
> > +
> > +void camss_isp_bufq_drain(struct camss_isp_bufq *bufq, unsigned int qu=
eue_idx,
> > +                       enum vb2_buffer_state state)
> > +{
> > +     struct vb2_v4l2_buffer *vbuf;
> > +
> > +     while ((vbuf =3D camss_isp_bufq_remove(bufq, queue_idx)))
> > +             camss_isp_buf_done(vbuf, state);
> > +}
> > +EXPORT_SYMBOL_GPL(camss_isp_bufq_drain);
> > +
> > +MODULE_DESCRIPTION("CAMSS ISP per-queue ready-buffer FIFO");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/media/platform/qcom/camss/camss-isp-bufq.h b/drive=
rs/media/platform/qcom/camss/camss-isp-bufq.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1a8bc7b112a1b039233cfc7=
be573f1f40fcda7c9
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.h
> > @@ -0,0 +1,122 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * camss-isp-bufq.h
> > + *
> > + * CAMSS ISP per-queue ready-buffer FIFO.
> > + *
> > + * Provides N spinlock-protected FIFO lists of ready vb2 buffers, one =
per
> > + * queue index.  Drivers call these helpers from their vb2 ops and job
> > + * completion paths.
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef CAMSS_ISP_BUFQ_H
> > +#define CAMSS_ISP_BUFQ_H
> > +
> > +#include <linux/list.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> > +#include <media/videobuf2-v4l2.h>
> > +
> > +/**
> > + * struct camss_isp_buf - vb2 buffer wrapper
> > + *
> > + * Use as vb2_queue.buf_struct_size so buffers can be placed on the
> > + * ready lists managed by camss_isp_bufq.
> > + *
> > + * @vb:   The vb2 V4L2 buffer =E2=80=94 must be first.
> > + * @list: Entry in the per-queue ready list.
> > + */
> > +struct camss_isp_buf {
> > +     struct vb2_v4l2_buffer  vb;     /* must be first */
> > +     struct list_head        list;
> > +};
> > +
> > +/**
> > + * struct camss_isp_bufq_entry - per-queue ready-buffer state (opaque)
> > + */
> > +struct camss_isp_bufq_entry {
> > +     struct list_head        rdy_queue;
> > +     spinlock_t              rdy_spinlock;
> > +     u32                     num_rdy;
> > +};
> > +
> > +/**
> > + * struct camss_isp_bufq - multi-queue ready-buffer state
> > + *
> > + * Allocate with camss_isp_bufq_init(), free with camss_isp_bufq_relea=
se().
> > + *
> > + * @num_queues: Number of entries in @entries.
> > + * @entries:    Per-queue state; flexible array.
> > + */
> > +struct camss_isp_bufq {
> > +     unsigned int                    num_queues;
> > +     struct camss_isp_bufq_entry     entries[] __counted_by(num_queues=
);
> > +};
> > +
> > +/**
> > + * camss_isp_bufq_init() - allocate a multi-queue ready-buffer state
> > + * @num_queues: number of per-queue FIFO lists to create
> > + *
> > + * Returns a pointer to the new bufq or ERR_PTR on allocation failure.
> > + */
> > +struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues);
> > +
> > +/**
> > + * camss_isp_bufq_release() - free a bufq allocated with camss_isp_buf=
q_init()
> > + * @bufq: bufq to free
> > + */
> > +void camss_isp_bufq_release(struct camss_isp_bufq *bufq);
> > +
> > +/**
> > + * camss_isp_bufq_queue() - append a buffer to the ready list for @que=
ue_idx
> > + * @bufq:      target bufq
> > + * @queue_idx: queue index (must be < bufq->num_queues)
> > + * @vbuf:      buffer to enqueue; must be embedded in a &struct camss_=
isp_buf
> > + */
> > +void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int qu=
eue_idx,
> > +                        struct vb2_v4l2_buffer *vbuf);
> > +
> > +/**
> > + * camss_isp_bufq_next() - peek at the head of the ready list without =
removing
> > + * @bufq:      target bufq
> > + * @queue_idx: queue index
> > + *
> > + * Returns the head buffer or NULL if the list is empty.
> > + */
> > +struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *buf=
q,
> > +                                          unsigned int queue_idx);
> > +
> > +/**
> > + * camss_isp_bufq_remove() - dequeue and return the head of the ready =
list
> > + * @bufq:      target bufq
> > + * @queue_idx: queue index
> > + *
> > + * Returns the dequeued buffer or NULL if the list is empty.
> > + */
> > +struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *b=
ufq,
> > +                                            unsigned int queue_idx);
> > +
> > +/**
> > + * camss_isp_bufq_drain() - return all ready buffers with the given st=
ate
> > + * @bufq:      target bufq
> > + * @queue_idx: queue index
> > + * @state:     vb2 state to pass to vb2_buffer_done() for each buffer
> > + */
> > +void camss_isp_bufq_drain(struct camss_isp_bufq *bufq, unsigned int qu=
eue_idx,
> > +                        enum vb2_buffer_state state);
> > +
> > +static inline u32 camss_isp_bufq_num_ready(struct camss_isp_bufq *bufq=
,
> > +                                         unsigned int queue_idx)
> > +{
> > +     return bufq->entries[queue_idx].num_rdy;
> > +}
> > +
> > +static inline void camss_isp_buf_done(struct vb2_v4l2_buffer *vbuf,
> > +                                    enum vb2_buffer_state state)
> > +{
> > +     vb2_buffer_done(&vbuf->vb2_buf, state);
> > +}
> > +
> > +#endif /* CAMSS_ISP_BUFQ_H */
> >
>
> I honsestly don't think patches 4,5 and 6 are necessary and TBH they
> look at least partially generated to me.
>
> Several LLM patterns abound - em - dash and (parenthetical style) as an
> example.
>
> I just wonder is all of this code really necessary ? You could do all of
> this locking in the OPE itself and save ~200 LOC.

I'm inclined to agree there is no real added value in this change at
the moment, and that it can easily be handled within the OPE
code/structures. I=E2=80=99ll move it into OPE in the next version.

> I think in the previous cycle we discussed articulating some of these
> concepts in v4l2 itself - I think you could achieve what you want to do
> here with a struct list_head and a spinlock_t in the OPE driver context.

Yes, there are ongoing long-term discussions about improving framework
support for drivers requiring multi-context or job-based handling
(e.g., offline processing engines). Since these are longer-term
efforts, the current approach is to have OPE components such as job
handling, scheduling, and buffer management reasonably abstracted,
making it easier to transition to a generic V4L2/media solution when
it becomes available.

So I will (re)integrate this buf/q management in the OPE driver (4),
but can I have a second thought about 5 and 6? I agree they may not be
worth to be their own patches and modules but would it be ok to keep them
in separated files, creating a camss-offline/ or camss-ope/ directory in
camss in which I could have the OPE driver files (i.e  camss_ope.c,
camss_job.c and camss_pipeline.c), that would also allow a future
ICP/HFI based driver to be integrated and use the same components?

Regards,
Loic

