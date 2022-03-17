Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADBF4DC074
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 08:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiCQHxX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 03:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiCQHxW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 03:53:22 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE16D372B;
        Thu, 17 Mar 2022 00:52:06 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H3Dwq0030863;
        Thu, 17 Mar 2022 07:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=O5UftAxepkeD6lNLAvtoIiER/WPv/TtCt3xdfsCPCM4=;
 b=cY3pmnUNUQYEnqSDi1f+JdjHUjBl6B42kNgiGSKBZIUUc9CGII2gquQO4JJ8e74GhWQI
 k9a5x/aY9CQtB54wZCCptc/E+/rlVyyULW74i4o3o7PMw1YHMIQDW0j/tD0YybFqe++k
 tBUVW/47jqLtk+rYUi5eJNpO87AGb/x1Oregkpzc30ljaaNDepp5Nga7p1xglanoh9+h
 LiFerdMjVUVQf14nPcmp9XI3/ufI7uv+Vsu3c/3bsqwsxjNE3Oy2VCHpz9K28E9s1Lqa
 KVPc8QKpd723WtkrlsfrejhhIq0yXWgFiIJzh+0crB36ZWccJKckMS0wKvZmpLE9RRiG lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6rgb0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Mar 2022 07:52:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22H7kvZE001415;
        Thu, 17 Mar 2022 07:52:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
        by userp3020.oracle.com with ESMTP id 3et659bcat-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Mar 2022 07:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBoKj2spGWkzXAL8/Ns310xwGKfeHmI/2L4wHCwQpTGB9NsYEV491oWHh1X11/4Nj2dquicSO48v9HzW8oWlVTwZoYxZslR5w1aMqmq4n1hO4K1ls/Y0n2Dt6xUV7GVW9SA61GRq3IIiwwMb4EMxzQyeU1g/4ptm/alfc9IYeX5CgO0pUFAl62pTitYd0ypJkfFAUIhTtqPdNu9wb8zAi4Ab76q/MHKBwdra2nB9d0jlk24uH6ga8oeUSw5IHg4P76V5xKghrfjGXahKEdA1AAk1gpjmkloBbg2qElbUCGhj6XD7nSQDt1Z7BcFlPTiZ0b+QTd/0wMoc9OYvJRXQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5UftAxepkeD6lNLAvtoIiER/WPv/TtCt3xdfsCPCM4=;
 b=bOdzkT0Bz1BJ2YwS+h35WLN2Crc9frAooWtKh1lf3LnFoztXEzM/R8O+p9pFrvh8aLE9GRAZsu6odtxBCx8uiCanLZg0mqasTadXP5emE2hRKPHh3pndTMzcl+FDaqbuIe0jyPZDnE5yEuorb+bHoOKZtzSW9izEMN3M2p9qsLqd3+kaPT8K/VDbYgFS+d9081rgSTP4h5zZ5JUhS4eziNnfn8IPp4zOq66bsY0flEdqVUAQHY+7lGq+4HrFFG22ux15rJN+kVPY44LToOBuooxqlxDWSqouyn03iKeTjPt2ffyR5kfbBY49WE5twr1jadRLIvoX+WKn86vo+eLfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5UftAxepkeD6lNLAvtoIiER/WPv/TtCt3xdfsCPCM4=;
 b=RHagTZIRPv6ZTK3GZ8fafMflRR0hy1wdevasBpSmNLtA2y5rDAb05Pj7iA0viRFlBKTiQeg5ZKHm92jCh+fpBUQoDKoQobm1xD/sgvv0+gDcGL5zHq650bVnfTVrhlUUiLlnC20UPUCqwOGY6vLgX5d19NhGGFxu+i28QTrUd3Q=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3283.namprd10.prod.outlook.com
 (2603:10b6:408:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 07:51:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 07:51:59 +0000
Date:   Thu, 17 Mar 2022 10:51:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: davinci: remove unnecessary NULL check
Message-ID: <20220317075148.GB25237@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0078.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86b626c6-0161-4fd8-240c-08da07eb0419
X-MS-TrafficTypeDiagnostic: BN8PR10MB3283:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3283C37E579B86090CD4CF4C8E129@BN8PR10MB3283.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ac6N3QkqJRshAJOgHUjCuwN5utSSGdypBLSlrh1cKv+AS2m/c+KfWWRMfmOAICfIVchSornAluZLYVyffeCZtZHPLESOcoj9Xnks8tT0Ip5T7rlRcZTGJLTa0iXeHsWgT96kUhemAaw6oO4Z0c2tQhit+e5cunvTLFnjyoj4vWwoGZig3wQoFKrJ4V5p+Ht+qIsODeqkLZmenJ5ps3RbsQTMXV306Rsl08KllPUZzddoJOju3B2WYHLsITKkDKMWFvw8STYrKEp1MSJvTdzk8s6lD11p3PUZhUQJ9OogAX0d+K26qtf+ZJ+xq1L6G7Obag4jLH6+L3V/wwpxZXQGcIphvpYBeZd3U0LwMSNJ3DTgj01ColJ/kf6cPo+mcED+lINwcb+WGNEBH25dPSNtXoG2j22tO2p3leJziZGXs4B355w8v5gBXtaiYN7JESsAywVH71/Hbf029uOh7rkILnGLOpPHxksiwoZfCn5sG0Yr5wmJ/aoe7FGM2DZkV3yAqF+fjJordzHT7pwbZCqhc55t49cniuySeT6ztTOkMZO/w8xfgRoZK/Pjsn+4wUB5a0GQYl1MHit/OBTEeOrWBdcSzp9l3e6OS3VkfWj1akyJppSxA5bBAlBhm+MIBT4aLlkFXSL6E10xfPuCZVBV/QghcNgMb8uimjvgWgexQ8sUBpkYqDrE7FTmW5XJted8W5wb9dNKUN/i8RJTXWrqtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66946007)(44832011)(5660300002)(8676002)(26005)(186003)(4326008)(1076003)(6916009)(33716001)(316002)(66476007)(66556008)(2906002)(33656002)(86362001)(52116002)(6506007)(6666004)(8936002)(6512007)(4744005)(9686003)(38100700002)(508600001)(38350700002)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AtoehuwkNUr1R4qZd8n+UpTLf1fdJecGT2mRvK8TmLvppxg0lnzMkbaDYCZq?=
 =?us-ascii?Q?kJnuh+BapPC6PFUixcLd2i8xuPWVWMX682/f1j85vAv87qmCP0HAv41bf3fM?=
 =?us-ascii?Q?cNp+4bhE4y4jCtYEbnUW+vn3x4H8Q5g11OxDOBmp9rU3lKxO9w4Tg9pCb/vV?=
 =?us-ascii?Q?yB4ecfEBc+vJdi3lcOsGF4kbgZxyuRcWSbwIyhT2yNKl+PN/aCNJF3qQavuP?=
 =?us-ascii?Q?bPTFLp8Ooe7B+xgu19wax+2PwPdpAgKTSxlOEOOroDk5p93Wv7+bNiQUY+Md?=
 =?us-ascii?Q?bm9hLFB4jbAq7rSCBXX91MHDf5QezBXnH8Olo8nTcdRCKPf0EmnYRL4FXVLM?=
 =?us-ascii?Q?Q7dxD0T5+cEVkxv8JIUv9eM9CECDKlqjinoUY3T6RUsHLhAKI1NZ0RsU6o4W?=
 =?us-ascii?Q?PJ62062tLPGi4P7QsM0k/Kfy6B2Zb+9hcHHZOLQDRIy0V/ZzJOCzsPmOcNe7?=
 =?us-ascii?Q?qpGn/49VimeAqmO92srdqv5e132WtjiAkrd/6WJJjrBejgDZVUloOflO6G5C?=
 =?us-ascii?Q?mjMxFcRm5LUUFAfKbBF40Vx1OJ1AeUA1jkMRGr2R09rDnJB3GnTzfvoVjzfw?=
 =?us-ascii?Q?jg4A/MJdsi0zB2nbh3dq0Ak7khTKvyGAdvPOI+dA4ZgySYIN1pMoaHBVDGnE?=
 =?us-ascii?Q?Ft52449uIXkg5Ou6nT7jT490W4IhcusT1bE8772mIXkIxI2La/fT2vbLhfGN?=
 =?us-ascii?Q?BvFD0h41L8WsGG2wDkYrLZmTbWBGXgFfQKKPox7ny2unw0tw9IDOxdyFGof4?=
 =?us-ascii?Q?v3coOq5wRXlTG1bbbHGQhRJpzeGXO9LWKOw1psMkuR91WD5SWnLV5wAaIi49?=
 =?us-ascii?Q?2TIe6B5KKyWrFKiV0WXZUQe0HalUH3r25olnlb3B3NXx7KrjvyPi7lJVmEnq?=
 =?us-ascii?Q?EsNEgiv7aCogH6LmkP8PfRQhp+xJbr5f/w6aSRFa6manIHDhwBxKdtIm5GwP?=
 =?us-ascii?Q?tKXmwlPyVNYFyuBqR8+DyYD0b+X2zpNBppK5OWV+YU9E9Bv9Qim22JusWWY4?=
 =?us-ascii?Q?QtkR1Bx22d0DxKIvWv2+tsqjPoBdfXUxmjpzbRt+RE6VRR6lSLcbw747pCe3?=
 =?us-ascii?Q?MUQB82vQJGmYHJEitkKk7v/HLi+xMZuai+m6ykCio8WCSTCojxAebiMAyvEx?=
 =?us-ascii?Q?DiTx/J25auI3cFBPD3MN9rjkcs5EQhF3epIOo7Qb9RS7XebdMo6Q2oMjSnUH?=
 =?us-ascii?Q?YVlrb2lUHSmJF9eHJe0Hr5CT7OCkb9RwNhoYuPmTPqxCJ7kdZdm6piXLhgYO?=
 =?us-ascii?Q?xihmQ3HBsdb6WHkT3ZCM/QByqpE4DkyYOnp9A/S2WUdeQB48Ct5y21b3arTW?=
 =?us-ascii?Q?fgWfm0pMzGvdT2GuzfHImViqcuZ043FJuYCrU8tc/Y2mNcxdKzvw4Yfe16Hl?=
 =?us-ascii?Q?qJyWk/weGdx3H130lnvAEiFYH3e4FJQMb4/+7liWCvO59NfkcMMeXi9M/Zp3?=
 =?us-ascii?Q?ltOldqaCiEWdZQyP/3yUMPCmRwWn7aqLjy4Ju4l6P77vhI0BjOB45Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b626c6-0161-4fd8-240c-08da07eb0419
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 07:51:59.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /j8hz6MSTyCWpioMH1o4mZnq+mMJc97GUbV0keOG6TytP5ZwhaCRGS9ZXZQz+Pkt5gFFka0TVnWzu8COI9fNR7uHJJToS4/bJefoutUS7A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3283
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170045
X-Proofpoint-GUID: OQf6YrpdZw4JgaqAjnnIeJJTACWFtoTa
X-Proofpoint-ORIG-GUID: OQf6YrpdZw4JgaqAjnnIeJJTACWFtoTa
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We verified that "vpif_obj.sd[i]" is non-NULL on the previous line so
no need to check here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/ti/davinci/vpif_display.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index fca148b66471..abf324dfb7cb 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -1286,8 +1286,7 @@ static __init int vpif_probe(struct platform_device *pdev)
 			goto probe_subdev_out;
 		}
 
-		if (vpif_obj.sd[i])
-			vpif_obj.sd[i]->grp_id = 1 << i;
+		vpif_obj.sd[i]->grp_id = 1 << i;
 	}
 	err = vpif_probe_complete();
 	if (err)
-- 
2.20.1

