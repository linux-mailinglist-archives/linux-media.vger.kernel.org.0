Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1C7657A10C
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 16:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbiGSORB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 10:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238576AbiGSOQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 10:16:45 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697E05C9F9;
        Tue, 19 Jul 2022 06:47:44 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JDBHK7031787;
        Tue, 19 Jul 2022 13:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=XVWgshDUEKQ1YLeWPKiKhx2IoKUgqCZxkVHRPNAlgYo=;
 b=z8yuDTb9qDBBFFGninLYdRpXp6lLGSw1jjt3Xx1eq7x8+SMMYgiroA6XWWxy+6zFmjdv
 +har70UrqTYx87hdnWJtZf6pljP4vEhImTjrtNnJ0cmqg+c+J0xUrkHlPk6kz1HfN0dt
 yzG1r+HMQnRKJ1vZIppbxwvB2NUur0bkFug8JslSIv5iUe7Jp64gOd62sjOcHt/+m3qD
 WiZw4bX8ZfOfL4qI5IC9luhmayWqsqVZG20ZDYN2OyVOHF6QnNp+78zfLsyHaRoV239v
 YioIKi1bIZe3weNEq/9krm4X/+TcCmRWujA6dEFtYgcFsly2J4SEoOVsQ2XpSKc5iNQD VA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbnvtedh5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Jul 2022 13:47:37 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26JCED9F016379;
        Tue, 19 Jul 2022 13:47:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1emjas0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Jul 2022 13:47:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9wIYBe2eqwSHYp23DZ/FHrWqW2PyzoBJ6J9KspMn/sRaXLfcHKou9kwv958tHM4AEOuxiGd6rhm8206nsvZ3wpv+qZywSbsT1BQfeQE0DBCmIAknYoOinOl25/in8UXuvrNhJ4YNNiSqw9X1roxvktZTW1UcXLOJF7HZwrwAmkgDhmOrsiKI8XQ9BOUxevgq5WEmw38rqZenxg2pzxmIxdO6PKjzpDHuPOIfq1/x/H7Ka+wmaZ4nXZsGMUBpJecLsZv8aqjwsxHd+Wcx4GJa/x3haMpNuH6wqpTcXHg3qiZZAyTGHQhlL7N2mnPxI4i0Is2ooarvF5opgM9fFU8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVWgshDUEKQ1YLeWPKiKhx2IoKUgqCZxkVHRPNAlgYo=;
 b=JNJyT32CiuhLO1jLSX6xeL2/MhXMpY3ZdRuB+NYA55AqIR40w1kspT7Q3tBs6TpDNfkGSntzTUEds9pGlYcjBKngoYIvS9Iuyh47eqoDhamE7KHcy+xFJuH9J4c71TSo63xYPSLIbmAzVloHhhM/3lPJSnFHVWp4RDrqALUXZz6CU2gagP5ZWWkPe6WATWeTvRTajxMUhF8VwKDRHvRyXnMuKZ2whaFS9/cfvshCueWjaa6k5DVOIRmE5s1C1IwTAYboUNWPDduy60/sBNuB6NXyXfTBIfgowBzfGpJ0EoQBgayqyf/Y+LpAAHg4aPSRqGU99ZAugjLRCk1XdRssbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVWgshDUEKQ1YLeWPKiKhx2IoKUgqCZxkVHRPNAlgYo=;
 b=HvRymFTOhv8ZvfWFrKfqbSj2chQjL9/2QHCySTKlZT1VYRL2Q0fobkCjVJ67/osKi2hB1e67AMxh4v+wXTHx46WpBaqJFVWX3n7x2hO1OL3+eubGgk9qDouFIR2WaZ69XVGJ96Tciq1CwdVUWmvc5drjvEX0VVz3EWPpsl7m3ns=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR1001MB2277.namprd10.prod.outlook.com
 (2603:10b6:910:49::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Tue, 19 Jul
 2022 13:47:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.024; Tue, 19 Jul 2022
 13:47:29 +0000
Date:   Tue, 19 Jul 2022 16:47:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Yunke Cao <yunkec@google.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: vimc: fix an error code in vimc_create_links()
Message-ID: <Yta15OckATLKf6DF@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0133.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ff253ed-404f-4f05-d826-08da698d38dc
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BOcYPxsVtAmS6j7tm28o4sITJZYYH6o7zwrOTEQKX54yD0LoiskOJE2ElD5ddbsdpN76zVUDkBBQfz8hK0gebkPsJb0cRkeJiX7fKaocrBM3vMdEr2zXsPlpQODusHSFBhHW2grTPcF6ssAh6HMs0S3EYDyr/CkbK559y+DHY97y9qIM6fSF8nVUNeBNwU0XuJQRS7PtbqryKai5XTGt4fst0bx4+UMsg0s/uedSTB8ileHDJS7bP7X+rPl6J7kHwF4XInYnwgx1HJvrx6Sc+dvV8GYAU1+BTc8ASmmpQ/jDJ+nHIgeMJkMmnJF6cqEF79/8bfLiyH0DiYHDZ5Q+MndjW79ptr0irCiYWE6HonxvAI2UBDgRSt3/mxvfpUfoxiuplmmjjBKCPM4miYOM6dh+2b7QV/xuO8V2dhW489+ABFCfCAIe0sWA3F6CHqwpj+wIfaumHle2+oB3F3IruzZRw8QJB+i7Sx/6gLWC+s+ujzGxKbDPS8maeyH3vLTgpptWAam9mClSXYChsBH2K7ZahMESrQYPWfGM2sK0OrbKS5pyscXGA6wm5cdB2sWRNWE8xn6ohdVtUhEb6U/sSy+4hfY8ysHkCOh2e/nfgr61Ej03JXI71uiFm28kthE58dnEI6GCr7c6slkktIwrxzcMoxzF9rRCKRTFXLFAz7cDq9O++13yhSwH3Zvq8jtcsi8YtyIsCPTVnCJne+pAKhtiy3SQv+JkOx9+IdSkUytx2LiU1uboOKNRBQIhfNmA9z6zGNZ4bA5ar/yQxHxYM6J7gcfBv1NBbHlRn0Ezu8E/OeTbsRvRowJgbk/ntVnW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(376002)(39860400002)(366004)(396003)(346002)(8676002)(4326008)(66476007)(66946007)(44832011)(186003)(8936002)(110136005)(54906003)(316002)(66556008)(86362001)(38100700002)(38350700002)(6506007)(9686003)(26005)(478600001)(52116002)(41300700001)(6486002)(6666004)(6512007)(2906002)(4744005)(83380400001)(33716001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lrHdJMQNIdQtlbcRshIOuDUoTQIuirmMpy2AjmRsOG+RcieMClRlS+wiTrg1?=
 =?us-ascii?Q?QZofExuhGj3zYC6njacbbXCFNFkI84BEeYR3aiSEy0QwHAqGFJvEAOGdlK5x?=
 =?us-ascii?Q?U9fcaiJeNItr6x24MaFEQub4VPjXudSmcq0lDYmMYpVF3MIirhTeEirpRliP?=
 =?us-ascii?Q?3GH4TTbjK0VZ+y4wilSfzpDUJrIy9pNsMw4wyZ/LvnRnimGeRtwtr60Rr0lw?=
 =?us-ascii?Q?mT624nz+6OdhcPM3UXWB4utM4APrH7whyZoapuFXYjSeh7Iomt7nDNVm9Y2p?=
 =?us-ascii?Q?sC5xV7rpxeUVlTE4x+nY1XZ05y1FJd3XkLgMcqr7EBWJXPfS+/64JvGCtJ5k?=
 =?us-ascii?Q?xYdEpZanRssddKnw/d6bCk1SePrpk6bP6uTaZW5dCajoFCYUotn6J6SvhkE5?=
 =?us-ascii?Q?iNQQAsM28hKWyz35YDlyRa9SAa4ng/GQ0s4kAoG2GmtZRwC9kjOtx3Odbi1R?=
 =?us-ascii?Q?TheXRTlTPwXu7LDB3T+Jh5stcmoVBKe4rdZZjiUKo4zuaDuJeEzffanNuBuL?=
 =?us-ascii?Q?z7XcGAqCTF6Cuh206tNXfdFUqWdtgwdlBJ3GjszC9vQG/xURahQx51rZdbMd?=
 =?us-ascii?Q?iucIbnINtYjiBBNX/RSnfnyJA8zjXVNVx76MScg1VXZgxa8VNsLK7JXsphWW?=
 =?us-ascii?Q?5NqSPQMJJSp+3eO55RzDhgXIyj6Z2Zz5lUf76TcEsyGezcw2Gq5SVezTV90f?=
 =?us-ascii?Q?ElbEkm3M5+ZGrAcbYOa7bLlQmHbf1Z6LtoHYjqXlfvUGiwuw0/mulJsxq645?=
 =?us-ascii?Q?Rw6NqdHpRQJvwag1lajKs34TEoyi/+pWg5LPn1XSO9o9pOrNB2Dl4UnjBVCK?=
 =?us-ascii?Q?blhFhbaVO4czgrM6mh4gk4piuBSHI/iWRdKFaFvTmrLrGkxYXDNL0DRAmyjz?=
 =?us-ascii?Q?BVpoUgyacz4KpPPsdnLdvWuVsvdv5qcVyDOgGgrL9VmcVM/RLkeiBGaWRR04?=
 =?us-ascii?Q?6D8wNPffGofSFFG78Hw7SpTXwC4sxXDHQPzG+CHG4kRQ5Nqs4F4AyGchCZqi?=
 =?us-ascii?Q?7mykvtFH+mJs9PuYWrRmSRGi9zgl85ST6dbP/H8Dphc/vpRJcD2aWYDzwAvQ?=
 =?us-ascii?Q?FZBsNDeOm0I23KbgCF5KismPdTjeHS6RKLh1MTGnff86GgbYe4dahyHv8qld?=
 =?us-ascii?Q?lWQMV8zoHXQzYY1oV8ZIkvy3K/VyvpEcfWGjszCQMr9gmLdJxTnVq56LBzkk?=
 =?us-ascii?Q?Fo4VtOD5zjsBdMWPbRLSOIuA0vqO7HqX2tYH1kZwDJ6UIblLrhASMqyEX1b8?=
 =?us-ascii?Q?suV4oAthfPXV1fReDxwCc5BdpeEgBbykLU25DYWiU9yr1/7e7Df2Pm7XnIjw?=
 =?us-ascii?Q?4/R4SHTTb9LXbbQlyOocYqyZ4WTDm/RtSqPO3umGmozV+ON2IeHSOu96G4U+?=
 =?us-ascii?Q?eiAStFls/PPsN1w3ydfIN6+fL9GAVnaCC54RDs6HbsJTH+OKJSAcdb4mLIuE?=
 =?us-ascii?Q?gPY+h7bqsEnhFv8XvZyRMkxJ4g2XKqlMX9s7TTZGsVtvzPNu+HX+MHYSfS/M?=
 =?us-ascii?Q?ZUVHvw+gCxQv5ffBp70DAtcScKvHDfzbHG+1wWsPh4RL/VvmDO442jO7h4mY?=
 =?us-ascii?Q?KUbEAUFND156mTiyQX2+U74sMpCoqrpuX9LepdQjUh/rShEydmKMaXkUDY0d?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff253ed-404f-4f05-d826-08da698d38dc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 13:47:29.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfm5FwD5rbj6YiFbDavpVtXhKh1P38D35Oq0DhxDfBeWCHxVZzBE2hUVIszZCsvrGtSNyoCRlNdal+Q5LlI+sNVHLH2mio4UapQp/MFbfvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2277
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_02,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190058
X-Proofpoint-GUID: qy5izIuNVoHJss5eHxwaJM0ti6ECijI-
X-Proofpoint-ORIG-GUID: qy5izIuNVoHJss5eHxwaJM0ti6ECijI-
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the correct "ret_link" variable instead of "link".

Fixes: d534b9520a12 ("media: vimc: add ancillary lens")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/test-drivers/vimc/vimc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index c73f91947f44..2ae7a0f11ebf 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -211,7 +211,7 @@ static int vimc_create_links(struct vimc_device *vimc)
 			media_create_ancillary_link(ved_primary->ent, ved_ancillary->ent);
 
 		if (IS_ERR(ret_link)) {
-			ret = PTR_ERR(link);
+			ret = PTR_ERR(ret_link);
 			goto err_rm_links;
 		}
 	}
-- 
2.35.1

