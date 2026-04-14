Return-Path: <linux-media+bounces-58768-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id r0c7ENSU3mlyGAAAu9opvQ
	(envelope-from <linux-media+bounces-58768-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 21:26:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D82DE3FE019
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 21:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA5D2302A2F2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 19:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0D32D94A0;
	Tue, 14 Apr 2026 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHR9fZxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SoOoI4TF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CEA201278
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776194765; cv=pass; b=nRo8Any2Bz8rS0Ss8qXjvUU04jUmn4IuJDe2VYo0zOvpqjJYCm5EkjafveK2Cvus+coJlVk8F2FdkzRZF1JPFAm9o5ZkxIRoJV0kYZVhQvtXiiCYk723cJUVd+3iP6saqUwGwxCFqHulPSN7BxHLTDlo8/KK8was+gAbeFvnyQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776194765; c=relaxed/simple;
	bh=9C4If3VZywDI7uJWg0Zg8C2e1n9hSmOSEzAAYxO6Mxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAmRQiPBJgKl7KABXeVponDvl+qbpZrrBvFJZXB5nNLL0bbzYxgmIYk2hMUgoqRE5oSvc0gRg9iLyduDRtbPPR8bFdhTRAq6V4tTNiFNYkJuuwJFQ9RcxIuFospC9PD9Uk+F2e3IWSm5GU7QHHTjLifSfSjHRDk39wDUl5aRA8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHR9fZxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoOoI4TF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG9OCK731110
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 19:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LG7IWlC0FNsdgQOGqiXS4rIa+Wr6fi4veMAl7PZ8BY=; b=hHR9fZxjVzWdDrF7
	Ml/SLjmoItnDu2+m3h3sPdy/jhk1/VeK/NR3BwN9T1lT2b34aYo5XcoO2x6ZmNWj
	nyDfdV7lE32d9LxwHbmOiaCl1MPmNttDUm434OCtETgmuA24X8fi8RTxKw2TAvxf
	9zwmKMOyS9AwVIFrPMH56c8bFjN8lFt3MlZ75tPzBw/JOV64LPxoO3fnx7gqOiGi
	0vi3IaH61D5u/zL8v7i3eW4LGrSU97/ygzlBPL+3/Z0kAHnWCAP+lj7jRcJafXxm
	H7+JwdNVfBzFMex4RwD7AsVtzta2Ove20gZZZbwKMJgkTBHRGBqouKpktVwIvjOG
	TMHurg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruu8rkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 19:25:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a5f6110cadso98214246d6.3
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 12:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776194751; cv=none;
        d=google.com; s=arc-20240605;
        b=Pnlhso8laDu0OGjeaCHfvILM6g9X+UUvp4/4ibhsGQ8/bLvNRuQpXPHyJr1sAWhQwf
         kGgQUxWAgcn8YqFOgLfwynXddor+sk/pK+UEvF6HYfwBy6lNOvazh98+GYA5QY3R6m0f
         Ruyaxqsf9YfSg2d6LP8DK6rW/9ZSp3zTiSaTe1kcLKlR4f7QdHt5haDroB41eLSLQb1y
         UC+KRtqCL9hELObyQD5DBSZGfJpm8RP0rhKv+9pq3cFVazXjhGvjTkly3NYGw6sOhKEJ
         JpPGZHOHQ4imd6afoSEWx/gk1P8ePMnRdL/OX7VkIBmvR1aY68b2CoyyuICchkizTTke
         Q9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LG7IWlC0FNsdgQOGqiXS4rIa+Wr6fi4veMAl7PZ8BY=;
        fh=DF0EYSGGxBaRr4HW/XLV67iWd3ckDN8rBzgvQaoDgMw=;
        b=Hw1yQSN5rmZx6QkXqfXbTpi8mZsHwRnx3IfdCrziTiU435V3/3cWE+lST75ZTr1lPM
         X6uA1WN0zed2AUNqQkzMp7n/OtLDqVWMq1gloVtg4B13+0nIOW8efdsdZ8WUNRxpdf/B
         X/RGzU2eK7wIsiJF20QsMtOsOiLmMOJQ0hrv1XBgCC2yKKYLcgWiqyt2xCWLMUzGS823
         HbCpiac/AmOna3fucedjzja0IGQBOwuOky3xFaFwH8A+kS4Gc/g+zXgArdvmLScwMQ38
         kfwy8P6/XLxHY/xo8xHuKUwsd72+RS94zvHn+1xKf/t4VLr4GWaPg+9zZLbPjj+dPyFX
         xRQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776194751; x=1776799551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LG7IWlC0FNsdgQOGqiXS4rIa+Wr6fi4veMAl7PZ8BY=;
        b=SoOoI4TFtk1ptGErrnmYg2dxHGGsKknTw4ngt+xVyAfM2uPJBhu7JixkRcHO+3wCBy
         zJj1lDOAOw5PsyFbE9bZPw812OWVxlquWfCZ5pimVRXEE+qic30x48T9+9BK0XPj+FUw
         eE4j+GwEnRBR/quHn16TKiAzhH4KORN8ArItSqiY1r6QQfZOqjRNPoSnjkSWqs3p9wuW
         TGBI/yCrtcue+DstHtWy4D2DuOLjw/jxn5TgjsMhXP8hxp7uaENbLzvK2p+x1p3cQWcO
         yS9verM9BzfeZhQV2FIWZORJ2QDprKa4AWIgU8LDweajuRZEEnPoJ8tCaKhkAeUnTj6e
         v4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776194751; x=1776799551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LG7IWlC0FNsdgQOGqiXS4rIa+Wr6fi4veMAl7PZ8BY=;
        b=NmX2I5qP793W8o77OE/BVSMMY8Fh39InurwXPekYZVpdIhu7UCpiIrRFhM785xhcrR
         iXlkup9uB01X1ynpvr1ua5T0Y/38onMO47dBHJgBf6l7z7DQ5vNd0tR5wBTJUjSOniZo
         ZSh5UVlJ20dPqokBYI7JDOrfCRTVTAgGtFV0T+DotyiIyQRQ6i8G55zFjeC0Lm/2Esiw
         vw6hcpLeLJXCsY4OEqOEQMkqjH27xnE7y9042i2bneLbuInGpGfmBI5ne75sxkabdF+D
         WefvDr6vV7FiQwt78E1JgvH4oijJ7ETTuvNID30IGkuC48OuRo+8RlfuNSvXhFg24p9l
         vNgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9w28HM2ksDVHMh9vQQ2kYLGyXizm5WZhcE/uu54Hf1KNpOa6otEdH8o/5HDO4L/W+ZgDKE/h1gzYp0ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz709y2VF4TtPBVOTuLlV0Pzs7oTkqZdFIcDnVRhdpELfuRDSAQ
	g52ZBr23KT5Ne3f42ITnjPkdW7Op0+4U4YXigcsHWfEhaywy9Ukk/Tl2LpzY4XQ0hHRGOWP/cLd
	Y2Sdyodz25zcbg58p35nmKo62BhiEWxn/EBg1mW++ojf3p95ZiqBzQFhatARbN5zD5dEeBTl1Cc
	GPS5KFmjrNgYq1/U7w5Uo+23X8YFvqLnooqzZcdSAf
X-Gm-Gg: AeBDiesVlFEEwS6tGpGc7JRWH1tDUqQHPJypvyiEF0sd9Vo71gw8FMnExSJaliMGYHO
	qHP/XMc6V0ekRgMW39B107P/lMLAPH3BP54zWBQG+KRoqLvE9O8itY1d7ji30QDeKlhsXb5mUTl
	B/KgVok1C/FVzm2+nDsNgSNi6SQ33UdtKZiu4F97Q8G25JtyDW4qTu8vs4oGZH/Hru1hcgJXT09
	aNFcV2UO/+MD2P3fyVyd3DarT7VC5uTWgZ5RJw=
X-Received: by 2002:ad4:5ded:0:b0:8ad:7a3e:5c2d with SMTP id 6a1803df08f44-8ad7a3e6deemr72527616d6.31.1776194749031;
        Tue, 14 Apr 2026 12:25:49 -0700 (PDT)
X-Received: by 2002:ad4:5ded:0:b0:8ad:7a3e:5c2d with SMTP id
 6a1803df08f44-8ad7a3e6deemr72526306d6.31.1776194747549; Tue, 14 Apr 2026
 12:25:47 -0700 (PDT)
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
 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com> <20260414084259.GC4061@killaraus.ideasonboard.com>
In-Reply-To: <20260414084259.GC4061@killaraus.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 21:25:35 +0200
X-Gm-Features: AQROBzDAF4VcSR73GaHvFuuAtAI6gTpMu67UKCGrBYYHmjFSMrXzGCtlesqb8gw
Message-ID: <CAFEp6-1hHdnZHtoCX4NP+04c-97zv3KoHCwE_fR1Dg9+v+wAVA@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: t9rE8zDxtDYp1JbWKevLQ_MrWzZvKQsc
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69de94c0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8 a=8s3bVdB6AAAA:8 a=VwnfekaSAAAA:8
 a=VwQbUJbxAAAA:8 a=WN6_cwnCAAAA:8 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8
 a=sozttTNsAAAA:8 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=8b9GpE9nAAAA:8
 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=PssDBZGIAAAA:8 a=RF00TdSWAAAA:8
 a=VUoH-wbYujV0JU9WTTAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=mX_46NTfp5VFrLZRzBmZ:22 a=eAomlcYGng2R2mZ923rV:22 a=ndfOWLLM0rR49n6Yv1rF:22
 a=D0XLA9XvdZm18NrgonBM:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=HJRSn2hXXqGixlvEXVkw:22 a=_nx8FpPT0le-2JWwMI5O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE4MSBTYWx0ZWRfX+wbeVFfzM/0Y
 UQU0bHyjfPkdGNa0/i80seroiTAPQVck9Qza5h//itizWVEl6JQycP/+DWIEHW+iyP3248V8hbC
 JIEV9RSCZ0b0iGWE3zLcarafGKTwqI43FMtL/Ooq75ITVOzAlm6kKtnlEWyh9YQcSkVgIG2kqj6
 JSywB7pogooMtgwGWZ/1nzdZ3gB3hwSbdovMOcG7R+BQxdJZ7LlM4K9wP6mbqx23nqCtMM9kjXW
 SmhxdN71zesXMvhg3230FUFZS2pD43hWLQJwS/eD43N0Qrba67nglHr2JnadH1LeVIU6L6JJkGE
 9LcNACsE+RPEFa+DOzZDbhC5BD69rIzL/dOVfoqpmJnZOJXP+hscFgu3F0orC+vwtMEwyylMwpm
 vHizSNxRbU1U6VZerPymYSC2spcW1Y/ggplc8fdTBNLr0lrKA9Xzi4UPVnvOH3X1xE4NolFm+5m
 U6yoDWrNe9kmLiOqdbg==
X-Proofpoint-GUID: t9rE8zDxtDYp1JbWKevLQ_MrWzZvKQsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140181
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58768-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D82DE3FE019
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:43=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 14, 2026 at 10:34:13AM +0200, Loic Poulain wrote:
> > On Tue, Apr 14, 2026 at 9:42=E2=80=AFAM Laurent Pinchart wrote:
> > > On Tue, Apr 14, 2026 at 09:20:56AM +0200, Michael Riesch wrote:
> > > > On 4/14/26 08:55, Ricardo Ribalda wrote:
> > > > > On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
> > > > >> On 13/04/2026 23:16, Laurent Pinchart wrote:
> > > > >>> On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas Dufresne wrot=
e:
> > > > >>>> Le lundi 13 avril 2026 =C3=A0 23:19 +0300, Laurent Pinchart a =
=C3=A9crit :
> > > > >>>>> On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulain wrote:
> > > > >>>>>> Hi Hans,
> > > > >>>>>>
> > > > >>>>>> I would be happy to discuss this if a slot is available:
> > > > >>>>>>
> > > > >>>>>> Title: Generic V4L2 ISP M2M framework
> > > > >>>>>> Presenter: Loic Poulain
> > > > >>>>>> Time estimate: ~20min
> > > > >>>>>> Description: During early development of a Qualcomm Offline =
Image
> > > > >>>>>> Processing Engine (OPE), we relied on the V4L2 memory=E2=80=
=91to=E2=80=91memory
> > > > >>>>>> (v4l2=E2=80=91m2m) framework, which is widely used and provi=
des solid support
> > > > >>>>>> for buffer management and scheduling. However, applying it t=
o an ISP
> > > > >>>>>> use case exposes limitations: ISP engines often require a ri=
cher media
> > > > >>>>>> graph, with multiple pads and metadata flows, similar to inl=
ine ISP
> > > > >>>>>> pipelines (params, stats, outputs). This talk proposes discu=
ssing the
> > > > >>>>>> need for and design of a common V4L2 ISP M2M framework to fa=
ctor out
> > > > >>>>>> shared functionality across drivers, particularly around buf=
fer/queue
> > > > >>>>>> management and job scheduling.
> > > >
> > > > It seems that we share some pain points.. :-) :-/
> > > >
> > > > Over the last year, some ideas have been brewing in my mind. Not
> > > > necessarily *my* ideas, mind you, rather ideas that have been aroun=
d in
> > > > linux-media for quite a while, actually. What I would like to prepa=
re
> > > > for the Media Summit goes along the same lines.
> > > >
> > > > >>>>> That's well aligned with the v4l2-isp framework that Jacopo s=
tarted, and
> > > > >>>>> to the multi-context and media-jobs APIs that we have propose=
d. I
> > > > >>>>> wonder, however, if a short session at the media summit will =
be enough,
> > > > >>>>> or if we should try to organize a half day brainstorming work=
shop at
> > > > >>>>> some point. Depending on when the people interested in this t=
opic plan
> > > > >>>>> to arrive, Monday could be an option.
> > > > >>>>
> > > > >>>> I'm also/still interested in the multi-context for m2m decoder=
s that have inline
> > > > >>>> post-processing capabilities (current model forces us to waste=
 a lot of RAM). We
