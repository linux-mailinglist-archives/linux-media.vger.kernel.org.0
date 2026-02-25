Return-Path: <linux-media+bounces-53314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHbxFX2jnmlPWgQAu9opvQ
	(envelope-from <linux-media+bounces-53314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:23:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC26519356D
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 854B8324F647
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 07:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446662C17A0;
	Wed, 25 Feb 2026 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVjXGq5a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAiuJXpI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A53F277C81
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002936; cv=pass; b=qHZ/5chkg6ldMQUctvm5kzat0w1Q4umb0Tsd6/vJ+1f49VPN47DCRJMejl8dZTwo+O+ApBVNCoWEGBeDw5tICF6Ljsgp02hsb1lcuMmxOGBbKYYBgS0XKsOW0PxhUiEiHud3NBDGYeD/RlbybgSZiY9joLFgamdnrVXq4Z6ArLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002936; c=relaxed/simple;
	bh=+CQRq2f0y9Kz9FjiYV6i3TaDfft7KUVskcOfCnv8kk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXCOlMN64k4OPaccfIub6BhmcQ3Pl+6aokq7bZ9ILzPN0HPTkCTv7onRxyL2gfifVkHvIsfmY+uzKDAH3kt02RfIVcHs936zjHrntQid9wOIl0M+y0krcWMXBab25THGa31wKxaSo3/y8oBp0JUiNQGJi3gruIpgkEvyuxfPpVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVjXGq5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAiuJXpI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2eiUn2334650
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIvxcIUiExE28+h46mlIzXq7o5B1UOORxIQdbDo662w=; b=oVjXGq5aGk8h8lX5
	7Xq4vyf4XuMIW35qr5Vb64FFU76rUoEjqhnjeBCgmuldZ906a13WkTm6Lgnn21uS
	pzMU75igLRR2IfPJNc3Ym0B8r3odGJ3biwu78bbwF0My2ritdJtzhU+71oLkuOuC
	vx5ZaiLIumEGHSst3Ncj3yJHg1VLvmcwzzZW3E85WVe3rCoLEk2Fwb4WChbM/plm
	FI9xHz/sGbq2HpBXEFABo5qh6XfSOKQOon0/eTEKnyfUY6JQInL4jBLbOgDQXx6O
	08+pTzq1zy4LfpjBzIX269+5WDNaNAgQvl1Hch76yRUhCHz7c43RdBawcUURvgP2
	2HF/yA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37t99s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:02:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896f4dcef67so806526316d6.2
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 23:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772002932; cv=none;
        d=google.com; s=arc-20240605;
        b=BGORkJOOCGF2yYUXjmLBbGBMPyMKXedudAfo88kO4r0Dj1IRX8V9ol6igotptOhjwv
         XvQcVhQDu/ipBqtrv52Y4KmcSvfEgiJNwsvL/Duh8iU3zqwnPUbeODiDbkfRYzuCKBbi
         PT2XU6EJOlwjOlTXvbBVHgqPzTkeqHFM9aMxrRxa5zxR2de1bmw97fb/KR5Q7OnmN8ck
         AuFn2acLqHRpNZe3iKxM6i+2URZi1h95m6ko0IllQJ9NAFqKh5iimHfaQ8Jm6bwnL/N1
         pYijZlC59ocEE8yQH39HzCv2isg/4A6mPOEvtFWRajD4Cy4W1nPou/lHOaX22AwC8a2t
         0ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TIvxcIUiExE28+h46mlIzXq7o5B1UOORxIQdbDo662w=;
        fh=4D6l0XvQ0ZQ7hM7HyVRLKWq8sRpqU22G0EgIIOThKIk=;
        b=Zhd+LjMmK7Ntr/b+rlQA8YZocnl3mrJbF+TjwmNdRM8RmIWUUWs19cOE5Xejt1ZanW
         5wZyRRW0XDDYmt1xgUG99GFK0bCoFLpJnWBA39azcMQg8Wt1hjw1VAOdaLe8gHaN64Ix
         TXP9PPYgzbH2qU0EprnueFRxRRu4BjpOHm9+zuTdurdw3+mxyBiNML5MHJqoHSewfR3o
         UI+K7bUOaw8yPDq+4u3SvDFFLzchIuZsZ0dLxrYiF965+cUVbBm1Z6ioxFOZySw552Fr
         bYXIcRN9Cn9Av8M40xBYPDDP1WG6UMy/dmBV3fRf5Z12Wz1hGP6+MbRaRZae9ip0Gtky
         PMwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772002932; x=1772607732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIvxcIUiExE28+h46mlIzXq7o5B1UOORxIQdbDo662w=;
        b=QAiuJXpIM+sNO0fkjGt4w/GPdvMxuXuH0rKTPyyF0fbO9lix7RHAVatt+Gzs+/bST+
         JQVDtTaI3rAAqPVpTeJzanS35EimVb7nZkvd4nGSn886/SxtFw/p0evlrI+xhPjATn4J
         53kb/cH9MwqkDr3tXa9QoGdstVYdShjlFrUvVuQktXnZNSuCY/1sOofzv+VHotwICnUI
         3aW4sO7zSPn1Et1odxgeag/cAPRMWKG2rNUxLtEXfsP9qjbVGalgzxKs4EV26v+Ym07U
         fH/TekFtKgmihYBWGVNJR0fPuJl68f/TI2T8AimpNGAPjWxFdGH8K0aLPWnNIGArTxVY
         NPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002932; x=1772607732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TIvxcIUiExE28+h46mlIzXq7o5B1UOORxIQdbDo662w=;
        b=tIQADtMMWS/rg3hMSupDqYm/xYX7AeP02WWbVmgs+FnlZTeU3wQi5VEa3ZL0SHOqSI
         Ph2qyk/c58nFuamXxqdnjPhgpvaxTbWEo4nA6JzGjd2R13Nt3pAPUKqcyeR9zap//CeY
         h8LRUTpcO0nfVUI/wbSoy/lcn/DkX8HZqG6iMsFUWPutpw53oCZ8lS5KV9atb7q4nf0N
         HYLOdelnV0MPcVodtBRseTj/g05VsyjI1YmPb4smg4eP4FeWIt2TYgqcrcOmiJD/6fGW
         bJk1Lln1RaVe7rxA03e/GvThnrBQ/GqqbKB9ubKHdxkZmSg61ge6WAT9tqlmH5R+O/Q0
         3vvg==
X-Forwarded-Encrypted: i=1; AJvYcCWSq1FTXpybJhyNwfqj/ysWwuti2UKxfEj8izYPtT6RGSlQnsjYkO9GrXAepr+SXsiN8j7iuvCW2tZriQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye7tpOo5ubDs1L7LYogxm21wHsU7Ied1iSs4VkeBuuruZhv1Wo
	KDHFjgJBlwQ2m31c0ZjKU2KdTpuswyPs31Qf4iOCHM0DRiotZrrYb8LCfg7+iSnziT+gQPW/5dI
	jHkwrAA6hrKO6Xz9SnVHvve8DVLmcg6OcjIZC6ElTx6ajEn9YMmiV/ws5IvvmkUcbYvPWv14UXI
	stqBEcZ3amyB0sT9U36eDHhlP5vdjWzinZ6rLFzFG4
X-Gm-Gg: ATEYQzy8Ufgr9QH7jUvVErAdDnZCQ81bY+8mGjv4zun6TJu2jVTzdExk/PKTAaUYKHY
	57vcmEm3Owcj36dty4jCoa6JoOWjYK73JoxlvBwfszyQY82RCAfAMkk+VxzF7zJJwk+WoSDikih
	FNIrRIdiDAfWgE/bD2iHMFe9jGcC9r2wGZq/ehzOSGmcaip23+Ql1JjqKze9oKIRREkRI5TinnG
	A6y4gvUMPzvGleKEDsJ2q2jls8RWOx3SDSbF6o=
X-Received: by 2002:a05:6214:260d:b0:895:35ea:8bc6 with SMTP id 6a1803df08f44-89979db5299mr219389186d6.67.1772002932350;
        Tue, 24 Feb 2026 23:02:12 -0800 (PST)
X-Received: by 2002:a05:6214:260d:b0:895:35ea:8bc6 with SMTP id
 6a1803df08f44-89979db5299mr219388946d6.67.1772002931936; Tue, 24 Feb 2026
 23:02:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-2-loic.poulain@oss.qualcomm.com> <e286c232-f307-42b3-8b3b-c25b62389c90@linaro.org>
In-Reply-To: <e286c232-f307-42b3-8b3b-c25b62389c90@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 08:02:00 +0100
X-Gm-Features: AaiRm50mhi6YRntJhyse8EUz6OEEsWYUyscJMgYaTgccpHGwRrCsM83Hltce7bg
Message-ID: <CAFEp6-39z=0Ja3MjBNr0vhoVqEmHa_K_4yJCwu2ihyifYmvmtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe-340: Proper client handling
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: rfoss@kernel.org, todor.too@gmail.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699e9e75 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sD84q0ronQK_62RWDccA:9 a=Nt95yvp0HerYrbeJ:21 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2NyBTYWx0ZWRfX8+hJlN32lz8g
 YGPe9guwKFjhPpQioBArFHX+TUcTTbDVIWH8lp/nD3ulkv6H7m9ZMPRrEiLLuivaBPysQTVzrKr
 OXr1BTt8t5GNB4tDi3W3FMQIC4MRtJrUo3uj9U+CT0bJTLl4oaJNGXrV4mFnBbFizl/8JuMPE8D
 MKylz3sNw1gwrHv/m7zuRSaX3ZPxy+0sPQeksld0bOiAZMjT2LnmvT2D+JRAF5m3+dONHGYBidO
 0dThE94GN7X+0VDSBsczcfMZH4yIf4Bsch+k6GhUFE5Ewnityv7YtBtKDr8/z5J3BI9n2ms5D9b
 sf+QspRgqiSkxusff22ZETuYJoIF0k/TRF/XmIVyRfhlCmvekIcGM3iSSoONxgeazvNCKSEjKYn
 y516VStnwyonmrwV+dobHy5EAybyJNZ7Upw2V4LKBE4V12k32aBqau6oor8fWsusYG50J9B98/3
 nPlF/efBo+gaM/LSFhw==
X-Proofpoint-ORIG-GUID: rO-Smq2Cfc2rNCZIYZly2faG_sx1mbvC
X-Proofpoint-GUID: rO-Smq2Cfc2rNCZIYZly2faG_sx1mbvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,linaro.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53314-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email]
X-Rspamd-Queue-Id: AC26519356D
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:47=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/02/2026 15:27, Loic Poulain wrote:
> > We need to properly map camss WM index to our internal WM client
> > instance. Today we're only support RDI interfaces with the RDI_WM
> > macro, introduce a __wm_to_client helper to support any interface.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   .../media/platform/qcom/camss/camss-vfe-340.c | 94 +++++++++++-------=
-
> >   1 file changed, 53 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/driver=
s/media/platform/qcom/camss/camss-vfe-340.c
> > index 30d7630b3e8b..c6ea8b6216c2 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > @@ -69,24 +69,19 @@
> >   #define TFE_BUS_FRAMEDROP_CFG_0(c)                  BUS_REG(0x238 + (=
c) * 0x100)
> >   #define TFE_BUS_FRAMEDROP_CFG_1(c)                  BUS_REG(0x23c + (=
c) * 0x100)
> >
> > -/*
> > - * TODO: differentiate the port id based on requested type of RDI, BHI=
ST etc
> > - *
> > - * TFE write master IDs (clients)
> > - *
> > - * BAYER             0
> > - * IDEAL_RAW         1
> > - * STATS_TINTLESS_BG 2
> > - * STATS_BHIST               3
> > - * STATS_AWB_BG              4
> > - * STATS_AEC_BG              5
> > - * STATS_BAF         6
> > - * RDI0                      7
> > - * RDI1                      8
> > - * RDI2                      9
> > - */
> > -#define RDI_WM(n)            (7 + (n))
> > -#define TFE_WM_NUM           10
> > +enum tfe_client {
> > +     TFE_CLI_BAYER,
> > +     TFE_CLI_IDEAL_RAW,
> > +     TFE_CLI_STATS_TINTLESS_BG,
> > +     TFE_CLI_STATS_BHIST,
> > +     TFE_CLI_STATS_AWB_BG,
> > +     TFE_CLI_STATS_AEC_BG,
> > +     TFE_CLI_STATS_BAF,
> > +     TFE_CLI_RDI0,
> > +     TFE_CLI_RDI1,
> > +     TFE_CLI_RDI2,
> > +     TFE_CLI_NUM
> > +};
> >
> >   enum tfe_iface {
> >       TFE_IFACE_PIX,
> > @@ -108,6 +103,13 @@ enum tfe_subgroups {
> >       TFE_SUBGROUP_NUM
> >   };
> >
> > +static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] =3D {
> > +     [VFE_LINE_RDI0] =3D TFE_CLI_RDI0,
> > +     [VFE_LINE_RDI1] =3D TFE_CLI_RDI1,
> > +     [VFE_LINE_RDI2] =3D TFE_CLI_RDI2,
> > +     [VFE_LINE_PIX] =3D TFE_CLI_BAYER,
> > +};
> > +
> >   static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] =3D {
> >       [VFE_LINE_RDI0] =3D TFE_IFACE_RDI0,
> >       [VFE_LINE_RDI1] =3D TFE_IFACE_RDI1,
> > @@ -126,6 +128,16 @@ static enum vfe_line_id tfe_subgroup_line_map[TFE_=
SUBGROUP_NUM] =3D {
> >       [TFE_SUBGROUP_RDI2] =3D VFE_LINE_RDI2,
> >   };
> >
> > +static inline enum tfe_client  __wm_to_client(u8 wm)
> redundant space
>
> > +{
> > +     if (wm >=3D ARRAY_SIZE(tfe_wm_client_map)) {
> > +             pr_warn("VFE: Invalid WM%u\n", wm);
> > +             return TFE_CLI_RDI0;
> > +     }
>
> Why or how would this happen ?

This is just a paranoid/defensive boundary check as this value comes
from outside this driver (camss-core), but it should never be
triggered.

>
> > +
> > +     return tfe_wm_client_map[wm];
> > +}
> > +
> >   static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_i=
d)
> >   {
> >       if (line_id <=3D VFE_LINE_NONE || line_id >=3D VFE_LINE_NUM_MAX) =
{
> > @@ -209,10 +221,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
> >       status =3D readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
> >       if (status) {
> >               writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
> > -             for (i =3D 0; i < TFE_WM_NUM; i++) {
> > +             for (i =3D 0; i < TFE_CLI_NUM; i++) {
> >                       if (status & BIT(i))
> >                               dev_err_ratelimited(vfe->camss->dev,
> > -                                                 "VFE%u: bus overflow =
for wm %u\n",
> > +                                                 "VFE%u: bus overflow =
for client %u\n",
> >                                                   vfe->id, i);
> >               }
> >       }
> > @@ -235,49 +247,49 @@ static void vfe_enable_irq(struct vfe_device *vfe=
)
> >              TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_=
0);
> >   }
> >
> > -static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
> > +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> >                         struct vfe_line *line)
> >   {
> > -     u8 wm =3D RDI_WM(rdi);
> > +     u8 client =3D __wm_to_client(wm);
> >
> > -     writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
> > +     writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
> >   }
> >
> > -static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_li=
ne *line)
> > +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_lin=
e *line)
> >   {
> >       struct v4l2_pix_format_mplane *pix =3D &line->video_out.active_fm=
t.fmt.pix_mp;
> >       u32 stride =3D pix->plane_fmt[0].bytesperline;
> > -     u8 wm =3D RDI_WM(rdi);
> > +     u8 client =3D __wm_to_client(wm);
> >
> >       /* Configuration for plain RDI frames */
> > -     writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_0(wm));
> > -     writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
> > -     writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_2(wm));
> > -     writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_IN=
CR(wm));
> > -     writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BU=
S_PACKER_CFG(wm));
> > +     writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_0(client));
> > +     writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> > +     writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_2(client));
> > +     writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_IN=
CR(client));
> > +     writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BU=
S_PACKER_CFG(client));
> >
> >       /* No dropped frames, one irq per frame */
> > -     writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
> > -     writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
> > -     writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
> > -     writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
> > +     writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
> > +     writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
> > +     writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client)=
);
> > +     writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client)=
);
> >
> >       vfe_enable_irq(vfe);
> >
> >       writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> > -            vfe->base + TFE_BUS_CLIENT_CFG(wm));
> > +            vfe->base + TFE_BUS_CLIENT_CFG(client));
> >
> > -     dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u=
 stride %u\n",
> > -             vfe->id, rdi, pix->width, pix->height, stride);
> > +     dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u heigh=
t %u stride %u\n",
> > +             vfe->id, client, pix->width, pix->height, client);
> >   }
> >
> > -static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
> > +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> >   {
> > -     u8 wm =3D RDI_WM(rdi);
> > +     u8 client =3D __wm_to_client(wm);
> >
> > -     writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
> > +     writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
> >
> > -     dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
> > +     dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, c=
lient);
> >   }
> >
> >   static const struct camss_video_ops vfe_video_ops_520 =3D {
>
> Otherwise seems fine.
>
> Your series title got mangled somewhere BTW.
>
> ---
> bod
>

