Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25563FEC2D
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 12:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243444AbhIBKdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 06:33:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46878 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233714AbhIBKdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 06:33:45 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1827OALQ002841;
        Thu, 2 Sep 2021 10:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=DIhy/MPkcvqpY5kJqhGAFl5X6CxWIfl0wVwB/g7HAWw=;
 b=R3LmYgyVjJ7+GnqXGQJU6SEn062qMMP8zfMVuSIZSobUy6IHzBSes3G4/gwbf6LYTAPf
 IYpFaEVZQsI/8rTFKvGYIxlbypF3j0XPHtLmcg1kaRkI0Lkkjo3P4xYULENia08jPZK1
 a+sghj/cfiK7xpkMiWcp0OZ9+elKiuvE8jxxmZ3bxcLdPBZxiOQh6Tpe1A7zrBYjNDpI
 9IVOm0clkdng4zG+1fWhEZSgZheSHp9oSJ/JX3j00JQ7w91nql+PgWxztW/JkKV1R6vb
 XSpKapV30+QRfBNydgtte196aQrMGUz3P4hwhYRNjY6xm6ZM3uGrq8zddWVb3+4WMAo5 8g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=DIhy/MPkcvqpY5kJqhGAFl5X6CxWIfl0wVwB/g7HAWw=;
 b=w6GLAp7zSKxGQB8rfjMuYY84MwEDjazP8sBP7qz3jKZXqXlGD1eNs/J1Uh1LiE988XFK
 2siSjxsBgHJBu9hiUGjfJHXfbDn6wHVYpriAOqRVBkKXYNxpMQUKNj7rocZbFhd+cBNk
 7YnvqZ+vz+jBEhxniZb+HL2C9KB4OXfI5iCJK6WURvdfD2fOvrkw6tHLdhQi+v4g/0Vw
 iiRrjqvVbJ3WZ75TYiXJVzZ6geJg8s3r2bfGHvpRIBPBP0osoHd3YweGtAu/JGPdv7QW
 ye+shqQS21rRjR92/U2S0M9yZzFKv8dXld6Lo6tRPesRgee30wDYMW18UgnQ6PKXaNAG lw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3atdw0j63p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 02 Sep 2021 10:32:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 182ATjt7154734;
        Thu, 2 Sep 2021 10:32:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        by aserp3020.oracle.com with ESMTP id 3atdyvavmh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 02 Sep 2021 10:32:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q24Hl023uTx/GkgWmpCf7JFZYmslFkHE3+EgV4CLpuiXBqzMK/7bca3DXG+VQnYtg6RtN1QfBSH7yvMtz21xsO05+XF3Bxc2GHL2SDDPgMXbmg67sXh6Fis476JKSdG7o7IehyRDUvh8GEIBwEkPgkUfOmXpJYE5IVTtk1Gp7grwXI4SVHpPfltRp9eCNzIBfPvOeAgiHvQJrW345hU8gDO5WD2HAleNT8t3U1M9+Hy2YhPjv1lsXKnhzv+oajER5ASgBdG5HbdAUWVrye1elyxknPcmQlW4ddb8AZK81yK5fyvDaazRUrlWWX9WyE1A5kavRn7A/EsffsEXfLOc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DIhy/MPkcvqpY5kJqhGAFl5X6CxWIfl0wVwB/g7HAWw=;
 b=Cw8lEmn1Hk3lcjc9YBu7rOQRDRXiZzJlBSsvr8lCj24e4PB6xA6NniTogroJVlVhes4VFG1+gZQZPTjUeMlSJ/A2bk0lUs68sg6NTHcKYtqIVLWsxHzG6Qo/FOYL9QltakZAL+yhHPSOsoSqDpXJ6+T6HD4DDRvxGPphmhl4uP0l3yFORBCZfLCnT+M5HgNQ0kDZEGj/N9ELOPcGXbVtPNdkGU8a/QMmrN5OhpvDRUjfYxS2X1aTvCBO3TC8UX8qcTBT7JRNltdiK7G2JnXXu8kBMINbXipbTwkdGCShMpbF0mbdFWIYCEzvJjqM66yEyoQsXuE21tSsBMjK5Kxhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIhy/MPkcvqpY5kJqhGAFl5X6CxWIfl0wVwB/g7HAWw=;
 b=d0URp3R7LVUrfEXawDDliVxPo7yGsiyOyuBiLBH21MRv788JJOHYiC6fHRJe2sqLIixcCngK17PneMFXj8r8DlUQA6QRco7XH4dhKVRSK+5BQCYKKhs2KxLr3munug0IZuzCZ+6kRMlc5kWTtCqBASE74lnXKX6vD6J9rCHzAww=
