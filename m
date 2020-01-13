Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B56139353
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgAMOPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:15:20 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:41521 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728774AbgAMOPU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:15:20 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mhl0I-1jLvTC41B2-00dkGK; Mon, 13 Jan 2020 15:15:11 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id A5F5D64F294;
        Mon, 13 Jan 2020 14:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VgsXzwaqNrMb; Mon, 13 Jan 2020 15:15:10 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 54CA164E74F;
        Mon, 13 Jan 2020 15:15:10 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:15:10 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 03FBA804E9; Mon, 13 Jan 2020 15:15:10 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:15:09 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 1/8] media: adv748x: add a device-specific wrapper for
 register block read
Message-ID: <20200113141509.GB3606@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1578924232.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F657D64
X-Provags-ID: V03:K1:1JPns5GasBHjZTgrFQHGNnhSdRNObQT1UzzxL7GpDV7WAKNmB4M
 FkmhKG1563Jb6HctQGmZSpMgIeSwQB+IAPuB1DWMHLL5UWjYbjY8q6VDpW2YPVZ5mXxmRAU
 7tHsDxWHLTkOkig+l361chO7oeD+NzSokH6TWf34P6Jdw3ab1GrVde5sd82zoUD+n5IywYX
 olpMdKOipTgyqYe01wKJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ohg2w/+Fy6k=:lzV+9xqdJNzc3oSdT6agH+
 thHHtKQem4M1Am71+kbcrfFKd39yx56vI1nLOMttFkaLr4qxZ7UDsxqgaGbJDoIN9r0Wrtosp
 KWSkR8EcOqyvt5mQWprLNxGywSReXV1pleSMIj9VQuCpOtVOf8CNZSJAYLvwAYuI63o8GS5FW
 4k6nOe2ZnMmvGiOm733eLxi09/+DOjrGI+ZRJCbO8Z2GsqJOcRL7gnsJfLw75l1Cbv6aKv6Gv
 Dj6YhPpGUHSQhEzbV6nzFB7MCkzSIwmnEqDzvV39q4Dn2DkgMeKK16SbskOcmeHYWK2v6wmZG
 5savYW5J0YNWjuCV1rksX067WIi00wcwYF5WaM4NdqtHFcW1HwPkSjqF68fq3Ah4BpgpxMiaA
 MVzc4VCEMNy20bYk3apcSxFyo/YHusB1Hm2mwyPsfzXZ/x2lf2FP1eKO5mGHyUJipot1UeI/X
 Jbyeu/tiWrDMaityXq+uyVvC/zp54T9beB1dXJdozTqDSvwvmcsA/nQzIA76+YZRoo2B4UFp7
 BjMI2vs5CqzzzNBPdfcrPvar1peF55ZGLgaXdYSYiP2tAFxS5ZfUZyfc6NfQpIHuNuFjxM3yr
 dV53B2pWPHPOfMorlfatB89qnN2aeXQXD0jA6Jdvw5NHu+zmj0Wxzh80SemVMrVYbj0Jf2vDt
 cTatCC3f9hlUENlkAAo+v0rBYa1/xGpjYfWonHa0qeWqS6DyqwEYO9l9nFb1M2KHpI35Ll05C
 03pH4bWxaSkw8MPXdrekRDBJrwEeH0xWsLhcqCmtJMjG89g+Sgl2Z+s5Sjljpha8PurgWr+qB
 NAQPCSK8F0X7JoQC8mdqow+2G+StDrmxIVXl7PR+qPwwobSO4f2/sJJAKkQyt/zWGfUdH9Tm9
 Ah4f3/LUgRYgWQPxVjlZ7AsmSKyB2ywV4T8hyAEtA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some of the devices I2C-accessible registers (for instance, cs_data for
stereo channel information or tmds_params for TMDS channel information)
located in adjacent cells. According to manufacturers information, these
registers can be read using block transactions.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 15 +++++++++++++++
 drivers/media/i2c/adv748x/adv748x.h      |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 23e02ff27b17..bc49aa93793c 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -97,6 +97,21 @@ static const struct adv748x_register_map adv748x_default_addresses[] = {
 	[ADV748X_PAGE_TXA] = { "txa", 0x4a },
 };
 
+int adv748x_read_block(struct adv748x_state *state, u8 client_page, u8 reg,
+		       void *val, size_t reg_count)
+{
+	struct i2c_client *client = state->i2c_clients[client_page];
+	int err;
+
+	err = regmap_bulk_read(state->regmap[client_page], reg, val, reg_count);
+	if (err) {
+		adv_err(state, "error reading %02x, %02x-%02lx: %d\n",
+				client->addr, reg, reg + reg_count - 1, err);
+		return err;
+	}
+	return 0;
+}
+
 static int adv748x_read_check(struct adv748x_state *state,
 			      int client_page, u8 reg)
 {
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 5042f9e94aee..db6346a06351 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -387,6 +387,8 @@ struct adv748x_state {
 /* Register handling */
 
 int adv748x_read(struct adv748x_state *state, u8 addr, u8 reg);
+int adv748x_read_block(struct adv748x_state *state, u8 page, u8 reg,
+		       void *val, size_t reg_count);
 int adv748x_write(struct adv748x_state *state, u8 page, u8 reg, u8 value);
 int adv748x_write_block(struct adv748x_state *state, int client_page,
 			unsigned int init_reg, const void *val,
-- 
2.24.1.508.g91d2dafee0

