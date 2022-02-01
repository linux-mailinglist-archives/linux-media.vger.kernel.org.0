Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743824A5CB5
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 14:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237991AbiBANAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 08:00:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27502 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238131AbiBANAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Feb 2022 08:00:37 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211BJMYB003460;
        Tue, 1 Feb 2022 13:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Smup5u1PGjpI1DDXdGrWJ9jl3Lw3peRNdlmXJs//s30=;
 b=zJlRqGorpbKE7gSOcXqgQVKSX5c5MSU7FedvY4a7hhWM31T/DcfxMdBG0fCbxUm6v6wu
 d1x33MG5PXFkg38j6sQclGhjHonAP/KaCkxxWZWStY1egZntI+EEw1dRl1gDklElGJAc
 ffOCIhVPoKCQKziNVA5f5XFoa5a6SYggfUi4B8JQwlgtaAhfzCV/Z6V0g1rar6V7uIxc
 eUHQLwz3L2x15n67oFm4+g9VXy+QWK5Lr3HtEO/tIcbajMh6+2grOArV2DjWJ/WD3Wz6
 ayL7CPPJKfcIJtfBaJdpLQEFtBp8bs2H1XKckoFmyn7IiwBFba/q/K4ER9qDfuMddozs fg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dxnk2j7kj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Feb 2022 13:00:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 211CpMhT080972;
        Tue, 1 Feb 2022 13:00:29 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
        by userp3030.oracle.com with ESMTP id 3dvtq09177-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Feb 2022 13:00:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek2UAwFOwDW4oBUZP61AvQRgad8VgOznSOHgEURfdEAcWNHcW5byOprvYmH4kxRhLdEQkonNX4gjBKD9E89/Ir9/kNYCdK7mw7wb/QYl9d5fkDqoGctQWUQJNxrXtZU0RR8ZUM+CbZAcGMY+L2afksHn9B/v828GXB+eWtwMFwugF0wUxe2zY3XsoNs3GjZsFiTGd7tVTY0vAueeIIYqJ8yOuaLKFw+WceZD8JmcYYk22VVmTe3vfkSbyL2CgB/t4A28tMO13/+zsOhvI2Fr25jBPZtw4fe+FVg1a5BrG2nPf1gsZpyM/8D6oA7M2JNz40T8tX2xfEHkq8T6HVbPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Smup5u1PGjpI1DDXdGrWJ9jl3Lw3peRNdlmXJs//s30=;
 b=RMkmOdCOsNzOZa0YhoChu1Akuy42sk8g1WNAlsC0DhPECQ61ZWA1OSeoXni25YpR6WutyaoQvd5PH5pPr+NiDcIW4H7t1Q3yisNRBM8XwNHhH5mw6hjfn/F1sC90s7TSa+CM7Pyh30MPTihuJME4VAA3mDbKwiS/BSmP0801IXwWjVfm6WD5xB7dBu4FUN2SZRQQwQ1SRQhsUs3OpcRGn6bDkxwnnti/huhqTlLT7d8UGpTdJixWGZTgNLc2+0JEhbMSp3iOfzhObDUMSgmGsR5j/42iU7oHBt6lCWz4z4tCE4L2NnTahqJlfmJykepqNqraycX3ODis1mKwXyt/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Smup5u1PGjpI1DDXdGrWJ9jl3Lw3peRNdlmXJs//s30=;
 b=Ye1Y8JO++P8Lwi+Cz6+XDLLG96WKI3034wMIbRpOFlSj3O1UW2GM4zkrEv20Urvwn9rstFmpKTMfBl7lu+AVaRMM0SppwV5CjrK8nwkdaZOr86vnWkr7YLV90AGOhI97RWA4i+coLcyQF6IQJDdXACnCspyP5DuvA9pFiXFsPJk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2123.namprd10.prod.outlook.com
 (2603:10b6:4:2d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Tue, 1 Feb
 2022 13:00:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4930.021; Tue, 1 Feb 2022
 13:00:26 +0000
Date:   Tue, 1 Feb 2022 16:00:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jimmy Su <jimmy.su@intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: i2c: ov08d10: Unlock on error in
 ov08d10_enum_frame_size()
Message-ID: <20220201130016.GB22458@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1c1cedd-c50c-4cb1-1c38-08d9e582d112
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2123:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB21231133963AF1A8588A86FC8E269@DM5PR1001MB2123.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F3FlXWTqx0BqBX4/KRW/JCSw4jZc8n5DoE8FDFEwffgrlQSYySXg5vDLH+syrbkJVnXqR6BwmBLu/XqVEaQHxOrph0cEOkcImQSlaVeaY7ofC845Q53GYpweFww40S3eVYJTXNPgIhgOLriCxRPa09EWbBjbzCCO3M6cciC+ty0hFlX+nrO7/ou/yOp1yLPzNXfPyjAA2jLfdrd+ZbvvkEmqtrj/Yw1D/34pwrOl84JI9cEm9PJ2Ml7824prSXgToBpjyVtLmO6XwLvWCImTH32cojLLsZaTzd230J5J23K3mjilx4CbMf24pqplM0lAL5xK8rBgs1oYzfbu/Yp4SZ1UsRZ+0p4qi4paU0ee9OjqUYYesxPTBk14VlEeVnfcSv2C25wFqSMFts3wJIUpm860TA3x9QuiZuHs0e8nCJ8DvMuR0ODB+n2WjBe+nKE/jEkg1/lxvWCTsRXBiI1prIV9nmvevP12/V+S1G5l/Jge9HUYFcPeRdC65oGyknCfbIURbV0En/JG6/T8711pzF5VcNZ4fQFaU98HlqrjTQDd7aiR5n37YlDyhpdumS6/V2KQpxl37Ny3D7cBI9lptfyT9+UZaivKdyyR8DBAqDocdnYir/6xkVrA/a/MCVIPVTMAX+RjVqmClpUPS41aXRUJwyxOGEXJUgAXidwbMsojtYYz1vIsGJGbN8pJquG0pQu/vtGPuYT3TvpZh/TADg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(38350700002)(38100700002)(6916009)(4326008)(44832011)(83380400001)(54906003)(2906002)(186003)(33656002)(1076003)(26005)(316002)(8676002)(8936002)(5660300002)(6666004)(6506007)(508600001)(86362001)(6486002)(9686003)(33716001)(66946007)(4744005)(6512007)(52116002)(66556008)(66476007)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bY9nDHcAO2QKsDwpnbmQZ+GDbEbrNoo8VfGyRmbulAIfLpEEMEQtT5kznKhz?=
 =?us-ascii?Q?hRGub4A5tWjyAYgmuPd9dlkXhrKrBSVXxksYVVg6M/AO4+gNC3XpwGlwfwIt?=
 =?us-ascii?Q?XOHIwvq7J/r7X5wPhQDCC0YDXTfgVgkAWree+sN43C8PHjC2kTPCGqEAVT3J?=
 =?us-ascii?Q?f9W7iuiL6xUBOtMFryICdCGZstwsGd5KIz9Pv7inB+MT7kfCzFARjwXyNqD4?=
 =?us-ascii?Q?DF6cy4AogwwWHLRmJGWvY4KoopgawzI51sgiqIJ1ALRczRX7QQ7+dYB0sj8l?=
 =?us-ascii?Q?fD83/6xyn6mYzwO1Iu/UcTJsh5IcgO/Cx8q/CNKXMKD1XPawzixtufMy01gb?=
 =?us-ascii?Q?ntmJByD3B7bk3emPWOso1xjrfT4s/KGuaECBRhURK4yFJhZybEgnSb/O9E2F?=
 =?us-ascii?Q?VIUHUI234qZxMEPp2+rPYDLScUPFUfU2p66CpYe7wZak59ohhIypB1Ihjewu?=
 =?us-ascii?Q?5Bv8/HI9VqRSYPlIrhMCdW2De1BasJK+AB+9u8LvxX9OeihLpjnTSIZwI9op?=
 =?us-ascii?Q?5LBDGYpl1i2V5aqqa3uPGDdg9DneTJfEGDuXjQsx5j8haes35o0nb3+nKpVF?=
 =?us-ascii?Q?towHLgRZ+YNMXcxRg4l8kYjj1BS8/zIbIBIfpyESFU1lPEzfjSaA6WBqJw4n?=
 =?us-ascii?Q?ae3MFe9OW7Jhwpw2JCq0J4JjaXbIKryBU71TEQuPT+R35B3xne3e2V349kCR?=
 =?us-ascii?Q?FZOmWgpS8sAqTRxnCkk4sbPenHDMRDuJ3za6TDTsbljL7Jd+KKlJS4eTG0GZ?=
 =?us-ascii?Q?4n3FBC2TOFBt14gJWkOFKtkVA5hAQ4hqoOMw+KtLu9Emd9qCjKCfa43zk+m4?=
 =?us-ascii?Q?14sUNHTMriCsOi2B/18b04Kqzq7LJrzvPJQFUQpGtnmWO0rnqxPGm0mrWFZR?=
 =?us-ascii?Q?2oMIRAYi75LF9zzNmaqURO/onxPaGLUb8Y0JigLbTQ4lH9l4ht7O61I/qSxG?=
 =?us-ascii?Q?EoTOHrAT4Xm7gZTjH9sFYOMC+RU7FjCIN6zBp4nfD9h7fFcAmj31riZ5nt+8?=
 =?us-ascii?Q?J4Ew8JniEJUBKWx6015P3XDSRUdvD8dWPEQBa6FT5wxgf8H2I1xs7jbf9iel?=
 =?us-ascii?Q?1tXMPRxxXMrwHn8U5u8g77VK2eJFleHEx6L13fDjc9j1o40UJK9mnCoCanoX?=
 =?us-ascii?Q?4l2DtEISPuYgA6kRY+ZeNpt2VymkwFCExFpZ/kzXtDkZ/+ssVsOt26ccDuAt?=
 =?us-ascii?Q?3QXq0KB3u8+ukkEnJXenhRUkPq7GLoRBlW5M4KfEAkvjPd6WbDPh2dlncspV?=
 =?us-ascii?Q?dZPhb6GE30gGU65kXs0p6X4m9svJP/0kVFGNyeJSQ1ojgXoMdzKQRoEFuWD1?=
 =?us-ascii?Q?jPkMvvo7t+VgXnBwDA49Gqpz5Bdj/iD73mPvNG1DRo+2Md3yu2NNrGEpCeRC?=
 =?us-ascii?Q?8O+bERwVqe1hM3sBv2n09CUdCg7IvW/e6xy2G2XtbMOZw8hkopKOJlUPNoJr?=
 =?us-ascii?Q?oOfYjBkb9lSraASU1o2XPMndxhzzvxvnPva93s/9fDx+ILluxr+BddbFfV44?=
 =?us-ascii?Q?liB1/ketzL9Uj6YaXy1i1sOHDbQ5eZeDcLi1NwN3/7l3AVueVH6MBL722LlN?=
 =?us-ascii?Q?UZq7U85tme/9eff7lUa1YMlLeQjsPSwxUNPzlVGlGsPcLOlgARtoR55Hxx9g?=
 =?us-ascii?Q?anB66K+k6Yhm8waMFF2T1i2rDjx5mOmrFK0QlXZ4HrxA1WGxODr98KXjU/Ws?=
 =?us-ascii?Q?uFINmzXQr1dZ989rVs+q1aeAhQQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c1cedd-c50c-4cb1-1c38-08d9e582d112
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 13:00:26.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF6CxaBGopS1yYpWeuMre5yreVmLBRPpX8AKtFzvewecxB7TYHRPfORCtEhxyDxMFw+8zxPhfEnwycvFkueNAQFcRnX+Uef+ADXR+6SOzqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2123
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010071
X-Proofpoint-GUID: 0_ZdVRySbPWeahIjsKWO4YpYjd4k6vLR
X-Proofpoint-ORIG-GUID: 0_ZdVRySbPWeahIjsKWO4YpYjd4k6vLR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This error path needs to drop the mutex to avoid a deadlock.

Fixes: 7be91e02ed57 ("media: i2c: Add ov08d10 camera sensor driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/ov08d10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 1f42dd714ef6..e5ef6466a3ec 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1264,8 +1264,10 @@ static int ov08d10_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	mutex_lock(&ov08d10->mutex);
-	if (fse->code != ov08d10_get_format_code(ov08d10))
+	if (fse->code != ov08d10_get_format_code(ov08d10)) {
+		mutex_unlock(&ov08d10->mutex);
 		return -EINVAL;
+	}
 	mutex_unlock(&ov08d10->mutex);
 
 	fse->min_width = ov08d10->priv_lane->sp_modes[fse->index].width;
-- 
2.20.1

