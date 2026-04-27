Return-Path: <linux-media+bounces-59731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNlVBLfO72mBGQEAu9opvQ
	(envelope-from <linux-media+bounces-59731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 23:01:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1047A752
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 23:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 736FA300ED82
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 21:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BA03A9625;
	Mon, 27 Apr 2026 21:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp/1dL52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSvSZ3W7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08873A6B6D
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777323695; cv=pass; b=jnebvJifP1TuyG+9548SbG6dl6tXa8MswwEXFbl45+A+0JIK6hSyRD1eDjVCdqOUOerYHl2gRPcphTu/1YWtUA2eik+qJSVgnV2ShA81Tol/pJ5h3E5M0DFYyPSlVMXU9AQSdDp7Pzd/zcDFGH5Uqkifnt7D3Udbcz8nwRojiVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777323695; c=relaxed/simple;
	bh=+C4GOpYhh4aS7P7JVT1CRxfrSUiV6hkVbjF9PaKWQQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSim68S0TTIa5GGndhsn0bkq1O1Dy2SUMEsgeibzqeft5F8PGH0uGgUoA7w1Lu1ge/j9G+EPOgD/cJ0oa2gtRreMpF0Gb9pV7BHfhygQS11rLruLxagALrFpPPZApiNOlZjxeO7X2ONLBqbV8MRc0hzzNwlcQ+JH9vzXXXSWnP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp/1dL52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSvSZ3W7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RE9nmn2913944
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 21:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=; b=cp/1dL52K20USnHG
	xbiP+49+kQ33kx6K6NX65lnRHBunBRp6nvDF4IjzIJx/T8bJSXbPJgXh2SKonvI5
	yhXCkl+uOR6RvyIABH1bBk32CkE3iVKN0r2FsgHJ7eycpvuBUFzxeYPmHlrdlvBK
	A+95SBHUAnlqulwA5/pwGrRpjodDriQNbLjGx6wH4H6MoTibeiTZs3zBzFRdIxnh
	6TjGOEMw3XMw7/7NrgE2AXlHQdweqFYd6/JwJ5qqB6/cQXcFVgOp80Et1OT9qQGZ
	HvZYackOvIzvuCvMlkFeOu9Zs2JaEK19uOYS3HxMmtdnAEE299tQQC3rHtltZrpL
	lUMZ6Q==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xkcp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 21:01:32 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dce0f50eeeso13921691a34.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777323692; cv=none;
        d=google.com; s=arc-20240605;
        b=efsvJbq03Z/6jTXotMvpVQpoL+KwIJYiTXZBcHkcbWcrQX/4RetYGTGttBhv3el+Jc
         nkSv3bMUPEJb/R5zXpX+R5GIbVW2jcSdIsC0/tz873g8yFXF7F7GlqrCAvq7Kt/VeRSA
         mydFZ/MN9NF4g+sXASsa0I9bkqh1elTjO9Qymvzn6hS0hV4vy6v1Tk+f6PlDn1e4PbYw
         QF1rh9E6hgrxYvN7rPg1SZjDRZttCzbsnjvcJMdceUvOiHWghWXG0MnaCJwoX1LgxBVB
         GQgwhqHh4PdWJ1R3KzCYj+ZoJQUMg7erPiQOJQWm0ux0N94Be3PjDeMf543RLqxVGNhh
         0DeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        fh=v90j8+OdARZDrVMx6jgMrAzV7LZFWMC5njH9HvKQlEM=;
        b=WTNlQfdKxj3H6q7yDqrVF6I63DJ4tgjq8yrkOxValpgfddnZ6bA2wCTOdahnDcfZRx
         +j+5s2pag0iA7YvDDnjbAXAAuEV45rliUK48QdgV9EM/HLNZtAYX/+BLOjeBd+Uj0wTz
         umKm1WEO6CDhTNX26uq3P40MgQ0OF0+1StQS+I0qm+wTSd7QZhjpCtVLYhqmX/oU5Wh4
         i97kztJ3i1jc9MbTi4vdgCO+dtW/m5ZOvw4y/H1FHk/S/aWfpyngjGWi5eKhoQI6AXId
         lEHuqxvAnoAAS3Qz4K5Vx543TSBPMPhWZdZpJ/0smLh39ToBynjLA/3nsCV9gI+Y/4t4
         FaNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777323692; x=1777928492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        b=hSvSZ3W70lwVCeBl6POuEEIYXu5Ow80cVmKV9E8vMgm4uuG7P6i7RqPJRDcbl5ItpH
         gKKz2MkV8dhFbkez5xq8PFW7roSxF4W+MjpnACrP8wpPdes1QWS/NQd+9XDU3JJgTfBD
         DW3Sn89653Y3g5+ipDy1XIouapkZVTQJ3obS8Tmbq+FWlzOn4EcKI1OCTJEy65OAoUlM
         9i2j4f+1ivi7P2HKNR8mgzfunvLoLVp3iGNOMIzJlGU7eoZdcZfLSiiGnq4ZvOO2FTQ3
         Pvs9pNep79au4k6/T46xagPtY9iV6o/jIMbigbl6XBzAT65xDO3FQmSOSo7Q1KmtsgXM
         tyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777323692; x=1777928492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        b=OtGgEQHuDGVjBCX63vJ8bIFrSEzts/hFWgcuSEEpPzrJt5i3sCQrDaTKCkJ92+adXi
         VT+ljQwN0KPa3309j9/NWHXuVbZKvtDEgDAHTwdXvc9R0a3Pnb0ItQbsI/6EpmU4eac/
         zWTrc/XeUm2BWFEja7lTsNwDjthg0+74GGySRR21l5WKjCKoHyR8BZ3ePSjnunslNocD
         UyzOKSEf6qBLURGK/j+Wou9bQCR3Tsnl17h1Je3lwWMKM8QtEzwXXA4jvGZQkhKxQAJz
         G47pbFdf7nvEJHZr1RMljlpTQdKKWnbmJ2cRdBgrD7zcw5W/KXXsizHDtumD6YuogXxs
         BTZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DgGmcOibdca18G1wikctkG/c+ZItoRCTrbmzsphRcRGgVbcgxmJAlWRd+2gk90I5ZIsZ/XX1A3z9Eqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTp/nFvx8+mzOLHxTucKf4LbqUnFHMRzGgvbtuZD7k9CcSd/e
	0t7JEu02J17DAy+046qBtrPaKQRkKs+fogcTnNgt4tP57l7FdRFW+Q6e83mWzdIlLV6fpjJ+AVE
	SOyK9aJMaX/0TGszxGmDQnv0rfC+CrmKOYl+Lemn/3cW5hNN1ymVeiQGm6uues61CrDkBrcWTok
	oRdCnnZvhA+8/IUYPhSE4Th3UP5/v1eifhydrxThVx
X-Gm-Gg: AeBDietNj7Z/7hqEVBcqNBSRJ2BXNETIKRV/0CTlMjFuRviaDOwQb+KhvPbwrvbLUH9
	HCDZVnLrTtKAoo0x6Ej1vh4tylyb02qaZDrlgMvR4X1Rx59RNXWSlhOCWpwklCojbQ5XGXkMWPM
	IB0felWqV31KdRitJiw+6WLaLrY1g49orZKcl9KqNWGjxMhLEYZbwmPNp8jouNCZa04Voqb0uhH
	R3kTxzwX75bZ+MbQLXLGVWs+aUxlfQTVOI31oRf81pRVFnMgsM=
X-Received: by 2002:a05:6830:81ce:b0:7d7:48cc:ccdb with SMTP id 46e09a7af769-7de9a0ea40emr232049a34.19.1777323690837;
        Mon, 27 Apr 2026 14:01:30 -0700 (PDT)
X-Received: by 2002:a05:6830:81ce:b0:7d7:48cc:ccdb with SMTP id
 46e09a7af769-7de9a0ea40emr231987a34.19.1777323690349; Mon, 27 Apr 2026
 14:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
 <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com> <CAFEp6-20MzQh55iJzyhn=htFZxN1yq9o+EJJAX0CWG3O6_KSyA@mail.gmail.com>
 <20260427202523.GE3219146@killaraus.ideasonboard.com>
In-Reply-To: <20260427202523.GE3219146@killaraus.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:01:19 +0200
X-Gm-Features: AVHnY4KhboWBXcHPTL_60SWtSw-AAA7UM_3jLhGlKnmcS9RCmKJpNOXClsRGkmE
Message-ID: <CAFEp6-3yecq5oGRFFbaTCEW5Ag9JaZXjVTAT=Z2FSX20UC41Ow@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration definition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: P2JeFfE6mltBBfgXQC9UBVAR4fyX6CM9
X-Proofpoint-ORIG-GUID: P2JeFfE6mltBBfgXQC9UBVAR4fyX6CM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIyMyBTYWx0ZWRfX9vmKkSKs4sWa
 R8xmVF3eLxU32oXj5aNh7r+kJIcrz5WrNpM9yH5Ggtbza5ryYm+kRCXRJfbpXSSezA4xZ6fAtuH
 OjXTkRj+tfpY0i40pX7mSDXA4pBFJ9d5eEK7RM40xoQ6ksU0SX75qyRod5y0mGyvzBlAow6LWQd
 eqZA6ngRj7YZc94heAGkO6pY1bW/esVaYXkhfrT4AOG+JPgc3HRD9GNGt3cL5nZWoeeaAq5sAiw
 ZER6fTwWH2HTi9rVpLHouKbKvOdXv/IMG0MEUpyWK8Vd8sk9vmFXR5OxvscI0HTMSpynt0ckCiC
 bsjKYaXNQRpP31X5O+cRw9LadgaUp89jcC3qanjRelIgzMmmlbrf4THZLyc7KweVRT3MsSA0qZe
 F1wp8KEtNpP6UAtVZGXrx126Yabln2fiPrEDU2e1ggsQ3xjkuJumdLy+jb8EQAFpdZim4ePEiTk
 iJZaEW3ay9uAZYohaeg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efceac cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8
 a=EUspDBNiAAAA:8 a=By-mYhKeKzH8vs57knYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270223
X-Rspamd-Queue-Id: 48C1047A752
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59731-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,ideasonboard.com:email,mail.gmail.com:mid]

