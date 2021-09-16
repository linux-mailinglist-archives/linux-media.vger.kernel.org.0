Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D151C40D824
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236774AbhIPLNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:13:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28180 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235657AbhIPLNA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:13:00 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G8xkJT012725;
        Thu, 16 Sep 2021 11:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=au/VDEMGIJCm6Bphh0BbvIiOy3fD1/cmyY0H90y6P+c=;
 b=p8p2IxGJ4DjlKRIOCX5MUkOb/56jeG/mv9LRyvQfGoNLTBEVOZ3gfihrepwOFqwrImV6
 7lASW7HOMSG4QF67VvTxeQnAQAKnd/SmXJj3YolP0NPCldDTdk6OL6wGbrUcKhRF685q
 RGXezf93VaVOaJjoFb6hwzEsPSLKusf335vDhFe6eyN4f0MJt6677vPu7xxczkb+NXk3
 bftk+H4aTmAfPWJJcvNEXNpAm4S6Yc2buFRCK8tnOksADOAc3zVggSGb1GTqC/BpRe1G
 jJhZKh4zM2SjCURYJyg+ailui3NCfdA+fF07S/fevEazkqnDm3Y88SqsZgzE1jLl4uKV xQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=au/VDEMGIJCm6Bphh0BbvIiOy3fD1/cmyY0H90y6P+c=;
 b=Gpna1ypAOMODOVNsVW7Bb3oXYu063Q/9jcmP7pkQ5N0vXdCHGeG7Gfxj/4Fok90ILEHQ
 9R1n1Z8Ksc2ppfWVlvO/HbLlGwBxR6zZSGtRvkabUoEnMkeCPx5E9SrKp+RgALxe4a40
 YtsQn/pNnZNyS/WLhgCLXuYEhFnFfzsoGK6t68O99fwzM5g2Sv5ZFebw2dWlesknFzP5
 +A6BkGuC2SfkRgOX8zcY2wwtV/xu1M5t60koGw1i7CX9y1ENMEXDH+gKfwFrbbh6a59r
 NfwEH6F7ruZcBCS4VJOtfCK6XrmbjRrlnhQoKlYkECPhLsbxpOsBzR0NNpcQSy99BM1w 2A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b3s74hq28-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 11:11:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GBBJQL073244;
        Thu, 16 Sep 2021 11:11:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by userp3030.oracle.com with ESMTP id 3b0hjy1t3q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 11:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHgwck1m8DSmKZcGBeNRnsxS6M3ZV/v7rEHaFRSalHESt1PDtrzeu12iGVM0qlyyq71h3ZEfPG6O4PWVXVruNvxts/cRBrOapo+nMwuN9PXM9GYD9RvkyFx6f4WHTRFezGo+MzgI5FzLCWPu0FYtSZLPOe/MU5DG1NnEl8sU1M73NT4hoNIN42gqFVH7SHK3HDnAvMiFn51k1ulHahIIjs6NtepIeO3x+7bGHOEVVbjG4RFLQkYTJgZCkasL0MERfXTi1gqknUuD6pXZeHqgiCGC20buCuXQGeD3GY30NSNR0+UjpV3PysIfKkuPkKqDBxdp+x+kX4y2ZvtoTc9Amg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=au/VDEMGIJCm6Bphh0BbvIiOy3fD1/cmyY0H90y6P+c=;
 b=YuYUdEIGgna6J1+4TXJp5XmGvwDNrn/OyQY7E4D73crurPKFEUAD112NelHpasivjMMqD2Wb2mvPBl30Fo9Pq86NIHJ4pTw1uJnFS1KPuyU4HYjT4Hdpzl01wIqGOmYxGOqP78XjsiwHdvJgR8NLBVmhBrRlAjjM8Ma9DJGxZEuPjVZnkPcvJ/boaP5NoLVtbprT3KDUxSrjsMoAHCvagzBBz6/NJJbP6JjFrWfvChKKuLcDwJR7gfAxZrMHFO+IfybBcj/rO20xKO4k3HQOju50NvQciPeSxUlaZCG9+M09Xl+ojj07nB9ouKewTVc37ygiHVX91WNbZHTN0Vj6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au/VDEMGIJCm6Bphh0BbvIiOy3fD1/cmyY0H90y6P+c=;
 b=QPsGjJgUUA4xRFIzpffv+3nMNnpDNL34OB8Z268ykyzrG5ZP2ZluS7yWhXfmRBYer58kjSKo+LXf1rGyZU0WBjk2DgP2TtWChAxkWVGUQbQ1NN115NkOcsqeRUHlvmvUvLq4R/0kdK4P3oD7NCYO2cRvE/+zkhYW8IVXUC5PCiY=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR10MB1733.namprd10.prod.outlook.com
 (2603:10b6:910:10::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 11:11:15 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::95b6:2084:3b1c:27ba]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::95b6:2084:3b1c:27ba%7]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 11:11:15 +0000
Date:   Thu, 16 Sep 2021 14:10:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com
Subject: Re: [PATCH 1/6] staging: media: wave5: Add vpuapi layer
Message-ID: <20210916111053.GH2088@kadam>
References: <20210915162324.25513-1-dafna.hirschfeld@collabora.com>
 <20210915162324.25513-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915162324.25513-2-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0014.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::19)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0014.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:11:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9dd033a-6f27-4ff8-a623-08d97902b260
X-MS-TrafficTypeDiagnostic: CY4PR10MB1733:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR10MB1733914DED51EB803C3F93878EDC9@CY4PR10MB1733.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qaWCaQ02DfDeDABkJyV3DoZiyFy0ekwEpr9hProUZJS8xm9WFTBwWBm9nUqxcEQl0pYBm+PYFlzcL9uZzktiPKALwvEWqFeaQ2Ju+R4qhNQID6fbDh8W7pkWHUeJUXjLGE7SP4PCI9ykpUIycIf4+zJvQ5fTjw8iRPu24XjhDkkqxTfbL9HhWBTSEdJsF9Jx45c0xtNKHR4mpDb01i/Ah62lAq99NCNHJFV2AqPAqwWMXb0+xDlLR0uRoNXeVDpth0MExAmDjilQNZpxHoi0HBZkLkmWeD6alKDyigxgpsJ+UqvucS2lUw4Z5qKlQUkypGFX05Ai62BvoX/1WcUNdWaTgYQc7Yto5yLVoDbCHN37EV1ecV29DFEh07UrGnFSzixhwuUidtGc1BZTM/86oWYUChvSVA2sZE26bex49WijfdxJKyMZyTYPNamBBOC/VzV6wzftzsOGRM3hcTernbuUKib47T8pyOBztlp1nTqGIWwu6D4WPKFI7wet0X1jRWCaTtsaPqy2jzjgdy+7xAfPvxzPmxtDwIly9I6aQg8LrFNXux+vEAd0Q5I2mrgOWyB83ci6TQNfbvY1cAb8qiM0o6JetTBg8tvV6FUwRvMuOAlTxv+st/fqqFXXzzYETFTrmr1fIQFXY/oaoUgknPqPPnJd2pmb7D1xCK9LsHBV+2b4X1qUWpBl7ZQDmuejhgYmT/jPoLx47tKryvjAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(366004)(396003)(376002)(8936002)(9576002)(26005)(8676002)(478600001)(6666004)(55016002)(9686003)(1076003)(4326008)(7416002)(2906002)(44832011)(956004)(33656002)(66476007)(66946007)(52116002)(186003)(5660300002)(6496006)(83380400001)(38100700002)(54906003)(66556008)(38350700002)(33716001)(316002)(30864003)(6916009)(86362001)(579004)(569008)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/e60LFVykl4SQ6JgHq1rI7vp0OTh+7rDMbN2tfoNgtXOYdCQBxxNhcBjQBSj?=
 =?us-ascii?Q?mx/tAuvVlCw8tsjl9SlYi1KJdnEL+CBLR4RVnvnyLe7wfzOelRUcnMuxh1d7?=
 =?us-ascii?Q?KLIAmGJq3JGnThhgEzBXBqjYa8jwPdQxL1mSEuczsrojMuT1+ZfSImQwrLTU?=
 =?us-ascii?Q?LQGiDiXHqfs9vmm09t+/WH5FQfD+Uz5aqzTT2KJcW/BI94oVIF9oxG3D3qr6?=
 =?us-ascii?Q?drmTQ3QbV/D+cQkmdhe9fgkUXyTgVxmSnj2BRd2O5POMXB7EMbREgXbcQlw6?=
 =?us-ascii?Q?Xo08+Iwk7M1IA2Lfj8Iignm4Fn1XAa6IkHyXkmSO+zgDVU+xGE40X0xYNsAy?=
 =?us-ascii?Q?8Zz8WIygI5Q4riv99+BPioV4TNcGHOB+kwBMhFjHZXbElj42G6CLOixKedKT?=
 =?us-ascii?Q?A5ZL9UYz1uRr93xq30UoGomg4JK9fG9kqmaFTgajk3sLbNVZRVzBFRK0bNAn?=
 =?us-ascii?Q?ig8e93iDZW7QhB2H3/rpXLlWrplF4HHU32GxlZEoXzwFKfBDRgPFn2Wc5Uih?=
 =?us-ascii?Q?/v/PBQaj2tWBCwVgsrRZmGkt7HRY/oK8beC/EVpqJQS9fOz9r8uTl7+9xMqB?=
 =?us-ascii?Q?1EkGxyDORQ/XydSqn3jV7i7KXTMJQcai7HO5peG2DRJvDJSwa/MaPlhyc3as?=
 =?us-ascii?Q?XkcNveSr7Nc2e2uEgXfjbVk6IxVHIgUV+sfenx29kWMgbFWJEdJbXp3oBJsn?=
 =?us-ascii?Q?/lrFaNXnSXkmcZkjUDCht0EIfQWIuu4nOxw2ow5TtZCfZu9XPdrtYtuKjXdd?=
 =?us-ascii?Q?Cm3sfD6a0GLjVUHSjfSJUZCwtcA558ZeBx6GY7K5MwGy36rDo7XvZBH6iqzA?=
 =?us-ascii?Q?yTlwsCec7Q+Ai1a59bjM9mm2f7CbNDam3L8bHLzAtNcHIucTYYy+FKWLh72a?=
 =?us-ascii?Q?xFI19/T+7qL5qo+yCPyrECPXQLkVgklzGhxjYVXkpbj+zbwb9h5YVwSu6tdK?=
 =?us-ascii?Q?tcYzy3b95X0DOeC0qGyk5OGkiQsC6we1afwdhXvzl4SV2gD7C0kQweuXlUK8?=
 =?us-ascii?Q?eYIA8j0eHvFE0bGjyFQIjdp+A6nCKmBn+A/q4vW6fPgxra6AGOPYc7tkCCOc?=
 =?us-ascii?Q?vtCD0bN4yjyyH/O++CswedKypy7axtvCdshCkz2LN92ZAfUiw2HpFV7ilrXW?=
 =?us-ascii?Q?vA+b236f7736cX0hNGCSGwQtVHgWa5/AQbVjTUjFf14FsBggzqZxA4KEBBoH?=
 =?us-ascii?Q?4xo0B5R97IkIWpaSZZhTCTpxa3la4MRG/p/+XAuNmoFl+uMMHdrsjQf68S7f?=
 =?us-ascii?Q?EmP8OqbN1AZh1yAooswNtD3j7XYYcrknZUNfpUMS8ZZYMjyrBzXFcUUZVKs1?=
 =?us-ascii?Q?SxPb6CPDQwA2daDi8rGywKlV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9dd033a-6f27-4ff8-a623-08d97902b260
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:11:15.3921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nH4Da6RwpkNa1wv/gFL0hLOkklieHBTSOO0IlPUm8GW0T4MXQdhcjBFIOWRf3f2mK9adwXpmu8ObkEDDdZMPUSeUo/rSBbFDT0KckLI7esw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1733
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160072
X-Proofpoint-ORIG-GUID: S_ke6Mtkc6avS6Ml8unsCwURJp3VdylG
X-Proofpoint-GUID: S_ke6Mtkc6avS6Ml8unsCwURJp3VdylG
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This code needs a lot of clean up.  I reviewed random functions in
this patch.  I tried to give some guidelines to get you started.

The way this code is aligned is kind of painful.  There are too
many extra spaces around the assignments.  It looks bad when people
edit at different times and then can't make the alignment work.
Also it looks bad when you're reviewing it in email clients.
Restrict the complicated alignment to .h files where the UAPI is
not going to change regularly.

The types are not consistent either.

I wrote some about error handling bugs.  Missing error handling.  There
were a couple off by one bugs. A wrong sized allocation.  Some dead
code.


On Wed, Sep 15, 2021 at 06:23:19PM +0200, Dafna Hirschfeld wrote:
> Add the the vpuapi layer of the wave5 codec driver.
      ^^^^^^^
Run checkpatch.pl --strict on your patch.

