Return-Path: <linux-media+bounces-58717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE5BJbb83WkRmAkAu9opvQ
	(envelope-from <linux-media+bounces-58717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:37:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEE73F76B1
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63CEC30205F7
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D433B2FD2;
	Tue, 14 Apr 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqmPSIVg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIHXXt7m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651939E198
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155671; cv=pass; b=FDBt9yecbYT0oSGpHM2t6hYRL03j7QTD1F5M/mkLPH0pq2qLGM4Ob4ZGMt2VzWDDZTvTyZVM6w2e0HZ5RYo8Es6BAa3XHFeVN2tbMMirvRdZVCb6dn3OOdmGVYFL4kAwCzLQ6RNHQShOtlV8sgpWKxSkJROj1QKXfrUHsOlGTbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155671; c=relaxed/simple;
	bh=quoeZpS9AKOOf4qu9zzWKfm4aTlevQPlEfj8l1RZeMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaJpheouEjB8fwaGarETJjYhnBA6CEA8VyzJaM9M/Hc5Epswn7D9Qf/zBb1dOk0+Qt0GEJshzAQEoXPBWOFna1g9ncnLBk5LTs0Wd5/2e913ADcQMt9uZnm4HIp0bDbRAMDdblHzkhm8cHjrKjI1Ru3cagLxWqPnSOlXoTZ7TEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqmPSIVg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIHXXt7m; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6dv4w1479154
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhEvdbsHR57v0mmuvZmus8ZQjS/kzTDRegQ3zA3AJz8=; b=MqmPSIVgVuO6JVPz
	dopiPQ+ZS32wLDnmd+QQVCUIRH+wH4ql0x2ghvUPmOehgFtna7UYH5YfFvEmIZX6
	qZibtXxCCnBLZeDtmZAZOAbDAEAkA4UpF0TCff8OUHIfxn/pxRLDnKXYrUOu3kzk
	/9+uYxAK4goU04YgNfQqLRFaTLN3WOOZ2Uojn3VB540nPumSiPoAxnM1pRgL/E6B
	Mxcar1UOXqjbt6oPwuqTErYpzAcwMpgp0pxPlqA+FdA2BW9+z8q/EMDWonk6a5dU
	8Zv6SE1I6jESR9Oo6fCLgx0QZL8yKTwujYUDy6iTiW8cXb0pHnoreDrAMD+LDBBt
	aq2Dmw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j1tgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:34:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca6420fe3so81058216d6.0
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 01:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776155667; cv=none;
        d=google.com; s=arc-20240605;
        b=I5NHqRlcT0DjjPG7vPz7bhfsVXAS909Ahi4mbkkY4ownFjlcQlWIE+itO8q+WLtFSi
         OefVCksohLQUk4B54yNUGRJm5gGIUc+l9VtdBaEN6VmEo4AJCHWWztve2Diq0vC+B9Mw
         BOApG4RDbng0Ub0pCLl3UcbgoUNAUYXqc9FRfE399JYvOCSJPton/tIX37hJGEJMLUyU
         vXpcxDhKw34n/lZ75E3XP620sZYEH73UyH0yf7Sb4SAi83HrRYUyaU8eTlwpc76I2BDQ
         4PjznERmniSXubcQ8Ew7ft/WDd+/F+VDgQSgMSZYfK/VKrb7YBfGRhaRDT4qcEyznVFq
         j18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AhEvdbsHR57v0mmuvZmus8ZQjS/kzTDRegQ3zA3AJz8=;
        fh=J5nTaputaDv/KJo3ZxtofYhOqRiePXhNyq1NqGbZ1/E=;
        b=d5eXG5N5UNLA0VQRUUcpl+uYMqkXcpTmxesjBHYc91XIHXVtMwRPUGECyqXbtAkZdm
         2LhozW2EYCRhWhrn9X0D7xyRYHGm71sRsMSzqeG4vRdGmoS/wLPiGaoJcdV9+/5WSb6M
         d2gxh+6JkZfSYeLY9bLclnXP5zT4uQr2b6dESuB6jxBG+5c0CvCbhYNx7aUBMkEPzncF
         pNJvHA+5QtO/xuyoYix5Nse9CS24bY9v+AfDwe/P+mbUAJQ3jXUelDKx1hNCJC2qV0Ls
         Ukk+MIaY6pcVBcnuMh4/HqIc2K8LTYDXp6pcPs/lbK9TjeBQeWB9dwfY81deTevJaThb
         Zxog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155667; x=1776760467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhEvdbsHR57v0mmuvZmus8ZQjS/kzTDRegQ3zA3AJz8=;
        b=fIHXXt7mmqWGt1vjuCNH7W86CCh2RYXt2HRCG121iWeyoJmE0L4Kb/uashg6e2V6tO
         aCUNf0SJX0rnsRGDKLZfPHQtLFta1Hf3AEgI2Q26Suc9NQlbuSHhC3rc6J/adRoxv95n
         4fwW7anrrr1QD8LTIbxQPHe5bVvg3O9Vll0rWWQCTkPuuaAA4Vl5a48jiauEFn+SSjUy
         qivGgGDjBsP9C6fXO7kfccwnVEBn9xE+bJyMUck3P416Nc/oHUXEChyyUx8C9zVCgLWq
         vWGL1fXyReVySnX4cD5sIVR3OObRn4F0rsyO6o9eumd0Zixm5gihlC5yErR3zqtKHOxB
         wUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155667; x=1776760467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AhEvdbsHR57v0mmuvZmus8ZQjS/kzTDRegQ3zA3AJz8=;
        b=AJJLk9J5ikJpxpgDxzh0DN5kVCw/H6QUfAUB5YGF/v29rsqHr+JOLkdYPy82uyjHoT
         yEBm3gTyqd0r2MTrJPyHq77OqikX26e0daHDd7EgGLolfdlPc7Y/P+jKVF+SZzyUBDml
         ATRKT71ZgAbtiBYmbH9l50MOq3QMhR4/6GZqkkvIGlvNrspRWKATobm2RdIms95sTBL0
         YhriFGVvfVK3ZTm1pWmM5PtE1rCoh1DGYelaBl8TkxY/XRcvfMLtbK9wC8m3iEOR4PGS
         K2G6YWFxBBg4fWRJfqAqOAMgM1GUIauAlq1EB5b8EPEH8Js1MaK6sogIpKha98YkvfEF
         +s1g==
X-Forwarded-Encrypted: i=1; AFNElJ9nU688T1+fN2fBBqCB53TitYTvcDKv3/PWsoFJc2bBnzPcSnKcJJr/yIzKzWg0CfTf/yIJ6ssSsrVSKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLG++nsLPeV4mb8wrF/ED8Z+qfu3x/ne/k8kI7fxcSyGnWe0BI
	zWcoxZimrN9yUWqyXV6Ok/sKzi/JV/CtWFTqPHnMR/DiF4n+xr3Mc1G6zRtirXIThTb0t4o4OTw
	rzLZZEltPBDTpCXIRZK4W6N6HXgDHDBj/FICK1LQxq1jOWghQFeIIUVE+GFHVI6RDRhWZCUXNfI
	BIjnhkz1P2w6AW8+iQIh7BiClvVG0YnFMj7v7QET0i
X-Gm-Gg: AeBDievCrGB5Bnr4oHSlDMqFJkwumdn9+XCguluv2vowxUlbHiWbCWOyn8GvQOkSYlh
	+eA9LiBGsyV3T64B6hMB6DqoFhsvVFQvqETf2T5zGmnqGPtZaRrkRu4kPrhK1wgZQeJ+k/Ce9Ay
	SU+8SObfVQ+g0EVXJmqScmvf0L6Yu3zNmvqKW2x6QlU4MN2fDw5U2iDkxr3Ggc/f6LL383obd4y
	Exz56Cn5ByloPvezfbeabfW0RrwF7+Qa2TBoHY=
X-Received: by 2002:a0c:f116:0:b0:8a5:104b:e38e with SMTP id 6a1803df08f44-8ac862a497dmr216884376d6.38.1776155667056;
        Tue, 14 Apr 2026 01:34:27 -0700 (PDT)
X-Received: by 2002:a0c:f116:0:b0:8a5:104b:e38e with SMTP id
 6a1803df08f44-8ac862a497dmr216883746d6.38.1776155666341; Tue, 14 Apr 2026
 01:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
 <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
 <20260413201907.GD4034@killaraus.ideasonboard.com> <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
 <20260413211602.GE4034@killaraus.ideasonboard.com> <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com> <20260414074230.GB4061@killaraus.ideasonboard.com>
In-Reply-To: <20260414074230.GB4061@killaraus.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:34:13 +0200
X-Gm-Features: AQROBzB7CRaNNGrbPpU5JuMrwvVgFSWxvR_rAbjdjA54ygaqgY3dTX327u_pGc8
Message-ID: <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Brandon Brnich <b-brnich@ti.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
        Devarsh Thakkar <devarsht@ti.com>,
        Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        "Padhi, Beleswar" <b-padhi@ti.com>,
        "Donadkar, Rishikesh" <r-donadkar@ti.com>,
        Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7FONk3l97288zfl19PN-9NrPQAl4Lwg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OSBTYWx0ZWRfX64RgesO1Bp1G
 XipRdxrxSz+XKf9of8Ri9CPu+SpztIuFIws1KGywZbPJE6vaZnhyrFoIal2Ad1En4qFiDnXmKuN
 +dQNx30ZcsKsrLhTUS61uXtr3tZCDo+sM9yjppJKgZ4AF63uXOmu6beN5HS+SCDwvUlI3jsbSyq
 UMO7wjg3F8AIt9wcA1mxOZGYpO4LmGBkadMVQ95DyHce0xRK15N26fM8mFeD0SGSBz3UBy531A1
 t7FFzF5WEDBLe2sPdDDSuLMZEXWKqoSEscQ5f9IebD9Bh3OVG7jSJ53qgKZqbNvrEQ6E4ob6ePJ
 7ussr9Nkzf3RWCZ4d3dM+wlHTxW30cC3NkCbbsrJ0Wz37fX9O498hLgOUB6pnOCzmZr5YYQh9Ey
 5qTncEFMJaoEjVX4ZkLxv7jFWetPRzZjuT8JlOEHlls/uEw1qUay2b4tGArpBG4xJzNVPQFdFT6
 eY+VtprqQs4E1ouNMEw==
X-Proofpoint-ORIG-GUID: 7FONk3l97288zfl19PN-9NrPQAl4Lwg_
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69ddfc14 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=8s3bVdB6AAAA:8 a=VwnfekaSAAAA:8
 a=VwQbUJbxAAAA:8 a=WN6_cwnCAAAA:8 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8
 a=sozttTNsAAAA:8 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=8b9GpE9nAAAA:8
 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=PssDBZGIAAAA:8 a=RF00TdSWAAAA:8
 a=QG0QK_M6g1mMxSHqvCQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=mX_46NTfp5VFrLZRzBmZ:22 a=eAomlcYGng2R2mZ923rV:22 a=ndfOWLLM0rR49n6Yv1rF:22
 a=D0XLA9XvdZm18NrgonBM:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=HJRSn2hXXqGixlvEXVkw:22 a=_nx8FpPT0le-2JWwMI5O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58717-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0CEE73F76B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 9:42=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 14, 2026 at 09:20:56AM +0200, Michael Riesch wrote:
> > On 4/14/26 08:55, Ricardo Ribalda wrote:
> > > On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+cisco@kernel.org=
> wrote:
> > >> On 13/04/2026 23:16, Laurent Pinchart wrote:
> > >>> On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas Dufresne wrote:
> > >>>> Le lundi 13 avril 2026 =C3=A0 23:19 +0300, Laurent Pinchart a =C3=
=A9crit :
> > >>>>> On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulain wrote:
> > >>>>>> Hi Hans,
> > >>>>>>
> > >>>>>> I would be happy to discuss this if a slot is available:
> > >>>>>>
> > >>>>>> Title: Generic V4L2 ISP M2M framework
> > >>>>>> Presenter: Loic Poulain
> > >>>>>> Time estimate: ~20min
> > >>>>>> Description: During early development of a Qualcomm Offline Imag=
e
> > >>>>>> Processing Engine (OPE), we relied on the V4L2 memory=E2=80=91to=
=E2=80=91memory
> > >>>>>> (v4l2=E2=80=91m2m) framework, which is widely used and provides =
solid support
> > >>>>>> for buffer management and scheduling. However, applying it to an=
 ISP
> > >>>>>> use case exposes limitations: ISP engines often require a richer=
 media
> > >>>>>> graph, with multiple pads and metadata flows, similar to inline =
ISP
> > >>>>>> pipelines (params, stats, outputs). This talk proposes discussin=
g the
> > >>>>>> need for and design of a common V4L2 ISP M2M framework to factor=
 out
> > >>>>>> shared functionality across drivers, particularly around buffer/=
queue
> > >>>>>> management and job scheduling.
> >
> > It seems that we share some pain points.. :-) :-/
> >
> > Over the last year, some ideas have been brewing in my mind. Not
> > necessarily *my* ideas, mind you, rather ideas that have been around in
> > linux-media for quite a while, actually. What I would like to prepare
> > for the Media Summit goes along the same lines.
> >
> > >>>>> That's well aligned with the v4l2-isp framework that Jacopo start=
ed, and
> > >>>>> to the multi-context and media-jobs APIs that we have proposed. I
> > >>>>> wonder, however, if a short session at the media summit will be e=
nough,
> > >>>>> or if we should try to organize a half day brainstorming workshop=
 at
