Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BC726FA43
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 12:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgIRKRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 06:17:33 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:21221
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725882AbgIRKRd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 06:17:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfeRVjYQyu7Lao1h9Gtk5B0tatuoD6RRlc0CqfLS7Evzvj36uBp+n/I69lZjQrJYfEzD+vRevfwkAfOsfg3eFwhVNR6zfN7R/NTPu7/RFx3pPVppddAOT30jp+nPixol7NQdX7AH/wnuhHiSKk90OUzU/6XfnSuGPcmZjh24gCDJwVxsGKEcMEFpLDBcitXgqneJVheyXBvMZDzfwhgKtBIXHLIlyoJtBG5g/on1sleOu1GXTN7mJ5l7/zABCdVI115hii5o0KQS6q6K2RTF9AXWnFA1waXylUgW26qPH1PnPFwh8QP06/JXAqw+Yqyt2pCDT7nZNgTgYuwF0FD7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x81aBQNbky9R0P7DOxNBSdIHjueubXbYucT47hSEsg=;
 b=cDwJ626p1N64nU9sNdoCDiq+R/1MdXYkA1rLb9RWQOqSHrJziSOKmQBjCRkiqc7Z0xb9Omit0+0OwBOjF1idz09wQF0DaWGzO/Fovm09L3h4ZdadmLUtqJ15Xve2MrNkSMuFWLxwwnJ1YPwyf7Mq0NUsCTCDqU2EXtGLTIL0VAviRvNUtwcwWXeLA/5J63AMuZWqziklYLtCrE5YTvAl3NQh79xO2KnkaQTJ7Gj3UcY72yU8JnwalfoCiDi2HVXzd6+ArG3zCuwBRXZN443U4C6Ok9naAIOoEswtVwLSOwxHKURqc+hHjYCrF9J6LOCssxTqmqnE6aLD0iiHbbA9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x81aBQNbky9R0P7DOxNBSdIHjueubXbYucT47hSEsg=;
 b=bTPrwM6zEx/p5Qf8u+rwiEo8DZ+qN0qE+KQRCiQaMSV9iQmpHMnjA6wfwrbRD1VTyAgzNXfXOtruDiEDlaKZJ1kdspVmAQhNLDR4SJY05F16mWjd5vJri3O6gZBPKcBNkZYf2Yk+XygOz75lydxuZmwJyGNBTJgIZfq6NKO8s/c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 18 Sep
 2020 10:17:27 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 10:17:27 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     mchehab@kernel.org, robh+dt@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH V2 0/2] add QoS support for cpuidle system
Date:   Sat, 19 Sep 2020 02:17:15 +0800
Message-Id: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Fri, 18 Sep 2020 10:17:25 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21b83955-453b-4045-97a2-08d85bbc0b2d
X-MS-TrafficTypeDiagnostic: DBAPR04MB7432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB743231B7DB4A09D75EBF455FE63F0@DBAPR04MB7432.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eKeQNZ+cj8Q0eMW0uYvqa9beb3DT8Fqs058tDAXuvHmFAzvTcQA/TvuboZhxSFnnEFToa2cn4DzWhz+koDIaw0mg4+qhyUztLx9kkRkXEf+EaA3xcWK4Uycuk4EtzMEYubRl5KjKn/1NcADcsWd+hiMPGITiNzhZJpi9+FqJSonDdt1/6G3B4WyMMAxKBiIe0t63CUsilyD7Ci3mJQR6oPLJqHRflisTvnphzTKet53GgJEs6M8DwS8cYc69gpELEEkwpmhYXyoDPc7xYWLl8QXO7FtUleMFXEsZt/AYlaPQvu3jMhheJnDqsDJk8dnPcx7m/QsJiP2t/9qIlG8E4JHL+hOZhqAJMV6yXNUzapKCn6njS4XARYWpBeUXtXaX1R/+rwvYQ5oWys16KIztS8+KrRKMXCVeJ07H8RE/lJPP/X21g+G5ipze+Yd/Woau
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(4744005)(2906002)(1076003)(66946007)(4326008)(6666004)(52116002)(6486002)(478600001)(86362001)(316002)(69590400008)(6506007)(26005)(16526019)(83380400001)(186003)(66476007)(2616005)(66556008)(8936002)(8676002)(6512007)(956004)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: oWOWHaCILaUy44QHXLDDax4napnkO79f881AkKbNgaVc/svkpz3Jz64ybgrOHrQ+qvsZQrwHmqSw9Ep9YsSXmSy3Md4ovpp66RwL86faCSLCKZJ59+uErLCDMqzaCEike9HYKAFq498drya0XBiZoAjgGqJa293FYJbUh3C/Ih9JhQasgV1/Rm8A08KgaJJJb3fqJOGwk0jNrqg8YHAAgA5RfYn5AXT7R+/AP1CLtaB481SKN7DsotSrbXsrVKT46c19Z0WV71VxcioLMmuLiIaEUsKxCCCO6OyYyqwN7iC2CQ32z3K3GN0fGF8wS7z52TuSmmdHe3p0LDe7Jc3b8U0ca6nJuG5/N6x22H040EixL/amKXI0F4zbLFkG1aLRu74dgAZ6I1eG3Cmwur1NSxKHePhlJ7irmJRdZLnhsC5HSPo6m5jeLC63wiHxmSTcuHylf2ccEDDWe9/JFevRvbQ88HsTXUdO8tFKkboScK8J6JUkn9k9sTye5s8GhqhPZra2ZBTF2lKXtzR9aEg1eC2pAPpC5ThP+GMcdfG1Fn56D6nG2fWMMhsg2Ja/FfCdhvOwOd+EhxvKn2y0zTA6+hoeMfyzzqMBautbXFayFJ7ZMIQJkeUJcySX4UYyI4UNjlxHeVXoUzuVbsKw5Jc1WA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b83955-453b-4045-97a2-08d85bbc0b2d
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 10:17:27.6025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoG4FLLphYUbmkhHcBLhxjnKW8prG27zPKRFaUb84VdVlZWdf8iQeCraDyiRS2f8pOcsnCJ7SBHJIPCia7l4iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add QoS support for cpuidle system.

Joakim Zhang (2):
  bindings: media: gpio-ir-receiver: add linux,autosuspend-period
    property
  media: rc: gpio-ir-recv: add QoS support for cpuidle system

 .../bindings/media/gpio-ir-receiver.txt       |  3 ++
 drivers/media/rc/gpio-ir-recv.c               | 50 +++++++++++++++++++
 2 files changed, 53 insertions(+)

-- 
2.17.1

