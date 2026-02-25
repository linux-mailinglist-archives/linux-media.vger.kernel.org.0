Return-Path: <linux-media+bounces-53336-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDLLHb31nmm+YAQAu9opvQ
	(envelope-from <linux-media+bounces-53336-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:14:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E37197D60
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE9DA303748B
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976CF3B8D62;
	Wed, 25 Feb 2026 13:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yc4lj+JQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUSozRqO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9EE395260
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025274; cv=pass; b=Zzj9jMBaTVuX6wsYwZ6kC8dtSwVNpJYlBB1EovVNBca/U+4bNLaS+CRD63gKLNMJv4lYcHRdr6W0vxp0fUaLNIiczRzzqdgfTRmypS0uFN7byGUwXSEOaUd19j7W8WGCmqtSZfSqy5jqdKMfE7J5+n9F523kGDBBpOdpgIUeNIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025274; c=relaxed/simple;
	bh=+qviHdb07M4mtHNBrhgkoP1n6UONaBKP/ll5Yk8B9RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQlDG9eD5Yy+R+Xt1YafSMoOXxwyAKtJ1gUcdJJZnQRsrY0uBm272ICx1Vai0GHvHrELubd9Vtil497pWuQnq1FXR9TKWYf6BPdGrNFCMFs2HkpvPwmDpTzik47wCvzOiiYde3Q+JoVvjI8x5GhTt7VShpXeEPQFLY1u2RKT6yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yc4lj+JQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUSozRqO; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TBqn1579537
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KvE8Bg/evvBL9i3NCQAx1c6zSUwCnnNfrq0v1Ge6Xs=; b=Yc4lj+JQ5f0a4dsD
	ThBMmt8BwcpjezZlbGrm2CcZYDrSJNjj489wQpW9aibjkbXLp2JTf4xL11C91s6t
	fAygR0CwpopC15KcBtAyQGJQM4gRJPcQcAMR8W/5NvkonPw72pyEdpHvZU0YlWXJ
	bDajiFkB01DMfWGgz8qheYpWzEyCZj75OZe+XOy23SU79rTrL44znQGBfr9CL1RW
	92CYVOT5BJn8bKDh5b9/VwoKhaTeN8A2usz6gPqNIE8QpLLNv1p6C4bJy172pGVi
	iZLwFTUKT+iSL96Mca5KuAvYzWsBYNaI5wogXD/v6Be366G5b/As029R0+e5VfJS
	7xg9Ow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sba9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:14:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954803bd74so72689246d6.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 05:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772025271; cv=none;
        d=google.com; s=arc-20240605;
        b=M2MD+8vKJpcD0YiECnUIk0PSG99gXNCBqG9iWrs3swrtUgRNUMHvHnTEO0mvMNiNXF
         JsNTMvOeUzWoI1et56eow/K43vS9WVUwLUIZAUvx2jYg/64qAZY5IOiTc0eiblEYUXmE
         rHqAo/YYJ4dPTENc9532AuIMg84SMLgTibiMgl2FmRptLP+zL9GzkhpAfwdRf2EuQVC1
         xfrb2d7wLYaoah/ZZyxteV6Fj0i90Wm7mO2PGyeWO4VDUlm0rdO2Xu2Ce5KoiQi0KEbO
         22HstL0q1eBdiprjSnBPl2bmfR8hOZEAOTcfQhF9VUSHmDFKDW15tpkmOIbdATTbnquo
         JUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3KvE8Bg/evvBL9i3NCQAx1c6zSUwCnnNfrq0v1Ge6Xs=;
        fh=R59CTehLRv/YRztCu/0jd5nC+EeM9jHK5mSul7Eumgs=;
        b=F9r8046i4pkLGXp9YIOAf4mIMZo+dVEY0vOIl0wUXEDc7Zd14Kpxwdll6te4wPbYhE
         iX11YoKnZbgTrRY8C5iu+AqHo7R+vhCCQI99H1YsZCZtzTS4pebeRYGcWqA3YdZKWiPw
         OyS7fzWTjsahFHF6CoF/Q5NlMXft7BDXKuxCOfRFKH3idEfza2sqg8FO0nKGHmxJt2RX
         10gQ/Uhdoq8vxnX7P2JlFVo4oEwVUL5yQvAviWuabFbCtru6ZAiRUFBVqXqgp8w3CRLX
         jlzv5dA7BZo7mi5qpL361I53RhbEjFpRaCQGjSQMccZHDMMt8UwhazYlQK2nlOCtQaT/
         PUXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772025271; x=1772630071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KvE8Bg/evvBL9i3NCQAx1c6zSUwCnnNfrq0v1Ge6Xs=;
        b=gUSozRqO9/FOI6QKxiQPF/ZbIGZkZky7Sm/GhhOfnXkLqf1ZPvasC1Z3O80ZshYCbb
         Vab1hsENxoam49thrIrUb2NHMH3iIN+25YV+p3H82QSvc/A1m1pQChg4Tlz7pQB/H59R
         si31lpzlXVh6S3VU6NgfoeJx+SW/2daLpfHlZYIiCiyXlxjlZuiU8eBX7R56uWInqzds
         XA+htGHLAU2zSJx1/tSaxRQrGAK29nLgR0+2mZgyk4hY+39BZvKOP671L1ETrt3+nk8q
         IMIK0xsQlA+dMbZCeTsbFawCahO0lUnN4reb+sVG7iYDBGxyPQraPXOpw4IP5+/GMOY+
         4l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772025271; x=1772630071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3KvE8Bg/evvBL9i3NCQAx1c6zSUwCnnNfrq0v1Ge6Xs=;
        b=mCNBzjmoMHUsGwqIX2mk/h+WJCWCkVn8AZ4+cHVwUOjl3074nb1cJUMLIGRS1mPsxA
         qw4wBMd3FPJOka9JDOV/ZzWvrEWHkqQ4Uc6ETNMyiiyY0DJkC/MSxEcHJ7xDQHSTcJtU
         SzmKolCzRZPSiMZrVvUgzvZO1MTjlMs58yBtrEzq5m95JZXbH985vrOj7gxdWsQHhjlt
         0ktSThy7ZnpoBkNp3pQVktf3YnRFYu3c+bnSsFy89Jn9SgCJTkU6j2byUf4WbrMDa8Hm
         IRhw2rrY3dh5hGzLf4UAojaKeRMM3G2gpQXKDUr84oVookyw0JV3bQXxTdB6ormKj+I/
         sk8g==
X-Forwarded-Encrypted: i=1; AJvYcCUjrEq3G3Rj4WgGsH2AXtc1d6MvDIxrluk0kByAF8ztTAY3PBbwZCU/s7x4/5m3ZGrB4P/OO+g+kJ/4pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrTQh/O1PrQK+v95Y8XCaW8ApEGP+9A4TBiyDfigvffVx6YYcB
	xcF1P3OvyzEbbK9K7ZwNbNOx+8dzEaupRCI06Sndv6xsy+JcvNdnxlLE3TyGyhCNRS5Lm57RgmS
	1MgJYxA3zHF4ZhEKrePseD3tJ7hVSAXn/+yCdggH4Un5FZKGaiIpVslgfqNZ2vX9xEGcKLtFY2L
	mmaQi1flITnFbJ55UKjIX3bQB9kMVTnoLJsnko+R6J
X-Gm-Gg: ATEYQzzPuZiptQCuMfPTcuaGNKSL9rLD97FauhwvGpSR/AFCigMGOn0KVa99uWiW/gA
	FHYb6xiCxnW9ichLz1WbdJZWK4asRwEePi15+IvDElf1W4hSq4Wdm0Kv9HGXxJO7ELwyba6BBD1
	KKBz7SYDukDHZMuwr+7FyYspSu5y7FAbLlmIlZbv1f3phZDob6Tdpc1pwqPIIFd7dnszRcvLQCZ
	Y7gOb7HN0M791cgEpZr3nzMxJLVQLWF25Ot/HAB
X-Received: by 2002:ad4:5d4d:0:b0:895:4b4f:1336 with SMTP id 6a1803df08f44-89979c3c1f7mr239806246d6.7.1772025271085;
        Wed, 25 Feb 2026 05:14:31 -0800 (PST)
X-Received: by 2002:ad4:5d4d:0:b0:895:4b4f:1336 with SMTP id
 6a1803df08f44-89979c3c1f7mr239805496d6.7.1772025270302; Wed, 25 Feb 2026
 05:14:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-4-loic.poulain@oss.qualcomm.com> <01804171-a9f2-4509-afed-d222c5d06251@oss.qualcomm.com>
 <CAFEp6-0+RKYLJ9pGzP1f9rbHNFNG+cXhwCr+=fwDAghrbB5Bjg@mail.gmail.com> <df0c6c3b-3276-4d62-9dd5-fe3e3ab629bc@oss.qualcomm.com>
In-Reply-To: <df0c6c3b-3276-4d62-9dd5-fe3e3ab629bc@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 14:14:19 +0100
X-Gm-Features: AaiRm53b9PGcCD2Kdc3KdbmnKCkYaj3hYb-vmRX_zlMvsObVbhkVTtRHd8kftUs
Message-ID: <CAFEp6-2HEgo3svA0ZbjTtHfwkA7e8gnHjv-mSSkRnr04_ruxbw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699ef5b8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=bjniAC1MMXGDCCfuQK0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ig8oEpjDrV8sVwDXexTY7GyeQ9xafeb3
X-Proofpoint-ORIG-GUID: ig8oEpjDrV8sVwDXexTY7GyeQ9xafeb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyOCBTYWx0ZWRfXyRz7fKvLhS02
 GSN18QAUcF06PL0eQ9Wj1W6t1WGeg3OL7WTNaOzQgEI3TgRgoaqwliSivrMXAQW2+ULmv2zqY+0
 KIayDVp+SLab95HXL65l3DSX6LJoWhmAOUq/PcOEJSPRfb4ebjKcVTVB+NmGQoPlcbXK82PowDY
 TdhWKu/wXoWvOACykhr5plXGmN47m2cvtyIWl7Jgc5twz/bIBbcPfrjjjU6rLoQeXOYq1q72TbQ
 Ll1cEfPiflGZpWxRkI1B80epOmtNUsLW9sxlktzQX9dCKmyinsjK7vtohX3ryyHS8t9pgMWge9H
 HKsIIQNyhgNVBm+BcZ3lDi8LKMmj7j3Zo1+JsiTQsJCrXLOFFVlE15STjfw8I4NOwsLTNQB1Vy+
 QKxBWFF450supvLsoUaKatRmp3WpFoXxhu9J8JJzUCECcWJMnq1T0rodT6MMHQWJKWoLrzavqHy
 hQAAZt2QxHMCbHLovgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53336-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: E1E37197D60
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 2:23=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/23/26 3:46 PM, Loic Poulain wrote:
> > Hi Konrad,
> >
> > On Thu, Feb 19, 2026 at 4:46=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 2/19/26 4:27 PM, Loic Poulain wrote:
> >>> Add support for VFE PIX write engine, allowing to capture frames
> >>> via the PIX video device (e.g. msm_vfe0_pix).
> >>>
> >>> Tested on Agatti/Arduino-Uno-Q with:
> >>> media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_c=
sid0":4->"msm_vfe0_pix":0[1]'
> >>> media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x4=
80 field:none]'
> >>> media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480=
 field:none]'
