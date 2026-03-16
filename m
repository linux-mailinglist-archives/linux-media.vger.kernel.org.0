Return-Path: <linux-media+bounces-55921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNRIF3sKuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:49:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C796A29ABB2
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A4DF300CFC3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0700921D3E4;
	Mon, 16 Mar 2026 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIwNuJ/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIQmzHRA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF4521D590
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668747; cv=none; b=kSDTL7MWIPgiApu0QV131YHecHRttuahkAJcZA4H5K6ectig501lYh9To+TFWzjZQ+Bl3YM6Z5gZWNg80RM1ycOSPDymMz+s5YmJFw9OPhxtZzGDWQ8dzOLwRowcQsHPoBoh1Nv/C6qRfpUfBzILsznqNZypRSwpA/3ND4wGtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668747; c=relaxed/simple;
	bh=t8h9C0qrhILq+5Zys16fRrCe9qjnoZrF/6Ha+44N1jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YIwvoynL5Op9Bi8If0zw8uBA1L4hbqoTNtUvgihGe3AcG80FhUiPYxbAdiNvp/6R6Dd2zoTSrTO3G0V3NpRnLSmpZNDAD07b0O60AHxBK1yh7cxHprsOlhUGK2XXFcDIuOEtx3GOXGvQmGv65F1XY8az+q+RSgvEi8j7JKgKlTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIwNuJ/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIQmzHRA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBkD8F3777679
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GP1eV7PL30/lxFgTAbjPosrwLpCstR2UQ+g
	SV7rTO4s=; b=GIwNuJ/d0zJhJbQyNiUk5I4IVNuselKxgn1qsjJ13Cz2B3mlV+i
	DHGh0bJLsoKYiURZ/GiUarP2+ShGv5uxka+dnwW02AUPIKVVHELj2k06rRawxIIi
	7ppkGbQvntkJXQFChrXgMRl/NLB880cHdGvYXmSyAerhZps4oO/LWD4R9jyOh47u
	znMfpinQYiVa6KtxsLkMsoBEa+0tl+LlrpN5NcnviAgslTXcwvA2n7e72TVFYz6m
	7DvF25s+m8l0ZZLdq33+D5BKTesWEegsfbRpTFs2YvUWD9YcjUI6Xfy/0CKHRnMl
	4iJfwtB2mkS/ompbWng4vABuCmiwQ3/bGXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7wu6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:45:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd858e8709so5033085485a.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773668744; x=1774273544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GP1eV7PL30/lxFgTAbjPosrwLpCstR2UQ+gSV7rTO4s=;
        b=TIQmzHRAcMOCkMfYLweByEwKjUL4ap8V6N9w38NOl+2Oh2Wyuiu1o6nD0y5suj9r4m
         DhaGoQuwdjHMaL6vlb4hmLuVeP17/e0eQsJojmU1NyqsFc2vCLJIb66tk7CfLAvEe7jz
         iRL3lwaMXl0p9fq/u6JqLZS9VNtmM89GlXYjiLnbJUxebmPVY0E75cHRXNwIS3uNa044
         JxVwItpZu05jE0Va/IiLzy5qRXR/ABTBWP1aHqoXyykC5O8hb60+alvaU2SN46gTd7MZ
         arMrInfqcvOn63y4obtUWlWqDxIh9tL/zyovDPMe/bNonQWSumWD0MumiAeDqz7XHo/Y
         QNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668744; x=1774273544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP1eV7PL30/lxFgTAbjPosrwLpCstR2UQ+gSV7rTO4s=;
        b=c1oKaYPK8jDYmqTe5vPXgerSUKoMv8Q4HEY40n4IQ5MMO6UJB00xmAd0yd9RprFhpZ
         cX9rXBeQyAYPSFjPy12PG2wyHEgILCuCYAFO88/VYwvO1Y8AUAlqteKHlxFO57/Av37z
         JTBZNJhB+sVRpMrJOKHmz4/knMHbzAu5vV5KHB7ib8ZgjKHUwbNmB4xuyP8u7pKejipm
         D+qwzvDA9XzN2ip5SIAKwAUZ10/qXjvzcbpR0BMOFRi0z0wLo5Nq3yAHwMTIbATOnGXi
         srRbOdVuJMhvmybLScJpphk4wkAOSkMdaNr3LlDymc3wmNeu0AMPdvEBH2UjmrffC1Mn
         GcVg==
X-Forwarded-Encrypted: i=1; AJvYcCV6RxbIcrJX44fPi+LtZk6oLZfQAmcvy0I5ii5RDg0T4sIvC+jCVwOPdxl+5uKG9euFqhrhPXhSevVVuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXpPhFK1RGcNB2yimRafW7j3Eiw2AATPCFcaj+lIY2lo6shlm
	g/TjA33MXvZQzy3p5Pzq9GQFefH2KY/nE1No/7N7td0nYkWfCAyndy2eYD5lkl/VfbWa0U8EYvl
	9L1CPy6psjIRpxUCzo1iwy0otJNF02wut7nkWVBXLDd9uonzYMgdxvnpBWMTWeYIwhw==