> > >>>>> some point. Depending on when the people interested in this topic=
 plan
> > >>>>> to arrive, Monday could be an option.
> > >>>>
> > >>>> I'm also/still interested in the multi-context for m2m decoders th=
at have inline
> > >>>> post-processing capabilities (current model forces us to waste a l=
ot of RAM). We
> > >>>> just restarted some design discussion with the team, with an incre=
ased
> > >>>> confidence that multi-context is the way. The scheduler could come=
 handy in the
> > >>>> future if we get to deal with more multi-stage codecs in the futur=
e. I'll be in
> > >>>> Nice all day Monday.
> > >>>
> > >>> I will unfortunately be available only until 15:00 on Monday, but J=
acopo
> > >>> should be available through the day. Let's see who would be interes=
ted
> > >>> and available, and try to organize something.
> > >>
> > >> I'm available on Monday as well. I think this is a topic that is wel=
l suited
> > >> to a brainstorm session.
> > >
> > > I am also available on Monday and would like to attend the session.
> >
> > I'd be interested too. Right now the plan is to arrive on Monday
> > afternoon. Depending on what time you agree on it may work out anyway.
> > It would be great to know the exact time this session will start (as I
> > might need to adjust my travel arrangements).

I can arrive on Monday, with a preference for the afternoon.

