Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195D246CE6C
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 08:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244535AbhLHHjr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 02:39:47 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18310 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231469AbhLHHjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Dec 2021 02:39:47 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B82ocsp028622;
        Wed, 8 Dec 2021 07:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Ha4lA9nAiHOqg7RVHFip0AWX8AXscSmT6Jn4w4YVi6I=;
 b=clMMlmbfxxVMp7qILlDNLmD9OMVtP3kNJip+jrU580zlmEpjipDkIcBSe9zLrfDtQ+6F
 C8QptkKbyz8TaTb7M987F3VqVDTrI2eR+BVhS1MNZaczief4lXUX3vV1tgg0U0905vbq
 6boOe6uhAsUv9HKppBqoEEOW1ZS4S1bvGMOegeqoX3+43cFsSM5C3o2UnFBzHQs3jf3J
 jHXsilsMaUX02mXp1e1TWN6gTLl/OYIm767XHhmCnZLWKVg100HiYPFFJZ+Cy/8jT9g8
 1WmZMTBqMyj9kldORT/2azgH+yzNkKuaVqMEoOiJbN/6/8gxhyOjZCQeV8qjhXtPa7Le UQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cscwcfpxx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Dec 2021 07:36:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B87FMfA073330;
        Wed, 8 Dec 2021 07:35:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        by aserp3030.oracle.com with ESMTP id 3csc4ucdgq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Dec 2021 07:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sgjir577TW8YBlXR/sw2h5wxG73wF8x+5rl8GRZAJEMmkMLiexzOQeHqE2/dSYF6esXv6LTx4F9yp/EvFeAmKI1obyPOaEHheO/Edd/YPfLWjGuT8PREtkkAbZ2cg0V/EYB7y5sObMCVTOojRt8I3Dv33ypv/pXk7Gn3Orc8mUm3pamDKLk7X9GOxK4cENoNkFIUhEJmQgVD/nTD7wva/FYD+qeHE0wlVEY7AD6z9inn8jDAh44ZHyWAUHSXgCXtlVkBjpjJ1C9IzPkqWNnsTK26dqRBv2PBJa2gM8UQmEDAHmW7wvPCTMuIjne/pdJ5klJyhFQVf9xTyUhM+H/KmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha4lA9nAiHOqg7RVHFip0AWX8AXscSmT6Jn4w4YVi6I=;
 b=i/DKm1fXqcJR4sf+Qek7zonH4+ZiyxRmhA82+Zzkll6XczC0tINshETyp73qwyVz2EaffS7q+cD++DvmcRZzYq8lm1+mpywUKUvUvlE1qJzFAS22SoTwpZ2a54y/2aWbuvL80w6wSXlLHLQI5+lE8a9BQ3h4iQFsRnARijcn/tsW79LWdJODvMyTpy62P0jyJXLf1RnnO1vglIjiZ+nOr41u2RYKFcSn1flBrCXHYQBrIJf+wdckui4NF8YUNlqnwyQaekR67CcC5RLqs+0C1do8FZ1AuD0I5LbxGCh0FFqdVIUqsVYJS37/evgKR9Y8T/MVjMOE8N47lt64BzlEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha4lA9nAiHOqg7RVHFip0AWX8AXscSmT6Jn4w4YVi6I=;
 b=D47WSPMPJ3Yp0wtrJeTJCBbTeEYi3Als3G5YLIq11y+MSgcVLOatB/C0IGfI3lNqrua7JtS67OGWv38s37Tec3eq6M70qTyjTViohGeZAJl+IR6UfO0+Bo+avuw8RuD/uznPwo2T8qKGi9mNLEuz25WpVQVE+CxyVsdW5svdquo=
