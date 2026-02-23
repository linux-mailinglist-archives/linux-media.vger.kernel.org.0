Return-Path: <linux-media+bounces-53160-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBY7H78XnGmq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53160-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:02:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11917372E
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 476FB305B466
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176061428F4;
	Mon, 23 Feb 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg0AiIF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPCxI5v2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4B834E75E
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837205; cv=none; b=EfmI3CJXM9K6KSVbtiC3KHLLNrSL5oGOZCE4UJxeVJS9fhF2jrq2P7Fep4f2Fx3dzUCdrhq4sedPJrZUhiQH3CijJYi6Ty6kKQJokoXrbvlF4ajIXm1n/kaVw+0sx5hBsFj5KgayMmGyIUjCqW7MuTxKGSSxOaYI0S/zhiqNmvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837205; c=relaxed/simple;
	bh=xJEB6Bj9odQvaoHiGEJzfUeDb7GYiDUU1EcWkZ1ZOZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMyJEldSXjwruMrFxkMUAk1DBm1toDMic4pvxR10J9ZbXY2DO+D5vWb7BmgnSFFFZHnqRjTCM6GFjbUJ6VyexcCq1GcaUZFIcl+d5t+u8O1e+5nVvnwuZ8jf4aLbTx0XAu6TxTUjeYN+N523cabI1KIEPAXH5znz6nflxCP4Dc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg0AiIF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPCxI5v2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNQ6AG2061057
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38bdVP0LjiEnonGCd6nu5N2uiQsxQ6lpthwBP1Dr5d4=; b=Tg0AiIF3DpnZN9lg
	jSu+HUdQcsQA46DdYQF25zowRHyDMgyr1ueFVwVYVklKp9KItApydX3OGSMZZVCN
	1P6Xqn7BpbtokMvDRpZtEGx+oz3WQxEbvKGE7GsoQymHY7f7uanzxV7i3hTYXHXd
	pG76o6lrBsT9yEVtJyKjsiDWG6GH0s2NdQJ2qSZqJqjXGsuOU9yVt8O75/jN/dPh
	olb4fLZ0yWlBSvn/ZG++5MHsXt9xpDUgERHUQRr4AC8Rv5UdtFympaIg55c8VqlR
	YViX7pQTlpifsICf7TA87Gwje3tAus/QJPIUDrM+kMXMXkDiZGxT2I6YO8MTX7lG
	mPKrBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so3578917685a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837202; x=1772442002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38bdVP0LjiEnonGCd6nu5N2uiQsxQ6lpthwBP1Dr5d4=;
        b=GPCxI5v2tZ2il65JJOK1ZCf4sGqxsqRvL0q2R9VxmdTGIyGYmKlmssew7dRihC+oX0
         oT55+KGVeVxgY0UVbuyS7gmQm8vkckSbFbpTZcE+/AgssOcsOgqviAz/I51tQVB7tCuU
         KUAk93oY8lAeDbSyH/rET3+lut3wvlnpN7kfVEjzQPzGPncJvPotkAmcNa1eet1dAd4i
         Yf1pdVieODdUxw3Gxoz1zYrzrVZ+75HA3FncqM9Vyq2KOIO9nuL9lMcCR7njGIGIyhpr
         jmCGYXvlFaOnSuYjX6gwAzmBZcb21E/2LkqYYw5oBogC3WnwiHmxtd7AFf03YzIvnYei
         xcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837202; x=1772442002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=38bdVP0LjiEnonGCd6nu5N2uiQsxQ6lpthwBP1Dr5d4=;
        b=oXhHO62eD4IfFohQsJPqWvcBVw5OZUI6wuhFf1wbya090CrMP8Gj79zvQAfDtRdrhW
         Zt3EjSvC9/lFMVUSgAKkmFBbNJx8brbXA63LKhuPdFq0LnKdFc3h37w4G6ORMwHjvOWW
         76VG+lrr7Mj/kEnE/PVM+2l20qMMOWKxQWpk01dOT0R9t5nOGs/3xFZtwGPiMcTRNF6W
         Djw8FBRAdMqukUD9IteSqvhbhQ/4BqdKJE8ci+FDXl+qFSr+m55nrMM9T/RhiItexjPu
         wIpS1O3aTAzOSQKRGIF8BAzdUjUzy079+uClr1BxZrigZkSrlnyjDbqCoHhDuhO42qvb
         KOSg==
X-Forwarded-Encrypted: i=1; AJvYcCWm2nynu0nlYJB2ZfkeVImZXaqjvSNpB5wNUhG22lo5eFzQdSLKKoijrDk5Cb/7N21zV5qQUcLTJTgq1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/k6ZV6ZVBta+SwEfe5QasjhL85FXOJKVrtXedtoG2Csq4Y0UK
	2H1V+YlcLfw6EC45Lu83yv2pG1LY4xPHpJR1ipY+R9spxOqTzKvDpUv6blgVuPyl1ugeiuNeVpz
	DlLz2B8oxloYjl5S48WdR6sczeb7I0gbuvoSkfFhKEVsdGsZgyfJijsv7y7TvLWc6zw==
