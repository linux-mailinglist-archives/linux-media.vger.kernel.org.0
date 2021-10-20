Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2B343434D
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 04:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhJTCQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 22:16:42 -0400
Received: from mail-eopbgr1310094.outbound.protection.outlook.com ([40.107.131.94]:39072
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229555AbhJTCQm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 22:16:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2KqnrhOyQy41vBfxyFy7KKi1OaJQCcgcwY7yB30kwpLLVaCkj4nDR/rpkGfl3y4K018mxSNRNyX3zpUETbJIU5iqii6Yf6DZmVwIcIpvGu0EqI5uevT0UAxgtOWmDOg5sxEYUh7LPFZrdYoJVUvbWYHFQZ3jeQSdOrEiTlI9A7ZimGoZUxUYQVnA8CqycUCeJ+JCT2kha0ynzI47W5eFdi+rTN5uWwA0S7ZCuanwAvtFV9z3HxMUDpsuJAtM70erCU2luIuXK1QGOiRRNK67GOqZvNQS9D407lHAqRD0ZfAgMKX167JDpU/k9uTGZOwFfFY1htRgvuLiVjQfRfjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzApZZN0CDM9LWoGyqyTjvLOkCyDQxXEzJJ3sDa0sgA=;
 b=h4zgTZXTPLmWKkFyzxO6BzB0GiXuLEImiu0VojH5n4O3oW7VtLcVoNyEluK98WZgCWkRW9psklWpoirKNmI5AHZNmiZ43mj5oeKE3HYQwtpjyAl+br7Jjx1dVSAsto1gjPGZapWG3m0FurUZGm1+WFC5Am++7S7aOiMF67XqEBUoX6uCAyhfc6qhjb9BTYl3TeWozkqa0VsJI+oI4cEJZcAZpyKW6R2GNgcVCtqyztQ4FHTVQLno329guKoN3VOQqtx3c9iJ57KCQxu/G8npwWMxoqI2Scvz/GDE2KSGNHEYimpP7xDJD5/pYNpEeDqs/mgK+G/d2dsobHHZQEey2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzApZZN0CDM9LWoGyqyTjvLOkCyDQxXEzJJ3sDa0sgA=;
 b=PXLIOjIxEOZG/XLDMmY2vjuniPEB08Vwbs6tzm4g5AH9REaR6B4M/otOGs4+HOC3qI4GsiN78+RLn2pmmv7JIxMUzukkwNCpm02NkfgwBMUO2xRGejqR4hxwbGIy9MkjsB43UyozPXpmlHBnqM7fs1m2DZcrjSnwcFTFk/cOFOU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3244.apcprd06.prod.outlook.com (2603:1096:100:3b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 02:14:22 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 02:14:22 +0000
From:   Qing Wang <wangqing@vivo.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Qing Wang <wangqing@vivo.com>
Subject: [PATCH V3] media: i2c: ccs: replace snprintf in show functions with sysfs_emit
Date:   Tue, 19 Oct 2021 19:14:15 -0700
Message-Id: <1634696055-55861-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (103.220.76.181) by HK0PR03CA0105.apcprd03.prod.outlook.com (2603:1096:203:b0::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4608.18 via Frontend Transport; Wed, 20 Oct 2021 02:14:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8322ae22-12ce-4005-dcb4-08d9936f54a7
X-MS-TrafficTypeDiagnostic: SL2PR06MB3244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB324421D693DF09C8D0546E63BDBE9@SL2PR06MB3244.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oe1V5C53duXwZEvd06zw1Edwzu6aqWUvojoA9AHA5DkVKN0HxllZy3qifwkj9fR9UBML87GKBRD0ycgmWdRVDxozGh1v6l5dNSq0RrQcYWjHfr7yEdrV20vf0sOzz2RYuUQptgklWFm2Z6DpyvUfFGRCLjNOXs0W+6tQr8qMVrQCDxjeHQG7Wpi/GmJbRbIFxas9g5U6DhZsrZRi1+uz72Qq/vsgk8eptXohKg1bncp2PPpkk3f6Dc6MMWDJKLA2ty2Mr9b/JZicmfAnDivcZ3Ohkj7MFCXEVpLLrvc4GhfuEmSrAEiFCgL9PchL0+Ee15bg8E28Y9TjKTnPsjsdcNbwLWOcszkfkAXso4nvo9rD+YuRO1fPm2/fSLZK9f5IxaRx4uXnbk/pzZnwxY/m0gg5T7pgDZKSoKpjs3hRA1xLXTZbPgP4aEZX8pZ+pedakUYqh/K0mVkj2YRi8oMHLY+OH3cph9fClZ+rKq4HMcFGfnxMo6V/Zm7GctAqFeY2rIuFbdqTdu6+ACxZ2DulD2eRLQ5yhTJWm6g5Vnus89l5rK1NnLKgW57w8Y3APL3YJ8tGSEuiiAO7/o3j7ldGxKPCTyUi1XbXE9kXwVnm/sWd+tvA9eaYz1P13+hVH9xO0fLK5C9Gwwj2Xq06zcR/x6IN/JRzuWUF8cE7wbfM4KxbGtTMnSjq5XHumfcpRI/Jtoxn0CF7YNMecp4mHC84VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66946007)(5660300002)(66556008)(508600001)(66476007)(186003)(4326008)(110136005)(26005)(2906002)(8936002)(6512007)(38100700002)(38350700002)(956004)(6666004)(2616005)(107886003)(6506007)(52116002)(36756003)(86362001)(8676002)(83380400001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qpb/3L1+VMCYcvZ3vttF5cV1Harygq65xkYGp3tOLetzK4vqavMTS2nFM+xB?=
 =?us-ascii?Q?gxktNbFti8AA6AxUOUQVgNOPJqaaFluku5dG5sx2Xrrgnaq/Bqb2LR9g0mNv?=
 =?us-ascii?Q?8Boygqf9gE9Ku7pzgXFqETaJ63rEKeMKxqIn9aM/YKVEmvCuxxcPu/HaCw8i?=
 =?us-ascii?Q?wZ+VNSO7pyxopO20x2FWWCBcSLr+0PzpmLkbwNJId8i+WaPf2DP2iggU6SDe?=
 =?us-ascii?Q?pHVu5B1tyFHfXrjhDPiv02sX/kS/Lnj8d1JwJy+zLd1lPC9QGKA4fX1rNhJe?=
 =?us-ascii?Q?/bnLjG+r/bNJTbtKsUCFOSTq6wNvqPNPL1FZAFmz6n/u7TIkh26EE7pm/FZq?=
 =?us-ascii?Q?rW8mZIPRINu5nrn4QH+IyJIFiwYOMMnm1aS3b6Br89yF++uQ1BA381DhQhoa?=
 =?us-ascii?Q?Td1oPR9o47O/gWossRWUD+7IUzEahv49qSsA16IEcDvPwtirloGyUfptXBKn?=
 =?us-ascii?Q?yJl2gKLrCDg6zB+x3/X9pUXRa3K0dTEoYhDk/qDPzj+yu/lgOm0TSDSM+jNp?=
 =?us-ascii?Q?3jj1vDgLNktD0fwCp1zZQpOMrue1eu5flLN621/KGu4fOGNX4OYME8jZ3P6/?=
 =?us-ascii?Q?1H3HCm1j/+8lYDLItrPTEAVZjw0og9uB7h029Tt+PxwOxwizFTqcbJ0MKgwl?=
 =?us-ascii?Q?5UTwedfTKPCQfyCFg3dqzyF4KBUtPuc6wnKLJccXiMEqyZTRLQAlGuAsbg7c?=
 =?us-ascii?Q?hGxBxY/8odrOyO5JmPDCryMqKG1rxOZ4m/AG+gbdcqxXCDIA5xxAs3Xw15Zm?=
 =?us-ascii?Q?DAMWY87X1nC+uNzddQGVoeGVqfSHZxMvkmmGMCDm8yifKp9h0xccOyx/gx4r?=
 =?us-ascii?Q?A/0x2XSlyMMREAk60GNCOWHNOHUU1E/SPorr/QhKNomHjccgEvqO+kDPCXIN?=
 =?us-ascii?Q?JED/q5Z+d8VPJoIZvf3W3wx2fIcpBk25Xe6u5XEDnTji4CEKXiZ6uV+kNz+K?=
 =?us-ascii?Q?wL8t0JoJrkJKQ1PcYJXV5pAnMmQDij8YXQTQA1V6EHM3SrSd0Y+aWF9Wpngc?=
 =?us-ascii?Q?keLlqEJXiKW+sFdt1T4kcok7XVneDdOc64OfcS/f4D+bPQJpFaQ9fGalVPIV?=
 =?us-ascii?Q?PUiretSDBYuD4EpBkksS9+NHbe92GKcxiHeOEE9XCHYnkYEw65YT4p5S/vos?=
 =?us-ascii?Q?M+V4qF3LMS+zueWnWEXk1dXQ+/wVvhXOU0VIk3jpdlYR6kjGIBbEgeBsfsfN?=
 =?us-ascii?Q?hO3u2sePNCLbaXyxnbaHPWlVSF+3uMw85JRPNOWTNnjczWQ2qUUzVTO5+jfE?=
 =?us-ascii?Q?CxHpzcVeFHX+TUIMqOknYdrg3oo2K7en01AVNPv1tpVSMbV7TccXLHDXi6Ci?=
 =?us-ascii?Q?3ZCy9mubHnXLCG6TPmDgX0x+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8322ae22-12ce-4005-dcb4-08d9936f54a7
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 02:14:22.3474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EjDzBqerZ4M6WQ824WlQfj66OBE34QOIUXlnLSBi/6dNuN1tE1Jzf90EPKbmegObzV8UEn+78ibniWzV95srg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3244
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

show() should not use snprintf() when formatting the value to be
returned to user space.

Fix the following coccicheck warning:
drivers/media/i2c/ccs/ccs-core.c:3761: WARNING: use scnprintf or sprintf.

V3:
- Fix some formatting problems.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 5363f3b..9158d3c
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2758,13 +2758,13 @@ ident_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct ccs_module_info *minfo = &sensor->minfo;
 
 	if (minfo->mipi_manufacturer_id)
-		return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
-				minfo->mipi_manufacturer_id, minfo->model_id,
-				minfo->revision_number) + 1;
+		return sysfs_emit(buf, "%4.4x%4.4x%2.2x\n",
+				  minfo->mipi_manufacturer_id, minfo->model_id,
+				  minfo->revision_number) + 1;
 	else
-		return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
-				minfo->smia_manufacturer_id, minfo->model_id,
-				minfo->revision_number) + 1;
+		return sysfs_emit(buf, "%2.2x%4.4x%2.2x\n",
+				  minfo->smia_manufacturer_id, minfo->model_id,
+				  minfo->revision_number) + 1;
 }
 static DEVICE_ATTR_RO(ident);
 
-- 
2.7.4