X-Gm-Gg: ATEYQzwnAxUfs25XeA/k1jZzLmfe9BgZB4FV6xDwpewvMrUXc3otQyFKLmRBHhVQ/iM
	C6LMA2T2CgRB9LonBVxAL4TzPRoMlno5QqpAwu0Ro072o8tS6SKZYVXWSjbATHZay5JsgORr2Xa
	L9wNO63/eRJkO/oq/kfA4zil/UVjl2M5UQm4hsiBT20O03McHhf7C98euM67m8Oq29WWbZNGBRH
	9ztOmUiPt4wBWD7YcX0Bt5C6odXtqeHtdXlSsIg2qNv9jzYPPg+YzLxLSwY7gSLrVTch1Xwx5o1
	hhm7BIqHuTP5liYAHvxrZjt/yMYeTRspoG3Zhiazyap5qFaXZ2SDyrgOoTDWjqBAneJ/OQAQd51
	riQt/yFzJqx5rfDeRupW1nobf4HSntX7EdFMl
X-Received: by 2002:a05:620a:7103:b0:8bb:1a5b:5a47 with SMTP id af79cd13be357-8cdb5a4abd1mr1692419385a.17.1773668743523;
        Mon, 16 Mar 2026 06:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8bb:1a5b:5a47 with SMTP id af79cd13be357-8cdb5a4abd1mr1692414785a.17.1773668743019;
        Mon, 16 Mar 2026 06:45:43 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b416e3678sm14307231f8f.17.2026.03.16.06.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:45:42 -0700 (PDT)
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
Subject: [PATCH 1/2] media: dt-bindings: i2c: Drop redundant endpoint properties
Date: Mon, 16 Mar 2026 14:45:34 +0100
Message-ID: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11781; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=t8h9C0qrhILq+5Zys16fRrCe9qjnoZrF/6Ha+44N1jI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuAl9YgBvP32SjYWo80scAqVVEVAf3vCg36Tgh
 00ORW56KwyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabgJfQAKCRDBN2bmhouD
 12IwD/0YGAwVGszr0xaWr778UXYyxWM3NBBhAE0GyZhy3Apy0zpcIKBwlLycZItBw6M9p9r9ijH
 Ukikbu5fVSKjZ+yKGvsoPo9IV53t6mwhSB+U9B/3+MeEa5Hvu7DdoBcPXCIF0ZrUMGBcK/BA8Z9
 0F2M38hSuSQaniKB5W4n0GhHke/Ffmz2MWg2YI0N68O7E8Z3PsVKObQNPpTG+uy4kUP1+fy3eB+
 nmLlRFK96RGxiYSy+DVFEjkRJ+IqpXdpjUYd5nUi1tEjNEbvxOv4ghaI1l6kFCobhikCRlcbqln
 KrzCjECNNFQkwmdA2cDt7ltiYgiX7VzDadTfRL29qyj8TM/HqWNEBFtGpgkiJdvXS9YjteYZVwC
 RWZgRygb+TVskiFJ8/AkuVBMb1bCisFgZtPM3DkhyjEyBtgEaGOvUL8TV+zM2zs+Z/g2Uc2QpqK
 ePk3GPFf7rcQk5G4Bh0h25WTDOPw/yd/wSFoiGRNY4y/u4U//pToYbU/HwAWXlvDffsRuTuA0nC
 GzMa7R6ljF8ILfG2Me8ddwTrbty1a6xjCPuczkeui17n3YeC9hswAdZyl81H0+HlRRbhk00YYuV
 LZNvzPKasQnbdf+fvkMvhJGVeVOjMTdt9U2YhXYWacrCAEZoei+DjXKbWNN3qGJVt+WUD0NGwCb /psZdl3mwmr6R+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jkHHyz3_JtpJugtVL3z0e6IIVOAjQqUT
