Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8A64D2251
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350169AbiCHUMN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350171AbiCHUML (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:11 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A804A3DD;
        Tue,  8 Mar 2022 12:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDNWTvnNfEN+fJ08JHrGlM2bXq403/qF6+UjLUFvuixMgwrYUpzbOtoZ+osKomtavffS8AbzoWzUNQUhv6eSFcPhQeWc92lIfmv86yFWLKycNc70SO14VKLKeU/YLDDM+EOsYaRwLIiBrY/ZfKDHk9AE7y2EqJV/v1ENguyS+gBoTFQ18il14wJY02rPI2413Wnsqz5Od5+sdBiJCsKGJ10/Al/1A5vmrEejZV+uJbDWfAJJlWySg/HDngk7CMgin8Byfw0lM4sP2nngAM4iaT/bUF/PYFaYErGWxk93Cdr5mpfCE/p0+hMy3zEJN4BNEFZP0IQ05qkjdboKhVSXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwgtUp97KoqLMQmUkZYRjZ62EDPsDW7BtudCOG6x1Bs=;
 b=Lan/N8zD/sp9WJ5XFo/73/sSmvjfI51l01morezRE78g6CpN99uxtHGVcxIXScWNGmZLaZOUzhTI5jDiM0nE626GUkWmAvWwNUhaLPawMXkicD2auwbsJptqS3tyqRcpvEzcRxQa4bT+vtsCk85XsZ+pG5plzCx9dfO7Zb99TmdcOgzR08qdJ5ufaqvNdxGhn8VCcrGCddnnQa0121ZdUtiDkEpamA2Tp1K9sop488Ja1AtHaybWZE2DYcXIhxBOWnNfRTGHZEBL2sUuHOD8+PWjavqZZqSgkcjqRAAPaZJNILGolTZoRIoVZNi+z2FuU17RUejGCcIUa10ySi5U4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwgtUp97KoqLMQmUkZYRjZ62EDPsDW7BtudCOG6x1Bs=;
 b=NYtr2IB8TXRety7GolNTj1OYfpCvyGpL9pvd0e0gWncjSwzvUPjL1+ENfIWuWlh/Zpg1HFbdGYZ+nDZmKt1/Qqb2LJ6Ykx/AlkMt9V3CyFL/aN3pq0CWvW5cNLxxDkSK7rX8BH76CoSz2dCW3FQAeiva8tgMkSHGqwzzPOTA12A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:08 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:08 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 9/9] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Tue,  8 Mar 2022 21:10:38 +0100
