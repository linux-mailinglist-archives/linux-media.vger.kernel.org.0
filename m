Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B004D3C6E1
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 11:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbfFKJDN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 05:03:13 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35346 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbfFKJDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 05:03:13 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5B8vAtA002975;
        Tue, 11 Jun 2019 11:03:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=XemdGGnt5qSbIpnmOEigc3OPcRUV5Ot9exzAZxbUUHg=;
 b=iHuTZpoIFVeiGomGe6xW4mqRtWMiWp3SD5lC3fkc4eVkXzI2iccdq2crxBGXSfmHBmhz
 iZQvmqNe4wuLgnJH9Jps6Hd0N1+Xfslk+/siUkhUlHjFPTU1KOPr2Oj7ZY2eOCUeXKBT
 FHwDXttm9Sl6NqQVHIklg3Le2AryZUWP9k3llG5M6hnoV2Yhvt8OcsP/5uWKgXTFN9XE
 rrnow/KJgROPasFSFZ3FL9jC4t/O20+K0uV62xI9WPcKlsvvUctNFHsUzgw9LU6UUyq3
 UyM0AjRzYV6lMpGmgXEIsw/5zxbBvrHPOgTG7JrnjmstnZvcQORrm9e5ChIRdpzri6rS bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2t26rkgvse-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 11 Jun 2019 11:03:04 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B0EF38;
        Tue, 11 Jun 2019 09:03:03 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 27036257A;
        Tue, 11 Jun 2019 09:03:03 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun
 2019 11:03:03 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun 2019 11:03:02
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH 0/3] Add support of RGB565, YUV and JPEG to MIPID02 bridge
Date:   Tue, 11 Jun 2019 11:02:46 +0200
Message-ID: <1560243769-17510-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-11_04:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of RGB565, YUV and JPEG to MIPID02 bridge.

Hugues Fruchet (3):
  media: st-mipid02: add support of RGB565
  media: st-mipid02: add support of YUYV8 and UYVY8
  media: st-mipid02: add support of JPEG

 drivers/media/i2c/st-mipid02.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

-- 
2.7.4