>
> We need a volunteer to organize this, as in finding and booking a
> meeting space. Note that Monday is a public holiday in France (Monday
> the 25th of May in particular, not all Mondays).
>
> If the number of attendees was small I was thinking of hosting the event
> in the place where the Ideas on Board team will be staying, but it looks
> like we're already reaching a fair number of people.
>
> > > Regards!
> > >
> > >> The agenda for the media summit is getting quite full, and I agree w=
ith Laurent
> > >> that 20 minutes is likely not enough. If we can so a session on Mond=
ay instead,
> > >> then that would be a good solution.
> >
> > Apart from the time and date the scope of this session would be interes=
ting.
> >
> > Will this be a birds of a feather session in which the next generation
> > kernel ISP framework will be discussed? Or even the next generation
> > kernel video processing framework, where video processing is image
> > signal processing, encoding/decoding, 2D graphics processing (fisheye
> > correction units, 2D GPU such as the Rockchip RGA3, ...)?
>
> I would focus on Loic's original scope. If the solution can be used for
> other devices that's great too. I believe that the current multi-context
> patch series is a good fit for codecs. If we broaden the scope too much
> right away we'll achieve nothing.
>
> > >> I have never been very enthusiastic about the m2m framework: it's fi=
ne for e.g.
> > >> simple scalers, but it's awkward to use for codecs let alone ISPs.
> > >>
> > >> I always felt that we really need variants of the m2m framework that=
 are customized