> > > > >>>> just restarted some design discussion with the team, with an i=
ncreased
> > > > >>>> confidence that multi-context is the way. The scheduler could =
come handy in the
> > > > >>>> future if we get to deal with more multi-stage codecs in the f=
uture. I'll be in
> > > > >>>> Nice all day Monday.
> > > > >>>
> > > > >>> I will unfortunately be available only until 15:00 on Monday, b=
ut Jacopo
> > > > >>> should be available through the day. Let's see who would be int=
erested
> > > > >>> and available, and try to organize something.
> > > > >>
> > > > >> I'm available on Monday as well. I think this is a topic that is=
 well suited
> > > > >> to a brainstorm session.
> > > > >
> > > > > I am also available on Monday and would like to attend the sessio=
n.
> > > >
> > > > I'd be interested too. Right now the plan is to arrive on Monday
> > > > afternoon. Depending on what time you agree on it may work out anyw=
ay.
> > > > It would be great to know the exact time this session will start (a=
s I
> > > > might need to adjust my travel arrangements).
> >
> > I can arrive on Monday, with a preference for the afternoon.
> >
> > > We need a volunteer to organize this, as in finding and booking a
> > > meeting space. Note that Monday is a public holiday in France (Monday
> > > the 25th of May in particular, not all Mondays).
> > >
> > > If the number of attendees was small I was thinking of hosting the ev=
ent
> > > in the place where the Ideas on Board team will be staying, but it lo=
oks
> > > like we're already reaching a fair number of people.
> > >
> > > > > Regards!
> > > > >
> > > > >> The agenda for the media summit is getting quite full, and I agr=
ee with Laurent
> > > > >> that 20 minutes is likely not enough. If we can so a session on =
Monday instead,
> > > > >> then that would be a good solution.
> > > >
> > > > Apart from the time and date the scope of this session would be int=
eresting.
> > > >
> > > > Will this be a birds of a feather session in which the next generat=
ion
> > > > kernel ISP framework will be discussed? Or even the next generation
> > > > kernel video processing framework, where video processing is image
> > > > signal processing, encoding/decoding, 2D graphics processing (fishe=
ye
> > > > correction units, 2D GPU such as the Rockchip RGA3, ...)?
> > >
> > > I would focus on Loic's original scope. If the solution can be used f=
or
> > > other devices that's great too. I believe that the current multi-cont=
ext
> > > patch series is a good fit for codecs. If we broaden the scope too mu=
ch
> > > right away we'll achieve nothing.
> > >
> > > > >> I have never been very enthusiastic about the m2m framework: it'=
s fine for e.g.
> > > > >> simple scalers, but it's awkward to use for codecs let alone ISP=
s.
> > > > >>
> > > > >> I always felt that we really need variants of the m2m framework =
that are customized
> > > > >> to specific use-cases: i.e. a codec m2m framework, and (perhaps)=
 an ISP m2m framework.