X-Proofpoint-ORIG-GUID: jkHHyz3_JtpJugtVL3z0e6IIVOAjQqUT
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b80988 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RqNHlvAEXZaMOB3n50YA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNCBTYWx0ZWRfX60cGl5WDHvVL
 1LKaU+ftmVMoA1M8GianKVzcbrsV91MdJ8oqDyHoQx23KmwDjircA2NUle01MTupovAqSQ+Qeu1
 qJ6bphMY3OdS+Gnj6wiRn13Rnq5bsuKEhwdDNk/qabNeg8QXiVjmLtHi69HxqPZRpK8iDs2cZBq
 OxEJT+CtO8u6wQK6aUnokotUJpbAYyXMVZoccdCk7PfRNVbV5Qh8o3CPtd+OlDyQzkvCTUIblgS
 VYfDc8RUC5jO/dizz8sKJreqIOJIQxaRpU8Kh9EzmfLZoOoFSKKPx5H/B2R2zVz9y1m+AqAbHBD
 II/bR58uU2EMnJCyh0ytcZDQCeItg++qk4h7YXEcXSh+ROcm4D7xlFDuH64XFkapqK1lo7khSz/
 xVH2803XpSpfiflndQHTuU7EiIz43u5lP5blMeoQeNf8fIbTNO3tgqOjwbe2BNpDf39j2Pypl1l
 QIiap0T+Z3+7Xw+SOhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160104
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,foss.st.com,jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55921-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C796A29ABB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "endpoint" node references video-interfaces.yaml schema with
"unevaluatedProperties: false" which means that all properties from
referenced schema apply.  Listing some of them with ": true" is simply
redundant and does not make this code easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/alliedvision,alvium-csi2.yaml      | 2 --
 .../devicetree/bindings/media/i2c/galaxycore,gc0308.yaml  | 8 --------
 .../devicetree/bindings/media/i2c/galaxycore,gc2145.yaml  | 3 ---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 3 ---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml     | 1 -
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 2 --
 .../devicetree/bindings/media/i2c/ovti,og01a1b.yaml       | 2 --
 .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml       | 1 -
 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml        | 3 ---
 .../devicetree/bindings/media/i2c/ovti,ov5648.yaml        | 2 --
 .../devicetree/bindings/media/i2c/ovti,ov5675.yaml        | 4 +---
 .../devicetree/bindings/media/i2c/ovti,ov7251.yaml        | 2 --
 .../devicetree/bindings/media/i2c/ovti,ov8865.yaml        | 2 --
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml        | 4 ----
 .../devicetree/bindings/media/i2c/sony,imx334.yaml        | 4 ----
 .../devicetree/bindings/media/i2c/sony,imx412.yaml        | 4 ----
 .../devicetree/bindings/media/i2c/toshiba,tc358746.yaml   | 5 -----
 17 files changed, 1 insertion(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
index d3329e991d16..c2ae33532700 100644
--- a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
@@ -35,8 +35,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
-
           data-lanes:
             minItems: 1
             items:
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
index 2bf1a81feaf4..fcf79f4c5a0d 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
@@ -53,14 +53,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          bus-width: true
-          data-shift: true
-          hsync-active: true
-          vsync-active: true
-          data-active: true
-          pclk-sample: true
-
         required:
           - bus-width
 
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
index 9eac588de0bc..ccac2cb85d57 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
@@ -58,9 +58,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          link-frequencies: true
-
         required:
           - link-frequencies
 
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index a37447256f8d..d806b821dae3 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -137,9 +137,6 @@ properties:
             $ref: /schemas/media/video-interfaces.yaml#
             unevaluatedProperties: false
 
-            properties:
-              data-lanes: true
-
             required:
               - data-lanes
 
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..4b9afc73de62 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -67,7 +67,6 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              data-lanes: true
               bus-type:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 217b08c8cbbd..9ba8a17c62e0 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -78,8 +78,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
-          data-lanes: true
           bus-type:
             enum:
               - 1 # CSI-2 C-PHY
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
index ca57c01739d2..efdac2e91589 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
@@ -64,8 +64,6 @@ properties:
             items:
               enum: [1, 2]
 
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
index 0e1d9c390180..b98260d5e6a3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -81,7 +81,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
           ovti,mipi-clock-voltage:
             $ref: /schemas/types.yaml#/definitions/uint32
             description:
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index 2d7937a372a2..7a05a1eda58d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -51,9 +51,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          clock-noncontinuous: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 8028c8b107c4..ec53e55b2290 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -48,8 +48,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
-
           data-lanes:
             minItems: 1
             maxItems: 2
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
index ad07204057f9..90b2c6d35df6 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
@@ -21,6 +21,7 @@ description: |
 
   This chip is programmable through I2C and two-wire SCCB. The sensor output
   is available via CSI-2 serial data output (up to 2-lane).
+  It supports max data transfer of 900 Mbps per lane.
 
 properties:
   compatible:
@@ -67,9 +68,6 @@ properties:
             minItems: 1
             maxItems: 2
 
-          # Supports max data transfer of 900 Mbps per lane
-          link-frequencies: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
index 922996da59b2..0ad271a4bf39 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
@@ -63,8 +63,6 @@ properties:
           data-lanes:
             maxItems: 1
 
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 320b9aacbb8b..c535a5257a3e 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -48,8 +48,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
-
           data-lanes:
             minItems: 1
             maxItems: 4
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 401c8613f840..20dc0885e30e 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -53,10 +53,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          data-lanes: true
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index 3842e5130463..e90ebe6a0a24 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -40,10 +40,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          data-lanes: true
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 5447ab0768a6..dec428d46937 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -52,10 +52,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          data-lanes: true
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
index 1c476b635b69..505c6d22ef7c 100644
--- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
@@ -78,8 +78,6 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              hsync-active: true
-              vsync-active: true
               bus-type:
                 enum: [ 5, 6 ]
 
@@ -103,9 +101,6 @@ properties:
                 minItems: 1
                 maxItems: 4
 
-              clock-noncontinuous: true
-              link-frequencies: true
-
             required:
               - data-lanes
               - link-frequencies
-- 
2.51.0


