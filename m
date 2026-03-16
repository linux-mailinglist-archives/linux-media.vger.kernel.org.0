Return-Path: <linux-media+bounces-55922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI48GcAKuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:50:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D275129ABFC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0A9A305E3BE
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8F521D590;
	Mon, 16 Mar 2026 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cczKz4pH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGroW2C4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED9839B4AD
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668755; cv=none; b=kxWT/SmE8LyQ9fsZbno1fCffAyjODDxDSymSb6rXg6e/mGelb7b3FEHmZ3VGrTB4eAYXDZ2qEU2fHDa62TB9sbEYHXJfr7o8qXGQT6cz2dSDhErJSqQ7OYKszmyPp6yZ6CNdUSNy2tyPRjedTMkMK7kBjcFkKF2mBatfT6daiA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668755; c=relaxed/simple;
	bh=ucyEDeReqWNpGQZIqhHybIWLSOoxO8g0TheUwxSiVWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qN0oI0gpq/zhgBKVc5hEYzPS0t84kh07QYW4jnijrVi7vdeoCCZB7QuI4UpcoDTJ5bIdSZV2nJrvEhUnsBMD1iYbNx/kEJnp7M4DxIh5vAoft2jiVGUshBfDMu2w5R81HvVJN3C33dwXOx2t1jEAT1JOINULqjJ4xD6duXjBbf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cczKz4pH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGroW2C4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBYdNH1282126
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pjszZMZGsG9
	Y96DJzuffZhkM2Caqqme43k2OCWF7lvA=; b=cczKz4pHid44iuAUSJMfk0tLE6S
	dxMWrcp5DPRlQmk/vQc9bi8cs1F5cwM9rBZGWEGwSPdO6mcu5c551iTcrWiwTjNL
	yooTxGz0ZELOtpwNwXUUPOjcuuw/ihENxm36EIpYn1TQKXRq5tc7Td5krDAdCObB
	KtB6O4loVqPr2tGqjrQ7ONes6yqB5RA8Z4AcDqARBuCstitvbPMEsRkD+XKnjgMO
	csiPlZALCVqKqroEi/hElcjD8XTr0KVC336PCXNTj/h3eXE/DDLjpZZNMBynhVm1
	WByVmZafiULv2PritFi3JG2oSWicoyX7OOpPhLjIh8bJONOq6TwySJtbNjw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc5v50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:45:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81c571a5so2954025785a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773668751; x=1774273551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjszZMZGsG9Y96DJzuffZhkM2Caqqme43k2OCWF7lvA=;
        b=gGroW2C4d1SQmtU6fG6FJeZOgwHbTwNB/+stBOy6bsKAkQCo+oobE5+b3TdkDG2Kuv
         DcYUS2D7f2+fmNtLZh+OIf1tlGaIZaNadGvCoMwsROzHhnQtT14FlZmnGGPU9leTGupl
         s/teQLcEROk71PYGvsn+yHKAP3AjN+D/qw/w0Q5/SbpDwYa4Q6gJX6PlXAoMkPVp/E4m
         Phebo9IRzKW8Tapti5X6kRemeppPXDWJvUG9mRDWo5BJWArGvIY5X2yV23MAg6FlOb6L
         TM9KhKRI2M9yvOV0m1xnCEYLuTQlEROKs0CbyjVuGceAmTIaeU7U3k+XTr4o6pARPDPF
         hdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668751; x=1774273551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjszZMZGsG9Y96DJzuffZhkM2Caqqme43k2OCWF7lvA=;
        b=VfG0L4ZRo0lfeLV9yZGDCiQRfkoG/zlg39lTlYuDp7R34mCzz75Qa1S4i30f/yqjC/
         mptpppd22nMBD5atgWr5waNE8qSYqX+qefdG8KBQYYlUtbi9AZQoXMb1aQZ23iF8ma3w
         4VuvyeijMhvZ7QH7/GtUQD4L/kZFmB4R0jUp1VlNiIOjTTETUpj7LEfYPtniZTwHL1lU
         Kb7Isz2mZSkFF8mIJlvOxg0sJmoAzvRsUKsX4hasLghdASlQTVMKmQglPwO2Pij/979Y
         uCH/is2fpFVFZhK2bILkEQWZSQlvzNYuQxCn9AffsMs9F+VHtPpQfXtAoI/k5m459Rph
         N4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUtb/ykCGbe5AKLSlSYKBRX+SOAt9M8zH5pma3cqkhV2GmDOERIguf8AAkqHTwecrNZEkYParAk9N71Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUJDitWBnagKa8yhlPyVj6MOJORRTSqe/cfhlDpppFVTDTafzx
	t44Uu2AU/6QWjoAb1gGG+s+jXTYg+mz/9FFYSHG+sqgkzyf5RNXAvpq1g1/cveWQ2zPfbgVxSgW
	M2RtxrCuxSMxecZFlZJFDrogp3G5GhO6v0b+dFFuVMj/+6Svah5lt2CwB9bxTQhe4Cg==