Authentication-Results: foss.st.com; dkim=none (message not signed)
 header.d=none;foss.st.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5861.namprd10.prod.outlook.com
 (2603:10b6:303:18e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 8 Dec
 2021 07:35:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.023; Wed, 8 Dec 2021
 07:35:57 +0000
Date:   Wed, 8 Dec 2021 10:35:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Peter Griffin <peter.griffin@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: c8sectpfe: fix double free in configure_channels()
Message-ID: <20211208073544.GA22020@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0016.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::26) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0016.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend Transport; Wed, 8 Dec 2021 07:35:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fe92987-fc67-4085-b28a-08d9ba1d5f69
X-MS-TrafficTypeDiagnostic: MW4PR10MB5861:
X-Microsoft-Antispam-PRVS: <MW4PR10MB5861EDC3AEAD231E6D438E678E6F9@MW4PR10MB5861.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCzVDcksHKEDM4lXEAt/EegiXcDy3PcXyJyqCfDtm1NKFoAjFvrS9PqxLngrp/AM0LttVLgcHK9oFXHrOYjJYqhhJsMeo78gfB3BdpCpkpFVpQasXpINm7ELGaJKj8vzu+KHmofIQueTxnlCx6fqMcj0LQZDNeDuBC+zuCWn3GEh5KXLnHH2alJPgh0iszDk89Pghn1cJKXKs89I3eEBA4hgk8hspdDjK6CdOhTLod9otMxfnrATX20pVuxslUSD2YAP9oU48LxF3LLuxP6SMaCTvrrjopMptPH/s3NU9hj3UkhgLJJljvGQkHFE1SMrULOt+YH1eDe3wkeWE5ApfBy2F60FHEO7QQbBDrPXjkUeS9rHoBB3GXq/oiDhSqtd7JjCQqTDJwzvpSO2hntf71Y1aIjKrS1crWpW15BBQ9zj9BaNhv26Ox1fxHQDe0/umdfCy8LnqaJ8WSH1Tom5hK3QgX/wIT1DcLclYHCjLrGmWS8Eupqj2WsosUDHulkFW8nDOd38+Kc+cmDnypYsEaLRmmm0LQ+E/jpvxpOsdDa8i3xnzndVnUxT+4tposWjC6vFd6EZXzJ343rZRSPyn8OYa+wRBcoBI5X3NbfNAUY1HZhgNoZ/fDn3ZNcFC9raDyjbPQaTvDXnl+ytDKz+8QHbbfnwdkESXrVP4oGdfqPR9Ed6KLccqL8sSorn0swwP16ZZkATdM3gJRx9imO3yZh+DfIAIkv4ITYBjZZLmEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(66946007)(9576002)(8676002)(110136005)(508600001)(26005)(66556008)(38350700002)(186003)(33656002)(9686003)(38100700002)(83380400001)(6666004)(6496006)(1076003)(44832011)(956004)(8936002)(4326008)(55016003)(33716001)(86362001)(52116002)(66476007)(5660300002)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CKCoMesqsNFSCqVeR1CdI6LLDvhKxGXB0ZeE0blnPz9oG4mEQuWDOk9Jn2is?=
 =?us-ascii?Q?2uLc76Yrgx6Pv+48tBSnv2af4MZeG5hGpDnrEBWbk/RKbtPfNokner2N7V6U?=
 =?us-ascii?Q?SuJ3uE+Ge0mJrs3Rho+P5j1W+pNOkEwkIvkRZwlaok5GFzyFl3xAntJvM1+u?=
 =?us-ascii?Q?XbILF0kQxx51488Vcc5EWUT+V/sumVUNEM0sDeLfxFGP9pLMZZYzJrwpX/qK?=
 =?us-ascii?Q?1ewMwM1aoNyFEBMGujTwqHdQb7GDTbZFAJpQihRvoUlKhB6cxILWYgq+N9k8?=
 =?us-ascii?Q?BT1pCp0UTdp1U2uq9L3PWzkndpqFjo5HrcZIKTp4L4Edyj6S0u0lsgsdFWzH?=
 =?us-ascii?Q?4WqwWkZW8uwwFdAIrQ7b3akrqe9sz0YYb49pYprg3Gn7M5p5oeTjG8SnbVgT?=
 =?us-ascii?Q?kESOd36naNrOo4SIYn1kYvL4dfP3+C8ORNrU/dwovbU5/epC+36ho+SKOTjd?=
 =?us-ascii?Q?8/2tgoy9H5s6zmtC8ip8F5OQQJHrjHISHC04xg4y4FzMMfW4aOFKjQP1yHkG?=
 =?us-ascii?Q?DGbOJYPeGQyLriX1GkIuKGt0LolKkWDxw+y5AYljN2FplSEQRStXU8ltV28z?=
 =?us-ascii?Q?VYo0ayK6SltncIZEEzhUeCmFJ6/8aSyxeDmVSh3mTCeCxVa+tI8lTocEZZg1?=
 =?us-ascii?Q?6nZt3BSomfK3x7LETil/mxzSynPCw6abiSZBwWZ9v+en2UAX43MIs2HacMxD?=
 =?us-ascii?Q?4w95T0W8odU/8h9hs104P2PIxDHwLAaxPsITFloIXCImf0XOAISDYVjauhbD?=
 =?us-ascii?Q?3X/qwdwYHytk70/PNqH9+yfmW3FiKtyNyi+TB6/zvGc1TOk4gUoyM6Bmsuf0?=
 =?us-ascii?Q?XB1tva+eUDzTAk4C7csrOmJf20PgIskV16Uop4F1VLwUmgI9X3+myM29BaLt?=
 =?us-ascii?Q?3qzneP/VfH0kIWwFX9zUfmuZWGeYgafHK4kTitY5zzH/XrlbaxfFL8lE1qKs?=
 =?us-ascii?Q?uXH2oEXM5d8TfQU1V2Us6lxhTpQaYUnw6vMPQqQs9YzOefgYtWQObWfPW7et?=
 =?us-ascii?Q?2cRr3kOvM4idxA1zRcHvsTRgR0CiBrbuMf4WaAlP500kFpLkYtHTohhejD58?=
 =?us-ascii?Q?9r0f0+LqUdIvGjFMMHB0U2VSCj9oreUwBx2iVsM/Ktt0Hdzlp8zZfnmSX1rL?=
 =?us-ascii?Q?DAnm3MHGltuFElmW2rTZpKQepKXCP7mYfybK/EN99iZXkX58PQD0J0xUIcvp?=
 =?us-ascii?Q?77fr1NNcGZlvJK3/A+eKBqXNqgDmGUCy9aabJWNAjpT9uvLhLnp5QCzwFJVM?=
 =?us-ascii?Q?kpsNZtCspDscIcZnOfV0UQeYP0F+b8IoPdJf/edp46bRAvxeDDGyGCGI8ybB?=
 =?us-ascii?Q?b6aOfmA7GsElonyc27aWcqUqLz+gykXH8LF+FsY4yK1bvFExeH29RQV0+oMf?=
 =?us-ascii?Q?g6jqnpoAlNRl0bSZY239NX0eP83KPwH3afXwdLk2dqs+l/fbLCYmA4z4dn4x?=
 =?us-ascii?Q?wZ0r8VY95h/W6IINRpAG/yMP6jfLPYFYqnAxHfQ54O4yWYQl2fTa4+UOM+JM?=
 =?us-ascii?Q?QTqu4urwlUvvk/wnPVhd8uL07ar5NdprNWlzDF+zfMo3irldkFk+skFo+VPd?=
 =?us-ascii?Q?TsW6h0YDz16UGYAO7/v3vlpYzcIlJe9AG75iA+QHHLdgVVifctjpZaIyI6xl?=
 =?us-ascii?Q?7M3bmQzqhhXH0J3Oyh78KW5yRXERsme9Ih3SajHVlTgyRwJeZF/PQfHz/TU4?=
 =?us-ascii?Q?/QxJ+frxRFFnWdklFAOhobiM35M=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe92987-fc67-4085-b28a-08d9ba1d5f69
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 07:35:57.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yssxuCkkCSeqX+h1+6yEOpMgDauHf7uRSWJwZmPwaOyIPGdlZ1SMjEt2V6REnqRXVllyeS3Ho0QcC1dusoj5Qw3K0Nqfc+7Lvsbb8bIUBBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5861
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10191 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080049
X-Proofpoint-ORIG-GUID: JHrG8aR9zYTO62ZbfB7Jufelopv99XNq
X-Proofpoint-GUID: JHrG8aR9zYTO62ZbfB7Jufelopv99XNq
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The configure_channels() function has a double free because
configure_memdma_and_inputblock() calls free_input_block() and then
it's called again in the error handling code.

Fixes: c5f5d0f99794 ("[media] c8sectpfe: STiH407/10 Linux DVB demux support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index e1f520903248..7bb1384e4bad 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -925,7 +925,6 @@ static int c8sectpfe_remove(struct platform_device *pdev)
 static int configure_channels(struct c8sectpfei *fei)
 {
 	int index = 0, ret;
-	struct channel_info *tsin;
 	struct device_node *child, *np = fei->dev->of_node;
 
 	/* iterate round each tsin and configure memdma descriptor and IB hw */
@@ -943,10 +942,9 @@ static int configure_channels(struct c8sectpfei *fei)
 	return 0;
 
 err_unmap:
-	for (index = 0; index < fei->tsin_count; index++) {
-		tsin = fei->channel_data[index];
-		free_input_block(fei, tsin);
-	}
+	while (--index >= 0)
+		free_input_block(fei, fei->channel_data[index]);
+
 	return ret;
 }
 
-- 
2.20.1

