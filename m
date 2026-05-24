Return-Path: <linux-media+bounces-62684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lu6OGasGE2oW6QYAu9opvQ
	(envelope-from <linux-media+bounces-62684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 16:09:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8825C2A92
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 16:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FCCC300360B
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 14:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC943955DE;
	Sun, 24 May 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eY1cRCnw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cts951Cn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0015E14AD0D
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779631784; cv=pass; b=dZP2XBC0abHV3418dxNkrJ5gtO82XmA2vhmh9+T1GF5llUro/zrEKevsZRjjXr/hzN5L5mPguGR0nsOiXfVN0xqRcoNVvKnhZbshSyA0+GehEs4qhNvSrIS1GiFIzf+VHoX4IqfuTTEtT+23mG8SsF3JTHpii69Gm2ugvP8waAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779631784; c=relaxed/simple;
	bh=m8vqaJK9+SzbqYBdh4RpQ50xEUBZaBII0VP/SlFo3Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Imu1GaCM/VrCNY/lPP92C4ntrXNKGmqomLXblA2HoXD6cIdH7mpwIRenLXY8m+P70L5ip97ZEbguRKwpEpaPkIUpJLAcRMgnLJlG03/4Aami/FO/OqBampTqR9tycyHV13z3fXz3a1gDAZQmYYIR0IbYdR7gmEU43lRAUi2wDtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eY1cRCnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cts951Cn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O1EujE3255966
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 14:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8vqaJK9+SzbqYBdh4RpQ50xEUBZaBII0VP/SlFo3Tc=; b=eY1cRCnwK2GHs/uj
	pcEGgf9Hbw95UICHCUzEiEcgtKuJH8fwZHlZsIhY89ZbYGzedaiZ+rvdZiotFhSR
	Hk5YDYTt3GoEb9coPjcXPRRvMZ8gUiOYNzQztWvPp+0nsSr6nT0Bt9teJtcCrQTb
	kABX68tHhvf97auAW1Miz1grvNCLQufuy/HhqjzJKlZKLe286Dy/93t2AzBUUMdO
	dgFPNmtmerL2+glDT8CHIQ9Py1vijEoJEzcTr8sjFUoG0uQG6kXOupJXUb9/hJD/
	EQe0aZgkhkPZlQ4AwMApBc5z6aX8rVjjrUgK8q/0ozocVZDRd5mfXuysPseEMzZ6
	URTfTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txkbsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 14:09:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914be3ed6caso90419285a.1
        for <linux-media@vger.kernel.org>; Sun, 24 May 2026 07:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779631779; cv=none;
        d=google.com; s=arc-20240605;
        b=c4oteu3kIS1FBZMNxCKDabj1tPvkgWT4UOfJ2500oOkGxTJuBnTms9hfyJI7FTp+Wm
         m1LkhxUb5atlKl7jGQSqbGUrZu9dUUmFDOWg53bAhw1hlNXOLSNyf5u0VOMwlfJ1T0M0
         lQ/VTzpuRoY5OHvEKu1FgzQrp1PlpsAfpi/oNgeDBb+2gshRGKSnJGXOOcyTArJac2mt
         oI8yr/KZu4MxI/7BP5OV7or1rfWLs7bvyGUJYVh5wgQ0QvbzaOZH9ADZ/2Pu6KWOJ5fM
         XJdXYOm3/+5RdNIt0yuFnfHhMf5CWlOb8UiZVnt8XlkiWm1l6PjkxZLiWKW9xLk1iN/s
         /TKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m8vqaJK9+SzbqYBdh4RpQ50xEUBZaBII0VP/SlFo3Tc=;
        fh=fbxi8+G0rBplsRvBDj02Kw4lcmgVEwV78gaLuYLAJqU=;
        b=hYb1A2xwh/dyww0qvvRlG0KKKYGLK4DdmSHyp8tHRiGxuzr0ybjJvhhLerUnJnajZu
         tdZ3mdr7wds5ylC7I5lbpv4fTJ6+q1A4/2LuRC3D3XlBVvlyFv/35xChM3LoJvP675zA
         6jMEw9iRwnQv0z4bMxlMeQ+cI0Nw5rSZP+tNlRGNDnG5vqs2ZrMJFD+rAszcdwf4F5b1
         tFDvsOc17pL5E1zxKP5sVyclAXFV3lJZSoF7HavSDw9BIDep6DqCl6f1Ae8aQb4GAhg/
         4W8LiQWx/ELSBpZLwbndtVK3zY1woMMGNQrkO5hvaMuC+6+wqdzEWeg4E1iu/ipdIpTa
         BLZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779631779; x=1780236579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8vqaJK9+SzbqYBdh4RpQ50xEUBZaBII0VP/SlFo3Tc=;
        b=Cts951CniQIaED7u2HGser6V8bHr0mlpjsCqBE5OS3vIJ0c+lWiaV2jUDoQ26VnFQu
         rDYddixzpG70rNE3ZVE+kOK6ecZHVwndSGR94TaK/nXPqyzd5lmbvHF5OQX9Tu3APB2X
         LdHGGrYxFD+P1a9Scom7V4cqeihwG+MOlXVpRcwPhE1hZYBmE2ui/JSz+CAXZw0uBr2n
         g9dH/V48xS08pKTXWq31II2AdlLfDa7jRTU4Agr6eBI+fsDT55H9QDW9wEBEAWGdkN9a
         tBuL7HrsBssEnBD89CFAnZTEby+C5wi6AP7Aa46yIZVqiN8jzw7Am0IHHNV0yM3P9njl
         tluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779631779; x=1780236579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m8vqaJK9+SzbqYBdh4RpQ50xEUBZaBII0VP/SlFo3Tc=;
        b=AD2j8/MQ3wj1qC+lgWyyic5g71RVxD0YpddbDZkX2UFQYCLKVAciOW51XqYLsVyOFK
         8lP16lHTWQykn6dMJeJW2eHtETUOF6yGqWbpjv14B31qPYaJyU4XwLolVtI08J3YKQDD
         uDDiK6Qfyw82NS/NiziO5+QvQwU1WWNSx3EznDY3IRCYWkqdbocFnUT7R2Yg5P/mtaO7
         ax7iyGB8Rzi1UGCmVdLj1+zP6KJqPF5SJLI16emw8BRMxfGm7rN+zOEFNNywt76np9wb
         lvjmDxfvZPt8zrPTsBUOSwaDFP1sbEcfGaoXY6Tz2x5XG7Fbr+NEJKbYqop4bchcLbL4
         c/nQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eIFqo2UL/tkS4E2HEGxTYOufcx4aSeZIOAHvoFfsPzeVOpHUWMHyWtlfK6Nv4pK9QIavlVb839WJK4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPgNu+dvpPOQ1NhsEsRPmLXTT7slvHwoTVb+i6yj2iqw90uOHq
	T+gYxtzyVZhUFip8zGqAnoyEAKs71QO24U1LF47yApx4RKZUOS/187UeXyCs0QGdCT37LE8Rqgm
	4xHuhMrgfQjR2xT3bleIN4wnEJ2o4fnTj7etptp473kKRygswH6/x2fILqIlVhDcPFBHTBeedm+
	1i2TotCsiEwrL7XRf9Lh5PJz4gifGM3iAhWVViJGL1
X-Gm-Gg: Acq92OENmKY763uoJxS4e9nMIgfBo840EMYTq7gQ9eUrXhrpZzoIP/+EzDfOSIARr6p
	L+AVc/ifXxKUJY68ZcvTCHSuZygryna4xuRy0EVvvVD0xkdfpa2jopAAXwIJvr+9/Ze9dz7rnDB
	0jXRTvcSJG6AP5HeO1PqZ9BpVcw4old1pZjPoRGMNGz03XqYvdwjzvzyl7PBQRz5j3XWzLytCKm
	I9K2zGKi4pWpMRGWgASQss0jHMw3lPj1C9B2kJ4s/BX937HWQ/yKM02Gcl81ToqoqWO
X-Received: by 2002:a05:620a:6504:b0:913:e19b:2f56 with SMTP id af79cd13be357-914b48b5d26mr1704797185a.10.1779631779036;
        Sun, 24 May 2026 07:09:39 -0700 (PDT)
X-Received: by 2002:a05:620a:6504:b0:913:e19b:2f56 with SMTP id
 af79cd13be357-914b48b5d26mr1704788385a.10.1779631778502; Sun, 24 May 2026
 07:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com> <20260414074230.GB4061@killaraus.ideasonboard.com>
 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
 <20260414084259.GC4061@killaraus.ideasonboard.com> <afCmQhSbQLDb6gvo@zed>
 <77ea77b9-5503-40b2-882b-e96e30028c43@kernel.org> <1182ce00f1c55cf28e13e6eb4f2e018b52a8f6a8.camel@collabora.com>
 <CAFEp6-1pA6v7P-ZrOD+iEGfq5Dv0CZ_CLiZ5u35tutQ6zAPqWA@mail.gmail.com> <ahC1Ec_CA0tq3PtX@zed>
In-Reply-To: <ahC1Ec_CA0tq3PtX@zed>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 24 May 2026 16:09:27 +0200
X-Gm-Features: AVHnY4JkuLIEds7freOzDv9wLdCueqbvG6rLFCwZfxfCndyvV5YygDvvKDiHVkI
Message-ID: <CAFEp6-2OUm2sPbMZ3JXEcOqS6hu+Sat4CNZGAanqdvH6g_r1XQ@mail.gmail.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
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
        Rouven Czerwinski <rouven.czerwinski@linaro.org>,
        Nayden Kanchev <Nayden.Kanchev@arm.com>,
        Konstantin Babin <Konstantin.Babin@arm.com>,
        Anthony McGivern <Anthony.McGivern@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE0MyBTYWx0ZWRfX/2Qzq98aC+1U
 MHaM3aqGQS7eMvbagkWSXCdkjIXDT6ifx39gIzfJ4TE/Wy5/VkV/2uGWxFBZVIzMNcYQZiaO8B/
 /vKie6iRmuvqdtXu6LXzNuOWMMpth0EBPE2TNvGFoyE/5UzdqrEzUhNLfJobb+i9YeoKhTvxPw5
 sKCj3qy/xVnwXQxOkEUrRlgJpKnbpPk7A7Wwm8YYY9puYFBOH4l/SKW2pp/ofg5tVpDIcFu92PH
 KURvk4kUdjZP27LhhplYxVo69azuGf3diB3esW6jHN0g2odM3vpPM/G/QSVC1mkmVBKLGbmPert
 8y5TSgPCVCywfle2JTlmwCtto+bwGWJUJwwhO006W4fKpRx+RunKGKn7j4aQY8/vbf/ItWsD3F8
 76Hk82xUkNHmeQIphM3pHQehE5MXS6/7sy+ukMaVrESOjJT6L8SBzvt4/2gP77DX5OfWN2LdRWx
 7t0Dv7DYBnAckC/CPYg==
X-Proofpoint-GUID: QExjpVCiT8RaEiigr9FRuYscwJ6q22cQ
X-Proofpoint-ORIG-GUID: QExjpVCiT8RaEiigr9FRuYscwJ6q22cQ
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a1306a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=P1BnusSwAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=RJ3MrWEoEXg8LklhtMsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=D0XLA9XvdZm18NrgonBM:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240143
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62684-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,collabora.com:email,ideasonboard.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: EF8825C2A92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:10=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Loic
>
> On Fri, May 22, 2026 at 09:49:34PM +0200, Loic Poulain wrote:
> > Hi Folks,
> >
> > On Tue, Apr 28, 2026 at 7:55=E2=80=AFPM Nicolas Dufresne
> > <nicolas.dufresne@collabora.com> wrote:
> > >
> > > Le mardi 28 avril 2026 =C3=A0 15:00 +0200, Hans Verkuil a =C3=A9crit =
:
> > > > On 4/28/26 14:30, Jacopo Mondi wrote:
> > > > > Hello
> > > > >
> > > > > On Tue, Apr 14, 2026 at 11:42:59AM +0300, Laurent Pinchart wrote:
> > > > > > On Tue, Apr 14, 2026 at 10:34:13AM +0200, Loic Poulain wrote:
> > > > > > > On Tue, Apr 14, 2026 at 9:42=E2=80=AFAM Laurent Pinchart wrot=
e:
> > > > > > > > On Tue, Apr 14, 2026 at 09:20:56AM +0200, Michael Riesch wr=
ote:
> > > > > > > > > On 4/14/26 08:55, Ricardo Ribalda wrote:
> > > > > > > > > > On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+ci=
sco@kernel.org> wrote:
> > > > > > > > > > > On 13/04/2026 23:16, Laurent Pinchart wrote:
> > > > > > > > > > > > On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas D=
ufresne wrote:
> > > > > > > > > > > > > Le lundi 13 avril 2026 =C3=A0 23:19 +0300, Lauren=
t Pinchart a =C3=A9crit :
> > > > > > > > > > > > > > On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic =
Poulain wrote:
> > > > > > > > > > > > > > > Hi Hans,
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I would be happy to discuss this if a slot is=
 available:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Title: Generic V4L2 ISP M2M framework
> > > > > > > > > > > > > > > Presenter: Loic Poulain
> > > > > > > > > > > > > > > Time estimate: ~20min
> > > > > > > > > > > > > > > Description: During early development of a Qu=
alcomm Offline Image
> > > > > > > > > > > > > > > Processing Engine (OPE), we relied on the V4L=
2 memory=E2=80=91to=E2=80=91memory
> > > > > > > > > > > > > > > (v4l2=E2=80=91m2m) framework, which is widely=
 used and provides solid support
> > > > > > > > > > > > > > > for buffer management and scheduling. However=
, applying it to an ISP
> > > > > > > > > > > > > > > use case exposes limitations: ISP engines oft=
en require a richer media
> > > > > > > > > > > > > > > graph, with multiple pads and metadata flows,=
 similar to inline ISP
> > > > > > > > > > > > > > > pipelines (params, stats, outputs). This talk=
 proposes discussing the
> > > > > > > > > > > > > > > need for and design of a common V4L2 ISP M2M =
framework to factor out
> > > > > > > > > > > > > > > shared functionality across drivers, particul=
arly around buffer/queue
> > > > > > > > > > > > > > > management and job scheduling.
> > > > > > > > >
> > > > > > > > > It seems that we share some pain points.. :-) :-/
> > > > > > > > >
> > > > > > > > > Over the last year, some ideas have been brewing in my mi=
nd. Not
> > > > > > > > > necessarily *my* ideas, mind you, rather ideas that have =
been around in
> > > > > > > > > linux-media for quite a while, actually. What I would lik=
e to prepare
> > > > > > > > > for the Media Summit goes along the same lines.
> > > > > > > > >
> > > > > > > > > > > > > > That's well aligned with the v4l2-isp framework=
 that Jacopo started, and
