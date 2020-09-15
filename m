Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC498269F06
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 09:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgIOHCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 03:02:09 -0400
Received: from mail-db8eur05on2065.outbound.protection.outlook.com ([40.107.20.65]:64768
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726066AbgIOHBj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 03:01:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYlf4Mu0XO63APAtJTZu/8OQ5U0qKKUU1vw3J/mh4pz6MM74TXpRQdhH7iR39jpMx9fFPjOne1uSDt9nQ6PhuwQm+ZZ4qWgnpJKiR24wL0/JMUzE9+eoH+mI/cZtYOoiRCjtsiZh9TAClUUpGNIAg6ZJVm6EK/zf6AHA367rNobm2R3p4VpKA48dZ5iRR30BU/cOP0C3bmvBJns+8tF8myqdwO9NfX/sO+swfnFxPdR4M8A4v2TpXgqygPMpyMmvXEqdqGTh9HZe364SlyQQDVDoAKe+vna2AmesJzZMZyFUNpb2x5DWRxc64nJuWPbzxISpUtZoWTSscOy0mPBcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX7vQFVUH/ZtwXP5QINwk9PfVBMGxobUEwp07n85BYQ=;
 b=oGk8UVDMSCi22mBd4nPQG/qYsR51+tl+c3gTLT7rCbHEvaySTuwAK5bvftKQO557+7FT2j9Zw2RgWiprkHh/PsJVN3v8PzYVQOc850SBJd9fqSRRNQvOnMZoWK4/x1EuhAkTEqF5LtM7r04qeCe787wbzmqq/1dI6PmN+pAa7ICZk/98X7UmBjXAbWLzPVPxv0zB0KNwWkyqit4qOYP2VqGP7thO+QuE4x9iH/tEoGF8rAMSFDR9TidSxr23bYfOIjEhJYRMghZw28hLoeQhOJG/acrqiQjr40C03hsiU/CBz+z4JaCuVB+ta+1DmdT9VlzzXHRii3A2c0DyU9rlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX7vQFVUH/ZtwXP5QINwk9PfVBMGxobUEwp07n85BYQ=;
 b=Cz0IM8JuvUugPUH+2pl89kuWgLX55AMt51hdQ+8O0Xi+KFPuYKRs7EEs0wjIPvgZCGMA+RN0ItjmZ1oa4EHDB/YPGpTYOlJtHAVTNhckL5jlOKsLWimhc5irTlFgANTKqpui3ej+tDnZytoDigk9c/nAW5EwkAB4mT4QYTFP178=
Authentication-Results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB7PR04MB5498.eurprd04.prod.outlook.com (2603:10a6:10:80::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 07:01:35 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 07:01:35 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     sean@mess.org, mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle system
Date:   Tue, 15 Sep 2020 23:02:02 +0800
Message-Id: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To DB8PR04MB6795.eurprd04.prod.outlook.com
 (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR01CA0176.apcprd01.prod.exchangelabs.com (2603:1096:4:28::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 07:01:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15395cdf-c554-49bd-0432-08d859452eed
X-MS-TrafficTypeDiagnostic: DB7PR04MB5498:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB54984E959E14FA870F17A16AE6200@DB7PR04MB5498.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /01zXYI+ChGQA9EB3LDeVgLfF2EvR6DLgEXgTpufSqCwu2ntqX5EqgVUmPP+GMjPu0GHf8Qt1hA/B4km2BnC2CsnxQzDZIt+TDYv6jcp0BJMjI0tADci9pJCiZhzQVmgYxVs6XzLCEdQEgGcpF8Dr5dBVwRHQVTAUG6UorOgs3ShQRPEcgWQVZvuTUvhlXe5r17QeDZaApuGhQhEiNpmPyoxdXhU4laKQLiZHPV58BepVmW2ISycvNFRtpWQMHEjivcTtR7Avu8cU4OeTkSu0vkI4Ju5+hwF2kt1s5oA9Uz/pIFxrb8zTnM6JIe/zr7DYiak7pD8T8wn5VuIbl9i3qKMkI7DvCUeFkifsjkU6byHp97TN4dTBcoumP624letR6nqsXco4o+Om453SJmXKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(6506007)(69590400008)(2906002)(36756003)(8676002)(52116002)(66476007)(66556008)(83380400001)(5660300002)(66946007)(1076003)(956004)(2616005)(478600001)(86362001)(16526019)(316002)(4326008)(6666004)(6486002)(26005)(6512007)(186003)(8936002)(3714002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: p7CDXKV5qBRr7RmFihYDlVDTZyLz+J+nmGbyoPgznZ7A36G2aVw2Gt3Bo/wAhoL8onCG3ikgYZh/KNsbMzIQFkfPWfCrFUNRmfps5qLDCvUQWCVlR1mopWQF3V1w5t4Z6BEHq6IRMymDza37o6agtmEgpMhCeocaT2FUQpW3G9AIyA/A0PIRyTX7DWNrC4fEmxs1kqfzMSrIs9aIfgbWCwZSAEiPFrIdG9K0btETmiNsKgfwVuMFwdlYdOF3YKWj/3hLXeWXV3XjnQFln8VNKB09OISPPaH/8xgWAILhivSRQ1KEdPdTF6vmAN2XXCNAqgA7IXqXpoZQgz++H8RjVoLNBmH+dYDuYSdf94109Genl4UhfCNQmlyG9pmQiUNOEWJy0wnpq5IfI+TBA5ZFM/78KeF0YprR5jlYVAvTHYIgl9m+aW0RrX+FkllXIyfZ+OhvQ+GFSjQcRJDqpqE/h0dJZnzHmXyG40kbdQA6jilRA5rQwFyyJGDiULUMUMJz6gBG+00MezN6+IO9n65jFf85oEmV+fHC+BAU9cYj2aGxh7YsUUKtlKR4HU/e1bVnqX7rsRq1QAmAnKemwFoW2ge+lkoK8Ao0i1+fPLaudpeX5AxUkL4ZnX2hiP5tS2gyqEKgW0UQ9C/pgc/jRLcddQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15395cdf-c554-49bd-0432-08d859452eed
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 07:01:34.9647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajZPtJAa5gUN7eBT1XJb7oW1nt0TrNNvM13Nxg2D58o9E9CFiJlLpkXrqiZ7PYbw6Xd2ZJT9XlkomahN19deRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5498
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GPIO IR receive is much rely on interrupt response, uneven interrupt
latency will lead to incorrect timing, so the decoder fails to decode
it. The issue is particularly acute on systems which supports
cpuidle, dynamically disable and enable cpuidle can solve this problem
to a great extent.

However, there is a downside to this approach, the measurement of header
on the first frame may incorrect. Test on i.MX8M serials, when enable
cpuidle, interrupt latency could be about 500us.

With this patch:
1. has no side effect on non-cpuidle system.
2. latency is still much longer for the first gpio interrupt on cpuidle
system, so the first frame may not be decoded. Generally, RC would transmit
multiple frames at once press, we can sacrifice the first frame.

Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 drivers/media/rc/gpio-ir-recv.c | 49 ++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index a20413008c3c..42c942ce98cd 100644
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
 
@@ -20,17 +22,36 @@ struct gpio_rc_dev {
 	struct rc_dev *rcdev;
 	struct gpio_desc *gpiod;
 	int irq;
+	struct pm_qos_request qos;
 };
 
 static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
 {
-	int val;
+	int ret, val;
 	struct gpio_rc_dev *gpio_dev = dev_id;
+	struct device *dev = gpio_dev->rcdev->dev.parent;
+
+	/*
+	 * For cpuidle system:
+	 * Respond to interrupt taking more latency when cpu in idle.
+	 * Invoke asynchronous pm runtime get from interrupt context,
+	 * this may introduce a millisecond delay to call resume callback,
+	 * where to disable cpuilde.
+	 *
+	 * Two issues lead to fail to decode first frame, one is latency to
+	 * respond interupt, another is delay introduced by async api.
+	 */
+	ret = pm_runtime_get(dev);
+	if (ret < 0)
+		return IRQ_NONE;
 
 	val = gpiod_get_value(gpio_dev->gpiod);
 	if (val >= 0)
 		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return IRQ_HANDLED;
 }
 
@@ -92,6 +113,12 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio_dev);
 
+
+	pm_runtime_set_autosuspend_delay(dev, (rcdev->timeout / 1000 / 1000));
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_enable(dev);
+
 	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
 				IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
 				"gpio-ir-recv-irq", gpio_dev);
@@ -122,9 +149,29 @@ static int gpio_ir_recv_resume(struct device *dev)
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

