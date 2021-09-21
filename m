Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1131D413B8C
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 22:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhIUUl3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 16:41:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57622 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229486AbhIUUl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 16:41:28 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18LK91dN004106;
        Tue, 21 Sep 2021 20:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=9ZIeRUuxV50JlMzMn+1spr7n9bsk3G/PoMiRkm8J2Zg=;
 b=Ow8/9kFxQfzKY4W9MS+WWjz4hczhSCiXrEOUDsgxSvcmZX6/hl9DIYvQhVxM1fNarKYr
 B9R9YBkB+ODFni+hqFGsJeb7Uidx8SDwnGofq43ybqQXU4SyFnPXIUuwPeg6fTpD5DK+
 1V/ZBY9BuOHYdzolrzC91wNXH0+QbxTepck/tQCiQo/nYH/KGg+L2qCG2KChNdE2bKvB
 7qvTO/xHafsqIxckXADmTYy9Np8iOupt+UuMFyg5oI+ikqvWYSaEwvoG8pDrQJQtDl2b
 UUOH1kE7dZyhbgxgDlqnSJKpaVgRXfBU94AHFWy/woyI5IhPXqPXX2eUNOsUqBDEqXik sQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b757vvw0e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Sep 2021 20:39:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18LKUwpo061836;
        Tue, 21 Sep 2021 20:39:57 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        by aserp3030.oracle.com with ESMTP id 3b565emk7w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Sep 2021 20:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6M46okZR7dJV8tfw4LnYnsiJYYb2TQ5542ZBz5xXrlZMgBUcc0uo/iIieuAyHANQI4XHsaWE2G5w+pAi68sFr+bP5hJfIUpydoQq+mfcM5EGynLe9J4/XjKBycFWCdERJn4p9xodwZFmla0ZenN39Wlcgwuu6jHucOGzINEP1iMgxmLJgvaK0hNSDm5Xm/+S0GThXMSP6i/q1Gqh/dp9NsXCwuXYP7gu6Z/y99WYwBU45w4Ne90PWeySTKYmM5gYZcBaRBoHecc9zd9nURa/LNpqXOpJqwcgRfHTvXWY1ELeowXME6TEHSSKrlJ7kROSgxnx5iABT4zQ3rb5T8wLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9ZIeRUuxV50JlMzMn+1spr7n9bsk3G/PoMiRkm8J2Zg=;
 b=n9LHMVcdKSh4Bq40cbMkpTQVOdvx7YJrPlx0dBSUIIAqdKPq3TLL04fPPkdyATXnipx80gSuSeXI/8k6+X9g0Dk5KuLUjzZiJ1S2iBg3UXeFekTSFh60WrGX/vW0gRDJ1LKpOet9ANyr+lO6JoPRYs1MltcR8aImTFvcwh8ewQ0NUI3/Wsrw5E4stZaHQvA/lGte565g76oIqgth5fu5uUCNYh2yTEbLY+WciWuDQzM8DX0mKHNbzEsJbfAkUmc6JX6t8J/3eWVroXQgY63w3gdw1G+tTvoqN8YD9SsWuqgsGqRqHAdtufn+Fpsq2ZIHQZeWyYA04qtxR2dpi+q0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZIeRUuxV50JlMzMn+1spr7n9bsk3G/PoMiRkm8J2Zg=;
 b=OsEPMbrDCkB9A7ZBMYQwv4isyWsEAJ1NCreQDJXhix5Ui5dL17y3Ml0PxP2y4uoMiwY50RV/Uv1WozxOHDNqFtzgbUjzJ2v7bCkws/yE4InyziVaUuH5GqZmPEe3j1fzvnyhKac7WpjiUaTMVqyOd4xOHySjx3Hy6g8wvgf90r4=
