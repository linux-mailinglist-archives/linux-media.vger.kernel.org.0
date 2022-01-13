Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CF948DCD1
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 18:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbiAMRUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 12:20:43 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52270 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230124AbiAMRUm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 12:20:42 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20DCTnGQ024245;
        Thu, 13 Jan 2022 18:20:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=toNwEi+iywkGzWNpim3RHW1l83fPbcMs07ZSO0fJ5d4=;
 b=0EzYTP7uVupL6z7KwopEskrLkt6spRvqCYr+HGpesyhVCzCwVtX3EHN9I5g1ypkpEm6l
 ccRHSGxF6Y4OnqZulduq+tJ+oVy58mEd16BhlH7a5UaHqNuc6wxKJbIL1kmFbcbMQneF
 vf/agm2dOGrSjKJP36jR70ysDlR1v+gXNYvEU16dvBVDWQLQpkcFbLFHpmGO5v2BIT4L
 OQOSjAkCnJZrZWbVLZMeg+G5y5AD5YmT+5fdZ64429din7a1HbpkSpROqN6HrBhNPZ29
 hisg3s8RUYkBpBan8p45xNU64/UoEunHQFY04/m8SgLmo0VP94+6v4nhdrsb3xybpJfh Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djfywtwk1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 18:20:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3114F10002A;
        Thu, 13 Jan 2022 18:20:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26C462194DA;
        Thu, 13 Jan 2022 18:20:19 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan 2022 18:20:18
 +0100
From:   Philippe Cornu <philippe.cornu@foss.st.com>
To:     Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Christian Konig <christian.koenig@amd.com>, <soc@kernel.org>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH 2/2] MAINTAINERS: update drm/stm drm/sti and cec/sti maintainers
Date:   Thu, 13 Jan 2022 18:19:21 +0100
Message-ID: <20220113171921.17466-3-philippe.cornu@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113171921.17466-1-philippe.cornu@foss.st.com>
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_08,2022-01-13_01,2021-12-02_01
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Alain as sti maintainer for both drm/sti & cec/sti.
Add Raphaël as stm maintainer for drm/stm.

Signed-off-by: Philippe Cornu <philippe.cornu@foss.st.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6bea080d0159..708f8c86e4c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6423,6 +6423,7 @@ F:	Documentation/devicetree/bindings/display/rockchip/
 F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
+M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
@@ -6431,6 +6432,7 @@ F:	drivers/gpu/drm/sti
 
 DRM DRIVERS FOR STM
 M:	Yannick Fertre <yannick.fertre@foss.st.com>
+M:	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
 M:	Philippe Cornu <philippe.cornu@foss.st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
@@ -18152,6 +18154,7 @@ F:	Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
 F:	sound/soc/sti/
 
 STI CEC DRIVER
+M:	Alain Volmat <alain.volmat@foss.st.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/stih-cec.txt
 F:	drivers/media/cec/platform/sti/
-- 
2.17.1