> > >> to specific use-cases: i.e. a codec m2m framework, and (perhaps) an =
ISP m2m framework.
> > >>
> > >> The big problem with that is of course who will do the work. Making =
new frameworks
> > >> is difficult and takes a long time.

A couple of weeks ago, I submitted an initial driver for a Qualcomm
Offline ISP based on the standard v4l2-m2m framework. Following
discussions around which parts could be generalized, I started
migrating this work to a new v4l2-isp-m2m framework:
(https://github.com/loicpoulain/linux/commit/5d575d7eff8f2371e91d8237148ffd=
b44b0af5b0).

The API and overall logic closely mirror v4l2-m2m.c, but are extended
to address ISP=E2=80=91specific requirements such as multi=E2=80=91device s=
upport and
multiple queue handling. I am planning to submit this work as an RFC
before the Media Summit. At this stage, the framework is still fairly
basic and primarily tailored to the Qualcomm use case. There is
definitely room for improvement, for example, integrating Jacopo=E2=80=99s
multi=E2=80=91context support, since for now, the Qualcomm driver simply
instantiates a single ISP=E2=80=91M2M context.

As I am still getting familiar with the media subsystem, this work may
overlap with or conflict with ongoing efforts. Synchronizing seems
indeed important. Based on my current understanding, there are several
related areas of work that appear either complementary or orthogonal:
- Multi=E2=80=91context support, to instantiate multiple processing session=
s
on shared hardware/driver.
- Media jobs, to synchronize work across multiple drivers within the
same media pipeline.
- ISP M2M, aiming to provide a v4l2-m2m=E2=80=91like framework specifically
for memory=E2=80=91to=E2=80=91memory ISP devices.

