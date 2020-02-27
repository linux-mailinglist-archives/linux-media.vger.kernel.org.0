Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 066FD17189E
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 14:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgB0NZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 08:25:49 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:49850 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729100AbgB0NZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 08:25:48 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01RDDkQ3029475;
        Thu, 27 Feb 2020 08:25:13 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ydtrx37wt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Feb 2020 08:25:10 -0500
Received: from SCSQMBX10.ad.analog.com (scsqmbx10.ad.analog.com [10.77.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 01RDP8mX013472
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 27 Feb 2020 08:25:09 -0500
Received: from SCSQCASHYB7.ad.analog.com (10.77.17.133) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 27 Feb 2020 05:25:07 -0800
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQCASHYB7.ad.analog.com (10.77.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 27 Feb 2020 05:25:07 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 27 Feb 2020 05:25:06 -0800
Received: from analog.ad.analog.com ([10.48.65.180])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 01RDP4pQ026410;
        Thu, 27 Feb 2020 08:25:04 -0500
From:   Sergiu Cuciurean <sergiu.cuciurean@analog.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <charles-antoine.couret@nexvision.fr>
CC:     Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Subject: [PATCH v2] media: spi: gs1662: Use new structure for SPI transfer delays
Date:   Thu, 27 Feb 2020 15:24:54 +0200
Message-ID: <20200227132454.2875-1-sergiu.cuciurean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227131000.29264-1-sergiu.cuciurean@analog.com>
References: <20200227131000.29264-1-sergiu.cuciurean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-27_03:2020-02-26,2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=976
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270103
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In a recent change to the SPI subsystem [1], a new `delay` struct was added
to replace the `delay_usecs`. This change replaces the current
`delay_usecs` with `delay` for this driver.

The `spi_transfer_delay_exec()` function [in the SPI framework] makes sure
that both `delay_usecs` & `delay` are used (in this order to preserve
backwards compatibility).

[1] commit bebcfd272df6 ("spi: introduce `delay` field for
`spi_transfer` + spi_transfer_delay_exec()")

Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
---

Changelog v1->v2:
*Change the remaining delays

 drivers/media/spi/gs1662.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/spi/gs1662.c b/drivers/media/spi/gs1662.c
index d789d82df7c4..f86ef1ca1288 100644
--- a/drivers/media/spi/gs1662.c
+++ b/drivers/media/spi/gs1662.c
@@ -147,11 +147,17 @@ static int gs_read_register(struct spi_device *spi, u16 addr, u16 *value)
 		{
 			.tx_buf = &buf_addr,
 			.len = 2,
-			.delay_usecs = 1,
+			.delay = {
+				.value = 1,
+				.unit = SPI_DELAY_UNIT_USECS
+			},
 		}, {
 			.rx_buf = &buf_value,
 			.len = 2,
-			.delay_usecs = 1,
+			.delay = {
+				.value = 1,
+				.unit = SPI_DELAY_UNIT_USECS
+			},
 		},
 	};
 
@@ -175,11 +181,17 @@ static int gs_write_register(struct spi_device *spi, u16 addr, u16 value)
 		{
 			.tx_buf = &buf_addr,
 			.len = 2,
-			.delay_usecs = 1,
+			.delay = {
+				.value = 1,
+				.unit = SPI_DELAY_UNIT_USECS
+			},
 		}, {
 			.tx_buf = &buf_value,
 			.len = 2,
-			.delay_usecs = 1,
+			.delay = {
+				.value = 1,
+				.unit = SPI_DELAY_UNIT_USECS
+			},
 		},
 	};
 
-- 
2.17.1

