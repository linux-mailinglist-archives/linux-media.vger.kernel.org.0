Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F5F27406C
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgIVLIN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:08:13 -0400
Received: from mail-eopbgr150072.outbound.protection.outlook.com ([40.107.15.72]:9950
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726340AbgIVLIN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:08:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lf+iqz6WD3+1KbxdmjXPT9SAfOrw3xUnlTOlXug8y4/eNqHPQtaF/udarLztyQ3nFW7X8gbgN3UDAVl6H7s/V340OufCfyGNUUBmwkCsgMKrxOmJSt322UFsfXcuK9Iy2hat4WrnzVa2CqhDdmf6JkkHIIccOlOi4UxZ3rLMxSonaQQ3GW6FGwoA4jCTKVFi74kyfIVd6EMjY5XxXXdqRTNk0cu/6xq3iEaoo22LE9kPHIyKOKnL+7WByst9HOnJjSBUlKbO9N6ObXxmDfjuIZhfvlVpKU0g6ha3S+J6yftz/17t9zm78JqOaRNCyHqI19QLCURVavyA+KGMhw9/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05OVZ8/kYRlyhEMjE7mXOoJL9Q9YoCbQyDkXNqCwUE8=;
 b=ZoaYYoPj3ALWrb6Qzr4MkGGkkPVDAMCwRebUAtHIybKDHLrFdBEpK/9fSzjpm10stvfEmNQI20McoeoD32yNg0DHhrmiBSKmm7YK+FawTiAM3tH+iYKRF3zpeZemzos7R8o3PkDY3tZquiY44NzQ7Qf31rJ+8GN101iCK4KKRrmadEWEXC33n0P8Ln9BLxn8cewtzFMuY9QQBMYj8sKgILsC18dPMGm6bzwcfwfjtRCY8prLDaAL2J4hvl6dswDdAurgvpcFVTA8IuwBor4BcTC+3rFfec8oLIBZRDxBYyKzS8b/pWFKhOG0V9ka2TqyU+F5qIXBt/MKNldcF1cpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05OVZ8/kYRlyhEMjE7mXOoJL9Q9YoCbQyDkXNqCwUE8=;
 b=ANp8dl8u5J2VVG7j9Ipr0RZDTYXSwxfKXUezW2qC6cQ2IZRgc/WndkFb+a8G/5LCemNE932ZZW1L2zU1KQkUgkz19HW3/tbkDO/jEItNxLXqeaO+c0Q9mM6HNBrFSAqP+qngn6pUxrYWTIOmlJwC3RTxwdDgkemQALaamionobU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 11:08:10 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Tue, 22 Sep 2020
 11:08:10 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     mchehab@kernel.org, robh+dt@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH V3 0/2] Add QoS support for cpuidle system.
Date:   Wed, 23 Sep 2020 03:08:05 +0800
Message-Id: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To DB8PR04MB6795.eurprd04.prod.outlook.com
 (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR01CA0130.apcprd01.prod.exchangelabs.com (2603:1096:4:40::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 11:08:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12e7c713-79d1-4169-9892-08d85ee7ca54
X-MS-TrafficTypeDiagnostic: DBAPR04MB7432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB743211085C9AF004878DB6B2E63B0@DBAPR04MB7432.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xj1diHowkYi0pKE8bs6NSlM+DhLKmCoYaLFEvdfP4qNg/sbPhLSz0HQ9dWyvHCuu6hR9fKH5WtZXys+Ovr+tGdemmw547INBlb6zuGWCIdBLuTL2EuMXpjfwHfHEPb4W4yI3MtgCy5D6myfIHyS2VzAUhvsEpd+wa6GnA6v3fhAjBgGPprDFGXrv+OR6mdTVxpoeURxG0FTGQC2KmwvSQrghPHA7ruZBaHWEarRwIwlk5pAeci9e/MHXB/pFyUXcq/Cu6AAPbLYCMMIknYUMxKnMq9s+fTFEIDl4EsLaT9LLmzmkugSo9ZW27qsSv1Ouci7j6ssQn4TcY+6dwjwaUuGCcCLJ6bmNwRjqeFt3125G0vLQ8z7UMSBz8GP2oM1k5iiESyzDhu99d1retu4/xSmWa3/iFYJFmXOAs5AMfOlqC7xe/mZ97+c6xUQ3g1ry
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(36756003)(69590400008)(2616005)(956004)(16526019)(26005)(186003)(316002)(86362001)(8676002)(478600001)(8936002)(6486002)(83380400001)(52116002)(6506007)(4744005)(66556008)(2906002)(5660300002)(4326008)(66946007)(6512007)(1076003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: SFNqRt8Utp8gLUlHSVIQROWh9KzYbfCeJLgqV25s+RogNx7DTpHBRIj7Her9Q9KIA+dqZKTKeBrX7zgGAtl7wPFJsOn68GAh93UibrNddqEiAnTEhCG3/T6wk2MnKTdDCFSvMgDCvMEIoMFzNtq0VoUq8NGLz/GnmP6L8GD0FK7aog0drZZHMyDK+FOYEbyYOn5ZTJn2YSxIAWUJkMkv0QeM08CHCRwNa9ekJHnBrB6bLBIz6ItzJYuYtj78wOm9M8i2rNVecIqJzlwloAFFmvkjMRREgAz6cnedyW6iaxrjfmkd0O7oldHLpUO/0Vp7fStDsor/Icx+gsrmrzgsCvUJuq4FCa5qn0v/HWVjDk9WrkSBf912G4n6ghKvpi44H02753Rc6PxW8ogSiI5SPYPKlCJFhR4X+KioOIbzatgji4KZEpXd1ivjKaiojz6Lqhk9xNkr+9vsSFR6UTrRo6v6gbfcnzCeO3g7IFo7j6z2wsRKBomPVzH5a2UD1bG75CbFFmTX4k3dBIiIjEhY9CrkqCRu7n5k3FNCPpwhNWw9fXE5uPqFSF8Zy7ER0s37/HQtMtgEWHPUCg5ftc7lY9BfxpIhLTMEl/aLWL1Y9nn/8pFOZsmGZkB/Em9P60aPZeoUJOIU+jLeyJ0U3p2KDA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e7c713-79d1-4169-9892-08d85ee7ca54
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 11:08:10.1447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15LNuyFS9Nneyo/l1Q/K6KDPULvS8ckJ/dKXBZflg+xhlLWgCDr+Picy27LdwCbJXgbgMPtfmxuYt8gnOCchIg==
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
 drivers/media/rc/gpio-ir-recv.c               | 53 +++++++++++++++++++
 2 files changed, 56 insertions(+)

-- 
2.17.1