> > > > >>
> > > > >> The big problem with that is of course who will do the work. Mak=
ing new frameworks
> > > > >> is difficult and takes a long time.
> >
> > A couple of weeks ago, I submitted an initial driver for a Qualcomm
> > Offline ISP based on the standard v4l2-m2m framework. Following
> > discussions around which parts could be generalized, I started
> > migrating this work to a new v4l2-isp-m2m framework:
> > (https://github.com/loicpoulain/linux/commit/5d575d7eff8f2371e91d823714=
8ffdb44b0af5b0).
>
> I definitely want to discuss this, but I will be available on Monday
> until 15:00 only.

I think I can arrange to arrive in the morning if 10am works.

>
> > The API and overall logic closely mirror v4l2-m2m.c, but are extended
> > to address ISP=E2=80=91specific requirements such as multi=E2=80=91devi=
ce support and
> > multiple queue handling.
>
> That part I don't like. The V4L2 M2M framework is a big mid-layer that
> prevents drivers from having control of how operations are handled. It
> does too much, and doesn't give enough flexibility to drivers. It may
> have been fine when the framework was designed, for the devices we had
> back then, but today it's just painful. I want to turn this around and
> give control to the drivers, with helpers they can use to implement
> parts that are not driver-specific. This needs to be opt-in, not a layer
> that takes completely control between the uAPI and driver operations.
>
> Let's not reproduce the design mistakes made in the V4L2 M2M framework.
>
> I also think you need to decouple the context handling and scheduling in
> two separate components. They need to work together, but shouldn't be
> bundled into a monolithic system. Very importantly, a driver should be
> able to implement contexts with the multi-context helpers, and implement
> custom scheduling itself.

