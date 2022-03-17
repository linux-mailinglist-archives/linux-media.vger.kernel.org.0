Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D944DC072
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 08:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiCQHxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 03:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiCQHxJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 03:53:09 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508DED372B;
        Thu, 17 Mar 2022 00:51:53 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H3TGAA011949;
        Thu, 17 Mar 2022 07:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=PAO52fWod0fxZEgvA91vcdmPbndljkVOu08s9znlwEQ=;
 b=EWvj0KXlnBHJY9o5O9bsdN/YZmlVVXfW/Gm1vDoM1DcoUzxAKIzZgqeED0AkmVI87q8+
 aM0HrvkD4munKV+tmOEpdcYWSn6GY7gCETFzVbQtHIwpT2RkZTJVZ+trJW5LoLXtvCUR
 9BvFu/IqSCRRAnqlByoM/tMjSWVke3mVvxMQEPEd0v3nA+aVju0mJl+BSCtVk/y5HDF0
 GYHtEehkWkTkkPEQk3pWKOiXYyv73JgyfJ/oC+8pvO8Z8KqInF/muUHBW5uhS5BH7fZR
 1co92+vEqnEENoxtUhPeYyYzHaQz/AJ8z2puaTW87kATXsfymbYPXrc2kEDtW3sDqcgq lA== 