X-Gm-Gg: ATEYQzxfwQ5JLuUWRZz1cURVdsm456IUkecjvDvopPDVZDVvzamN7HMBxqb6nBWFaDz
	L6LOUa9Qzuxs2kGvVD1gnD0i6f6HEJ0f/zcQC6XvDoBkIaIwm3MmO6wTrWnAaBO6nguaokPLJ2W
	FKDd24B1dWr6A9UuM1Zo+BBZs2MwKZmatZP7bp8P7E123N0GZTR2KvdOfrpfW7FlWFxfACpxHK4
	pl4RUo6l5pUGpqI5ZtQt9E8HN1uXozXkW5et+L7SsWAyW+6fQMUqoai+HewTs6DtUfTG9Dkgn+c
	oX3qc3sDNVUpW+tAYpOJcQAM46y9ha429lKzVuMvPyxr0xmNWtoUOg1Uoq4lvoryP8Iy4Qoqax+
	hrFDx0j6hYLemi2Ldz6U2HOpYKEGe31BbAsqt
X-Received: by 2002:a05:620a:1724:b0:8cd:78e3:8797 with SMTP id af79cd13be357-8cdb5b4d4d5mr1640078885a.47.1773668751014;
        Mon, 16 Mar 2026 06:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:8cd:78e3:8797 with SMTP id af79cd13be357-8cdb5b4d4d5mr1640073885a.47.1773668750476;
        Mon, 16 Mar 2026 06:45:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b416e3678sm14307231f8f.17.2026.03.16.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:45:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Todor Tomov <todor.too@gmail.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
        Marco Felsch <kernel@pengutronix.de>, Lubomir Rintel <lkundrak@v3.sk>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] media: dt-bindings: Drop redundant endpoint properties