> > > > > > > > > > > > > > to the multi-context and media-jobs APIs that w=
e have proposed. I
> > > > > > > > > > > > > > wonder, however, if a short session at the medi=
a summit will be enough,
> > > > > > > > > > > > > > or if we should try to organize a half day brai=
nstorming workshop at
> > > > > > > > > > > > > > some point. Depending on when the people intere=
sted in this topic plan
> > > > > > > > > > > > > > to arrive, Monday could be an option.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I'm also/still interested in the multi-context fo=
r m2m decoders that have inline
> > > > > > > > > > > > > post-processing capabilities (current model force=
s us to waste a lot of RAM). We
> > > > > > > > > > > > > just restarted some design discussion with the te=
am, with an increased
> > > > > > > > > > > > > confidence that multi-context is the way. The sch=
eduler could come handy in the
> > > > > > > > > > > > > future if we get to deal with more multi-stage co=
decs in the future. I'll be in
> > > > > > > > > > > > > Nice all day Monday.
> > > > > > > > > > > >
> > > > > > > > > > > > I will unfortunately be available only until 15:00 =
on Monday, but Jacopo
> > > > > > > > > > > > should be available through the day. Let's see who =
would be interested
> > > > > > > > > > > > and available, and try to organize something.
> > > > > > > > > > >
> > > > > > > > > > > I'm available on Monday as well. I think this is a to=
pic that is well suited
> > > > > > > > > > > to a brainstorm session.
> > > > > > > > > >
> > > > > > > > > > I am also available on Monday and would like to attend =
the session.
> > > > > > > > >
> > > > > > > > > I'd be interested too. Right now the plan is to arrive on=
 Monday