Received: from aserp3030.oracle.com ([141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3et60rg7ed-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Mar 2022 07:51:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22H7lZ50165826;
        Thu, 17 Mar 2022 07:51:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
        by aserp3030.oracle.com with ESMTP id 3et64u1ask-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Mar 2022 07:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+UBEyf1TSFeQma/gkcUUFFp9ODN4h7H9CaUZI83flsXfto2VgY+9laZXmQZAhhYYEaTwREMF0Mn92vgtv/XQO3zDxufgeqR+eNOLWzVfRwKA/y46bJzhxDCgemP8VmfFm8z6o2Xhh01fkLfo+sIpxuIyL+5Q5M/ZqKM4EIgnV/vWNY1DHFt5SjES6N7dlZXCrNHGr1830YvjcTT2fE5KOHrsmbYbcQVjU2Fqwp4lmxcCC9F1URJxnrUgUUeAqu2k8GBM4KbhBu8g8kW7W719rVGjBchYzBUqRddVjRc/xZHSb6HbQSqu1fV5uhjuQTZ4Tj2CNbxAoflQX36XgEQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAO52fWod0fxZEgvA91vcdmPbndljkVOu08s9znlwEQ=;
 b=Y/N4z6vYiD0tsnLjNM4G6yL9DeD1R+o7VLZKOMT6ERuttRF8MhVrUJuBZO2bT+AH4+z/brFKAcGT3C2KsZWKHzKE7e1u/1rDE0n3ylPk2De/9ZdDGAyJ3uYNxrQkrUkax2uTQb0Zn06vGOpPeEa8PcrIIr/QbbMKs235pB9o5RBm2xgsyh7GvTLM3axHdS3xOtwz5XKZy9sjOBz04thaFnifkfArQHTPYhgnYr83c0ZxH4Ikw3akcqfcKJFAoqkh7VoY4U7kKPftRYqPtiZnQ05mGctFy/2Ya7ZgCEhJTLfsX1p69OtQRgHmVRXEb/sSP/Ys+FP/P9mAhMx5SUYxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAO52fWod0fxZEgvA91vcdmPbndljkVOu08s9znlwEQ=;
 b=LytzON3NzGcC3OO0wEDh7HeDBodp3idTxZddA3RmS1wTlgmkPeI5dg3R+C5LYoo2JOp1AbyF0LgUwbyVmirHE7GntBFbviH/Y19E7+RBXYRXgAVMx98aNEi6ityySyTrBiAbS7mmR6D8VhUegKkZ5bXgYAdvbnudLCMWOqlFMYs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3283.namprd10.prod.outlook.com
 (2603:10b6:408:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 07:51:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 07:51:29 +0000
Date:   Thu, 17 Mar 2022 10:51:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: bdisp: remove unnecessary IS_ERR() check
Message-ID: <20220317075116.GA25237@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0060.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aebd0aa-a44f-44bc-13a3-08da07eaf271
X-MS-TrafficTypeDiagnostic: BN8PR10MB3283:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3283D8565001C99F9A18FB8E8E129@BN8PR10MB3283.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+1vvze1yH/VY1to774631qPwMIcChzShZgRxctgYkotBOo7TH/uMUSWN9z4yQnt8P+qQmjL5nxCkewRYdwS1XcUQynQ8oIbliOxZu1TVJzQSGVAeRlYrCZhy2ozOhAUct3nEYPWscxDaaIYQj7uWntvQGclF2nok9/5s4VchAVUzjloyk9g0MUKv7mkHmOIGPPzychTnENb3fAp0gPD1yDsdmZD2Z1aB+gpv2z9gml/GfXLNZK4hb9uBsDvZYtU9jcU6hSNt3MjLMqpxHvw4zwQiQX/TPe2wvKMkqyR4ZvWr3xLqLPHQ61liGqzbOALhrQayCB19axOJ4l8jLQFNViryFymDhqAr+F1oSg4XOffOSVNB9Qgtj0LOOMOnt8R5sajv5GyhQurVsE9jLr5i/QCpm3H8gR3YAwmpFB2/t5kB2zDDQfX1QXSJOSK+izgzbt6Hga+TgKCcGDYNB6HwRVx74ZWA7TgBzGk+kLxEzp58JuYmwpE5LQ3ysGiCd/C8R+dC6G2PwUcpL80ThOcRuy+ie2vS8HepyzOAvhYa1eMgWiFJ6o/ucSAuMu5HgeyszncVqSsObqFyqZjwPNJXIPuAkwnvrc7fPa7b4iR0/outA6LyQ9rWkuUTTkpFEtMwcWQ/woWdHy8oXiRQ+5g/AFdIb3aZcPibT2TNjOCOIGQZzLh1xWOaEMqc1PNk7S2JQbdGWu2CZVXQQZ7TRcxpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66946007)(44832011)(5660300002)(8676002)(26005)(186003)(4326008)(1076003)(6916009)(33716001)(316002)(66476007)(66556008)(2906002)(33656002)(86362001)(52116002)(6506007)(6666004)(8936002)(6512007)(4744005)(9686003)(54906003)(38100700002)(508600001)(38350700002)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uWXtULiC8p8yJHIRoBntUu4zOGfHPhBmO3+A1JIa3gx0Zim1YxAAIHabfCL6?=
 =?us-ascii?Q?om6IBwI4NP3W0NxrKRB5WtB/Q/xnPJthsZSFZ83bubOGtJjykB6OBFznP3NU?=
 =?us-ascii?Q?XizUOBsFcB1wcYEENZSNv9WI6Pd01Mm0iyIZKE6lCYQkfZIjC2UKzcbOCKFD?=
 =?us-ascii?Q?56/mm2FR5L8HOOG15h4NfD8NrV0SS0SsRN9RXZwgu/B/bsMXb4bh4ZlVAZb3?=
 =?us-ascii?Q?44TgWxY8TRrKQY0ad2UKWgQTY15x2fnEE2hojJfJwb4Tm8acTDXFXBoXgYxz?=
 =?us-ascii?Q?Gf7nDm8AIYbVLsXCyQeL6YhEheRcMmfNeKwPzxHGqreOz4F5qNMbD7uDBw/O?=
 =?us-ascii?Q?HzKL5qerjMAQsmUTFERZm/YlBuGOjFFE6PdYurob0ia7H+Q34TPARs9HgDzV?=
 =?us-ascii?Q?3dajHil6TtZYqQXhUC6CKAr5dG0aIGoy3rNR6XdQhjB2kubm+swxCV32IUTh?=
 =?us-ascii?Q?y66/ekFuukWx+WCdeLvnwFARDKQfjtdWZQxQUz61igV5/KXQqTofNNrMtqsG?=
 =?us-ascii?Q?UjBjAPCE/NKKOOyPZlWu3hLwot7RFN5XliPF2WTO/9uwZFsceLelPxxyBiua?=
 =?us-ascii?Q?nKxedIRIRhS/pJ+z59Dolc7Y0dpbs7xu9Ly6MMi5X0NVl6XUItd95qUPEW0X?=
 =?us-ascii?Q?oUsaNwX8Em80Qr1hZNP+SFj9QI0/PZrzUC7MbkuuTs82qxrb1kUqg0jOWs73?=
 =?us-ascii?Q?253viZbnW8vBLS8bA3KpxaKVV1Ytyui0IwnYueLGiMGbRMdbF0NEevkbGXPs?=
 =?us-ascii?Q?OH2eOnanasVyXbfRHdcoTNH3zS8uoX9oFdMbY9LoOzEjjdklcFiczRXZur72?=
 =?us-ascii?Q?9p7tdwT4qW3AaHw87MU85keOiKwdnaNN0N0r1DoWeSYG+G8Kv0XfwVKXMDo4?=
 =?us-ascii?Q?3OTLRNCzq79MiRVv6adSCtIenEn/qzhwcNJ8cXQQXKSLAt5LVjq6YOm3cIw3?=
 =?us-ascii?Q?pdFA8S9dIX05Hw1qeQaFiLOAGbKCtHdFEuxh9ABdRjKFaRJK8dznUQytw77H?=
 =?us-ascii?Q?nbXQMoPBomiERHLXnuk4B6NDirmm+7dELO8BEBB9E3X+fRbX2/hdnPRmri0e?=
 =?us-ascii?Q?FNovPMl911juyRd/FYUWrHufgxnVH4ZP5zktwAqwqQQmw9nA+vcYTOacYZoX?=
 =?us-ascii?Q?WwNGetgsJka8O+o6IWArgxBS43bbCQuBQCZHspFaCQ8JLm+1lb/PVw4SnSkG?=
 =?us-ascii?Q?iKgB8lAmZQIod19P8RZLrZUAFd+lYdO69lSHOIrRRrrNCMxB17FK+M+qlSvV?=
 =?us-ascii?Q?tW+B5Vk/3w+Ku7vaw7Ovms7GkmJUZrhHeY6XZEBBKb+jeZh04P9W69hLfnb4?=
 =?us-ascii?Q?tYp0YzWgvxsXL5mDiznUvd658TIYD9cyv4AAFKFeV/XmUJIpcNW/z4PvOkRO?=
 =?us-ascii?Q?jDg8DOQh5CDEFV/9MbwvzEiUYBvq43FjxbaEHoWsxcd1dXtbBp6gOznEaE7O?=
 =?us-ascii?Q?AsVTtcUAp8uATiaIB24khnYTJDvpEGsVFzsByEVJRGZ2nn2wjEdOPg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aebd0aa-a44f-44bc-13a3-08da07eaf271
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 07:51:29.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rX3PUJp2mVMSHKYA/kwMGykEFk14uiYRQ2+xc7lnfKpMEN2TpZg2n+2Iqyt1oSnrCMxZdhvB9CYFMXgsLnJmgTCjuVcut3na7iH2HVWX2aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3283
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203170045
X-Proofpoint-GUID: eKiRp3NZNO1bcwIKyzj-bDTeuPQQcgED
X-Proofpoint-ORIG-GUID: eKiRp3NZNO1bcwIKyzj-bDTeuPQQcgED
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "bdisp->clock" variable cannot be an error pointer here.  No need to
check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/stm/sti/bdisp/bdisp-v4l2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/stm/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/stm/sti/bdisp/bdisp-v4l2.c
index 5aa79d9277c8..dd74cc43920d 100644
--- a/drivers/media/platform/stm/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/stm/sti/bdisp/bdisp-v4l2.c
@@ -1394,8 +1394,7 @@ static int bdisp_probe(struct platform_device *pdev)
 	bdisp_debugfs_remove(bdisp);
 	v4l2_device_unregister(&bdisp->v4l2_dev);
 err_clk:
-	if (!IS_ERR(bdisp->clock))
-		clk_unprepare(bdisp->clock);
+	clk_unprepare(bdisp->clock);
 err_wq:
 	destroy_workqueue(bdisp->work_queue);
 	return ret;
-- 
2.20.1