Understood, thanks for the feedback, these are important points.
Decoupling should be straightforward to address, and I will make sure
to take Jacopo=E2=80=99s multi=E2=80=91context work into account as part of=
 the
design.

I also need to find the right balance between what can be easily
generalized and moved out of the driver, and raising issues or
discussions that, while valid, could branch into too many parallel
topics and significantly delay integration. I guess this can be
addressed in multiple steps: starting with an initial driver, followed
by a gradual split and migration toward a common framework, as long as
the user=E2=80=91facing API remains stable (video devices, media graph, etc=
.).



>
> > I am planning to submit this work as an RFC
> > before the Media Summit. At this stage, the framework is still fairly
> > basic and primarily tailored to the Qualcomm use case. There is
> > definitely room for improvement, for example, integrating Jacopo=E2=80=
=99s
> > multi=E2=80=91context support, since for now, the Qualcomm driver simpl=
y
> > instantiates a single ISP=E2=80=91M2M context.
> >
> > As I am still getting familiar with the media subsystem, this work may
> > overlap with or conflict with ongoing efforts. Synchronizing seems
> > indeed important. Based on my current understanding, there are several
> > related areas of work that appear either complementary or orthogonal:
> > - Multi=E2=80=91context support, to instantiate multiple processing ses=
sions
> > on shared hardware/driver.
> > - Media jobs, to synchronize work across multiple drivers within the
> > same media pipeline.
> > - ISP M2M, aiming to provide a v4l2-m2m=E2=80=91like framework specific=
ally
> > for memory=E2=80=91to=E2=80=91memory ISP devices.
> >
> > > > This may be naive and overly optimistic, but I feel there is quite =
a
> > > > number of people sharing the same pain points (which are similar to
> > > > those Loic pointed out). Maybe (hopefully) this birds of a feather
> > > > session leads to the formation of some work group?
> > > >
> > > > >>>>>> On Sun, Apr 12, 2026 at 12:25=E2=80=AFPM Hans Verkuil wrote:
> > > > >>>>>>>
> > > > >>>>>>> (Please pass this on to anyone you think might be intereste=
d in this!)
> > > > >>>>>>>
> > > > >>>>>>> Hi all,
> > > > >>>>>>>
> > > > >>>>>>> This is the fourth version of this announcement, updating t=
he list of attendees
> > > > >>>>>>> and the tentative agenda at the end: please let me know if =
you see mistakes.
> > > > >>>>>>> Note that there is still time for one or two other topics. =
Also please check
> > > > >>>>>>> the agenda if you need more (or perhaps less) time for your=
 topic.