> > > > > > > > > afternoon. Depending on what time you agree on it may wor=
k out anyway.
> > > > > > > > > It would be great to know the exact time this session wil=
l start (as I
> > > > > > > > > might need to adjust my travel arrangements).
> > > > > > >
> > > > > > > I can arrive on Monday, with a preference for the afternoon.
> > > > > > >
> > > > > > > > We need a volunteer to organize this, as in finding and boo=
king a
> > > > > > > > meeting space. Note that Monday is a public holiday in Fran=
ce (Monday
> > > > > > > > the 25th of May in particular, not all Mondays).
> > > > > > > >
> > > > > > > > If the number of attendees was small I was thinking of host=
ing the event
> > > > > > > > in the place where the Ideas on Board team will be staying,=
 but it looks
> > > > > > > > like we're already reaching a fair number of people.
> > > > > > > >
> > > > >
> > > > > Are we still considering this BoF session ?
> > > > >
> > > > > We would someone to volunteer organizing this, at @IoB we're quit=
e
> > > > > full for the week and we might have an hard time organizing this =
one
> > > > > on top of the libcamera workshop.
> > > > >
> > > > > As Laurent said, that Monday is a public holiday in France, and
> > > > > getting a room somewhere might be complicated.
> > > > >
> > > > > We can host some people in the location where we're having the ye=
arly IoB
> > > > > get-together, but you should arrange your travel there (35 minute=
s
> > > > > from Nice by car).
> > > > >
> > > > > If we get a volunteer we can should maybe a dedicated mail thread=
 as this one
