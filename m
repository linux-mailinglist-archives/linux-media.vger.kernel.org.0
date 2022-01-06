Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BE4486687
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 16:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240387AbiAFPKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 10:10:42 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:57374 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240372AbiAFPKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 10:10:41 -0500
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20688eUK011355
        for <linux-media@vger.kernel.org>; Thu, 6 Jan 2022 16:10:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=RTJilKRxkVJc0vX6ijUH0PKAZUEJhnvDagEZbm/0ja4=;
 b=n6kv8loclWsKgm+VqRHXAumX6CafHvCACfANTB7qGMxXxui74KJOZ9BQGfPemgM14dZM
 zwFB4CmDkPZ7SUJsT2GA1VxITu2D8Oe/tgia3DfgjSqULGDHtKXnZwgcpAR0zFXPuQWF
 acPq89rgc5DUPpT3p+10de8Q5CmatlDxmeTyazWnn1zkyuM0TAnHMq8M8rRnpk2sdU1D
 Fv5oClUAUQMJcnCzU6kLvoLyFSas6aUzXsH/e1fC6skLO6G8DhMjjkM69Qp7x0MKvHLN
 1cTCWyIFmCKTaCPTD4T1qggNbAovEeJ1+iINk8drdgFVBF7L6Dv6mY2NSYhhz3yVQS88 NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ddmqckjsj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Thu, 06 Jan 2022 16:10:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C088410002A
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 16:10:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DE0322DB70
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 16:10:35 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 6 Jan 2022 16:10:34
 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH] MAINTAINERS: Change maintainers for mipid02 driver
Date:   Thu, 6 Jan 2022 16:09:40 +0100
Message-ID: <20220106150940.750397-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_05,2022-01-06_01,2021-12-02_01
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mickael left the company and is not willing to keep maintainership.
Add Sylvain and myself as maintainers of mipid02 driver.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 79fd8a012893..346f7f3a29d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18042,7 +18042,8 @@ F:	Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
 F:	drivers/iio/imu/st_lsm6dsx/
 
 ST MIPID02 CSI-2 TO PARALLEL BRIDGE DRIVER
-M:	Mickael Guene <mickael.guene@st.com>
+M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.25.1

