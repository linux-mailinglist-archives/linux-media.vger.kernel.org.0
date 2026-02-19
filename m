Return-Path: <linux-media+bounces-53111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIKmLVJpl2muyAIAu9opvQ
	(envelope-from <linux-media+bounces-53111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 20:49:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9631622BB
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 20:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B8513023D98
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 19:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FB13081CA;
	Thu, 19 Feb 2026 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltWN5MJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSlko3kJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7A82F28FC
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530568; cv=pass; b=Ev8/VFlo9ZGqJGqDXC1yPRAornnWyawU2PZYAf/FGZH2dQ8qyBE8IeAFj1RbdZCA0+zLf663iVnVOTPMHnwyYq0OnyQbZaLGEOnMgPA031ZNydn0wgdXr4mLraDzOEFPcNEUH4GgEMbsiiynA2RoHSaBaQSKuhooiQoHFBIIcB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530568; c=relaxed/simple;
	bh=AwoGFh2Iw8cbyGdRnHiBE9KOdgOh7luL+gKoJZOnlYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ddf5Mf2rTW68IrcJ1i8v+1UHKWSOxUP42iyoyJnhtpvVN6V/IbhCLjz6l6CD51Jber0IPXiH0YZ7Aux3tKPSu+Ke1IWjFAYesM3KTmyRbp0q1bZeGHlSmpkmMuVCksu6VonHy0Hx/iLWEeH+dFyXKok5FtX3faEIcIHy4JLJ5Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltWN5MJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSlko3kJ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCWlTN3077768
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 19:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgPv3nI6uopdJRB2V5KbCVW22bsi4dRg9pnCiXF9wUw=; b=ltWN5MJ1fFJq7xzp
	+ctiGSgKGLuMduthRamf+/gzUNhxeNaUCw8OPPvHaT9CD5WW1df+rIau8uuZCQt8
	vZ85LNsLltQPP24vpe4vN/i93DsFg57uGzIq2b2eDH4Krn/8SeY6lZOx1bX+7Kiq
	P9n7yoBJVvL5QQtUvEQAHSmqNkeu1QEDn6VkpOihrzqXqjptahj2FHI2cgw7ziNz
	CBELib8NZ1wDX32joWmdMPOfkOoq2Ip1z7Smc5c8TyaF+eKjArRML5AybLvrQNb+
	aV3pd6CgEFDJxnvUCh0TmYsdyonLEwo1p5+dsP71wPt9psfJCjRpp5DwuHa+JQT5
	mSN+DA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk82tx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 19:49:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896fe47cab0so20226866d6.3
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 11:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771530564; cv=none;
        d=google.com; s=arc-20240605;
        b=LPM2ws17ub0K/M79CUg5ccS7zJIkS+Uo9k0gHVNwhM32pzSjYcgNEFYoPt2LIZEwq2
         8giv87tz6afOGCsXeaIkTppFjhiFKqQEVRtWJQ62oTsiXya7691ezAYQXygWXhuC1BBq
         Tev4ny74CT4krZwmKcQ+3g+rOdQXQNOpZj028NZq9TeuSyo01c+LCYvI8SQyaG6fQ4+3
         87R4fCfp4BzgvJD81nhdKkDbXZygp7TDkk0wjb8sZVZ5ReKf9875QpOWmy9QLbcG+SC3
         D02oNzk+Re6N7F6kqfVjC8wJtwgP7E+ai3qd764tZGRqkg+C9ExDuXAjaFMVyPW5zwD9
         +GDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vgPv3nI6uopdJRB2V5KbCVW22bsi4dRg9pnCiXF9wUw=;
        fh=SjAJrdL7an5IoHIZwgR1IrikH6x1mreD1IRyzgxvLF8=;
        b=aqnYVjZA/fODdG/zR5/C3nme2+GtUOMFNH8xNICE6Mk4M8ur7vuTlVJ4Jd3Yu7mKGb
         8raHvgIXSsUv7AW3U/sg7IjIvcJ8eQ4NcL7JO4Pz+rdTGzBm/kgVT33HO1liXpm8wsP1
         jSDdh6fOufpPXzj/6CuMnkOBZSuYEsSOcK5CjCGz3F2frbq5dSD5zzDPVYPyRM3Mgm6l
         EfNkHFcPe5Bft+wJqvOm3ShhBw8INdt3j6hx6M8oNGZQwcbfP6/uMtaDDJmYtyWV0HS9
         IM2BrZ2e5Bqpu1ynL7Z16KeDOmv31oqTaPSwY0bCG80uixdhqF5zvD9QGeER8+uyhiQO
         XnBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530564; x=1772135364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgPv3nI6uopdJRB2V5KbCVW22bsi4dRg9pnCiXF9wUw=;
        b=kSlko3kJqPVwvSEMg3uQk4QODWQ5hEib7IOpJHF/x0ya9fTCJ/ZdMgLiGdLwarJsgd
         zZlQTnrJmFXNAsayPjuFoBJq8Q/+dfN9uY7RgGO9pRGlezddw9dU3HiUdhDJDPitQZun
         n/qU7jZE/0tgBWMTkbs2nlvsweq1TRg5ApLcKCyB8dNevn2UbYomNieTMksAg8CNw9f7
         0hqgS+8NjlD5sGGGszKacK+rWgJZJxCLjDpqLbGhXrOUtPA8NFh9/NpU+/iSL3Adi3xi
         PoD9/x+o7Qvst20d7lEyN/ZOvhXI/5GKARjCmqu9D3tiby6mYrF2sZ717F5HcsDg7BXS
         Nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530564; x=1772135364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vgPv3nI6uopdJRB2V5KbCVW22bsi4dRg9pnCiXF9wUw=;
        b=EapCi78TXALyGAEGEsjv+XqmNPCd3cgQVzBik1qpeqGJ/pDRZprnlUgRFSjvA9iMdo
         F09l71HWEnhoqEehJRrfX/Mr7dTeD6MxqSL2nwExJt/Afr5JKafCfnF4WxHAH6Ck/txp
         8+Ap9Wa/qTTUvboXd33Lq55NRdBiSSovFZuQjQk9QI1DjdcI5SFpZwapbB0HKjNdG/3z
         JVPFA+S/SqxkFLsquc7wHd4Gp/C07e5fFozn4naQGwfCMdEYsCt6k2+9pxLZFCVpGF/9
         SFEvA+E0uO2J26PE71NUIsKl821Etu5Ms+rTCGcmtk2xn4h8oYoUAxKjGq79gqXnd1zB
         95RA==
X-Forwarded-Encrypted: i=1; AJvYcCXTLFDaDr3p3VbPqsq1WWbEqnCmAaei02oxGmh0mywtqi532d6kCy1daF+rCuSQuGp/UGOvSx9cztQwAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8L3tgTfROHv3GewXgnTyYOtcLvc5yTuK9jo7nVu7+4wYJBzNM
	fm5ghod2Kkd/jpoLhiuiqQw4etiDbnPch7P2aluNqgDQ6y0lmapoAj6UrnOUEm7ClCCLm2/L7XU
	jORueDLoDpziQncD3BG6QwcBSZkDrByWDIXC34nTsU/m8rYHQEwpOXQ5hUgWPLyX7bsBX9PrrxL
	V/mXzmdhYV+dl/vCbbCB+XgCVn74oNCnX6PsId3Lvt
X-Gm-Gg: AZuq6aJ9WgJ2R1U6l12h7KwjKtqd9Zmiy5QCl/ncmnjLzP29/nyvKWAKd91Hw8miRpr
	kUdq6Am79HkKqnE5wSuFHfaPrnqVM5XArNxJBTqIaXhHRHUDP8BvHirpx/VPtFTPchs1RQEuM8u
	q++IPT1Jd6EZRLiWFBMPVUz+8cXGihJkbdHWx0UPDYdwepj/WbM9GmR8PG2UMtcme11VKzxsI5K
	IrWuyvYr0CcnftkY2UOpEYIMHbCugZ3jJDcovo=
X-Received: by 2002:a05:6214:21ef:b0:895:3344:b1b0 with SMTP id 6a1803df08f44-89957ff2ab2mr95302876d6.27.1771530564227;
        Thu, 19 Feb 2026 11:49:24 -0800 (PST)
X-Received: by 2002:a05:6214:21ef:b0:895:3344:b1b0 with SMTP id
 6a1803df08f44-89957ff2ab2mr95302496d6.27.1771530563730; Thu, 19 Feb 2026
 11:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-3-loic.poulain@oss.qualcomm.com> <a79efce6-10a5-40ec-bf5d-f37b2bf29ee0@oss.qualcomm.com>
In-Reply-To: <a79efce6-10a5-40ec-bf5d-f37b2bf29ee0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 20:49:12 +0100
X-Gm-Features: AaiRm51NxUxbCi_uvimqcc69j5rZLbG-QzkPHyk1mXHS_u9Wwtuga8fbOJmiFhY
Message-ID: <CAFEp6-3N43h3azYxokEwvTdv3de9L5ytXJuaG7bbim9_px464g@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: og7cskFyJBTDRGELZwRZCrMID6Xs0ire
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfXxSJnq1VfLKEw
 aBs25NpT+KCW+E5QMBAJW7zmbdNdCjX9qEXwFrX9R/QyxZjNN8McaFeQf0RzUVPpk0CqPWRCzT6
 qhYC/D1elbchDC3eiJUn/Zwh1Hq79qkAcTx5KvsZTgWs7glDv2c7U1YKFIDrTUgSOf7gb2AKOJA
 F7Mufpy04VBeuPXQxRyWo4bs7FySxOyBnpdG8HyRbTuOoohG84cfPcU117s/Im4UMNQsoeVN/Te
 FXK7hmQ3lOBzTuH2aJxiD+Pz939djSnDECQ2J0ZeWcPive4zR3/tnS0wcbr57RjPddD3SZp798R
 Nk3I9CC8ubnYxeI3jXv1GMVNnj92zPzai7TqM06fBZfGwTMlczR7HqLrNa7iP1I85WzP7+wQkmC
 v+gVCseL5dg/K8OIHF/twuSyvuz6qAZpWkze6aRyK9AQe4JeJTXjUPA/lE0qBUgnGfZ5UPELxtE
 EKSo+wUROxAonaXWWFg==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=69976945 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=ZTt2BXceaBMhVjPvKegA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: og7cskFyJBTDRGELZwRZCrMID6Xs0ire
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53111-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6B9631622BB
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:43=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/19/26 4:27 PM, Loic Poulain wrote:
> > Add support for CSID to PIX interface.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > -#define CSID_RDI_CFG0(rdi)                                   (0x300 + =
0x100 * (rdi))
> > -#define              CSID_RDI_CFG0_BYTE_CNTR_EN              BIT(0)
> > -#define              CSID_RDI_CFG0_TIMESTAMP_EN              BIT(1)
> > -#define              CSID_RDI_CFG0_DECODE_FORMAT_MASK        GENMASK(1=
5, 12)
> > -#define              CSID_RDI_CFG0_DECODE_FORMAT_NOP         CSID_RDI_=
CFG0_DECODE_FORMAT_MASK
> > -#define              CSID_RDI_CFG0_DT_MASK                   GENMASK(2=
1, 16)
> > -#define              CSID_RDI_CFG0_VC_MASK                   GENMASK(2=
3, 22)
> > -#define              CSID_RDI_CFG0_DTID_MASK                 GENMASK(2=
8, 27)
> > -#define              CSID_RDI_CFG0_ENABLE                    BIT(31)
>
> Much of this patch is renaming, could you split this up, so it's more
> obvious what it actually introduces?

