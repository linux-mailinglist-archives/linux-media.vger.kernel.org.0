Return-Path: <linux-media+bounces-53163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFFBMCcXnGkq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:00:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250B17360D
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9F36301FBA1
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2818A34EF05;
	Mon, 23 Feb 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVF9YC7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SM4T0KI3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D634EF01
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837211; cv=none; b=WTJxDIp73iJKVslPgE/zt7nfe/gpTHBt4PZJqnRJ31CMmyiUCszTEzkSSoMphWARk5iHdHvoinALpcbFruzIBvz5s0HYXb75XPpXABffPljC6irsdamtfrXFOAzTeaBXDf6DDZ67hxWDIFmXou9xq2qXftZxMz0UoW9Jl4+cxaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837211; c=relaxed/simple;
	bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEJM8/W/cuaAVZMVcyRMWoCrSQg2l3//ti9b1SqPmSMU9q4XTGX0/F/N6NEnNpbEjzMN5nNAZ8OZX4eROFYl6awf/sNp5jyh7RjNMsQ0pik8AnnhFESf91ClaiUstPEFHVdudIWO9LstPRsxv8ftLpKouwN2vFw6PHfrxxyd4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVF9YC7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SM4T0KI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJiM5u2926616
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=eVF9YC7w6LwSXWPh
	KNjYpPPqoIYhzE9ED3GDU8Wv7tD8JO5zXzzjCMB83Ee3Sdy6RfVL80wjLVNCmQUB
	cXk28xdHPXoFLnBxE7K0JK9eo5rEjdHRtdVmo76v2RLhXTs3PyX+bvLi7XOtMTnB
	W69yd8Onuhn+DdiL+30cQEXYzCTAtCQdjPxaSL9zQmSDFXZec2/qELgIOV9R8kpR
	WQLH44Ki6glnjLGV0OJhMOSYVEQbcl3uLTBSGCatKoLr7QwfOZp3Q0HNCIccc12L
	Qf4yIqyl3EFogFaBi85g8nbHNz8xX8S/aAf3bbzPICu34VOFLdHIZMitjBJOx8h9
	RhmmyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk4060-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso575190785a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837208; x=1772442008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=SM4T0KI3YP4jKBqvBuv7po5N+iMQ7z2Oqqld1BlTWwpqxs2OI6b9tte47pHOFDk7+C
         5CCEEmpeP7CpMx8MrSN2AOC4rnX6ooQTcbQOdfePMwSVnUywGxgvPcGaxnOubkxbXiEH
         r2fhBsHgXkBO/skoSjSMY4IRSAXrVS2WT5cxLtwfZqh3cxW7tMNL+LOy29oOS9eXCVd6
         /KjwKTPUPtLTaUG4b0wuLLvKU9g37I3QbaMVDsGYYSY6rfJqwnB6rndpXh1i64CJYyrA
         LXOD1i+cIh8e3hTh2RYm1KPmPTHRR69RYejJj+due/Y4ljjWbj4yvF09EPfRnt+kYP2N
         rN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837208; x=1772442008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=VLggGAL8VpHmOtXRe4EXBI08CHx8lUTkrTQXMLo5V/ZVgi2doUWFdc706RT5PPjCPE
         51IlEXj6d4ct0k/ScWtPOVULXU28dpN/EIysjDyuzHIEGeMSVT6PUgVC86a3pgkhe1QP
         fcoq/y/LMf9WF1QUSPa+Ujtd/XIqc8fSv+gOtJ7qFCkFsrQy3g1YlAZELeVmhetqISlQ
         +dpfM0UeHDNAEkRnAyD3sJBHR4aK2rgZ8UHVf9PKinmkbqLKXhJmlLTSKY7xmENaZBXi
         P2cOwk3IoScolCsGnCdikOYw3S8ShgW6tIrVEA67SR6YCRI4Z2CCQvb22Zthde2fSpuN
         OJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ12B7xjDbAeX6KdyaCkub6drSubVisAxHI3990Vu4/0XMJlUXVmzsfO8LOnKTjWyNwrKHcbUS6eqgrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrtT9Jwxy9bXSjClH+L5Zao6GjKo+GL6Oy5hym1CM3qGEJVTA
	j77ZZjBTV8qNIJdAue90o24iawHGGiW9SsRZyrxOYSqLDFJPBUNxln+f3bVNAND4GQhAfwgm0BY
	WSov/thRcY9lCzNOhk8mBEzyRKWw/Gl8GwL941JWzMThds3K+/r6HzrUueaqEDiabVw==
X-Gm-Gg: AZuq6aIrYYXHtEKY0ZGqcp5AzJlLHkwxZnE4YQTDMa6sAmQRj7rqOI4T9Kq3/VY7zRA
	ToIdClcNUYrgz3tFakQ4XfmCdEOXxO7cdZeAEzXsLbLGN1uV0c5IbF0tERV2o+lCDFBbhhBxl7p
	DzxARiKQKCUBRuKVk96mRAncfgP1x3TRjAnN5etUQ1eCQJpa6xU3WJI9HKg3XIGYQhpaHLGwuc/
	Zus3+Y7wGLUn+xALqqnnzKmFPtffThh8fIzIiPnohU91/kcOi0noyEwyNSG245OdajLbe2egk48
	rqxyBwRpUg5xL9duVWz0BNH9OsdJ67vCcTdv4r4L2yOIPF2tNHPOQyRIQa/1WsTv3nwcWfYfX78
	04JfeLTgpuLRfImmyr4B3IKnesYqZ71ZBn1ruBWum6TfdwqYV1NM9
