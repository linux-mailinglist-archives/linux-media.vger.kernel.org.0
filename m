Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F5226FA44
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 12:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgIRKRh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 06:17:37 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:21221
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgIRKRg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 06:17:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6G4YsILHozV4Sw1myUoXjSOCdDqtvu6ySyMckBTLhcNX4Lm1GOYmViDAZlMRjlxGAOr9p2CEykzHeemdGeDBtUm588e76MG6f9D6DxxGz3OJsXhd7LDNKph8fnbH88mepZRy8CnXHQVrYa9Zx6v9BwpDZ1rK1b6ugKiVUEjqny+69wei7P/yiWaIF0RD+HjclHgRBJerHvvviKl4+TFnO9JzkgPx9aqTzCV1jjecHagxnBFEVpz3lGtZIHw7ewB26aBSUdXWACm9IEfVox2a9tKxkZEvWzscnrOUaEcHOzg6QD+oPFcRQihBHJvTs0a0auzs6tQT0TJaA8zl7Kojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuP7q81A3DDob16GiY+EOG7lqfLlq4EKxfRUkclRGFs=;
 b=CziQ8zHjwCcFWPBDxkL5MM8cNji+qOb8+NraO/gBftdaTRQlCOMvGdSi4gQ6BESkpfVft7DNG/ZeQNRDpKVzVghNK1hyjo3wygJ87Mg8BbIEZRn/uILkHScuvw/bYPpquqbH5U6uTETK6Uow76hqDF/8g/NXbPoS9LtQzAHhRq7E8aVNmpTdKAV7iXZdl+Q94ehY/Yqrc/xUmrcDd/B0JDrL7W5Sm+3AbbbFKZ+SuXvFSTVgumbWUOpPEvgDAHJjqswA5mwZsSf9gM5g7po41LPlGTfYdAj9mEJMGnjcujlwCp7jGeoSSV18gqKg2DNOhrvs/Zb4nSpiA7fNLlXozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuP7q81A3DDob16GiY+EOG7lqfLlq4EKxfRUkclRGFs=;
 b=WxSrUPVvibzibFUY8HQfPgwprF6gnoSl1P/4cZNDwje4yKo+r6q3cWyizmaqpyk5nBdMgyP/+0JK1SbYIXiwL6ll8DXi0+sXm/l2m660g0wna+k6oZMlEYWbypPa+q3JDt6W27k9tTyF6Gszea2eQRKSLZR5CmRoMeRn49R0zZw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 18 Sep
 2020 10:17:30 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 10:17:30 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     mchehab@kernel.org, robh+dt@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH V2 1/2] bindings: media: gpio-ir-receiver: add linux,autosuspend-period property
Date:   Sat, 19 Sep 2020 02:17:16 +0800
Message-Id: <20200918181717.24056-2-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
References: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Fri, 18 Sep 2020 10:17:27 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03e64642-c96e-4e0b-1098-08d85bbc0cdb
X-MS-TrafficTypeDiagnostic: DBAPR04MB7432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7432FD4F1BD88F8CD807CE3FE63F0@DBAPR04MB7432.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JT+XKS/8aesFCg0t4WHv9DmlCVoYaB5nNd8jcoAxJ/i9fi3Z0f2UK1dXmx5qOAwn/hsFIEMteURHv6JERACH3NDxCTVzOo2AVZk2McuDXO/qpT/eB933uzfR3hcYOn4ZORnD3lRXD621+qJfshVBg3T1ZUtz1k+ndxms/+Wl8FDYpq61hQ1+dkhCAYkJV2E6Axc0fcnevwRs/yjWd/C+rWjkG0eDJSMuCM6eopPetFGz/D1Jikz3i4qkPhKA9s0yLoGPfXhwbAPst6yZ+5j3iiGFnQrSiemrfsZqFTm6svEw3E/Oh2K4u3ceINnYy1E453WvL2Cmm+sQ5n1zFxTj0shpvhx4uqIb0qoa87/Iwznyx2ckyEy/2Z/6RXAdrdM9n+7i9VVHj0TI/qYgwLpW5EUpNgGGj//TYwysSS5kpXHOOY5+nm1Qjm5YCO0sJP/7WsFuJslgNkaigVXRClZaFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(2906002)(1076003)(66946007)(4326008)(6666004)(52116002)(6486002)(478600001)(86362001)(316002)(69590400008)(6506007)(26005)(16526019)(83380400001)(186003)(66476007)(2616005)(66556008)(8936002)(8676002)(6512007)(956004)(5660300002)(36756003)(142933001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: TkaY3MG5YpKYhorEhomdps0dL1L+B3cVGXU7ZODvpqpC5UxOWIlbdCWFBWbooiufEFuzpHvkMg0FOK9R3Jk+0I83JR/0eMJMjfqvDZugEiqBs+qigPT6/Oncuoe6RM+Fe/rKOVvf47hVJQAwy7HwjM2sRF35pbgOxoUlxzDmO1RQqQu1IAAci4Hm0N/ghKjxNOMEykmhkQ+/M/LvalF0rO0hiGKZ6YlMakEc6JjpEWbWMtKUklkcbHFGChjLGHQSdwlWRiMw/jniXP9QYi2aGQHLUL169AhYE4jj2/7jweqXv/eJj3/g58O7cswBWOOW2NBrllqgYb0+uu/wx3UYBWXvi8E6gLeGmF8FdiCmH6Gb6Hd8ppguRo0O5nyIczSGNUZ4NQeAnCZyFnLvNzlacKK/1u70oCDyYq5IAMR/2nH230KqTYx8+n1PCqajea8brwV5PwlJ8E6GrdBff3uV6FIOqVFXjkrbrV+CuBk/6TtEUJO8wyJLsU4id6zRev8sRyERYo4xNE0AIZhIgxTwCZGyoKctMd0dlQVRx9vxkCRedd9JQySPpjbolOH6gD2/6lbhJT5Vm+NtI/gOTq3wh/IfKPHW9+EyMOC3K45lhO2Fm+SJarwEgc0ASrvpW8kaL8BwSQbN54yP4DSeiPP4wA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e64642-c96e-4e0b-1098-08d85bbc0cdb
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 10:17:30.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqYRvbvPkgYgmpZtQ9432VDfZb16EG36R6Eoi+PKMYp6H8yWG0Ci89RL73y7Mygdk03ydWuhVnSYY81qtZZaHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add linux,autosuspend-period property for gpio ir receiver. Some cpuidle
systems wake from idle may take a bit long time, for such case, need
disable cpuidle temporarily.

Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
ChangeLogs:
V1->V2:
	* New add.
---
 Documentation/devicetree/bindings/media/gpio-ir-receiver.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
index 58261fb7b408..ef802d5fd1f6 100644
--- a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
+++ b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
@@ -7,6 +7,8 @@ Required properties:
 Optional properties:
 	- linux,rc-map-name: see rc.txt file in the same
 	  directory.
+        - linux,autosuspend-period: autosuspend delay time,
+          the unit is milisecond.
 
 Example node:
 
@@ -14,4 +16,5 @@ Example node:
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio0 19 1>;
 		linux,rc-map-name = "rc-rc6-mce";
+		linux,autosuspend-period = 125;
 	};
-- 
2.17.1

