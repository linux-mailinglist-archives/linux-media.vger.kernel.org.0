Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A343457A105
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 16:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237963AbiGSOQY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 10:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238652AbiGSOPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 10:15:37 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F435B07E;
        Tue, 19 Jul 2022 06:45:48 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JDAv3v015098;
        Tue, 19 Jul 2022 13:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=FujtxCQqAkCCKItvDnQh6pKibc4CvH+lN5+67xTAHHc=;
 b=QKLQZLXY3fqVVy0n5NHNSGNFnfyAtuJ90l2pA2OqOTtoU6j8Eu/QThA3mgpQqNcEIe9z
 q0N+F5WOt6RgghfJqTchblzDQDJhx/lVlP4qbFX4YD+pw7/PENr6CPksAsP+g5j8IQD/
 8uVGASa2JxNYPt7Uhxr0A0QMUrN+R03+pVFImlz1U7NEOaK+Amuw2z+JE+eFSZIyd9Wu
 aQLy4eMzPDfNA3Icin+2IJFbKtN3Jlje7Jer1ijjyZIxHlkVBclw29GGrAhssFwDNpUV
 l9SfafYjn/Rah98KIlC00RmqAW02c42Mhgai/rTny5cmfkcnSWBikB5K41f5CqpaJHbK Eg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbm42ech4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Jul 2022 13:45:42 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26JC5hpJ016412;
        Tue, 19 Jul 2022 13:45:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1emj97r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Jul 2022 13:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLn0N0/kaxw3QPi3kZ9S3BTz5Fax/xmMYUZTIlA9KiQGjUNoFDzbwAhtHWJCqW71Ul6Ahs07Zf/0bg1a1TDkctRuyNhexysyphC8MwYasFLpRNxxytqQdEBLb73HqtjTse/KweRIfhYh71znAux4RX3+mLwCqBIiV0+9gSE2UnR6MemXF5sFltVceQEAbu9BCXUqeEJXFq3zf7y2UM48Eta+k5GvJKC91tAtDUBCgRdzA2kIMsS4pwGuMDSO9hMFveBZBkqxPOk+6+dvWoMgEYYaz0GHgZ4lly0bucxAW70Wbdm3F3WU9I8Cj+C0aGIQska0/U2Zv7rQeFtw8XZbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FujtxCQqAkCCKItvDnQh6pKibc4CvH+lN5+67xTAHHc=;
 b=lb9C3GOcroegPuPyGwgdeGUetCPZmSr3BHnCLq9ryu0lsPpOSmBvRH6UnLdNY2WQcUzWxoDUlq+p35OitLO1Jl2OaQnmezhlF3f0fQ/yPK29Z67z4ILX/X3ezq4dISQ0nX2cGybFr52UjitYxh2WMwvK+Wd7h41wgABiVi9b/T17DBLGpoEGda8KNPmW177D9mYbRwiWeDIntCiAFOlBvvTILXvWc96/Zl+GoTLySo4fJ2buQL3Hjzucb7KCR7EspMBtP+wOI58p22SJlSGv4aKdboemyUrtonLTl61dthLdbP4bQPftkQtobIGafY0gdIlvv+3YLnlwxOMrBTS/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FujtxCQqAkCCKItvDnQh6pKibc4CvH+lN5+67xTAHHc=;
 b=TCeJPX7e4Psj41mqPfSjJbZxrMTQpPI6gnC+osNuNq/KB+qJioaGMU8bYzw5MpnBdD0WD1hFk8CYwgeL7mBpxw8S0uSh4IX9IkSFDXZQWosB8ekbjC2ZbePzHbgtTyh4Fbdd7qsWrvU9kXxb2HkeWa5rUNccJe6udMuwfjvxPts=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH7PR10MB6309.namprd10.prod.outlook.com
 (2603:10b6:510:1b0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Tue, 19 Jul
 2022 13:45:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.024; Tue, 19 Jul 2022
 13:45:39 +0000
Date:   Tue, 19 Jul 2022 16:45:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: uvcvideo: fix a crash in uvc_ctrl_init_ctrl()
Message-ID: <Yta1eXgbVFGrVuTJ@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0081.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d00e4022-b9b8-4040-1e07-08da698cf74b
X-MS-TrafficTypeDiagnostic: PH7PR10MB6309:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35Z/8EB8eLGNi2h+B5TN/kOv91Hm7VezVELKR5OHzM8UATlJ1uuwKwTYfltyeGqTWiTasA5YvuynDhzQddOfgT6lFttrJ/2S4GTjrbxy52P9AgHM+KJDLvaWRnyHYPNCCNjFFbRrBnt1wQqtH+CqVgTFkFKnjLxn5jaS/ZFWmIg+oe24jh4sTwIhRd02KYj0zh3L3WGzjQn8E+U/Z8AuMy3mwNk5+ki951y2v8xqcL7yZm+DpRtfisuHRBX65+HMEhQp+HX0zrMFzBH4aYhjdk0YLhJcFwdc5y27rg6vnDsbGT7W2tRYwhahYNgsTZTfkJ2peE07eWbV7gh67OfoMK5CaE4eNiQdpZ42r5wOXw6sKe9Q0PAuk2RZz6mcBJT1QadUI0X2iCjjcdVfl+e2XsYObuV5ksNpH2OUpRYpoJV1oMcIYQwLEhUj4nupzy6+r8KHJIec1WP9uNfvaZydUH25fljmefT1FsH28SFB7Q/Lb3WTp+uTWtsSDCqYBOj7l8RPUe0QAMaREoPstFMx0yoCZFW/XKZp3EEnEm6yate5GMroonzPd2PG7OySqTKHdP37kTCzB1bQSEmeMoHJQMVfWThUKrZxfupjr2yxV1JLmIKzcOW/+p9pMgymGRkXwVWRLRjceNug17I1q26f3Eb7xBwfj6Yvwswoi/HGuNnjrQxmaWm7TWidmmH3/lZ4NbADWXvYpAl/xxa8M9Xn1UF3DiR907i0rJa3EFB1ZtYML220IiU4QAAa02dCqmsTEJ3+O72gIpe3Antl4ZUHyhYCq9+GNyQn2lp2t3Xax/1vgg7ZYkhATr80OD89+tE7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(376002)(39860400002)(366004)(136003)(346002)(66946007)(41300700001)(66476007)(66556008)(38100700002)(478600001)(2906002)(6666004)(4326008)(5660300002)(8676002)(6512007)(8936002)(44832011)(26005)(86362001)(83380400001)(52116002)(9686003)(6486002)(6506007)(110136005)(316002)(38350700002)(186003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?baBqdCoDnkuyXjWwd9EtpCje07M2uu6eTVfcUnzdg78XCozU3ERbt4ToQiH3?=
 =?us-ascii?Q?JO4o0k0FVs0gDx0rg9u3EgRWG+cUJzZnUW+1idcBge0GFna7rBhdyG6PYFil?=
 =?us-ascii?Q?eFX3f5N7OJ8TIEAgT3RZpzdJliCrKrOQtGqPLUPm151LsI1u0kL2YbShoiEe?=
 =?us-ascii?Q?rkme6EWfWsu9X4QIwTnL2K50Jip0SfJJcLfnyGxmGYX3cqvf9odDToJWNtkl?=
 =?us-ascii?Q?gspgopsYMkLlgMh3k2i6B9rxWhC3rlObUJEXNLNhdeHn3AxOqRp6kE/u3fHe?=
 =?us-ascii?Q?W/u+RsGwOgUbWX3CKHePGprrY1pIlvFZJlG1pJf23Ltd2z3fBtV2Lp3uHx74?=
 =?us-ascii?Q?Rf1HM4bbGYaRMKajV6vbecExa7Jp8bFErX9KoKKB4HgIbBqylpY8Lsr5Cv2x?=
 =?us-ascii?Q?1YKjfX1V31a7Shc1XMajBPfevcg2ZKdm1/YZGuy7o3RPxB9gwauwdGmTlsOm?=
 =?us-ascii?Q?fgxPYVAhm2ijfrk4CMxN/URZTGzn+p7m06V9gH+ZX98qSLM2aArgXWDzxtoD?=
 =?us-ascii?Q?3vo6WiYB/QSP6iNmJzy+Z2DXuNWrWeYS401Df7V1I7jtMNRgQXxPghMVV38n?=
 =?us-ascii?Q?dX1rMP3IMoZ6y7PVogO9DRr5TQ7GpX3OT84h18aJHQ69VlOy22L3DU/DOuwz?=
 =?us-ascii?Q?nl2g0skfdG548IMfqdj5A2nxuEnI7M6Ii/Aif+R7bJuSPQxT/WbT4HjXmM+P?=
 =?us-ascii?Q?sn9A4cxEyEKHtisO9KjEiqw8o6QqSNPxlpvDSK46RUSuQBJ7hVSACm3oIzH+?=
 =?us-ascii?Q?hIynI6fNTp7AZjJDRmzSSQZlMAkGUGuH/ntZ1bogGYxX9aoXLNrWdUNRlsoQ?=
 =?us-ascii?Q?5bGLNiNnLQ6P0rIsoQZe/r3kvK+dgcP44+MfbM1siyRNI2tjQnWHz/ar1PwC?=
 =?us-ascii?Q?drHNcwm0tm6SnrpYh59a/HgHtd6GY/BlxtV061IVT+Ynf1HaxkX1IMn5WbXy?=
 =?us-ascii?Q?YqGcz+aYoa9CBkjQaSonfVCLKi82cXj1+eIJWhoOyHA8L/8BYC6AYTju4NEu?=
 =?us-ascii?Q?ULwsg2ErDrGufgpv1MOsEKl1U7LXcCYSq2MQhzZ0QLJz7il/ThSkTr6vPf8h?=
 =?us-ascii?Q?MPZnDsJiSmrblWW/UDFMYF//ZE/VhwJD7Tcd1zZzQKNvroKdqVjIq2/VJR8R?=
 =?us-ascii?Q?TPFUfpR3+vyh6WhVHh4XvBFCgtrwtyRJxU9gl81+U9HHsuyeT8IB1WBnmb2R?=
 =?us-ascii?Q?3fHvZnsZDkG1CgabW27MjGacP3RiSQ+lcNHBC91NANt0yQlvk2z58jh1/b6U?=
 =?us-ascii?Q?3/mm7g1nu/xOvgdE0q1x3/x2Ko5w0kvFsTwHGWQacS68i08AAefXtYN5cw8Y?=
 =?us-ascii?Q?oKqcDNTkPRr367HQPY3uTK40OqJ64xwAS+bkHZTnlFDQuiZNlILHRMvo7sJ2?=
 =?us-ascii?Q?D6NMQksFc7S3hq+OAfmxCUzQL5APst5BDkIYcG+QPpp1dM/Z13gJPXrIiowN?=
 =?us-ascii?Q?OIknSa77rhxSQnjUDV2rOWRF2ljhPAZD3ajzXRXiNhwhK+mKxxcF3NEO7gzn?=
 =?us-ascii?Q?M/jQU6HKsr/NQ5ETLVxFCAFJLh9Tar9B4nGdFkPvJJEhkUUybxAQTQpsPKc6?=
 =?us-ascii?Q?kApVF2jLOf70qbJwneWOX6t3We6gAqCA658QyRKgwSWk75FbOBhFfV37Ihvl?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00e4022-b9b8-4040-1e07-08da698cf74b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 13:45:39.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFFufE3ie1epxaoss3BwOqGEKWKKSHluVDbLFvwUzuG+K6+Mt82agwdDJKEvqhykW9Zv1Zzh6mauoI6DZeSSWBtmKlkEpxBNS4lLEngfPxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6309
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_02,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190058
X-Proofpoint-ORIG-GUID: 2r3UZVbffGMdIKtgAS62JO4Pl_RCrySR
X-Proofpoint-GUID: 2r3UZVbffGMdIKtgAS62JO4Pl_RCrySR
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a path where "mapping" is NULL when we try to process the
common mappings so it will crash.

Fixes: 86f7ef773156 ("media: uvcvideo: Add support for per-device control mapping overrides")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This bug was previously reported by the kbuild bot and fixed in later
versions of the patchset.  The git log doesn't have a link to
lore.kernel.org but I suspect an earlier version got merged?

 drivers/media/usb/uvc/uvc_ctrl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e4826a846861..00ea894e79fd 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2413,9 +2413,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 {
 	const struct uvc_control_info *info = uvc_ctrls;
 	const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
-	const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
-	const struct uvc_control_mapping *mend =
-		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	const struct uvc_control_mapping *mapping;
+	const struct uvc_control_mapping *mend;
+	unsigned int i;
 
 	/*
 	 * XU controls initialization requires querying the device for control
@@ -2453,7 +2453,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	 */
 	if (chain->dev->info->mappings) {
 		bool custom = false;
-		unsigned int i;
 
 		for (i = 0; (mapping = chain->dev->info->mappings[i]); ++i) {
 			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
@@ -2468,7 +2467,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	}
 
 	/* Process common mappings next. */
-	for (; mapping < mend; ++mapping) {
+	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); i++) {
+		mapping = &uvc_ctrl_mappings[i];
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
 			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
-- 
2.35.1