> >>> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 f=
ield:none]'
> >>> media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 f=
ield:none]'
> >>> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x4=
80 field:none]'
> >>> media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x48=
0 field:none]'
> >>> yavta -B capture-mplane --capture=3D30 -n 3 -f SRGGB10P -s 640x480 /d=
ev/video3
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +     if (client =3D=3D TFE_CLI_BAYER) { /* PIX */
> >>> +             writel_relaxed(pix->width + (pix->height << 16),
> >>> +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client))=
;
> >>> +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(clie=
nt));
> >>> +             writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(=
client));
> >>> +             writel_relaxed(stride * pix->height, vfe->base + TFE_BU=
S_FRAME_INCR(client));
> >>> +             writel_relaxed(vfe_packer_format(vfe, pix->pixelformat)=
,
> >>> +                            vfe->base + TFE_BUS_PACKER_CFG(client));
> >>> +     } else { /* RDI */
> >>> +             writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
> >>> +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client))=
;
> >>> +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(clie=
nt));
> >>
> >> Were these default settings (prebumably "dont care" or "always max") v=
alid
> >> for RDI? Would the ones you set up for PIX work/make more sense indisc=
rimately?
> >
> > That's a good question, the configuration above is the typical setup
> > used for RDI paths, and it matches what other drivers generally do...
> > The RDI path traditionally uses very loose or =E2=80=9Cdon=E2=80=99t ca=
re=E2=80=9D format
> > settings, and simply 'raw' dumps everything between the CSI Frame
> > Start and Frame End packets as an opaque byte sequence.
> > On the PIX path, however, we expect at least some level of processing
> > (even minimal), such as cropping, plus later statistics... For that,
> > we need a 'description' of the frame format.
> >
> > So theoretically we could describe the frame more precisely for RDI as
> > well, but that would diverge from what existing drivers typically do,
> > and the benefit is limited since RDI does not really consume most of
> > that information.
> > Also, I think we may end up dumping content that has no line
> > delimiters at all via RDI, such as sensor=E2=80=91generated metadata bl=
ocks
> > that don=E2=80=99t follow the usual LS/LE framing.
>
> That sounds convincing. Would such data be the hw-design-intended usecase
> for RDI (with the pixel data going through the full pipeline), or is that
> just a possibility you're mentioning?

I=E2=80=99m not sure this is a dedicated design goal rather than a natural
consequence of how RDI operates. RDI is intended for raw pixel capture
with no processing, and because it doesn=E2=80=99t enforce line=E2=80=91bas=
ed
semantics or interpret the incoming payload, it inherently tolerates
arbitrary CSI streams.
It=E2=80=99s also the interface to use when the sensor includes an on=E2=80=
=91sensor
ISP and outputs non=E2=80=91Bayer formats such as YUV.

Regards,
Loic

