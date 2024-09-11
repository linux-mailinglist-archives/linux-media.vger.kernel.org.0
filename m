Return-Path: <linux-media+bounces-18158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D553D9754C1
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 15:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890521F20FC9
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 13:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E50190671;
	Wed, 11 Sep 2024 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="5DEXhlLe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A21714AC;
	Wed, 11 Sep 2024 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726062738; cv=none; b=WEbtAp8wae5t4E7MLD1It3aBfDjbsZXUdcp5gilsPiZxgVFFhz8sYRWZVBsxoNII7v+oWF/ZE6gBGLmkCz7YRHE1PsNVm0TgjO+YvcxoJlsGs+GADKhd34BEhbHoIWasQv6n671ef1U8O4xc89vZK/cywe1B1TsAaXVlC2c9lRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726062738; c=relaxed/simple;
	bh=UPnb5CwXN2BdNLF7oqXNvJIjcEvtnsHHPPV/LttT9vg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tvq4oH4a3tFNo3cqxPTGh/d5DyrGeC88M+DFrx6VL07Pa88yXlbtFHGK5u+JA1hh/ztrY5Pf5ArufYY1jU13faQTRHg0oNem++sjg14z/l10F6xaCaZt07WfroisbtyfOFx6H1W5Bt3pSJXj1WKv88raEeyJBto7vTbH/NtVREc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=5DEXhlLe; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BAnBB0027599;
	Wed, 11 Sep 2024 15:51:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=8x5WYgjMDMpnQ929UybthC
	m8FyP9r1CPBj4apvbGduM=; b=5DEXhlLe3MNxVRexH5TEM92XsJG+4hQaC7cFr2
	11eMEu2XF4qXgFkaPc6gx3VqbLgqRaPF1FNc5w8I0ihgbazWyu4DQ3ur3GQya/36
	XF+xNhLDYi+ywRCTmwCPo8O97JwyAOjeu5xlWgj28kPyUIHvocm2u1z7/R60AUqO
	Vy/jyvKrYS4KRCg9Yk1FjH6y7TeDuqoRkk+0GAnBNkP9r5nkFNJITXei7Gi+NnEh
	GMEMiRmno+7uMjT23NpyFASdqz6MaBLarBgy34DetcJdnfBTDsd7Y81T1cWi9tdq
	3Wh0SCGVJ0LwAowY1zLIqbesPIdRXjaV1wcZfe67sAm6h1eg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gy7sfggb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 15:51:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C5EE740045;
	Wed, 11 Sep 2024 15:50:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C631233FE4;
	Wed, 11 Sep 2024 15:48:32 +0200 (CEST)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Sep
 2024 15:48:32 +0200
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Fritz Koenig <frkoenig@chromium.org>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Daniel Almeida
	<daniel.almeida@collabora.com>,
        Andrzej Pietrasiewicz
	<andrzej.p@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [PATCH 0/2] Add WebP support to hantro decoder
Date: Wed, 11 Sep 2024 15:48:30 +0200
Message-ID: <20240911134830.161091-1-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add WebP image decoding support to stateless V4L2 VP8 decoder.

Tested on STM32MP257F-EV1 evaluation board with GStreamer
using an updated version of V4L2 VP8 stateless decoder element:

wget https://www.gstatic.com/webp/gallery/1.webp
gst-launch-1.0 filesrc location= 1.webp ! typefind ! v4l2slvp8dec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true

Hugues Fruchet (2):
  media: uapi: add WebP VP8 frame flag
  media: verisilicon: add WebP decoding support

 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst  | 3 +++
 drivers/media/platform/verisilicon/hantro_g1_regs.h        | 1 +
 drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c     | 7 +++++++
 include/uapi/linux/v4l2-controls.h                         | 1 +
 4 files changed, 12 insertions(+)

-- 
2.25.1


