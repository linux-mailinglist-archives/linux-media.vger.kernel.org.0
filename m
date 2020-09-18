Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CC326FA48
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 12:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgIRKRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 06:17:40 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:21221
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726533AbgIRKRi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 06:17:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZJ4HB5qyvgg9izFbd/z1LQ6jE0Gx6GvxNxbdS8EFevLpESTd5J4JRXQ5AEOiueeXiJ5bGTZOVWkvdi2eeKNP9LIHdjVSRZadezFeA82qbJee2HsrGUNkQAI3a79IK30JDgSNwSMGTVTt9tigzblOlbMHzxbVKHMKOC5Xl58KMb6UNSm8KJhTgYD67xGyDg7LjVKr9BFp+GWwJ5r7WGq1rMXB5Px/r3Lu0pwLPgLyUwVxfceRbO7p+ilcPoe/hWkL0JDV3ydyzXTJONmc5GdPxOW2fYZuQfI8TtmKmQnuFsUGwsKaYsfH9P3ZuWRoLVI7ehfzOLuVnJNnxZ8TmsUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUxasFlBlFimlhiEr4dXrEhgSJvbQ4WTEIZkh42rTmk=;
 b=ggykjBIXupGEKMFsKHDM4fJ6g0uEDmSJvKs1s5F4NSMWEMQlE0TrTp3Y7cET7V56D4AzFrHIiE/q4VhETlam/oRVb7XFXyBvvpXWP7qHQD2tsBm5pLeWuPbWermRPr2OEH3iTvGcoXthhi+AI3gBdR2kCnHQhG86+kXEZl9WZhHxd1oaumzrWYYDzt4DPyUA0lXWLpkegTRvufd3MwjAVYviqddnbdp/AkMqG7wI6BG8zkFM+kzYxKYiTfHxbpnXbow2ClRaSOUm6bp/9zALGR11s8A2V+oewaF57gZcD9anzgkMl+edB9v3cMBCwA27OKyVFlEop6+7dUryN8o8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUxasFlBlFimlhiEr4dXrEhgSJvbQ4WTEIZkh42rTmk=;
 b=ct1hYZJovBBRNDDj0NFNHHxDv8H+1eFgpuePoQ86sfXUwK3+5oItRSnqA5zYXReDlhI4HakEp92M1qLebHDLwankc5JPQtiUdrHcFx19EXQARMsE7RjmU+KXAnd5bN3qMPPeVGQFZjouZ1BnPXC0jFio9ZLiMqKTeqAIeKKDNzU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 18 Sep
 2020 10:17:33 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 10:17:33 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     mchehab@kernel.org, robh+dt@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH V2 2/2] media: rc: gpio-ir-recv: add QoS support for cpuidle system