On Mon, Apr 27, 2026 at 10:25=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Apr 27, 2026 at 10:08:59PM +0200, Loic Poulain wrote:
> > On Mon, Apr 27, 2026 at 2:56=E2=80=AFPM Konrad Dybcio wrote:
> > > On 4/27/26 2:43 PM, Loic Poulain wrote:
> > > > Add the uapi header camss-config.h defining the ISP parameter
> > > > structures used by the CAMSS Offline Processing Engine (OPE) driver=
.
> > > > This includes structures for white balance, chroma enhancement and
> > > > color correction configuration.
> > > >
> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > ---
> > >
> > > [...]
> > >
> > >
> > > > +/**
> > > > + * struct camss_params_wb_gain - White Balance gains
> > > > + *
> > > > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_=
WB_GAIN
> > > > + * @g_gain:   green channel gain (15uQ10)
> > > > + * @b_gain:   blue channel gain (15uQ10)
> > > > + * @r_gain:   red channel gain (15uQ10)
> > > > + */
> > > > +struct camss_params_wb_gain {
> > > > +     struct v4l2_isp_params_block_header header;
> > > > +     __u16 g_gain;
> > > > +     __u16 b_gain;
> > > > +     __u16 r_gain;
> > > > +     __u16 _pad;
> > > > +} __attribute__((aligned(8)));
> > >
> > > Should this be __le for all of the related types?
> >
> > At the moment, this is purely a UAPI, the values are not dumped
> > directly to hardware as-is. Instead, each field is translated into one
> > or more register writes, with the appropriate math, masking and
> > shifting applied. Adding explicit endianness in the definition would
> > therefore require special handling on both user and kernel side
> > (to_le16, from_le16).
> >
> > On the other side, there are scenarios, such as platforms that rely on
> > ICP (firmware-driven processing), where we may want to forward these
> > structures directly within an HFI packet to the ICP MCU. In that
> > context, explicitly defining the endianness could make some sense...
>
> Would those be different structures, or do you envision that someone
> could develop an ICP firmware that understands these structures ?

I believe some of these structures could be reused across different
platforms and bus implementations. In particular, a given e.g. wb_gain
parameter struct could potentially be shared between OPE, ICP
(firmware=E2=80=91based), and the inline engine (IFE), with minimal
driver-side adaptation (limited to shifting and masking) or even zero
adaptation. Bryan has sent another RFC [1] defining parameter
structures and layouts that (as far as I understand) mirror the HFI
data layout, so I plan to sync with him to identify opportunities to
leverage common types or structures.

[1] https://lore.kernel.org/all/20260426000418.1158716-1-bryan.odonoghue@li=
naro.org/

