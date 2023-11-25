Return-Path: <linux-media+bounces-1019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9195B7F8CE1
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 18:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F647B210C3
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 17:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB782D041;
	Sat, 25 Nov 2023 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1LlHdCXH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7727AD5;
	Sat, 25 Nov 2023 09:46:41 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3APDTRoR020744;
	Sat, 25 Nov 2023 18:46:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=eOwChtT
	kTf51cQ+B99qQKr3Mv07Cb4dOooViFH+WIec=; b=1LlHdCXHtVAmZSTv+dQMHLT
	tU8/LOV8YwCW4LGdAbZWSjwmcpejr3vEmV1qZkvTlB8WXdjxOdzvt6o2UCqYbTR2
	3qAk2m4Y4zt8DzXUs6vwzGdPoU4A15+RBSjkt/aqfeNR7K/5enVfEuZTnSx8C+TY
	/+8oUNxlmXdWGMIlv8pW4ThJuO+5JoUXRACjLKlTmOOs40NiSGXiqd7vcVXP1wSN
	8KIUuMvi80gLy+1l7rG+lO+6Pb8rHneagpfiM9pWtKycV8BIUU+Hy9w7sH5Z3IrB
	hxT+iXSnlA+IUEzUIAOHD/4I6hJMjNOrqZCPfR8SUHqThMPkiCtBI45sxvUOmhw=
	=
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk951htjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Nov 2023 18:46:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D7C510002A;
	Sat, 25 Nov 2023 18:46:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12B1F237D60;
	Sat, 25 Nov 2023 18:46:24 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 25 Nov
 2023 18:46:24 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Alain Volmat <alain.volmat@foss.st.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] media: i2c: st-vgxy61: add subdev events & fwnode ctrls
Date: Sat, 25 Nov 2023 18:46:01 +0100
Message-ID: <20231125174604.1378485-1-alain.volmat@foss.st.com>
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
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-25_17,2023-11-22_01,2023-05-22_02

Correct v4l2-compliance test by adding flag V4L2_SUBDEV_FL_HAS_EVENTS
and subscribe hooks and add fwnode properties in order to be able to
expose sensor properties such as orientation & rotation.

Alain Volmat (2):
  media: i2c: st-vgxy61: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe
    hooks
  media: i2c: st-vgxy61: add v4l2_fwnode ctrls parse and addition

 drivers/media/i2c/st-vgxy61.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

-- 
2.25.1