Authentication-Results: md.metrocast.net; dkim=none (message not signed)
 header.d=none;md.metrocast.net; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1824.namprd10.prod.outlook.com
 (2603:10b6:300:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 10:32:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.020; Thu, 2 Sep 2021
 10:32:12 +0000
Date:   Thu, 2 Sep 2021 13:31:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Walls <awalls@md.metrocast.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ivtv: don't allow negative resolutions as module parameters
Message-ID: <20210902103137.GA7291@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0109.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0109.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Thu, 2 Sep 2021 10:32:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09f97af3-d312-4a36-238b-08d96dfcece8
X-MS-TrafficTypeDiagnostic: MWHPR10MB1824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1824795FC071531AA97131AF8ECE9@MWHPR10MB1824.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KWBzh+RnnIMNPEhmp1Xri/2y5FJybFCRD6fqYzRsPeNQUe5tWqc6bDRQRFvC5kjW5RAmn8Jp8VxgdSpLVCoDR+xs3qVNn7pUm5V5WAyq/gLrrATFSy+nxoRvrnCZXMOw4FxX3ejWjxiXJjkZsEmTd1wqOiOGwveU3jO9ikKfO1RcbkjC9hZ4fIZeJVMKI7pFxlMH1fzxw7xV2LQWuwNG4GHRfHtwyQLMbvNQJKFiv1gB5MHeip6SaMzyQfCGRPv1O2qu6xwuh+F5YBHjEHBT12cjTLVyNuMRD3XFWM0FLpu0lJ0qgUoUtI6WQxQBqd7LljfKAuqeFtUMKK7DwX/NOj/f8nB3zjE+0LzUD5LIBHmUI7AdUMjllZK3p8tGKs8En3BYvhQO+7nHZg0EsGa8WKgnhTihNWOHr31SCf52ufoYsxtl9GvApF5ntvyhqQTxGd/kKsjACQwhboegNNDNqy9hNJo7Wcla/gAJWXG8k/8m9ZYqveyhteJ7IE3owFfTQ5lec6l1dyprcGic4+d3ElXtHAAUFuniYdUT3+LgbLeiEiHQgAZd4sUWg+tRzekab6l+Kau2v795flBfhKUYQQd++LGchDqkbHo3PFtDGqBqCggD1JjOQjbUESJFmu/8Hs63DEn+b2yCFLsfMSldlJiOLNQ1ES/CuBezd1ZfVNcfUwOb7h4f1z2F5O+dZNbnpfo7defLSgR8hLRw9q+qpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(346002)(39860400002)(366004)(8936002)(4326008)(38350700002)(38100700002)(2906002)(8676002)(186003)(66946007)(6496006)(52116002)(5660300002)(316002)(83380400001)(1076003)(9686003)(6666004)(44832011)(9576002)(26005)(86362001)(55016002)(478600001)(66476007)(66556008)(956004)(33656002)(33716001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdN6i0v/bqq8GTAY2s/+kQRpcZT2YIH/iX8SrC5P0VgaZtfIJHGY75S767cI?=
 =?us-ascii?Q?5MM5Hc4qfdycFbgKyKkuB+GKvfbdmBrjPReMcY3213SYmAuay3dSlySDaAgu?=
 =?us-ascii?Q?hetiBvqKlC6ImgsvWQDSx/R7tr0nHq71yCkiuyqiuEGiTEKnGbCUOsPwjVS3?=
 =?us-ascii?Q?liqstlf0AXdGt/Z+cuGqWOHIvvYY7e0ows2hGTHfIrhCnAPo1FhilG4DtE/2?=
 =?us-ascii?Q?rCX/QQCs5JzVl+Ffre7yTiZkHy0AVI1UzIkkKkTJKwZAFfX4zV6XewCeZ00A?=
 =?us-ascii?Q?V4i5l8y3hsEjLq1yF3dYQczjQCneFmjTFzPTV6eCme7q4lLlTUAaL37TaV/H?=
 =?us-ascii?Q?aAVJaWejuvzt3soH0hid3IgAIZYLIx38DvEJXTXG3sHPK8rg5XKhYDGpP1gl?=
 =?us-ascii?Q?Z2tAN2ymXm/HVjVIC/1yGXP08TnZzTVNzGoi8sNgukK+aKZ8GKLZ9wdYI14Q?=
 =?us-ascii?Q?r8YzsplgCKWSsjfWBbUa6Vm4GP/UeGzNAfn5tIO6nR6lS4pInump48PLm6mN?=
 =?us-ascii?Q?vo7uyyPK+Xmn69y5b8UHfOmEgKn8hn+UkY3+lolhXifkaJu95+9wDZGiL1J5?=
 =?us-ascii?Q?y5zP1Nm6cPCOgWnlozjHhwgmcV/QPnKgrWmmYZKjbjBGvOu4PKE82Y/qoPXn?=
 =?us-ascii?Q?SzWxndI1fEiAVRT4ksnH6CIuOEeiwZWIdhaDF/kt+Ci5fKVSZiV2Atu0Eb/z?=
 =?us-ascii?Q?C9UEjOyXUELlMKjVoyzVdZdiW+UERjOF6ekdaMfQRqndopcb5mts1S7F1uoS?=
 =?us-ascii?Q?Q8TBqB5PCNoVmm+0Pn0hPDCcuCUrDqNDphqu6o3XUfopFJl3y0CbspL23jZI?=
 =?us-ascii?Q?NdPRICc/oYj1rJuwJ5gaDAPGxtchui4B33ZYZn5UHiKeftlcA6+XzmkdiHPj?=
 =?us-ascii?Q?8GWzPrOchiQeRLSmcIdZgabg3u6sQfhy2ToaQqAK46w4v12rZGV+jR6kqyIs?=
 =?us-ascii?Q?QzaDC4dETH84hNovrgCAGDBsjJSWjvQlomb/y0GjPUzX4nJ96tC29/7d/AOZ?=
 =?us-ascii?Q?QS4fiNG8Q7xZqkY7DkZRbuCJeANw3la7jq7JbOpKODWuJTxUGNWC4HnoadFJ?=
 =?us-ascii?Q?BnVTP+yiJA3Ll5LJAt+U2HHMpGw9eV8BGyEe9g5XjfzjEyS/+QrnyfMxTQgS?=
 =?us-ascii?Q?IvXAdciPYERBJwJ9/x/sFErgjto7nsFfLeoY+SrkxdlYXp17KFRHff4iKw6F?=
 =?us-ascii?Q?K82vmYpZhBvFI8UgNhdibiIp86wrPFynwskFroscnsUDHSWyAFQhJ9QKVTSA?=
 =?us-ascii?Q?aTmWEMwAAAzVqmQwTjpnYjiiowRuA7p4etNiDygQ1kZJwz/onF8kW8w/h5nI?=
 =?us-ascii?Q?ggQrgBq80weEcX10qQ9QLHqA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f97af3-d312-4a36-238b-08d96dfcece8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:32:12.6066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyJ+2Fm6mGvetm+NISjRWcyFqZF0J6HDr/eNus1nU8V3mW0+W9Sv+Z5MUJiGq+XYRKzK7M4Il76aB94cHGMXCZ9QU86kifKUyHxEFfi/LHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1824
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10094 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109020065
X-Proofpoint-GUID: HiFjSbO1WHIkkDVvU_9K249aU2xEFmGf
X-Proofpoint-ORIG-GUID: HiFjSbO1WHIkkDVvU_9K249aU2xEFmGf
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver takes "osd_xres" and "osd_yres" as module parameters and
caps the upper bounds but it doesn't cap the lower bounds.  Obviously
the admin is not going to enter negative resolutions but the possibility
makes static analysis more difficult.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I also considered change the other int options to unsigned int, but
those don't lead to bugs and some are required to be signed for math
purposes.

 drivers/media/pci/ivtv/ivtvfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index e2d56dca5be4..c58ca8aa6d90 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -48,8 +48,8 @@ static bool osd_laced;
 static int osd_depth;
 static int osd_upper;
 static int osd_left;
-static int osd_yres;
-static int osd_xres;
+static unsigned int osd_yres;
+static unsigned int osd_xres;
 
 module_param(ivtvfb_card_id, int, 0444);
 module_param_named(debug,ivtvfb_debug, int, 0644);
@@ -58,8 +58,8 @@ module_param(osd_laced, bool, 0444);
 module_param(osd_depth, int, 0444);
 module_param(osd_upper, int, 0444);
 module_param(osd_left, int, 0444);
-module_param(osd_yres, int, 0444);
-module_param(osd_xres, int, 0444);
+module_param(osd_yres, uint, 0444);
+module_param(osd_xres, uint, 0444);
 
 MODULE_PARM_DESC(ivtvfb_card_id,
 		 "Only use framebuffer of the specified ivtv card (0-31)\n"
-- 
2.20.1