Sure.

>
> [...]
>
> > +static void __csid_configure_pix_stream(struct csid_device *csid, u8 e=
nable)
>
> Perhaps that's yak shaving, but I don't think enable should be non-binary

Indeed.

>
> > +{
> > +     struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
ADS_NUM - 1];
> > +     const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
> > +                                                                csid->=
res->formats->nformats,
> > +                                                                input_=
format->code);
> > +     u32 val;
> > +
> > +     val =3D FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_f=
ormat);
> > +     val |=3D FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
>
> no vc/dt_id?

In CAMSS, each CSI=E2=80=912 Virtual Channel (VC) is statically tied to a
specific RDI instance: VC0 =E2=86=92 RDI0, VC1 =E2=86=92 RDI1, VC2 =E2=86=
=92 RDI2. VC0
typically carries the main image stream, while the higher-numbered
channels are *usually* used for embedded or metadata streams that
don't require pixel processing. This is why we select VC0 for the PIX
path, as it reliably covers the vast majority of use cases.

Achieving more flexible or dynamic VC selection would require
decoupling the current VC-to=E2=80=91RDI association and restructuring how =
the
CAMSS pipeline represents and routes CSI=E2=80=912 streams. This would be a
non=E2=80=91trivial architectural change, touching both the CSID routing lo=
gic
and how VFE input paths are modeled.

The DT_ID is a per=E2=80=91VC, 2=E2=80=91bit identifier that we currently a=
ssign to
uniquely represent or map a given data type. At the moment, all CSID
drivers simply use DT_ID =3D VC_ID, meaning each RDI/VC instance
implicitly handles a different data type. For the PIX path, we keep
DT_ID =3D 0, matching the RDI0/VC0 stream. Ideally, DT_ID allocation
should be based on the actual data type rather than tied to the VC
number, but that belongs to a separate series.


> > +
> > +     if (enable)
> > +             val |=3D CSID_CFG0_ENABLE;
> > +
> > +     dev_dbg(csid->camss->dev, "CSID%u: Stream %s PIX (dt=3D0x%x df=3D=
0x%x)\n",
> > +             csid->id, enable ? "enable" : "disable", format->data_typ=
e, format->decode_format);
>
> "... %sable ..." enable ? "en" : "dis"
>
> Konrad

