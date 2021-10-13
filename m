Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050CD42B9B1
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 09:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238676AbhJMHzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 03:55:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11070 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238644AbhJMHzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 03:55:49 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D7JPJW028779;
        Wed, 13 Oct 2021 07:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=bbitqUrFZkEqiEg5ludbYyMP/WqT6sqfsWVrWN7ENf4=;
 b=wMeTwZBmMAM8R/2nxmRPOyPbAdGpCxJg/ws9onPz/ajjZ20tcwGme/uRex6sRxquzOsJ
 8ZUykCxnyZ/wOc4UteUkF3jnkThzMvaMGXQ8KzHp0cqcmCYVz3Cqn7nAkN+0VDB2/vtt
 lIcaxtQ4Riw4AhnglNy/znjz4sFradXC0rQXH7PmmorEhMquAyXK7UQ9sXiRgXg1E+2m
 AeZWjaVTDMnzu0UI98eFuCK4unFes1fmoQbd45j0r7+u6lvyJlIti0B8Ep7AGppGKCz5
 GcdEFnG1PDWyfUtffvYJB2DDYQaCumJu8NdB/on31pEKALiD0+ggXKoUqYX1gjvpMGON pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bnkbh227y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Oct 2021 07:53:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19D7olgH003696;
        Wed, 13 Oct 2021 07:53:36 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
        by aserp3020.oracle.com with ESMTP id 3bmae0bxn7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Oct 2021 07:53:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdbfMmu6eR2MYOLwyi6c2Ek+scDcAZ64eVR7iUMMAiK4D4JO0ZLQflW+SemOB09aZOVDCRflFO3F5Fcm5T8KBqBcMiEpNx8WYVH3Zefw2n+ObLjjFWUCCEAUm1VaUd+2P1XesHi/9dvvKgff8kvgl4gfplKQLrE2C1BVJPRis25MbpO2gTsoDm5ortVWG4lHshcUTY6a7bqXnIXDNmA7Tt1baffsTnAOKMIARUxhKGG83UMBxhzxban8z5FttWWxrgT+W8nWaUg/qj5OoV0dWPn1re/LVb/qTLMfiQBv3QhXEbCS4A/DNjpULOORV1hbHGyEjWZCuaX4B0U27RjWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbitqUrFZkEqiEg5ludbYyMP/WqT6sqfsWVrWN7ENf4=;
 b=RoA8o843YjG6K9T/hLQhw9rBs4VrhLJ5PXeQu5FYTZNxcLEPPwHOGl5nmKVU8WhuP92ouIz2ItstnaoX61mDPzyyAPFyrVF4ELhtl2wS2gaPYUDUrU5ltkckWhmbtoLt3V6jvgeUH3ekgPb6pdoW0Rwx/jBVTWL89pJgiLwUYPTBKJxK4BZ0dbwr8CFGycDVga2IPXoG/EfZU1YBv8rOs/2RDTr/d5c6hVlUnJFJ7CYKqN8nKOeN/dFhLvT8fu6kkQXRpfKWooBWZptKZewiqWf0LMJ1nnTotxgdZJTG5hpHglWcDj+aovpPcZUbowgpH/pzcTeEhmLSklUDW7QfgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbitqUrFZkEqiEg5ludbYyMP/WqT6sqfsWVrWN7ENf4=;
 b=pt4f6tVHoO00bdXay+WNOQVsZpdga+BCQE3RodYKew72zPhwMdMMEoF9l2rHf4h3Q/Rp2O9RQ8sDcBsnsrOu7xvd1im06+6N5QVHjfMnV06+FUes1gGof9ofef086jFxQLQYlMPLy+kfQur0uRkXalFevl2Vh/mcj1xretfOG7M=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1358.namprd10.prod.outlook.com
 (2603:10b6:300:23::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Wed, 13 Oct
 2021 07:53:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.027; Wed, 13 Oct 2021
 07:53:32 +0000
Date:   Wed, 13 Oct 2021 10:53:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Fabian =?iso-8859-1?Q?W=FCthrich?= <me@fabwu.ch>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ipu3-cio2: fix error code in
 cio2_bridge_connect_sensor()
Message-ID: <20211013075319.GA6010@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0110.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0110.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend Transport; Wed, 13 Oct 2021 07:53:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 585909d1-9858-42cd-2274-08d98e1e8d6c
X-MS-TrafficTypeDiagnostic: MWHPR10MB1358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB135813F7AF043CFE2913CD728EB79@MWHPR10MB1358.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:231;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p30O+3PcCij+La7UnLcTw+kodirwNo4X4kWP1K2p9+gZ7Bu7k9+VnAkJb/5PcW2wsVePpgpL0c0c2fWYBaBsfaJcrQxoXZCjFdh53MnC5lUmaArlbM2juVcLYYtDgmr5XHH6Q7X6Dc2i2EpGAKEadsw8IdeXbkq9vV4n1E4Hg2fZTme6Zvesz+eYbx3lMhdXzSscemaHV1ahEOQ5jTHk4jS5AJ6ECTTc94yqgqaYg1YVWfI3o3HkL46x+pAyBPYIOvyZRYUP8jt/5in+m227urTgoNWrZkIR6P1j7Q97NcelRRgo1gbXTvo9XQQiFUkZWHT5LKR7mP7t99BrALmwRXSFHDMxynyofYhKeZzUQouOalMbFoGzaaMhyEdiO0cKrXgAe1ADD88Un5p8SMxwsH/NfyG7xwqaakvNUCFDoaTuZBKW31vAZv/TBs+EN/IHSnn4ew9b+ESvHkJdTp1Zi+Y8b0jXhYXTmSNpawevWLrUDl8umIUnfjNVHnXEDx7NAGPoTKMdR+L3X/Kr69YGlD6TGv9Nq07vtwnK9/tmgHIuokgKgXjtji4dQZHtOpcAV7hdMGnkoyzV9dZGGPktF4wu5AyAC4yVSlP++3+dV82MDrEtPn4dfzYRdT8F1/rYVHQeUQnckxQGjyDQw4Po5L0Z+2xgyVTb7J0b6upzrwm6j6IrSlXxI5v9tmHJc5BxhzJgzhaxrpD+2gWlz0UPPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(55016002)(7416002)(110136005)(6666004)(38100700002)(6496006)(83380400001)(26005)(38350700002)(4326008)(1076003)(54906003)(33656002)(5660300002)(956004)(9686003)(33716001)(86362001)(186003)(9576002)(8936002)(316002)(66556008)(52116002)(508600001)(44832011)(66946007)(2906002)(4744005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Yd1tDb5krgaQ9Nab0cpmeaWR7863GlARIWC1lpngV4rCpGJhkQvfil/aAA4?=
 =?us-ascii?Q?jyYTTRrQPUyxzUcHyDDNLmrcHkxhKovNxG6S40w5WC+dheR+7zpGK8MVFOOd?=
 =?us-ascii?Q?BgOmbW4bTXaZes2ayvZeCIX/+BltnhnV2aydQNYSNnqVwu3Jm9zrgBdFs0jO?=
 =?us-ascii?Q?DP3WnXLSB7riZeYhnlA5IV9mirhnRCyHU4leyZrrfGuBRCg8ADFdPCNs6XIz?=
 =?us-ascii?Q?9cbVnQFOgqF7SjEaMa5UPuIm3mPb6QW5jFjkK/mb1pIWT3Ve5ctajqZKPXIx?=
 =?us-ascii?Q?J8IblBA6+Q6UVWp70CSvClm8efFykx91VX+WOjkDFvIdGrCxh2ChvTrjO6za?=
 =?us-ascii?Q?UOpx+Vt2HbPOK9JgsnnJyIVLqA0gAfucJ37/JfCFdRsSw7+FosatxeBQC4q+?=
 =?us-ascii?Q?lXvo0D5NIVdUa/9NSX7LKAml/jYAeODvSdXvKq0CS701cmkH8HqUrr/IKxB/?=
 =?us-ascii?Q?W2A6yov+yQKFVBSkQrbQBhL94E+LvpFa+eGdFmoj7tYvnIsmyk9pfI7Qu00F?=
 =?us-ascii?Q?CX5nIeJACxeftubdmPpF19VWwe9yLhQ5IgyABrkwHUm3BrhogQFPXNvVWMrv?=
 =?us-ascii?Q?rl+S4rKp2JqhPx5f4NbSrkiLGFmqqX48HEuBx21uFdSMHpd3ClpTzAm0ViyJ?=
 =?us-ascii?Q?Kqdf/BZ7SbAbFkel02H0AKAC/uJli0FojHjgCdwQMDPixp31kf0IbzHNCHZi?=
 =?us-ascii?Q?/XdgWayv7vEP3PS002FDS20xLZw3SEUQ1aizknoC9wUrfMs9dQVagKLBHAXR?=
 =?us-ascii?Q?kW/VAniqDfATRd+Ap0rfuniXf+K1PqTA1eYc+dMdmCqVtQ/5DUSNJHbd4iYo?=
 =?us-ascii?Q?lgDgPkvTd0BqCfON7nD6W0fvMhMGA4jzhxwSpGrV9ypErDpLhIXSxfmcEh5J?=
 =?us-ascii?Q?3BB3onqimgwAYUdmZJJYOITE19JftMICGt9eJDYdo2IWszcoIxK+wWQPGPXh?=
 =?us-ascii?Q?d9ZH1gTuiVupmGXcTLhjtgA8wkaOQ5ab2SS2L6awnlirPG43oXekwNFKyXIw?=
 =?us-ascii?Q?Ig3Upn2dYVv6NXvoMb4tRt/+gTd2UeUwcdVVBnt1rXDSv+pItrT3alOjf+eC?=
 =?us-ascii?Q?JwH1sMux+1jJOv1mELvAnM0WssnZlmr9ygXNpBDFNmH3cuY/3dNZw3wK/0y6?=
 =?us-ascii?Q?ljS0aAbjWbU3kKEqFQKLXEKe11L+1Ffg5+g8/SmjBeTGm5Qe+hQsJ8i6a35O?=
 =?us-ascii?Q?ZSgP269z0g10rORUPVojQAGLE2o+muePv0SGBUZjcqtgPTfgcKqb0zQj8Zg5?=
 =?us-ascii?Q?a8gZ1t9b7Nf6t5UPJWYapqJ5R/OGorhaB9XBHUGPcpslPP0T7xyMq6Fq5JZK?=
 =?us-ascii?Q?A3fQLw+8PzcXYVdG5g3ME++U?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 585909d1-9858-42cd-2274-08d98e1e8d6c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 07:53:32.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LawvxSZJo6TKM1hpIPxq4a5Wfns1skNv8cZjSjObg/s+UDoFGpnDJHsdkc74D8Vnf5Atfo41dRWfgWnVha1ds0d75xFoo3aogFm6T0ENOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1358
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110130052
X-Proofpoint-GUID: jRfV-75zWfwe8X113GgNfaeEirl6eNuz
X-Proofpoint-ORIG-GUID: jRfV-75zWfwe8X113GgNfaeEirl6eNuz
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Return -ENODEV if acpi_get_physical_device_location() fails.  Don't
return success.

Fixes: 485aa3df0dff ("media: ipu3-cio2: Parse sensor orientation and rotation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 67c467d3c81f..0b586b4e537e 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -238,8 +238,10 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 			goto err_put_adev;
 
 		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
-		if (ACPI_FAILURE(status))
+		if (ACPI_FAILURE(status)) {
+			ret = -ENODEV;
 			goto err_put_adev;
+		}
 
 		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
 			dev_err(&adev->dev,
-- 
2.20.1