> >
> > This may be naive and overly optimistic, but I feel there is quite a
> > number of people sharing the same pain points (which are similar to
> > those Loic pointed out). Maybe (hopefully) this birds of a feather
> > session leads to the formation of some work group?
> >
> > >>>>>> On Sun, Apr 12, 2026 at 12:25=E2=80=AFPM Hans Verkuil wrote:
> > >>>>>>>
> > >>>>>>> (Please pass this on to anyone you think might be interested in=
 this!)
> > >>>>>>>
> > >>>>>>> Hi all,
> > >>>>>>>
> > >>>>>>> This is the fourth version of this announcement, updating the l=
ist of attendees
> > >>>>>>> and the tentative agenda at the end: please let me know if you =
see mistakes.
> > >>>>>>> Note that there is still time for one or two other topics. Also=
 please check
> > >>>>>>> the agenda if you need more (or perhaps less) time for your top=
ic.
> > >>>>>>>
> > >>>>>>> This year's Media Summit will be held on Tuesday May 26th the d=
ay before the
> > >>>>>>> Embedded Recipes Conference in Nice, France:
> > >>>>>>>
> > >>>>>>> https://embedded-recipes.org/2026/
> > >>>>>>>
> > >>>>>>> The Media Summit will be held at Hotel Campanile and in the sam=
e meeting room
> > >>>>>>> as last year (Nikaia):
> > >>>>>>>
> > >>>>>>> https://nice-aeroport.campanile.com/en-us/
> > >>>>>>>
> > >>>>>>> It is close to the Airport and to the Embedded Recipes venue.
> > >>>>>>>
> > >>>>>>> The meeting room can hold up to 30 people and I will provide vi=
deo conferencing support,
> > >>>>>>> just like last year. The location and the meeting room was quit=
e nice last year, so
> > >>>>>>> I saw no need to change it.
> > >>>>>>>
> > >>>>>>> That said, in-person participation is very much preferred. This=
 yearly summit is meant
