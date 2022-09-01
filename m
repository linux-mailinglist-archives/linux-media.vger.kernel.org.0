Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B472A5A8D41
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 07:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbiIAFUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 01:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiIAFUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 01:20:41 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F07086C1E;
        Wed, 31 Aug 2022 22:20:40 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VNmm00028371;
        Thu, 1 Sep 2022 05:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=nmDn9JFuPGDLkuxqLAjYQPQ6+31J/j8BwukYDBG/vdI=;
 b=L9z+B6XkveohlyOxZmwDdl5AMlkjo1sQbbPxa8CyWa3GuJBlQnEHgLIPUltR+46aQbzN
 T2ZiUtami3ZQUCQcqKjBkI9S841qCMbfdfCzViJ7uDyPhwm2Z+1D9CbPo6qZh8s4Pevv
 bceGgFO+JtP3Ox/WrbWNjs1uFbM4nO4rDzmSg/r/xiUmC4xBrey7Q3ha7I9JqXbuIdMQ
 v7ZXfrrQr0L2aj6arijg5BdPnYN2UMr1A+Vx+Icz3xwaF7LX6s+9Kxp2RBLoSt61tWwA
 0sWfxlPBa0TJedJD7LvUbSczSsYvugURzViMbdarPMAhUD44VxoeqrUHXsHXuK6O2Iqu +A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7a22b16u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 05:20:21 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2813Tcsx033691;
        Thu, 1 Sep 2022 05:20:21 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ja6gr3mcf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 05:20:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7t08v26cwFUULu0ubY7SEyS2nGO7Izk877OYiek/4oCfxXrK0ofWlk4ybLj3IgnWbW4Io9S/Mje/0gYScGZRt5FIpTH46Ms+SRVa6Z6yj6jSp5KIeTkKYWcYWMHTdOpIwqkBcBGx6QmsaXx1OOCTUx2zf2KPZHgKf3ssL+aEiaNb9Sx+p4krws8TiStJXUAA476SA3SGKHVjf8a/OPHbwmQIISQlbiJFQNSQTf3tpb8c6QRUazZGS5iR9lIByfTUteGLnq8NF5QAqTIpxjEtauJmcTBWJvetQdtxUkheusAyV2NeTveU9J0JnV+7ELzgebMkePhHl3G/xH73MzUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmDn9JFuPGDLkuxqLAjYQPQ6+31J/j8BwukYDBG/vdI=;
 b=d79W7JsMetS3wVytTnHgqNy+WOd4mDGv+kP924JsNkDSfMJfcYRfqLNgV8cE1WhbZhg1x7YYsWq0zxKLk4UKK1oPF11Aq2/krHCErpctkZGX/r3VtRFbnB7JYQtKjkKbXQIoTUATJN9MyLn94qC1QAh7Gi9Dv0IbT2ZFSYH9mtt0eVphfIGyqksHiFAXV92Ob+bFMx0M6+nOEQBgaGYTXO0jTEi3Ewt5QG4+OP9aGxhyoTXZ8OZf+/KWvi76gHo8LKuuTZIRXuRMlpeu4nCA7i3kSTg6TqQF1+qpyWaX3aKL3AupqivBEkZ4Ct6YR5GgTzR3Qu1NdLhz7SRFVmg35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmDn9JFuPGDLkuxqLAjYQPQ6+31J/j8BwukYDBG/vdI=;
 b=L3iwxJo42r6SDJDxqVNWMWQdJUP86oKFbUdVeY2U00P3wuQOJYhBFp5YAQVY2qw21hbhlNt4uap1DuvHpfjNV7LAbvLF+0wkof4yXduc5IfpUrYnfPIO1ez6F9unuwdAhcBBH+mX2eyfolQgIf/KJCsNOJkU0sel2IVwlZfZSgI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB6559.namprd10.prod.outlook.com
 (2603:10b6:303:228::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 1 Sep
 2022 05:20:19 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 05:20:19 +0000
Date:   Thu, 1 Sep 2022 08:20:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: prevent integer overflow in
 sh_css_set_black_frame()
Message-ID: <YxBBCRnm3mmvaiuR@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0133.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43966c57-c76c-4c1f-a047-08da8bd9a915
X-MS-TrafficTypeDiagnostic: MW4PR10MB6559:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oqAb3rGNKYZJCeJwI5MN8AnW36JUXcr1rB4V4j1tBCEKG9SFDOYl8NouHNE/3+VIzcxxUipa4cwnYqv3lrgYrDl1w9ACfHNQJb69OY/wLCMXfFXbRK5apelneK+mTlys4gXtcnYTrllZ+4dig+fvi5dpRhOClba/2CPEIyhtop4ngFPmDF7UXUWLLphL1L/L2b3gUxXA0Jvd5Qn6+rHA7J6YRu1l1tseWWRkCGoJzKQZVM/WAcyypZpbJi5IxIK/YgpWjEeGTECvtXvhEysMh82ltnvSzDSQVv9HHFLSaBmoz76lkl/Xzn7bRCu5fE+yrAH1dc77IXCIxjKXCvF4e53AZaJC7H1Wn9ND4VM4n94U/WbiqKqtmj/WTXBPW4dGa9jbDic4Q89ARXBGekhr7yQcGAoM4QjXFaHn8nnz9EXPPxjTA3p/jyEG2Ox/I2Ho42YAL5+c4CMVASjBoYDcmzMBJJ0vAC9Gpsu4VvhSVZS8ewL1URWPCdi4Mlz5vEC4PrsZCGrJ2HH6IdDduH9rQlRl+TATAbWVj2t1AxIxz9HmEJJ+fASSB0alUR1sNqeHlejNqkL3YUyP0xHOH68m0iczEAbHLfzAAVjj2QxP/VapbduAjnQLJc+0uB7tPLf4SH2u8QS/z67nDQdOM5sxk+07w70Rkkb5DdPCUE5ICys4WyZ3TVAcUtPqw9agLEh/brG+XTcb9ITyRdnfU+MJ65RE3VjqAlT/uZ+X+Ojz0nu2vEHpCy5eTuKJNRkOuzAcmq0yTDk7eG2PUaYu8p1bpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(346002)(396003)(376002)(39860400002)(136003)(8676002)(6486002)(41300700001)(33716001)(4326008)(478600001)(66946007)(66476007)(66556008)(2906002)(52116002)(83380400001)(5660300002)(6506007)(9686003)(26005)(6512007)(6666004)(8936002)(44832011)(316002)(6916009)(86362001)(54906003)(38100700002)(38350700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rg6LFfq4K7AkGJOh6wR+0+M2a4OhlyRBr8+43dQGi17pFZmu7a0YcU//atZd?=
 =?us-ascii?Q?esGMdIsbTbLcnlvMdjFRrB4JfgfmjBQlOT3sbDy3NE08L6FFQavpjcPgTFVU?=
 =?us-ascii?Q?/f5e0qsIcFXyunemIeEJju4DhNXy3Tvu0/tcWhL1eHOcqvZ0kyTNQYAzFw5t?=
 =?us-ascii?Q?ABZ1s1qFnLSGD92KuHkLinH/kEByH5JHys0sknC6tgPem62isOp2quh+Xdd6?=
 =?us-ascii?Q?ZL4Ay5FYinkbmGTmYqVkTdeELRn3IJN6YyWAR0iTcKcBjj1Qwd5DCVQ+o19V?=
 =?us-ascii?Q?M9vq+hgFztiMkw4mKwClyASNl/UeEB2wJDIiDStH30uXjS2w1Ka27mFHnf/m?=
 =?us-ascii?Q?63brboJIktm4o4ebF7xC44lQdpLO+ZLWyD2aJ1jwUOcrm9FSj1zlKMO55//x?=
 =?us-ascii?Q?7LAt7cmVKY10lZfCJUG/8MRHhYYzl//fwTCnz1gAa0PZjcztq4hwLEdUSGUJ?=
 =?us-ascii?Q?h32HMxB555rXrC+n3szpy6gxFK9HWlY+rqDkFEgRqRk/T8Zk7l6LOEtNhS0T?=
 =?us-ascii?Q?LVh+X9oR2vrJZmbRNwdNzVHAxWjH7STGhix4IHZoRYSLMPDIZui765/zynBN?=
 =?us-ascii?Q?hKUSOHY15rwaVsPCOY6TM7YxMx4U9GbudsAOiBBmD2048PROMU/OrYPjF/dF?=
 =?us-ascii?Q?g8+j5jrYOCaGfxE9xh3v9ZcljBpdFa57kE8qZh9g+KGXfaoysUmZbxufrw7z?=
 =?us-ascii?Q?KbRDfSV7h3eYsMjZMppg8fLuBQrdyJKmVRaSp44pr0Qxcp0ICQQOxRakhkP2?=
 =?us-ascii?Q?jzXhzv67lUjx/1yC7xzmMu3xtAvNoEwo1WSRcqYm0Bm5A07vnSKYq43MR4oZ?=
 =?us-ascii?Q?2Tq7PTeBFCvYoToGNep/eLYtwbv42AnxwGzO5LV5FinDpCtF76swHe41T+qC?=
 =?us-ascii?Q?CKXjcSR31ph1cQm/1KxKqHL6zaq3zS9KWNRNe2huU6ymET8O3C0ewTI9A+wX?=
 =?us-ascii?Q?TBvgtBdIQFyC42oHJpSGeUwxKBt700IApTqe0FGJORUJ/x36PmWYsiC1i8Tz?=
 =?us-ascii?Q?jotrCItZyDK5sngKbgbAhS5xA3lbU5sH9gTj88bQDUSv7D3LYV47vQ4KphgQ?=
 =?us-ascii?Q?l2iXEt7vToStfaBDhA8PbpnasmLopeZEVLe9reelj3ovDTqGv6YlFOfC6aEm?=
 =?us-ascii?Q?puelH8DBp3+YBUmEeKv8nEYq6NvVXmDL7wS1+WoSSyeGo7b4mc7O0FTPzGFE?=
 =?us-ascii?Q?wtk66GWETfSZcEoDQR+dXR2rKXtkiZVcdEkosAecE7iySB0ZYNqJssKAQ+Cw?=
 =?us-ascii?Q?e+4edzDDHNv/bAvvcm6B15+rLrNiRsiSQeuwRbVGh23c9/vyAOJd2eH5B7gk?=
 =?us-ascii?Q?+nHuO9D7AaRFmjPeoDUO1Z2xi24OLVt2uDDsD4sorImbgjHb+MMKZ3V+esvA?=
 =?us-ascii?Q?tIohQjiMdEdSE/G/hj91+1l5+P1rE4Ikixab1BZzNv1BfT4kGXodWaSpxZ1l?=
 =?us-ascii?Q?N0itEmNt5cL8eaQT+PGvAaoHDe8TVLGmYowApBkiiW0yiPmrEoKFGwqL/h3U?=
 =?us-ascii?Q?h6u9+Ic4JUchcLUkfL0b/rIk6f0n4roS0HmYufj+R6kkJFeRjJ2h5S5C2GKj?=
 =?us-ascii?Q?HNw2bu6UkTIuuNnBlEJthvj4x0/3lWNN8nRP+3P4yb5stT0axqobch7+tnW7?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43966c57-c76c-4c1f-a047-08da8bd9a915
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 05:20:19.1964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRlLavgamnP7Q77ifhwghl017kWhwwkZ3D6QhGGUhI7PxL8Dg/nEhfOGj6g9/rRCxHLBNLpQ4gnjYkdBQ+YuenSW+84ztENYQ5jUXYkcDgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6559
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_02,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010023
X-Proofpoint-GUID: 2j1k2OLKP_wG_DOPARZMGdks5TYvj034
X-Proofpoint-ORIG-GUID: 2j1k2OLKP_wG_DOPARZMGdks5TYvj034
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "height" and "width" values come from the user so the "height * width"
multiplication can overflow.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 0e7c38b2bfe3..67915d76a87f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -950,8 +950,8 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 		params->fpn_config.data = NULL;
 	}
 	if (!params->fpn_config.data) {
-		params->fpn_config.data = kvmalloc(height * width *
-						   sizeof(short), GFP_KERNEL);
+		params->fpn_config.data = kvmalloc(array3_size(height, width, sizeof(short)),
+						   GFP_KERNEL);
 		if (!params->fpn_config.data) {
 			IA_CSS_ERROR("out of memory");
 			IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
-- 
2.35.1