> > > > >>>>>>>
> > > > >>>>>>> This year's Media Summit will be held on Tuesday May 26th t=
he day before the
> > > > >>>>>>> Embedded Recipes Conference in Nice, France:
> > > > >>>>>>>
> > > > >>>>>>> https://embedded-recipes.org/2026/
> > > > >>>>>>>
> > > > >>>>>>> The Media Summit will be held at Hotel Campanile and in the=
 same meeting room
> > > > >>>>>>> as last year (Nikaia):
> > > > >>>>>>>
> > > > >>>>>>> https://nice-aeroport.campanile.com/en-us/
> > > > >>>>>>>
> > > > >>>>>>> It is close to the Airport and to the Embedded Recipes venu=
e.
> > > > >>>>>>>
> > > > >>>>>>> The meeting room can hold up to 30 people and I will provid=
e video conferencing support,
> > > > >>>>>>> just like last year. The location and the meeting room was =
quite nice last year, so
> > > > >>>>>>> I saw no need to change it.
> > > > >>>>>>>
> > > > >>>>>>> That said, in-person participation is very much preferred. =
This yearly summit is meant
> > > > >>>>>>> for active media developers to meet face-to-face and to dis=
cuss media subsystem issues.
> > > > >>>>>>>
> > > > >>>>>>> And it is also a good opportunity to talk to each other dur=
ing the Embedded Recipes
> > > > >>>>>>> conference to discuss topics in a smaller group. But if you=
 are an active media developer