> This layer is used to configure the hardware according
> to the parameters.
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/wave5/vpuapi/vpuapi.c   | 1094 +++++
>  drivers/staging/media/wave5/vpuapi/vpuapi.h   | 1176 ++++++
>  .../staging/media/wave5/vpuapi/vpuconfig.h    |   81 +
>  drivers/staging/media/wave5/vpuapi/vpuerror.h |  455 +++
>  .../staging/media/wave5/vpuapi/wave/wave5.c   | 3626 +++++++++++++++++
>  .../staging/media/wave5/vpuapi/wave/wave5.h   |   86 +
>  .../media/wave5/vpuapi/wave/wave5_regdefine.h |  638 +++
>  7 files changed, 7156 insertions(+)
>  create mode 100644 drivers/staging/media/wave5/vpuapi/vpuapi.c
>  create mode 100644 drivers/staging/media/wave5/vpuapi/vpuapi.h
>  create mode 100644 drivers/staging/media/wave5/vpuapi/vpuconfig.h
>  create mode 100644 drivers/staging/media/wave5/vpuapi/vpuerror.h
>  create mode 100644 drivers/staging/media/wave5/vpuapi/wave/wave5.c
>  create mode 100644 drivers/staging/media/wave5/vpuapi/wave/wave5.h
>  create mode 100644 drivers/staging/media/wave5/vpuapi/wave/wave5_regdefine.h
> 
> diff --git a/drivers/staging/media/wave5/vpuapi/vpuapi.c b/drivers/staging/media/wave5/vpuapi/vpuapi.c
> new file mode 100644
> index 000000000000..96849170d2b3
> --- /dev/null
> +++ b/drivers/staging/media/wave5/vpuapi/vpuapi.c
> @@ -0,0 +1,1094 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Wave5 series multi-standard codec IP - helper functions
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/bug.h>
> +#include "vpuapi.h"
> +#include "wave/wave5_regdefine.h"
> +#include "wave/wave5.h"
> +
> +#define DECODE_ALL_TEMPORAL_LAYERS  -1
> +#define DECODE_ALL_SPATIAL_LAYERS   -1
> +
> +void vpu_clear_interrupt_ex(struct vpu_instance *inst, int32_t intr_flag)
> +{
> +	wave5_vpu_clear_interrupt(inst, intr_flag);
> +}
> +
> +static enum ret_code initialize_vpu(struct device *dev, const uint16_t *code, uint32_t size)
> +{
> +	enum ret_code     ret;
> +	struct vpu_device *vpu_dev = (struct vpu_device *)dev_get_drvdata(dev);
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;

I hate these error codes a lot.  At first I assumed they were something
that came from the hardware but this is not a hardware error code...
I think the hardware error codes are WAVE5_SYSERR_QUEUEING_FAIL etc.
Get rid of these custom error codes and try to keep the WAVE5_ codes
as local and isolated as possible.

> +
> +	if (wave5_vpu_is_init(vpu_dev) != 0) {
> +		wave5_vpu_re_init(dev, (void *)code, size);
> +		ret = RETCODE_CALLED_BEFORE;
> +		goto err_out;

It's always best to avoid "err_out" labels.  Those are two words error
and out but they don't tell the reader anything useful about what the
goto does.  "goto unlock;"

err_out labels lead to bugs as we will see below.

Actually this code has a lot of error handling issues.  There is a
simple way to do clean up which is that you just free the last thing
which was allocated.

	a = alloc();
	if (!a)
		return -ENOMEM;
	b = alloc();
	if (!b)
		goto free_a;
	c = alloc();
	if (!c)
		goto free_b;

	return 0;

free_b:
	free(b);
free_c:
	free(a);
	return -ENOMEM;

Use good label names.  Every function must clean up after itself.  Every
alloc function needs to have a mirror clean up function.  Copy and
paste the error handling, delete the labels and add a free(c);

void free()
{
	free(c);
	free(b);
	free(a);
}


> +	}
> +
> +	ret = wave5_vpu_reset(dev, SW_RESET_ON_BOOT);
> +	if (ret != RETCODE_SUCCESS)
> +		goto err_out;
> +
> +	ret = wave5_vpu_init(dev, (void *)code, size);
> +
> +err_out:
> +	mutex_unlock(&vpu_dev->hw_lock);
> +	return ret;
> +}
> +
> +enum ret_code vpu_init_with_bitcode(struct device *dev, const uint16_t *code, uint32_t size)
> +{
> +	if (!code || size == 0)
> +		return RETCODE_INVALID_PARAM;
> +
> +	return initialize_vpu(dev, code, size);
> +}
> +
> +enum ret_code vpu_get_version_info(struct device *dev, uint32_t *version_info,
> +				   u32 *revision, uint32_t *product_id)
> +{
> +	enum ret_code  ret;
> +	struct vpu_device *vpu_dev = (struct vpu_device *)dev_get_drvdata(dev);

These declarations started out as aligned probably but now they're not.
Don't try to align the declarations.  It just ends up a mess.

> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	if (wave5_vpu_is_init(vpu_dev) == 0) {
> +		ret = RETCODE_NOT_INITIALIZED;
> +		goto err_out;
> +	}
> +
> +	if (product_id)
> +		*product_id = vpu_dev->product;
> +	ret = wave5_vpu_get_version(vpu_dev, version_info, revision);
> +
> +err_out:
> +	mutex_unlock(&vpu_dev->hw_lock);
> +	return ret;
> +}
> +
> +static int check_dec_open_param(struct vpu_device *dev, struct dec_open_param *param)
> +{
> +	struct vpu_attr *p_attr;
> +
> +	if (param == 0)
> +		return -EINVAL;
> +
> +	p_attr     = &dev->attr;

Delete extra spaces.

> +
> +	if (param->bitstream_buffer % 8)
> +		return -EINVAL;
> +
> +	if (param->bitstream_mode == BS_MODE_INTERRUPT) {
> +		if (param->bitstream_buffer_size % 1024 || param->bitstream_buffer_size < 1024)

	if (param->bitstream_mode == BS_MODE_INTERRUPT &&
	    (param->bitstream_buffer_size == 0 ||
	     param->bitstream_buffer_size % 1024)
		return -EINVAL;

> +			return -EINVAL;
> +	}
> +
> +	// check bitstream mode
> +	if ((p_attr->support_bitstream_mode & (1 << param->bitstream_mode)) == 0)

Only use "== 0" when you are talking about a number as number of elements
or the size or length of something.  The other time when you would use
== 0 is with strcmp() functions, because that's idiomatic.

	if (strcmp(a, b) == 0)  <-- this means a == b
	if (strcmp(a, b) < 0)   <-- this means a < b

In this case we're talking about set/not-set so it would be:

	if (!(p_attr->support_bitstream_mode & (1 << param->bitstream_mode)))


> +		return -EINVAL;
> +
> +	/* check framebuffer endian */

Delete this comment.  Actually probably the reason for the comment is
that the variable is on the right instead of the left so it's a bit
confusing.  Flip that around.  The variable you're checking always
comes first.

	if (!(BIT(param->bitstream_mode) & p_attr->support_bitstream_mode) ||
	    !(BIT(param->frame_endian)   & p_attr->support_endian_mask)
	    !(BIT(param->stream_endian)  & p_attr->support_endian_mask))
		return -EINVAL;


> +	if ((p_attr->support_endian_mask & (1 << param->frame_endian)) == 0)
> +		return -EINVAL;
> +
> +	/* check streambuffer endian */
> +	if ((p_attr->support_endian_mask & (1 << param->stream_endian)) == 0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +int vpu_dec_open_api(struct vpu_instance *vpu_inst, struct dec_open_param *pop)
> +{
> +	struct dec_info *p_dec_info;
> +	int     ret;
> +	struct vpu_device *vpu_dev = vpu_inst->dev;
> +
> +	ret = check_dec_open_param(vpu_dev, pop);
> +	if (ret != 0)

	if (ret)
		return ret;

> +		return ret;
> +
> +	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	if (wave5_vpu_is_init(vpu_dev) == 0) {

	if (!wave5_vpu_is_init(vpu_dev)) {


> +		ret = -ENODEV;
> +		goto err_out;

This err_out label is a do everything label.  That will cause bugs.
Instead of doing everything a goto should just undo the last allocation
which succeeded.  That way you never free something which has not
been allocated.  In this case we are trying to free "vpu_inst->id" and
that isn't allocated until a few lines later so it will trigger a WARN().

		goto unlock;


> +	}
> +
> +	vpu_inst->codec_info = kzalloc(sizeof(*vpu_inst->codec_info), GFP_KERNEL);
> +	if (!vpu_inst->codec_info) {
> +		ret = -ENOMEM;
> +		goto err_out;

This should also be "goto unlock;" because no allocations have succeeded.

> +	}
> +
> +	vpu_inst->id = ida_alloc_max(&vpu_inst->dev->inst_ida, MAX_NUM_INSTANCE - 1, GFP_KERNEL);
> +	if (vpu_inst->id < 0) {
> +		dev_warn(vpu_inst->dev->dev, "unable to allocate instance ID: %d\n", vpu_inst->id);
> +		ret = vpu_inst->id;
> +		goto err_out;

goto free_codec_info;

> +	}
> +	p_dec_info = &vpu_inst->codec_info->dec_info;
> +	memcpy((void *)&p_dec_info->open_param, pop, sizeof(struct dec_open_param));
> +
> +	if (vpu_inst->std == STD_UNKNOWN) {
> +		ret = -EINVAL;
> +		goto err_out;

goto free_ida;

> +	}
> +
> +	p_dec_info->stream_wr_ptr        = pop->bitstream_buffer;
> +	p_dec_info->stream_rd_ptr        = pop->bitstream_buffer;
> +	p_dec_info->stream_buf_start_addr = pop->bitstream_buffer;
> +	p_dec_info->stream_buf_size      = pop->bitstream_buffer_size;
> +	p_dec_info->stream_buf_end_addr   = pop->bitstream_buffer + pop->bitstream_buffer_size;
> +	p_dec_info->reorder_enable      = TRUE;
> +	p_dec_info->mirror_direction    = MIRDIR_NONE;
> +	p_dec_info->temp_id_select_mode   = TEMPORAL_ID_MODE_ABSOLUTE;
> +	p_dec_info->target_temp_id       = DECODE_ALL_TEMPORAL_LAYERS;
> +	p_dec_info->target_spatial_id    = DECODE_ALL_SPATIAL_LAYERS;
> +
> +	ret = wave5_vpu_build_up_dec_param(vpu_inst, pop);
> +	if (ret != RETCODE_SUCCESS)

This function is using a mix of kernel error codes and custom error
codes.

> +		goto err_out;

goto free_ida;

> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return 0;
> +
> +err_out:
> +	if (vpu_inst->id >= 0)
> +		ida_free(&vpu_inst->dev->inst_ida, vpu_inst->id);
> +	kfree(vpu_inst->codec_info);
> +	mutex_unlock(&vpu_dev->hw_lock);

free_ida:
	ida_free(&vpu_inst->dev->inst_ida, vpu_inst->id);
free_codec_info:
	kfree(vpu_inst->codec_info);
unlock:
	mutex_unlock(&vpu_dev->hw_lock);


> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_dec_close(struct vpu_instance *inst)
> +{
> +	struct dec_info *p_dec_info;
> +	enum ret_code ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +	int i;
> +
> +	if (!inst->codec_info)
> +		return RETCODE_INVALID_HANDLE;
> +	p_dec_info   = &inst->codec_info->dec_info;

Remove extra spaces.

> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	ret = wave5_vpu_dec_fini_seq(inst);
> +	if (ret != RETCODE_SUCCESS) {
> +		dev_warn(inst->dev->dev, "dec sec end timed out\n");
> +
> +		if (ret == RETCODE_VPU_STILL_RUNNING) {
> +			mutex_unlock(&vpu_dev->hw_lock);
> +			return ret;
> +		}
> +	}
> +
> +	dev_dbg(inst->dev->dev, "dec seq end complete\n");
> +
> +	if (p_dec_info->vb_work.size)
> +		vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);
> +
> +	for (i = 0 ; i < MAX_REG_FRAME; i++) {
> +		if (p_dec_info->vb_mv[i].size)
> +			vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_mv[i]);
> +		if (p_dec_info->vb_fbc_y_tbl[i].size)
> +			vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_fbc_y_tbl[i]);
> +		if (p_dec_info->vb_fbc_c_tbl[i].size)
> +			vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_fbc_c_tbl[i]);
> +	}
> +
> +	if (p_dec_info->vb_task.size)
> +		vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
> +
> +	if (inst->id >= 0)

No need for this check.

> +		ida_free(&inst->dev->inst_ida, inst->id);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	kfree(inst->codec_info);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_dec_issue_seq_init(struct vpu_instance *inst)
> +{
> +	enum ret_code     ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	ret = wave5_vpu_dec_init_seq(inst);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_dec_complete_seq_init(struct vpu_instance *inst, struct dec_initial_info *info)
> +{
> +	struct dec_info *p_dec_info;
> +	enum ret_code     ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	if (info == 0)
> +		return RETCODE_INVALID_PARAM;
> +
> +	p_dec_info = &inst->codec_info->dec_info;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	ret = wave5_vpu_dec_get_seq_info(inst, info);
> +	if (ret == RETCODE_SUCCESS)
> +		p_dec_info->initial_info_obtained = 1;
> +
> +	info->rd_ptr = wave5_vpu_dec_get_rd_ptr(inst);
> +	info->wr_ptr = p_dec_info->stream_wr_ptr;
> +
> +	p_dec_info->initial_info = *info;
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_dec_register_frame_buffer_ex(struct vpu_instance *inst,
> +					       int num_fbs_for_decoding, int num_fbs_for_wtl,
> +					       int stride, int height, int map_type)
> +{
> +	struct dec_info *p_dec_info;
> +	enum ret_code         ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +	struct frame_buffer *fb;
> +
> +	if (num_fbs_for_decoding > MAX_GDI_IDX)
> +		return RETCODE_INVALID_PARAM;
> +
> +	if (num_fbs_for_wtl > MAX_GDI_IDX)
> +		return RETCODE_INVALID_PARAM;

These checks are off by one.  They should should >=.

The variable names are too many words.

> +
> +	p_dec_info                    = &inst->codec_info->dec_info;
> +	p_dec_info->num_fbs_for_decoding = num_fbs_for_decoding;
> +	p_dec_info->num_fbs_for_wtl      = num_fbs_for_wtl;
> +	p_dec_info->stride            = stride;
> +
> +	if (!p_dec_info->initial_info_obtained)
> +		return RETCODE_WRONG_CALL_SEQUENCE;
> +
> +	if (stride < p_dec_info->initial_info.pic_width || (stride % 8 != 0) ||
> +	    height < p_dec_info->initial_info.pic_height)

These checks should be done before we say "p_dec_info->stride = stride".


> +		return RETCODE_INVALID_STRIDE;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	fb = inst->frame_buf;

Get rid of the "fb" variable.  Delete the other "fb = inst->frame_buf;"
too.

> +	ret = wave5_vpu_dec_register_framebuffer(inst, &fb[p_dec_info->num_fbs_for_decoding],
> +						 LINEAR_FRAME_MAP, p_dec_info->num_fbs_for_wtl);
> +	if (ret != RETCODE_SUCCESS)
> +		goto err_out;
> +
> +	ret = wave5_vpu_dec_register_framebuffer(inst, &fb[0],
> +						 COMPRESSED_FRAME_MAP, p_dec_info->num_fbs_for_decoding);

If these functions fail then they need clean up after themselves.

> +
> +err_out:
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_dec_get_bitstream_buffer(struct vpu_instance *inst, dma_addr_t *prd_ptr,
> +					   dma_addr_t *pwr_ptr, uint32_t *size)
> +{
> +	struct dec_info *p_dec_info;
> +	dma_addr_t rd_ptr;
> +	dma_addr_t wr_ptr;
> +	dma_addr_t temp_ptr;
> +	int             room;
> +	struct vpu_attr *p_attr;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	p_attr = &vpu_dev->attr;
> +	p_dec_info = &inst->codec_info->dec_info;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +	rd_ptr = wave5_vpu_dec_get_rd_ptr(inst);
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	wr_ptr = p_dec_info->stream_wr_ptr;
> +
> +	temp_ptr = rd_ptr;
> +
> +	if (p_dec_info->open_param.bitstream_mode != BS_MODE_PIC_END) {
> +		if (wr_ptr < temp_ptr)
> +			room = temp_ptr - wr_ptr;
> +		else
> +			room = (p_dec_info->stream_buf_end_addr - wr_ptr) +
> +				(temp_ptr - p_dec_info->stream_buf_start_addr);
> +		room--;
> +	} else {
> +		room = (p_dec_info->stream_buf_end_addr - wr_ptr);
> +	}
> +
> +	if (prd_ptr)
> +		*prd_ptr = temp_ptr;
> +	if (pwr_ptr)
> +		*pwr_ptr = wr_ptr;
> +	if (size)
> +		*size   = room;
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int size)
> +{
> +	struct dec_info *p_dec_info;
> +	dma_addr_t wr_ptr;
> +	dma_addr_t rd_ptr;
> +	enum ret_code         ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	if (!inst->codec_info)
> +		return RETCODE_INVALID_HANDLE;
> +
> +	p_dec_info   = &inst->codec_info->dec_info;
> +	wr_ptr      = p_dec_info->stream_wr_ptr;
> +	rd_ptr = p_dec_info->stream_rd_ptr;
> +
> +	if (size > 0) {
> +		if (wr_ptr < rd_ptr && rd_ptr <= wr_ptr + size)
> +			return RETCODE_INVALID_PARAM;
> +
> +		wr_ptr += size;
> +
> +		if (p_dec_info->open_param.bitstream_mode != BS_MODE_PIC_END) {
> +			if (wr_ptr > p_dec_info->stream_buf_end_addr) {
> +				u32 room = wr_ptr - p_dec_info->stream_buf_end_addr;
> +
> +				wr_ptr = p_dec_info->stream_buf_start_addr;
> +				wr_ptr += room;
> +			} else if (wr_ptr == p_dec_info->stream_buf_end_addr) {
> +				wr_ptr = p_dec_info->stream_buf_start_addr;
> +			}
> +		}
> +
> +		p_dec_info->stream_wr_ptr = wr_ptr;
> +		p_dec_info->stream_rd_ptr = rd_ptr;
> +	}
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +	ret = wave5_vpu_dec_set_bitstream_flag(inst, (size == 0));
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_dec_start_one_frame(struct vpu_instance *inst, struct dec_param *param)
> +{
> +	struct dec_info *p_dec_info;
> +	enum ret_code     ret     = RETCODE_SUCCESS;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	p_dec_info   = &inst->codec_info->dec_info;
> +
> +	if (p_dec_info->stride == 0) // this means frame buffers have not been registered.
> +		return RETCODE_WRONG_CALL_SEQUENCE;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	p_dec_info->frame_start_pos = p_dec_info->stream_rd_ptr;
> +
> +	ret = wave5_vpu_decode(inst, param);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_info *info)
> +{
> +	struct dec_info *p_dec_info;
> +	enum ret_code     ret;
> +	struct vpu_rect     rect_info;
> +	u32      val;
> +	s32       decoded_index;
> +	s32       disp_idx;
> +	u32      max_dec_index;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	if (info == 0)

info is a pointer.  Please run Sparse on your code.

	if (!info) {


> +		return RETCODE_INVALID_PARAM;
> +
> +	p_dec_info    = &inst->codec_info->dec_info;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	memset((void *)info, 0x00, sizeof(struct dec_output_info));

Remove the cast and the hex.  Use the variable name instead of the
struct type.

	memset(info, 0, sizeof(*info));

> +
> +	ret = wave5_vpu_dec_get_result(inst, info);
> +	if (ret != RETCODE_SUCCESS) {
> +		info->rd_ptr = p_dec_info->stream_rd_ptr;
> +		info->wr_ptr = p_dec_info->stream_wr_ptr;
> +		goto err_out;

This goto always returns RETCODE_SUCCESS.

> +	}
> +
> +	decoded_index = info->index_frame_decoded;
> +
> +	// calculate display frame region
> +	val = 0;

This assignment is never used.


> +	if (decoded_index >= 0 && decoded_index < MAX_GDI_IDX) {

Flip this condition around.  Always do error handling instead of
success handling.  Error handling is normally shorter so it just
makes the code easier to read.  You could move the default assignment
forward.

	/* default value */
	rect_info.left   = 0;
	rect_info.right  = info->dec_pic_width;
	rect_info.top    = 0;
	rect_info.bottom = info->dec_pic_height;

	if (decoded_index < 0 || decoded_index >= MAX_GDI_IDX) {
		info->rc_decoded = rect_info;
	} else {



> +		//default value
> +		rect_info.left   = 0;
> +		rect_info.right  = info->dec_pic_width;
> +		rect_info.top    = 0;
> +		rect_info.bottom = info->dec_pic_height;
> +
> +		if (inst->std == W_HEVC_DEC || inst->std == W_AVC_DEC)
> +			rect_info = p_dec_info->initial_info.pic_crop_rect;
> +
> +		if (inst->std == W_HEVC_DEC)
> +			p_dec_info->dec_out_info[decoded_index].decoded_poc = info->decoded_poc;
> +
> +		if (inst->std == W_AVS2_DEC)
> +			p_dec_info->dec_out_info[decoded_index].avs2_info.decoded_poi =
> +				info->avs2_info.decoded_poi;
> +
> +		info->rc_decoded.left   = rect_info.left;
> +		p_dec_info->dec_out_info[decoded_index].rc_decoded.left   = rect_info.left;
> +		info->rc_decoded.right  = rect_info.right;
> +		p_dec_info->dec_out_info[decoded_index].rc_decoded.right  = rect_info.right;
> +		info->rc_decoded.top    = rect_info.top;
> +		p_dec_info->dec_out_info[decoded_index].rc_decoded.top    = rect_info.top;
> +		info->rc_decoded.bottom = rect_info.bottom;
> +		p_dec_info->dec_out_info[decoded_index].rc_decoded.bottom = rect_info.bottom;
> +	} else {
> +		info->rc_decoded.left   = 0;
> +		info->rc_decoded.right  = info->dec_pic_width;
> +		info->rc_decoded.top    = 0;
> +		info->rc_decoded.bottom = info->dec_pic_height;
> +	}
> +
> +	disp_idx = info->index_frame_display;
> +	if (info->index_frame_display >= 0 && info->index_frame_display < MAX_GDI_IDX) {
> +		if (p_dec_info->rotation_enable) {
> +			switch (p_dec_info->rotation_angle) {
> +			case 90:
> +				info->rc_display.left =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.top;
> +				info->rc_display.right  =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.bottom;
> +				info->rc_display.top    =
> +					p_dec_info->dec_out_info[disp_idx].dec_pic_width -
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.right;
> +					info->rc_display.bottom =
> +						p_dec_info->dec_out_info[disp_idx].dec_pic_width -
> +						p_dec_info->dec_out_info[disp_idx].rc_decoded.left;
> +				break;
> +			case 270:
> +				info->rc_display.left =
> +					p_dec_info->dec_out_info[disp_idx].dec_pic_height -
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.bottom;
> +				info->rc_display.right =
> +					p_dec_info->dec_out_info[disp_idx].dec_pic_height -
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.top;
> +				info->rc_display.top =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.left;
> +				info->rc_display.bottom =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.right;
> +				break;
> +			case 180:
> +				info->rc_display.left   =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.left;
> +				info->rc_display.right  =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.right;
> +				info->rc_display.top    =
> +					p_dec_info->dec_out_info[disp_idx].dec_pic_height -
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.bottom;
> +				info->rc_display.bottom =
> +					p_dec_info->dec_out_info[disp_idx].dec_pic_height -
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.top;
> +				break;
> +			default:
> +				info->rc_display.left   =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.left;
> +				info->rc_display.right  =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.right;
> +				info->rc_display.top    =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.top;
> +				info->rc_display.bottom =
> +					p_dec_info->dec_out_info[disp_idx].rc_decoded.bottom;
> +				break;
> +			}
> +
> +		} else {
> +			info->rc_display.left   = p_dec_info->dec_out_info[disp_idx].rc_decoded.left;
> +			info->rc_display.right  = p_dec_info->dec_out_info[disp_idx].rc_decoded.right;
> +			info->rc_display.top    = p_dec_info->dec_out_info[disp_idx].rc_decoded.top;
> +			info->rc_display.bottom = p_dec_info->dec_out_info[disp_idx].rc_decoded.bottom;
> +		}
> +
> +		if (p_dec_info->mirror_enable) {
> +			u32 temp;
> +			u32 width  = (p_dec_info->rotation_angle == 90 ||
> +					p_dec_info->rotation_angle == 270) ? info->dec_pic_height :
> +				info->dec_pic_width;
> +			u32 height = (p_dec_info->rotation_angle == 90 ||
> +					p_dec_info->rotation_angle == 270) ? info->dec_pic_width :
> +				info->dec_pic_height;
> +
> +			if (p_dec_info->mirror_direction & MIRDIR_VER) {
> +				temp = info->rc_display.top;
> +				info->rc_display.top    = height - info->rc_display.bottom;
> +				info->rc_display.bottom = height - temp;
> +			}
> +			if (p_dec_info->mirror_direction & MIRDIR_HOR) {
> +				temp = info->rc_display.left;
> +				info->rc_display.left  = width - info->rc_display.right;
> +				info->rc_display.right = width - temp;
> +			}
> +		}
> +
> +		switch (inst->std) {
> +		case W_HEVC_DEC:
> +			info->display_poc = p_dec_info->dec_out_info[disp_idx].decoded_poc;
> +			break;
> +		case W_AVS2_DEC:
> +			info->avs2_info.display_poi = p_dec_info->dec_out_info[disp_idx].avs2_info.decoded_poi;
> +			break;
> +		case W_AVC_DEC:
> +			info->display_poc = p_dec_info->dec_out_info[disp_idx].decoded_poc;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		if (info->index_frame_display == info->index_frame_decoded) {
> +			info->disp_pic_width =  info->dec_pic_width;
> +			info->disp_pic_height = info->dec_pic_height;
> +		} else {
> +			/*
> +			 * when index_frame_decoded < 0, and index_frame_display >= 0
> +			 * info->dec_pic_width and info->dec_pic_height are still valid
> +			 * but those of p_dec_info->dec_out_info[disp_idx] are invalid in VP9
> +			 */
> +			info->disp_pic_width  = p_dec_info->dec_out_info[disp_idx].dec_pic_width;
> +			info->disp_pic_height = p_dec_info->dec_out_info[disp_idx].dec_pic_height;
> +		}
> +
> +	} else {
> +		info->rc_display.left   = 0;
> +		info->rc_display.right  = 0;
> +		info->rc_display.top    = 0;
> +		info->rc_display.bottom = 0;
> +
> +		if (p_dec_info->rotation_enable || p_dec_info->mirror_enable ||
> +		    p_dec_info->dering_enable) {
> +			info->disp_pic_width  = info->dec_pic_width;
> +			info->disp_pic_height = info->dec_pic_height;
> +		} else {
> +			info->disp_pic_width = 0;
> +			info->disp_pic_height = 0;
> +		}
> +	}
> +
> +	p_dec_info->stream_rd_ptr      = wave5_vpu_dec_get_rd_ptr(inst);
> +	p_dec_info->frame_display_flag = vpu_read_reg(vpu_dev, W5_RET_DEC_DISP_IDC);
> +	if (inst->std == W_VP9_DEC)
> +		p_dec_info->frame_display_flag  &= 0xFFFF;
> +	p_dec_info->frame_end_pos      = p_dec_info->stream_rd_ptr;
> +
> +	if (p_dec_info->frame_end_pos < p_dec_info->frame_start_pos)
> +		info->consumed_byte = p_dec_info->frame_end_pos + p_dec_info->stream_buf_size -
> +			p_dec_info->frame_start_pos;
> +	else
> +		info->consumed_byte = p_dec_info->frame_end_pos - p_dec_info->frame_start_pos;
> +
> +	if (p_dec_info->dering_enable || p_dec_info->mirror_enable || p_dec_info->rotation_enable) {
> +		info->disp_frame        = p_dec_info->rotator_output;
> +		info->disp_frame.stride = p_dec_info->rotator_stride;
> +	} else {
> +		val = p_dec_info->num_fbs_for_decoding; //fb_offset
> +
> +		max_dec_index = (p_dec_info->num_fbs_for_decoding > p_dec_info->num_fbs_for_wtl) ?
> +			p_dec_info->num_fbs_for_decoding : p_dec_info->num_fbs_for_wtl;
> +
> +		if (info->index_frame_display >= 0 && info->index_frame_display < (int)max_dec_index)
> +			info->disp_frame = inst->frame_buf[val + info->index_frame_display];
> +	}
> +
> +	info->rd_ptr            = p_dec_info->stream_rd_ptr;
> +	info->wr_ptr            = p_dec_info->stream_wr_ptr;
> +	info->frame_display_flag = p_dec_info->frame_display_flag;
> +
> +	info->sequence_no = p_dec_info->initial_info.sequence_no;
> +	if (decoded_index >= 0 && decoded_index < MAX_GDI_IDX)
> +		p_dec_info->dec_out_info[decoded_index] = *info;
> +
> +	if (disp_idx >= 0 && disp_idx < MAX_GDI_IDX) {
> +		info->num_of_tot_m_bs_in_display = p_dec_info->dec_out_info[disp_idx].num_of_tot_m_bs;
> +		info->num_of_err_m_bs_in_display = p_dec_info->dec_out_info[disp_idx].num_of_err_m_bs;
> +		info->disp_frame.sequence_no = info->sequence_no;
> +	} else {
> +		info->num_of_tot_m_bs_in_display = 0;
> +		info->num_of_err_m_bs_in_display = 0;
> +	}
> +
> +	if (info->sequence_changed != 0) {
> +		if ((info->sequence_changed & SEQ_CHANGE_INTER_RES_CHANGE) != SEQ_CHANGE_INTER_RES_CHANGE)
> +			p_dec_info->initial_info.sequence_no++;
> +	}
> +
> +err_out:
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code vpu_dec_clr_disp_flag(struct vpu_instance *inst, int index)
> +{
> +	struct dec_info *p_dec_info;
> +	enum ret_code     ret         = RETCODE_SUCCESS;
> +	s32       end_index;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	p_dec_info   = &inst->codec_info->dec_info;
> +
> +	end_index = p_dec_info->num_fbs_for_wtl;
> +
> +	if (index < 0 || index > end_index - 1)
> +		return RETCODE_INVALID_PARAM;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +	ret = wave5_dec_clr_disp_flag(inst, index);
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_dec_give_command(struct vpu_instance *inst, enum codec_command cmd, void *param)
> +{
> +	struct dec_info *p_dec_info;
> +
> +	p_dec_info = &inst->codec_info->dec_info;
> +	switch (cmd) {
> +	case DEC_GET_QUEUE_STATUS:
> +		{
> +			struct queue_status_info *queue_info = (struct queue_status_info *)param;
> +
> +			queue_info->instance_queue_count = p_dec_info->instance_queue_count;
> +			queue_info->report_queue_count    = p_dec_info->report_queue_count;
> +			break;
> +		}
> +
> +	case ENABLE_DEC_THUMBNAIL_MODE:
> +		{
> +			p_dec_info->thumbnail_mode = 1;
> +			break;
> +		}
> +	default:
> +		return RETCODE_INVALID_COMMAND;
> +	}
> +
> +	return 0;
> +}
> +
> +int vpu_enc_open_api(struct vpu_instance *vpu_inst, struct enc_open_param *pop)
> +{
> +	struct enc_info *p_enc_info;
> +	int     ret;
> +	struct vpu_device *vpu_dev = vpu_inst->dev;
> +
> +	ret = wave5_vpu_enc_check_open_param(vpu_inst, pop);
> +	if (ret != RETCODE_SUCCESS)
> +		return ret;

This function returns int not ret codes.

> +
> +	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	if (wave5_vpu_is_init(vpu_dev) == 0) {
> +		ret = -ENODEV;
> +		goto err_out;

Freeing ida when it hasn't been allocated will trigger a WARN().

> +	}
> +
> +	vpu_inst->codec_info = kzalloc(sizeof(vpu_inst->codec_info), GFP_KERNEL);

The sizeof() is wrong.  It should be sizeof(*vpu_inst->codec_info).

> +	if (!vpu_inst->codec_info) {
> +		ret = -ENOMEM;
> +		goto err_out;
> +	}
> +
> +	vpu_inst->id = ida_alloc_max(&vpu_inst->dev->inst_ida, MAX_NUM_INSTANCE - 1, GFP_KERNEL);
> +	if (vpu_inst->id < 0) {
> +		dev_warn(vpu_inst->dev->dev, "unable to allocate instance ID: %d\n", vpu_inst->id);
> +		ret = vpu_inst->id;
> +		goto err_out;
> +	}
> +	p_enc_info = &vpu_inst->codec_info->enc_info;
> +	p_enc_info->open_param = *pop;
> +
> +	ret = wave5_vpu_build_up_enc_param(vpu_dev->dev, vpu_inst, pop);
> +	if (ret != RETCODE_SUCCESS)
> +		goto err_out;
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +err_out:
> +	if (vpu_inst->id >= 0)
> +		ida_free(&vpu_inst->dev->inst_ida, vpu_inst->id);
> +	kfree(vpu_inst->codec_info);
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_enc_close(struct vpu_instance *inst)
> +{
> +	struct enc_info *p_enc_info;
> +	enum ret_code     ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	if (!inst->codec_info)
> +		return RETCODE_INVALID_HANDLE;
> +	p_enc_info = &inst->codec_info->enc_info;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	ret = wave5_vpu_enc_fini_seq(inst);
> +	if (ret != RETCODE_SUCCESS) {
> +		dev_warn(inst->dev->dev, "enc seq end timed out\n");
> +
> +		if (ret == RETCODE_VPU_STILL_RUNNING) {
> +			mutex_unlock(&vpu_dev->hw_lock);
> +			return ret;
> +		}
> +	}
> +
> +	dev_dbg(inst->dev->dev, "enc seq end timed out\n");
> +
> +	if (p_enc_info->vb_work.size)
> +		vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_work);
> +
> +	if (inst->std == W_HEVC_ENC || inst->std == W_AVC_ENC) {
> +		if (p_enc_info->vb_sub_sam_buf.size)
> +			vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_sub_sam_buf);
> +
> +		if (p_enc_info->vb_mv.size)
> +			vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_mv);
> +
> +		if (p_enc_info->vb_fbc_y_tbl.size)
> +			vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_fbc_y_tbl);
> +
> +		if (p_enc_info->vb_fbc_c_tbl.size)
> +			vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_fbc_c_tbl);
> +	}
> +
> +	if (p_enc_info->vb_task.size)
> +		vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
> +
> +	if (inst->id >= 0)

Delete this check.

> +		ida_free(&inst->dev->inst_ida, inst->id);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	kfree(inst->codec_info);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_enc_register_frame_buffer(struct vpu_instance *inst, int num, int stride,
> +					    int height, enum tiled_map_type map_type)
> +{
> +	struct enc_info *p_enc_info;
> +	enum ret_code         ret;
> +	struct enc_open_param *open_param;
> +	struct frame_buffer *fb;
> +	struct vpu_device *vpu_dev = inst->dev;
> +	u32 size_luma, size_chroma;
> +	int i;
> +
> +	p_enc_info = &inst->codec_info->enc_info;
> +	open_param = &p_enc_info->open_param;
> +
> +	if (p_enc_info->stride)
> +		return RETCODE_CALLED_BEFORE;
> +
> +	if (!p_enc_info->initial_info_obtained)
> +		return RETCODE_WRONG_CALL_SEQUENCE;
> +
> +	if (num < p_enc_info->initial_info.min_frame_buffer_count)
> +		return RETCODE_INSUFFICIENT_FRAME_BUFFERS;
> +
> +	if (stride == 0 || (stride % 8 != 0) || stride < 0)

	if (stride <= 0 || stride % 8)

> +		return RETCODE_INVALID_STRIDE;
> +
> +	if (height == 0 || height < 0)
> +		return RETCODE_INVALID_PARAM;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	p_enc_info->num_frame_buffers   = num;
> +	p_enc_info->stride            = stride;
> +
> +	fb = inst->frame_buf;
> +	size_luma   = stride * height;
> +	size_chroma = ALIGN(stride / 2, 16) * height;
> +
> +	for (i = 0; i < num; i++) {
> +		if (fb[i].update_fb_info) {
> +			fb[i].update_fb_info = FALSE;
> +			fb[i].stride         = stride;
> +			fb[i].height         = height;
> +			fb[i].map_type        = COMPRESSED_FRAME_MAP;
> +			fb[i].cbcr_interleave = true;
> +			fb[i].endian         = VDI_128BIT_LITTLE_ENDIAN;
> +			fb[i].buf_y_size       = size_luma;
> +			fb[i].buf_cb          = fb[i].buf_y + size_luma;
> +			fb[i].buf_cb_size      = size_chroma;
> +			fb[i].buf_cr_size      = 0;
> +		}
> +	}
> +
> +	ret = wave5_vpu_enc_register_framebuffer(inst->dev->dev, inst, &fb[0],
> +						 COMPRESSED_FRAME_MAP, p_enc_info->num_frame_buffers);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +static enum ret_code check_enc_param(struct vpu_instance *inst, struct enc_param *param)
> +{
> +	struct enc_info *p_enc_info;
> +
> +	p_enc_info = &inst->codec_info->enc_info;
> +
> +	if (param == 0)
> +		return RETCODE_INVALID_PARAM;
> +
> +	if (param->skip_picture != 0 && param->skip_picture != 1)
> +		return RETCODE_INVALID_PARAM;
> +	if (param->skip_picture == 0) {
> +		if (param->source_frame == 0)
> +			return RETCODE_INVALID_FRAME_BUFFER;
> +	}
> +	if (p_enc_info->open_param.bit_rate == 0) { // no rate control
> +		if (inst->std == W_HEVC_ENC) {
> +			if (param->force_pic_qp_enable == 1) {
> +				if (param->force_pic_qp_i < 0 || param->force_pic_qp_i > 63)
> +					return RETCODE_INVALID_PARAM;
> +
> +				if (param->force_pic_qp_p < 0 || param->force_pic_qp_p > 63)
> +					return RETCODE_INVALID_PARAM;
> +
> +				if (param->force_pic_qp_b < 0 || param->force_pic_qp_b > 63)
> +					return RETCODE_INVALID_PARAM;
> +			}
> +			if (p_enc_info->ring_buffer_enable == 0) {
> +				if (param->pic_stream_buffer_addr % 16 || param->pic_stream_buffer_size == 0)
> +					return RETCODE_INVALID_PARAM;
> +			}
> +		}
> +	}
> +	if (p_enc_info->ring_buffer_enable == 0) {
> +		if (param->pic_stream_buffer_addr % 8 || param->pic_stream_buffer_size == 0)
> +			return RETCODE_INVALID_PARAM;
> +	}
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +static uint64_t get_timestamp(struct vpu_instance *vpu_inst)
> +{
> +	struct enc_info *p_enc_info   = NULL;
> +	u64      pts;
> +	u32      fps;
> +
> +	if (!vpu_inst->codec_info)
> +		return 0;
> +
> +	p_enc_info   = &vpu_inst->codec_info->enc_info;
> +	fps        = p_enc_info->open_param.frame_rate_info;
> +	if (fps == 0)
> +		fps    = 30;        /* 30 fps */

Delete the obvious comment.

> +
> +	pts        = p_enc_info->cur_pts;
> +	p_enc_info->cur_pts += 90000 / fps; /* 90_k_hz/fps */
> +
> +	return pts;
> +}
> +
> +enum ret_code vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_param *param)
> +{
> +	struct enc_info *p_enc_info;
> +	enum ret_code             ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	p_enc_info   = &inst->codec_info->enc_info;
> +
> +	if (p_enc_info->stride == 0) // this means frame buffers have not been registered.
> +		return RETCODE_WRONG_CALL_SEQUENCE;
> +
> +	ret = check_enc_param(inst, param);
> +	if (ret != RETCODE_SUCCESS)
> +		return ret;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	p_enc_info->pts_map[param->src_idx] = p_enc_info->open_param.enable_pts ? get_timestamp(inst) : param->pts;
> +
> +	ret = wave5_vpu_encode(inst, param);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_output_info *info)
> +{
> +	struct enc_info *p_enc_info;
> +	enum ret_code     ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	if (info == 0)
> +		return RETCODE_INVALID_PARAM;
> +
> +	p_enc_info   = &inst->codec_info->enc_info;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	ret = wave5_vpu_enc_get_result(inst, info);
> +
> +	if (ret == RETCODE_SUCCESS) {

Do error handling not success handling.

	if (ret != RETCODE_SUCCESS)
		goto unlock;


> +		if (info->enc_src_idx >= 0 && info->recon_frame_index >= 0)
> +			info->pts = p_enc_info->pts_map[info->enc_src_idx];

Why do we even allow negative indexes?  Make these unsigned.

> +	} else {
> +		info->pts = 0LL;
> +	}
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_enc_give_command(struct vpu_instance *inst, enum codec_command cmd, void *param)
> +{
> +	struct enc_info *p_enc_info;
> +
> +	p_enc_info = &inst->codec_info->enc_info;
> +	switch (cmd) {
> +	case ENABLE_ROTATION:
> +		{
> +			p_enc_info->rotation_enable = 1;
> +		}

Pointless curly braces.

> +		break;
> +	case ENABLE_MIRRORING:
> +		{
> +			p_enc_info->mirror_enable = 1;
> +		}
> +		break;
> +	case SET_MIRROR_DIRECTION:
> +		{


Put the curly brace on the line before and pull this code in one tab.

	case SET_MIRROR_DIRECTION: {
		enum mirror_direction mir_dir;

		...

> +			enum mirror_direction mir_dir;
> +
> +			if (param == 0)
> +				return RETCODE_INVALID_PARAM;
> +
> +			mir_dir = *(enum mirror_direction *)param;
> +			if (!(mir_dir == MIRDIR_NONE) && !(mir_dir == MIRDIR_HOR) &&
> +			    !(mir_dir == MIRDIR_VER) && !(mir_dir == MIRDIR_HOR_VER))
> +				return RETCODE_INVALID_PARAM;
> +			p_enc_info->mirror_direction = mir_dir;
> +		}
> +		break;
> +	case SET_ROTATION_ANGLE:
> +		{
> +			int angle;
> +
> +			if (param == 0)
> +				return RETCODE_INVALID_PARAM;
> +			angle = *(int *)param;
> +			if (angle != 0 && angle != 90 && angle != 180 && angle != 270)
> +				return RETCODE_INVALID_PARAM;
> +			if (p_enc_info->initial_info_obtained && (angle == 90 || angle == 270))
> +				return RETCODE_INVALID_PARAM;
> +			p_enc_info->rotation_angle = angle;
> +		}
> +		break;
> +	case ENC_GET_QUEUE_STATUS:
> +		{
> +			struct queue_status_info *queue_info = (struct queue_status_info *)param;
> +
> +			queue_info->instance_queue_count = p_enc_info->instance_queue_count;
> +			queue_info->report_queue_count    = p_enc_info->report_queue_count;
> +			break;
> +		}
> +	default:
> +		return RETCODE_INVALID_COMMAND;
> +	}
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code vpu_enc_issue_seq_init(struct vpu_instance *inst)
> +{
> +	enum ret_code     ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	ret = wave5_vpu_enc_init_seq(inst);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +enum ret_code vpu_enc_complete_seq_init(struct vpu_instance *inst, struct enc_initial_info *info)
> +{
> +	struct enc_info *p_enc_info;
> +	enum ret_code     ret;
> +	struct vpu_device *vpu_dev = inst->dev;
> +
> +	if (info == 0)
> +		return RETCODE_INVALID_PARAM;
> +
> +	p_enc_info = &inst->codec_info->enc_info;
> +
> +	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
> +		return RETCODE_FAILURE;
> +
> +	ret = wave5_vpu_enc_get_seq_info(inst, info);
> +	if (ret == RETCODE_SUCCESS)
> +		p_enc_info->initial_info_obtained = 1;
> +
> +	p_enc_info->initial_info = *info;
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> diff --git a/drivers/staging/media/wave5/vpuapi/vpuapi.h b/drivers/staging/media/wave5/vpuapi/vpuapi.h
> new file mode 100644
> index 000000000000..abcfccfeb569
> --- /dev/null
> +++ b/drivers/staging/media/wave5/vpuapi/vpuapi.h
> @@ -0,0 +1,1176 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Wave5 series multi-standard codec IP - helper definitions
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +
> +#ifndef VPUAPI_H_INCLUDED
> +#define VPUAPI_H_INCLUDED
> +
> +#include <linux/kfifo.h>
> +#include <linux/idr.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-ctrls.h>
> +#include "vpuerror.h"
> +#include "vpuconfig.h"
> +#include "../vdi/vdi.h"
> +
> +enum product_id {
> +	PRODUCT_ID_521,
> +	PRODUCT_ID_511,
> +	PRODUCT_ID_517,
> +	PRODUCT_ID_NONE,
> +};
> +
> +#define PRODUCT_ID_W_SERIES(x)      ((x) == PRODUCT_ID_521 || (x) == PRODUCT_ID_511 || (x) == PRODUCT_ID_517)
> +#define PRODUCT_ID_NOT_W_SERIES(x)  !PRODUCT_ID_W_SERIES(x)
> +
> +struct vpu_attr;
> +
> +enum vpu_instance_type {
> +	VPU_INST_TYPE_DEC = 0,
> +	VPU_INST_TYPE_ENC = 1
> +};
> +
> +enum vpu_instance_state {
> +	VPU_INST_STATE_NONE     = 0,
> +	VPU_INST_STATE_OPEN     = 1,
> +	VPU_INST_STATE_INIT_SEQ = 2,
> +	VPU_INST_STATE_PIC_RUN  = 3,
> +	VPU_INST_STATE_STOP     = 4,
> +	VPU_INST_STATE_WAIT_BUF = 5
> +};
> +
> +#define MAX_GDI_IDX      31
> +#define MAX_REG_FRAME    (MAX_GDI_IDX * 2)
> +
> +#define WAVE5_DEC_HEVC_MVCOL_BUF_SIZE(_w, _h) (DIV_ROUND_UP(_w, 64) * DIV_ROUND_UP(_h, 64) * 256 + 64)
> +#define WAVE5_DEC_AVC_MVCOL_BUF_SIZE(_w, _h) ((((ALIGN(_w, 256) / 16) * (ALIGN(_h, 16) / 16)) + 16) * 80)
> +#define WAVE5_DEC_VP9_MVCOL_BUF_SIZE(_w, _h)        (((ALIGN(_w, 64) * ALIGN(_h, 64)) >> 2))
> +#define WAVE5_DEC_AVS2_MVCOL_BUF_SIZE(_w, _h)       (((ALIGN(_w, 64) * ALIGN(_h, 64)) >> 5))
> +// AV1 MVCOL BUF SIZE : MFMV + segment ID + CDF probs table + film grain param Y+ film graim param C
> +#define WAVE5_DEC_AV1_MVCOL_BUF_SZ_1(_w, _h)	\
> +	(((ALIGN(_w, 64) / 64) * (ALIGN(_h, 64) / 64) * 512) + 41984 + 8192 + 4864)
> +#define WAVE5_DEC_AV1_MVCOL_BUF_SZ_2(_w1, _w2, _h)	\
> +	(((ALIGN(_w1, 64) / 64) * 256 + (ALIGN(_w2, 256) / 64) * 128) * (ALIGN(_h, 64) / 64))
> +
> +#define WAVE5_FBC_LUMA_TABLE_SIZE(_w, _h)           (ALIGN(_h, 64) * ALIGN(_w, 256) / 32)
> +#define WAVE5_FBC_CHROMA_TABLE_SIZE(_w, _h)         (ALIGN((_h), 64) * ALIGN((_w) / 2, 256) / 32)
> +#define WAVE5_ENC_AVC_MVCOL_BUF_SIZE(_w, _h)        (ALIGN(_w, 64) * ALIGN(_h, 64) / 32)
> +#define WAVE5_ENC_HEVC_MVCOL_BUF_SIZE(_w, _h)       (ALIGN(_w, 64) / 64 * ALIGN(_h, 64) / 64 * 128)
> +
> +/*
> + * common struct and definition
> + */
> +enum cod_std {
> +	STD_AVC   = 0,
> +	STD_VC1   = 1,
> +	STD_MPEG2 = 2,
> +	STD_MPEG4 = 3,
> +	STD_H263  = 4,
> +	STD_DIV3  = 5,
> +	STD_RV    = 6,
> +	STD_AVS   = 7,
> +	STD_THO   = 9,
> +	STD_VP3   = 10,
> +	STD_VP8   = 11,
> +	STD_HEVC  = 12,
> +	STD_VP9   = 13,
> +	STD_AVS2  = 14,
> +	STD_AV1   = 16,
> +	STD_MAX
> +};
> +
> +enum wave_std {
> +	W_HEVC_DEC  = 0x00,
> +	W_HEVC_ENC  = 0x01,
> +	W_AVC_DEC   = 0x02,
> +	W_AVC_ENC   = 0x03,
> +	W_VP9_DEC   = 0x16,
> +	W_AVS2_DEC  = 0x18,
> +	W_AV1_DEC   = 0x1A,
> +	STD_UNKNOWN = 0xFF
> +};
> +
> +enum SET_PARAM_OPTION {
> +	OPT_COMMON          = 0, /* SET_PARAM command option for encoding sequence */
> +	OPT_CUSTOM_GOP      = 1, /* SET_PARAM command option for setting custom GOP */
> +	OPT_CUSTOM_HEADER   = 2, /* SET_PARAM command option for setting custom VPS/SPS/PPS */
> +	OPT_VUI             = 3, /* SET_PARAM command option for encoding VUI  */
> +	OPT_CHANGE_PARAM    = 0x10,
> +};
> +
> +enum DEC_PIC_HDR_OPTION {
> +	INIT_SEQ_NORMAL      = 0x01,
> +	INIT_SEQ_W_THUMBNAIL = 0x11,
> +};
> +
> +enum DEC_PIC_OPTION {
> +	DEC_PIC_NORMAL      = 0x00, /* it is normal mode of DEC_PIC command. */
> +	DEC_PIC_W_THUMBNAIL = 0x10, /* thumbnail mode (skip non-IRAP without reference reg.) */
> +	SKIP_NON_IRAP       = 0x11, /* it skips to decode non-IRAP pictures. */
> +	SKIP_NON_REF_PIC    = 0x13
> +};
> +
> +/************************************************************************/
> +/* PROFILE & LEVEL                                                      */
> +/************************************************************************/
> +/* HEVC */
> +#define HEVC_PROFILE_MAIN                   1
> +#define HEVC_PROFILE_MAIN10                 2
> +#define HEVC_PROFILE_STILLPICTURE           3
> +#define HEVC_PROFILE_MAIN10_STILLPICTURE    2
> +
> +/* H.264 profile for encoder*/
> +#define H264_PROFILE_BP                     1
> +#define H264_PROFILE_MP                     2
> +#define H264_PROFILE_EXTENDED               3
> +#define H264_PROFILE_HP                     4
> +#define H264_PROFILE_HIGH10                 5
> +#define H264_PROFILE_HIGH422                6
> +#define H264_PROFILE_HIGH444                7
> +
> +/************************************************************************/
> +/* error codes                                                          */
> +/************************************************************************/
> +
> +enum ret_code {
> +	RETCODE_SUCCESS,
> +	RETCODE_FAILURE,
> +	RETCODE_INVALID_HANDLE,
> +	RETCODE_INVALID_PARAM,
> +	RETCODE_INVALID_COMMAND,
> +	RETCODE_ROTATOR_OUTPUT_NOT_SET,
> +	RETCODE_ROTATOR_STRIDE_NOT_SET,
> +	RETCODE_FRAME_NOT_COMPLETE,
> +	RETCODE_INVALID_FRAME_BUFFER,
> +	RETCODE_INSUFFICIENT_FRAME_BUFFERS,
> +	RETCODE_INVALID_STRIDE,
> +	RETCODE_WRONG_CALL_SEQUENCE,
> +	RETCODE_CALLED_BEFORE,
> +	RETCODE_NOT_INITIALIZED,
> +	RETCODE_USERDATA_BUF_NOT_SET,
> +	RETCODE_MEMORY_ACCESS_VIOLATION,
> +	RETCODE_VPU_RESPONSE_TIMEOUT,
> +	RETCODE_INSUFFICIENT_RESOURCE,
> +	RETCODE_NOT_FOUND_BITCODE_PATH,
> +	RETCODE_NOT_SUPPORTED_FEATURE,
> +	RETCODE_NOT_FOUND_VPU_DEVICE,
> +	RETCODE_CP0_EXCEPTION, /* this means that coprocessor exception has occurred. (WAVE only) */
> +	RETCODE_STREAM_BUF_FULL,           /* this means that stream buffer is full in encoder. */
> +	RETCODE_ACCESS_VIOLATION_HW,
> +	RETCODE_QUERY_FAILURE, /* this means that query command was not successful. (WAVE5 only) */
> +	RETCODE_QUEUEING_FAILURE,  /* this means that commands cannot be queued. (WAVE5 only) */
> +	RETCODE_VPU_STILL_RUNNING,
> +	RETCODE_REPORT_NOT_READY,
> +	RETCODE_VLC_BUF_FULL,   /* this means that VLC buffer is full in encoder. (WAVE5 only) */
> +	RETCODE_VPU_BUS_ERROR,
> +	RETCODE_INVALID_SFS_INSTANCE,
> +};
> +
> +/************************************************************************/
> +/* utility macros                                                       */
> +/************************************************************************/
> +#define VPU_CEIL(_data, _align)     (((_data) + ((_align) - 1)) & ~((_align) - 1))
> +
> +/************************************************************************/
> +/*                                                                      */
> +/************************************************************************/
> +/**
> + * \brief   parameters of DEC_SET_SEQ_CHANGE_MASK
> + */
> +#define SEQ_CHANGE_ENABLE_PROFILE    BIT(5)
> +#define SEQ_CHANGE_CHROMA_FORMAT_IDC BIT(15)         /* AV1 */
> +#define SEQ_CHANGE_ENABLE_SIZE       BIT(16)
> +#define SEQ_CHANGE_INTER_RES_CHANGE  BIT(17)         /* VP9 */
> +#define SEQ_CHANGE_ENABLE_BITDEPTH   BIT(18)
> +#define SEQ_CHANGE_ENABLE_DPB_COUNT  BIT(19)
> +
> +#define SEQ_CHANGE_ENABLE_ALL_VP9      (SEQ_CHANGE_ENABLE_PROFILE    | \
> +		SEQ_CHANGE_ENABLE_SIZE       | \
> +		SEQ_CHANGE_INTER_RES_CHANGE | \
> +		SEQ_CHANGE_ENABLE_BITDEPTH   | \
> +		SEQ_CHANGE_ENABLE_DPB_COUNT)
> +
> +#define SEQ_CHANGE_ENABLE_ALL_HEVC     (SEQ_CHANGE_ENABLE_PROFILE    | \
> +		SEQ_CHANGE_ENABLE_SIZE       | \
> +		SEQ_CHANGE_ENABLE_BITDEPTH   | \
> +		SEQ_CHANGE_ENABLE_DPB_COUNT)
> +
> +#define SEQ_CHANGE_ENABLE_ALL_AVS2     (SEQ_CHANGE_ENABLE_PROFILE    | \
> +		SEQ_CHANGE_ENABLE_SIZE       | \
> +		SEQ_CHANGE_ENABLE_BITDEPTH   | \
> +		SEQ_CHANGE_ENABLE_DPB_COUNT)
> +
> +#define SEQ_CHANGE_ENABLE_ALL_AVC      (SEQ_CHANGE_ENABLE_SIZE       | \
> +		SEQ_CHANGE_ENABLE_BITDEPTH   | \
> +		SEQ_CHANGE_ENABLE_DPB_COUNT)
> +
> +#define SEQ_CHANGE_ENABLE_ALL_AV1      (SEQ_CHANGE_ENABLE_PROFILE    | \
> +		SEQ_CHANGE_CHROMA_FORMAT_IDC | \
> +		SEQ_CHANGE_ENABLE_SIZE       | \
> +		SEQ_CHANGE_ENABLE_BITDEPTH   | \
> +		SEQ_CHANGE_ENABLE_DPB_COUNT)
> +
> +#define DISPLAY_IDX_FLAG_SEQ_END     -1
> +#define DISPLAY_IDX_FLAG_NO_FB       -3
> +#define DECODED_IDX_FLAG_NO_FB       -1
> +#define DECODED_IDX_FLAG_SKIP        -2
> +
> +#define RECON_IDX_FLAG_ENC_END       -1
> +#define RECON_IDX_FLAG_ENC_DELAY     -2
> +#define RECON_IDX_FLAG_HEADER_ONLY   -3
> +#define RECON_IDX_FLAG_CHANGE_PARAM  -4
> +
> +enum codec_command {
> +	ENABLE_ROTATION,
> +	ENABLE_MIRRORING,
> +	SET_MIRROR_DIRECTION,
> +	SET_ROTATION_ANGLE,
> +	ENABLE_DEC_THUMBNAIL_MODE,
> +	DEC_GET_QUEUE_STATUS,
> +	ENC_GET_QUEUE_STATUS,
> +};
> +
> +enum error_conceal_mode {
> +	ERROR_CONCEAL_MODE_OFF         = 0, /* conceal off  */
> +	ERROR_CONCEAL_MODE_INTRA_ONLY  = 1, /* intra conceal in intra-picture, inter-picture */
> +	ERROR_CONCEAL_MODE_INTRA_INTER = 2
> +};
> +
> +enum error_conceal_unit {
> +	ERROR_CONCEAL_UNIT_PICTURE    = 0, /* picture-level error conceal  */
> +	ERROR_CONCEAL_UNIT_SLICE_TILE = 1, /* slice/tile-level error conceal */
> +	ERROR_CONCEAL_UNIT_BLOCK_ROW  = 2, /* block-row-level error conceal */
> +	ERROR_CONCEAL_UNIT_BLOCK      = 3  /* block-level conceal */
> +};
> +
> +enum cb_cr_order {
> +	CBCR_ORDER_NORMAL,
> +	CBCR_ORDER_REVERSED
> +};
> +
> +enum mirror_direction {
> +	MIRDIR_NONE,   /* no mirroring */
> +	MIRDIR_VER,    /* vertical mirroring */
> +	MIRDIR_HOR,    /* horizontal mirroring */
> +	MIRDIR_HOR_VER /* horizontal and vertical mirroring */
> +};
> +
> +enum frame_buffer_format {
> +	FORMAT_ERR           = -1,
> +	FORMAT_420           = 0,    /* 8bit */
> +	FORMAT_422,    /* 8bit */
> +	FORMAT_224,    /* 8bit */
> +	FORMAT_444,    /* 8bit */
> +	FORMAT_400,    /* 8bit */
> +
> +	/* little endian perspective    */
> +	/*     | addr 0 | addr 1  |    */
> +	FORMAT_420_P10_16BIT_MSB = 5, /* lsb |000000xx|xxxxxxxx | msb */
> +	FORMAT_420_P10_16BIT_LSB,    /* lsb |xxxxxxx |xx000000 | msb */
> +	FORMAT_420_P10_32BIT_MSB,    /* lsb |00xxxxxxxxxxxxxxxxxxxxxxxxxxx| msb */
> +	FORMAT_420_P10_32BIT_LSB,    /* lsb |xxxxxxxxxxxxxxxxxxxxxxxxxxx00| msb */
> +
> +	/* 4:2:2 packed format */
> +	/* little endian perspective     */
> +	/*     | addr 0  | addr 1  |     */
> +	FORMAT_422_P10_16BIT_MSB,    /* lsb |000000xx |xxxxxxxx | msb */
> +	FORMAT_422_P10_16BIT_LSB,    /* lsb |xxxxxxxx |xx000000 | msb */
> +	FORMAT_422_P10_32BIT_MSB,    /* lsb |00xxxxxxxxxxxxxxxxxxxxxxxxxxx| msb */
> +	FORMAT_422_P10_32BIT_LSB,    /* lsb |xxxxxxxxxxxxxxxxxxxxxxxxxxx00| msb */
> +
> +	FORMAT_YUYV,    /* 8bit packed format : Y0U0Y1V0 Y2U1Y3V1 ... */
> +	FORMAT_YUYV_P10_16BIT_MSB,
> +	FORMAT_YUYV_P10_16BIT_LSB,
> +	FORMAT_YUYV_P10_32BIT_MSB,
> +	FORMAT_YUYV_P10_32BIT_LSB,
> +
> +	FORMAT_YVYU,    /* 8bit packed format : Y0V0Y1U0 Y2V1Y3U1 ... */
> +	FORMAT_YVYU_P10_16BIT_MSB,
> +	FORMAT_YVYU_P10_16BIT_LSB,
> +	FORMAT_YVYU_P10_32BIT_MSB,
> +	FORMAT_YVYU_P10_32BIT_LSB,
> +
> +	FORMAT_UYVY,    /* 8bit packed format : U0Y0V0Y1 U1Y2V1Y3 ... */
> +	FORMAT_UYVY_P10_16BIT_MSB,
> +	FORMAT_UYVY_P10_16BIT_LSB,
> +	FORMAT_UYVY_P10_32BIT_MSB,
> +	FORMAT_UYVY_P10_32BIT_LSB,
> +
> +	FORMAT_VYUY,    /* 8bit packed format : V0Y0U0Y1 V1Y2U1Y3 ... */
> +	FORMAT_VYUY_P10_16BIT_MSB,
> +	FORMAT_VYUY_P10_16BIT_LSB,
> +	FORMAT_VYUY_P10_32BIT_MSB,
> +	FORMAT_VYUY_P10_32BIT_LSB,
> +
> +	FORMAT_MAX,
> +};
> +
> +enum packed_format_num {
> +	NOT_PACKED = 0,
> +	PACKED_YUYV,
> +	PACKED_YVYU,
> +	PACKED_UYVY,
> +	PACKED_VYUY,
> +};
> +
> +enum wave5_interrupt_bit {
> +	INT_WAVE5_INIT_VPU          = 0,
> +	INT_WAVE5_WAKEUP_VPU        = 1,
> +	INT_WAVE5_SLEEP_VPU         = 2,
> +	INT_WAVE5_CREATE_INSTANCE   = 3,
> +	INT_WAVE5_FLUSH_INSTANCE    = 4,
> +	INT_WAVE5_DESTROY_INSTANCE  = 5,
> +	INT_WAVE5_INIT_SEQ          = 6,
> +	INT_WAVE5_SET_FRAMEBUF      = 7,
> +	INT_WAVE5_DEC_PIC           = 8,
> +	INT_WAVE5_ENC_PIC           = 8,
> +	INT_WAVE5_ENC_SET_PARAM     = 9,
> +	INT_WAVE5_DEC_QUERY         = 14,
> +	INT_WAVE5_BSBUF_EMPTY       = 15,
> +	INT_WAVE5_BSBUF_FULL        = 15,
> +};
> +
> +enum pic_type {
> +	PIC_TYPE_I            = 0, /* I picture */
> +	PIC_TYPE_KEY          = 0, /* KEY frame for AV1*/
> +	PIC_TYPE_P            = 1, /* P picture */
> +	PIC_TYPE_INTER        = 1, /* inter frame for AV1*/
> +	PIC_TYPE_B            = 2, /* B picture (except VC1) */
> +	PIC_TYPE_REPEAT       = 2, /* repeat frame (VP9 only) */
> +	PIC_TYPE_AV1_INTRA    = 2, /* intra only frame (AV1 only) */
> +	PIC_TYPE_VC1_BI       = 2, /* VC1 BI picture (VC1 only) */
> +	PIC_TYPE_VC1_B        = 3, /* VC1 B picture (VC1 only) */
> +	PIC_TYPE_D            = 3,
> +	PIC_TYPE_S            = 3,
> +	PIC_TYPE_AVS2_F       = 3, /* F picture in AVS2 */
> +	PIC_TYPE_AV1_SWITCH   = 3, /* switch frame (AV1 only) */
> +	PIC_TYPE_VC1_P_SKIP   = 4, /* VC1 P skip picture (VC1 only) */
> +	PIC_TYPE_MP4_P_SKIP_NOT_CODED = 4, /* not coded P picture in MPEG4 packed mode */
> +	PIC_TYPE_AVS2_S       = 4, /* S picture in AVS2 */
> +	PIC_TYPE_IDR          = 5, /* H.264/H.265 IDR picture */
> +	PIC_TYPE_AVS2_G       = 5, /* G picture in AVS2 */
> +	PIC_TYPE_AVS2_GB      = 6, /* GB picture in AVS2 */
> +	PIC_TYPE_MAX               /* no meaning */
> +};
> +
> +enum bit_stream_mode {
> +	BS_MODE_INTERRUPT,
> +	BS_MODE_RESERVED,   /* reserved for the future */
> +	BS_MODE_PIC_END,
> +};
> +
> +enum sw_reset_mode {
> +	SW_RESET_SAFETY,
> +	SW_RESET_FORCE,
> +	SW_RESET_ON_BOOT
> +};
> +
> +enum tiled_map_type {
> +	LINEAR_FRAME_MAP                            = 0,  /* linear frame map type */
> +	COMPRESSED_FRAME_MAP                        = 17, /* compressed frame map type*/
> +};
> +
> +enum temporal_id_mode {
> +	TEMPORAL_ID_MODE_ABSOLUTE,
> +	TEMPORAL_ID_MODE_RELATIVE,
> +};
> +
> +struct vpu_attr {
> +	u32  product_id;                  /* the product ID */
> +	char    product_name[8];             /* the product name in ascii code */
> +	u32  product_version;             /* the product version number */
> +	u32  fw_version;                  /* the F/W version */
> +	u32  customer_id;                 /* customer ID number */
> +	u32  support_decoders;            /* bitmask: see <<vpuapi_h_cod_std>> */
> +	u32  support_encoders;            /* bitmask: see <<vpuapi_h_cod_std>> */
> +	bool    support_bitstream_mode;
> +	bool    support_backbone;
> +	bool    support_avc10bit_enc;
> +	bool    support_hevc10bit_enc;
> +	u32  support_endian_mask;          /* A variable of supported endian mode in product */
> +	bool    support_dual_core;            /* this indicates whether a product has two vcores. */
> +	bool    support_vcore_backbone;
> +	bool    support_vcpu_backbone;
> +};
> +
> +struct frame_buffer {
> +	dma_addr_t buf_y;
> +	dma_addr_t buf_cb;
> +	dma_addr_t buf_cr;
> +	u32          buf_y_size;
> +	u32          buf_cb_size;
> +	u32          buf_cr_size;
> +	int cbcr_interleave;
> +	int endian;
> +	enum tiled_map_type map_type;
> +	int stride;            /* A horizontal stride for given frame buffer */
> +	int width;             /* A width for given frame buffer */
> +	int height;            /* A height for given frame buffer */
> +	int size;              /* A size for given frame buffer */
> +	int sequence_no;
> +	bool update_fb_info;
> +};
> +
> +struct vpu_rect {
> +	u32 left;    /* A horizontal pixel offset of top-left corner of rectangle from (0, 0) */
> +	u32 top;     /* A vertical pixel offset of top-left corner of rectangle from (0, 0) */
> +	u32 right;   /* A horizontal pixel offset of bottom-right corner of rectangle from (0, 0) */
> +	u32 bottom;  /* A vertical pixel offset of bottom-right corner of rectangle from (0, 0) */
> +};
> +
> +/*
> + * decode struct and definition
> + */
> +
> +struct dec_open_param {
> +	dma_addr_t  bitstream_buffer;
> +	int              bitstream_buffer_size;
> +	int              cbcr_interleave;
> +	int              nv21;
> +	int              cbcr_order;
> +	enum endian_mode       frame_endian;
> +	enum endian_mode       stream_endian;
> +	enum bit_stream_mode    bitstream_mode;
> +	bool             enable_non_ref_fbc_write;
> +	int              av1_format;
> +	enum error_conceal_unit error_conceal_unit;
> +	enum error_conceal_mode error_conceal_mode;
> +};
> +
> +struct dec_initial_info {
> +	s32           pic_width;
> +	s32           pic_height;
> +	s32           f_rate_numerator; /* the numerator part of frame rate fraction */
> +	s32           f_rate_denominator; /* the denominator part of frame rate fraction */
> +	struct vpu_rect    pic_crop_rect;
> +	s32           min_frame_buffer_count;
> +	s32           frame_buf_delay;
> +
> +	s32           max_temporal_layers; /* it indicates the max number of temporal sub-layers. */
> +	s32           max_spatial_layers;
> +	s32           profile;
> +	s32           level;
> +	s32           tier;
> +	s32           interlace;
> +	s32           is_ext_sar;
> +	s32           aspect_rate_info;
> +	s32           bit_rate;
> +	u32          user_data_header;
> +	s32           user_data_num;
> +	s32           user_data_size;
> +	s32           user_data_buf_full;
> +	s32           chroma_format_idc;/* A chroma format indicator */
> +	s32           luma_bitdepth;   /* A bit-depth of luma sample */
> +	s32           chroma_bitdepth; /* A bit-depth of chroma sample */
> +	u32           seq_init_err_reason;
> +	s32           warn_info;
> +	dma_addr_t rd_ptr;         /* A read pointer of bitstream buffer */
> +	dma_addr_t wr_ptr;         /* A write pointer of bitstream buffer */
> +	u32          sequence_no;
> +	u32          output_bit_depth;
> +	u32          vlc_buf_size;   /* the size of vlc buffer */
> +	u32          param_buf_size; /* the size of param buffer */
> +};
> +
> +#define WAVE_SKIPMODE_WAVE_NONE 0
> +#define WAVE_SKIPMODE_NON_IRAP  1
> +#define WAVE_SKIPMODE_NON_REF   2
> +
> +struct dec_param {
> +	s32 skipframe_mode;
> +	bool    cra_as_bla_flag;
> +	bool    disable_film_grain;
> +};
> +
> +struct dec_output_ext_data {
> +	u32          user_data_header;
> +	u32          user_data_num;        /* this is the number of user data. */
> +	u32          user_data_size;       /* this is the size of user data. */
> +	u32          user_data_buf_full;
> +	u32          active_format;
> +};
> +
> +struct h265_rp_sei {
> +	unsigned int exist;
> +	int recovery_poc_cnt;         /* recovery_poc_cnt */
> +	int exact_match_flag;         /* exact_match_flag */
> +	int broken_link_flag;         /* broken_link_flag */
> +};
> +
> +struct avs2_info {
> +	int decoded_poi;
> +	int display_poi;
> +};
> +
> +struct av1_info {
> +	int allow_screen_content_tools; /* it indicates whether screen content tool is enabled. */
> +	int allow_intra_bc;            /* it indicates whether intra block copy is enabled. */
> +	int spatial_id;               /* it indicates a spatial ID of the picture. */
> +};
> +
> +struct dec_output_info {
> +	/**
> +	 * this is a frame buffer index for the picture to be displayed at the moment among
> +	 * frame buffers which are registered using vpu_dec_register_frame_buffer(). frame
> +	 * data to be displayed are stored into the frame buffer with this index.
> +	 * when there is no display delay, this index is always
> +	 * the same with index_frame_decoded. however, if display delay does exist for display
> +	 *  reordering in AVC
> +	 * or B-frames in VC1), this index might be different with index_frame_decoded.
> +	 * by checking this index, HOST application can easily know whether sequence decoding
> +	 *  has been finished or not.
> +	 *
> +	 * -3(0xFFFD) or -2(0xFFFE) : it is when a display output cannot be given due to picture
> +	 *  reordering or skip option.
> +	 * -1(0xFFFF) : it is when there is no more output for display at the end of sequence
> +	 *  decoding.
> +	 */
> +	int index_frame_display;
> +	int index_frame_display_for_tiled;  /* in case of WTL mode, this index indicates a display
> +					     *  index of tiled or compressed framebuffer.
> +					     */
> +	/**
> +	 * this is a frame buffer index of decoded picture among frame buffers which were
> +	 * registered using vpu_dec_register_frame_buffer(). the currently decoded frame is stored
> +	 *  into the frame buffer specified by
> +	 * this index.
> +	 *
> +	 * -2 : it indicates that no decoded output is generated because decoder meets EOS
> +	 *  (end of sequence) or skip.
> +	 * -1 : it indicates that decoder fails to decode a picture because there is no available
> +	 *  frame buffer.
> +	 */
> +	int index_frame_decoded;
> +	int index_inter_frame_decoded;
> +	int index_frame_decoded_for_tiled;
> +	int nal_type;
> +	int pic_type;
> +	int num_of_err_m_bs;
> +	int num_of_tot_m_bs;
> +	int num_of_err_m_bs_in_display;
> +	int num_of_tot_m_bs_in_display;
> +	u32 decoding_success;
> +	struct vpu_rect rc_display;
> +	int disp_pic_width;
> +	int disp_pic_height;
> +	struct vpu_rect rc_decoded;
> +	int dec_pic_width;
> +	int dec_pic_height;
> +	struct avs2_info avs2_info;
> +	struct av1_info  av1_info;
> +	int decoded_poc;
> +	int display_poc;
> +	int temporal_id;                 /* A temporal ID of the picture */
> +	struct h265_rp_sei h265_rp_sei;
> +	struct dec_output_ext_data dec_output_ext_data;
> +	int consumed_byte;      /* the number of bytes that are consumed by VPU. */
> +	int rd_ptr;             /* A stream buffer read pointer for the current decoder instance */
> +	int wr_ptr;             /* A stream buffer write pointer for the current decoder instance */
> +	dma_addr_t byte_pos_frame_start;
> +	dma_addr_t byte_pos_frame_end;
> +	struct frame_buffer disp_frame;
> +	int frame_display_flag;               /* it reports a frame buffer flag to be displayed.  */
> +	/**
> +	 * this variable reports that sequence has been changed while H.264/AVC stream decoding.
> +	 * if it is 1, HOST application can get the new sequence information by calling
> +	 *  vpu_dec_get_initial_info() or vpu_dec_issue_seq_init().
> +	 *
> +	 * for H.265/HEVC decoder, each bit has a different meaning as follows.
> +	 *
> +	 * sequence_changed[5] : it indicates that the profile_idc has been changed.
> +	 * sequence_changed[16] : it indicates that the resolution has been changed.
> +	 * sequence_changed[19] : it indicates that the required number of frame buffer has
> +	 *  been changed.
> +	 */
> +	int sequence_changed;
> +	int frame_cycle;   /* this variable reports the number of cycles for processing a frame. */
> +	int error_reason;
> +	u32 error_reason_ext;
> +	int warn_info;
> +	u32 sequence_no;
> +
> +	u32  dec_host_cmd_tick;     /* tick of DEC_PIC command for the picture */
> +	u32  dec_seek_start_tick;   /* start tick of seeking slices of the picture */
> +	u32  dec_seek_end_tick;     /* end tick of seeking slices of the picture */
> +	u32  dec_parse_start_tick;  /* start tick of parsing slices of the picture */
> +	u32  dec_parse_end_tick;    /* end tick of parsing slices of the picture */
> +	u32  dec_decode_start_tick; /* start tick of decoding slices of the picture */
> +	u32  dec_decode_end_tick;   /* end tick of decoding slices of the picture */
> +
> +	u32  seek_cycle;
> +	u32  parse_cycle;
> +	u32  decoded_cycle;
> +
> +	s32 ctu_size;
> +	s32 output_flag;
> +};
> +
> +struct queue_status_info {
> +	u32  instance_queue_count;
> +	u32  report_queue_count;
> +};
> +
> +/*
> + * encode struct and definition
> + */
> +
> +#define MAX_NUM_TEMPORAL_LAYER          7
> +#define MAX_NUM_SPATIAL_LAYER           3
> +#define MAX_GOP_NUM                     8
> +
> +struct custom_gop_pic_param {
> +	int pic_type;             /* A picture type of nth picture in the custom GOP */
> +	int poc_offset;           /* A POC of nth picture in the custom GOP */
> +	int pic_qp;               /* A quantization parameter of nth picture in the custom GOP */
> +	int use_multi_ref_p; /* use multiref pic for P picture. valid only if PIC_TYPE is P */
> +	int ref_poc_l0;              /* A POC of reference L0 of nth picture in the custom GOP */
> +	int ref_poc_l1;              /* A POC of reference L1 of nth picture in the custom GOP */
> +	int temporal_id;            /* A temporal ID of nth picture in the custom GOP */
> +};
> +
> +struct custom_gop_param {
> +	int custom_gop_size;                  /* the size of custom GOP (0~8) */
> +	struct custom_gop_pic_param pic_param[MAX_GOP_NUM];
> +};
> +
> +struct wave_custom_map_opt {
> +	int roi_avg_qp; /* it sets an average QP of ROI map. */
> +	int custom_roi_map_enable; /* it enables ROI map. */
> +	int custom_lambda_map_enable; /* it enables custom lambda map. */
> +	int custom_mode_map_enable;
> +	int custom_coef_drop_enable;
> +	dma_addr_t addr_custom_map;
> +};
> +
> +struct enc_wave_param {
> +	/*
> +	 * A profile indicator (HEVC only)
> +	 *
> +	 * 0 : the firmware determines a profile according to internalbitdepth.
> +	 * 1 : main profile
> +	 * 2 : main10 profile
> +	 * 3 : main still picture profile
> +	 * in AVC encoder, a profile cannot be set by host application. the firmware decides it
> +	 *  based on internalbitdepth. it is HIGH profile for bitdepth of 8 and HIGH10 profile for
> +	 *  bitdepth of 10.
> +	 */
> +	int profile;
> +	int en_still_picture;                 /* still picture profile */
> +	int level;                          /* A level indicator (level * 10) */
> +	int tier; /* 0=main, 1=high */
> +	int internal_bit_depth;
> +	int gop_preset_idx;
> +	int decoding_refresh_type; /* 0=non-IRAP, 1=CRA, 2=IDR */
> +	int intra_qp;                        /* A quantization parameter of intra picture */
> +	int intra_period;                    /* A period of intra picture in GOP size */
> +	int forced_idr_header_enable;
> +	int conf_win_top;                     /* A top offset of conformance window */
> +	int conf_win_bot;                     /* A bottom offset of conformance window */
> +	int conf_win_left;                    /* A left offset of conformance window */
> +	int conf_win_right;                   /* A right offset of conformance window */
> +	int independ_slice_mode; /* 0=no-multi-slice, 1=slice-in-ctu-number*/
> +	int independ_slice_mode_arg;
> +	int depend_slice_mode;
> +	int depend_slice_mode_arg;
> +	int intra_refresh_mode;
> +	/*
> +	 * it specifies an intra CTU refresh interval. depending on intra_refresh_mode,
> +	 * it can mean one of the following.
> +	 *
> +	 * the number of consecutive CTU rows for intra_ctu_refresh_mode of 1
> +	 * the number of consecutive CTU columns for intra_ctu_refresh_mode of 2
> +	 * A step size in CTU for intra_ctu_refresh_mode of 3
> +	 * the number of intra ct_us to be encoded in a picture for intra_ctu_refresh_mode of 4
> +	 */
> +	int intra_refresh_arg;
> +	/*
> +	 * 0 : custom setting
> +	 * 1 : recommended encoder parameters (slow encoding speed, highest picture quality)
> +	 * 2 : boost mode (normal encoding speed, moderate picture quality)
> +	 * 3 : fast mode (fast encoding speed, low picture quality)
> +	 */
> +	uint32_t use_recommend_enc_param: 2;
> +	uint32_t max_num_merge: 2;
> +	uint32_t scaling_list_enable: 2;
> +	uint32_t bit_alloc_mode: 2; /* 0=ref-pic-priority, 1=uniform, 2=fixed_bit_ratio */
> +	int beta_offset_div2: 4;    /* it sets beta_offset_div2 for deblocking filter. */
> +	int tc_offset_div2: 4;      /* it sets tc_offset_div3 for deblocking filter. */
> +	int hvs_qp_scale: 4; /* QP scaling factor for CU QP adjustmnt if hvs_qp_scale_enable is 1 */
> +	int hvs_max_delta_qp;                     /* A maximum delta QP for HVS */
> +	/*
> +	 * A fixed bit ratio (1 ~ 255) for each picture of GOP's bit
> +	 * allocation
> +	 *
> +	 * N = 0 ~ (MAX_GOP_SIZE - 1)
> +	 * MAX_GOP_SIZE = 8
> +	 *
> +	 * for instance when MAX_GOP_SIZE is 3, fixed_bit_ratio0, fixed_bit_ratio1, and
> +	 *  fixed_bit_ratio2 can be set as 2, 1, and 1 repsectively for
> +	 * the fixed bit ratio 2:1:1. this is only valid when bit_alloc_mode is 2.
> +	 */
> +	u8 fixed_bit_ratio[MAX_GOP_NUM];
> +	struct custom_gop_param gop_param;            /* <<vpuapi_h_custom_gop_param>> */
> +	u32 num_units_in_tick;
> +	u32 time_scale;
> +	u32 num_ticks_poc_diff_one;
> +	int chroma_cb_qp_offset;               /* the value of chroma(cb) QP offset */
> +	int chroma_cr_qp_offset;               /* the value of chroma(cr) QP offset */
> +	int initial_rc_qp;
> +	u32 nr_intra_weight_y;
> +	u32 nr_intra_weight_cb;       /* A weight to cb noise level for intra picture (0 ~ 31) */
> +	u32 nr_intra_weight_cr;       /* A weight to cr noise level for intra picture (0 ~ 31) */
> +	u32 nr_inter_weight_y;
> +	u32 nr_inter_weight_cb;       /* A weight to cb noise level for inter picture (0 ~ 31) */
> +	u32 nr_inter_weight_cr;       /* A weight to cr noise level for inter picture (0 ~ 31) */
> +	u32 nr_noise_sigma_y; /* Y noise standard deviation if nr_noise_est_enable is 0.  */
> +	u32 nr_noise_sigma_cb;/* cb noise standard deviation if nr_noise_est_enable is 0. */
> +	u32 nr_noise_sigma_cr;/* cr noise standard deviation if nr_noise_est_enable is 0. */
> +	u32 bg_thr_diff;
> +	u32 bg_thr_mean_diff;
> +	u32 bg_lambda_qp;
> +	int    bg_delta_qp;
> +	int    pu04_delta_rate: 8;       /* added to the total cost of 4x4 blocks */
> +	int    pu08_delta_rate: 8;       /* added to the total cost of 8x8 blocks */
> +	int    pu16_delta_rate: 8;       /* added to the total cost of 16x16 blocks */
> +	int    pu32_delta_rate: 8;       /* added to the total cost of 32x32 blocks */
> +	int    pu04_intra_planar_delta_rate: 8;
> +	int    pu04_intra_dc_delta_rate: 8;
> +	int    pu04_intra_angle_delta_rate: 8;
> +	int    pu08_intra_planar_delta_rate: 8;
> +	int    pu08_intra_dc_delta_rate: 8;
> +	int    pu08_intra_angle_delta_rate: 8;
> +	int    pu16_intra_planar_delta_rate: 8;
> +	int    pu16_intra_dc_delta_rate: 8;
> +	int    pu16_intra_angle_delta_rate: 8;
> +	int    pu32_intra_planar_delta_rate: 8;
> +	int    pu32_intra_dc_delta_rate: 8;
> +	int    pu32_intra_angle_delta_rate: 8;
> +	int    cu08_intra_delta_rate: 8;
> +	int    cu08_inter_delta_rate: 8;
> +	int    cu08_merge_delta_rate: 8;
> +	int    cu16_intra_delta_rate: 8;
> +	int    cu16_inter_delta_rate: 8;
> +	int    cu16_merge_delta_rate: 8;
> +	int    cu32_intra_delta_rate: 8;
> +	int    cu32_inter_delta_rate: 8;
> +	int    cu32_merge_delta_rate: 8;
> +	int    coef_clear_disable: 8;
> +	int    min_qp_i;                   /* A minimum QP of I picture for rate control */
> +	int    max_qp_i;                   /* A maximum QP of I picture for rate control */
> +	int    min_qp_p;                   /* A minimum QP of P picture for rate control */
> +	int    max_qp_p;                   /* A maximum QP of P picture for rate control */
> +	int    min_qp_b;                   /* A minimum QP of B picture for rate control */
> +	int    max_qp_b;                   /* A maximum QP of B picture for rate control */
> +	dma_addr_t custom_lambda_addr; /* it specifies the address of custom lambda map.  */
> +	dma_addr_t user_scaling_list_addr; /* it specifies the address of user scaling list file. */
> +	int avc_idr_period;/* A period of IDR picture (0 ~ 1024). 0 - implies an infinite period */
> +	int avc_slice_mode; /* 0=none, 1=slice-in-mb-number */
> +	int avc_slice_arg;	/* the number of MB for a slice when avc_slice_mode is set with 1 */
> +	int intra_mb_refresh_mode; /* 0=none, 1=row, 2=column, 3=step-size-in-mb */
> +	/**
> +	 * it specifies an intra MB refresh interval. depending on intra_mb_refresh_mode,
> +	 * it can mean one of the following.
> +	 *
> +	 * the number of consecutive MB rows for intra_mb_refresh_mode of 1
> +	 * the number of consecutive MB columns for intra_mb_refresh_mode of 2
> +	 * A step size in MB for intra_mb_refresh_mode of 3
> +	 */
> +	int intra_mb_refresh_arg;
> +	int entropy_coding_mode; /* 0=CAVLC, 1=CABAC */
> +	u32 rc_weight_param;
> +	u32 rc_weight_buf;
> +
> +	/* flags */
> +	uint32_t lossless_enable: 1;                 /*enables lossless coding. */

Why the switch from u32 to uint32_t?

> +	uint32_t const_intra_pred_flag: 1;             /*enables constrained intra prediction. */
> +	uint32_t tmvp_enable: 1;                     /*enables temporal motion vector prediction. */
> +	uint32_t wpp_enable: 1;
> +	uint32_t disable_deblk: 1;                   /* it disables in-loop deblocking filtering. */
> +	uint32_t lf_cross_slice_boundary_enable: 1;
> +	uint32_t skip_intra_trans: 1;
> +	uint32_t sao_enable: 1;                      /* it enables SAO (sample adaptive offset). */
> +	uint32_t intra_nx_n_enable: 1;                 /* it enables intra nx_n p_us. */
> +	uint32_t cu_level_rc_enable: 1;                /* it enable CU level rate control. */
> +	uint32_t hvs_qp_enable: 1; /* enable CU QP adjustment for subjective quality enhancement. */
> +	uint32_t roi_enable: 1; /* it enables ROI map. NOTE: it is valid when rate control is on. */
> +	uint32_t nr_y_enable: 1;   /* it enables noise reduction algorithm to Y component.  */
> +	uint32_t nr_noise_est_enable: 1;
> +	uint32_t nr_cb_enable: 1;     /* it enables noise reduction algorithm to cb component. */
> +	uint32_t nr_cr_enable: 1;     /* it enables noise reduction algorithm to cr component. */
> +	uint32_t use_long_term: 1;                 /* it enables long-term reference function. */
> +	uint32_t monochrome_enable: 1;           /* it enables monochrom encoding mode. */
> +	uint32_t strong_intra_smooth_enable: 1;    /* it enables strong intra smoothing. */
> +	uint32_t weight_pred_enable: 1;   /* it enables to use weighted prediction.*/
> +	uint32_t bg_detect_enable: 1;     /* it enables background detection. */
> +	uint32_t custom_lambda_enable: 1;  /* it enables custom lambda table. */
> +	uint32_t custom_md_enable: 1;      /* it enables custom mode decision. */
> +	uint32_t rdo_skip: 1;	/* it skips RDO(rate distortion optimization). */
> +	uint32_t lambda_scaling_enable: 1;	/* it enables lambda scaling using custom GOP. */
> +	uint32_t transform8x8_enable: 1; /* it enables 8x8 intra prediction and 8x8 transform. */
> +	uint32_t mb_level_rc_enable: 1;			/* it enables MB-level rate control. */
> +	uint32_t s2fme_disable: 1;               /* it disables s2me_fme (only for AVC encoder). */
> +};
> +
> +struct enc_sub_frame_sync_config {
> +	u32 sub_frame_sync_mode; /* 0=wire-based, 1=register-based */
> +	u32 sub_frame_sync_on;

Bool?

> +};
> +
> +struct enc_open_param {
> +	dma_addr_t bitstream_buffer;
> +	u32          bitstream_buffer_size;
> +	int             ring_buffer_enable;
> +	int             pic_width;   /* the width of a picture to be encoded in unit of sample. */
> +	int             pic_height;  /* the height of a picture to be encoded in unit of sample. */
> +	int             frame_rate_info;/* desired fps */
> +	int             vbv_buffer_size;
> +	int             bit_rate; /* target bitrate in bps */
> +	int             rc_enable; /* rate control */
> +	struct enc_wave_param wave_param;
> +	int             cbcr_interleave;
> +	int             cbcr_order;
> +	int             stream_endian;
> +	int             source_endian;
> +	int               line_buf_int_en;
> +	int               packed_format;  /* <<vpuapi_h_packed_format_num>> */
> +	enum frame_buffer_format src_format;
> +	enum frame_buffer_format output_format;
> +	int             nv21;
> +	bool            enable_pts; /* an enable flag to report PTS(presentation timestamp) */
> +	bool            enable_non_ref_fbc_write;
> +	int             sub_frame_sync_enable;
> +	int             sub_frame_sync_mode;
> +	u32          encode_hrd_rbsp_in_vps; /* it encodes the HRD syntax rbsp into VPS. */
> +	u32          hrd_rbsp_data_size;    /* the bit size of the HRD rbsp data */
> +	dma_addr_t hrd_rbsp_data_addr;    /* the address of the HRD rbsp data */
> +	u32          encode_vui_rbsp;
> +	u32          vui_rbsp_data_size;    /* the bit size of the VUI rbsp data */
> +	dma_addr_t vui_rbsp_data_addr;    /* the address of the VUI rbsp data */
> +};
> +
> +struct enc_initial_info {
> +	int             min_frame_buffer_count; /* minimum number of frame buffer */
> +	int             min_src_frame_count;    /* minimum number of source buffer */
> +	int             max_latency_pictures;  /* maximum number of picture latency */
> +	int             seq_init_err_reason;    /* error information */
> +	int             warn_info;            /* warn information */
> +	u32          vlc_buf_size; /* the size of task buffer */
> +	u32          param_buf_size; /* the size of task buffer */
> +};
> +
> +struct enc_code_opt {
> +	int implicit_header_encode;
> +	int encode_vcl;                  /* A flag to encode VCL nal unit explicitly */
> +	int encode_vps;                  /* A flag to encode VPS nal unit explicitly */
> +	int encode_sps;                  /* A flag to encode SPS nal unit explicitly */
> +	int encode_pps;                  /* A flag to encode PPS nal unit explicitly */
> +	int encode_aud;                  /* A flag to encode AUD nal unit explicitly */
> +	int encode_eos;
> +	int encode_eob;
> +	int encode_vui;                  /* A flag to encode VUI nal unit explicitly */
> +};
> +
> +struct enc_param {
> +	struct frame_buffer *source_frame;
> +	int             skip_picture;
> +	dma_addr_t pic_stream_buffer_addr;
> +	int             pic_stream_buffer_size;
> +	int             force_pic_qp_enable; /* flag used to force picture quantization parameter */

My concern with this is that it looks like it might come from the user
and then it's negative leading to undefined behavior.  But I looked and
I don't think it's not actually possible to set this.  Just delete any
unused code.

> +	int             force_pic_qp_i;
> +	int             force_pic_qp_p;
> +	int             force_pic_qp_b;
> +	int             force_pic_type_enable; /* A flag to use a force picture type */
> +	int             force_pic_type;

Same same.  Delete.

> +	int             src_idx;             /* A source frame buffer index */
> +	int             src_end_flag;
> +	struct enc_code_opt      code_option;
> +	u32  use_cur_src_as_longterm_pic;
> +	u32  use_longterm_ref;
> +	u64  pts;                    /* the presentation timestamp (PTS) of input source */
> +	struct wave_custom_map_opt custom_map_opt;
> +	u32 wp_pix_sigma_y;  /* pixel variance of Y component for weighted prediction  */
> +	u32 wp_pix_sigma_cb; /* pixel variance of cb component for weighted prediction  */
> +	u32 wp_pix_sigma_cr; /* pixel variance of cr component for weighted prediction */
> +	u32 wp_pix_mean_y;   /* pixel mean value of Y component for weighted prediction */
> +	u32 wp_pix_mean_cb;  /* pixel mean value of cb component for weighted prediction */
> +	u32 wp_pix_mean_cr;  /* pixel mean value of cr component for weighted prediction */
> +	u32 force_all_ctu_coef_drop_enable; /* it forces all coefficients to be zero after TQ . */
> +};
> +
> +struct enc_output_info {
> +	dma_addr_t bitstream_buffer;
> +	u32 bitstream_size;   /* the byte size of encoded bitstream */
> +	int bitstream_wrap_around;
> +	int pic_type;            /* <<vpuapi_h_pic_type>> */
> +	int num_of_slices;      /*  the number of slices of the currently being encoded picture  */
> +	int recon_frame_index;
> +	struct frame_buffer recon_frame;
> +	int rd_ptr;
> +	int wr_ptr;
> +	int pic_skipped;         /* whether the current encoding has been skipped or not */
> +	int num_of_intra;         /* the number of intra coded block */
> +	int num_of_merge;         /* the number of merge block in 8x8 */
> +	int num_of_skip_block;     /* the number of skip block in 8x8 */
> +	int avg_ctu_qp;           /* the average value of CTU q_ps */
> +	int enc_pic_byte;         /* the number of encoded picture bytes  */
> +	int enc_gop_pic_idx;       /* the GOP index of the currently encoded picture */
> +	int enc_pic_poc;        /* the POC(picture order count)  of the currently encoded picture */
> +	int release_src_flag;     /* the source buffer indicator of the encoded pictures */
> +	int enc_src_idx;          /* the source buffer index of the currently encoded picture */
> +	int enc_vcl_nut;
> +	int enc_pic_cnt;          /* the encoded picture number */
> +	int error_reason;        /* the error reason of the currently encoded picture */
> +	int warn_info;           /* the warning information of the currently encoded picture */
> +	int frame_cycle;       /* the param for reporting the cycle number of encoding one frame.*/
> +	u64 pts;
> +	u32 enc_host_cmd_tick;       /* tick of ENC_PIC command for the picture */
> +	u32 enc_prepare_start_tick;  /* start tick of preparing slices of the picture */
> +	u32 enc_prepare_end_tick;    /* end tick of preparing slices of the picture  */
> +	u32 enc_processing_start_tick; /* start tick of processing slices of the picture */
> +	u32 enc_processing_end_tick;   /* end tick of processing slices of the picture */
> +	u32 enc_encode_start_tick;     /* start tick of encoding slices of the picture */
> +	u32 enc_encode_end_tick;       /* end tick of encoding slices of the picture */
> +	u32 prepare_cycle;   /* the number of cycles for preparing slices of a picture */
> +	u32 processing;     /* the number of cycles for processing slices of a picture */
> +	u32 encoded_cycle;   /* the number of cycles for encoding slices of a picture */
> +	u32 pic_distortion_low;
> +	u32 pic_distortion_high;
> +};
> +
> +enum ENC_PIC_CODE_OPTION {
> +	CODEOPT_ENC_HEADER_IMPLICIT = (1 << 0),
> +	CODEOPT_ENC_VCL             = (1 << 1), /* A flag to encode VCL nal unit explicitly */

BIT(0)
BIT(1)

> +};
> +
> +enum GOP_PRESET_IDX {
> +	PRESET_IDX_CUSTOM_GOP       = 0,    /* user defined GOP structure */
> +	PRESET_IDX_ALL_I            = 1,    /* all intra, gopsize = 1 */
> +	PRESET_IDX_IPP              = 2,    /* consecutive P, cyclic gopsize = 1  */
> +	PRESET_IDX_IBBB             = 3,    /* consecutive B, cyclic gopsize = 1  */
> +	PRESET_IDX_IBPBP            = 4,    /* gopsize = 2  */
> +	PRESET_IDX_IBBBP            = 5,    /* gopsize = 4  */
> +	PRESET_IDX_IPPPP            = 6,    /* consecutive P, cyclic gopsize = 4 */
> +	PRESET_IDX_IBBBB            = 7,    /* consecutive B, cyclic gopsize = 4 */
> +	PRESET_IDX_RA_IB            = 8,    /* random access, cyclic gopsize = 8 */
> +	PRESET_IDX_IPP_SINGLE       = 9,    /* consecutive P, cyclic gopsize = 1, with single ref */
> +};
> +
> +struct sec_axi_info {
> +	struct {
> +		int             use_ip_enable;
> +		int             use_lf_row_enable;
> +		int             use_bit_enable;
> +		int             use_enc_rdo_enable;
> +		int             use_enc_lf_enable;
> +	} wave;
> +	int             buf_size;

Delete all the extra spaces in this struct.

> +	dma_addr_t buf_base;
> +};
> +
> +struct dec_info {
> +	struct dec_open_param    open_param;
> +	struct dec_initial_info  initial_info;
> +	struct dec_initial_info  new_seq_info;     /* temporal new sequence information */
> +	dma_addr_t stream_wr_ptr;
> +	dma_addr_t stream_rd_ptr;
> +	int             stream_endflag;

Make this a bool.  Get rid of the "flag" in the name.

> +	int             frame_display_flag;

I haven't looked at the patches bug it's not clear how this is used.
It's a bitmask so it should be unsigned and probably named something
plural.

> +	dma_addr_t stream_buf_start_addr;
> +	dma_addr_t stream_buf_end_addr;
> +	int             stream_buf_size;
> +	struct vpu_buf    vb_mv[MAX_REG_FRAME];
> +	struct vpu_buf    vb_fbc_y_tbl[MAX_REG_FRAME];
> +	struct vpu_buf    vb_fbc_c_tbl[MAX_REG_FRAME];
> +	int             num_fbs_for_decoding;
> +	int             num_fbs_for_wtl;
> +	int             stride;
> +	int             rotation_enable;
> +	int             mirror_enable;
> +	int             dering_enable;

Make these bool.

> +	enum mirror_direction mirror_direction;
> +	int             rotation_angle;
> +	struct frame_buffer     rotator_output;
> +	int             rotator_stride;
> +	int             initial_info_obtained;
> +	struct sec_axi_info          sec_axi_info;
> +	int seq_init_escape;
> +	dma_addr_t user_data_buf_addr;
> +	u32          user_data_enable;
> +	int             user_data_buf_size;
> +	int             frame_start_pos;
> +	int             frame_end_pos;
> +	struct vpu_buf    vb_work;
> +	struct vpu_buf    vb_task;
> +	struct dec_output_info   dec_out_info[MAX_GDI_IDX];
> +	int             reorder_enable;
> +	int             thumbnail_mode;
> +	int             seq_change_mask;
> +	enum temporal_id_mode  temp_id_select_mode;
> +	s32           target_temp_id;
> +	s32           target_spatial_id;
> +	s32           instance_queue_count;
> +	s32           report_queue_count;
> +	u32          first_cycle_check;
> +	u32          cycle_per_tick;
> +	u32          product_code;
> +	u32          vlc_buf_size;
> +	u32          param_buf_size;
> +};
> +
> +struct enc_info {
> +	struct enc_open_param        open_param;
> +	struct enc_initial_info      initial_info;
> +	dma_addr_t     stream_rd_ptr;
> +	dma_addr_t     stream_wr_ptr;
> +	dma_addr_t     stream_buf_start_addr;
> +	dma_addr_t     stream_buf_end_addr;
> +	int                 stream_buf_size;
> +	int                 num_frame_buffers;
> +	int                 stride;
> +	int                 rotation_enable;
> +	int                 mirror_enable;
> +	enum mirror_direction     mirror_direction;
> +	int                 rotation_angle;
> +	int                 initial_info_obtained;
> +	int                 ring_buffer_enable;
> +	struct sec_axi_info          sec_axi_info;
> +	struct enc_sub_frame_sync_config sub_frame_sync_config;
> +	int                 line_buf_int_en;
> +	struct vpu_buf      vb_work;
> +	struct vpu_buf      vb_mv;                   /* col_mv buffer */
> +	struct vpu_buf      vb_fbc_y_tbl;              /* FBC luma table buffer */
> +	struct vpu_buf      vb_fbc_c_tbl;              /* FBC chroma table buffer */
> +	struct vpu_buf      vb_sub_sam_buf;            /* sub-sampled buffer for ME */
> +	struct vpu_buf      vb_task;
> +	u64          cur_pts;             /* current timestamp in 90_k_hz */
> +	u64          pts_map[32];         /* PTS mapped with source frame index */
> +	u32          instance_queue_count;
> +	u32          report_queue_count;
> +	u32          first_cycle_check;
> +	u32          cycle_per_tick;
> +	u32          product_code;
> +	u32          vlc_buf_size;
> +	u32          param_buf_size;
> +};
> +
> +struct vpu_device {
> +	struct device *dev;
> +	struct v4l2_device   v4l2_dev;
> +	struct v4l2_m2m_dev *v4l2_m2m_dev;
> +	struct video_device *video_dev_dec;
> +	struct video_device *video_dev_enc;
> +	struct mutex         dev_lock; /* the lock for the src,dst v4l2 queues */
> +	struct mutex	     hw_lock; /* lock hw condigurations */
> +	struct kfifo         irq_status;
> +	int                  irq;
> +	struct completion    irq_done;
> +	enum product_id	     product;
> +	struct vpu_attr	     attr;
> +	struct vpu_buf  common_mem;
> +	u32          last_performance_cycles;
> +	struct vpu_buf sram_buf;
> +	struct vpu_buf vdb_register;
> +	int product_code;
> +	struct ida inst_ida;
> +	struct clk *clk;
> +};
> +
> +struct vpu_instance;
> +
> +struct vpu_instance_ops {
> +	void (*start_process)(struct vpu_instance *inst);
> +	void (*stop_process)(struct vpu_instance *inst);
> +	void (*finish_process)(struct vpu_instance *inst);
> +};
> +
> +struct vpu_instance {
> +	struct v4l2_fh                 v4l2_fh;
> +	struct v4l2_ctrl_handler       v4l2_ctrl_hdl;
> +	struct vpu_device             *dev;
> +
> +	struct v4l2_pix_format_mplane  src_fmt;
> +	struct v4l2_pix_format_mplane  dst_fmt;
> +	enum v4l2_colorspace           colorspace;
> +	enum v4l2_xfer_func            xfer_func;
> +	enum v4l2_ycbcr_encoding       ycbcr_enc;
> +	enum v4l2_quantization         quantization;
> +	enum v4l2_hsv_encoding         hsv_enc;
> +
> +	enum vpu_instance_state        state;
> +	enum vpu_instance_type         type;
> +	const struct vpu_instance_ops *ops;
> +
> +	enum wave_std		       std;
> +	int			       id;
> +	union {
> +		struct enc_info enc_info;
> +		struct dec_info dec_info;
> +	} *codec_info;
> +	struct frame_buffer                    frame_buf[MAX_REG_FRAME];
> +	struct vpu_buf                 frame_vbuf[MAX_REG_FRAME];
> +	u32                            min_dst_frame_buf_count;
> +	u32                            queued_src_buf_num;
> +	u32                            queued_dst_buf_num;
> +	u64                            timestamp;
> +
> +	spinlock_t                     bitstream_lock; /* lock the src buf queue of the m2m ctx */
> +	struct vpu_buf                 bitstream_vbuf;
> +	bool                           thumbnail_mode;
> +
> +	unsigned int                   min_src_frame_buf_count;
> +	unsigned int                   rot_angle;
> +	unsigned int                   mirror_direction;
> +	unsigned int                   profile;
> +	unsigned int                   level;
> +	unsigned int                   bit_depth;
> +	unsigned int                   frame_rate;
> +	unsigned int                   vbv_buf_size;
> +	unsigned int                   min_qp_i;
> +	unsigned int                   max_qp_i;
> +	unsigned int                   min_qp_p;
> +	unsigned int                   max_qp_p;
> +	unsigned int                   min_qp_b;
> +	unsigned int                   max_qp_b;
> +};
> +
> +void vdi_write_register(struct vpu_device *vpu_device, unsigned int addr, unsigned int data);
> +unsigned int vdi_read_register(struct vpu_device *vpu_dev, unsigned int addr);
> +int vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb);
> +int vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb);
> +int vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb, size_t offset, unsigned char *data, int len, int endian);
> +int vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian);
> +void vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb);
> +
> +enum ret_code vpu_init_with_bitcode(struct device *dev, const uint16_t *bitcode, uint32_t size_in_word);
> +void vpu_clear_interrupt_ex(struct vpu_instance *inst, int32_t intr_flag);
> +enum ret_code vpu_get_version_info(struct device *dev, uint32_t *version_info, uint32_t *revision, uint32_t *product_id);
> +int vpu_dec_open_api(struct vpu_instance *vpu_inst, struct dec_open_param *pop);
> +enum ret_code vpu_dec_close(struct vpu_instance *inst);
> +enum ret_code vpu_dec_issue_seq_init(struct vpu_instance *inst);
> +enum ret_code vpu_dec_complete_seq_init(struct vpu_instance *inst, struct dec_initial_info *info);
> +enum ret_code vpu_dec_register_frame_buffer_ex(struct vpu_instance *inst, int num_of_dec_fbs,
> +					       int num_of_display_fbs, int stride, int height, int map_type);
> +enum ret_code vpu_dec_start_one_frame(struct vpu_instance *inst, struct dec_param *param);
> +enum ret_code vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_info *info);
> +enum ret_code vpu_dec_give_command(struct vpu_instance *inst, enum codec_command cmd, void *parameter);
> +enum ret_code vpu_dec_get_bitstream_buffer(struct vpu_instance *inst, dma_addr_t *prd_prt,
> +					   dma_addr_t *pwr_ptr, uint32_t *size);
> +enum ret_code vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int size);
> +enum ret_code vpu_dec_clr_disp_flag(struct vpu_instance *inst, int index);
> +
> +int vpu_enc_open_api(struct vpu_instance *vpu_inst, struct enc_open_param *enc_op_param);
> +enum ret_code vpu_enc_close(struct vpu_instance *inst);
> +enum ret_code vpu_enc_issue_seq_init(struct vpu_instance *inst);
> +enum ret_code vpu_enc_complete_seq_init(struct vpu_instance *inst, struct enc_initial_info *info);
> +enum ret_code vpu_enc_register_frame_buffer(struct vpu_instance *inst, int num, int stride,
> +					    int height, enum tiled_map_type map_type);
> +enum ret_code vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_param *param);
> +enum ret_code vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_output_info *info);
> +enum ret_code vpu_enc_give_command(struct vpu_instance *inst, enum codec_command cmd, void *parameter);
> +
> +#endif
> +
> diff --git a/drivers/staging/media/wave5/vpuapi/vpuconfig.h b/drivers/staging/media/wave5/vpuapi/vpuconfig.h
> new file mode 100644
> index 000000000000..e49f25efcaa4
> --- /dev/null
> +++ b/drivers/staging/media/wave5/vpuapi/vpuconfig.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Wave5 series multi-standard codec IP - product config definitions
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +
> +#ifndef _VPU_CONFIG_H_
> +#define _VPU_CONFIG_H_
> +
> +#define WAVE517_CODE                    0x5170
> +#define WAVE537_CODE                    0x5370
> +#define WAVE511_CODE                    0x5110
> +#define WAVE521_CODE                    0x5210
> +#define WAVE521C_CODE                   0x521c
> +#define WAVE521C_DUAL_CODE              0x521d  // wave521 dual core
> +#define WAVE521E1_CODE                  0x5211
> +
> +#define PRODUCT_CODE_W_SERIES(x)        ((x) == WAVE517_CODE || (x) == WAVE537_CODE ||   \
> +					(x) == WAVE511_CODE || (x) == WAVE521_CODE ||    \
> +		(x) == WAVE521E1_CODE || (x) == WAVE521C_CODE || (x) == WAVE521C_DUAL_CODE)
> +
> +#define WAVE517_WORKBUF_SIZE            (2 * 1024 * 1024)
> +#define WAVE521ENC_WORKBUF_SIZE         (128 * 1024)      //HEVC 128K, AVC 40K
> +#define WAVE521DEC_WORKBUF_SIZE         (1784 * 1024)
> +
> +#define MAX_NUM_INSTANCE                32
> +
> +#define W5_MIN_ENC_PIC_WIDTH            256
> +#define W5_MIN_ENC_PIC_HEIGHT           128
> +#define W5_MAX_ENC_PIC_WIDTH            8192
> +#define W5_MAX_ENC_PIC_HEIGHT           8192
> +
> +//  application specific configuration
> +#define VPU_ENC_TIMEOUT                 60000
> +#define VPU_DEC_TIMEOUT                 60000
> +#define VPU_BUSY_CHECK_TIMEOUT          10000
> +
> +#define HOST_ENDIAN                     VDI_128BIT_LITTLE_ENDIAN
> +#define VPU_FRAME_ENDIAN                HOST_ENDIAN
> +#define VPU_STREAM_ENDIAN               HOST_ENDIAN
> +#define VPU_USER_DATA_ENDIAN            HOST_ENDIAN
> +#define VPU_SOURCE_ENDIAN               HOST_ENDIAN
> +
> +// for WAVE encoder
> +#define USE_SRC_PRP_AXI         0
> +#define USE_SRC_PRI_AXI         1
> +#define DEFAULT_SRC_AXI         USE_SRC_PRP_AXI
> +
> +/************************************************************************/
> +/* VPU COMMON MEMORY                                                    */
> +/************************************************************************/
> +#define VLC_BUF_NUM                     (3)
> +
> +#define COMMAND_QUEUE_DEPTH             (4)
> +
> +#define W5_REMAP_INDEX0                 0
> +#define W5_REMAP_INDEX1                 1
> +#define W5_REMAP_MAX_SIZE               (1024 * 1024)
> +
> +#define WAVE5_MAX_CODE_BUF_SIZE         (2 * 1024 * 1024)
> +#define WAVE5_TEMPBUF_OFFSET            WAVE5_MAX_CODE_BUF_SIZE
> +#define WAVE5_TEMPBUF_SIZE              (1024 * 1024)
> +
> +#define SIZE_COMMON                 (WAVE5_MAX_CODE_BUF_SIZE + WAVE5_TEMPBUF_SIZE)
> +
> +//=====4. VPU REPORT MEMORY  ======================//
> +
> +#define WAVE5_UPPER_PROC_AXI_ID     0x0
> +
> +#define WAVE5_PROC_AXI_ID           0x0
> +#define WAVE5_PRP_AXI_ID            0x0
> +#define WAVE5_FBD_Y_AXI_ID          0x0
> +#define WAVE5_FBC_Y_AXI_ID          0x0
> +#define WAVE5_FBD_C_AXI_ID          0x0
> +#define WAVE5_FBC_C_AXI_ID          0x0
> +#define WAVE5_SEC_AXI_ID            0x0
> +#define WAVE5_PRI_AXI_ID            0x0
> +
> +#endif  /* _VPU_CONFIG_H_ */
> +
> diff --git a/drivers/staging/media/wave5/vpuapi/vpuerror.h b/drivers/staging/media/wave5/vpuapi/vpuerror.h
> new file mode 100644
> index 000000000000..3b8884ad9e99
> --- /dev/null
> +++ b/drivers/staging/media/wave5/vpuapi/vpuerror.h
> @@ -0,0 +1,455 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Wave5 series multi-standard codec IP - error values
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +
> +#ifndef ERROR_CODE_H_INCLUDED
> +#define ERROR_CODE_H_INCLUDED
> +
> +/*
> + * WAVE5
> + */
> +
> +/************************************************************************/
> +/* WAVE5 COMMON SYSTEM ERROR (FAIL_REASON)                              */
> +/************************************************************************/
> +#define WAVE5_SYSERR_QUEUEING_FAIL                                     0x00000001
> +#define WAVE5_SYSERR_ACCESS_VIOLATION_HW                               0x00000040
> +#define WAVE5_SYSERR_BUS_ERROR                                         0x00000200
> +#define WAVE5_SYSERR_DOUBLE_FAULT                                      0x00000400
> +#define WAVE5_SYSERR_RESULT_NOT_READY                                  0x00000800
> +#define WAVE5_SYSERR_VPU_STILL_RUNNING                                 0x00001000
> +#define WAVE5_SYSERR_UNKNOWN_CMD                                       0x00002000
> +#define WAVE5_SYSERR_UNKNOWN_CODEC_STD                                 0x00004000
> +#define WAVE5_SYSERR_UNKNOWN_QUERY_OPTION                              0x00008000
> +#define WAVE5_SYSERR_VLC_BUF_FULL                                      0x00010000
> +#define WAVE5_SYSERR_WATCHDOG_TIMEOUT                                  0x00020000
> +#define WAVE5_SYSERR_VCPU_TIMEOUT                                      0x00080000
> +#define WAVE5_SYSERR_TEMP_SEC_BUF_OVERFLOW                             0x00200000
> +#define WAVE5_SYSERR_NEED_MORE_TASK_BUF                                0x00400000
> +#define WAVE5_SYSERR_PRESCAN_ERR                                       0x00800000
> +#define WAVE5_SYSERR_ENC_GBIN_OVERCONSUME                              0x01000000
> +#define WAVE5_SYSERR_ENC_MAX_ZERO_DETECT                               0x02000000
> +#define WAVE5_SYSERR_ENC_LVL_FIRST_ERROR                               0x04000000
> +#define WAVE5_SYSERR_ENC_EG_RANGE_OVER                                 0x08000000
> +#define WAVE5_SYSERR_ENC_IRB_FRAME_DROP                                0x10000000
> +#define WAVE5_SYSERR_INPLACE_V                                         0x20000000
> +#define WAVE5_SYSERR_FATAL_VPU_HANGUP                                  0xf0000000
> +
> +/************************************************************************/
> +/* WAVE5 COMMAND QUEUE ERROR (FAIL_REASON)                              */
> +/************************************************************************/
> +#define WAVE5_CMDQ_ERR_NOT_QUEABLE_CMD                                 0x00000001
> +#define WAVE5_CMDQ_ERR_SKIP_MODE_ENABLE                                0x00000002
> +#define WAVE5_CMDQ_ERR_INST_FLUSHING                                   0x00000003
> +#define WAVE5_CMDQ_ERR_INST_INACTIVE                                   0x00000004
> +#define WAVE5_CMDQ_ERR_QUEUE_FAIL                                      0x00000005
> +#define WAVE5_CMDQ_ERR_CMD_BUF_FULL                                    0x00000006
> +
> +/************************************************************************/
> +/* WAVE5 ERROR ON DECODER (ERR_INFO)                                    */
> +/************************************************************************/
> +// HEVC
> +#define HEVC_SPSERR_SEQ_PARAMETER_SET_ID                               0x00001000
> +#define HEVC_SPSERR_CHROMA_FORMAT_IDC                                  0x00001001
> +#define HEVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES                          0x00001002
> +#define HEVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES                         0x00001003
> +#define HEVC_SPSERR_CONF_WIN_LEFT_OFFSET                               0x00001004
> +#define HEVC_SPSERR_CONF_WIN_RIGHT_OFFSET                              0x00001005
> +#define HEVC_SPSERR_CONF_WIN_TOP_OFFSET                                0x00001006
> +#define HEVC_SPSERR_CONF_WIN_BOTTOM_OFFSET                             0x00001007
> +#define HEVC_SPSERR_BIT_DEPTH_LUMA_MINUS8                              0x00001008
> +#define HEVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8                            0x00001009
> +#define HEVC_SPSERR_LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4                  0x0000100A
> +#define HEVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING                          0x0000100B
> +#define HEVC_SPSERR_SPS_MAX_NUM_REORDER_PICS                           0x0000100C
> +#define HEVC_SPSERR_SPS_MAX_LATENCY_INCREASE                           0x0000100D
> +#define HEVC_SPSERR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3             0x0000100E
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE           0x0000100F
> +#define HEVC_SPSERR_LOG2_MIN_TRANSFORM_BLOCK_SIZE_MINUS2               0x00001010
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_TRANSFORM_BLOCK_SIZE             0x00001011
> +#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTER                0x00001012
> +#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA                0x00001013
> +#define HEVC_SPSERR_SCALING_LIST                                       0x00001014
> +#define HEVC_SPSERR_LOG2_DIFF_MIN_PCM_LUMA_CODING_BLOCK_SIZE_MINUS3    0x00001015
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE       0x00001016
> +#define HEVC_SPSERR_NUM_SHORT_TERM_REF_PIC_SETS                        0x00001017
> +#define HEVC_SPSERR_NUM_LONG_TERM_REF_PICS_SPS                         0x00001018
> +#define HEVC_SPSERR_GBU_PARSING_ERROR                                  0x00001019
> +#define HEVC_SPSERR_EXTENSION_FLAG                                     0x0000101A
> +#define HEVC_SPSERR_VUI_ERROR                                          0x0000101B
> +#define HEVC_SPSERR_ACTIVATE_SPS                                       0x0000101C
> +#define HEVC_SPSERR_PROFILE_SPACE                                      0x0000101D
> +#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID                           0x00002000
> +#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID                           0x00002001
> +#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1               0x00002002
> +#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1               0x00002003
> +#define HEVC_PPSERR_INIT_QP_MINUS26                                    0x00002004
> +#define HEVC_PPSERR_DIFF_CU_QP_DELTA_DEPTH                             0x00002005
> +#define HEVC_PPSERR_PPS_CB_QP_OFFSET                                   0x00002006
> +#define HEVC_PPSERR_PPS_CR_QP_OFFSET                                   0x00002007
> +#define HEVC_PPSERR_NUM_TILE_COLUMNS_MINUS1                            0x00002008
> +#define HEVC_PPSERR_NUM_TILE_ROWS_MINUS1                               0x00002009
> +#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1                                0x0000200A
> +#define HEVC_PPSERR_ROW_HEIGHT_MINUS1                                  0x0000200B
> +#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2                               0x0000200C
> +#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2                                 0x0000200D
> +#define HEVC_PPSERR_SCALING_LIST                                       0x0000200E
> +#define HEVC_PPSERR_LOG2_PARALLEL_MERGE_LEVEL_MINUS2                   0x0000200F
> +#define HEVC_PPSERR_NUM_TILE_COLUMNS_RANGE_OUT                         0x00002010
> +#define HEVC_PPSERR_NUM_TILE_ROWS_RANGE_OUT                            0x00002011
> +#define HEVC_PPSERR_MORE_RBSP_DATA_ERROR                               0x00002012
> +#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT                 0x00002013
> +#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT                 0x00002014
> +#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT     0x00002015
> +#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT     0x00002016
> +#define HEVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT                         0x00002017
> +#define HEVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT                         0x00002018
> +#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1_RANGE_OUT                      0x00002019
> +#define HEVC_PPSERR_ROW_HEIGHT_MINUS1_RANGE_OUT                        0x00002020
> +#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2_RANGE_OUT                     0x00002021
> +#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2_RANGE_OUT                       0x00002022
> +#define HEVC_SHERR_SLICE_PIC_PARAMETER_SET_ID                          0x00003000
> +#define HEVC_SHERR_ACTIVATE_PPS                                        0x00003001
> +#define HEVC_SHERR_ACTIVATE_SPS                                        0x00003002
> +#define HEVC_SHERR_SLICE_TYPE                                          0x00003003
> +#define HEVC_SHERR_FIRST_SLICE_IS_DEPENDENT_SLICE                      0x00003004
> +#define HEVC_SHERR_SHORT_TERM_REF_PIC_SET_SPS_FLAG                     0x00003005
> +#define HEVC_SHERR_SHORT_TERM_REF_PIC_SET                              0x00003006
> +#define HEVC_SHERR_SHORT_TERM_REF_PIC_SET_IDX                          0x00003007
> +#define HEVC_SHERR_NUM_LONG_TERM_SPS                                   0x00003008
> +#define HEVC_SHERR_NUM_LONG_TERM_PICS                                  0x00003009
> +#define HEVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE                          0x0000300A
> +#define HEVC_SHERR_DELTA_POC_MSB_CYCLE_LT                              0x0000300B
> +#define HEVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1                        0x0000300C
> +#define HEVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1                        0x0000300D
> +#define HEVC_SHERR_COLLOCATED_REF_IDX                                  0x0000300E
> +#define HEVC_SHERR_PRED_WEIGHT_TABLE                                   0x0000300F
> +#define HEVC_SHERR_FIVE_MINUS_MAX_NUM_MERGE_CAND                       0x00003010
> +#define HEVC_SHERR_SLICE_QP_DELTA                                      0x00003011
> +#define HEVC_SHERR_SLICE_QP_DELTA_IS_OUT_OF_RANGE                      0x00003012
> +#define HEVC_SHERR_SLICE_CB_QP_OFFSET                                  0x00003013
> +#define HEVC_SHERR_SLICE_CR_QP_OFFSET                                  0x00003014
> +#define HEVC_SHERR_SLICE_BETA_OFFSET_DIV2                              0x00003015
> +#define HEVC_SHERR_SLICE_TC_OFFSET_DIV2                                0x00003016
> +#define HEVC_SHERR_NUM_ENTRY_POINT_OFFSETS                             0x00003017
> +#define HEVC_SHERR_OFFSET_LEN_MINUS1                                   0x00003018
> +#define HEVC_SHERR_SLICE_SEGMENT_HEADER_EXTENSION_LENGTH               0x00003019
> +#define HEVC_SHERR_WRONG_POC_IN_STILL_PICTURE_PROFILE                  0x0000301A
> +#define HEVC_SHERR_SLICE_TYPE_ERROR_IN_STILL_PICTURE_PROFILE           0x0000301B
> +#define HEVC_SHERR_PPS_ID_NOT_EQUAL_PREV_VALUE                         0x0000301C
> +#define HEVC_SPECERR_OVER_PICTURE_WIDTH_SIZE                           0x00004000
> +#define HEVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE                          0x00004001
> +#define HEVC_SPECERR_OVER_CHROMA_FORMAT                                0x00004002
> +#define HEVC_SPECERR_OVER_BIT_DEPTH                                    0x00004003
> +#define HEVC_SPECERR_OVER_BUFFER_OVER_FLOW                             0x00004004
> +#define HEVC_SPECERR_OVER_WRONG_BUFFER_ACCESS                          0x00004005
> +#define HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND                             0x00005000
> +#define HEVC_ETCERR_DEC_PIC_VCL_NOT_FOUND                              0x00005001
> +#define HEVC_ETCERR_NO_VALID_SLICE_IN_AU                               0x00005002
> +#define HEVC_ETCERR_INPLACE_V                                          0x0000500F
> +
> +// AVC
> +#define AVC_SPSERR_SEQ_PARAMETER_SET_ID                                0x00001000
> +#define AVC_SPSERR_CHROMA_FORMAT_IDC                                   0x00001001
> +#define AVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES                           0x00001002
> +#define AVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES                          0x00001003
> +#define AVC_SPSERR_CONF_WIN_LEFT_OFFSET                                0x00001004
> +#define AVC_SPSERR_CONF_WIN_RIGHT_OFFSET                               0x00001005
> +#define AVC_SPSERR_CONF_WIN_TOP_OFFSET                                 0x00001006
> +#define AVC_SPSERR_CONF_WIN_BOTTOM_OFFSET                              0x00001007
> +#define AVC_SPSERR_BIT_DEPTH_LUMA_MINUS8                               0x00001008
> +#define AVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8                             0x00001009
> +#define AVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING                           0x0000100B
> +#define AVC_SPSERR_SPS_MAX_NUM_REORDER_PICS                            0x0000100C
> +#define AVC_SPSERR_SCALING_LIST                                        0x00001014
> +#define AVC_SPSERR_GBU_PARSING_ERROR                                   0x00001019
> +#define AVC_SPSERR_VUI_ERROR                                           0x0000101B
> +#define AVC_SPSERR_ACTIVATE_SPS                                        0x0000101C
> +#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID                            0x00002000
> +#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID                            0x00002001
> +#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1                0x00002002
> +#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1                0x00002003
> +#define AVC_PPSERR_INIT_QP_MINUS26                                     0x00002004
> +#define AVC_PPSERR_PPS_CB_QP_OFFSET                                    0x00002006
> +#define AVC_PPSERR_PPS_CR_QP_OFFSET                                    0x00002007
> +#define AVC_PPSERR_SCALING_LIST                                        0x0000200E
> +#define AVC_PPSERR_MORE_RBSP_DATA_ERROR                                0x00002012
> +#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT                  0x00002013
> +#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT                  0x00002014
> +#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT      0x00002015
> +#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT      0x00002016
> +#define AVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT                          0x00002017
> +#define AVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT                          0x00002018
> +#define AVC_SHERR_SLICE_PIC_PARAMETER_SET_ID                           0x00003000
> +#define AVC_SHERR_ACTIVATE_PPS                                         0x00003001
> +#define AVC_SHERR_ACTIVATE_SPS                                         0x00003002
> +#define AVC_SHERR_SLICE_TYPE                                           0x00003003
> +#define AVC_SHERR_FIRST_MB_IN_SLICE                                    0x00003004
> +#define AVC_SHERR_RPLM                                                 0x00003006
> +#define AVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE                           0x0000300A
> +#define AVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1                         0x0000300C
> +#define AVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1                         0x0000300D
> +#define AVC_SHERR_PRED_WEIGHT_TABLE                                    0x0000300F
> +#define AVC_SHERR_SLICE_QP_DELTA                                       0x00003011
> +#define AVC_SHERR_SLICE_BETA_OFFSET_DIV2                               0x00003015
> +#define AVC_SHERR_SLICE_TC_OFFSET_DIV2                                 0x00003016
> +#define AVC_SHERR_DISABLE_DEBLOCK_FILTER_IDC                           0x00003017
> +#define AVC_SPECERR_OVER_PICTURE_WIDTH_SIZE                            0x00004000
> +#define AVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE                           0x00004001
> +#define AVC_SPECERR_OVER_CHROMA_FORMAT                                 0x00004002
> +#define AVC_SPECERR_OVER_BIT_DEPTH                                     0x00004003
> +#define AVC_SPECERR_OVER_BUFFER_OVER_FLOW                              0x00004004
> +#define AVC_SPECERR_OVER_WRONG_BUFFER_ACCESS                           0x00004005
> +#define AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND                              0x00005000
> +#define AVC_ETCERR_DEC_PIC_VCL_NOT_FOUND                               0x00005001
> +#define AVC_ETCERR_NO_VALID_SLICE_IN_AU                                0x00005002
> +#define AVC_ETCERR_ASO                                                 0x00005004
> +#define AVC_ETCERR_FMO                                                 0x00005005
> +#define AVC_ETCERR_INPLACE_V                                           0x0000500F
> +
> +// AV1
> +#define AV1_SPSERR_MAX_FRAME_WIDTH                                     0x00001001
> +#define AV1_SPSERR_MAX_FRAME_HEIGHT                                    0x00001002
> +#define AV1_SPSERR_ID_LEN_EXCEED_16                                    0x00001004
> +#define AV1_SPSERR_NOT_FOUND_FIRST_SPS                                 0x0000100A
> +#define AV1_SPSERR_SEQ_PROFILE                                         0x0000100B
> +#define AV1_SPSERR_STILL_PICTURE                                       0x0000100C
> +#define AV1_PPSERR_FRAME_SIZE_WIDTH                                    0x00002001
> +#define AV1_PPSERR_FRAME_SIZE_HEIGHT                                   0x00002002
> +#define AV1_PPSERR_SEEN_FRAME_HEADER                                   0x00002003
> +#define AV1_PPSERR_REF_VALID                                           0x00002007
> +#define AV1_PPSERR_LAST_ORDER_HINT                                     0x0000200B
> +#define AV1_PPSERR_GOLD_ORDER_HINT                                     0x0000200C
> +#define AV1_PPSERR_CODED_LOSSLESS_DELTA_Q                              0x0000200E
> +#define AV1_PPSERR_FILM_GRAIN_PARAM_REF_IDX                            0x0000200F
> +#define AV1_PPSERR_SEQ_CHANGE_BIT_DEPTH                                0x00002010
> +#define AV1_PPSERR_SEQ_CHANGE_PROFILE                                  0x00002012
> +#define AV1_PPSERR_SEQ_CHANGE_DETECTED_INTER                           0x00002013
> +#define AV1_PPSERR_NUM_Y_POINTS                                        0x00002014
> +#define AV1_PPSERR_POINT_Y_VALUE                                       0x00002015
> +#define AV1_PPSERR_NUM_CB_POINTS                                       0x00002016
> +#define AV1_PPSERR_POINT_CB_VALUE                                      0x00002017
> +#define AV1_PPSERR_NUM_CR_POINTS                                       0x00002018
> +#define AV1_PPSERR_POINT_CR_VALUE                                      0x00002019
> +#define AV1_PPSERR_SUBSAMPLING_FORMAT                                  0x0000201A
> +#define AV1_FRAMEERR_TILE_START_END_PRESENT                            0x00003001
> +#define AV1_FRAMEERR_SHOW_EXISING_FRAME                                0x00003002
> +#define AV1_TGERR_NUM_TILES_ZERO                                       0x00004001
> +#define AV1_TGERR_START_NOT_TILE_NUM                                   0x00004002
> +#define AV1_TGERR_END_LESS_THAN_TG_START                               0x00004003
> +#define AV1_TGERR_TILE_SIZE_GREATER_THAN_32M                           0x00004004
> +#define AV1_SPECERR_OVER_MAX_H_SIZE                                    0x00005001
> +#define AV1_SPECERR_OVER_MAX_V_SIZE                                    0x00005002
> +#define AV1_SPECERR_OVER_MAX_TILE_COLS                                 0x00005004
> +#define AV1_SPECERR_OVER_MAX_TILE_ROWS                                 0x00005005
> +#define AV1_SPECERR_OVER_TILE_SIZE                                     0x00005006
> +#define AV1_SPECERR_OVER_NUMTILES_GT_MAX_TILES                         0x00005007
> +#define AV1_ETCERR_OBU_HEADER                                          0x00006001
> +#define AV1_ETCERR_OBU_SIZE                                            0x00006003
> +#define AV1_ETCERR_OVERCONSUME                                         0x00006004
> +#define AV1_ETCERR_NOT_SUPPORTED_FEATURE                               0x00006005
> +#define AV1_ETCERR_RESILIENCE_FAIL                                     0x00006006
> +
> +// VP9
> +#define VP9_PICERR_FRAME_MARKER                                        0x00001000
> +#define VP9_PICERR_PROFILE                                             0x00001001
> +#define VP9_PICERR_SYNC_CODE                                           0x00001002
> +#define VP9_PICERR_PROFILE_COLOR_SAMPLE                                0x00001003
> +#define VP9_PICERR_FRAME_SIZE                                          0x00001004
> +#define VP9_PICERR_SEGMENT                                             0x00001005
> +#define VP9_PICERR_TILE                                                0x00001006
> +#define VP9_PICERR_PROFILE_COMP_MISMATCH_WITH_REF                      0x00001007
> +#define VP9_PICERR_COMP_DAT_OVER_CS                                    0x00001008
> +#define VP9_PICERR_COMP_TRAILING_BIT_ERR                               0x00001009
> +#define VP9_PICERR_MARKER                                              0x0000100A
> +#define VP9_PICERR_NOT_EXIST_REF_FRAME                                 0x0000100B
> +#define VP9_PICERR_UNINIT_CTX                                          0x0000100C
> +#define VP9_PICERR_FRAME_SIZE_LIMIT_BY_REF                             0x0000100D
> +#define VP9_SPECERR_OVER_PICTURE_WIDTH_SIZE                            0x00004000
> +#define VP9_SPECERR_OVER_PICTURE_HEIGHT_SIZE                           0x00004001
> +#define VP9_SPECERR_OVER_CHROMA_FORMAT                                 0x00004002
> +#define VP9_SPECERR_OVER_BIT_DEPTH                                     0x00004003
> +#define VP9_ETCERR_INIT_KEY_FRAME_NOT_FOUND                            0x00005000
> +#define VP9_ETCERR_FORBIDDEN_BS_MODE                                   0x00005004
> +#define VP9_ETCERR_SPP_OVER_CS_AU                                      0x00005005
> +
> +// AVS2
> +#define AVS2_SPSERR_PROFILE_ID                                         0x00001000
> +#define AVS2_SPSERR_LEVEL_ID                                           0x00001001
> +#define AVS2_SPSERR_HORIZONTAL_SIZE                                    0x00001002
> +#define AVS2_SPSERR_VERTICAL_SIZE                                      0x00001003
> +#define AVS2_SPSERR_CHROMA_FORMAT                                      0x00001004
> +#define AVS2_SPSERR_SAMPLE_PRECISION                                   0x00001005
> +#define AVS2_SPSERR_ENCODING_PRECISION                                 0x00001006
> +#define AVS2_SPSERR_LCU_SIZE                                           0x00001007
> +#define AVS2_SPSERR_WEIGHT_QUANT_MATRIX                                0x00001008
> +#define AVS2_SPSERR_NUM_OF_RCS                                         0x00001009
> +#define AVS2_SPSERR_REFERENCE_CONFIGURATION_SET                        0x0000100A
> +#define AVS2_SPSERR_OUTPUT_REORDER_DELAY                               0x0000100B
> +#define AVS2_PPSERR_BBV_DELAY                                          0x00002000
> +#define AVS2_PPSERR_TIME_CODE                                          0x00002001
> +#define AVS2_PPSERR_DECODE_ORDER_INDEX                                 0x00002002
> +#define AVS2_PPSERR_TEMPORAL_ID                                        0x00002003
> +#define AVS2_PPSERR_PICTURE_OUTPUT_DELAY                               0x00002004
> +#define AVS2_PPSERR_RCS_INDEX                                          0x00002005
> +#define AVS2_PPSERR_REFERENCE_CONFIGURATION_SET                        0x00002006
> +#define AVS2_PPSERR_BBV_CHECK_TIMES                                    0x00002007
> +#define AVS2_PPSERR_PICTURE_QP                                         0x00002008
> +#define AVS2_PPSERR_ALPHA_C_OFFSET                                     0x00002009
> +#define AVS2_PPSERR_BETA_OFFSET                                        0x0000200A
> +#define AVS2_PPSERR_CHROMA_QUANT_PARAM_DELTA_CB                        0x0000200B
> +#define AVS2_PPSERR_CHROMA_QUANT_PARAM_DELTA_CR                        0x0000200C
> +#define AVS2_PPSERR_WEIGHT_QUANT_PARAM_DELTA1                          0x0000200D
> +#define AVS2_PPSERR_WEIGHT_QUANT_PARAM_DELTA2                          0x0000200E
> +#define AVS2_PPSERR_PICTURE_CODING_TYPE                                0x0000200F
> +#define AVS2_PPSERR_ALF_FILTER_NUM_MINUS1                              0x00002010
> +#define AVS2_PPSERR_ALF_REGION_DISTANCE                                0x00002011
> +#define AVS2_PPSERR_ALF_COEFF_LUMA                                     0x00002012
> +#define AVS2_PPSERR_ALF_COEFF_CHROMA_CB                                0x00002013
> +#define AVS2_PPSERR_ALF_COEFF_CHROMA_CR                                0x00002014
> +#define AVS2_SHERR_SLICE_VERTICAL_POSITION                             0x00003000
> +#define AVS2_SHERR_SLICE_VERTICAL_POSITION_EXTENSION                   0x00003001
> +#define AVS2_SHERR_SLICE_HORIZONTAL_POSITION                           0x00003002
> +#define AVS2_SHERR_SLICE_HORIZONTAL_POSITION_EXTENSION                 0x00003003
> +#define AVS2_SHERR_FIXED_SLICE_QP                                      0x00003004
> +#define AVS2_SHERR_SLICE_QP                                            0x00003005
> +#define AVS2_SHERR_SLICE_SAO_ENABLE_FLAG                               0x00003006
> +#define AVS2_SHERR_AEC_BYTE_ALIGNMENT_BIT                              0x00003007
> +#define AVS2_SHERR_STREAM_END                                          0x00003008
> +#define AVS2_SPECERR_OVER_PICTURE_WIDTH_SIZE                           0x00004000
> +#define AVS2_SPECERR_OVER_PICTURE_HEIGHT_SIZE                          0x00004001
> +#define AVS2_SPECERR_OVER_CHROMA_FORMAT                                0x00004002
> +#define AVS2_SPECERR_OVER_BIT_DEPTH                                    0x00004003
> +#define AVS2_SPECERR_OVER_REF_TEMPORAL_ID                              0x00004004
> +#define AVS2_ETCERR_SPS_NOT_FOUND                                      0x00005000
> +#define AVS2_ETCERR_DEC_PIC_VCL_NOT_FOUND                              0x00005001
> +#define AVS2_ETCERR_NO_VALID_SLICE_IN_AU                               0x00005002
> +#define AVS2_ETCERR_PPS_ERROR                                          0x00005003
> +#define AVS2_ETCERR_SLICE_NUM_OVERFLOW                                 0x00005004
> +
> +/************************************************************************/
> +/* WAVE5 WARNING ON DECODER (WARN_INFO)                                 */
> +/************************************************************************/
> +// HEVC
> +#define HEVC_SPSWARN_MAX_SUB_LAYERS_MINUS1                             0x00000001
> +#define HEVC_SPSWARN_GENERAL_RESERVED_ZERO_44BITS                      0x00000002
> +#define HEVC_SPSWARN_RESERVED_ZERO_2BITS                               0x00000004
> +#define HEVC_SPSWARN_SUB_LAYER_RESERVED_ZERO_44BITS                    0x00000008
> +#define HEVC_SPSWARN_GENERAL_LEVEL_IDC                                 0x00000010
> +#define HEVC_SPSWARN_SPS_MAX_DEC_PIC_BUFFERING_VALUE_OVER              0x00000020
> +#define HEVC_SPSWARN_RBSP_TRAILING_BITS                                0x00000040
> +#define HEVC_SPSWARN_ST_RPS_UE_ERROR                                   0x00000080
> +#define HEVC_SPSWARN_EXTENSION_FLAG                                    0x01000000
> +#define HEVC_SPSWARN_REPLACED_WITH_PREV_SPS                            0x02000000
> +#define HEVC_PPSWARN_RBSP_TRAILING_BITS                                0x00000100
> +#define HEVC_PPSWARN_REPLACED_WITH_PREV_PPS                            0x00000200
> +#define HEVC_SHWARN_FIRST_SLICE_SEGMENT_IN_PIC_FLAG                    0x00001000
> +#define HEVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG                       0x00002000
> +#define HEVC_SHWARN_PIC_OUTPUT_FLAG                                    0x00004000
> +#define HEVC_SHWARN_DUPLICATED_SLICE_SEGMENT                           0x00008000
> +#define HEVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND                            0x00010000
> +#define HEVC_ETCWARN_MISSING_REFERENCE_PICTURE                         0x00020000
> +#define HEVC_ETCWARN_WRONG_TEMPORAL_ID                                 0x00040000
> +#define HEVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED                       0x00080000
> +#define HEVC_SPECWARN_OVER_PROFILE                                     0x00100000
> +#define HEVC_SPECWARN_OVER_LEVEL                                       0x00200000
> +#define HEVC_PRESWARN_PARSING_ERR                                      0x04000000
> +#define HEVC_PRESWARN_MVD_OUT_OF_RANGE                                 0x08000000
> +#define HEVC_PRESWARN_CU_QP_DELTA_VAL_OUT_OF_RANGE                     0x09000000
> +#define HEVC_PRESWARN_COEFF_LEVEL_REMAINING_OUT_OF_RANGE               0x0A000000
> +#define HEVC_PRESWARN_PCM_ERR                                          0x0B000000
> +#define HEVC_PRESWARN_OVERCONSUME                                      0x0C000000
> +#define HEVC_PRESWARN_END_OF_SUBSET_ONE_BIT_ERR                        0x10000000
> +#define HEVC_PRESWARN_END_OF_SLICE_SEGMENT_FLAG                        0x20000000
> +
> +// AVC
> +#define AVC_SPSWARN_RESERVED_ZERO_2BITS                                0x00000004
> +#define AVC_SPSWARN_GENERAL_LEVEL_IDC                                  0x00000010
> +#define AVC_SPSWARN_RBSP_TRAILING_BITS                                 0x00000040
> +#define AVC_PPSWARN_RBSP_TRAILING_BITS                                 0x00000100
> +#define AVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG                        0x00002000
> +#define AVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND                             0x00010000
> +#define AVC_ETCWARN_MISSING_REFERENCE_PICTURE                          0x00020000
> +#define AVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED                        0x00080000
> +#define AVC_SPECWARN_OVER_PROFILE                                      0x00100000
> +#define AVC_SPECWARN_OVER_LEVEL                                        0x00200000
> +#define AVC_PRESWARN_MVD_RANGE_OUT                                     0x00400000
> +#define AVC_PRESWARN_MB_QPD_RANGE_OUT                                  0x00500000
> +#define AVC_PRESWARN_COEFF_RANGE_OUT                                   0x00600000
> +#define AVC_PRESWARN_MV_RANGE_OUT                                      0x00700000
> +#define AVC_PRESWARN_MB_SKIP_RUN_RANGE_OUT                             0x00800000
> +#define AVC_PRESWARN_MB_TYPE_RANGE_OUT                                 0x00900000
> +#define AVC_PRESWARN_SUB_MB_TYPE_RANGE_OUT                             0x00A00000
> +#define AVC_PRESWARN_CBP_RANGE_OUT                                     0x00B00000
> +#define AVC_PRESWARN_INTRA_CHROMA_PRED_MODE_RANGE_OUT                  0x00C00000
> +#define AVC_PRESWARN_REF_IDX_RANGE_OUT                                 0x00D00000
> +#define AVC_PRESWARN_COEFF_TOKEN_RANGE_OUT                             0x00E00000
> +#define AVC_PRESWARN_TOTAL_ZERO_RANGE_OUT                              0x00F00000
> +#define AVC_PRESWARN_RUN_BEFORE_RANGE_OUT                              0x01000000
> +#define AVC_PRESWARN_OVERCONSUME                                       0x01100000
> +#define AVC_PRESWARN_MISSING_SLICE                                     0x01200000
> +
> +// AV1
> +#define AV1_SPSWARN_OBU_EXTENTION_FLAG_ZERO                            0x00001000
> +#define AV1_SPSWARN_DUPLICATE_OPERATING_POINT_IDX                      0x00001001
> +#define AV1_SPSWARN_MC_IDENTIY_SUBSAMPLING_X                           0x00001002
> +#define AV1_PPSWARN_MC_IDENTIY_SUBSAMPLING_Y                           0x00001003
> +#define AV1_SPSWARN_NUM_UNITS_IN_DISPLAY_TICK                          0x00001004
> +#define AV1_SPSWARN_TIME_SCALE_ZERO                                    0x00001005
> +#define AV1_SPSWARN_NUM_TICKS_PER_PICTURE                              0x00001006
> +#define AV1_PPSWARN_TILE_WIDTH                                         0x00002001
> +#define AV1_PPSWARN_TILE_HEIGHT                                        0x00002002
> +#define AV1_PPSWARN_SHOW_EXISTING_KEY_FRAME_OUTPUT                     0x00002004
> +#define AV1_PPSWARN_DIFF_FRAME_ID                                      0x00002008
> +#define AV1_PPSWARN_CURRENT_FRAME_ID                                   0x00002010
> +#define AV1_PPSWARN_REFRESH_FRAME_FLAGS                                0x00002020
> +#define AV1_PPSWARN_DISPALY_ID                                         0x00002040
> +#define AV1_PPSWARN_PREV_FRAME_SHOWABLE_FLAG_ZERO                      0x00002080
> +#define AV1_PPSWARN_EXPECTED_FRAME_ID                                  0x00002100
> +#define AV1_SPECWARN_OVER_MAX_TILE_AREA_SB                             0x00005000
> +#define AV1_SPECWARN_OVER_MAX_PIC_SIZE                                 0x00005001
> +#define AV1_ETCWARN_OBU_EXTENTION_FLAG                                 0x00006000
> +#define AV1_TGWARN_TRAIL_BIT_POS                                       0x00400000
> +#define AV1_TGWARN_TRAIL_PAD_BIT                                       0x00800000
> +#define AV1_TGWARN_SYM_MAX_OVER                                        0x01000000
> +#define AV1_TGWARN_EXP_GOLB_OVER                                       0x02000000
> +#define AV1_TGWARN_MV_NOT_VAILD                                        0x04000000
> +
> +// VP9
> +#define VP9_PICWARN_COLOR_SPACE_MISMATCH_WITH_REF                      0x00001000
> +#define VP9_PRESWARN_OVERCONSUME                                       0x00400000
> +#define VP9_PRESWARN_TRAILING_BITS                                     0x00800000
> +#define VP9_PRESWARN_MARKER                                            0x01000000
> +#define VP9_PRESWARN_MV_RANGE_OVER                                     0x02000000
> +#define VP9_PRESWARN_MISIZE_SEG_LVL_ACTIVE                             0x04000000
> +
> +// AVS2
> +#define AVS2_ETCWARN_INIT_SEQ_VCL_NOT_FOUND                            0x00010000
> +#define AVS2_ETCWARN_MISSING_REFERENCE_PICTURE                         0x00020000
> +#define AVS2_ETCWARN_WRONG_TEMPORAL_ID                                 0x00040000
> +#define AVS2_ETCWARN_ERROR_PICTURE_IS_REFERENCED                       0x00080000
> +#define AVS2_ETCWARN_REF_WRONG_TEMPORAL_ID                             0x00080001
> +#define AVS2_ETCWARN_SPS_ERROR                                         0x00080002
> +
> +/************************************************************************/
> +/* WAVE5 ERROR ON ENCODER (ERR_INFO)                                    */
> +/************************************************************************/
> +
> +/************************************************************************/
> +/* WAVE5 WARNING ON ENCODER (WARN_INFO)                                 */
> +/************************************************************************/
> +#define WAVE5_ETCWARN_FORCED_SPLIT_BY_CU8X8                            0x000000001
> +
> +/************************************************************************/
> +/* WAVE5 debug info (PRI_REASON)                                        */
> +/************************************************************************/
> +#define WAVE5_DEC_VCORE_VCE_HANGUP                                     0x0001
> +#define WAVE5_DEC_VCORE_UNDETECTED_SYNTAX_ERR                          0x0002
> +#define WAVE5_DEC_VCORE_MIB_BUSY                                       0x0003
> +#define WAVE5_DEC_VCORE_VLC_BUSY                                       0x0004
> +
> +#endif /* ERROR_CODE_H_INCLUDED */
> +
> diff --git a/drivers/staging/media/wave5/vpuapi/wave/wave5.c b/drivers/staging/media/wave5/vpuapi/wave/wave5.c
> new file mode 100644
> index 000000000000..ec36e1fc3339
> --- /dev/null
> +++ b/drivers/staging/media/wave5/vpuapi/wave/wave5.c
> @@ -0,0 +1,3626 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Wave5 series multi-standard codec IP - wave5 backend logic
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/iopoll.h>
> +#include "../../v4l2/vpu.h"
> +#include "wave5.h"
> +#include "wave5_regdefine.h"
> +
> +#define FIO_TIMEOUT         10000000
> +#define FIO_CTRL_READY		BIT(31)
> +#define FIO_CTRL_WRITE		BIT(16)
> +
> +static unsigned int vdi_fio_read_register(struct vpu_device *vpu_dev, unsigned int addr)
> +{
> +	u32 ctrl = 0;

Unused assignment.

> +	int ret;
> +
> +	ctrl = addr & 0xffff;
> +	vdi_write_register(vpu_dev, W5_VPU_FIO_CTRL_ADDR, ctrl);
> +	ret = read_poll_timeout(vdi_read_register, ctrl, ctrl & FIO_CTRL_READY,
> +				0, FIO_TIMEOUT, false, vpu_dev, W5_VPU_FIO_CTRL_ADDR);
> +	if (ret)
> +		return 0xffffffff;
> +	else

Delete the else statement.

> +		return vdi_read_register(vpu_dev, W5_VPU_FIO_DATA);
> +}
> +
> +static void vdi_fio_write_register(struct vpu_device *vpu_dev, unsigned int addr, unsigned int data)
> +{
> +	unsigned int ctrl;

Say u32 to be consistent.

> +
> +	vdi_write_register(vpu_dev, W5_VPU_FIO_DATA, data);
> +	ctrl = FIO_CTRL_WRITE | (addr & 0xffff);
> +	vdi_write_register(vpu_dev, W5_VPU_FIO_CTRL_ADDR, ctrl);
> +	read_poll_timeout(vdi_read_register, ctrl, ctrl & FIO_CTRL_READY,
> +			  0, FIO_TIMEOUT, false, vpu_dev, W5_VPU_FIO_CTRL_ADDR);
> +}
> +
> +static int vdi_wait_bus_busy(struct vpu_device *vpu_dev, int timeout, unsigned int addr)
> +{
> +	u32 gdi_status_check_value = 0x3f;
> +	u32 data;
> +	int ret;
> +
> +	if (vpu_dev->product_code == WAVE521C_CODE ||
> +	    vpu_dev->product_code == WAVE521_CODE ||
> +	    vpu_dev->product_code == WAVE521E1_CODE)
> +		gdi_status_check_value = 0x00ff1f3f;
> +
> +	ret = read_poll_timeout(vdi_read_register, data, data == gdi_status_check_value,
> +				0, timeout * 1000, false, vpu_dev, addr);
> +	if (ret)
> +		return -1;

	return read_poll_timeout();

Fix the callers to not expect -1 as an error code.

> +
> +	return 0;
> +}
> +
> +static int vdi_wait_vpu_busy(struct vpu_device *vpu_dev, int timeout, unsigned int addr)
> +{
> +	int ret;
> +	u32 data;
> +
> +	ret = read_poll_timeout(vdi_read_register, data, data == 0,
> +				0, timeout * 1000, false, vpu_dev, addr);
> +	if (ret)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static int vdi_wait_vcpu_bus_busy(struct vpu_device *vpu_dev, int timeout, unsigned int addr)
> +{
> +	int ret;
> +	u32 data;
> +
> +	ret = read_poll_timeout(vdi_fio_read_register, data, data == 0,
> +				0, timeout * 1000, false, vpu_dev, addr);
> +	if (ret)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +uint32_t wave5_vpu_is_init(struct vpu_device *vpu_dev)
> +{
> +	u32 pc;
> +
> +	pc = (uint32_t)vpu_read_reg(vpu_dev, W5_VCPU_CUR_PC);
> +
> +	return pc;
> +}
> +
> +static struct vpu_buf *get_sram_memory(struct vpu_device *vpu_dev)
> +{
> +	u32      sram_size = 0;
> +	u32  val = vpu_read_reg(vpu_dev, W5_PRODUCT_NUMBER);
> +
> +	if (vpu_dev->sram_buf.size)
> +		return &vpu_dev->sram_buf;
> +
> +	switch (val) {
> +	case WAVE511_CODE:
> +		/* 10bit profile : 8_kx8_k -> 129024, 4_kx2_k -> 64512
> +		 */
> +		sram_size = 0x1F800;
> +		break;
> +	case WAVE517_CODE:
> +		/* 10bit profile : 8_kx8_k -> 272384, 4_kx2_k -> 104448
> +		 */
> +		sram_size = 0x42800;
> +		break;
> +	case WAVE537_CODE:
> +		/* 10bit profile : 8_kx8_k -> 272384, 4_kx2_k -> 104448
> +		 */
> +		sram_size = 0x42800;
> +		break;
> +	case WAVE521_CODE:
> +		/* 10bit profile : 8_kx8_k -> 126976, 4_kx2_k -> 63488
> +		 */
> +		sram_size = 0x1F000;
> +		break;
> +	case WAVE521E1_CODE:
> +		/* 10bit profile : 8_kx8_k -> 126976, 4_kx2_k -> 63488
> +		 */
> +		sram_size = 0x1F000;
> +		break;
> +	case WAVE521C_CODE:
> +		/* 10bit profile : 8_kx8_k -> 129024, 4_kx2_k -> 64512
> +		 * NOTE: decoder > encoder
> +		 */
> +		sram_size = 0x1F800;
> +		break;
> +	case WAVE521C_DUAL_CODE:
> +		/* 10bit profile : 8_kx8_k -> 129024, 4_kx2_k -> 64512
> +		 * NOTE: decoder > encoder
> +		 */
> +		sram_size = 0x1F800;
> +		break;
> +	default:
> +		pr_err("invalid check product_code(%x)\n", val);
> +		break;
> +	}
> +
> +	// if we can know the sram address directly in vdi layer, we use it first for sdram address
> +	vpu_dev->sram_buf.daddr = 0;
> +	vpu_dev->sram_buf.size = sram_size;
> +	vpu_dev->sram_buf.vaddr = NULL;
> +
> +	return &vpu_dev->sram_buf;
> +}
> +
> +int32_t wave_vpu_get_product_id(struct vpu_device *vpu_dev)
> +{
> +	u32  product_id = PRODUCT_ID_NONE;
> +	u32  val;
> +
> +	val = vpu_read_reg(vpu_dev, W5_PRODUCT_NUMBER);
> +
> +	switch (val) {
> +	case WAVE521_CODE:
> +		product_id = PRODUCT_ID_521; break;
> +	case WAVE521C_CODE:
> +		product_id = PRODUCT_ID_521; break;
> +	case WAVE511_CODE:
> +		product_id = PRODUCT_ID_511; break;
> +	case WAVE521C_DUAL_CODE:
> +		product_id = PRODUCT_ID_521; break;
> +	case WAVE517_CODE:
> +		product_id = PRODUCT_ID_517; break;
> +	case WAVE537_CODE:
> +		product_id = PRODUCT_ID_517; break;
> +	case WAVE521E1_CODE:
> +		product_id = PRODUCT_ID_521; break;
> +	default:
> +		pr_err("check product_id(%x)\n", val);
> +		break;
> +	}
> +	return product_id;
> +}
> +
> +void wave5_bit_issue_command(struct vpu_instance *vpu_inst, uint32_t cmd)
> +{
> +	u32 instance_index = 0;
> +	u32 codec_mode     = 0;
> +
> +	instance_index = vpu_inst->id;
> +	codec_mode     = vpu_inst->std;
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_INSTANCE_INFO, (codec_mode << 16) |
> +			(instance_index & 0xffff));
> +	vpu_write_reg(vpu_inst->dev, W5_VPU_BUSY_STATUS,   1);
> +	vpu_write_reg(vpu_inst->dev, W5_COMMAND,           cmd);
> +
> +	dev_dbg(vpu_inst->dev->dev, "cmd=0x%x\n", cmd);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_VPU_HOST_INT_REQ, 1);
> +}
> +
> +static enum ret_code send_query(struct vpu_instance *vpu_inst, enum QUERY_OPT query_opt)
> +{
> +	// send QUERY cmd
> +	vpu_write_reg(vpu_inst->dev, W5_QUERY_OPTION, query_opt);
> +	vpu_write_reg(vpu_inst->dev, W5_VPU_BUSY_STATUS, 1);
> +	wave5_bit_issue_command(vpu_inst, W5_QUERY);
> +
> +	if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +		dev_warn(vpu_inst->dev->dev, "query timed out. opt=0x%x\n", query_opt);
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	if (!vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS))
> +		return RETCODE_FAILURE;
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +static enum ret_code setup_wave5_properties(struct device *dev)
> +{
> +	struct vpu_device *vpu_dev = (struct vpu_device *)dev_get_drvdata(dev);
> +	struct vpu_attr *p_attr = &vpu_dev->attr;
> +	u32      reg_val;
> +	u8 *str;
> +	enum ret_code     ret = RETCODE_SUCCESS;
> +	u32 hw_config_def0, hw_config_def1, hw_config_feature, hw_config_rev;
> +
> +	vpu_write_reg(vpu_dev, W5_QUERY_OPTION, GET_VPU_INFO);
> +	vpu_write_reg(vpu_dev, W5_VPU_BUSY_STATUS, 1);
> +	vpu_write_reg(vpu_dev, W5_COMMAND, W5_QUERY);
> +	vpu_write_reg(vpu_dev, W5_VPU_HOST_INT_REQ, 1);
> +	if (vdi_wait_vpu_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1)
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +
> +	if (!vpu_read_reg(vpu_dev, W5_RET_SUCCESS)) {
> +		ret = RETCODE_QUERY_FAILURE;

Return directly if possible.

	return RETCODE_QUERY_FAILURE;

Pull the remaining code in one indent level.

> +	} else {
> +		reg_val = vpu_read_reg(vpu_dev, W5_RET_PRODUCT_NAME);
> +		str    = (uint8_t *)&reg_val;
> +		p_attr->product_name[0] = str[3];
> +		p_attr->product_name[1] = str[2];
> +		p_attr->product_name[2] = str[1];
> +		p_attr->product_name[3] = str[0];
> +		p_attr->product_name[4] = 0;
> +
> +		p_attr->product_id       = wave_vpu_get_product_id(vpu_dev);
> +		p_attr->product_version  = vpu_read_reg(vpu_dev, W5_RET_PRODUCT_VERSION);
> +		p_attr->fw_version       = vpu_read_reg(vpu_dev, W5_RET_FW_VERSION);
> +		p_attr->customer_id      = vpu_read_reg(vpu_dev, W5_RET_CUSTOMER_ID);
> +		hw_config_def0    = vpu_read_reg(vpu_dev, W5_RET_STD_DEF0);
> +		hw_config_def1    = vpu_read_reg(vpu_dev, W5_RET_STD_DEF1);
> +		hw_config_feature = vpu_read_reg(vpu_dev, W5_RET_CONF_FEATURE);
> +		hw_config_rev     = vpu_read_reg(vpu_dev, W5_RET_CONF_REVISION);
> +
> +		p_attr->support_hevc10bit_enc = (hw_config_feature >> 3) & 1;
> +		if (hw_config_rev > 167455) {//20190321
> +			p_attr->support_avc10bit_enc =  (hw_config_feature >> 11) & 1;
> +		} else {
> +			p_attr->support_avc10bit_enc = p_attr->support_hevc10bit_enc;
> +		}
> +
> +		p_attr->support_decoders = 0;
> +		p_attr->support_encoders = 0;
> +		if (p_attr->product_id == PRODUCT_ID_521) {
> +			p_attr->support_decoders  = (((hw_config_def1 >> 3) & 0x01) << STD_AVC);
> +			p_attr->support_decoders |= (((hw_config_def1 >> 2) & 0x01) << STD_HEVC);
> +			p_attr->support_encoders  = (((hw_config_def1 >> 1) & 0x01) << STD_AVC);
> +			p_attr->support_encoders |= (((hw_config_def1 >> 0) & 0x01) << STD_HEVC);
> +			p_attr->support_dual_core = ((hw_config_def1 >> 26) & 0x01);
> +			if (p_attr->support_dual_core || hw_config_rev < 206116) {
> +				p_attr->support_decoders  = (1 << STD_AVC);
> +				p_attr->support_decoders |= (1 << STD_HEVC);
> +				p_attr->support_encoders  = (1 << STD_AVC);
> +				p_attr->support_encoders |= (1 << STD_HEVC);
> +			}
> +		}
> +		if (p_attr->product_id == PRODUCT_ID_511) {
> +			p_attr->support_decoders  = (1 << STD_HEVC);
> +			p_attr->support_decoders |= (1 << STD_AVC);
> +		}
> +		if (p_attr->product_id == PRODUCT_ID_517) {
> +			p_attr->support_decoders  = (((hw_config_def1 >> 4) & 0x01) << STD_AV1);
> +			p_attr->support_decoders |= (((hw_config_def1 >> 3) & 0x01) << STD_AVS2);
> +			p_attr->support_decoders |= (((hw_config_def1 >> 2) & 0x01) << STD_AVC);
> +			p_attr->support_decoders |= (((hw_config_def1 >> 1) & 0x01) << STD_VP9);
> +			p_attr->support_decoders |= (((hw_config_def1 >> 0) & 0x01) << STD_HEVC);
> +		}
> +
> +		p_attr->support_backbone           = (hw_config_def0 >> 16) & 0x01;
> +		p_attr->support_vcpu_backbone       = (hw_config_def0 >> 28) & 0x01;
> +		p_attr->support_vcore_backbone      = (hw_config_def0 >> 22) & 0x01;
> +		p_attr->support_dual_core           = (hw_config_def1 >> 26) & 0x01;
> +		p_attr->support_endian_mask         = (uint32_t)((1 << VDI_LITTLE_ENDIAN)
> +				| (1 << VDI_BIG_ENDIAN)
> +				| (1 << VDI_32BIT_LITTLE_ENDIAN) | (1 << VDI_32BIT_BIG_ENDIAN)
> +				| (0xffffUL << 16));
> +		p_attr->support_bitstream_mode      = (1 << BS_MODE_INTERRUPT) |
> +			(1 << BS_MODE_PIC_END);
> +	}
> +
> +	return ret;
> +}
> +
> +enum ret_code wave5_vpu_get_version(struct vpu_device *vpu_dev, uint32_t *version_info,
> +				    uint32_t *revision)
> +{
> +	u32          reg_val;
> +
> +	vpu_write_reg(vpu_dev, W5_QUERY_OPTION, GET_VPU_INFO);
> +	vpu_write_reg(vpu_dev, W5_VPU_BUSY_STATUS, 1);
> +	vpu_write_reg(vpu_dev, W5_COMMAND, W5_QUERY);
> +	vpu_write_reg(vpu_dev, W5_VPU_HOST_INT_REQ, 1);
> +	if (vdi_wait_vpu_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +		pr_err("%s: timeout\n", __func__);
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	if (!vpu_read_reg(vpu_dev, W5_RET_SUCCESS)) {
> +		pr_err("%s: FALSE\n", __func__);
> +		return RETCODE_QUERY_FAILURE;
> +	}
> +
> +	reg_val = vpu_read_reg(vpu_dev, W5_RET_FW_VERSION);
> +	if (version_info)
> +		*version_info = 0;
> +	if (revision)
> +		*revision    = reg_val;
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_vpu_init(struct device *dev, void *firmware, uint32_t size)
> +{
> +	struct vpu_platform_data *pdata = dev_get_platdata(dev);
> +	struct vpu_buf *vb;
> +	dma_addr_t code_base, temp_base;
> +	u32          code_size, temp_size;
> +	u32          i, reg_val, remap_size;
> +	u32          hw_option    = 0;
> +	enum ret_code         ret = RETCODE_SUCCESS;
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	vb = &vpu_dev->common_mem;
> +	if (!vb)
> +		return RETCODE_INSUFFICIENT_RESOURCE;
> +
> +	code_base  = (dma_addr_t)vb->daddr;
> +	/* ALIGN TO 4KB */
> +	code_size = (WAVE5_MAX_CODE_BUF_SIZE & ~0xfff);
> +	if (code_size < size * 2)
> +		return RETCODE_INSUFFICIENT_RESOURCE;
> +
> +	temp_base = (dma_addr_t)vb->daddr + WAVE5_TEMPBUF_OFFSET;
> +	temp_size = WAVE5_TEMPBUF_SIZE;
> +
> +	pr_info("\n_vpu INIT start!!!\n");

Delete this debug code.


> +	vpu_write_mem(vpu_dev, vb, 0, (unsigned char *)firmware, size * 2,
> +		      VDI_128BIT_LITTLE_ENDIAN);
> +
> +	reg_val = 0;
> +	vpu_write_reg(vpu_dev, W5_PO_CONF, reg_val);
> +
> +	/* clear registers */
> +
> +	for (i = W5_CMD_REG_BASE; i < W5_CMD_REG_END; i += 4)
> +		vpu_write_reg(vpu_dev, i, 0x00);
> +
> +	/* remap page size 0*/
> +	remap_size = (W5_REMAP_MAX_SIZE >> 12) & 0x1ff;
> +	reg_val = 0x80000000 | (WAVE5_UPPER_PROC_AXI_ID << 20) | (0 << 16)
> +		| (W5_REMAP_INDEX0 << 12) | (1 << 11) | remap_size;
> +	vpu_write_reg(vpu_dev, W5_VPU_REMAP_CTRL,  reg_val);
> +	vpu_write_reg(vpu_dev, W5_VPU_REMAP_VADDR, W5_REMAP_INDEX0 * W5_REMAP_MAX_SIZE);
> +	vpu_write_reg(vpu_dev, W5_VPU_REMAP_PADDR, code_base + W5_REMAP_INDEX0 * W5_REMAP_MAX_SIZE);
> +
> +	/* remap page size 1*/
> +	remap_size = (W5_REMAP_MAX_SIZE >> 12) & 0x1ff;
> +	reg_val = 0x80000000 | (WAVE5_UPPER_PROC_AXI_ID << 20) | (0 << 16)
> +		| (W5_REMAP_INDEX1 << 12) | (1 << 11) | remap_size;
> +	vpu_write_reg(vpu_dev, W5_VPU_REMAP_CTRL,  reg_val);
> +	vpu_write_reg(vpu_dev, W5_VPU_REMAP_VADDR, W5_REMAP_INDEX1 * W5_REMAP_MAX_SIZE);
> +	vpu_write_reg(vpu_dev, W5_VPU_REMAP_PADDR, code_base + W5_REMAP_INDEX1 * W5_REMAP_MAX_SIZE);
> +
> +	vpu_write_reg(vpu_dev, W5_ADDR_CODE_BASE,  code_base);
> +	vpu_write_reg(vpu_dev, W5_CODE_SIZE,       code_size);
> +	vpu_write_reg(vpu_dev, W5_CODE_PARAM,      (WAVE5_UPPER_PROC_AXI_ID << 4) | 0);
> +	vpu_write_reg(vpu_dev, W5_ADDR_TEMP_BASE,  temp_base);
> +	vpu_write_reg(vpu_dev, W5_TEMP_SIZE,       temp_size);
> +
> +	if (pdata && pdata->get_hwoption)
> +		hw_option |= pdata->get_hwoption(dev);
> +	vpu_write_reg(vpu_dev, W5_HW_OPTION, hw_option);
> +
> +	/* interrupt */
> +	// encoder
> +	reg_val  = (1 << INT_WAVE5_ENC_SET_PARAM);
> +	reg_val |= (1 << INT_WAVE5_ENC_PIC);
> +	reg_val |= (1 << INT_WAVE5_BSBUF_FULL);
> +	// decoder
> +	reg_val |= (1 << INT_WAVE5_INIT_SEQ);
> +	reg_val |= (1 << INT_WAVE5_DEC_PIC);
> +	reg_val |= (1 << INT_WAVE5_BSBUF_EMPTY);
> +	vpu_write_reg(vpu_dev, W5_VPU_VINT_ENABLE, reg_val);
> +
> +	reg_val = vpu_read_reg(vpu_dev, W5_VPU_RET_VPU_CONFIG0);
> +	if (((reg_val >> 16) & 1) == 1) {
> +		reg_val = ((WAVE5_PROC_AXI_ID << 28)  |
> +				(WAVE5_PRP_AXI_ID << 24)   |
> +				(WAVE5_FBD_Y_AXI_ID << 20) |
> +				(WAVE5_FBC_Y_AXI_ID << 16) |
> +				(WAVE5_FBD_C_AXI_ID << 12) |
> +				(WAVE5_FBC_C_AXI_ID << 8)  |
> +				(WAVE5_PRI_AXI_ID << 4)    |
> +				(WAVE5_SEC_AXI_ID << 0));
> +		vdi_fio_write_register(vpu_dev, W5_BACKBONE_PROG_AXI_ID, reg_val);
> +	}
> +
> +	vb = get_sram_memory(vpu_dev);
> +	if (!vb)  // get SRAM base/size
> +		return RETCODE_INSUFFICIENT_RESOURCE;
> +
> +	vpu_write_reg(vpu_dev, W5_ADDR_SEC_AXI,         vb->daddr);
> +	vpu_write_reg(vpu_dev, W5_SEC_AXI_SIZE,         vb->size);
> +	vpu_write_reg(vpu_dev, W5_VPU_BUSY_STATUS,      1);
> +	vpu_write_reg(vpu_dev, W5_COMMAND,              W5_INIT_VPU);
> +	vpu_write_reg(vpu_dev, W5_VPU_REMAP_CORE_START, 1);
> +	if (vdi_wait_vpu_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +		pr_err("VPU init(W5_VPU_REMAP_CORE_START) timeout\n");
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	reg_val = vpu_read_reg(vpu_dev, W5_RET_SUCCESS);
> +	if (reg_val == 0) {
> +		u32 reason_code = vpu_read_reg(vpu_dev, W5_RET_FAIL_REASON);
> +
> +		pr_err("VPU init(W5_RET_SUCCESS) failed(%d) REASON CODE(%08x)\n", reg_val,
> +		       reason_code);
> +		return RETCODE_FAILURE;
> +	}
> +
> +	ret = setup_wave5_properties(dev);
> +	return ret;
> +}
> +
> +enum ret_code wave5_vpu_build_up_dec_param(struct vpu_instance *vpu_inst,
> +					   struct dec_open_param *param)
> +{
> +	enum ret_code      ret      = RETCODE_SUCCESS;
> +	struct dec_info *p_dec_info = &vpu_inst->codec_info->dec_info;
> +	u32       bs_endian = 0;
> +	struct vpu_buf *vb;
> +	struct vpu_device *vpu_dev = vpu_inst->dev;
> +
> +	switch (vpu_inst->std) {
> +	case W_HEVC_DEC:
> +		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_HEVC;
> +		break;
> +	case W_VP9_DEC:
> +		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_VP9;
> +		break;
> +	case W_AVS2_DEC:
> +		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_AVS2;
> +		break;
> +	case W_AVC_DEC:
> +		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_AVC;
> +		break;
> +	case W_AV1_DEC:
> +		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_AV1;
> +		break;
> +	default:
> +		return RETCODE_NOT_SUPPORTED_FEATURE;
> +	}
> +
> +	if (vpu_dev->product == PRODUCT_ID_517)
> +		p_dec_info->vb_work.size = (uint32_t)WAVE517_WORKBUF_SIZE;
> +	else if (vpu_dev->product == PRODUCT_ID_521)
> +		p_dec_info->vb_work.size = (uint32_t)WAVE521DEC_WORKBUF_SIZE;
> +	else if (vpu_dev->product == PRODUCT_ID_511)
> +		p_dec_info->vb_work.size = (uint32_t)WAVE521DEC_WORKBUF_SIZE;
> +
> +	if (vdi_allocate_dma_memory(vpu_inst->dev, &p_dec_info->vb_work) < 0) {
> +		memset(&p_dec_info->vb_work, 0, sizeof(p_dec_info->vb_work));
> +		return RETCODE_INSUFFICIENT_RESOURCE;
> +	}
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_VCORE_INFO, 1);
> +
> +	vb = get_sram_memory(vpu_inst->dev);
> +	p_dec_info->sec_axi_info.buf_base = vb->daddr;
> +	p_dec_info->sec_axi_info.buf_size = vb->size;
> +
> +	vdi_clear_memory(vpu_inst->dev, &p_dec_info->vb_work);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_ADDR_WORK_BASE, p_dec_info->vb_work.daddr);
> +	vpu_write_reg(vpu_inst->dev, W5_WORK_SIZE,      p_dec_info->vb_work.size);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_BS_START_ADDR, p_dec_info->stream_buf_start_addr);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_BS_SIZE,       p_dec_info->stream_buf_size);
> +
> +	/* NOTE: when endian mode is 0, SDMA reads MSB first */
> +	bs_endian = vdi_convert_endian(vpu_inst->dev, param->stream_endian);
> +	bs_endian = (~bs_endian & VDI_128BIT_ENDIAN_MASK);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_BS_PARAM, bs_endian);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_NUM_CQ_DEPTH_M1, (COMMAND_QUEUE_DEPTH - 1));
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ERR_CONCEAL, (param->error_conceal_unit << 2) |
> +			(param->error_conceal_mode));
> +
> +	wave5_bit_issue_command(vpu_inst, W5_CREATE_INSTANCE);
> +	// check QUEUE_DONE
> +	if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +		dev_warn(vpu_inst->dev->dev, "create instance timed out\n");
> +		vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	if (!vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS)) { // FAILED for adding into VCPU QUEUE
> +		vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);
> +		ret = RETCODE_FAILURE;
> +	}
> +
> +	p_dec_info->product_code = vpu_read_reg(vpu_inst->dev, W5_PRODUCT_NUMBER);
> +
> +	return ret;
> +}
> +
> +enum ret_code wave5_vpu_dec_init_seq(struct vpu_instance *vpu_inst)
> +{
> +	enum ret_code     ret = RETCODE_SUCCESS;
> +	struct dec_info *p_dec_info;
> +	u32      cmd_option = INIT_SEQ_NORMAL, bs_option;
> +	u32      reg_val;
> +
> +	if (!vpu_inst->codec_info)
> +		return RETCODE_INVALID_PARAM;
> +
> +	p_dec_info = &vpu_inst->codec_info->dec_info;
> +	if (p_dec_info->thumbnail_mode)
> +		cmd_option = INIT_SEQ_W_THUMBNAIL;
> +
> +	/* set attributes of bitstream buffer controller */
> +	bs_option = 0;
> +	switch (p_dec_info->open_param.bitstream_mode) {
> +	case BS_MODE_INTERRUPT:
> +		if (p_dec_info->seq_init_escape)
> +			bs_option = BSOPTION_ENABLE_EXPLICIT_END;
> +		break;
> +	case BS_MODE_PIC_END:
> +		bs_option = BSOPTION_ENABLE_EXPLICIT_END;
> +		break;
> +	default:
> +		return RETCODE_INVALID_PARAM;
> +	}
> +
> +	vpu_write_reg(vpu_inst->dev, W5_BS_RD_PTR, p_dec_info->stream_rd_ptr);
> +	vpu_write_reg(vpu_inst->dev, W5_BS_WR_PTR, p_dec_info->stream_wr_ptr);
> +
> +	if (p_dec_info->stream_endflag == 1)
> +		bs_option = 3;
> +	if (vpu_inst->std == W_AV1_DEC)
> +		bs_option |= ((p_dec_info->open_param.av1_format) << 2);
> +	vpu_write_reg(vpu_inst->dev, W5_BS_OPTION, (1UL << 31) | bs_option);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_COMMAND_OPTION, cmd_option);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_USER_MASK, p_dec_info->user_data_enable);
> +
> +	wave5_bit_issue_command(vpu_inst, W5_INIT_SEQ);
> +
> +	// check QUEUE_DONE
> +	if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +		dev_warn(vpu_inst->dev->dev, "init seq timed out\n");
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_QUEUE_STATUS);
> +
> +	p_dec_info->instance_queue_count = (reg_val >> 16) & 0xff;
> +	p_dec_info->report_queue_count   = (reg_val & 0xffff);
> +
> +	// FAILED for adding a command into VCPU QUEUE
> +	if (!vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS)) {
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_FAIL_REASON);
> +		if (reg_val != WAVE5_SYSERR_QUEUEING_FAIL)
> +			pr_err("FAIL_REASON = 0x%x\n", reg_val);
> +
> +		if (reg_val == WAVE5_SYSERR_QUEUEING_FAIL) {
> +			reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_QUEUE_FAIL_REASON);
> +			pr_info("QUEUE_FAIL_REASON = 0x%x\n", reg_val);
> +			ret = RETCODE_QUEUEING_FAILURE;
> +		} else if (reg_val == WAVE5_SYSERR_ACCESS_VIOLATION_HW) {
> +			ret = RETCODE_MEMORY_ACCESS_VIOLATION;
> +		} else if (reg_val == WAVE5_SYSERR_WATCHDOG_TIMEOUT) {
> +			ret = RETCODE_VPU_RESPONSE_TIMEOUT;
> +		} else if (reg_val == WAVE5_SYSERR_VLC_BUF_FULL) {
> +			ret = RETCODE_VLC_BUF_FULL;
> +		} else if (reg_val == WAVE5_SYSERR_BUS_ERROR ||
> +				reg_val == WAVE5_SYSERR_DOUBLE_FAULT) {
> +			ret = RETCODE_VPU_BUS_ERROR;
> +		} else {
> +			ret = RETCODE_FAILURE;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void get_dec_sequence_result(struct vpu_instance *vpu_inst, struct dec_initial_info *info)
> +{
> +	u32          reg_val, sub_layer_info;
> +	u32          profile_compatibility_flag;
> +	u32          left, right, top, bottom;
> +	u32          progressive_flag, interlaced_flag, output_bit_depth_minus8;
> +	struct dec_info *p_dec_info = &vpu_inst->codec_info->dec_info;
> +
> +	p_dec_info->stream_rd_ptr = wave5_vpu_dec_get_rd_ptr(vpu_inst);
> +	info->rd_ptr = p_dec_info->stream_rd_ptr;
> +
> +	p_dec_info->frame_display_flag = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_DISP_IDC);
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PIC_SIZE);
> +	info->pic_width            = ((reg_val >> 16) & 0xffff);
> +	info->pic_height           = (reg_val & 0xffff);
> +	info->min_frame_buffer_count = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_NUM_REQUIRED_FB);
> +	info->frame_buf_delay       = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_NUM_REORDER_DELAY);
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_CROP_LEFT_RIGHT);
> +	left   = (reg_val >> 16) & 0xffff;
> +	right  = reg_val & 0xffff;
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_CROP_TOP_BOTTOM);
> +	top    = (reg_val >> 16) & 0xffff;
> +	bottom = reg_val & 0xffff;
> +
> +	info->pic_crop_rect.left   = left;
> +	info->pic_crop_rect.right  = info->pic_width - right;
> +	info->pic_crop_rect.top    = top;
> +	info->pic_crop_rect.bottom = info->pic_height - bottom;
> +
> +	info->f_rate_numerator   = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_FRAME_RATE_NR);
> +	info->f_rate_denominator = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_FRAME_RATE_DR);
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_COLOR_SAMPLE_INFO);
> +	info->luma_bitdepth           = (reg_val >> 0) & 0x0f;
> +	info->chroma_bitdepth         = (reg_val >> 4) & 0x0f;
> +	info->chroma_format_idc        = (reg_val >> 8) & 0x0f;
> +	info->aspect_rate_info         = (reg_val >> 16) & 0xff;
> +	info->is_ext_sar               = (info->aspect_rate_info == 255 ? TRUE : FALSE);
> +	/* [0:15] - vertical size, [16:31] - horizontal size */
> +	if (info->is_ext_sar)
> +		info->aspect_rate_info     = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_ASPECT_RATIO);
> +	info->bit_rate                = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_BIT_RATE);
> +
> +	sub_layer_info = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_SUB_LAYER_INFO);
> +	info->max_temporal_layers = (sub_layer_info >> 8) & 0x7;
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_SEQ_PARAM);
> +	info->level                  = reg_val & 0xff;
> +	interlaced_flag               = (reg_val >> 10) & 0x1;
> +	progressive_flag              = (reg_val >> 11) & 0x1;
> +	profile_compatibility_flag     = (reg_val >> 12) & 0xff;
> +	info->profile                = (reg_val >> 24) & 0x1f;
> +	info->tier                   = (reg_val >> 29) & 0x01;
> +	output_bit_depth_minus8         = (reg_val >> 30) & 0x03;
> +
> +	if (vpu_inst->std == W_HEVC_DEC) {
> +		/* guessing profile */
> +		if (info->profile == 0) {
> +			if      ((profile_compatibility_flag & 0x06) == 0x06)
> +				info->profile = HEVC_PROFILE_MAIN;         /* main profile */
> +			else if ((profile_compatibility_flag & 0x04) == 0x04)
> +				info->profile = HEVC_PROFILE_MAIN10;       /* main10 profile */
> +			else if ((profile_compatibility_flag & 0x08) == 0x08)
> +				/* main still picture profile */
> +				info->profile = HEVC_PROFILE_STILLPICTURE;
> +			else
> +				info->profile = HEVC_PROFILE_MAIN;         /* for old version HM */
> +		}
> +
> +		if (progressive_flag == 1 && interlaced_flag == 0)
> +			info->interlace = 0;
> +		else
> +			info->interlace = 1;
> +	} else if (vpu_inst->std == W_AVS2_DEC) {
> +		if (info->luma_bitdepth == 10 && output_bit_depth_minus8 == 2)
> +			info->output_bit_depth = 10;
> +		else
> +			info->output_bit_depth = 8;
> +
> +		if (progressive_flag == 1)
> +			info->interlace = 0;
> +		else
> +			info->interlace = 1;
> +	} else if (vpu_inst->std == W_AVC_DEC) {
> +		info->profile   = (reg_val >> 24) & 0x7f;
> +		info->interlace = 0;
> +	} else if (vpu_inst->std == W_AV1_DEC) {
> +		info->max_spatial_layers = (sub_layer_info >> 24) & 0x3;
> +	}
> +
> +	info->vlc_buf_size       = vpu_read_reg(vpu_inst->dev, W5_RET_VLC_BUF_SIZE);
> +	info->param_buf_size     = vpu_read_reg(vpu_inst->dev, W5_RET_PARAM_BUF_SIZE);
> +	p_dec_info->vlc_buf_size   = info->vlc_buf_size;
> +	p_dec_info->param_buf_size = info->param_buf_size;
> +}
> +
> +enum ret_code wave5_vpu_dec_get_seq_info(struct vpu_instance *vpu_inst,
> +					 struct dec_initial_info *info)
> +{
> +	enum ret_code     ret;
> +	u32      reg_val, i;
> +	struct dec_info *p_dec_info;
> +
> +	p_dec_info = &vpu_inst->codec_info->dec_info;
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_ADDR_REPORT_BASE, p_dec_info->user_data_buf_addr);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_REPORT_SIZE, p_dec_info->user_data_buf_size);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_REPORT_PARAM,
> +		      VPU_USER_DATA_ENDIAN & VDI_128BIT_ENDIAN_MASK);
> +
> +	// send QUERY cmd
> +	ret = send_query(vpu_inst, GET_RESULT);
> +	if (ret != RETCODE_SUCCESS) {
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_FAIL_REASON);
> +		if (reg_val != WAVE5_SYSERR_QUEUEING_FAIL)
> +			pr_err("FAIL_REASON = 0x%x\n", reg_val);
> +
> +		if (reg_val == WAVE5_SYSERR_RESULT_NOT_READY)
> +			return RETCODE_REPORT_NOT_READY;
> +		else if (reg_val == WAVE5_SYSERR_ACCESS_VIOLATION_HW)
> +			return RETCODE_MEMORY_ACCESS_VIOLATION;
> +		else if (reg_val == WAVE5_SYSERR_WATCHDOG_TIMEOUT)
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		else if (reg_val == WAVE5_SYSERR_VLC_BUF_FULL)
> +			return RETCODE_VLC_BUF_FULL;
> +		else if (reg_val == WAVE5_SYSERR_BUS_ERROR || reg_val == WAVE5_SYSERR_DOUBLE_FAULT)
> +			return RETCODE_VPU_BUS_ERROR;
> +		else
> +			return RETCODE_QUERY_FAILURE;
> +	}
> +
> +	dev_dbg(vpu_inst->dev->dev, "init seq complete\n");
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_QUEUE_STATUS);
> +
> +	p_dec_info->instance_queue_count = (reg_val >> 16) & 0xff;
> +	p_dec_info->report_queue_count   = (reg_val & 0xffff);
> +
> +	if (vpu_read_reg(vpu_inst->dev, W5_RET_DEC_DECODING_SUCCESS) != 1) {
> +		info->seq_init_err_reason = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_ERR_INFO);
> +		ret = RETCODE_FAILURE;
> +	} else {
> +		info->warn_info = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_WARN_INFO);
> +	}
> +
> +	// get sequence info
> +	info->user_data_size   = 0;
> +	info->user_data_num    = 0;
> +	info->user_data_buf_full = 0;
> +	info->user_data_header = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_USERDATA_IDC);
> +	if (info->user_data_header != 0) {
> +		reg_val = info->user_data_header;
> +		for (i = 0; i < 32; i++) {
> +			if (i == 1) {
> +				if (reg_val & (1 << i))
> +					info->user_data_buf_full = 1;
> +			} else {
> +				if (reg_val & (1 << i))
> +					info->user_data_num++;
> +			}
> +		}
> +		info->user_data_size = p_dec_info->user_data_buf_size;
> +	}
> +
> +	get_dec_sequence_result(vpu_inst, info);
> +
> +	return ret;
> +}
> +
> +enum ret_code wave5_vpu_dec_register_framebuffer(struct vpu_instance *vpu_inst,
> +						 struct frame_buffer *fb_arr,
> +						 enum tiled_map_type map_type, uint32_t count)
> +{
> +	enum ret_code      ret = RETCODE_SUCCESS;
> +	struct dec_info *p_dec_info = &vpu_inst->codec_info->dec_info;
> +	s32        q, j, i, remain, idx;

Never use s32 except when describing hardware.  Use int.

> +	u32       mv_count;
> +	u32       k;

Change k to int.  Iterators should always be int, ulong or u64.  u32
iterators are pointless and nonsensical.  GCC encourages this
garbage because GCC is sometimes stupid.

> +	s32        start_no, end_no;
> +	u32       reg_val, cbcr_interleave, nv21, pic_size;
> +	u32       endian, yuv_format = 0;
> +	u32       addr_y, addr_cb, addr_cr;
> +	u32       mv_col_size, fbc_y_tbl_size, fbc_c_tbl_size;
> +	struct vpu_buf vb_buffer;

Weird aligned declaration block.

> +	u32       color_format  = 0;

Search for "  =" and delete the extra spaces.

> +	u32       init_pic_width = 0, init_pic_height = 0;
> +	u32       pixel_order = 1;
> +	u32       bwb_flag = (map_type == LINEAR_FRAME_MAP) ? 1 : 0;
> +
> +	cbcr_interleave = p_dec_info->open_param.cbcr_interleave;
> +	nv21           = p_dec_info->open_param.nv21;
> +	mv_col_size   = 0;
> +	fbc_y_tbl_size = 0;
> +	fbc_c_tbl_size = 0;
> +
> +	init_pic_width   = p_dec_info->initial_info.pic_width;
> +	init_pic_height  = p_dec_info->initial_info.pic_height;
> +
> +	if (map_type >= COMPRESSED_FRAME_MAP) {
> +		cbcr_interleave = 0;
> +		nv21           = 0;
> +
> +		switch (vpu_inst->std) {
> +		case W_HEVC_DEC:
> +			mv_col_size = WAVE5_DEC_HEVC_MVCOL_BUF_SIZE(init_pic_width, init_pic_height);
> +			break;
> +		case W_VP9_DEC:
> +			mv_col_size = WAVE5_DEC_VP9_MVCOL_BUF_SIZE(init_pic_width, init_pic_height);
> +			break;
> +		case W_AVS2_DEC:
> +			mv_col_size = WAVE5_DEC_AVS2_MVCOL_BUF_SIZE(init_pic_width, init_pic_height);
> +			break;
> +		case W_AVC_DEC:
> +			mv_col_size = WAVE5_DEC_AVC_MVCOL_BUF_SIZE(init_pic_width, init_pic_height);
> +			break;
> +		case W_AV1_DEC:
> +			mv_col_size = WAVE5_DEC_AV1_MVCOL_BUF_SZ_1(init_pic_width, init_pic_height) +
> +				WAVE5_DEC_AV1_MVCOL_BUF_SZ_2(init_pic_width, init_pic_width,
> +							     init_pic_height);
> +			break;
> +		default:
> +			return RETCODE_NOT_SUPPORTED_FEATURE;
> +		}
> +
> +		mv_col_size          = ALIGN(mv_col_size, 16);
> +		vb_buffer.daddr = 0;
> +		if (vpu_inst->std == W_HEVC_DEC || vpu_inst->std == W_AVS2_DEC || vpu_inst->std ==
> +				W_VP9_DEC || vpu_inst->std == W_AVC_DEC || vpu_inst->std ==
> +				W_AV1_DEC) {
> +			/* 4096 is a margin */
> +			vb_buffer.size      = ((mv_col_size + 4095) & ~4095) + 4096;
> +			mv_count = count;
> +
> +			for (k = 0  ; k < mv_count ; k++) {

Delete spaces before ;
			for (k = 0; k < mv_count; k++) {

Search for " ;" and delete the extra spaces.

> +				if (p_dec_info->vb_mv[k].size == 0) {
> +					if (vdi_allocate_dma_memory(vpu_inst->dev, &vb_buffer) < 0)
> +						return RETCODE_INSUFFICIENT_RESOURCE;

Every function must clean up after itself.

	while (--k >= 0)
		free_whatever(p_dec_info->vb_mv[k]);


> +					p_dec_info->vb_mv[k] = vb_buffer;
> +				}
> +			}
> +		}
> +
> +		if (p_dec_info->product_code == WAVE521C_DUAL_CODE) {
> +			u32 bgs_width      = (p_dec_info->initial_info.luma_bitdepth > 8 ? 256 :
> +					512);
> +			u32 ot_bg_width    = 1024;
> +			u32 frm_width      = VPU_CEIL(init_pic_width, 16);
> +			u32 frm_height     = VPU_CEIL(init_pic_height, 16);
> +			// valid_width = align(width, 16),
> +			// comp_frm_width = align(valid_width+pad_x, 16)
> +			u32 comp_frm_width = VPU_CEIL(VPU_CEIL(frm_width, 16) + 16, 16);
> +			// 1024 = offset table BG width
> +			u32 ot_frm_width   = VPU_CEIL(comp_frm_width, ot_bg_width);
> +
> +			// sizeof_offset_table()
> +			u32 ot_bg_height = 32;
> +			u32 bgs_height  = (1 << 14) / bgs_width /
> +				(p_dec_info->initial_info.luma_bitdepth > 8 ? 2 : 1);
> +			u32 comp_frm_height = VPU_CEIL(VPU_CEIL(frm_height, 4) + 4, bgs_height);
> +			u32 ot_frm_height = VPU_CEIL(comp_frm_height, ot_bg_height);
> +
> +			fbc_y_tbl_size = (ot_frm_width / 16) * (ot_frm_height / 4) * 2;
> +		} else {
> +			switch (vpu_inst->std) {
> +			case W_HEVC_DEC:
> +				fbc_y_tbl_size = WAVE5_FBC_LUMA_TABLE_SIZE(init_pic_width,
> +									   init_pic_height); break;
> +			case W_VP9_DEC:
> +				fbc_y_tbl_size =
> +					WAVE5_FBC_LUMA_TABLE_SIZE(ALIGN(init_pic_width, 64),
> +								  ALIGN(init_pic_height, 64)); break;
> +			case W_AVS2_DEC:
> +				fbc_y_tbl_size = WAVE5_FBC_LUMA_TABLE_SIZE(init_pic_width,
> +									   init_pic_height); break;
> +			case W_AVC_DEC:
> +				fbc_y_tbl_size = WAVE5_FBC_LUMA_TABLE_SIZE(init_pic_width,
> +									   init_pic_height); break;
> +			case W_AV1_DEC:
> +				fbc_y_tbl_size =
> +					WAVE5_FBC_LUMA_TABLE_SIZE(ALIGN(init_pic_width, 16),
> +								  ALIGN(init_pic_height, 8)); break;
> +			default:
> +				return RETCODE_NOT_SUPPORTED_FEATURE;
> +			}
> +			fbc_y_tbl_size        = ALIGN(fbc_y_tbl_size, 16);
> +		}
> +
> +		vb_buffer.daddr = 0;
> +		vb_buffer.size      = ((fbc_y_tbl_size + 4095) & ~4095) + 4096;
> +		for (k = 0  ; k < count ; k++) {
> +			if (p_dec_info->vb_fbc_y_tbl[k].size == 0) {
> +				if (vdi_allocate_dma_memory(vpu_inst->dev, &vb_buffer) < 0)
> +					return RETCODE_INSUFFICIENT_RESOURCE;
> +				p_dec_info->vb_fbc_y_tbl[k] = vb_buffer;
> +			}
> +		}
> +
> +		if (p_dec_info->product_code == WAVE521C_DUAL_CODE) {
> +			u32 bgs_width  = (p_dec_info->initial_info.chroma_bitdepth > 8 ? 256 : 512);
> +			u32 ot_bg_width    = 1024;
> +			u32 frm_width  = VPU_CEIL(init_pic_width, 16);
> +			u32 frm_height = VPU_CEIL(init_pic_height, 16);
> +			u32 comp_frm_width = VPU_CEIL(VPU_CEIL(frm_width / 2, 16) + 16, 16);
> +			// valid_width = align(width, 16),
> +			// comp_frm_width = align(valid_width+pad_x, 16)
> +			// 1024 = offset table BG width
> +			u32 ot_frm_width   = VPU_CEIL(comp_frm_width, ot_bg_width);
> +
> +			// sizeof_offset_table()
> +			u32 ot_bg_height = 32;
> +			u32 bgs_height  = (1 << 14) / bgs_width /

Replace 1 << 14 with a define.  (magic number).

> +				(p_dec_info->initial_info.chroma_bitdepth > 8 ? 2 : 1);
> +			u32 comp_frm_height = VPU_CEIL(VPU_CEIL(frm_height, 4) + 4, bgs_height);
> +			u32 ot_frm_height = VPU_CEIL(comp_frm_height, ot_bg_height);
> +
> +			fbc_c_tbl_size = (ot_frm_width / 16) * (ot_frm_height / 4) * 2;
> +		} else {
> +			switch (vpu_inst->std) {
> +			case W_HEVC_DEC:
> +				fbc_c_tbl_size = WAVE5_FBC_CHROMA_TABLE_SIZE(init_pic_width,
> +									     init_pic_height);
> +				break;
> +			case W_VP9_DEC:
> +				fbc_c_tbl_size =
> +					WAVE5_FBC_CHROMA_TABLE_SIZE(ALIGN(init_pic_width, 64),
> +								    ALIGN(init_pic_height, 64));
> +				break;
> +			case W_AVS2_DEC:
> +				fbc_c_tbl_size = WAVE5_FBC_CHROMA_TABLE_SIZE(init_pic_width,
> +									     init_pic_height);
> +				break;
> +			case W_AVC_DEC:
> +				fbc_c_tbl_size = WAVE5_FBC_CHROMA_TABLE_SIZE(init_pic_width,
> +									     init_pic_height);
> +				break;
> +			case W_AV1_DEC:
> +				fbc_c_tbl_size =
> +					WAVE5_FBC_CHROMA_TABLE_SIZE(ALIGN(init_pic_width, 16),
> +								    ALIGN(init_pic_height, 8));
> +				break;
> +			default:
> +				return RETCODE_NOT_SUPPORTED_FEATURE;
> +			}
> +			fbc_c_tbl_size        = ALIGN(fbc_c_tbl_size, 16);
> +		}
> +
> +		vb_buffer.daddr = 0;
> +		vb_buffer.size      = ((fbc_c_tbl_size + 4095) & ~4095) + 4096;
> +		for (k = 0  ; k < count ; k++) {
> +			if (p_dec_info->vb_fbc_c_tbl[k].size == 0) {
> +				if (vdi_allocate_dma_memory(vpu_inst->dev, &vb_buffer) < 0)
> +					return RETCODE_INSUFFICIENT_RESOURCE;
> +				p_dec_info->vb_fbc_c_tbl[k] = vb_buffer;
> +			}
> +		}
> +		pic_size = (init_pic_width << 16) | (init_pic_height);
> +
> +		// allocate task_buffer
> +		vb_buffer.size       = (uint32_t)((p_dec_info->vlc_buf_size * VLC_BUF_NUM) +
> +				(p_dec_info->param_buf_size * COMMAND_QUEUE_DEPTH));
> +		vb_buffer.daddr  = 0;
> +		if (vdi_allocate_dma_memory(vpu_inst->dev, &vb_buffer) < 0)
> +			return RETCODE_INSUFFICIENT_RESOURCE;
> +
> +		p_dec_info->vb_task = vb_buffer;
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_SET_FB_ADDR_TASK_BUF, p_dec_info->vb_task.daddr);
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_SET_FB_TASK_BUF_SIZE, vb_buffer.size);
> +	} else {
> +		pic_size = (init_pic_width << 16) | (init_pic_height);
> +	}
> +	endian = vdi_convert_endian(vpu_inst->dev, fb_arr[0].endian);
> +	vpu_write_reg(vpu_inst->dev, W5_PIC_SIZE, pic_size);
> +
> +	yuv_format = 0;
> +	color_format = 0;
> +
> +	reg_val =
> +		(bwb_flag        << 28) |
> +		(pixel_order     << 23) | /* PIXEL ORDER in 128bit. first pixel in low address */
> +		(yuv_format      << 20) |
> +		(color_format    << 19) |
> +		(nv21           << 17) |
> +		(cbcr_interleave << 16) |
> +		(fb_arr[0].stride);
> +	vpu_write_reg(vpu_inst->dev, W5_COMMON_PIC_INFO, reg_val); //// 0x008012c0
> +
> +	remain = count;
> +	q      = (remain + 7) / 8;
> +	idx    = 0;
> +	for (j = 0; j < q; j++) {
> +		reg_val = (endian << 16) | (j == q - 1) << 4 | ((j == 0) << 3);//lint !e514
> +		reg_val |= (p_dec_info->open_param.enable_non_ref_fbc_write << 26);
> +		vpu_write_reg(vpu_inst->dev, W5_SFB_OPTION, reg_val);
> +		start_no = j * 8;
> +		end_no   = start_no + (remain >= 8 ? 8 : remain) - 1;
> +
> +		vpu_write_reg(vpu_inst->dev, W5_SET_FB_NUM, (start_no << 8) | end_no);
> +
> +		for (i = 0; i < 8 && i < remain; i++) {
> +			if (map_type == LINEAR_FRAME_MAP && p_dec_info->open_param.cbcr_order ==
> +					CBCR_ORDER_REVERSED) {
> +				addr_y  = fb_arr[i + start_no].buf_y;
> +				addr_cb = fb_arr[i + start_no].buf_cr;
> +				addr_cr = fb_arr[i + start_no].buf_cb;
> +			} else {
> +				addr_y  = fb_arr[i + start_no].buf_y;
> +				addr_cb = fb_arr[i + start_no].buf_cb;
> +				addr_cr = fb_arr[i + start_no].buf_cr;
> +			}
> +			vpu_write_reg(vpu_inst->dev, W5_ADDR_LUMA_BASE0 + (i << 4), addr_y);
> +			vpu_write_reg(vpu_inst->dev, W5_ADDR_CB_BASE0   + (i << 4), addr_cb);
> +			if (map_type >= COMPRESSED_FRAME_MAP) {
> +				/* luma FBC offset table */
> +				vpu_write_reg(vpu_inst->dev, W5_ADDR_FBC_Y_OFFSET0 + (i << 4),
> +					      p_dec_info->vb_fbc_y_tbl[idx].daddr);
> +				/* chroma FBC offset table */
> +				vpu_write_reg(vpu_inst->dev, W5_ADDR_FBC_C_OFFSET0 + (i << 4),
> +					      p_dec_info->vb_fbc_c_tbl[idx].daddr);
> +				vpu_write_reg(vpu_inst->dev, W5_ADDR_MV_COL0       + (i << 2),
> +					      p_dec_info->vb_mv[idx].daddr);
> +			} else {
> +				vpu_write_reg(vpu_inst->dev, W5_ADDR_CR_BASE0  + (i << 4), addr_cr);
> +				vpu_write_reg(vpu_inst->dev, W5_ADDR_FBC_C_OFFSET0 + (i << 4), 0);
> +				vpu_write_reg(vpu_inst->dev, W5_ADDR_MV_COL0       + (i << 2), 0);
> +			}
> +			idx++;
> +		}
> +		remain -= i;
> +
> +		wave5_bit_issue_command(vpu_inst, W5_SET_FB);
> +		if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1)
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS);
> +	if (reg_val == 0)
> +		return RETCODE_FAILURE;
> +
> +	return ret;
> +}
> +
> +enum ret_code wave5_vpu_decode(struct vpu_instance *vpu_inst, struct dec_param *option)
> +{
> +	u32        mode_option   = DEC_PIC_NORMAL, bs_option, reg_val;
> +	s32         force_latency = -1;

This looks to be a new type of boolean value where -1 is false and 0 is
true...  :P  Please don't do that.


> +	struct dec_info *p_dec_info     = &vpu_inst->codec_info->dec_info;
> +	struct dec_open_param *p_open_param   = &p_dec_info->open_param;
> +
> +	if (p_dec_info->thumbnail_mode) {
> +		mode_option = DEC_PIC_W_THUMBNAIL;
> +	} else if (option->skipframe_mode) {
> +		switch (option->skipframe_mode) {
> +		case WAVE_SKIPMODE_NON_IRAP:
> +			mode_option   = SKIP_NON_IRAP;
> +			force_latency = 0;
> +			break;
> +		case WAVE_SKIPMODE_NON_REF:
> +			mode_option = SKIP_NON_REF_PIC;
> +			break;
> +		default:
> +			// skip off
> +			break;
> +		}
> +	}
> +
> +	// set disable reorder
> +	if (!p_dec_info->reorder_enable)
> +		force_latency = 0;
> +
> +	/* set attributes of bitstream buffer controller */
> +	bs_option = 0;
> +	reg_val = 0;
> +	switch (p_open_param->bitstream_mode) {
> +	case BS_MODE_INTERRUPT:
> +		bs_option = 0;
> +		break;
> +	case BS_MODE_PIC_END:
> +		bs_option = BSOPTION_ENABLE_EXPLICIT_END;
> +		break;
> +	default:
> +		return RETCODE_INVALID_PARAM;
> +	}
> +
> +	vpu_write_reg(vpu_inst->dev, W5_BS_RD_PTR, p_dec_info->stream_rd_ptr);
> +	vpu_write_reg(vpu_inst->dev, W5_BS_WR_PTR, p_dec_info->stream_wr_ptr);
> +	if (p_dec_info->stream_endflag == 1)
> +		bs_option = 3;   // (stream_end_flag<<1) | EXPLICIT_END
> +	if (p_open_param->bitstream_mode == BS_MODE_PIC_END)
> +		bs_option |= (1UL << 31);
> +	if (vpu_inst->std == W_AV1_DEC)
> +		bs_option |= ((p_open_param->av1_format) << 2);
> +	vpu_write_reg(vpu_inst->dev, W5_BS_OPTION, bs_option);
> +
> +	/* secondary AXI */
> +	reg_val = (p_dec_info->sec_axi_info.wave.use_bit_enable << 0)    |
> +		(p_dec_info->sec_axi_info.wave.use_ip_enable << 9)     |
> +		(p_dec_info->sec_axi_info.wave.use_lf_row_enable << 15);
> +	vpu_write_reg(vpu_inst->dev, W5_USE_SEC_AXI,  reg_val);
> +
> +	/* set attributes of user buffer */
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_USER_MASK, p_dec_info->user_data_enable);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_COMMAND_OPTION,
> +		      ((option->disable_film_grain << 6) | (option->cra_as_bla_flag << 5) |
> +		       mode_option));
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_TEMPORAL_ID_PLUS1,
> +		      ((p_dec_info->target_spatial_id + 1) << 9) |
> +		      (p_dec_info->temp_id_select_mode << 8) | (p_dec_info->target_temp_id + 1));
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_SEQ_CHANGE_ENABLE_FLAG, p_dec_info->seq_change_mask);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_FORCE_FB_LATENCY_PLUS1, force_latency + 1);
> +
> +	wave5_bit_issue_command(vpu_inst, W5_DEC_PIC);
> +	// check QUEUE_DONE
> +	if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +		dev_warn(vpu_inst->dev->dev, "dec pic timed out\n");
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_QUEUE_STATUS);
> +
> +	p_dec_info->instance_queue_count = (reg_val >> 16) & 0xff;
> +	p_dec_info->report_queue_count   = (reg_val & 0xffff);
> +	// FAILED for adding a command into VCPU QUEUE
> +	if (!vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS)) {
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_FAIL_REASON);
> +		if (reg_val != WAVE5_SYSERR_QUEUEING_FAIL)
> +			pr_err("FAIL_REASON = 0x%x\n", reg_val);
> +
> +		if (reg_val == WAVE5_SYSERR_QUEUEING_FAIL) {
> +			reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_QUEUE_FAIL_REASON);
> +			pr_info("QUEUE_FAIL_REASON = 0x%x\n", reg_val);
> +			return RETCODE_QUEUEING_FAILURE;
> +		} else if (reg_val == WAVE5_SYSERR_ACCESS_VIOLATION_HW) {
> +			return RETCODE_MEMORY_ACCESS_VIOLATION;
> +		} else if (reg_val == WAVE5_SYSERR_WATCHDOG_TIMEOUT) {
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		} else if (reg_val == WAVE5_SYSERR_VLC_BUF_FULL) {
> +			return RETCODE_VLC_BUF_FULL;
> +		} else if (reg_val == WAVE5_SYSERR_BUS_ERROR || reg_val == WAVE5_SYSERR_DOUBLE_FAULT) {
> +			return RETCODE_VPU_BUS_ERROR;
> +		} else {
> +			return RETCODE_FAILURE;
> +		}
> +	}
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_vpu_dec_get_result(struct vpu_instance *vpu_inst, struct dec_output_info *result)
> +{
> +	enum ret_code              ret;
> +	u32               reg_val, sub_layer_info, index, nal_unit_type;
> +	struct dec_info *p_dec_info;
> +	struct vpu_device *vpu_dev = vpu_inst->dev;
> +
> +	p_dec_info = &vpu_inst->codec_info->dec_info;
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_ADDR_REPORT_BASE, p_dec_info->user_data_buf_addr);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_REPORT_SIZE,      p_dec_info->user_data_buf_size);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_REPORT_PARAM,
> +		      VPU_USER_DATA_ENDIAN & VDI_128BIT_ENDIAN_MASK);
> +
> +	// send QUERY cmd
> +	ret = send_query(vpu_inst, GET_RESULT);
> +
> +	if (ret != RETCODE_SUCCESS) {
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_FAIL_REASON);
> +		if (reg_val != WAVE5_SYSERR_QUEUEING_FAIL)
> +			pr_err("FAIL_REASON = 0x%x\n", reg_val);
> +
> +		if (reg_val == WAVE5_SYSERR_RESULT_NOT_READY)
> +			return RETCODE_REPORT_NOT_READY;
> +		else if (reg_val == WAVE5_SYSERR_ACCESS_VIOLATION_HW)
> +			return RETCODE_MEMORY_ACCESS_VIOLATION;
> +		else if (reg_val == WAVE5_SYSERR_WATCHDOG_TIMEOUT)
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		else if (reg_val == WAVE5_SYSERR_VLC_BUF_FULL)
> +			return RETCODE_VLC_BUF_FULL;
> +		else if (reg_val == WAVE5_SYSERR_BUS_ERROR || reg_val == WAVE5_SYSERR_DOUBLE_FAULT)
> +			return RETCODE_VPU_BUS_ERROR;
> +		else
> +			return RETCODE_QUERY_FAILURE;
> +	}
> +
> +	dev_dbg(vpu_inst->dev->dev, "dec pic complete\n");
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_QUEUE_STATUS);
> +
> +	p_dec_info->instance_queue_count = (reg_val >> 16) & 0xff;
> +	p_dec_info->report_queue_count   = (reg_val & 0xffff);
> +
> +	result->decoding_success = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_DECODING_SUCCESS);
> +	if (!result->decoding_success)
> +		result->error_reason = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_ERR_INFO);
> +	else
> +		result->warn_info = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_WARN_INFO);
> +
> +	result->dec_output_ext_data.user_data_size   = 0;
> +	result->dec_output_ext_data.user_data_num    = 0;
> +	result->dec_output_ext_data.user_data_buf_full = 0;
> +	result->dec_output_ext_data.user_data_header = vpu_read_reg(vpu_inst->dev,
> +								    W5_RET_DEC_USERDATA_IDC);
> +	if (result->dec_output_ext_data.user_data_header != 0) {
> +		reg_val = result->dec_output_ext_data.user_data_header;
> +		for (index = 0; index < 32; index++) {
> +			if (index == 1) {
> +				if (reg_val & (1 << index))
> +					result->dec_output_ext_data.user_data_buf_full = 1;
> +			} else if (reg_val & (1 << index)) {
> +				result->dec_output_ext_data.user_data_num++;
> +			}
> +		}
> +		result->dec_output_ext_data.user_data_size = p_dec_info->user_data_buf_size;
> +	}
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PIC_TYPE);
> +
> +	nal_unit_type     = (reg_val & 0x3f0) >> 4;
> +	result->nal_type = nal_unit_type;
> +
> +	if (vpu_inst->std == W_VP9_DEC) {
> +		if      (reg_val & 0x01)
> +			result->pic_type = PIC_TYPE_I;
> +		else if (reg_val & 0x02)
> +			result->pic_type = PIC_TYPE_P;
> +		else if (reg_val & 0x04)
> +			result->pic_type = PIC_TYPE_REPEAT;
> +		else
> +			result->pic_type = PIC_TYPE_MAX;
> +	} else if (vpu_inst->std == W_HEVC_DEC) {
> +		if      (reg_val & 0x04)
> +			result->pic_type = PIC_TYPE_B;
> +		else if (reg_val & 0x02)
> +			result->pic_type = PIC_TYPE_P;
> +		else if (reg_val & 0x01)
> +			result->pic_type = PIC_TYPE_I;
> +		else
> +			result->pic_type = PIC_TYPE_MAX;
> +		if ((nal_unit_type == 19 || nal_unit_type == 20) && result->pic_type == PIC_TYPE_I)
> +			/* IDR_W_RADL, IDR_N_LP */
> +			result->pic_type = PIC_TYPE_IDR;
> +	} else if (vpu_inst->std == W_AVC_DEC) {
> +		if      (reg_val & 0x04)
> +			result->pic_type = PIC_TYPE_B;
> +		else if (reg_val & 0x02)
> +			result->pic_type = PIC_TYPE_P;
> +		else if (reg_val & 0x01)
> +			result->pic_type = PIC_TYPE_I;
> +		else
> +			result->pic_type = PIC_TYPE_MAX;
> +		if (nal_unit_type == 5 && result->pic_type == PIC_TYPE_I)
> +			result->pic_type = PIC_TYPE_IDR;
> +	} else if (vpu_inst->std == W_AV1_DEC) {
> +		switch (reg_val & 0x07) {
> +		case 0:
> +			result->pic_type = PIC_TYPE_KEY;        break;
> +		case 1:
> +			result->pic_type = PIC_TYPE_INTER;      break;
> +		case 2:
> +			result->pic_type = PIC_TYPE_AV1_INTRA;  break;
> +		case 3:
> +			result->pic_type = PIC_TYPE_AV1_SWITCH; break;
> +		default:
> +			result->pic_type = PIC_TYPE_MAX; break;
> +		}
> +	} else {  // AVS2
> +		switch (reg_val & 0x07) {
> +		case 0:
> +			result->pic_type = PIC_TYPE_I;      break;
> +		case 1:
> +			result->pic_type = PIC_TYPE_P;      break;
> +		case 2:
> +			result->pic_type = PIC_TYPE_B;      break;
> +		case 3:
> +			result->pic_type = PIC_TYPE_AVS2_F; break;
> +		case 4:
> +			result->pic_type = PIC_TYPE_AVS2_S; break;
> +		case 5:
> +			result->pic_type = PIC_TYPE_AVS2_G; break;
> +		case 6:
> +			result->pic_type = PIC_TYPE_AVS2_GB; break;
> +		default:
> +			result->pic_type = PIC_TYPE_MAX; break;
> +		}
> +	}
> +	result->output_flag                = (reg_val >> 31) & 0x1;
> +	result->ctu_size                   = 16 << ((reg_val >> 10) & 0x3);
> +	index                             = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_DISPLAY_INDEX);
> +	result->index_frame_display         = index;
> +	result->index_frame_display_for_tiled = index;
> +	index                             = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_DECODED_INDEX);
> +	result->index_frame_decoded         = index;
> +	result->index_frame_decoded_for_tiled = index;
> +
> +	sub_layer_info = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_SUB_LAYER_INFO);
> +	result->temporal_id = sub_layer_info & 0x7;
> +
> +	if (vpu_inst->std == W_HEVC_DEC) {
> +		result->decoded_poc = -1;
> +		result->display_poc = -1;
> +		if (result->index_frame_decoded >= 0 ||
> +		    result->index_frame_decoded == DECODED_IDX_FLAG_SKIP)
> +			result->decoded_poc = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PIC_POC);
> +	} else if (vpu_inst->std == W_AVS2_DEC) {
> +		result->avs2_info.decoded_poi = -1;
> +		result->avs2_info.display_poi = -1;
> +		if (result->index_frame_decoded >= 0)
> +			result->avs2_info.decoded_poi =
> +				vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PIC_POC);
> +	} else if (vpu_inst->std == W_AVC_DEC) {
> +		result->decoded_poc = -1;
> +		result->display_poc = -1;
> +		if (result->index_frame_decoded >= 0 ||
> +		    result->index_frame_decoded == DECODED_IDX_FLAG_SKIP)
> +			result->decoded_poc = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PIC_POC);
> +	} else if (vpu_inst->std == W_AV1_DEC) {
> +		result->decoded_poc = -1;
> +		result->display_poc = -1;
> +		if (result->index_frame_decoded >= 0 ||
> +		    result->index_frame_decoded == DECODED_IDX_FLAG_SKIP)
> +			result->decoded_poc = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PIC_POC);
> +
> +		result->av1_info.spatial_id = (sub_layer_info >> 19) & 0x3;
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PIC_PARAM);
> +		result->av1_info.allow_intra_bc            = (reg_val >> 0) & 0x1;
> +		result->av1_info.allow_screen_content_tools = (reg_val >> 1) & 0x1;
> +	}
> +
> +	result->sequence_changed = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_NOTIFICATION);
> +	if (result->sequence_changed & SEQ_CHANGE_INTER_RES_CHANGE)
> +		result->index_inter_frame_decoded = vpu_read_reg(vpu_inst->dev,
> +								 W5_RET_DEC_REALLOC_INDEX);
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PIC_SIZE);
> +	result->dec_pic_width  = reg_val >> 16;
> +	result->dec_pic_height = reg_val & 0xffff;
> +
> +	if (result->sequence_changed) {
> +		memcpy((void *)&p_dec_info->new_seq_info, (void *)&p_dec_info->initial_info,
> +		       sizeof(struct dec_initial_info));
> +		get_dec_sequence_result(vpu_inst, &p_dec_info->new_seq_info);
> +	}
> +
> +	result->num_of_err_m_bs     = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_ERR_CTB_NUM) >> 16;
> +	result->num_of_tot_m_bs     = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_ERR_CTB_NUM) & 0xffff;
> +	result->byte_pos_frame_start = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_AU_START_POS);
> +	result->byte_pos_frame_end   = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_AU_END_POS);
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_RECOVERY_POINT);
> +	result->h265_rp_sei.recovery_poc_cnt = reg_val & 0xFFFF;            // [15:0]
> +	result->h265_rp_sei.exact_match_flag = (reg_val >> 16) & 0x01;        // [16]
> +	result->h265_rp_sei.broken_link_flag = (reg_val >> 17) & 0x01;        // [17]
> +	result->h265_rp_sei.exist =  (reg_val >> 18) & 0x01;                // [18]
> +	if (result->h265_rp_sei.exist == 0) {
> +		result->h265_rp_sei.recovery_poc_cnt = 0;
> +		result->h265_rp_sei.exact_match_flag = 0;
> +		result->h265_rp_sei.broken_link_flag = 0;
> +	}
> +
> +	result->dec_host_cmd_tick     = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_HOST_CMD_TICK);
> +	result->dec_seek_start_tick   = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_SEEK_START_TICK);
> +	result->dec_seek_end_tick     = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_SEEK_END_TICK);
> +	result->dec_parse_start_tick  = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PARSING_START_TICK);
> +	result->dec_parse_end_tick    = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_PARSING_END_TICK);
> +	result->dec_decode_start_tick = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_DECODING_START_TICK);
> +	result->dec_decode_end_tick   = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_DECODING_ENC_TICK);
> +
> +	if (!p_dec_info->first_cycle_check) {
> +		result->frame_cycle =
> +			(result->dec_decode_end_tick - result->dec_host_cmd_tick) *
> +			p_dec_info->cycle_per_tick;
> +		vpu_dev->last_performance_cycles = result->dec_decode_end_tick;
> +		p_dec_info->first_cycle_check           = TRUE;
> +	} else if (result->index_frame_decoded_for_tiled != -1) {
> +		result->frame_cycle =
> +			(result->dec_decode_end_tick - vpu_dev->last_performance_cycles) *
> +			p_dec_info->cycle_per_tick;
> +		vpu_dev->last_performance_cycles = result->dec_decode_end_tick;
> +		if (vpu_dev->last_performance_cycles < result->dec_host_cmd_tick)
> +			result->frame_cycle   =
> +				(result->dec_decode_end_tick - result->dec_host_cmd_tick);
> +	}
> +	result->seek_cycle    =
> +		(result->dec_seek_end_tick   - result->dec_seek_start_tick) *
> +		p_dec_info->cycle_per_tick;
> +	result->parse_cycle   =
> +		(result->dec_parse_end_tick  - result->dec_parse_start_tick) *
> +		p_dec_info->cycle_per_tick;
> +	result->decoded_cycle =
> +		(result->dec_decode_end_tick - result->dec_decode_start_tick) *
> +		p_dec_info->cycle_per_tick;
> +
> +	// no remaining command. reset frame cycle.
> +	if (0 == p_dec_info->instance_queue_count && 0 == p_dec_info->report_queue_count)
> +		p_dec_info->first_cycle_check = FALSE;
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_vpu_re_init(struct device *dev, void *firmware, uint32_t size)
> +{
> +	struct vpu_platform_data *pdata = dev_get_platdata(dev);
> +	struct vpu_buf *vb;
> +	dma_addr_t code_base, temp_base;
> +	dma_addr_t old_code_base, temp_size;
> +	u32          code_size;
> +	u32          reg_val, remap_size;
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	vb = &vpu_dev->common_mem;
> +
> +	code_base = vb->daddr;
> +	/* ALIGN TO 4KB */
> +	code_size = (WAVE5_MAX_CODE_BUF_SIZE & ~0xfff);
> +	if (code_size < size * 2)
> +		return RETCODE_INSUFFICIENT_RESOURCE;
> +	temp_base = vb->daddr + WAVE5_TEMPBUF_OFFSET;
> +	temp_size = WAVE5_TEMPBUF_SIZE;
> +
> +	old_code_base = vpu_read_reg(vpu_dev, W5_VPU_REMAP_PADDR);
> +
> +	if (old_code_base != code_base + W5_REMAP_INDEX1 * W5_REMAP_MAX_SIZE) {
> +		u32 hw_option = 0;
> +
> +		vpu_write_mem(vpu_dev, vb, 0, (unsigned char *)firmware, size * 2,
> +			      VDI_128BIT_LITTLE_ENDIAN);
> +
> +		reg_val = 0;
> +		vpu_write_reg(vpu_dev, W5_PO_CONF, reg_val);
> +
> +		wave5_vpu_reset(dev, SW_RESET_ON_BOOT);
> +
> +		/* remap page size 0*/
> +		remap_size = (W5_REMAP_MAX_SIZE >> 12) & 0x1ff;
> +		reg_val = 0x80000000 | (WAVE5_UPPER_PROC_AXI_ID << 20) | (0 << 16)
> +			| (W5_REMAP_INDEX0 << 12) | (1 << 11) | remap_size;
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_CTRL, reg_val);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_VADDR, W5_REMAP_INDEX0 * W5_REMAP_MAX_SIZE);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_PADDR,
> +			      code_base + W5_REMAP_INDEX0 * W5_REMAP_MAX_SIZE);
> +
> +		/* remap page size 1*/
> +		remap_size = (W5_REMAP_MAX_SIZE >> 12) & 0x1ff;
> +		reg_val = 0x80000000 | (WAVE5_UPPER_PROC_AXI_ID << 20) | (0 << 16)
> +			| (W5_REMAP_INDEX1 << 12) | (1 << 11) | remap_size;
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_CTRL, reg_val);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_VADDR, W5_REMAP_INDEX1 * W5_REMAP_MAX_SIZE);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_PADDR,
> +			      code_base + W5_REMAP_INDEX1 * W5_REMAP_MAX_SIZE);
> +
> +		vpu_write_reg(vpu_dev, W5_ADDR_CODE_BASE,  code_base);
> +		vpu_write_reg(vpu_dev, W5_CODE_SIZE,       code_size);
> +		vpu_write_reg(vpu_dev, W5_CODE_PARAM,      (WAVE5_UPPER_PROC_AXI_ID << 4) | 0);
> +		vpu_write_reg(vpu_dev, W5_ADDR_TEMP_BASE,  temp_base);
> +		vpu_write_reg(vpu_dev, W5_TEMP_SIZE,       temp_size);
> +
> +		if (pdata && pdata->get_hwoption)
> +			hw_option |= pdata->get_hwoption(dev);
> +		vpu_write_reg(vpu_dev, W5_HW_OPTION, hw_option);
> +
> +		/* interrupt */
> +		// encoder
> +		reg_val  = (1 << INT_WAVE5_ENC_SET_PARAM);
> +		reg_val |= (1 << INT_WAVE5_ENC_PIC);
> +		reg_val |= (1 << INT_WAVE5_BSBUF_FULL);
> +		// decoder
> +		reg_val |= (1 << INT_WAVE5_INIT_SEQ);
> +		reg_val |= (1 << INT_WAVE5_DEC_PIC);
> +		reg_val |= (1 << INT_WAVE5_BSBUF_EMPTY);
> +		vpu_write_reg(vpu_dev, W5_VPU_VINT_ENABLE, reg_val);
> +
> +		reg_val = vpu_read_reg(vpu_dev, W5_VPU_RET_VPU_CONFIG0);
> +		if (((reg_val >> 16) & 1) == 1) {
> +			reg_val = ((WAVE5_PROC_AXI_ID << 28)  |
> +					(WAVE5_PRP_AXI_ID << 24)   |
> +					(WAVE5_FBD_Y_AXI_ID << 20) |
> +					(WAVE5_FBC_Y_AXI_ID << 16) |
> +					(WAVE5_FBD_C_AXI_ID << 12) |
> +					(WAVE5_FBC_C_AXI_ID << 8)  |
> +					(WAVE5_PRI_AXI_ID << 4)    |
> +					(WAVE5_SEC_AXI_ID << 0));
> +			vdi_fio_write_register(vpu_dev, W5_BACKBONE_PROG_AXI_ID, reg_val);
> +		}
> +
> +		vb = get_sram_memory(vpu_dev);
> +		if (!vb)  // get SRAM base/size
> +			return RETCODE_INSUFFICIENT_RESOURCE;
> +
> +		vpu_write_reg(vpu_dev, W5_ADDR_SEC_AXI,         vb->daddr);
> +		vpu_write_reg(vpu_dev, W5_SEC_AXI_SIZE,         vb->size);
> +		vpu_write_reg(vpu_dev, W5_VPU_BUSY_STATUS,      1);
> +		vpu_write_reg(vpu_dev, W5_COMMAND,              W5_INIT_VPU);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_CORE_START, 1);
> +
> +		if (vdi_wait_vpu_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +			pr_err("VPU reinit(W5_VPU_REMAP_CORE_START) timeout\n");
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		}
> +
> +		reg_val = vpu_read_reg(vpu_dev, W5_RET_SUCCESS);
> +		if (reg_val == 0) {
> +			u32 reason_code = vpu_read_reg(vpu_dev, W5_RET_FAIL_REASON);
> +
> +			pr_err("VPU reinit(W5_RET_SUCCESS) failed(%d) REASON CODE(%08x)\n",
> +			       reg_val, reason_code);
> +			return RETCODE_FAILURE;
> +		}
> +	}
> +
> +	setup_wave5_properties(dev);
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_vpu_sleep_wake(struct device *dev, int i_sleep_wake, const uint16_t *code,
> +				   uint32_t size)
> +{
> +	struct vpu_platform_data *pdata = dev_get_platdata(dev);
> +	u32          reg_val;
> +	struct vpu_buf    *vb;
> +	dma_addr_t code_base;
> +	u32          code_size;
> +	u32          remap_size;
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	if (i_sleep_wake == 1) {
> +		if (vdi_wait_vpu_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1)
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +
> +		vpu_write_reg(vpu_dev, W5_VPU_BUSY_STATUS, 1);
> +		vpu_write_reg(vpu_dev, W5_COMMAND, W5_SLEEP_VPU);
> +		vpu_write_reg(vpu_dev, W5_VPU_HOST_INT_REQ, 1);
> +
> +		if (vdi_wait_vpu_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1)
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +
> +		if (!vpu_read_reg(vpu_dev, W5_RET_SUCCESS)) {
> +			u32 reason = vpu_read_reg(vpu_dev, W5_RET_FAIL_REASON);
> +
> +			dev_dbg(dev, "SLEEP_VPU failed [0x%x]", reason);
> +
> +			if (reason == WAVE5_SYSERR_VPU_STILL_RUNNING)
> +				return RETCODE_VPU_STILL_RUNNING;
> +			else if (reason == WAVE5_SYSERR_BUS_ERROR || reason ==
> +					WAVE5_SYSERR_DOUBLE_FAULT)
> +				return RETCODE_VPU_BUS_ERROR;
> +			else
> +				return RETCODE_QUERY_FAILURE;
> +		}
> +	} else { /* restore */
> +		u32 hw_option = 0;
> +
> +		vb = &vpu_dev->common_mem;
> +
> +		code_base = vb->daddr;
> +		/* ALIGN TO 4KB */
> +		code_size = (WAVE5_MAX_CODE_BUF_SIZE & ~0xfff);
> +		if (code_size < size * 2)
> +			return RETCODE_INSUFFICIENT_RESOURCE;
> +
> +		reg_val = 0;
> +		vpu_write_reg(vpu_dev, W5_PO_CONF, reg_val);
> +
> +		/* remap page size 0*/
> +		remap_size = (W5_REMAP_MAX_SIZE >> 12) & 0x1ff;
> +		reg_val = 0x80000000 | (WAVE5_UPPER_PROC_AXI_ID << 20) | (0 << 16)
> +			| (W5_REMAP_INDEX0 << 12) | (1 << 11) | remap_size;
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_CTRL,  reg_val);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_VADDR, W5_REMAP_INDEX0 * W5_REMAP_MAX_SIZE);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_PADDR,
> +			      code_base + W5_REMAP_INDEX0 * W5_REMAP_MAX_SIZE);
> +
> +		/* remap page size 1*/
> +		remap_size = (W5_REMAP_MAX_SIZE >> 12) & 0x1ff;
> +		reg_val = 0x80000000 | (WAVE5_UPPER_PROC_AXI_ID << 20) | (0 << 16)
> +			| (W5_REMAP_INDEX1 << 12) | (1 << 11) | remap_size;
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_CTRL,  reg_val);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_VADDR, W5_REMAP_INDEX1 * W5_REMAP_MAX_SIZE);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_PADDR,
> +			      code_base + W5_REMAP_INDEX1 * W5_REMAP_MAX_SIZE);
> +
> +		vpu_write_reg(vpu_dev, W5_ADDR_CODE_BASE,  code_base);
> +		vpu_write_reg(vpu_dev, W5_CODE_SIZE,       code_size);
> +		vpu_write_reg(vpu_dev, W5_CODE_PARAM,      (WAVE5_UPPER_PROC_AXI_ID << 4) | 0);
> +
> +		if (pdata && pdata->get_hwoption)
> +			hw_option |= pdata->get_hwoption(dev);
> +		vpu_write_reg(vpu_dev, W5_HW_OPTION, hw_option);
> +
> +		/* interrupt */
> +		// encoder
> +		reg_val  = (1 << INT_WAVE5_ENC_SET_PARAM);
> +		reg_val |= (1 << INT_WAVE5_ENC_PIC);
> +		reg_val |= (1 << INT_WAVE5_BSBUF_FULL);
> +		// decoder
> +		reg_val |= (1 << INT_WAVE5_INIT_SEQ);
> +		reg_val |= (1 << INT_WAVE5_DEC_PIC);
> +		reg_val |= (1 << INT_WAVE5_BSBUF_EMPTY);
> +		vpu_write_reg(vpu_dev, W5_VPU_VINT_ENABLE, reg_val);
> +
> +		reg_val = vpu_read_reg(vpu_dev, W5_VPU_RET_VPU_CONFIG0);
> +		if (((reg_val >> 16) & 1) == 1) {
> +			reg_val = ((WAVE5_PROC_AXI_ID << 28)  |
> +					(WAVE5_PRP_AXI_ID << 24)   |
> +					(WAVE5_FBD_Y_AXI_ID << 20) |
> +					(WAVE5_FBC_Y_AXI_ID << 16) |
> +					(WAVE5_FBD_C_AXI_ID << 12) |
> +					(WAVE5_FBC_C_AXI_ID << 8)  |
> +					(WAVE5_PRI_AXI_ID << 4)    |
> +					(WAVE5_SEC_AXI_ID << 0));
> +			vdi_fio_write_register(vpu_dev, W5_BACKBONE_PROG_AXI_ID, reg_val);
> +		}
> +
> +		vpu_write_reg(vpu_dev, W5_VPU_BUSY_STATUS,      1);
> +		vpu_write_reg(vpu_dev, W5_COMMAND,              W5_WAKEUP_VPU);
> +		vpu_write_reg(vpu_dev, W5_VPU_REMAP_CORE_START, 1);
> +
> +		if (vdi_wait_vpu_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +			pr_err("VPU wakeup(W5_VPU_REMAP_CORE_START) timeout\n");
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		}
> +
> +		reg_val = vpu_read_reg(vpu_dev, W5_RET_SUCCESS);
> +		if (reg_val == 0) {
> +			u32 reason_code = vpu_read_reg(vpu_dev, W5_RET_FAIL_REASON);
> +
> +			pr_err("VPU wakeup(W5_RET_SUCCESS) failed(%d) REASON CODE(%08x)\n",
> +			       reg_val, reason_code);
> +			return RETCODE_FAILURE;
> +		}
> +	}
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_vpu_reset(struct device *dev, enum sw_reset_mode reset_mode)
> +{
> +	u32   val   = 0;
> +	enum ret_code  ret   = RETCODE_SUCCESS;
> +	struct vpu_device *vpu_dev = (struct vpu_device *)dev_get_drvdata(dev);
> +	struct vpu_attr *p_attr = &vpu_dev->attr;
> +	// VPU doesn't send response. force to set BUSY flag to 0.
> +	vpu_write_reg(vpu_dev, W5_VPU_BUSY_STATUS, 0);
> +
> +	if (reset_mode == SW_RESET_SAFETY) {
> +		ret = wave5_vpu_sleep_wake(dev, TRUE, NULL, 0);
> +		if (ret != RETCODE_SUCCESS)
> +			return ret;
> +	}
> +
> +	val = vpu_read_reg(vpu_dev, W5_VPU_RET_VPU_CONFIG0);
> +	if (((val >> 16) & 0x1) == 0x01)
> +		p_attr->support_backbone = TRUE;
> +	if (((val >> 22) & 0x1) == 0x01)
> +		p_attr->support_vcore_backbone = TRUE;
> +	if (((val >> 28) & 0x1) == 0x01)
> +		p_attr->support_vcpu_backbone = TRUE;
> +
> +	val = vpu_read_reg(vpu_dev, W5_VPU_RET_VPU_CONFIG1);
> +	if (((val >> 26) & 0x1) == 0x01)
> +		p_attr->support_dual_core = TRUE;
> +
> +	// waiting for completion of bus transaction
> +	if (p_attr->support_backbone) {
> +		if (p_attr->support_dual_core) {
> +			// check CORE0
> +			vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x7);
> +
> +			if (vdi_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +					      W5_BACKBONE_BUS_STATUS_VCORE0) == -1) {
> +				vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x00);
> +				return RETCODE_VPU_RESPONSE_TIMEOUT;
> +			}
> +
> +			// check CORE1
> +			vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE1, 0x7);
> +
> +			if (vdi_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +					      W5_BACKBONE_BUS_STATUS_VCORE1) == -1) {
> +				vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE1, 0x00);
> +				return RETCODE_VPU_RESPONSE_TIMEOUT;
> +			}
> +
> +		} else {
> +			if (p_attr->support_vcore_backbone) {
> +				if (p_attr->support_vcpu_backbone) {
> +					// step1 : disable request
> +					vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCPU,
> +							       0xFF);
> +
> +					// step2 : waiting for completion of bus transaction
> +					if (vdi_wait_vcpu_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +								   W5_BACKBONE_BUS_STATUS_VCPU) == -1) {
> +						vdi_fio_write_register(vpu_dev,
> +								       W5_BACKBONE_BUS_CTRL_VCPU, 0x00);
> +						return RETCODE_VPU_RESPONSE_TIMEOUT;
> +					}
> +				}
> +				// step1 : disable request
> +				vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x7);
> +
> +				// step2 : waiting for completion of bus transaction
> +				if (vdi_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +						      W5_BACKBONE_BUS_STATUS_VCORE0) == -1) {
> +					vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x00);
> +					return RETCODE_VPU_RESPONSE_TIMEOUT;
> +				}
> +			} else {
> +				// step1 : disable request
> +				vdi_fio_write_register(vpu_dev, W5_COMBINED_BACKBONE_BUS_CTRL, 0x7);
> +
> +				// step2 : waiting for completion of bus transaction
> +				if (vdi_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +						      W5_COMBINED_BACKBONE_BUS_STATUS) == -1) {
> +					vdi_fio_write_register(vpu_dev, W5_COMBINED_BACKBONE_BUS_CTRL, 0x00);
> +					return RETCODE_VPU_RESPONSE_TIMEOUT;
> +				}
> +			}
> +		}
> +	} else {
> +		// step1 : disable request
> +		vdi_fio_write_register(vpu_dev, W5_GDI_BUS_CTRL, 0x100);
> +
> +		// step2 : waiting for completion of bus transaction
> +		if (vdi_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_GDI_BUS_STATUS) == -1) {
> +			vdi_fio_write_register(vpu_dev, W5_GDI_BUS_CTRL, 0x00);
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		}
> +	}
> +
> +	switch (reset_mode) {
> +	case SW_RESET_ON_BOOT:
> +	case SW_RESET_FORCE:
> +	case SW_RESET_SAFETY:
> +		val = W5_RST_BLOCK_ALL;
> +		break;
> +	default:
> +		return RETCODE_INVALID_PARAM;
> +	}
> +
> +	if (val) {
> +		vpu_write_reg(vpu_dev, W5_VPU_RESET_REQ, val);
> +
> +		if (vdi_wait_vpu_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_RESET_STATUS) == -1) {
> +			vpu_write_reg(vpu_dev, W5_VPU_RESET_REQ, 0);
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		}
> +		vpu_write_reg(vpu_dev, W5_VPU_RESET_REQ, 0);
> +	}
> +	// step3 : must clear GDI_BUS_CTRL after done SW_RESET
> +	if (p_attr->support_backbone) {
> +		if (p_attr->support_dual_core) {
> +			vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x00);
> +			vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE1, 0x00);
> +		} else {
> +			if (p_attr->support_vcore_backbone) {
> +				if (p_attr->support_vcpu_backbone)
> +					vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCPU, 0x00);
> +				vdi_fio_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x00);
> +			} else {
> +				vdi_fio_write_register(vpu_dev, W5_COMBINED_BACKBONE_BUS_CTRL, 0x00);
> +			}
> +		}
> +	} else {
> +		vdi_fio_write_register(vpu_dev, W5_GDI_BUS_CTRL, 0x00);
> +	}
> +	if (reset_mode == SW_RESET_SAFETY || reset_mode == SW_RESET_FORCE)
> +		ret = wave5_vpu_sleep_wake(dev, FALSE, NULL, 0);
> +
> +	return ret;
> +}
> +
> +enum ret_code wave5_vpu_dec_fini_seq(struct vpu_instance *vpu_inst)
> +{
> +	enum ret_code ret = RETCODE_SUCCESS;
> +
> +	wave5_bit_issue_command(vpu_inst, W5_DESTROY_INSTANCE);
> +	if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1)
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +
> +	if (!vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS)) {
> +		u32 reg_val;
> +
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_FAIL_REASON);
> +		if (reg_val != WAVE5_SYSERR_QUEUEING_FAIL && reg_val != WAVE5_SYSERR_VPU_STILL_RUNNING)
> +			pr_err("FAIL_REASON = 0x%x\n", reg_val);
> +
> +		if (reg_val == WAVE5_SYSERR_VPU_STILL_RUNNING)
> +			ret = RETCODE_VPU_STILL_RUNNING;
> +		else if (reg_val == WAVE5_SYSERR_ACCESS_VIOLATION_HW)
> +			ret = RETCODE_MEMORY_ACCESS_VIOLATION;
> +		else if (reg_val == WAVE5_SYSERR_WATCHDOG_TIMEOUT)
> +			ret = RETCODE_VPU_RESPONSE_TIMEOUT;
> +		else if (reg_val == WAVE5_SYSERR_VLC_BUF_FULL)
> +			ret = RETCODE_VLC_BUF_FULL;
> +		else if (reg_val == WAVE5_SYSERR_BUS_ERROR || reg_val == WAVE5_SYSERR_DOUBLE_FAULT)
> +			ret = RETCODE_VPU_BUS_ERROR;
> +		else
> +			ret = RETCODE_FAILURE;
> +	}
> +
> +	return ret;
> +}
> +
> +enum ret_code wave5_vpu_dec_set_bitstream_flag(struct vpu_instance *vpu_inst, bool eos)
> +{
> +	struct dec_info *p_dec_info = &vpu_inst->codec_info->dec_info;
> +	enum bit_stream_mode bs_mode = (enum bit_stream_mode)p_dec_info->open_param.bitstream_mode;
> +
> +	p_dec_info->stream_endflag = (eos == 1) ? TRUE : FALSE;
> +
> +	if (bs_mode == BS_MODE_INTERRUPT) {
> +		vpu_write_reg(vpu_inst->dev, W5_BS_OPTION, (p_dec_info->stream_endflag << 1));
> +		vpu_write_reg(vpu_inst->dev, W5_BS_WR_PTR, p_dec_info->stream_wr_ptr);
> +
> +		wave5_bit_issue_command(vpu_inst, W5_UPDATE_BS);
> +		if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1)
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +
> +		if (vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS) == 0)
> +			return RETCODE_FAILURE;
> +	}
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_dec_clr_disp_flag(struct vpu_instance *vpu_inst, uint32_t index)
> +{
> +	enum ret_code ret;
> +	struct dec_info *p_dec_info;
> +
> +	p_dec_info   = &vpu_inst->codec_info->dec_info;
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_CLR_DISP_IDC, (1 << index));
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_SET_DISP_IDC, 0);
> +	ret = send_query(vpu_inst, UPDATE_DISP_FLAG);
> +
> +	if (ret != RETCODE_SUCCESS) {
> +		pr_err("%s: QUERY FAILURE\n", __func__);
> +		return RETCODE_QUERY_FAILURE;
> +	}
> +
> +	p_dec_info->frame_display_flag = vpu_read_reg(vpu_inst->dev, W5_RET_DEC_DISP_IDC);
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_vpu_clear_interrupt(struct vpu_instance *vpu_inst, uint32_t flags)
> +{
> +	u32 interrupt_reason;
> +
> +	interrupt_reason = vpu_read_reg(vpu_inst->dev, W5_VPU_VINT_REASON_USR);
> +	interrupt_reason &= ~flags;
> +	vpu_write_reg(vpu_inst->dev, W5_VPU_VINT_REASON_USR, interrupt_reason);
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +dma_addr_t wave5_vpu_dec_get_rd_ptr(struct vpu_instance *vpu_inst)
> +{
> +	enum ret_code ret;
> +
> +	ret = send_query(vpu_inst, GET_BS_RD_PTR);
> +
> +	if (ret != RETCODE_SUCCESS)
> +		return vpu_inst->codec_info->dec_info.stream_rd_ptr;
> +
> +	return vpu_read_reg(vpu_inst->dev, W5_RET_QUERY_DEC_BS_RD_PTR);
> +}
> +
> +/************************************************************************/
> +/*                       ENCODER functions                              */
> +/************************************************************************/
> +
> +enum ret_code wave5_vpu_build_up_enc_param(struct device *dev, struct vpu_instance *vpu_inst,
> +					   struct enc_open_param *param)
> +{
> +	enum ret_code      ret      = RETCODE_SUCCESS;
> +	struct enc_info *p_enc_info = &vpu_inst->codec_info->enc_info;
> +	u32       reg_val   = 0;
> +	struct vpu_buf *vb;
> +	u32       bs_endian;
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	vb = get_sram_memory(vpu_dev);
> +	p_enc_info->sec_axi_info.buf_base = vb->daddr;
> +	p_enc_info->sec_axi_info.buf_size = vb->size;
> +
> +	if (vpu_dev->product == PRODUCT_ID_521)
> +		p_enc_info->vb_work.size       = WAVE521ENC_WORKBUF_SIZE;
> +
> +	if (vdi_allocate_dma_memory(vpu_dev, &p_enc_info->vb_work) < 0) {
> +		memset(&p_enc_info->vb_work, 0, sizeof(p_enc_info->vb_work));
> +		return RETCODE_INSUFFICIENT_RESOURCE;
> +	}
> +
> +	vdi_clear_memory(vpu_dev, &p_enc_info->vb_work);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_ADDR_WORK_BASE, p_enc_info->vb_work.daddr);
> +	vpu_write_reg(vpu_inst->dev, W5_WORK_SIZE,      p_enc_info->vb_work.size);
> +
> +	reg_val = vdi_convert_endian(vpu_dev, param->stream_endian);
> +	bs_endian = (~reg_val & VDI_128BIT_ENDIAN_MASK);
> +
> +	reg_val = (param->line_buf_int_en << 6) | bs_endian;
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_BS_PARAM, reg_val);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_NUM_CQ_DEPTH_M1, (COMMAND_QUEUE_DEPTH - 1));
> +
> +	reg_val = 0;
> +	if (vpu_dev->product == PRODUCT_ID_521)
> +		reg_val |= (param->sub_frame_sync_enable | param->sub_frame_sync_mode << 1);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SRC_OPTIONS, reg_val);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_VCORE_INFO, 1);
> +
> +	wave5_bit_issue_command(vpu_inst, W5_CREATE_INSTANCE);
> +	// check QUEUE_DONE
> +	if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +		dev_warn(vpu_inst->dev->dev, "create instance timed out\n");
> +		vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_work);
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	// FAILED for adding into VCPU QUEUE
> +	if (!vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS)) {
> +		vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_work);
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_FAIL_REASON);
> +		if (reg_val != WAVE5_SYSERR_QUEUEING_FAIL)
> +			pr_err("FAIL_REASON = 0x%x\n", reg_val);
> +		if (reg_val == 2)
> +			ret = RETCODE_INVALID_SFS_INSTANCE;
> +		else if (reg_val == WAVE5_SYSERR_WATCHDOG_TIMEOUT)
> +			ret = RETCODE_VPU_RESPONSE_TIMEOUT;
> +		else if (reg_val == WAVE5_SYSERR_BUS_ERROR || reg_val == WAVE5_SYSERR_DOUBLE_FAULT)
> +			ret = RETCODE_VPU_BUS_ERROR;
> +		else
> +			ret = RETCODE_FAILURE;
> +	}
> +
> +	p_enc_info->sub_frame_sync_config.sub_frame_sync_mode = param->sub_frame_sync_mode;
> +	p_enc_info->sub_frame_sync_config.sub_frame_sync_on   = param->sub_frame_sync_enable;
> +	p_enc_info->stream_rd_ptr                = param->bitstream_buffer;
> +	p_enc_info->stream_wr_ptr                = param->bitstream_buffer;
> +	p_enc_info->line_buf_int_en               = param->line_buf_int_en;
> +	p_enc_info->stream_buf_start_addr         = param->bitstream_buffer;
> +	p_enc_info->stream_buf_size              = param->bitstream_buffer_size;
> +	p_enc_info->stream_buf_end_addr  = param->bitstream_buffer + param->bitstream_buffer_size;
> +	p_enc_info->stride                     = 0;
> +	p_enc_info->initial_info_obtained        = 0;
> +	p_enc_info->product_code                = vpu_read_reg(vpu_inst->dev, W5_PRODUCT_NUMBER);
> +
> +	return ret;
> +}
> +
> +static enum ret_code set_enc_crop_info(s32 codec_mode, struct enc_wave_param *param, int rot_mode,
> +				       int src_width, int src_height)
> +{
> +	int aligned_width  = (codec_mode == W_HEVC_ENC) ? ALIGN(src_width, 32)  : ALIGN(src_width, 16);
> +	int aligned_height = (codec_mode == W_HEVC_ENC) ? ALIGN(src_height, 32) : ALIGN(src_height, 16);
> +	int pad_right, pad_bot;
> +	int crop_right, crop_left, crop_top, crop_bot;
> +	int prp_mode = rot_mode >> 1;  // remove prp_enable bit
> +
> +	if (codec_mode == W_HEVC_ENC &&
> +	    (rot_mode == 0 || prp_mode == 14)) // prp_mode 14 : hor_mir && ver_mir && rot_180
> +		return RETCODE_SUCCESS;
> +
> +	pad_right = aligned_width  - src_width;
> +	pad_bot   = aligned_height - src_height;
> +
> +	if (param->conf_win_right > 0)
> +		crop_right = param->conf_win_right + pad_right;
> +	else
> +		crop_right = pad_right;
> +
> +	if (param->conf_win_bot > 0)
> +		crop_bot = param->conf_win_bot + pad_bot;
> +	else
> +		crop_bot = pad_bot;
> +
> +	crop_top  = param->conf_win_top;
> +	crop_left = param->conf_win_left;
> +
> +	param->conf_win_top   = crop_top;
> +	param->conf_win_left  = crop_left;
> +	param->conf_win_bot   = crop_bot;
> +	param->conf_win_right = crop_right;
> +
> +	/* prp_mode :
> +	 *          | hor_mir | ver_mir |   rot_angle
> +	 *              [3]       [2]         [1:0] = {0= NONE, 1:90, 2:180, 3:270}
> +	 */
> +	if (prp_mode == 1 || prp_mode == 15) {
> +		param->conf_win_top   = crop_right;
> +		param->conf_win_left  = crop_top;
> +		param->conf_win_bot   = crop_left;
> +		param->conf_win_right = crop_bot;
> +	} else if (prp_mode == 2 || prp_mode == 12) {
> +		param->conf_win_top   = crop_bot;
> +		param->conf_win_left  = crop_right;
> +		param->conf_win_bot   = crop_top;
> +		param->conf_win_right = crop_left;
> +	} else if (prp_mode == 3 || prp_mode == 13) {
> +		param->conf_win_top   = crop_left;
> +		param->conf_win_left  = crop_bot;
> +		param->conf_win_bot   = crop_right;
> +		param->conf_win_right = crop_top;
> +	} else if (prp_mode == 4 || prp_mode == 10) {
> +		param->conf_win_top   = crop_bot;
> +		param->conf_win_bot   = crop_top;
> +	} else if (prp_mode == 8 || prp_mode == 6) {
> +		param->conf_win_left  = crop_right;
> +		param->conf_win_right = crop_left;
> +	} else if (prp_mode == 5 || prp_mode == 11) {
> +		param->conf_win_top   = crop_left;
> +		param->conf_win_left  = crop_top;
> +		param->conf_win_bot   = crop_right;
> +		param->conf_win_right = crop_bot;
> +	} else if (prp_mode == 7 || prp_mode == 9) {
> +		param->conf_win_top   = crop_right;
> +		param->conf_win_left  = crop_bot;
> +		param->conf_win_bot   = crop_left;
> +		param->conf_win_right = crop_top;
> +	}
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_vpu_enc_init_seq(struct vpu_instance *vpu_inst)
> +{
> +	u32          reg_val = 0, rot_mir_mode, fixed_cu_size_mode = 0x7;
> +	struct enc_info *p_enc_info;
> +	struct enc_open_param *p_open_param;
> +	struct enc_wave_param *p_param;
> +
> +	p_enc_info   = &vpu_inst->codec_info->enc_info;
> +	p_open_param = &p_enc_info->open_param;
> +	p_param     = &p_open_param->wave_param;
> +
> +	if (vpu_inst->dev->product != PRODUCT_ID_521)
> +		return RETCODE_NOT_SUPPORTED_FEATURE;
> +
> +	/*==============================================*/
> +	/*  OPT_CUSTOM_GOP                              */
> +	/*==============================================*/
> +	/*
> +	 * SET_PARAM + CUSTOM_GOP
> +	 * only when gop_preset_idx == custom_gop, custom_gop related registers should be set
> +	 */
> +	if (p_param->gop_preset_idx == PRESET_IDX_CUSTOM_GOP) {
> +		int i = 0, j = 0;
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_CUSTOM_GOP_PARAM, p_param->gop_param.custom_gop_size);
> +		for (i = 0 ; i < p_param->gop_param.custom_gop_size; i++) {
> +			vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_CUSTOM_GOP_PIC_PARAM_0 + (i * 4),
> +				      (p_param->gop_param.pic_param[i].pic_type << 0)            |
> +					(p_param->gop_param.pic_param[i].poc_offset << 2)        |
> +					(p_param->gop_param.pic_param[i].pic_qp << 6)            |
> +					(p_param->gop_param.pic_param[i].use_multi_ref_p << 13)  |
> +					((p_param->gop_param.pic_param[i].ref_poc_l0 & 0x1F) << 14)   |
> +					((p_param->gop_param.pic_param[i].ref_poc_l1 & 0x1F) << 19)   |
> +					(p_param->gop_param.pic_param[i].temporal_id << 24));
> +		}
> +
> +		for (j = i; j < MAX_GOP_NUM; j++)
> +			vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_CUSTOM_GOP_PIC_PARAM_0 + (j * 4), 0);
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_SET_PARAM_OPTION, OPT_CUSTOM_GOP);
> +		wave5_bit_issue_command(vpu_inst, W5_ENC_SET_PARAM);
> +
> +		if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +			dev_warn(vpu_inst->dev->dev, "enc set param timed out. op=0x%x\n", OPT_CUSTOM_GOP);
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		}
> +	}
> +
> +	/*======================================================================*/
> +	/*  OPT_COMMON                                                          */
> +	/*      :								*/
> +	/*	the last SET_PARAM command should be called with OPT_COMMON   */
> +	/*======================================================================*/
> +	rot_mir_mode = 0;
> +	/* CMD_ENC_ROT_MODE :
> +	 *          | hor_mir | ver_mir |   rot_angle     | rot_en |
> +	 *              [4]       [3]         [2:1]           [0]
> +	 */
> +	if (p_enc_info->rotation_enable) {
> +		switch (p_enc_info->rotation_angle) {
> +		case 0:
> +			rot_mir_mode |= 0x0; break;
> +		case 90:
> +			rot_mir_mode |= 0x3; break;
> +		case 180:
> +			rot_mir_mode |= 0x5; break;
> +		case 270:
> +			rot_mir_mode |= 0x7; break;
> +		}
> +	}
> +
> +	if (p_enc_info->mirror_enable) {
> +		switch (p_enc_info->mirror_direction) {
> +		case MIRDIR_NONE:
> +			rot_mir_mode |= 0x0;  break;
> +		case MIRDIR_VER:
> +			rot_mir_mode |= 0x9;  break;
> +		case MIRDIR_HOR:
> +			rot_mir_mode |= 0x11; break;
> +		case MIRDIR_HOR_VER:
> +			rot_mir_mode |= 0x19; break;
> +		}
> +	}
> +
> +	set_enc_crop_info(vpu_inst->std, p_param, rot_mir_mode, p_open_param->pic_width,
> +			  p_open_param->pic_height);
> +
> +	/* SET_PARAM + COMMON */
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_SET_PARAM_OPTION,  OPT_COMMON);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_SRC_SIZE, p_open_param->pic_height << 16
> +			| p_open_param->pic_width);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_MAP_ENDIAN, VDI_LITTLE_ENDIAN);
> +
> +	if (vpu_inst->std == W_AVC_ENC) {
> +		reg_val = (p_param->profile << 0)                    |
> +			(p_param->level << 3)                      |
> +			(p_param->internal_bit_depth << 14)          |
> +			(p_param->use_long_term << 21);
> +		if (p_param->scaling_list_enable == 2) {
> +			reg_val |= (1 << 22) | (1 << 23);    // [23]=USE_DEFAULT_SCALING_LIST
> +		} else { // 0 or 1
> +			reg_val |= (p_param->scaling_list_enable << 22);
> +		}
> +	} else {  // HEVC enc
> +		reg_val = (p_param->profile << 0)                    |
> +			(p_param->level << 3)                      |
> +			(p_param->tier << 12)                      |
> +			(p_param->internal_bit_depth << 14)          |
> +			(p_param->use_long_term << 21)               |
> +			(p_param->tmvp_enable << 23)                |
> +			(p_param->sao_enable << 24)                 |
> +			(p_param->skip_intra_trans << 25)            |
> +			(p_param->strong_intra_smooth_enable << 27)   |
> +			(p_param->en_still_picture << 30);
> +		if (p_param->scaling_list_enable == 2)
> +			reg_val |= (1 << 22) | (1UL << 31);    // [31]=USE_DEFAULT_SCALING_LIST
> +		else
> +			reg_val |= (p_param->scaling_list_enable << 22);
> +	}
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_SPS_PARAM,  reg_val);
> +
> +	reg_val = (p_param->lossless_enable)                |
> +		(p_param->const_intra_pred_flag << 1)         |
> +		(p_param->lf_cross_slice_boundary_enable << 2) |
> +		(p_param->weight_pred_enable << 3)           |
> +		(p_param->wpp_enable << 4)                  |
> +		(p_param->disable_deblk << 5)               |
> +		((p_param->beta_offset_div2 & 0xF) << 6)       |
> +		((p_param->tc_offset_div2 & 0xF) << 10)        |
> +		((p_param->chroma_cb_qp_offset & 0x1F) << 14)   |
> +		((p_param->chroma_cr_qp_offset & 0x1F) << 19)   |
> +		(p_param->transform8x8_enable << 29)        |
> +		(p_param->entropy_coding_mode << 30);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_PPS_PARAM,  reg_val);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_GOP_PARAM,  p_param->gop_preset_idx);
> +
> +	if (vpu_inst->std == W_AVC_ENC)
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM, (p_param->intra_qp << 0) |
> +				((p_param->intra_period & 0x7ff) << 6) |
> +				((p_param->avc_idr_period & 0x7ff) << 17) |
> +				((p_param->forced_idr_header_enable & 3) << 28));
> +	else
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM,
> +			      (p_param->decoding_refresh_type << 0) | (p_param->intra_qp << 3) |
> +				(p_param->forced_idr_header_enable << 9) |
> +				(p_param->intra_period << 16));
> +
> +	reg_val  = (p_param->use_recommend_enc_param)     |
> +		(p_param->rdo_skip << 2)               |
> +		(p_param->lambda_scaling_enable << 3)   |
> +		(p_param->coef_clear_disable << 4)      |
> +		(fixed_cu_size_mode << 5)               |
> +		(p_param->intra_nx_n_enable << 8)        |
> +		(p_param->max_num_merge << 18)          |
> +		(p_param->custom_md_enable << 20)       |
> +		(p_param->custom_lambda_enable << 21)   |
> +		(p_param->monochrome_enable << 22);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RDO_PARAM, reg_val);
> +
> +	if (vpu_inst->std == W_AVC_ENC)
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_INTRA_REFRESH,
> +			      p_param->intra_mb_refresh_arg << 16 | p_param->intra_mb_refresh_mode);
> +	else
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_INTRA_REFRESH,
> +			      p_param->intra_refresh_arg << 16 | p_param->intra_refresh_mode);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_FRAME_RATE,  p_open_param->frame_rate_info);
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_TARGET_RATE, p_open_param->bit_rate);
> +
> +	if (vpu_inst->std == W_AVC_ENC)
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_PARAM,
> +			      (p_open_param->rc_enable << 0) |
> +				(p_param->mb_level_rc_enable << 1)         |
> +				(p_param->hvs_qp_enable << 2)             |
> +				(p_param->hvs_qp_scale << 4)              |
> +				(p_param->bit_alloc_mode << 8)            |
> +				(p_param->roi_enable << 13)              |
> +				((p_param->initial_rc_qp & 0x3F) << 14)     |
> +				(p_open_param->vbv_buffer_size << 20));
> +	else
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_PARAM,
> +			      (p_open_param->rc_enable << 0)           |
> +				(p_param->cu_level_rc_enable << 1)         |
> +				(p_param->hvs_qp_enable << 2)             |
> +				(p_param->hvs_qp_scale << 4)              |
> +				(p_param->bit_alloc_mode << 8)            |
> +				(p_param->roi_enable << 13)              |
> +				((p_param->initial_rc_qp & 0x3F) << 14)     |
> +				(p_open_param->vbv_buffer_size << 20));
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_WEIGHT_PARAM,
> +		      p_param->rc_weight_buf << 8 | p_param->rc_weight_param);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_MIN_MAX_QP, (p_param->min_qp_i << 0)  |
> +			(p_param->max_qp_i << 6)                   |
> +			(p_param->hvs_max_delta_qp << 12));
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_INTER_MIN_MAX_QP, (p_param->min_qp_p << 0)  |
> +			(p_param->max_qp_p << 6)   |
> +			(p_param->min_qp_b << 12)  |
> +			(p_param->max_qp_b << 18));
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_BIT_RATIO_LAYER_0_3,
> +		      ((uint32_t)p_param->fixed_bit_ratio[0] << 0)  |
> +			((uint32_t)p_param->fixed_bit_ratio[1] << 8)  |
> +			((uint32_t)p_param->fixed_bit_ratio[2] << 16) |
> +			((uint32_t)p_param->fixed_bit_ratio[3] << 24));
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_RC_BIT_RATIO_LAYER_4_7,
> +		      ((uint32_t)p_param->fixed_bit_ratio[4] << 0)  |
> +			((uint32_t)p_param->fixed_bit_ratio[5] << 8)  |
> +			((uint32_t)p_param->fixed_bit_ratio[6] << 16) |
> +			((uint32_t)p_param->fixed_bit_ratio[7] << 24));
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_ROT_PARAM,  rot_mir_mode);
> +
> +	vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_BG_PARAM, (p_param->bg_detect_enable)       |
> +			(p_param->bg_thr_diff << 1)         |
> +			(p_param->bg_thr_mean_diff << 10)    |
> +			(p_param->bg_lambda_qp << 18)       |
> +			((p_param->bg_delta_qp & 0x1F) << 24) |
> +			(vpu_inst->std == W_AVC_ENC ? p_param->s2fme_disable << 29 : 0));
> +
> +	if (vpu_inst->std == W_HEVC_ENC || vpu_inst->std == W_AVC_ENC) {
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_LAMBDA_ADDR,
> +			      p_param->custom_lambda_addr);
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CONF_WIN_TOP_BOT,
> +			      p_param->conf_win_bot << 16 | p_param->conf_win_top);
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CONF_WIN_LEFT_RIGHT,
> +			      p_param->conf_win_right << 16 | p_param->conf_win_left);
> +
> +		if (vpu_inst->std == W_AVC_ENC)
> +			vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_INDEPENDENT_SLICE,
> +				      p_param->avc_slice_arg << 16 | p_param->avc_slice_mode);
> +		else
> +			vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_INDEPENDENT_SLICE,
> +				      p_param->independ_slice_mode_arg << 16 |
> +				      p_param->independ_slice_mode);
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_USER_SCALING_LIST_ADDR,
> +			      p_param->user_scaling_list_addr);
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_NUM_UNITS_IN_TICK,
> +			      p_param->num_units_in_tick);
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_TIME_SCALE, p_param->time_scale);
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_NUM_TICKS_POC_DIFF_ONE,
> +			      p_param->num_ticks_poc_diff_one);
> +	}
> +
> +	if (vpu_inst->std == W_HEVC_ENC) {
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_MD_PU04,
> +			      (p_param->pu04_delta_rate & 0xFF)                 |
> +				((p_param->pu04_intra_planar_delta_rate & 0xFF) << 8) |
> +				((p_param->pu04_intra_dc_delta_rate & 0xFF) << 16)    |
> +				((p_param->pu04_intra_angle_delta_rate & 0xFF) << 24));
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_MD_PU08,
> +			      (p_param->pu08_delta_rate & 0xFF)                 |
> +				((p_param->pu08_intra_planar_delta_rate & 0xFF) << 8) |
> +				((p_param->pu08_intra_dc_delta_rate & 0xFF) << 16)    |
> +				((p_param->pu08_intra_angle_delta_rate & 0xFF) << 24));
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_MD_PU16,
> +			      (p_param->pu16_delta_rate & 0xFF)                 |
> +				((p_param->pu16_intra_planar_delta_rate & 0xFF) << 8) |
> +				((p_param->pu16_intra_dc_delta_rate & 0xFF) << 16)    |
> +				((p_param->pu16_intra_angle_delta_rate & 0xFF) << 24));
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_MD_PU32,
> +			      (p_param->pu32_delta_rate & 0xFF)                 |
> +				((p_param->pu32_intra_planar_delta_rate & 0xFF) << 8) |
> +				((p_param->pu32_intra_dc_delta_rate & 0xFF) << 16)    |
> +				((p_param->pu32_intra_angle_delta_rate & 0xFF) << 24));
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_MD_CU08,
> +			      (p_param->cu08_intra_delta_rate & 0xFF)        |
> +				((p_param->cu08_inter_delta_rate & 0xFF) << 8)   |
> +				((p_param->cu08_merge_delta_rate & 0xFF) << 16));
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_MD_CU16,
> +			      (p_param->cu16_intra_delta_rate & 0xFF)        |
> +				((p_param->cu16_inter_delta_rate & 0xFF) << 8)   |
> +				((p_param->cu16_merge_delta_rate & 0xFF) << 16));
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_CUSTOM_MD_CU32,
> +			      (p_param->cu32_intra_delta_rate & 0xFF)        |
> +				((p_param->cu32_inter_delta_rate & 0xFF) << 8)   |
> +				((p_param->cu32_merge_delta_rate & 0xFF) << 16));
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_DEPENDENT_SLICE,
> +			      p_param->depend_slice_mode_arg << 16 | p_param->depend_slice_mode);
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_NR_PARAM,   (p_param->nr_y_enable << 0)       |
> +				(p_param->nr_cb_enable << 1)      |
> +				(p_param->nr_cr_enable << 2)      |
> +				(p_param->nr_noise_est_enable << 3) |
> +				(p_param->nr_noise_sigma_y << 4)   |
> +				(p_param->nr_noise_sigma_cb << 12) |
> +				(p_param->nr_noise_sigma_cr << 20));
> +
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_NR_WEIGHT,  (p_param->nr_intra_weight_y << 0)  |
> +				(p_param->nr_intra_weight_cb << 5) |
> +				(p_param->nr_intra_weight_cr << 10) |
> +				(p_param->nr_inter_weight_y << 15) |
> +				(p_param->nr_inter_weight_cb << 20) |
> +				(p_param->nr_inter_weight_cr << 25));
> +	}
> +	if (p_enc_info->open_param.encode_vui_rbsp || p_enc_info->open_param.encode_hrd_rbsp_in_vps) {
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_VUI_HRD_PARAM,
> +			      (p_enc_info->open_param.hrd_rbsp_data_size << 18)   |
> +				(p_enc_info->open_param.vui_rbsp_data_size << 4)    |
> +				(p_enc_info->open_param.encode_hrd_rbsp_in_vps << 2) |
> +				(p_enc_info->open_param.encode_vui_rbsp));
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_VUI_RBSP_ADDR,
> +			      p_enc_info->open_param.vui_rbsp_data_addr);
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_HRD_RBSP_ADDR,
> +			      p_enc_info->open_param.hrd_rbsp_data_addr);
> +	} else {
> +		vpu_write_reg(vpu_inst->dev, W5_CMD_ENC_SEQ_VUI_HRD_PARAM, 0);
> +	}
> +
> +	wave5_bit_issue_command(vpu_inst, W5_ENC_SET_PARAM);
> +
> +	if (vdi_wait_vpu_busy(vpu_inst->dev, VPU_BUSY_CHECK_TIMEOUT, W5_VPU_BUSY_STATUS) == -1) {
> +		dev_warn(vpu_inst->dev->dev, "enc set param timed out\n");
> +		return RETCODE_VPU_RESPONSE_TIMEOUT;
> +	}
> +
> +	if (vpu_read_reg(vpu_inst->dev, W5_RET_SUCCESS) == 0) {
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_FAIL_REASON);
> +		if (reg_val != WAVE5_SYSERR_QUEUEING_FAIL)
> +			pr_err("FAIL_REASON = 0x%x\n", reg_val);
> +
> +		if (reg_val == WAVE5_SYSERR_QUEUEING_FAIL) {
> +			reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_QUEUE_FAIL_REASON);
> +			pr_info("QUEUE_FAIL_REASON = 0x%x\n", reg_val);
> +			return RETCODE_QUEUEING_FAILURE;
> +		} else if (reg_val == WAVE5_SYSERR_ACCESS_VIOLATION_HW) {
> +			return RETCODE_MEMORY_ACCESS_VIOLATION;
> +		} else if (reg_val == WAVE5_SYSERR_WATCHDOG_TIMEOUT) {
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		} else if (reg_val == WAVE5_SYSERR_BUS_ERROR || reg_val == WAVE5_SYSERR_DOUBLE_FAULT) {
> +			return RETCODE_VPU_BUS_ERROR;
> +		} else {
> +			return RETCODE_FAILURE;
> +		}
> +	}
> +
> +	return RETCODE_SUCCESS;
> +}
> +
> +enum ret_code wave5_vpu_enc_get_seq_info(struct vpu_instance *vpu_inst, struct enc_initial_info *info)
> +{
> +	enum ret_code     ret = RETCODE_SUCCESS;
> +	u32      reg_val;
> +	struct enc_info *p_enc_info;
> +
> +	if (vpu_inst->dev->product != PRODUCT_ID_521)
> +		return RETCODE_NOT_SUPPORTED_FEATURE;
> +
> +	p_enc_info = &vpu_inst->codec_info->enc_info;
> +
> +	// send QUERY cmd
> +	ret = send_query(vpu_inst, GET_RESULT);
> +	if (ret != RETCODE_SUCCESS) {
> +		reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_FAIL_REASON);
> +		if (reg_val != WAVE5_SYSERR_QUEUEING_FAIL)
> +			pr_err("FAIL_REASON = 0x%x\n", reg_val);
> +
> +		if (reg_val == WAVE5_SYSERR_RESULT_NOT_READY)
> +			return RETCODE_REPORT_NOT_READY;
> +		else if (reg_val == WAVE5_SYSERR_ACCESS_VIOLATION_HW)
> +			return RETCODE_MEMORY_ACCESS_VIOLATION;
> +		else if (reg_val == WAVE5_SYSERR_WATCHDOG_TIMEOUT)
> +			return RETCODE_VPU_RESPONSE_TIMEOUT;
> +		else if (reg_val == WAVE5_SYSERR_BUS_ERROR || reg_val == WAVE5_SYSERR_DOUBLE_FAULT)
> +			return RETCODE_VPU_BUS_ERROR;
> +		else
> +			return RETCODE_QUERY_FAILURE;
> +	}
> +
> +	dev_dbg(vpu_inst->dev->dev, "init seq\n");
> +
> +	reg_val = vpu_read_reg(vpu_inst->dev, W5_RET_QUEUE_STATUS);
> +
> +	p_enc_info->instance_queue_count = (reg_val >> 16) & 0xff;
> +	p_enc_info->report_queue_count   = (reg_val & 0xffff);
> +
> +	if (vpu_read_reg(vpu_inst->dev, W5_RET_ENC_ENCODING_SUCCESS) != 1) {
> +		info->seq_init_err_reason = vpu_read_reg(vpu_inst->dev, W5_RET_ENC_ERR_INFO);
> +		ret = RETCODE_FAILURE;
> +	} else {
> +		info->warn_info = vpu_read_reg(vpu_inst->dev, W5_RET_ENC_WARN_INFO);
> +	}
> +
> +	info->min_frame_buffer_count   = vpu_read_reg(vpu_inst->dev, W5_RET_ENC_NUM_REQUIRED_FB);
> +	info->min_src_frame_count      = vpu_read_reg(vpu_inst->dev, W5_RET_ENC_MIN_SRC_BUF_NUM);
> +	info->max_latency_pictures = vpu_read_reg(vpu_inst->dev, W5_RET_ENC_PIC_MAX_LATENCY_PICTURES);
> +	info->vlc_buf_size            = vpu_read_reg(vpu_inst->dev, W5_RET_VLC_BUF_SIZE);
> +	info->param_buf_size          = vpu_read_reg(vpu_inst->dev, W5_RET_PARAM_BUF_SIZE);
> +	p_enc_info->vlc_buf_size        = info->vlc_buf_size;
> +	p_enc_info->param_buf_size      = info->param_buf_size;
> +
> +	return ret;
> +}
> +
> +enum ret_code wave5_vpu_enc_register_framebuffer(struct device *dev, struct vpu_instance *vpu_inst,
> +						 struct frame_buffer *fb_arr,
> +						 enum tiled_map_type map_type, uint32_t count)
> +{
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +	enum ret_code       ret = RETCODE_SUCCESS;
> +	s32         q, j, i, remain, idx, start_no, end_no, stride;

Search for s32 and change to int.

> +	u32        reg_val = 0, pic_size = 0, mv_col_size, fbc_y_tbl_size, fbc_c_tbl_size;
> +	u32	sub_sampled_size = 0;
> +	u32        endian, nv21 = 0, cbcr_interleave = 0, luma_stride, chroma_stride;
> +	u32	buf_height = 0, buf_width = 0;
> +	struct vpu_buf  vb_mv = {0,};
> +	struct vpu_buf  vb_fbc_y_tbl = {0,};
> +	struct vpu_buf  vb_fbc_c_tbl = {0,};
> +	struct vpu_buf  vb_sub_sam_buf = {0,};
> +	struct vpu_buf  vb_task = {0,};

Use "struct vpu_buf vb_mv = { };"

> +	struct enc_open_param *p_open_param;
> +	struct enc_info *p_enc_info = &vpu_inst->codec_info->enc_info;
> +
> +	p_open_param     = &p_enc_info->open_param;
> +	mv_col_size   = 0;
> +	fbc_y_tbl_size = 0;
> +	fbc_c_tbl_size = 0;
> +	stride         = p_enc_info->stride;
> +
> +	if (vpu_inst->std == W_AVC_ENC) {
> +		buf_width  = ALIGN(p_open_param->pic_width, 16);
> +		buf_height = ALIGN(p_open_param->pic_height, 16);
> +
> +		if ((p_enc_info->rotation_angle != 0 || p_enc_info->mirror_direction != 0) &&
> +		    !(p_enc_info->rotation_angle == 180 &&
> +					p_enc_info->mirror_direction == MIRDIR_HOR_VER)) {

Align the indenting.

		if ((p_enc_info->rotation_angle != 0 || p_enc_info->mirror_direction != 0) &&
		    !(p_enc_info->rotation_angle == 180 &&
	              p_enc_info->mirror_direction == MIRDIR_HOR_VER)) {

> +			buf_width  = ALIGN(p_open_param->pic_width, 16);
> +			buf_height = ALIGN(p_open_param->pic_height, 16);
> +		}
> +
> +		if (p_enc_info->rotation_angle == 90 || p_enc_info->rotation_angle == 270) {

We've lift the 80 character limit but this would be more readable if
it were written as:

		if (p_enc_info->rotation_angle == 90 ||
		    p_enc_info->rotation_angle == 270) {

That way your eye immediatly can spot the 90 and the 270.


> +			buf_width  = ALIGN(p_open_param->pic_height, 16);
> +			buf_height = ALIGN(p_open_param->pic_width, 16);
> +		}
> +	} else {
> +		buf_width  = ALIGN(p_open_param->pic_width, 8);
> +		buf_height = ALIGN(p_open_param->pic_height, 8);
> +
> +		if ((p_enc_info->rotation_angle != 0 || p_enc_info->mirror_direction != 0) &&
> +		    !(p_enc_info->rotation_angle == 180 &&
> +					p_enc_info->mirror_direction == MIRDIR_HOR_VER)) {
> +			buf_width  = ALIGN(p_open_param->pic_width, 32);
> +			buf_height = ALIGN(p_open_param->pic_height, 32);
> +		}
> +
> +		if (p_enc_info->rotation_angle == 90 || p_enc_info->rotation_angle == 270) {
> +			buf_width  = ALIGN(p_open_param->pic_height, 32);
> +			buf_height = ALIGN(p_open_param->pic_width, 32);
> +		}
> +	}
> +
> +	pic_size = (buf_width << 16) | buf_height;
> +
> +	if (vpu_inst->std == W_HEVC_ENC) {
> +		mv_col_size      = WAVE5_ENC_HEVC_MVCOL_BUF_SIZE(buf_width, buf_height);
> +		mv_col_size      = ALIGN(mv_col_size, 16);
> +		vb_mv.daddr = 0;
> +		/* 4096 is a margin */
> +		vb_mv.size      = ((mv_col_size * count + 4095) & ~4095) + 4096;
> +	} else if (vpu_inst->std == W_AVC_ENC) {
> +		mv_col_size      = WAVE5_ENC_AVC_MVCOL_BUF_SIZE(buf_width, buf_height);
> +		vb_mv.daddr = 0;
> +		/* 4096 is a margin */
> +		vb_mv.size      = ((mv_col_size * count + 4095) & ~4095) + 4096;
> +	}
> +
> +	if (vdi_allocate_dma_memory(vpu_dev, &vb_mv) < 0)
> +		return RETCODE_INSUFFICIENT_RESOURCE;
> +
> +	p_enc_info->vb_mv   = vb_mv;
> +
> +	if (p_enc_info->product_code == WAVE521C_DUAL_CODE) {
> +		u32 bgs_width, ot_bg_width, comp_frm_width, ot_frm_width, ot_bg_height,
> +		    bgs_height, comp_frm_height, ot_frm_height;
> +		u32 frm_width, frm_height;
> +		u32 dual_width  = buf_width;
> +		u32 dual_height = buf_height;
> +
> +		bgs_width = (p_open_param->wave_param.internal_bit_depth > 8 ? 256 : 512);
> +
> +		if (vpu_inst->std == W_AVC_ENC)
> +			ot_bg_width = 1024;
> +		else // if (vpu_inst->std == W_HEVC_ENC)

Delete the commented out code.  There is more later in the function as
well.

> +			ot_bg_width = 512;
> +
> +		frm_width      = VPU_CEIL(dual_width, 16);
> +		frm_height     = VPU_CEIL(dual_height, 16);
> +		// valid_width = align(width, 16), comp_frm_width = align(valid_width+pad_x, 16)
> +		comp_frm_width = VPU_CEIL(VPU_CEIL(frm_width, 16) + 16, 16);
> +		// 1024 = offset table BG width
> +		ot_frm_width   = VPU_CEIL(comp_frm_width, ot_bg_width);
> +
> +		// sizeof_offset_table()
> +		ot_bg_height    = 32;
> +		bgs_height      = (1 << 14) / bgs_width / (p_open_param->wave_param.internal_bit_depth > 8 ? 2 : 1);
> +		comp_frm_height = VPU_CEIL(VPU_CEIL(frm_height, 4) + 4, bgs_height);
> +		ot_frm_height   = VPU_CEIL(comp_frm_height, ot_bg_height);
> +		fbc_y_tbl_size     = (ot_frm_width / 16) * (ot_frm_height / 4) * 2;
> +	} else {
> +		fbc_y_tbl_size = WAVE5_FBC_LUMA_TABLE_SIZE(buf_width, buf_height);
> +		fbc_y_tbl_size = ALIGN(fbc_y_tbl_size, 16);
> +	}
> +
> +	vb_fbc_y_tbl.daddr = 0;
> +	vb_fbc_y_tbl.size      = ((fbc_y_tbl_size * count + 4095) & ~4095) + 4096;
> +	if (vdi_allocate_dma_memory(vpu_dev, &vb_fbc_y_tbl) < 0)
> +		return RETCODE_INSUFFICIENT_RESOURCE;

This function doesn't clean up after itself.

> +
> +	p_enc_info->vb_fbc_y_tbl   = vb_fbc_y_tbl;
> +

Anway, there is a lot of code in this driver and hopefully these are
ideas on where to start cleaning it up.

regards,
dan carpenter

