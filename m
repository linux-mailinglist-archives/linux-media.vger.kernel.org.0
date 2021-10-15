Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF2542E950
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 08:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235707AbhJOGvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 02:51:38 -0400
Received: from mail-eopbgr1300135.outbound.protection.outlook.com ([40.107.130.135]:26777
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235695AbhJOGvh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 02:51:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h11GGOICq/nNRebGhOPfAHoYBwmDUjWMhNEy5iR60p06EUOMmrT3i8hQchuNA/RwP06AUeIp2+sRfhbTivxy7AwIsGQpKWePqZsCxZ2ZduQ0W7YFumaroyAeEjDq+JeXjaStmXnUxk6wt2+T/ibdf24zB8FOs6Y0++0dlgODiDPJUIKeTaCMuiosHg8NNhAR6dv8xgri1Nxbp4twFGXn3JuynyOFkSSULRhcw/Izt9mNvcjG6yz2EmRgIYHiJG9Tjpc7GXjbBOu4YUtSC9MdJgzGxdhy5iAi0uouPZt7A3j1FDmC3KKtT2vZIRIG/PXPZUgY50aDmE7D+szZWpOZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMPJ1INLkALIISx17gyF+dCIt29qJXm7HbWIXdMcUF0=;
 b=O1Ky+02ZtM/ddFkBZ8D657LpgyVviLrbkuXicbak/98jUw5lkLkT4cF9QXUvHPtICFonN66/vFvah4khLNqSVhJFstJpNZwhpm6XGOKju3AHmolexafBLfAI77bikXzeY2n52F06n/5P7mzNkrmPlBoPlwSB/WbHUDPX1WtDC/Hl54+ERVii+9vh/qmNcvZ4i1nYZSK+9vuNA16zItn7/AfYpnAK5DpkrpHoZjtMU+41zxWVEBD/FotiSo/+cyqJ7iB0DApUsF4PVUm3ZrUk2S9NgjzxrFFQhnYnibwiMuot/Socg6T7Hbd8aj8HJ+z4TVHm3NVo6PdvQvrQRyVRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMPJ1INLkALIISx17gyF+dCIt29qJXm7HbWIXdMcUF0=;
 b=Ocn9/GYGSHtN6CEZZPT+V4jiaVMEM6hVOf2i9u80rU5hX22ewS7oe3vpj5VPWDTJfnLhyevTyoy/pqrFmyaTpcFKIdTydoWYP+9X7yZd7kq343alUJV6jtc/Db+69yBp2OI+KOHllRf/63Tm7dqbu7hDVhK8s4bmGxKnQbMfSmU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3388.apcprd06.prod.outlook.com (2603:1096:100:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 06:49:29 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:49:29 +0000
From:   Qing Wang <wangqing@vivo.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Qing Wang <wangqing@vivo.com>
Subject: [PATCH] media: ccs: replace snprintf in show functions with sysfs_emit
Date:   Thu, 14 Oct 2021 23:49:22 -0700
Message-Id: <1634280562-4629-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:202:2e::27) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by HK2PR06CA0015.apcprd06.prod.outlook.com (2603:1096:202:2e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4608.17 via Frontend Transport; Fri, 15 Oct 2021 06:49:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 949315ff-fe40-4e98-068f-08d98fa7efcf
X-MS-TrafficTypeDiagnostic: SL2PR06MB3388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3388D5AF1B5771DE9CB5F18FBDB99@SL2PR06MB3388.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LyIIFe45H68gT2qg7JkxUzIZ7psspsOb1dYjTAV/sjAUXWjDSouYIzhl2m9OFCnCDfaJTED1AScZfz3E5NID2NAiwpXpSIFS5FAGk8xpCgztczMBFFLfh1XUURGxsZDYClNjoz9zjir7wcR04rm9o7tnEOP7ABFOKNQsT6JrT7nAleIbNksfaDlcA6PnCfp8pFE170RiZrtaXS1oBVRvJTxwUzJNYEGu350bb2OOX0zuqJcBj5J9oiudPxwF80dfpNpvJsCDa1uRyNsPzd7REpoUNMibsRyZwoGMXVWLy7P3STMn+AqBIcNVsOSFiw9JbVNNoBt0WfpJx0UN+o2/hRJTpLhMoxdGyWHj+3lj/va6tb0T4AvHFYZI8wn04DoST9hl3l3/OcQIvGb3NgLzjEbVgrmHUfwo1PscrVZ43L3rn8+giiH6sEnQTREGpc5N2/1OFus3rGh1DflcB2cYsVMZYLS97tsFzkof7TzHGRokEvPesUaHtSO/j/C3IYOIgC0HskZ4l/TQtYUupI94MHkJ7q57YBPcpze5TqvLvQvAKrWZl86JcIWab6ug7V//Nl8hgsPB+i6De61S5DPxiJcWIouDzcdRFYLahS8+nB/XA56PetTaia5aX+ZqPCaDBebPskB5Ae0Qw5kk6ZiZTMS55pUalzbzWcnsK1kAIITlva7K0wap8wjUj1mSq66AAHWZkJgG8KLfRKv//YPSng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(38100700002)(2616005)(316002)(2906002)(26005)(107886003)(8676002)(66556008)(83380400001)(186003)(66946007)(6486002)(956004)(508600001)(36756003)(4326008)(66476007)(6666004)(6506007)(8936002)(110136005)(5660300002)(86362001)(6512007)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sBPvtwJhZZtV4pz/is5F7e9xeWlnbIZ8/1x/mZvuSa34YQu274HhyQGz7y4I?=
 =?us-ascii?Q?/yihn+ijWBInAOHlfggCuYbk/o4qO7c9ZG8Bxdq4AU4d/J8IjHYdkAOiA6Z7?=
 =?us-ascii?Q?l17bDggyPrRmeXfbf9e5MYAWskRAgylOEHlLo/ofgYSZZVR4w02Jz0Y6rlA8?=
 =?us-ascii?Q?+M2E+3Ap35RRLhyjz87aJt2Si3N4flmrBCOUCYSp/waHrFsN3PPL4By51+f2?=
 =?us-ascii?Q?2Nu2zDsOBgmcX8kUfO64/CXSlxAXcTjUGkV27Owfm2KIJF2+tQfyTtJBE6Cy?=
 =?us-ascii?Q?ksvzhInNZMYUAkILfPhy5ZMw4nhLv6TPyIbMlB16KearCa1QIkUTSPCaTxw8?=
 =?us-ascii?Q?uMlXu+AHVFwTPJ7Y6LGoQG80Mu0hUYB7C6XshpLR5lgPYSdtNEXkomKnPD7A?=
 =?us-ascii?Q?OIQ+xG2nqgXnsJaH99LW02JlRZFqi4FrM0W8gKaHGijxTq71jZoGRLTD7R+c?=
 =?us-ascii?Q?EbT8YoS1Ieh2pDe+bmPeEQ4OrztMssHo0+t5cuz33U4WQWfWiNwjXuW7YXJh?=
 =?us-ascii?Q?nRSnWt5tzCcDLoTp1QEFygw7auOiP3i8lZL7Wl40cz4ZmTl5ovI92cE/if/D?=
 =?us-ascii?Q?2pjd9fg9a0TiyvgxlJ19FcZ378gMt7QZJLu9NIbZ3jve8va6p36+dYtR2RhC?=
 =?us-ascii?Q?GmG8cPpB/bCRGzVLA1/m3o2+vZL6+9+YcuMBM/XdMmGWjtKsUluAcyWfJ7IX?=
 =?us-ascii?Q?9DIeTJU2wZrp/kyNTL+hCdKPevDapc9Qc7MCC8bniGYEQPfL+0OLQyvpeCRU?=
 =?us-ascii?Q?xs4xsVgOssMRswd5PEakkueobYZkEP62XjVAxpy3MYuVU6mNsyJUk8dRvIoa?=
 =?us-ascii?Q?9WT2tU4YxThiNn0O8w7vmtvcs9FK99jHMI9J25J6yejhxsmO4WgEdMKN0551?=
 =?us-ascii?Q?x14gsdvQrGum6PHtZ6Ar8+3E2GsjdXL79Xih7nf/87+le16tz/AOp8gsGmQf?=
 =?us-ascii?Q?uXyLEpzeCi71UURo+L5U3ZnqqiZxN3WXQNuvw0tbGiNqDK1tHquIRMsowUip?=
 =?us-ascii?Q?FyCQLgGCwPVwZlhicKA3+Xi/GT9w8dl0HObw9HdCQpezrby/zB8smvf0ZQDB?=
 =?us-ascii?Q?wj4AeeSVrHsph1pdmD7CR59LEwBdHT8/ocBNp8MbzKkDDYIcp2FmqWjTN1DS?=
 =?us-ascii?Q?xzX3XBDJM/TY8K9m0q6dmsv9e/cu9t+C/nIr/Nic7oQ+aPK54YP9qkIzp7Mo?=
 =?us-ascii?Q?mNFslZ9Nd3UVKIlKoJTKgdMw/GIRvcGcLky0C8ZLHmgxdLxyoKiLllPXts1L?=
 =?us-ascii?Q?1uCWaRljCz0GwT7I12Z64uGHEZR+P4rT8Ez0OmkKUFtyysxtutKfQHT5c6p3?=
 =?us-ascii?Q?DGslzlCo9LFQ9IL9Lf+c4UBE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949315ff-fe40-4e98-068f-08d98fa7efcf
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:49:29.7237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEJMoDTlNBF+Wk9RmTHQkBxeN3GVxUFARf8k/8NPAfhVMJ+1zL9NYybNbhQaKu0gi/sagEMaeh+9nLm2YWvmGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3388
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

show() must not use snprintf() when formatting the value to be
returned to user space.

Fix the following coccicheck warning:
drivers/media/i2c/ccs/ccs-core.c:2717: WARNING: use scnprintf or sprintf.

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a9403a2..21a156d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2715,11 +2715,11 @@ ccs_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
 	struct ccs_module_info *minfo = &sensor->minfo;
 
 	if (minfo->mipi_manufacturer_id)
-		return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
+		return sysfs_emit(buf, "%4.4x%4.4x%2.2x\n",
 				minfo->mipi_manufacturer_id, minfo->model_id,
 				minfo->revision_number) + 1;
 	else
-		return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
+		return sysfs_emit(buf, "%2.2x%4.4x%2.2x\n",
 				minfo->smia_manufacturer_id, minfo->model_id,
 				minfo->revision_number) + 1;
 }
-- 
2.7.4

