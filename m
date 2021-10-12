Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86620429FB1
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 10:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbhJLIYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 04:24:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11978 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234549AbhJLIYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 04:24:35 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C7HRIh015608;
        Tue, 12 Oct 2021 08:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=hYEmaCz1X9F3TzBU1K2E3DOqhSwuTeSWzQb1xvwwf6k=;
 b=jMj/zLRfSZ2AGuhUtQOWcTw9dy1reAmcGAIP9tKFVrsTTSPEuXyVurKs2vqchGUmXJet
 vG5y1Gc9HDnPFpkoZGxngkCEczUC5T/KHi8yxbAsrrZ5FgXlFDruUQXDzI/xs6dn06CG
 KiQ1x4DYizY4xOLpwUyE9tSiOmovBfjLZcKBUAkqaoi+xK9+W0hU1HOjO9vcDeJKiYZC
 h+efpwD9ok26aeteoBo9LloXVdgOtRfTyBVVkzq3N6Ys8AUuSmbGP04GoQeqzHBCM2Dl
 TuccCIfRdAfyBj4ix06EZzEsVVkw1SzxJC+Tle7gjKLuacbSZJywCIR+gldwlhjQzCo9 KA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bmq3bdg9w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 08:22:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19C8F6ST001192;
        Tue, 12 Oct 2021 08:22:19 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
        by userp3030.oracle.com with ESMTP id 3bkyv8fp3f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 08:22:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5EcDQVj3uO+c1ssPYqwV8t/mB+DNG8GW8qIsRszGqlWMCZjIr6AXYGH3UeJ5aRZ3K0cmfGMiFoMardqQ5CwxzrHbExx9kdnbF+lMO5+Y6mVC8iOX681hBRJw/ystr2MU3ECOZt+wVlkKcURmLDsHzQMNcFXDtTkAKuBuG15OMLFPcib6Q0K8Cxi8OauA5hOnCSBK12uHN1nbRviEs88wJBVkNWR/bCVmzzQNIsay7Kh7iF8MFWhNCNLOwMskBptfCSWIsLEz+rlDMa4iBmLjnzAmmo257itgL9MqLGhRwzi/eLAuI325MT7JY7O1bgC1utL//zwwo77xo5+1oeabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYEmaCz1X9F3TzBU1K2E3DOqhSwuTeSWzQb1xvwwf6k=;
 b=XLnJX5kTGFEomAJvK4autAuvngMkeb9hnCdJLvjZcIy5yBQcj2wNEoP9cTUMPsruiuwONM7x+Ww55KBLcvtkSjbW0RbjkpOvxIRYvtxA7Wku7BXUu9ycWb/p2psS8jcoLbEFcZ+eugawi9/a33Uucjil8tYAfwN3UiJwPsC3LPGRxvGEyjzmgQLx+5pVaVjCWoSc3xv0UX4jwOxQSbp2XeSFn2Mo4irki5AmOxLVtCmhRFI5Tdwnm5JemKAn02m6dLsQVzIue+Z6KLtUKg2+luuIxGjMD+x6RSnoiHRJShwPlZkp/77+A4bNNGRcPs0OKmyVeYHzyoykbYJLTYlaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYEmaCz1X9F3TzBU1K2E3DOqhSwuTeSWzQb1xvwwf6k=;
 b=aMkzRBT+IP0gqUQaC0MqwiC6ie080s1YS0ddUivTcFK1v7Di84YweNxKXUW69KlE058y9n33na3IJrlVgCuFSW+vQLCpS73SJ33m9phmcuvFPeQ6PXXzUbjCsOwn3n9K0kgucwqt69xcAbQuB8xtOd+j2A90ImYBqEHMK9tPDr4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4483.namprd10.prod.outlook.com
 (2603:10b6:303:98::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 08:22:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:22:16 +0000
Date:   Tue, 12 Oct 2021 11:21:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aniket Bhattacharyea <aniketmail669@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: fix uninitialized bug in
 gmin_get_pmic_id_and_addr()
Message-ID: <20211012082150.GA31086@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO4P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (2a02:6900:8208:1848::11d1) by LO4P123CA0030.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 08:22:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5db16bd-3ebf-4141-72d8-08d98d596644
X-MS-TrafficTypeDiagnostic: CO1PR10MB4483:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB44836E3BE0F24DE3B4DF4A1A8EB69@CO1PR10MB4483.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mhhFtGzWsCieqKvvGsy7MCNsfm0GiIqKESHfHtrpYTYI3HpRCOGLjFhBbst1YD795Ibys6z7sseA31rWyASkDge2XtyZ1gBs6sN/gGFmDoW+yufWpLZt6K09aWuCslU0+U73j6qY/CSxoS4xxsGz8H4Y0b+4JvCJfUyWqiiP2ke2lvsWZYjv+cBcoheEDD8rM8PiBpjRgAzggcUFlRR3ZEOiUXxpziTWJtCMcNWy0RYdjdWbTVWD7ETDStN3y4pBaSaSazC0/rNYJdbr/MwaaweBDkgWi8UeFXdTE/v/65VyrKrJnhT/FYumgRbyUgYDOLVsbNxnGuzHomxubryrP0xLVSyOtP7MX2KmjgTNBIMTJqDWDNIKe74/qSzF+0rxg/k//l6vrmxmopU7p4ZJGPNB+k2jI5vzBbwXBKm7cc8AEfdq8GMv45ciB/BlNoX0oJcrUmFGGGj0QBCk9qSNpzADE8k/Kq+aEKsIeW8r/B5wwpChgc3EC9bXPWRiKNnfdy/bScjBvfD4ya6xaViOQN4NpmPCyHlirf5yS1Gmw1MKeW1tBDlsXspweTDIHQyRrQzSnUU3s57W65BJlGtCQ9NAUQ73Z2kP2nsOl1ePTxsxGV410jhMuaQapfCMCjIY+ZoXxmfcdI0Mpd4GEnJ1Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(66946007)(4744005)(316002)(66556008)(9576002)(6666004)(508600001)(83380400001)(52116002)(2906002)(86362001)(6496006)(1076003)(33656002)(54906003)(66476007)(9686003)(110136005)(4326008)(38100700002)(186003)(55016002)(44832011)(5660300002)(33716001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RgHNxORdoq+ETZRDN54p+gKW55NCYWkFll6GzI3xTO4bESXti9UcGT8rXjMK?=
 =?us-ascii?Q?sXNgl419kSB7KsimtiJ3r5FPDApG84MIOhm7EbZi/PilPtkdy2qRduUQcf1G?=
 =?us-ascii?Q?DiHxGB0ttcgCmghstluJedbfPVs0dzaMOIQvD++ZwVO3Xy7p2pihNYN1NyD+?=
 =?us-ascii?Q?ToBQempzZjr2hhmaG+Smi0R81/9B7v4aHcn2s0sF1tdF8zbRwTvdME42vQgo?=
 =?us-ascii?Q?LP/sYhjM4H/1H0jLTeQSjPSnfAqyvwEBnLRKJMjlBiCcoN6khmaKGQAQObyp?=
 =?us-ascii?Q?6Hvv0NPYk1iPN0g8i47ibyu8YBDka+3rPGTekeacsYaEPHnxYD2/AsgTM3EU?=
 =?us-ascii?Q?7F8O4iGVRudacuFEiB/J9QGYhj69NePfiOdIQ9QpzIC9eGgA5OFcK6E2mzKu?=
 =?us-ascii?Q?yoKDN7f0f2e4bxmlCMNNZOkbwHXea1OLGYrCOzdtAjcO3XGewOZdWP332/kT?=
 =?us-ascii?Q?Nx5zNYrjUiZBWn2KP0thSTsQz6l/ZiybWeRlwDFV2dDQFiRYU7BV/uc4LiCM?=
 =?us-ascii?Q?mWt85XebV+aV3FOj4el/WIvwJtRnX64NA8rhcJgHXyUCjTl68yFI/ja8cyTQ?=
 =?us-ascii?Q?pt3UlEt5v2iY6C8OBMIPcyRCpJ8mZwWOeyCtYOwOMHlQxCPWaHZURCcitm75?=
 =?us-ascii?Q?2iPNzkLqrgJFlm7UGNV9E/XFdPy6Ezc72XvGe4UxUYqo8ukx5HDwoPBBDWl3?=
 =?us-ascii?Q?5Zxd0Rrlnc9+rMS8J8IV+rcP+oc62h0lSuyU6KGcJ79XkBC3Go9zOOqN/v7h?=
 =?us-ascii?Q?EcJmlcY/iJXS71bDktwbenxrJdX9yVIXfzTpUDIy2mxwWZrXVPM9vDwZ2F3L?=
 =?us-ascii?Q?BLszVLLCjs0uGjsgPyhSW5KWG2Xn8tiz7SKjhfN1SKD6J1hmgBBfP2u9LdEd?=
 =?us-ascii?Q?nJ9wNbcISG70U/emqwrr1kBdwi0nBuM4BZfKZ8Ohvz2xl+1C+wJjREOv0Ul5?=
 =?us-ascii?Q?L4VniyV0InIZVPKaY4TC8eF+9mHAZVIs32dUxVEgdmV+FNG+VUPyEpvViQYA?=
 =?us-ascii?Q?hUBHBwEmbAArJJzNZNGDwwLs+Oow4cJetOptanerINiZHmN++FsBzITcF/P1?=
 =?us-ascii?Q?BMn4tWhXUTpxqjOPxIt2Q11CrXTrSBXXI6Q6Yb0ukIOoy2dFW3uCXol94X9I?=
 =?us-ascii?Q?xKUM3kWRwi/Jy5pfuIkwT2qjTGmgeIgCE4hQkaL1pgdKunBUGzGXEoyUg7e0?=
 =?us-ascii?Q?FEXfijHAw/8UHu2A5DbX5XKi4Rksqv3ZQkjtgqiBlsL3NmuVgpAZbPt9buY8?=
 =?us-ascii?Q?2rzoJTmK1735H8XsDQr5eNUdT9aDKwORrEVQC1mIL9DtvUSvEzl9KASOGUGM?=
 =?us-ascii?Q?fMwQLI2NdVV1LqnqQJJNzpoF1Q5zn7wfUKojNFW5E8gek8qSnh+txyAc7w7O?=
 =?us-ascii?Q?bOP5U4E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5db16bd-3ebf-4141-72d8-08d98d596644
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:22:16.4089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTBsUaCJa9RLXo02TWMM7gzUoilNOcz8M7Bo0awkS0ZwrbZj21gDwV9ngFf7MlGBuIwGf9hd1eCJTHT7zKHizG6hu7H+UYzYODyUwWq9FTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4483
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120046
X-Proofpoint-GUID: VD-D1UyhFz4jv-c5B-hP-fc5TDxLyiLj
X-Proofpoint-ORIG-GUID: VD-D1UyhFz4jv-c5B-hP-fc5TDxLyiLj
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "power" pointer is not initialized on the else path and that would
lead to an Oops.

Fixes: c30f4cb2d4c7 ("media: atomisp: Refactor PMIC detection to a separate function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index d8c9e31314b2..62dc06e22476 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -481,7 +481,7 @@ static int atomisp_get_acpi_power(struct device *dev)
 
 static u8 gmin_get_pmic_id_and_addr(struct device *dev)
 {
-	struct i2c_client *power;
+	struct i2c_client *power = NULL;
 	static u8 pmic_i2c_addr;
 
 	if (pmic_id)
-- 
2.20.1