> > > > > was about the Media Summit ?
> > > >
> > > > If the number of people can be kept low (say <=3D 6), then it shoul=
dn't be a
> > > > problem to just find a hotel restaurant or similar, close to the pl=
ace of
> > > > the media summit, and just sit together.
> > > >
> > > > Who would be the key people for this? And who are 'nice to have'? :=
-)
> > > > I think I probably fit more in the latter category than the first.
> > >
> > > I was hoping a small number of people and a simple caf=C3=A9/lobby to=
o. The mass of
> > > people interested in the reply arrive much later, but I'm there all d=
ay, and
> > > would be more then happy to be able to brainstorm the subject a bit, =
which is
> > > easier in small group.
> >
> > Is this BoF side session still planned? If there=E2=80=99s still intere=
st,
> > perhaps the easiest option would simply be to meet at the hotel lobby
> > on Monday morning.
> >
>
> I'm around Nice like many others on Monday, but I'm not sure how this
> would feel for people that didn't arrange their travels accordingly
> because this event was never officially announced.

OK, I=E2=80=99ll be at the Campanile lobby tomorrow around 10am anyway, doi=
ng
some remote work, so feel free to stop by if you=E2=80=99d like to have an
informal discussion about how current and future multi-context support
should be taken into account, and what could reasonably be generalized
as vendor-agnostic helpers/frameworks for M2M ISP engines.

Cheers,
Loic