> > > > >>>>>>> and are really not able to attend in person, then remote pa=
rticipation is an option.
> > > > >>>>>>>
> > > > >>>>>>> If you want to attend the meeting (either in person or remo=
te), then send an email to me
> > > > >>>>>>> directly. The deadline for in-person attendance is May 14 a=
s the hotel needs to know the
> > > > >>>>>>> final number of attendees by then.
> > > > >>>>>>>
> > > > >>>>>>> There is no registration fee, the meeting room is sponsored=
 by Cisco and Collabora, and
> > > > >>>>>>> the lunch is sponsored by Ideas on Board! Many thanks to ou=
r sponsors, it's very much
> > > > >>>>>>> appreciated.
> > > > >>>>>>>
> > > > >>>>>>> If you have a topic that you want to discuss, just 'Reply A=
ll' to this announcement
> > > > >>>>>>> and give the topic title, a short description and a guessti=
mate of the time you need
> > > > >>>>>>> for your topic.
> > > > >>>>>>>
> > > > >>>>>>> See last year's Media Summit Report as an example of what t=
o expect:
> > > > >>>>>>>
> > > > >>>>>>> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a=
-6a1ad089298d@jjverkuil.nl/
> > > > >>>>>>>
> > > > >>>>>>> Regards,
> > > > >>>>>>>
> > > > >>>>>>>         Hans
> > > > >>>>>>>
> > > > >>>>>>> PS: Be aware that May 24 and 25 are public holidays in Fran=
ce. So many
> > > > >>>>>>> shops may be
> > > > >>>>>>> closed those days.
> > > > >>>>>>>
> > > > >>>>>>> In-person attendees:
> > > > >>>>>>> Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > >>>>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > > >>>>>>> Brandon Brnich <b-brnich@ti.com>
> > > > >>>>>>> Rouven Czerwinski <rouven.czerwinski@linaro.org>
> > > > >>>>>>> Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > >>>>>>> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > >>>>>>> Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > > >>>>>>> Marco Felsch <m.felsch@pengutronix.de>
> > > > >>>>>>> Paul Kocialkowski <paulk@sys-base.io>
> > > > >>>>>>> Jai Luthra <jai.luthra@ideasonboard.com>
> > > > >>>>>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > >>>>>>> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > > > >>>>>>> Beleswar Padhi <b-padhi@ti.com>
> > > > >>>>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > >>>>>>> Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > >>>>>>> Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > > > >>>>>>> Ricardo Ribalda <ribalda@chromium.org>
> > > > >>>>>>> Michael Riesch <michael.riesch@collabora.com>
> > > > >>>>>>> Devarsh Thakkar <devarsht@ti.com>
> > > > >>>>>>> Michael Tretter <m.tretter@pengutronix.de>
> > > > >>>>>>> Hans Verkuil <hverkuil@kernel.org>
> > > > >>>>>>>
> > > > >>>>>>> Remote attendees:
> > > > >>>>>>> Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > > > >>>>>>> Rishikesh Donadkar <r-donadkar@ti.com>
> > > > >>>>>>> Jackson Lee <jackson.lee@chipsnmedia.com>
> > > > >>>>>>> Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
> > > > >>>>>>>
> > > > >>>>>>>
> > > > >>>>>>> Agenda (tentative):
> > > > >>>>>>>
> > > > >>>>>>> 8:45-9:20: Arrive, settle in
> > > > >>>>>>>
> > > > >>>>>>> 9:20-9:30: Short intro (Hans Verkuil)
> > > > >>>>>>>
> > > > >>>>>>> 9:30-9:45: Status of ISP support in V4L2
> > > > >>>>>>>         Presenter: Laurent Pinchart
> > > > >>>>>>>         Description: Summary of ISP-related development in =
V4L2 since the last
> > > > >>>>>>>         Linux Media Summit. This includes a brief overview =
of technical
> > > > >>>>>>>         developments, and a summary of the efforts to engag=
e with vendors.
> > > > >>>>>>>
> > > > >>>>>>> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Upd=
ate
> > > > >>>>>>>         Presenter: Paul Kocialkowski
> > > > >>>>>>>         Description: An update on the ongonig work to suppo=
rt stateless codecs in V4L2.
> > > > >>>>>>>         Some of the remaining open topics will be presented=
 and discussed.