> > >>>>>>> for active media developers to meet face-to-face and to discuss=
 media subsystem issues.
> > >>>>>>>
> > >>>>>>> And it is also a good opportunity to talk to each other during =
the Embedded Recipes
> > >>>>>>> conference to discuss topics in a smaller group. But if you are=
 an active media developer
> > >>>>>>> and are really not able to attend in person, then remote partic=
ipation is an option.
> > >>>>>>>
> > >>>>>>> If you want to attend the meeting (either in person or remote),=
 then send an email to me
> > >>>>>>> directly. The deadline for in-person attendance is May 14 as th=
e hotel needs to know the
> > >>>>>>> final number of attendees by then.
> > >>>>>>>
> > >>>>>>> There is no registration fee, the meeting room is sponsored by =
Cisco and Collabora, and
> > >>>>>>> the lunch is sponsored by Ideas on Board! Many thanks to our sp=
onsors, it's very much
> > >>>>>>> appreciated.
> > >>>>>>>
> > >>>>>>> If you have a topic that you want to discuss, just 'Reply All' =
to this announcement
> > >>>>>>> and give the topic title, a short description and a guesstimate=
 of the time you need
> > >>>>>>> for your topic.
> > >>>>>>>
> > >>>>>>> See last year's Media Summit Report as an example of what to ex=
pect:
> > >>>>>>>
> > >>>>>>> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1=
ad089298d@jjverkuil.nl/
> > >>>>>>>
> > >>>>>>> Regards,
> > >>>>>>>
> > >>>>>>>         Hans
> > >>>>>>>
> > >>>>>>> PS: Be aware that May 24 and 25 are public holidays in France. =
So many
> > >>>>>>> shops may be
> > >>>>>>> closed those days.
> > >>>>>>>
> > >>>>>>> In-person attendees:
> > >>>>>>> Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>>>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
> > >>>>>>> Brandon Brnich <b-brnich@ti.com>
> > >>>>>>> Rouven Czerwinski <rouven.czerwinski@linaro.org>
> > >>>>>>> Mehdi Djait <mehdi.djait@linux.intel.com>
> > >>>>>>> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>>>>>> Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > >>>>>>> Marco Felsch <m.felsch@pengutronix.de>
> > >>>>>>> Paul Kocialkowski <paulk@sys-base.io>
> > >>>>>>> Jai Luthra <jai.luthra@ideasonboard.com>
> > >>>>>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >>>>>>> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > >>>>>>> Beleswar Padhi <b-padhi@ti.com>
> > >>>>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>>>>>> Loic Poulain <loic.poulain@oss.qualcomm.com>
> > >>>>>>> Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > >>>>>>> Ricardo Ribalda <ribalda@chromium.org>
> > >>>>>>> Michael Riesch <michael.riesch@collabora.com>
> > >>>>>>> Devarsh Thakkar <devarsht@ti.com>
> > >>>>>>> Michael Tretter <m.tretter@pengutronix.de>
> > >>>>>>> Hans Verkuil <hverkuil@kernel.org>
> > >>>>>>>
> > >>>>>>> Remote attendees:
> > >>>>>>> Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > >>>>>>> Rishikesh Donadkar <r-donadkar@ti.com>
> > >>>>>>> Jackson Lee <jackson.lee@chipsnmedia.com>
> > >>>>>>> Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
> > >>>>>>>
> > >>>>>>>
> > >>>>>>> Agenda (tentative):
> > >>>>>>>
> > >>>>>>> 8:45-9:20: Arrive, settle in
> > >>>>>>>
> > >>>>>>> 9:20-9:30: Short intro (Hans Verkuil)
> > >>>>>>>
> > >>>>>>> 9:30-9:45: Status of ISP support in V4L2
> > >>>>>>>         Presenter: Laurent Pinchart
> > >>>>>>>         Description: Summary of ISP-related development in V4L2=
 since the last