X-Received: by 2002:a05:620a:2a02:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb8ca65d49mr901114185a.38.1771837207906;
        Mon, 23 Feb 2026 01:00:07 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb8ca65d49mr901109985a.38.1771837207444;
        Mon, 23 Feb 2026 01:00:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:35 +0100
Subject: [PATCH v2 06/13] i2c: ali1535: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-6-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcC9bXEdP5Sn4fkg7K34tcVggPIty362en86
 2bK5yUtOsGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAgAKCRAFnS7L/zaE
 w2HnD/9dfwrfuwI9JNyaou0gpSZMKALGt6siXFCwiP5v/VMZFa/ZAbYQMnscjI5Uj0upHdGpOte
 uqv13A9Rl/BBSCZm8v/xgj3mjDQl4VjYfz5ADx5CIRpYUQ/e4ytiY3HULkih/OqsNCi1U+xFrw4
 DmmV8F+k03bMBYhCuKCFZpOpH6JhA49t+dTc92nci1Bj2KgEmD1gX8vfZDPRnc2NxfZYEyWO7Mm
 xBOidJdFnjKag2twYtSUYRqpFO010jrP7usg4Vo5UIhfQvQESVDdvHIQbjSre2JCFw8E7aJHGWF
 byVagIDoYVo5MaIy7ZYzn039rnGioGGfd64riNEyG0hD/lrhIzw2Mhwx1oRRBvWPvve4I6vVD1w
 bMOV+YKP5B9S30WS4UCFmmbg5Z6hmXmYj97F6PQcOLEcB6wt3LHMrpxAjd+PrXwFNdPrqS90dX/
 NEcWQsQhTHwZujx2SmuqLDKGnyqFG0XfZzQj8TGu7UnuuhaiFGfhnwv59lkHlilT7BQ/Uro8IiX
 aLvs0jmh6qbDD4u5dNWoK8o3PycqBlZHnhJ7q2uxdJaZkLYYs6TlXM8RXYi4NIdN9ssO0yPzC8s
 W4YoVNx+K67HNjCvGGJlxEEi3Q6cCeWmYwcMbtLleh5YVV7W/SzvJpJUr3RTY5jhFuvwa3IcUxV
 rbVtGFew+m/UCBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c1719 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qeKQattCTu4iihMYEEIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX04z6364j0Fxi
 n2eH2Yh6BqJPdZCLpoYI7BncvratIyfACCBualcHVtt/z+VdxVlQsVoeLYD4pOXz3pXQb+lXBnj
 ARdP7T20p5fFXwyZkHzopdhnihGepGWE8J7NEhn3BYU2MUURjze4aXLuhIwNkPMHMUuocORZ7oO
 OAsjcBk3t7H/Alu2PqeOBgAl4UY/XTkOjaxtfQCxbQNzmFF1IZEO6824dI8amzoaVLGmvHlG720
 TxcdtVrqtjdBuyquo12tuvsCyVtnovsNQ/d0UNFUk/w6WOFdm4ho1FnfDgAtPwnfb2Vsize5QyI
 0I/P+SaLSrmgvokyyeyBopZ55k4RsR+fbzZE8gQ4IQgpSMVNRqSsoYmCs494/racMN4aHRMEPn6
 2pUH1a/ggcfz8KDYdV09QGAoiAQ1zdZravqg72N4ymhPZwjt5iiQvS3tJXnNojNN0fePWCB2ORT
 Sxr/II3n0lfg4aK15Mg==
X-Proofpoint-ORIG-GUID: OpA97pT2toaUvhJJY6fdYINZPYzYRI9J
X-Proofpoint-GUID: OpA97pT2toaUvhJJY6fdYINZPYzYRI9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53163-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6250B17360D
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ali1535.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index 1eac358380405838d15551e353605cab0a7e5e65..bf0f36450c5930f86b122618d17eecf1782dd776 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -215,7 +215,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -245,7 +245,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 		 * BUSY bit may come back on when you try and use the chip
 		 * again.  If that's the case you are stuck.
 		 */
-		dev_info(&adap->dev,
+		i2c_info(adap,
 			"Resetting entire SMB Bus to clear busy condition (%02x)\n",
 			temp);
 		outb_p(ALI1535_T_OUT, SMBHSTTYP);
@@ -262,7 +262,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 			 * power reset as one of the bits now appears to be
 			 * stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"SMBus reset failed! (0x%02x) - controller or "
 				"device on bus is probably hung\n", temp);
 			return -EBUSY;
@@ -290,7 +290,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI1535_STS_FAIL) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/* Unfortunately the ALI SMB controller maps "no response" and "bus
@@ -299,7 +299,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	 */
 	if (temp & ALI1535_STS_BUSERR) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -307,14 +307,14 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI1535_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
 
 	/* check to see if the "command complete" indication is set */
 	if (!(temp & ALI1535_STS_DONE))
 		result = -ETIMEDOUT;
 
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -352,7 +352,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT)
-		dev_warn(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_warn(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 
 	/* clear status register (clear-on-write) */
 	outb_p(0xFF, SMBHSTSTS);
@@ -416,7 +416,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		}
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		result = -EOPNOTSUPP;
 		goto EXIT;
 	}
@@ -449,7 +449,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		outb_p(inb_p(SMBHSTTYP) | ALI1535_BLOCK_CLR, SMBHSTTYP);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