Message-Id: <20220308201038.48386-10-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c82a0cf5-cc1b-48f7-fa29-08da013fc86e
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB458892943C56F1EDDDB7B1E7BA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sw4fdZBn1/+sTQ5e63EVJj0xbwM82OUtb60QAfcVR059sY57xj23MbjC+w848f52AYo14GFQcJHWUyy1wKgRrwD8wAkxEUg/y81GuEFD0FnF/B/XZvA9nPXcfmmmclfPhBul/vLyPteblhNcRIL/Gd9gX97xuGVhPuDHVBE9SLn/Y5kwogMme2RSs2a29payhclPYt6R9ZtznRjGI+mXMFJqdPnjheKKFwtkOwoLpTvdFc8Q+9mD7U0Cnp2B7RJ5we4okC9mCNO2rnG+tnz69f1iwap27FayxP5/xxbZ53RSBchEd99CHhBdzh9ETDwgN0+rwzHgd0Mh5sTk4QKgNEaex7dJV05xJNM7CDukNgkszXNehsGmsATKIAAtLxYi2BbxXF4hKrx9XFPXvbnWnOyVHWGfsTgdGEkgaOTpQgKBs13+5rB/I3v5qmFNyBa6Xh6uc5Ax/Eh3pGu4n6D32XGG6b2oh5gC01y5e5YU3Z3XUojREl6244wvwzMGv4rK1O9JdP8azn3R/QpWF4cx9vo4XMjdX2Edivsur49XYjiOpfw89LZqHrZ3YoWGJQcsCcfK4vEilcrflRgHPbgwRwiw4shYmmEvR5vpkxXVX80bIYdrGdQFqTY2caFbzj01rTqyL7RPjXSwr93xPhhgpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(8936002)(4744005)(1076003)(186003)(2616005)(86362001)(38100700002)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u2fHLUUJFnSOkXcMeulJ8rdQnwJSoAh0XyFHPG81XDK/RQ5x6YHlOQdjPVBJ?=
 =?us-ascii?Q?Ni6gIwTosnU7W4G2MJWaIo0nxFi5RVVuq3J9ppF/xv2ujoo9j6pu+wRO2vMz?=
 =?us-ascii?Q?0NmQKcdkgCIx7xUDJeZKKP9Ol18lwWjwCrM/1+nJh0AZcGPJ43k0A+Z9ynuN?=
 =?us-ascii?Q?eVhDZ7QwCsB+J0E10xRJll+oqmMGmL4iLsYIFzDnaa7ZWY3K339dK3Bx0Ovp?=
 =?us-ascii?Q?xmjvmu64XwdKhl4V8vszwXMirtkYm7s7I8B+bEuInjsKV0129hTT3pQSAf7z?=
 =?us-ascii?Q?J9P2SaoMOQduwvBwKNg/RPWSAoClSsX4WO3w+hoTdD44Cc23HSth9RNkC+XJ?=
 =?us-ascii?Q?hIR0eQ6pWJM6lYHx1zfLh60mIxr93IS7y9gNRg7drbvtj9A1rJ9tJukykE9+?=
 =?us-ascii?Q?M/4K06DzgLIfFUKC9OAOttHQjT7TNFJFPM1W8Mp5hFZ/EQED75/E3Vo5O5t8?=
 =?us-ascii?Q?mMHhzVzE4Zvdv9PVYq0m85n7z8KafteT+3Z1sxx/S5zZ6mY2J2tFVNyMPjQN?=
 =?us-ascii?Q?BKQFa9K3YEq0ZXjyymcEMq9d9m4YXD2k1qMxxMXO2U6z1fzh+r4pUDMj1xWW?=
 =?us-ascii?Q?9wZp9TMKP/ZlY8o8b5Kah5zsAwjAk/7Fq+nMxpy7JT9IfRGQr3ZPVtYlc/0t?=
 =?us-ascii?Q?qxLZys/7sYOnHrjrm2clQ0if+JNpF+lOsEWnsSsxE84tYRWo10ccrW6zRBqI?=
 =?us-ascii?Q?Xc/mrrk6M1n5MMv/9dUVgZ6W1g/JNGCQ0ko4bbQG89t2+tLgm6n+mDOGZPBs?=
 =?us-ascii?Q?r/p28r9EVcSk4UPSI5aAzjbi49tQsgIjRmFASjlqPLYhjWmkGIn5igLkMqM0?=
 =?us-ascii?Q?bfkcEwehuvXHNNhOJNoePEkp6uWU/7zjOY79tNm6slw+xy+w/7moij672tws?=
 =?us-ascii?Q?lZaZb46HY+qFHr0D5eXzkWHYUKxNF2hMW5IGOlxmqiijV3tAzVdMAib8Sitt?=
 =?us-ascii?Q?RFQW1g6CtDcBi0qAfnXHglrGGbTGD3O7BKPwL/PRuWV9U9jizy1TTR2oor44?=
 =?us-ascii?Q?jJ2LxS82ujf+FEga5Orcm9fhnFwgBIhfNoH1JmdPVAR3G+TPJ9u7Kj+Yo/DV?=
 =?us-ascii?Q?+v6BohCYr6yGHGjKEAY2+9h0QiTR/cpkGbHepnMM3Uo1iMBnFz3/LnDcWN9X?=
 =?us-ascii?Q?QSUbgQpoQ+rYYlmFR3dtcRoZp7tpwQo4V3INdVKfd3oXH5SrxWHXNmbCMlgx?=
 =?us-ascii?Q?/H/OrRakpVXofzPs8Auzz2bJ9An+HFePlv8n8Aens6bU3uztLbuk3iXwQn1Z?=
 =?us-ascii?Q?KUxb2v9Y1CPtciohtRhNVCm+tutlL5EKmSNaLtj+ah1JRUEouY9lgkJwgd74?=
 =?us-ascii?Q?spPsv2IoQiZCx8hDm/UNg00gEQ/rDI3btXRH8UcBiBvAjkiWzjgvcX+H030c?=
 =?us-ascii?Q?SozSpRahhsu5CAmoGH3WPfw0bY5UgH0I4JmRJd0ZTDZyhbJvTkRjThWw3/SW?=
 =?us-ascii?Q?P/CbotXEgYcswi6RVc22TkDPUfpd+xu7kPhldhtmoPIsgBssYbdmuG24PxUl?=
 =?us-ascii?Q?fyicstYUQeHCC62NQdsuEW0WlQR0XWksIEUVrIJSDbgWdTcFUtQfFcn2ZZze?=
 =?us-ascii?Q?adhL7EqzwcWE0E1uNLB+0dvlHA4sGEmbUR/trvWejZJRbJ+fVJfZ4WopxERQ?=
 =?us-ascii?Q?89M58Ci5AShyPPtUT2NBBMOWMdWTdS+mekzSnSFzPuQqU2l/zDl6v2qrprHw?=
 =?us-ascii?Q?Fb2smFq6HM936GU96Cjg7/HRHQo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82a0cf5-cc1b-48f7-fa29-08da013fc86e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:08.4879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSxQfm45UpT0QYpF+potrKRSvFuPBd7IWYetfj5D+zQ+u0ZCTb/7JC0w9LfNHArgkr7kGGgpF+IQm4z+jJxzDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4588
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ae55cd558d95..8ef3eb0620ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13940,6 +13940,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
+NXP i.MX 8MP DW100 V4L2 DRIVER
+M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
+F:	Documentation/userspace-api/media/drivers/dw100.rst
+F:	drivers/media/platform/dw100
+F:	include/uapi/linux/dw100.h
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.35.1

