Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E1E27407A
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgIVLJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:09:57 -0400
Received: from mail-eopbgr140088.outbound.protection.outlook.com ([40.107.14.88]:4262
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726543AbgIVLJ5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUa3IgP63a9ehosvq/IFPL71F0jY75h9GV8wImYFUIuCAdiUlre6MkWesAQYDBg/5K3rzKNV/QQ3TnaT6k6ttaxCLkJ9EzENgodI2PsBH94GQltYmff8WDcLuHdMoJX09nxOqTOEZGkC21z0HiLUfIBSfXdqz7cv6/cysg0QLNJ93qZTaRiJnn64wcbWDkAA8pLy12xTqs6OtFRbTL33ok4Gl5xLYHNC1IGIqmHsiXYeuhZjcKjGG5TQhr8FfsfSM3COJ69DnHGvkjTTcekYzFr0GXBAmRuUAdVQKzQeXzjRADmtqvUHmUuDV824vPwFiEN1MTup0XA6hOV/kiX8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIzIXYR71CLZAfmsonZq7vr0TgblzjhvhmW04k6m3EQ=;
 b=XgPAWdvouI1KUOLwLttKkBZpWRzJQwt/LBBYGibJbFoFB5cVgc65en536F9xzFaZPs7bIwwDqEMNUfUwRyJtoKDKbTSQfbRzvmujhhHRhTGHp83pIHge5WmE9q1pLG6DfZ9HNYIefS+4lJQhW1t0IkQU11cJZNZ8NP8GPZlXeleJ0CRggOxhZ8cCy4ny2GOEkmvKfwdKN5sAvuyRSnSltx49MQ1Jsfkx/zA3VjzP9M4o/ZyfSZZM1R2Zbe9NbzJjqgod2YY1KXUE5eBhLK3/NUPT7z5PJ5U3+3cVFkTwfFB3ub5EbzjQWgNCbTXn0CuZGOmyYiG6mjwApg6hBA41XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIzIXYR71CLZAfmsonZq7vr0TgblzjhvhmW04k6m3EQ=;
 b=as6ZrEqqUmY0pFddn5LIxnDEy4Z97613THJgkUIOqDvuFxyyPY5wEF2LkYyz3ywn/I599fV8/SUYg0k6TzB26E5gvR55tGuY7gjv3sotqqsbCEeMVjDXyk1ucYsb1EgQnGsUh4GoXzkq/VjVePy9RUBzXxPjSnT5UF1UXXdguf0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB6PR0401MB2327.eurprd04.prod.outlook.com (2603:10a6:4:48::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 11:08:15 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Tue, 22 Sep 2020
 11:08:15 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     mchehab@kernel.org, robh+dt@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH V3 2/2] media: rc: gpio-ir-recv: add QoS support for cpuidle system
Date:   Wed, 23 Sep 2020 03:08:07 +0800
Message-Id: <20200922190807.6830-3-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
References: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To DB8PR04MB6795.eurprd04.prod.outlook.com
 (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR01CA0130.apcprd01.prod.exchangelabs.com (2603:1096:4:40::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 11:08:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dba18315-a82e-435d-778e-08d85ee7cdc3
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2327:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB232726C7D5BCD036DC253A4BE63B0@DB6PR0401MB2327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2gwrCMoaP5YOfk0ccfyJ6TrG+Bh+vVkAPDgtJo4oxJG93TmTjJ8m/YMu905jZTbR5JAy46CDNWCmrpHRjN6ke2djiVv2QtahFv9XT1MQcI0HxTUnXaVdEHzyoXZ5QQJSUFNxFj5ZH4exo6lzmFvTaHPfmwyFiDG9hUVmFKbSPGi3dUe2a2o1gZ7HkqGGCsKFc5ZKlNQm8vjJEap64G/2Uorrq6NgnMa6hhEz4QKouzIa3X2DjRT5s8uH5eNNpSEPZBfmndycxRlG/1+yByc6E/cwGtkPe5LQgG6esVti4rulQ/hxoXloS5y/LE59pU5OQb3WNeL1puBI8gi3J3iKI1FgHWR3XykoL+dggbkY/1SiTXnm+O07BylpoiS+K+mZBnref93JBrXUk9TO9bog1qwmX4rcPcpRMKr1MZHME/cifKOsstZqUqdZaUJrDGU/YNZG9+AgqlssI8wbPAfF8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(52116002)(6512007)(5660300002)(69590400008)(26005)(16526019)(186003)(83380400001)(6486002)(86362001)(8676002)(1076003)(4326008)(66946007)(66556008)(66476007)(2906002)(6666004)(6506007)(2616005)(956004)(8936002)(478600001)(36756003)(316002)(3714002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Ip8GlflpDZkLjp3Rl0Fao70Gv8htWznGxSuSwhJZY73e7r9aRKiAZOK8ExHks2TzcuBQjGtGVZTeBJGfCc/mveTvTEiUSKgAtH29tU2UjWKRTRYlJ1lP+vY9P4JZ2wEwt+J44xyd0ZO6gB9btV/ag93BMHhdkXPZMiEAN/iGGovxtdpAmCT24v0z6eyretpADVu/JePqMJw+p3Oysnk+xe8ZIsewQS5ft+9HEd0kdF1kuAWU/ohqACIi+xRUAR4n5e8NcsUhawcDm/uXsoqDdheeOLx85OiKRYaPjUFmoF+OmHhDb6wk+ZAKehWDz5QLjtQRjyvIeEmCqnJKkdLr0HAKCaFLGvZ0VyI6+0yle05ThpNUwtu7UJ7NU/lzy42R9GOPhOiuolaHwp5PegALZ9S/bgO80UdwjP7HvKziBVhGFVkutRebjj5+sXs4sJ0AiGGX6ga1/Dqwv4afZtqmjtQtnn4eeakF46/E/smBiuX7CWHVKkav1g0gk/CcizYuPSP2y3jsc9r05kLcRs4pFssNiO9q3dBNugFcAGgpWzU5IMI0j+x2lhnYniXN9IvwIefEaBQrl0j0PIGAqdx6ERJ/o77p7NfYQLvKgCg75ouFi1JH0Doz5EdkoVBicNhg2ToRsh4Ugrb92c88seocfA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba18315-a82e-435d-778e-08d85ee7cdc3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 11:08:15.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDsP97rZX2IaPeqT8Fg/Rz28tgjBwx4ZPviqwNSG+ZyceMdafwesNkeaimQI6SwNxsacOV+csrHwYa3jXPykBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2327
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GPIO IR receive is much rely on interrupt response, uneven interrupt
latency will lead to incorrect timing, so the decoder fails to decode
it. The issue is particularly acute on some systems which support
cpuidle, not all, dynamically disable and enable cpuidle can solve this
problem to a great extent.

However, there is a downside to this approach, the measurement of header
on the first frame may incorrect. Test on i.MX8M serials, when enable
cpuidle, interrupt latency could be about 500us.

With this patch:
1. has no side effect on non-cpuidle system, even runtime pm api won't
be invoked to avoid a bunch of pm busy work for devices that do not need
it, including spinlocks, ktime, etc.
2. latency is still much longer for the first gpio interrupt on cpuidle
system, so the first frame may not be decoded. Generally, RC would transmit
multiple frames at once press, we can sacrifice the first frame.
3. add "linux,autosuspend-period" property in device tree if you also
suffer this cpuidle issue.

Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
ChangeLogs:
V1->V2:
	* set autosuspend delay time via device tree.
V2->V3:
	* let runtime pm api conditionally.
---
 drivers/media/rc/gpio-ir-recv.c | 53 +++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index a20413008c3c..22e524b69806 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -11,6 +11,8 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_qos.h>
 #include <linux/irq.h>
 #include <media/rc-core.h>
 
@@ -20,17 +22,38 @@ struct gpio_rc_dev {
 	struct rc_dev *rcdev;
 	struct gpio_desc *gpiod;
 	int irq;
+	struct device *pmdev;
+	struct pm_qos_request qos;
 };
 
 static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
 {
 	int val;
 	struct gpio_rc_dev *gpio_dev = dev_id;
+	struct device *pmdev = gpio_dev->pmdev;
+
+	/*
+	 * For some cpuidle systems, not all:
+	 * Respond to interrupt taking more latency when cpu in idle.
+	 * Invoke asynchronous pm runtime get from interrupt context,
+	 * this may introduce a millisecond delay to call resume callback,
+	 * where to disable cpuilde.
+	 *
+	 * Two issues lead to fail to decode first frame, one is latency to
+	 * respond to interrupt, another is delay introduced by async api.
+	 */
+	if (pmdev)
+		pm_runtime_get(pmdev);
 
 	val = gpiod_get_value(gpio_dev->gpiod);
 	if (val >= 0)
 		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
 
+	if (pmdev) {
+		pm_runtime_mark_last_busy(pmdev);
+		pm_runtime_put_autosuspend(pmdev);
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -40,6 +63,7 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct gpio_rc_dev *gpio_dev;
 	struct rc_dev *rcdev;
+	u32 period = 0;
 	int rc;
 
 	if (!np)
@@ -90,6 +114,15 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	of_property_read_u32(np, "linux,autosuspend-period", &period);
+	if (period) {
+		gpio_dev->pmdev = dev;
+		pm_runtime_set_autosuspend_delay(dev, period);
+		pm_runtime_use_autosuspend(dev);
+		pm_runtime_set_suspended(dev);
+		pm_runtime_enable(dev);
+	}
+
 	platform_set_drvdata(pdev, gpio_dev);
 
 	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
@@ -122,9 +155,29 @@ static int gpio_ir_recv_resume(struct device *dev)
 	return 0;
 }
 
+static int gpio_ir_recv_runtime_suspend(struct device *dev)
+{
+	struct gpio_rc_dev *gpio_dev = dev_get_drvdata(dev);
+
+	cpu_latency_qos_remove_request(&gpio_dev->qos);
+
+	return 0;
+}
+
+static int gpio_ir_recv_runtime_resume(struct device *dev)
+{
+	struct gpio_rc_dev *gpio_dev = dev_get_drvdata(dev);
+
+	cpu_latency_qos_add_request(&gpio_dev->qos, 0);
+
+	return 0;
+}
+
 static const struct dev_pm_ops gpio_ir_recv_pm_ops = {
 	.suspend        = gpio_ir_recv_suspend,
 	.resume         = gpio_ir_recv_resume,
+	.runtime_suspend = gpio_ir_recv_runtime_suspend,
+	.runtime_resume  = gpio_ir_recv_runtime_resume,
 };
 #endif
 
-- 
2.17.1

