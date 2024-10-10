Return-Path: <linux-media+bounces-19357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC0998CCB
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 18:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8AB8B2D711
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 15:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7411CC8B2;
	Thu, 10 Oct 2024 15:41:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ADF1CBEBE;
	Thu, 10 Oct 2024 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574918; cv=none; b=pAqvvX0jaN279sJ0+2DxXG4nSeKeWulPDq/KVS95/h0sFUkin5yqjzns17JQyomsxlB71x7PfESGSCUof6DfTAyjwo2gl/4oI2Dp0asjjOy0paQg2WRxAGNHLaRu5/xYCoI5kib654zsxsByNq1AejpBWfcpDofR5JEpQGjxuHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574918; c=relaxed/simple;
	bh=OfwBAl6HoSweT/u8EjV2gqKN+yyKohk67GSL7DFVig4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f2Nn87H28xPqLV3HrC0IiqrvxCi4xE6dJ1Zg0VE5DzAMUT5W4ScBXwetlM89ioHHMv0olUa5BFvrYR9J+DIAVxs1QH2A9CWIgHO+ShtLsh0MIM/GKxq8kQLSnE7eU6sSIDu5V7cZrjK8A2x4hRq/9v3oLN58QZQXqWsOXSqfNLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XPYsL4wmWz2PVVR;
	Thu, 10 Oct 2024 23:41:58 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id F32A8140360;
	Thu, 10 Oct 2024 23:41:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 10 Oct
 2024 23:41:53 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
	<u.kleine-koenig@pengutronix.de>, <crope@iki.fi>
CC: <lizetao1@huawei.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] media: ts2020: fix null-ptr-deref in ts2020_probe()
Date: Thu, 10 Oct 2024 23:41:13 +0800
Message-ID: <20241010154113.3228533-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

KASAN reported a null-ptr-deref issue when executing the following
command:

  # echo ts2020 0x20 > /sys/bus/i2c/devices/i2c-0/new_device
    KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
    CPU: 53 UID: 0 PID: 970 Comm: systemd-udevd Not tainted 6.12.0-rc2+ #24
    Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)
    RIP: 0010:ts2020_probe+0xad/0xe10 [ts2020]
    RSP: 0018:ffffc9000abbf598 EFLAGS: 00010202
    RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffffc0714809
    RDX: 0000000000000002 RSI: ffff88811550be00 RDI: 0000000000000010
    RBP: ffff888109868800 R08: 0000000000000001 R09: fffff52001577eb6
    R10: 0000000000000000 R11: ffffc9000abbff50 R12: ffffffffc0714790
    R13: 1ffff92001577eb8 R14: ffffffffc07190d0 R15: 0000000000000001
    FS:  00007f95f13b98c0(0000) GS:ffff888149280000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000555d2634b000 CR3: 0000000152236000 CR4: 00000000000006f0
    DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
    DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
    Call Trace:
     <TASK>
     ts2020_probe+0xad/0xe10 [ts2020]
     i2c_device_probe+0x421/0xb40
     really_probe+0x266/0x850
    ...

The cause of the problem is that when using sysfs to dynamically register
an i2c device, there is no platform data, but the probe process of ts2020
needs to use platform data, resulting in a null pointer being accessed.

Solve this problem by adding checks to platform data.

Fixes: dc245a5f9b51 ("[media] ts2020: implement I2C client bindings")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/media/dvb-frontends/ts2020.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-frontends/ts2020.c
index a5baca2449c7..e25add6cc38e 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -553,13 +553,19 @@ static void ts2020_regmap_unlock(void *__dev)
 static int ts2020_probe(struct i2c_client *client)
 {
 	struct ts2020_config *pdata = client->dev.platform_data;
-	struct dvb_frontend *fe = pdata->fe;
+	struct dvb_frontend *fe;
 	struct ts2020_priv *dev;
 	int ret;
 	u8 u8tmp;
 	unsigned int utmp;
 	char *chip_str;
 
+	if (!pdata) {
+		dev_err(&client->dev, "platform data is mandatory\n");
+		return -EINVAL;
+	}
+
+	fe = pdata->fe;
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev) {
 		ret = -ENOMEM;
-- 
2.34.1