X-Gm-Gg: AZuq6aIos4hBrG12bQkCc4OXPf0MGLPYrVPxzPQlhhhVGgE6BjfdwV2QOho2N/9vQPz
	24eLXlMKdArArCrYJTvoT4y/A57kyavwzILhjfenLrYquRuUl8xqiFhx6wK2VtQypJJ+uO64Wgs
	kGXIBgXHafNnVA+43W2VhqubrEDIlnv6rzmOTvhHf6kKXHcTZb5bBMkB5z1No/heJWkokJ+8tVj
	zRauWocY22u4dMnAxCHd7xJD1483Z+CpNh801jnqBAMZNJiFKdkgVSdfNkzmIZCocJNeXUHScKM
	60a0fNxGdD1rl5MgPG5LgTrb+nMRbJTR8mSfMitlg+XTPCWFZ7WzLGcmqQAoOwXz64MHj6w7fs0
	+szBll58TT6SGeSXdNOGVS1mzDkBdtewvOsVfXn7LG5nF3x119glw
X-Received: by 2002:a05:620a:460c:b0:8ca:3c67:8921 with SMTP id af79cd13be357-8cb8ca63f3bmr1096354185a.44.1771837201862;
        Mon, 23 Feb 2026 01:00:01 -0800 (PST)
X-Received: by 2002:a05:620a:460c:b0:8ca:3c67:8921 with SMTP id af79cd13be357-8cb8ca63f3bmr1096350085a.44.1771837201378;
        Mon, 23 Feb 2026 01:00:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:32 +0100
Subject: [PATCH v2 03/13] i2c: sun6i-p2wi: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-3-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xJEB6Bj9odQvaoHiGEJzfUeDb7GYiDUU1EcWkZ1ZOZc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb+El9mphvAj+iTdExBSZ+IP/iGZPwPhuA00
 vRc+Nf5L6GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW/gAKCRAFnS7L/zaE
 w9SmD/4wTPhBOtKt0j+RPUskTVZdtH0JK9VBMYUc683qqWmM3CXiWDNKPtDD2obj295ceOfZJbT
 BaZHznrwPSH60OPKqSMb0EcA+6v3OZxO0ji/D8jUXtzK5ojUolm561LMDuCmuBY4BGuuXJeB3zc
 mUrkHwnDN9Ec+1FTbS/rvq48MKCOCJEvjXOjDfRYDp6Vi+bVQ1mVYsWyy3fujWU/MbRpNhaKlFP
 kA9qolCGTXeu1MGBEfiR1vm/IZ8mdPMapfsfJrFDwF6X8A9Wsz/2vuIvrRthYRVhlhNDpTRzkZ6
 YTrOkj0/oPerXCvr2bk9VqqBp9beL9C+Fp26zGrsP7d1ilDrnIAyRbXoRo2nVauFUwdhrnxrxPe
 NJNgHNwucUpldARXJy9pf3IA+29cXP3Xde4fC1ZoR1iOgLO8KT3EXVuR4RgzvKTQYCXBc029GvX
 GSmdnDBbPHAPv1rZenFEjn31bwPPdHNXj2tk8/SQziUvvfs15KMY8kufbA+ZC6ZXG7n6/iX8kbW
 5hhiXqYYZv9Nx3VyQLpWzIji3eq8O9RmaO6Fih8bczvHdFvOc1KixvzPnXbw3eO7mL3Zt0XxOpd
 OjTachNYd3ZxNAA+6A0D/lLMXP7pyWlEkAK6TXQ5KAvfTOL4wOeY/ZrQ0UcmIuPS+/Jslde2S8Y
 28atuyqOOl7DbnQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1713 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3lqC0MzlwKypD_ZaiT8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXxj18CDNtRyM7
 LQNEpLfwC2jIWAlelhuAPW1M6bSI+9aA+KkzxMXWK17wG04bDuHMl0Xi1cmnm/RD/byMhJJ4E5G
 N43BXHpW/mf/dMN8yay7JbFBo5D4gDkb3+BHPTY0D02mjlpC2FPAiaUuqWaohtnIhg7rCC18sk/
 72HJriK7T6mr5mN5niCGYum7gVuWMxcXxkfNJUvubitHy6xNXJnHJwgPnE3B+Z71BucgsPSkEhv
 TqYg4egruDmHUJlfyS1izfNoLsyUKHppze7m0ORjDyl9UhDME4b32OnfuCRPPtuJTjCTCw4Z7Fa
 PCS8gA+u+EJn5ZZ7oHNUOaZi4V6DAm2Qj3ThXjBnMoxt4RmaGpLaQMXBH7HATKF58AFJIF5+8ds
 UkcEpdsMKaOOYjicS76r3mgTQsYq0EDVGyhiPxeQKY4DmDDPh6SCkDCFRHR3oR1LD/qymKaAbnC
 N9gNNIu3HdPVD9YoC3g==
X-Proofpoint-ORIG-GUID: fJiqw2MKv57SVgP-N2-ee4wo04NEUPmX
X-Proofpoint-GUID: fJiqw2MKv57SVgP-N2-ee4wo04NEUPmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53160-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: EC11917372E
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648c082f319d955b5e 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	unsigned long dlen = P2WI_DLEN_DATA_LENGTH(1);
 
 	if (p2wi->target_addr >= 0 && addr != p2wi->target_addr) {
-		dev_err(&adap->dev, "invalid P2WI address\n");
+		i2c_err(adap, "invalid P2WI address\n");
 		return -EINVAL;
 	}
 
@@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	writel(dlen, p2wi->regs + P2WI_DLEN);
 
 	if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
@@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	wait_for_completion(&p2wi->complete);
 
 	if (p2wi->status & P2WI_INTS_LOAD_BSY) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
 	if (p2wi->status & P2WI_INTS_TRANS_ERR) {
-		dev_err(&adap->dev, "P2WI bus xfer error\n");
+		i2c_err(adap, "P2WI bus xfer error\n");
 		return -ENXIO;
 	}
 

-- 
2.47.3