> > >>>>>>>         Linux Media Summit. This includes a brief overview of t=
echnical
> > >>>>>>>         developments, and a summary of the efforts to engage wi=
th vendors.
> > >>>>>>>
> > >>>>>>> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
> > >>>>>>>         Presenter: Paul Kocialkowski
> > >>>>>>>         Description: An update on the ongonig work to support s=
tateless codecs in V4L2.
> > >>>>>>>         Some of the remaining open topics will be presented and=
 discussed.
> > >>>>>>>
> > >>>>>>> 10:45-11:00: break
> > >>>>>>>
> > >>>>>>> 11:00-11:30: Vulkan Video Codecs
> > >>>>>>>         Presenter: Nicolas Dufresne
> > >>>>>>>         Description: Vulkan video codecs: what are the viable o=
ptions for Linux Media
> > >>>>>>>         and what is in preparation outside of our subsystem. Th=
e second aspect is
> > >>>>>>>         informative as these discussions don't seem to lean tow=
ard our subsystem as the
> > >>>>>>>         foundation. But I think it's rather useful for everyone=
 to understand why and
> > >>>>>>>         what is included.
> > >>>>>>>
> > >>>>>>> 11:30-12:00: Protected Video playback on i.MX8MQ
> > >>>>>>>         Presenter: Rouven Czerwinski
> > >>>>>>>         Description: Introduction to protected video playback
> > >>>>>>>         on i.MX8MQ and missing bits for linux-media & protected=
 heap interoperability.
> > >>>>>>>
> > >>>>>>> 12:00-13:30: Lunch
> > >>>>>>>
> > >>>>>>> 13:30-14:00: HDCP support for HDMI receivers
> > >>>>>>>         Presenter: Hans Verkuil
> > >>>>>>>         Description: I have been working on adding HDCP support=
 for HDMI receivers.
> > >>>>>>>         Specifically the HDCP negotiation between sources and s=
inks.
> > >>>>>>>
> > >>>>>>> 14:00-14:30: AI patches
> > >>>>>>>         Presenter: Sakari Ailus
> > >>>>>>>         Description: What is our policy w.r.t. AI generated pat=
ches?
> > >>>>>>>
> > >>>>>>> 14:30-15:00 Overview of Media CI: where do pipelines run?
> > >>>>>>>         Presenter: Ricardo Ribalda
> > >>>>>>>         Description: How are jobs in pipelines assigned? How do=
es the infrastructure
> > >>>>>>>         for Media CI work? Are there things that can be tweaked=
 to make it more
> > >>>>>>>         reliable?
> > >>>>>>>
> > >>>>>>> 15:00-15:15: Break
> > >>>>>>>
> > >>>>>>> 15:15-16:15: Discussion of the media subsystem development proc=
ess
> > >>>>>>>         Presenter: Hans Verkuil
> > >>>>>>>         Description: Review of the multi-committer model: curre=
nt status and next steps.
> > >>>>>>>         Are there any bottlenecks, any ideas for improvements, =
w.r.t. the development process?
> > >>>>>>>
> > >>>>>>> As you can see, there is still some available time for other to=
pics.

Regards,
Loic

