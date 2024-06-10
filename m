Return-Path: <linux-media+bounces-12871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E592902529
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ABACB244A8
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 15:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA45E13D615;
	Mon, 10 Jun 2024 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1H0IFhza"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7651E4A0;
	Mon, 10 Jun 2024 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032491; cv=none; b=WqaJKtD+rjldkebKadzffIZyCHjmBflwVpji9sbRvHc508WC36Zexz6bXwDFrkhtiN45X6RTu3ZmLRIL3dDD78BDpR1xeHp4v3O/PGvVqwp9reOcbtonOgpU9iOTH1QPQKfCbD5lDh0oWe1bxLvJwApBjcQPt3GzzOrEbg/f3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032491; c=relaxed/simple;
	bh=IjlJcW2rpcpR2AhzMpx2AVjJOXObCUBp5FaDLv7xw4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Op7Ljwc486bI4rtP5u9w9iHeORyaZo6B+vauES8uoqL9aEZ3G0fYtTbI0ok337rNsaaM2mVB2RGtc2FHB8gAN52GA24KVujCx5QTjdJ6HqHvcRjtazF5jB593M8Jh0ayUnlZJnbiJ8fVNgyjnTAP+rjaUqQwkIGYMKuPGPKXpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1H0IFhza; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ACQhJW012970;
	Mon, 10 Jun 2024 17:14:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NW9V2p3c6jEdfWsts/AzRAESe219hPF54H1y4m1f7Hk=; b=1H0IFhzamhX0Dprg
	4UXoYUi8bj956wyWORsaplevL7RVsSYmXr62lwovRdP884aIiv8ldwaN2Mz2AhZo
	QsknU78+knd5BoVhPGK0Qmr4GqF1dVOeIDWD8RhTrhoovkaeosDIuYLYXCuiOepg
	OCvn1JN18ufLjTScuQ2kJWTU7BYXGBRJjoh4qWTqVqbmmTvnYfLD4osSirF4E1az
	Lma+2RCe3w6q2WYDAcHhH8cmWBNGBE3L3vG2CoBoEBeUHH+MOF2x8bm+o7xP+LyB
	gYoeOkZBLVLMyPkN5voQ/zKOX96TrcxkkN+ZNWkYMorT4xuEC/QCGjXkcwtbT/gD
	J/CZZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ymcqgfsee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 17:14:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 74D774002D;
	Mon, 10 Jun 2024 17:14:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F61921B53E;
	Mon, 10 Jun 2024 17:13:48 +0200 (CEST)
Received: from localhost (10.130.72.241) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 17:13:48 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>
Subject: [PATCH 3/3] media: vgxy61: Add MODULE_ALIAS()
Date: Mon, 10 Jun 2024 17:08:15 +0200
Message-ID: <20240610150815.228790-4-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01

Preserve user space retro compatibility after the device rename.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vgxy61.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index ca3b43608dad..c85f356946ca 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1898,3 +1898,4 @@ MODULE_AUTHOR("Mickael Guene <mickael.guene@st.com>");
 MODULE_AUTHOR("Sylvain Petinot <sylvain.petinot@foss.st.com>");
 MODULE_DESCRIPTION("VGXY61 camera subdev driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:st-vgxy61");
-- 
2.25.1


