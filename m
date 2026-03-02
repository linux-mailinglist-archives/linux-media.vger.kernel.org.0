Return-Path: <linux-media+bounces-54103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGBjNIWtpWmpDgAAu9opvQ
	(envelope-from <linux-media+bounces-54103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 16:32:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF0D1DBE39
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 16:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C798300B849
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 15:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831E341162E;
	Mon,  2 Mar 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEGcfBk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkuEJBwP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D7411617
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465412; cv=pass; b=Z2ThWlZqJhvbK3xy6c3GXOyu6kY53murmeouxeMFv3zUGKOEdhAvEwgjVS0aICPYdYDL+o2OJMEqJ2udWUSlYVwDSEfHfmJLWVfzbCTxwovZpOlOMwtA83f5TBtzmrvIHg4GTV8K4RUE04Q3B67fTluBO7s/Gc8iMLsXhDYjF2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465412; c=relaxed/simple;
	bh=PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMaYzEevYeuUhxxx435syuGza5gIZ1Ng44a8rXy8zupcrTAW/+kWze63yvte+GkogB9Q3B0mc4Kyyms0PrqlyWfvtpMBMCi5YWlow3dEdQLNoNyThSAvMpBCcD2bblh8iLABKeWH7jdws+gdRBCxfEPOHMttR6nQHZu/v41aKkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEGcfBk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkuEJBwP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622E6iaE3223985
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 15:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=; b=jEGcfBk4ISlQYOy8
	PYfGyMjsSSnWSuVU+10FNlhJ6j4WYoUt2cbjC8S8Rq8DguXHNcTSvKd92JX7Ynvl
	lLRifdVOoJ3gs/R+5pmibhqNWVAfQbZAxX8kINWm13EVRs7nrKS8dE9wSYqXHhtv
	M8l9+y7/hEMxqynipMImRooMKYrmKy5yGS08iA1LTpGLuiR4qxJJDcBIFAntLe0h
	IDxqBolvbU++xlYIBYQ71KItLGt1acz3t/WQrh94SvaGEoegDZ9myuv6VCp0BuO3
	0iqMItBxioFQERTqo1YqHXDMDUKiAxUHlPl9e+771zPFbySnez3khVbvrvBPLmhh
	2fNahw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1jr81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 15:30:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so3175455785a.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 07:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772465409; cv=none;
        d=google.com; s=arc-20240605;
        b=Ch2ApEZRIh8YoSUAEU7Ci0nn4qVPWMO/sgWSxhf9tBHg93HzUoLhdd0s7ajAJnLWCV
         ZSWH2jjoPfmIKYSM39fjjzHxcLCf2j7GlvspAGxBWPUNwtBmlciO9SDFqZX2N6MUyk0l
         ReljTynU4W0rlnL7QC79D/scJMcU7jESrw6s3TnGeeZATyBVTjmJ5O9HYMybsDLDn+wH
         u6WhIlhpMbTof/nhdAYE5cibNfBjxf6UGwjUTVZyJytG+72YIuTNJOdtvCFEUv2aRdJb
         F8f55Qb7UTQDKUbzkxkqlmhkHtINGng+Lzi9yuSutPGZD/b7Xam7NajQBhFsHT1WsXc0
         NdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=;
        fh=nvNLgMPPRD9483cc5vWrtGDx+/QsXHoUhARFTGQoMXk=;
        b=OefOi3C4PnGYBniOW32UsJmL25kOz3NADJsj6Lvq9iWWhmH/qvpbX6oW8GdqNfUKik
         pPMvu+0ex/h7chRilxKp0Tu3yrPXwL2dq04CZZYzUtkSXEMJBN6FE1Kt5kdtPRunwFMb
         ITEp4JhqUN4AqcJbwA+7SEfjgieYVndvjKOyvrAzgBMi4ykg4TqO8DzOGhwNcU80WaXc
         /v/Osk8NcvDe7ChO7dnMdazgkwMlqFs35qfVG75LaUBB0trbebFM0zBT3gFhQfLFIDCu
         jbn7UwZU4FJ5G4p8rk9DqrrzMKCsaMBjFVSs/VvAHOckLVuGCGJ4QHC+RY9QM0nHRw2Z
         nJpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772465409; x=1773070209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=;
        b=KkuEJBwPuj+Rxb8sn4CO1rDOym0SaTPQGyCzEvIKxqdpRTEMQLuhlo9eckiRf8h29G
         yKalOnt5IbATYG7VRJg0fGQym4Ga5GPgJawKtPy3xRQF7sUyRcQTP+rfPv4YTALQK1jU
         F1EstO3ZwkiRliaiYaKUniH76qdbZSzoIw2p5cGeNCRJT1RTrXMT5+8VtMSkKXsWgYeO
         DDvfm5/X6qh2yzIRuspOxMJGoW2RWRIbnUkAjt4LPIbshpvY1CV2BQompJ/ClpZf/4NL
         qfUUazZEj5fJeRR3Ra2dIAZ9HhnKRa+3orUZG3nLXbM1JeYWUquDHFS9TeAbOg/H6oB0
         FYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465409; x=1773070209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PshqzhDr9vMvJK7Fn2kKh8B00an7kKgIYrpGJI2PzWo=;
        b=iqa8V1dMN7Ar4D4aq/MYMFQr6Skt5Oe8KRo9ZOgnE8QgPsPvMFL97lpdSV4lB/Agu6
         w0HSozV1HTafJPJ1f92M68vEpO5ScJCtQHvOyEFh3HN/dfnAEsBQF7w1gMI+gz97m8HQ
         9EBZHTU8Hzs097v46115J2zJ7HhmHm/RXBsp/+tHHKJpQZGYg7D7bEzrtss51XVzQdgr
         cfwvZXYnPxqqjqc2HI1Nhq0z5h1yynR5Aat1gRKP6JIdhr34jxmdRYSUaZlS/b16mgFF
         iZor6t7OQS0j8ppr6bJOGfKfNOfYEocWdSYg0YDkLV76Ttd48GFi7p1UQNdv1VDWWPDr
         u4ug==
X-Forwarded-Encrypted: i=1; AJvYcCW3Dl8vdncwoa6wxN02B+xxFRc7MmSAUvX+be1n8d17SwTn+6TZVrPahMrz1bKXypAPrwF66jCb3D0ayw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxVE9IpK5WrZMyNV+v21Ny5drf6zCUeWYHpWa4arylcuuqttpC
	7BZHk2x/JHvC2GfBsnZnmXxShLesOTCfZjN3P+IbguFP6AWzXNfV4DDSuLLn9qlJGgICAuVA4Ob
	xzz5g1r2d8y19iYljOitUD8RXWBJa8RBfPY9v9ivseZjwkD9mKMvuHtc0oczcVREz6fNGwWq/Lc
	DKm66FsGkmQ+Eq83SCp4clivjr4uiML0wEuM0W8atr
X-Gm-Gg: ATEYQzw5Sdwca2vlPftymtEdOA7pIHXSz2RrZFyLhrUaSyTdCxh9oUbFIXmOqsPUJiA
	JFRvzfA9NbCKfZOMl2R57foOe97GDUJVWvPTYyGto5wDobZp+rtEh20iubvAyOukPt2oIO4p3B8
	fuYDOaxc847EMyYhxE8oakepO6US2nhxPaJGt5OKMlSd3BkmWsgg0scBh3nFY3mwuFNhhoTq0ih
	apmZK4l2OunomHEUdkob7KHeLIAfblmIrvs8mIu
X-Received: by 2002:a05:620a:7006:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cbc8df2657mr1690427385a.38.1772465408599;
        Mon, 02 Mar 2026 07:30:08 -0800 (PST)
X-Received: by 2002:a05:620a:7006:b0:8c6:f411:5eec with SMTP id
 af79cd13be357-8cbc8df2657mr1690417985a.38.1772465407958; Mon, 02 Mar 2026
 07:30:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
 <20260225150122.766220-3-loic.poulain@oss.qualcomm.com> <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
 <CAFEp6-3KA5tztKscsaHn3=MVKfwC=gbCMNgZhi7SasxHXxttYg@mail.gmail.com> <trtkruw4g3bn4sltdj3foq6xqxjxvgejnzyn7cbcour7a4zls4@kwexergrb4r2>
In-Reply-To: <trtkruw4g3bn4sltdj3foq6xqxjxvgejnzyn7cbcour7a4zls4@kwexergrb4r2>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:29:56 +0100
X-Gm-Features: AaiRm53FfrEbIhKCGdF2hg8AGMkqY4Ryr-SuCVkuZhM1zKYQgM0hejuz-Fh9sjA
Message-ID: <CAFEp6-1QHdm_6V_t82pime7jFayCMC9D3VGny0e6jsHGk9AXJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] media: camss: csid-340: Add VC-to-interface mapping
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: oQSq7kF3-FOfvQidKZEMQx3Dk7EdcSb8
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a5ad01 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=9DD3u0_AU1_iAW09k_0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: oQSq7kF3-FOfvQidKZEMQx3Dk7EdcSb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMCBTYWx0ZWRfX41NQfpAl7KNs
 VwvIqJNMEfx2HjroCUVG6/gUHkiucXW95VcuqtxCO5THcglVoRUij7sY95IMrFX0rVNN1DAsHtj
 v/ovFfCKW2FgbD5H0d6vJBAM6PNtA0qBrNafrzeHNmHkSqvD32DT1HYPre2bwaUuDmNmEPR3trR
 yuE8SXdeYHTHSMFVrqahURIrp4Vup1QiKFJlAXWsC2pvwgLsXDEQ0uv71VRW41QDgYRfbdV7eox
 oenqS1R1hJ7+LYsbjOZ7ptfTKwLEHhc0gvQfS9LZVuMH0YIZ6u3RO2hiAE7qZ4uk/7H/Ky0fj6l
 IMBL6Yh0Mx0DCgCxrYW/pQPuiAXQHcy8ubI+5PkkCHVpDZaqw/neQ4P1Gl+P9z2e+1BsSnTEV0y
 znJj/5Zae3DIe26VUf08pVrypvCuL/UEVibp0s4gpibsRO7I89TX7KUgphDTE9B+YFyQfVk2OMx
 WwvPAv+eB0GpvVJzqYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020130
