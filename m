Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1671269EF8
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 08:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIOG5V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 02:57:21 -0400
Received: from mail-vi1eur05on2074.outbound.protection.outlook.com ([40.107.21.74]:62944
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726033AbgIOG5O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 02:57:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5tQkDB1avc7RELppDI1DN2+8fVPWM7DU+ihkA/WWEtZGVIpERbTZkTZRSkGyRACcES5UC0NX+pxRCGaO7TbPJl+zw5c0ZBy6LQzyJUNQamZcAOowdEXLye98Q5bLB5NJfZWPPccYUxga2fDgLOaUDwJ13zo6MNXe1NsBtWCuWgL/KuwQ83X7Ivpdbg6657f4BZNEG05Zs7kzm2qbHtTl0idnBLWyr/kovBtRlgnLjgsBE7UC0Z/IyFwVokDufx2fVUZvfOyQWGzHrC53+3YEsnlb2NaK8GeV0mxA3spzhVttu6IoEo3IizuUU27F6kCG8biLa2wrbcy9D4Y6cgBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX7vQFVUH/ZtwXP5QINwk9PfVBMGxobUEwp07n85BYQ=;
 b=MP+iilyttMfjjWL5eE58LANeCHHCebjExTCh+gpahlTOBkNcdsa539BAlsoN5VBqp9CtjBQTD5O04py6mzfXQk12u8/DFa3tbA/XmVr6s2yF3Vfh8KPtmmZSHKRYDXXRFFLFlOW9anVXXPAUlQthjLzReC5Hc+/iNGkpZyV1VVc8SZDcUG7EudIeUMRMTYqGHr0ory4L0lFG3TTd/CfQb9e2rg6rcZaKHo7lFjk3UeQxWaYe+OThDo8a06HIgFD2TQaByQ4C18IxbZX3sg/+Q8cTmSVbGzn02/t+P3EqsMbgYDiDPfPJ1l0kNRUe8C20Y8kjZOd+5rrqeU9Tu9waFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX7vQFVUH/ZtwXP5QINwk9PfVBMGxobUEwp07n85BYQ=;
 b=clicT7FBWoFZVFJbQZk7BE7Kuyv9LbSATxn/S5UDHxwJnjYVeXKoYtLT6BQ3TrZJsY+KOFOmPxmWvwLdM6I//AVB80wJE7Xr+/UmO+bR/iOxf/43P+uMv/K0xTgOvam84oURv2fd0XSCQvLT1QiNGLv2LHXG6YniBzZK3mAubUY=
Authentication-Results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB7PR04MB4107.eurprd04.prod.outlook.com (2603:10a6:5:1e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 06:57:09 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 06:57:08 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     sean@mess.org, mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, LnxRevLi@nxp.com
Subject: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle system
Date:   Tue, 15 Sep 2020 22:57:34 +0800
Message-Id: <20200915145734.24022-1-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To DB8PR04MB6795.eurprd04.prod.outlook.com
 (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR02CA0060.apcprd02.prod.outlook.com (2603:1096:4:54::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 06:57:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84ba4019-96e4-4728-a701-08d859449050
X-MS-TrafficTypeDiagnostic: DB7PR04MB4107:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB41073C3ADE0229CD2D06AFDAE6200@DB7PR04MB4107.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NKjrIALnTaWX/V9+nRA/2aMjlBcSBXh5NvFu/1722Phto0VwMu8KzEnRYNi5ir561ESoZEAuc7iR4GYIJiQhD40JHuM/rb3VdFaUGk0Zqo4qN6HLEYTMEpA7qnfBUn5Egke5ZQ4HdzbkTygMyRtIiAexIMesozUYx4x2zPhkzgpGdhBGwcQ1OC+vzxU23xyUMeXsbxD/okaaNXlpcna+ehnXgEyzbykIt8fax0xWNVrruM4H5VDKbvdvBgrAWvrOtWSG6CNqf8ySszkqedMGq8b+AzVrj5ED5AKrXp8+NOmxl8UyNrzhPhgreL8JuN6fanI7pkUNW5STndwvZLgJFq8AwpNqYUASw2Gc3MREY2XjjVhmI5NlTUhgdH/4KYZTSfaIk6m36wqWdZUAOmodzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(6486002)(83380400001)(16526019)(186003)(66476007)(478600001)(66946007)(66556008)(26005)(52116002)(6666004)(6506007)(8936002)(8676002)(4326008)(2906002)(5660300002)(36756003)(956004)(2616005)(86362001)(69590400008)(1076003)(6512007)(316002)(3714002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: HmbSH4VTX3bmLQ+H22/MKc861jSyhXlu0zX6EkcL00kJ+mYyn/SAY8jDa9R81QWBEOaz7HRNOSWKBsq+9PDYbuklSh9GWmtVN8xqk7jCW7SYU/Iz9lB520fVfS/PAwbMjddhvMkp7+pe8SrDTb3Y0CswKmFaU6jCznaNPlQeZCNjOStmLa2KvkSy/g4Bbm/tJCmWNCWfk1GSeV/yWzGFj4C1HkedGiYtiKkX8myZnHQod9tjoV0ejKfkRjidzhp/Fu8EbTYOjjrSun0dKngmYay2rydCKiG/gWzC2VoHuDnON6827myRlsRdvXpo4tCbZ8xrbdBc9eA6jeNAqrfaLDSDKei5CDRydulbZaaZJaapEMIUizooBQwg4/H9rEmVJzAT5L/ItaIu0WE9ZDWMNoxPbituPIuhtz5Q15KYngxByH6W2JFJehPsIDxU4hD3IgHmn7ninV8TnuY3fY/75+5rcJetILzvozNcR5UDZLiH1PfSXoGmHGKlpoZBczQv9UxDkr6TxDpRBJSntNHcXkG5Ul60Y3YOM7N4FvZ/PbWljuc7ljMvg1Gu+LJU/SESWBkKflY8dsAdai2zKq029qyeq/pwcubzthHhVs51RT3v78SvUcfgC/kDR27wn6ME7OXbijq0VdPH9k8OteElXQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ba4019-96e4-4728-a701-08d859449050
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 06:57:08.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ds87vP2AzJ9aMvfJ8Xz+lTpUv2lHgespLa1sBptrRkdipFrsVCN4RYlgl2ZFYS4SFyWfRRI6CkxpUr0fmeo10A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4107
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