Date:   Sat, 19 Sep 2020 02:17:17 +0800
Message-Id: <20200918181717.24056-3-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
References: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Fri, 18 Sep 2020 10:17:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e54a3fa-7f7b-4992-e49f-08d85bbc0e90
X-MS-TrafficTypeDiagnostic: DBAPR04MB7432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB74329C6F89868EF1CD8680C9E63F0@DBAPR04MB7432.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYDXcgBK0r+1IbFV0+uNAt4Os0HpDhkr1Sz5fZ29bvJLOAzmiwJia6DtQMxAWR8fVEMVzBI3+dv2GclnWKcA9YWL3bh3X3CRPKpeJH8Qs1BVye0DuXn+YDKgU9yLs3q40497hgd/EnKAx6lm+PZFvlJXP7cwpT2Ru1FyHJPH66MV0f7EK6zvrTOsy1CXzFIrQzWjYgwWEQ0P6LKDKBWlQF6/IOkv5W2M1q4yp0MCw+n/uzAMhmiEaIIM8l4/oqkGxn+/XpZN93GE3CD0inDmRPVP7+qP4km7BNNsIM2syAh5KQ/Cawx5LhzOxeyH6bq7Am7j0ZJxQlayOPw7JRO84Jv/JOhXve6sKz/8WhLZLsEYqRKLbBe6cuX2fOYzB8n/dqM0QR2WlmCSoGfF/vRVqnH71/ygQ/iOwSiFTyDj7+6wfvUx8tuqscnF/JhLzGX892i3RAeJ7BCDRIUMml9qZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(2906002)(1076003)(66946007)(4326008)(6666004)(52116002)(6486002)(478600001)(86362001)(316002)(69590400008)(6506007)(26005)(16526019)(83380400001)(186003)(66476007)(2616005)(66556008)(8936002)(8676002)(6512007)(956004)(5660300002)(36756003)(3714002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: RZQf5ldRvr15ndUL8fcRy3RsIv8rLG+nExre/ug8qPGhH2XQNrPkkMbQyKhSSc/3bCUPnWqARhMXKPSxR/TgyaT05jwM23nEZvihRnntHrJl27Wc3x/7Nr6NUJLOypdoPbHd1GFk5H8PIk+6e6T00wNztgAMlen5+sKiHjgog+OuAx67KmoPLLGIzFXD2HcDeWaY+QwR5JnqEnL3HA36KV8otDZhZ7bd++r1zClGTcpUG2FyIslIVrDYQ/O+TENWaXv0EfJHgw9/wcLu91YBrSgUVXrJRMJ9KprV+AGeWUKs9da5ClbdtpFqnFshQKk+GtmY2ma7ZbFad/g3cSD6DGUJRpKNmxJka5oXL/7oTSbQza5JG2zbQvREoIiWUDFhY+OOwW0jE9ZFc8oAwG6888zR4tUh5LTbLt5egrrS9iqub7+9dL9XEi73dmEQYnXpb1f2W0g3Ryn9/xSrhiFemg0m+rrqOtz20nJD6EqzzAJLlfMabCd0aVieiuRdMuIo1y4RQYDASajKOi4gIgHI5USZcxHug72jgwsNiK6qU5bYJx5oLk0uXQ2JZ++7sVquoBSA0f6GKZ0vUHT+Mra+TG184bfVgg4Z1U5PED+6cFe46TR7NXoqqeSVkCzToYwyBdhyB0RX6jKWucmvrmRloA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e54a3fa-7f7b-4992-e49f-08d85bbc0e90
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 10:17:33.1790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qS9N80+aHwSJ9toZRcDLE2auxubqWNMpRbIS7x3Tl0r4vwzy96lsqU54twuD+tND+Tvsd/qgxqLa94MzfNkFeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432
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
1. has no side effect on non-cpuidle system.
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
---
 drivers/media/rc/gpio-ir-recv.c | 50 +++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index a20413008c3c..63cf8290eb19 100644
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
 
@@ -20,17 +22,35 @@ struct gpio_rc_dev {
 	struct rc_dev *rcdev;
 	struct gpio_desc *gpiod;
 	int irq;
+	struct device *dev;
+	struct pm_qos_request qos;
 };
 
 static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
 {
 	int val;
 	struct gpio_rc_dev *gpio_dev = dev_id;
+	struct device *dev = gpio_dev->dev;
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
+	pm_runtime_get(dev);
 
 	val = gpiod_get_value(gpio_dev->gpiod);
 	if (val >= 0)
 		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return IRQ_HANDLED;
 }
 
@@ -40,6 +60,7 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct gpio_rc_dev *gpio_dev;
 	struct rc_dev *rcdev;
+	u32 period = 0;
 	int rc;
 
 	if (!np)
@@ -83,6 +104,7 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 		rcdev->map_name = RC_MAP_EMPTY;
 
 	gpio_dev->rcdev = rcdev;
+	gpio_dev->dev = dev;
 
 	rc = devm_rc_register_device(dev, rcdev);
 	if (rc < 0) {
@@ -90,6 +112,14 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	of_property_read_u32(np, "linux,autosuspend-period", &period);
+	if (period) {
+		pm_runtime_set_autosuspend_delay(dev, period);
+		pm_runtime_use_autosuspend(dev);
+		pm_runtime_set_suspended(dev);
+		pm_runtime_enable(dev);
+	}
+
 	platform_set_drvdata(pdev, gpio_dev);
 
 	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
@@ -122,9 +152,29 @@ static int gpio_ir_recv_resume(struct device *dev)
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