Date: Mon, 16 Mar 2026 14:45:35 +0100
Message-ID: <20260316134533.56941-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ucyEDeReqWNpGQZIqhHybIWLSOoxO8g0TheUwxSiVWM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuAmAMC9rcTpoIVh91l3cJNZCEepRHmCEXu5Ff
 L8w5uVvHz6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabgJgAAKCRDBN2bmhouD
 14Q4D/0VnvYMbCWgKNOD4wK8BfRRaDsoIEY7YSMxoOXeR+sUzYHvRi7WZJb8iztJtBvcviDi8xZ
 U8OcDeEabOI5t2mC2FsfXmW57xGZV5jOjLrVh6twv142lZlo9t/CmvcJ/pZvBhy8II8kR2kB0pA
 s1c56G08Z985U5Q6BpQHQJGnn72x16+yoWeNniYLv6+9gG0pZXHteWNkCK4n7s2pGxOdoMad6Wg
 dCGlcnDQTvcVAqEaW3hlAs3AEx5jPnBIksnN3aEkZoGjX/1aIS5KIgZJTzYE4Lggv6BrlBQsoo6
 hd5JoZS/3LnyVTIA8j10k+egwl8xrsaxdpkjkT/UcaNIYX7jzs1Ra28Nl1CpmIFqlckKyPNsLxI
 j9/MHaFBL7e0Dqft1HySMctvcKIWwgx89m80JNEN4jDBFOyLaAs9Gh1Zz9wPFW7AEYFQfN+PeOp
 UFJ/WLBajabq4s+5azzR4NuRz/Gvoju3lq6pKIDfXZ1e+i4w/8PLgpgTbhZsBDg2gz+GxAwYR+o
 HX7+2t45IqgAANdyYqVVL3Oi2YTTB82XEkqE/Z9BdkvZe8LuHZ/XADczqF5RbWKaJhXn4trX/Va
 lt/mmG7amSFTEcYufCG7gOKvlxvAwebH9Ttjz4BOuQWNI0pC3o2CJv4JOEje0TgQnFJcIWUGL6M dTcJ1O58IIsCftQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b80990 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Y3ovHfS12-kTIQRtp7wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gKoHWlWqR_HJtrfNojdjDJzGjd00JfJM
X-Proofpoint-ORIG-GUID: gKoHWlWqR_HJtrfNojdjDJzGjd00JfJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNCBTYWx0ZWRfXxe+4K7I8QbAN
 5uffoFe8ZGHeFA6al1n/QYGxfaqX1htgDUbaUEcLunn3japnyDWPkH+c9w/wlnit9SaJnkRKJwA
 SNkpffGQYKzwgeWKGSLMrXTM52OoaZWIVU2gGJm7Q0G/sBABQgI/wrcwFwgTkMybm+Szy8oVOsh
 r1rROHYn2C8EOJEVQ4tNUKjtC+oRA6Gh/s+wV2tLS0Qs69nU47QrKcIu8NMx23sYd92psctD0tG
 1fNvwY+U/AdAvYsGtUO+xKqHcEpjv2QkPdpoy6RMtlY0lYpIEyZA5H/Qj+GFr3NYHacOOA7uh9f
 W7Ywx1gCAw/sD8tibFp0QKZ7MaVRaGyfE/ENzFQS8nf9+no9cvDs9zV7Ynb8OU7OyQNSaEopM0M
 TJ2bpi7foywfYdfDokBeoZEgiCpV7YDSv23HNaaraDSoW/cR8iO0PK+2+yP1He89jvYKbb5GTdp
 82p2sQto5gl68UUy37Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160104
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,foss.st.com,jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55922-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D275129ABFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "endpoint" node references video-interfaces.yaml schema with
"unevaluatedProperties: false" which means that all properties from
referenced schema apply.  Listing some of them with ": true" is simply
redundant and does not make this code easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/marvell,mmp2-ccic.yaml        | 6 ------
 Documentation/devicetree/bindings/media/renesas,ceu.yaml    | 3 ---
 .../devicetree/bindings/media/renesas,rzg2l-cru.yaml        | 6 ------
 3 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
index de3e483f146a..a8bf06108158 100644
--- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
+++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
@@ -35,12 +35,6 @@ properties:
         $ref: video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          hsync-active: true
-          vsync-active: true
-          pclk-sample: true
-          bus-type: true
-
   clocks:
     minItems: 1
     items:
diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
index d527fc42c3fd..5f78c77b10a3 100644
--- a/Documentation/devicetree/bindings/media/renesas,ceu.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
@@ -43,9 +43,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          hsync-active: true
-          vsync-active: true
-          field-even-active: false
           bus-width:
             enum: [8, 16]
             default: 8
diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index 47e18690fa57..c1b81416bd85 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -95,12 +95,6 @@ properties:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
-            properties:
-              hsync-active: true
-              vsync-active: true
-              bus-width: true
-              data-shift: true
-
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-- 
2.51.0