> > > > >>>>>>>
> > > > >>>>>>> 10:45-11:00: break
> > > > >>>>>>>
> > > > >>>>>>> 11:00-11:30: Vulkan Video Codecs
> > > > >>>>>>>         Presenter: Nicolas Dufresne
> > > > >>>>>>>         Description: Vulkan video codecs: what are the viab=
le options for Linux Media
> > > > >>>>>>>         and what is in preparation outside of our subsystem=
. The second aspect is
> > > > >>>>>>>         informative as these discussions don't seem to lean=
 toward our subsystem as the
> > > > >>>>>>>         foundation. But I think it's rather useful for ever=
yone to understand why and
> > > > >>>>>>>         what is included.
> > > > >>>>>>>
> > > > >>>>>>> 11:30-12:00: Protected Video playback on i.MX8MQ
> > > > >>>>>>>         Presenter: Rouven Czerwinski
> > > > >>>>>>>         Description: Introduction to protected video playba=
ck
> > > > >>>>>>>         on i.MX8MQ and missing bits for linux-media & prote=
cted heap interoperability.
> > > > >>>>>>>
> > > > >>>>>>> 12:00-13:30: Lunch
> > > > >>>>>>>
> > > > >>>>>>> 13:30-14:00: HDCP support for HDMI receivers
> > > > >>>>>>>         Presenter: Hans Verkuil
> > > > >>>>>>>         Description: I have been working on adding HDCP sup=
port for HDMI receivers.
> > > > >>>>>>>         Specifically the HDCP negotiation between sources a=
nd sinks.
> > > > >>>>>>>
> > > > >>>>>>> 14:00-14:30: AI patches
> > > > >>>>>>>         Presenter: Sakari Ailus
> > > > >>>>>>>         Description: What is our policy w.r.t. AI generated=
 patches?
> > > > >>>>>>>
> > > > >>>>>>> 14:30-15:00 Overview of Media CI: where do pipelines run?
> > > > >>>>>>>         Presenter: Ricardo Ribalda
> > > > >>>>>>>         Description: How are jobs in pipelines assigned? Ho=
w does the infrastructure
> > > > >>>>>>>         for Media CI work? Are there things that can be twe=
aked to make it more
> > > > >>>>>>>         reliable?
> > > > >>>>>>>
> > > > >>>>>>> 15:00-15:15: Break
> > > > >>>>>>>
> > > > >>>>>>> 15:15-16:15: Discussion of the media subsystem development =
process
> > > > >>>>>>>         Presenter: Hans Verkuil
> > > > >>>>>>>         Description: Review of the multi-committer model: c=
urrent status and next steps.
> > > > >>>>>>>         Are there any bottlenecks, any ideas for improvemen=
ts, w.r.t. the development process?
> > > > >>>>>>>
> > > > >>>>>>> As you can see, there is still some available time for othe=
r topics.
>
> --
> Regards,
>
> Laurent Pinchart

