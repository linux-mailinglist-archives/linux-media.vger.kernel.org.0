Return-Path: <linux-media+bounces-53402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKD4OAgxn2lXZQQAu9opvQ
	(envelope-from <linux-media+bounces-53402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:27:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8989D19B88E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA3F2303AA95
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B786F3E9F6A;
	Wed, 25 Feb 2026 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJbqzYJ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJZXwfXj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70E3E959D
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772040431; cv=pass; b=PK+NZQOF79p9y0P/uBicbmHoevLiC0OWNCvpTrUmUEzOrlwnLBG4EMBzpY4twQXPW/xmlFwbV+uQ2n+W6dTK/vxxZJ9zYLGHw3soH1ju6GSs5ruqn9SYAqfG8sjanpXl2G4NtL7/XyW9X8Uv3FJzUZqhOCLGiTbEgrdW+ETDiSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772040431; c=relaxed/simple;
	bh=1YmQtSMFtFWtqRzSWEpc60DBb/b6Z9MbzTdSZ1sQEPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMHWNVxEdWEyV4gTkOLHApRvI6boVnRrXPJXD4mlwSdafhiAPTFxPTKv/3UjgvaVS+C5c78LBANi8ZfL6Qn+3vgWKWyrFVlQptcyuQC+rt+KjiZTxjvmG1bAgea20WvCfLUZJpcYG5QdBG7qJxWX4dC6jb82CUxDak563wLY5ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJbqzYJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJZXwfXj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3ROn1512073
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 17:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Hku3AtI69zFRmAUNKIAygU10IDZKE27b4zLdDLC6UY=; b=FJbqzYJ4wCOq+Oy9
	di8fVHvZji2VSihFWpOHpWL89QrWYWqFTZZxh6X8rvCZEo9Y+gHAi6FaJrDSuMu2
	1anw6AIvV7mOaIAKrgy+Ca1uw/IegHWEI/1EBmkOYA8nhT7K3RmxaXgzIWTgtKvQ
	PDk143sMTEjM/+QSbeDqokvKZWIySCjFYSVIJyWQ+BmLU/xbeNqSAYFvX73urd2h
	KlOP+rrG0azrhuZxs4nKObdmif7c+jivIBgsiP6r0c9WHxJK6RX4yaRfOQJxOWXX
	2fT87fMWAXXF4ybIesslUTANHKUHqrWs7H0zpBMhRw66Xw2zARbKgxpvz6GJ7GdF
	gImQrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf1625-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 17:27:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506b3fb32a1so661272131cf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 09:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772040426; cv=none;
        d=google.com; s=arc-20240605;
        b=Gc0ApZP/n22MCRf88I1IH1NFRyFPrrDQ0KJvpSSPvBwUErVdvCMkj6u0FvBsM3vakv
         mvMpkGOZmPooH+BSgojTin8IwlPftzPfoFo+Z1BNE4vB9hM2D1HmiO0yhP8aSHAw0E4D
         vCvCIjYczWkWSSDQapRtxDpSY2+qm8KS+nhbIL2vyHzl5wEIkbjZttdZlp/FYJbc9Lq9
         sIh+8siheIXQ2CJgBTIObeGNCw3q5KAtoorNpb3/4GAD1PNnZBXaLPCE1B23G+/mK5Y+
         9OWKLUs+rN8HApL/Qjl/T53hRLrXpt6c2HHq8tLcsTp+b4YIZ6ytQMJuRfgJg1P1+iGP
         yamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Hku3AtI69zFRmAUNKIAygU10IDZKE27b4zLdDLC6UY=;
        fh=H2YkZWUoWshlZo/lZyhYq2SK7PszKxX+Vg3sxT4+omo=;
        b=MeP/EKQo0OcBjQLTliidAvvrGVRLb/BV42wQXrPfETfbcG0398JIUU8oflrnnajMHT
         B7AjBSfOuyYzL5EtBKghBFP6sLqm0WUeoRMm/mWu+E5b1+fWNIpD5Z/5x/fS8hKbrAPN
         PY0BNme8QJWlpXHnfWdfkybClHE/hqoYoDRgPcMqfZG2HUW9IQbx/UXGv/aAlwt+kMyD
         SPtGUq9+HuBcJNsGIE7x3E1KOV+KY+JsHyw5w2kQVCcnHReIegtAwt683SF2PkOGPuLm
         SbGoGYVns94iNNMNmcm3BgmnPneMKasodnDPMGiLXGe18hkQJ/NNKbAJOaWP/bMAgEUm
         N0yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772040426; x=1772645226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Hku3AtI69zFRmAUNKIAygU10IDZKE27b4zLdDLC6UY=;
        b=bJZXwfXjC7gokT2Lo2fQKRKpo/CRvHHPPZnnofdcqnzGoe4Hmwx75tfISEyAsLhHFS
         JIkAUdprRheN+WvwytGa2i7IQkIg39rmA9gkQrasVbD260C+xFljAllqhIdDeNrDcxtn
         KPGroTwVuycTSHLdMJlGyqPynhdPNBINxQfhXz6AiL8FavtkKm9Bu7dHym2PZBG8O4DB
         dITfajSgRGQRzAKjZG9p4NzAW+Aban538I3G9aSBUKP0IaEtcpFapiymNNfV1Oz5lZJa
         h+I4IN8jmdeMKA5V9Q2IwGfkDHJNhJdZT+cx4zvggQsTKg50wKB857eXoNsLHczhkiic
         hjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772040426; x=1772645226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Hku3AtI69zFRmAUNKIAygU10IDZKE27b4zLdDLC6UY=;
        b=RLH7jf/5usS764AmdKjsxGg6xCWm5sVsRE1mk455HlFlCy/qmYay0bcHsN0cSw3j8R
         LCwK8kWCqBD3xDyfzNcrnqzcX+MKoLrfDH2SX70yjX6i6WKPYfn0bOt4nX3M0tb93q5d
         fQr7Nxac4Y82wghKqjntz7NQ75ehF5N34v35NQA7Mqkfq29XfwHFlIW6R1fFHEk/Qzzs
         jVxdi/jBfMBb3es0jrxEOXGjyP6E7NaH8T0F1z7pe7OZJMgPotAlKaQeF9+Z7hYneZ3L
         hDVK3FVO1aL7Ck5dPqnPYTk86vR0AnDOzrh1yag8O88zQfsjjk66bRtqvQHebg8OzW2K
         EXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9x56QeJoh8/0hvkvS9fZt5G/JuQzfyZGIUYXb6cKMOrE6sQocj0JW+7dRR7UEnIrrjNIpQtubEJttsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMdVWmytpoVrM/VjM55eoQXRA39ysI8Ncxr2EFSE3hJs/kIJox
	T867G2if4esoyIHdakTDackrw20FMEmP802lNjulpHWnIbsxSz7IxwBkSnE4b5OAmBYsy3MOMTC
	cegl8M5fbY/1BAMs0IyGdTAJsWDP69gNDSWpi8zKBK4E/6gJpMUUwhPpoA1+02yyWjklXGPdZCT
	0L9P1CYCeFGZsPJUjNDlHFZX82HSIhTpZxkc5wgRIM
X-Gm-Gg: ATEYQzwj6Z+CbITe3X4DkibjquKzByUgfsuhhXgz6kz3O4capwzwxAM6OaHoqiZR29E
	kdBqUP3D745JfGs/zXaKbq4vYTQYom4mr9MDFrTVBJzgpYO88MTlxyNt5D/wnhVvvy4MjQWKjRy
	ohZ8DdZZmq5snJ3LOU9OPDRnsn5KT6Vl1WmFSGQ9HDYnSjtNcaE9Vu1bckCa88iVnCuJuQzVYs4
	bRkCgd+7MRqgdYqnbtYGBu3DzcNy+3gEhooZkcp
X-Received: by 2002:ac8:5a83:0:b0:506:9e57:8ba9 with SMTP id d75a77b69052e-50741f9b2e4mr16727361cf.35.1772040426559;
        Wed, 25 Feb 2026 09:27:06 -0800 (PST)
X-Received: by 2002:ac8:5a83:0:b0:506:9e57:8ba9 with SMTP id
 d75a77b69052e-50741f9b2e4mr16727031cf.35.1772040426157; Wed, 25 Feb 2026
 09:27:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com> <32hsnxlqg6dzu3zjszuarn5tu73vpvwhf3u22wvrucznz6h4ub@xzuqhcayo2jv>
In-Reply-To: <32hsnxlqg6dzu3zjszuarn5tu73vpvwhf3u22wvrucznz6h4ub@xzuqhcayo2jv>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 18:26:55 +0100
X-Gm-Features: AaiRm53cAm4tC3lS3yKgesKNZaeSPKB3K3hUOjqqC0kh4okc-dfZ4uYHYvWP64Q
Message-ID: <CAFEp6-2vCqQM82ZGt6txnPe5O+iT+mhLAkrOr3Qo4gKUquS4cA@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Add debug message to camss-video
 format check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: FMw9O7pysPlypvktZ-e6M7LxqwMp7_mH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NyBTYWx0ZWRfX55pjXBTvkgMg
 REg3kWzPK5w6IpyTYZIA+W4dyk2BDy0uQmr5k4GD1fHXVgr9ImkiapNROxruk6Bj2/Xv5QQY4LA
 vXWklFkFbYBDIikf7reGoAHvv+JJt4pWYZFLgDKI/2jSzZzYNIuJ+mlCWqBQN14rgUidf/pQn6Y
 FKMq0YWh+Seg32nJPMr25Pqw5TXEVgP4ak4wufIVbAQoimnjURwDa6NPKk1rVjNnwS/bkuAbIPO
 SCeTjexKeXFQB3pLN9DCN2oQlW2QjRXuPMpuAPm4CNitpLDng1X8LWdKU7lXkOhafKVeTE80iw8
 SevTLwoGxq7GyXzA7m2K0O/jWhSECzCfEKUOBRTBbF4RvUbmWE8fX3ki5ad8YEg5N5QCM/fpQU4
 Rdg9ZMd6q/WT62u8NI+pCt75+aDtvl/sVNXA2MrlpgjnzM/+cF9t9Cg4jtRxrF5DrgoLaUwKNCv
 wiXPN7blGVxLpUO43PQ==
X-Proofpoint-GUID: FMw9O7pysPlypvktZ-e6M7LxqwMp7_mH
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699f30eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=2JGOZOhU44fMd48AngwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250167
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53402-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8989D19B88E
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 5:44=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Feb 25, 2026 at 04:22:11PM +0100, Loic Poulain wrote:
> > Add a debug trace to video_check_format() to log both the subdev-report=
ed
> > format and the format requested by the video node. This makes it easier
> > to diagnose mismatches between subdev output and the negotiated V4L2
> > pixel format, as well as issues related to plane count, resolution, or
> > field settings.
> >
> > A small helper, print_fourcc(), is introduced to render fourcc codes in
> > a readable way.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../media/platform/qcom/camss/camss-video.c   | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/=
media/platform/qcom/camss/camss-video.c
> > index 0c76bc2cc574..601d5a43306f 100644
> > --- a/drivers/media/platform/qcom/camss/camss-video.c
> > +++ b/drivers/media/platform/qcom/camss/camss-video.c
> > @@ -114,6 +114,19 @@ static int video_get_subdev_format(struct camss_vi=
deo *video,
> >                                   &video->formats[ret], video->bpl_alig=
nment);
> >  }
> >
> > +static char *print_fourcc(u32 fmt)
> > +{
> > +     static char code[5];
> > +
> > +     code[0] =3D (unsigned char)(fmt & 0xff);
> > +     code[1] =3D (unsigned char)((fmt >> 8) & 0xff);
> > +     code[2] =3D (unsigned char)((fmt >> 16) & 0xff);
> > +     code[3] =3D (unsigned char)((fmt >> 24) & 0xff);
> > +     code[4] =3D '\0';
>
> Any reason for not using %p4cc ?

I was not aware of this format specifier, now I am, will use in v2.

Regards,
Loic