Authentication-Results: xs4all.nl; dkim=none (message not signed)
 header.d=none;xs4all.nl; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4705.namprd10.prod.outlook.com
 (2603:10b6:303:96::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 20:39:54 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 20:39:54 +0000
Date:   Tue, 21 Sep 2021 23:39:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: vivid: fix an error code in vivid_create_instance()
Message-ID: <20210921203944.GD16529@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0067.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 20:39:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1062f35-33d4-40bc-5e68-08d97d3ff7b9
X-MS-TrafficTypeDiagnostic: CO1PR10MB4705:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4705D81262077F74AE159C498EA19@CO1PR10MB4705.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAkNbqEn9zMCjyw9yb9h4hej+xp7Zn8rb0XDKQl0LnkrKPWZgiiSTW1HcPOams+muQ0yJMuCMRJA5ETQ53X9gSCPVFUB3mJXLhHfz0v1/bOsq6Zm5RE5faxFmftf9K3qF9VLb52uhP3IMQtWFk6G/nVfcwCEo5w56UwS0EBYu57WpCzTTrCqREnoE5wt/UY9IthKEjV3m19KZkDAZwYXZSLnVy8pnl0fh34Pv0U6RO7OEsDsuSv1KlbFdeuGBpkJRcG4bvVkVMf8ZeKbU2TIGkRMruTZKm1HvqttZiuBp1utTTkaK5RxUlkBNp9WYPVZxdLLS91yU/esph2Z+1SfsnP+TBZpnrDIaHqYV688VkbM+ctM6BtJD9SVENt0e3xWG6IGH26QbXnGnKKDD6A5s5fjsxMAPZeG/wj1KinJZGvJ/SLsJlNDQvhe5DNB8MZBJnQHZAS3LUKfq95pdsFkcJbqc6v3IqUpzcBL9b5ynUKeCoMW+5rRxDlc/GjPXTi/eURt/Mze8uFy6hcgGlnA6IH0LzbnKRPAKztv9UUxdH2hYbolZ2uDyfDdhf2VsBZVzFdu1+j99NO1JLf6McY3m3y/Wd0NKjS6UfzPUSKxw/AXlGdhv6AYQxLJdrrbdB6LB9lMaaG3qZVNauUrxVtGQj8JTqjggp/uSjDTgNK7MuL21YTFU0MLT8kfjuUgfsi3xYsw3zwIqc1c4+D8gU0aug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(38100700002)(8676002)(9686003)(55016002)(110136005)(316002)(8936002)(6666004)(44832011)(508600001)(1076003)(86362001)(4326008)(956004)(33716001)(83380400001)(66946007)(33656002)(66476007)(66556008)(26005)(4744005)(2906002)(9576002)(6496006)(52116002)(186003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O9tTM+5AQ1W2NcfFT7bm+2O1zSr9mrSbeVTohdAREGTyixwHUoLTy2G1zZKI?=
 =?us-ascii?Q?tbqFVoTj6kvbs61f7YDePc5xgLwrFNHNyu+DN79o8aU3CdfhYSejQOf39/yq?=
 =?us-ascii?Q?ViUb78SqWCkFDvl7oylliunypvO9otzHqFMa0tKTZRG5AgrqeZEJRvlpy7cQ?=
 =?us-ascii?Q?sy6Q1W+ZH5RP6FvAOmRzCgR1+xJIdTzyElbj3vZq76EZuOaZvrjJF3zG0cx8?=
 =?us-ascii?Q?CuWyX8JbVZo8CizzIF4IibE2mTL9NIQQwDWwcmrAHq8oT944dI9tXsw1jzSC?=
 =?us-ascii?Q?nXuxSVAnNjZfj6CPhPVtKL7+zl4EK/HtHDwPfT4b1EiTUKD0lg7pOY4lCff8?=
 =?us-ascii?Q?lJwy7q5b9EBBBwoUTi+Oz4GmIPi9TmpvZ81FPfvWFrIxa7bs+2kQz5iel0SE?=
 =?us-ascii?Q?7+OR1bnpW72lGV6865J19j6EXigBlfe/PNofQtTQgirpLxEzBoW+TOTs9AXt?=
 =?us-ascii?Q?E5tUGi1DQnVBsAKXauBSuBHso9BMYr5FIi5Sd7rWRwM6c90smZDFLNtcA9KX?=
 =?us-ascii?Q?oeZmHGxb8oPGlImNF71F0T8xyRSnwydcntwdbgZYtMSV9LQDYmOvicWLM7ye?=
 =?us-ascii?Q?bIhT9MCZKoD+3YEG4e3KnCixNWYTBXAM2TXS3WvweiXxQtOwwBGSDnQnPjht?=
 =?us-ascii?Q?ADeAiDxtBtzr5ewUF6BKsvEzTcYYRGyKRJXOr54rWa2b1eCz6r9aXKUDPkcY?=
 =?us-ascii?Q?JYxmf0vcLXP/NDnFmiUNO/Y7gkLcFmFh8iKFs3asJlRxbiJfXTvBa1i6f3dI?=
 =?us-ascii?Q?ssIgAgjszdbiGz+3ZLTdwgLVMcxw8JBBOMVHkRHugslRzwBRnB5C/Ea7k+lk?=
 =?us-ascii?Q?+BTPWTGJMFoq3FWRmQUDZHtm6d5Z+aep562Ke77ldmi5ho8WJkrwmt+GZ4MO?=
 =?us-ascii?Q?MfkW0M7xG+ZCG4LOJ/fDGdqEaB+1yIS3umkUM59aSmQkvutZTaJRh2vnXYSt?=
 =?us-ascii?Q?NBT8FnrYme2cnIzeF2VRlEEIjW+qJMg2OmC6yTThBoZ6iXL0Li4yaJs8JCAQ?=
 =?us-ascii?Q?nSjve2ivot3+wpwmYhp78U7cDrPcbhxQ47rT7r/AHNDcTPhLXelCa4ChdQma?=
 =?us-ascii?Q?KYbWPfneQgjKpbL493dkVdB5VbK2+6l8eHWWVXElVZGOwg+rPgll23VbJP4t?=
 =?us-ascii?Q?KPEbuAXId5iwoZNTBfYZtGnyvJQCdsjkucMtt6GFYG+Z/iIV7KKOnjUdW05Z?=
 =?us-ascii?Q?5232vYhu/ehb5NTv29i0kkrTsFw8zEFhFgNZukHwJFHH3OhkNW2BsQdO8+fo?=
 =?us-ascii?Q?wAToq+WaVrjLKHUE5/7vPtE383p/j7XoEfHLgpJUF5HWNSMLHjvDC7ZWz8Yv?=
 =?us-ascii?Q?Vy4hUNvO+stW+l0xcSZJRsej?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1062f35-33d4-40bc-5e68-08d97d3ff7b9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 20:39:54.3297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLAL3WivUZujdRXPNYggcHR8HSLmI6m8+APJLP/LvOdNPeoS+Emvwuso5tp1E6vgVx5nJ39jsaoJEWOjImhUwFaXZ7VPUuLDoC8y8eDwLOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4705
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10114 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109210121
X-Proofpoint-GUID: 0sOUeY3dOy9djTF73gOCIZhG7rf9Ul0d
X-Proofpoint-ORIG-GUID: 0sOUeY3dOy9djTF73gOCIZhG7rf9Ul0d
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Preserve the error code stored in "dev->kthread_cec" before setting it
to NULL.

Fixes: 439e520995ab ("media: vivid: add signal-free time for cec message xfer")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index bcf03bea1e3c..04b75666bad4 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1934,9 +1934,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		dev->kthread_cec = kthread_run(vivid_cec_bus_thread, dev,
 					       "vivid_cec-%s", dev->v4l2_dev.name);
 		if (IS_ERR(dev->kthread_cec)) {
+			ret = PTR_ERR(dev->kthread_cec);
 			dev->kthread_cec = NULL;
 			v4l2_err(&dev->v4l2_dev, "kernel_thread() failed\n");
-			ret = PTR_ERR(dev->kthread_cec);
 			goto unreg_dev;
 		}
 	}
-- 
2.20.1