X-Rspamd-Queue-Id: 8AF0D1DBE39
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
	TAGGED_FROM(0.00)[bounces-54103-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:41=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Feb 26, 2026 at 11:15:16AM +0100, Loic Poulain wrote:
> > Hi Dmitry,
> >
> > On Thu, Feb 26, 2026 at 1:16=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Wed, Feb 25, 2026 at 04:01:19PM +0100, Loic Poulain wrote:
> > > > The CSID=E2=80=91340 block uses different register offsets for the =
PIX and RDI
> > >
> > > So, what is PIX? I asked that question at v1.
> >
> > I might be misunderstanding your point here, but yes you did ask this
> > in the v1 review, and I updated both the cover letter and the
> > subsequent commit messages in the series (mainly in 5/5) to clarify
> > what the PIX interface is. If this is still unclear, I=E2=80=99m happy =
to
> > expand the explanation further or add more context in this specific
> > commit message.
>
> I was really looking for something like (pure examples) 'like RDI, PIX
> captures raw data in Bayer format, also providing image statisics: max,
> min and average brightness' or 'unlike RDI, PIX captures debayered
> images, also providing image statistics: average brightness, max and min
> R, G and B values'.
>
> Also note, this is patch 2. It lands before patch 5. So I'd suggest
> having that definition in this patch rather than the final patch for the
> series.

Ack, will do in V3.

Thanks,
Loic

