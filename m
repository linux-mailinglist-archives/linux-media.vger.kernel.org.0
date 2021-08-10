Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9413E8338
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 20:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhHJSsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 14:48:18 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19112 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230317AbhHJSsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 14:48:16 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17AIlETK003660;
        Tue, 10 Aug 2021 18:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=8YW8blQDw/HXmQ4gEBMOhb919i70d68p5D4vxnRYDro=;
 b=Wx2OXv+ysweLNowVfXiB5bSuASZe5ocT6qIXtGNNqTYA1iFwF5xa+qqTm5dU4IM3n4qp
 gJ5zQ/Neqj2ISYhqOs7WZKaVSSMfTIpBkgImPxAu8oSkReL3Y1cnpOdGj5+yDNf5qhDE
 QIoVPZNsXeCI/P+fQe1a2SikBOzVbdeppyM+sNmZYgLEUN7JZ5U3SO7gA7XtHA/6N5R7
 j3RSxenIwoQ+0UjUi4dMmb8vJjviZLpRfdjHH3584B3+TlWfyXVehvXOYqIeSqSfdJDi
 u+X1dkh77Yi7wFkTh40qx2y8Y+ujiPbloQhnUg0jBqiJfW7qJM54f8uz7p+yOXo/+mZv jA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=8YW8blQDw/HXmQ4gEBMOhb919i70d68p5D4vxnRYDro=;
 b=iExnaXED11HYq4vf2OgjY7z+MTsOXpk/DVug+ONNZNGFaFIdKPInd7aXJ3Kn42+7eA+k
 sAbTZXMn3gIr81P3658ggBDZkKIRh1CnzyEcG/jFmBHYNxFflPmMp/k2HsJ07pj3Q/iY
 NQpmJ/LT8lR2O7QRfAndt6ri9slelqh+buhTHbmmsDyn5GlgKLWCJVpfb81g/sC088Zs
 uvVfuNZScnXPWLyU2i6f/D26gPAXMyWK6ynP8n13uq31ijG4bZ7BZ89wLM1iGeoZYiN+
 XcTvZ2jV5rzIbQXznc/Tw5IJ/ZoHh+0mP46peptR1zUXE9QFiDirB9S91ccvXtsrI/mm Vw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ab17dv9s8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Aug 2021 18:47:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17AIk8OS178586;
        Tue, 10 Aug 2021 18:47:41 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
        by userp3030.oracle.com with ESMTP id 3abjw4wag0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Aug 2021 18:47:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ns/Or0FPF0GJdxDlKJ4sgfb4+3WRZFbXf8GXd0Cp5bIMkYk+Iwe/g9aAT7F8KPBwlH2hC4ZUcuNGC43k9zBJWp5Y/iJVEoFwXGJ0sp6XTKBD/mkIKRHZACwL+tHCS+1/iYjNLaArPzbJXLLipzb9RyF/SgMBBWw7VyRDzlDA2jkojVCsrbBSBMQLI4Y6dR/hRiz2VMWeWXc9yuvOlSnblIkUz/2cSlEDq4b+AP8tZJcwc8kJjTNnl2wOYJMQt/90m0O4pbP9ssGbDQHhv/NNg82kc+SV9SQ/H5C7oEb2o10y+N7+VppwfygGpVtC6khXuTgkunDFyFyNIUPauNZxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YW8blQDw/HXmQ4gEBMOhb919i70d68p5D4vxnRYDro=;
 b=HIXbFjv7CI9TUGBMal5h8hCP0SUG7xCOQJm0xJO1v74QL2EG2evV9GXYntRZFXLDnOy0xJeGtUudd+ehek/XZeDhbWN9QA1yJSImA32uOqekQafIsDoAbglDOE5oW7/GEFtjv7s8WA0PbDerKqUvS/vndwciz+f+E5ZWr5/oqQO4pHDy85Or5yoGLdAhkcnjOw4NO9jv9XzT6jNDAXa+x/1EFXbC5kA9clKpfzB71GRub02yLQCA9ALVLGQactGHAknC7GwQGbabsmH8yhFwvmcYZikdg3atSizP3tIlFi5v2aQmYwE0JYVeesneEN0TsQZyez7sQVBRBq3vqMn2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YW8blQDw/HXmQ4gEBMOhb919i70d68p5D4vxnRYDro=;
 b=zlGuf+dTP40ogt8wuDGnardaqWl8hZ2eJYKtt4Ennru1zd/2w+N6zZW1rkREBPvkO1BdTluVanKQUF+0KHfk0b5cZq+RdhKIn/rjoiaaF5VrimAFWMxg8rDP33DhbQBSm5qL9N3JBYHLu01tnfJY41f0VgAIu6yA/+WIPhPNHzA=
Authentication-Results: ispras.ru; dkim=none (message not signed)
 header.d=none;ispras.ru; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2255.namprd10.prod.outlook.com
 (2603:10b6:301:2f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Tue, 10 Aug
 2021 18:47:38 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 18:47:38 +0000
Date:   Tue, 10 Aug 2021 21:47:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH v2] media: atomisp: Fix error handling in probe
Message-ID: <20210810184717.GZ1931@kadam>
References: <20210810162943.19852-1-novikov@ispras.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810162943.19852-1-novikov@ispras.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNXP275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 18:47:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2241377-49df-4d30-99d6-08d95c2f52fa
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB22554E7E7E3FD49F91E32DF68EF79@MWHPR1001MB2255.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPowNCl5V2lfP2058QH6sYZKWzgfdPNrHL1l2SJ53oScgqSxI4PQD3GNnS5lmfWhMoC1AndvUixQMU5O4Jqg67HEjFYeWu/iUg4uoThjjRGldzvzfmGHdB89V4s5i9sSgkrezhWxnaJMh0e3cuo3dqXx1olc0Za+jKj3GMI2lau6YnxEExOmxuVwZZonciGyC6X77KrxHDP2MN6UdhVWaz7+CDENrLqTl6GR45b8z+QQ6N1KJ/3OkUls4AG5DFzFDT64IOcj8ApEhoeBeBw1lREz9Gpp2M1V4fpY/cdM3B9ueQNB1VVD5xlOg2eTG+4C3Qn919LtmYtTW8xa3lq7EFkEUU9ndIom/sl8gYi8JhhAwNolfJAj6i3UCKgoBWQRCpN6rC5YSCZcvrwSXkIFxDBMws+mEjhIvOEhixj/cCZuRfQPVooOyFetq9Vr+I06PHYNONXMBAHLA3pdSdJQj2VqQ3eUYtohdoNsCKzZJRRwwGZQW6vnQG7byAu0nPTjdJkHs/22wMIxS7ayrocd0xgDbG4yDpZxUaLsctJ8bZyt0qnZsxjdllga73yvdrKt05Jv9yPKgoiG/U97Ki9eDgyXVv6CEqCN/guBhXMiJj+q8yjfuv0DY+DRCwt6toRCAttu1iLwo5dVLwm0ywDD9S7PRIYtMLV3+IxOjKr9m+l7fJ8l5tVttcoUZDo6OtIfxO4jwOplTJxaJiycIfNG6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(39860400002)(366004)(38100700002)(38350700002)(2906002)(7416002)(54906003)(6666004)(44832011)(52116002)(956004)(6916009)(86362001)(316002)(6496006)(5660300002)(66946007)(66476007)(1076003)(8676002)(4326008)(55016002)(83380400001)(33656002)(186003)(478600001)(26005)(33716001)(8936002)(4744005)(66556008)(9576002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v5pNl4c5kxJTGKDRp6opVw/9fOPleJQf4V0HDMbdLbF7Vn2GyOQR17iwbFwm?=
 =?us-ascii?Q?FxO+c9GT38DlPDEpP5irRNkgt2AiEcqLbSqzHHiy0e9+wL63inJUIhoX824G?=
 =?us-ascii?Q?luLdQ3L5IVnZ1OCLzWEV6RAfmkSsDOqkBFh17Dtybsn6xR6CCvTrEisgX1dB?=
 =?us-ascii?Q?nHyRu5GnXxcFy4cbyO+HQ6srKnStoQrY1no4KuZsWF8tCHZJMLJL9FQPX95j?=
 =?us-ascii?Q?psM/rq6swmSxybSjaDtU7qHqbZBnbLuMNkvH75v9tgiPFn/f+OoCYiCthQlk?=
 =?us-ascii?Q?qkXoq1rjTLPuI8pnuBFQm5SFza7eJm5YGSqeRSc8QRdIBZygmo4CpTa84yeC?=
 =?us-ascii?Q?OlnzoHKK0SLlPEMVtRjgsd+zk5i9ql5aYcQ9gdvN9TxlJkzmV63uS4hY89iE?=
 =?us-ascii?Q?3Vnqy6Vi+yfdYfUHeY/UNuf9K08u30NYQGIbusDl5SWVZGUqGIF9FSQSHelU?=
 =?us-ascii?Q?oAnBhD7FgjNZr5zqUWVINL/BunXBxdjyCpN0a2kS3+OH8qopVZVI9ApakK+S?=
 =?us-ascii?Q?PGKIHzV+AtfQWsvNfJsTsMrzlvCNjUKGsU42xeRB1ApTOp7o+7zcenmWCshz?=
 =?us-ascii?Q?kJkZRJc5hN2atb8tvtDK7K7Gaw9y57JzFd8GDBa5cyXqo1Sk0hgxe8UoNdi7?=
 =?us-ascii?Q?eeN3ytaRx28NMOqkcI6QOh9SUa+vY7pF0SbDtpP7IM87f6drgxgkoWo8ItHa?=
 =?us-ascii?Q?wSaAnevj13+Qbw5Hv6tFqJbLpCkoIDh5xQqXkzw/g4wvkUijxdmvjWdAZ3FX?=
 =?us-ascii?Q?0c9GTHs4+b9aGocEtFRjTnOfbT0C1X/B/ybFgizb8tSIbkkuZU2AoaYa/0EF?=
 =?us-ascii?Q?gMk1LBCna5rjM9Jbsp6/D6Bm3kWQM1QBxUt/Ht3cV5c6tjpK2OrQEMVhGg+m?=
 =?us-ascii?Q?FPyQeYATKgKOL+yrEFaD960HMeImzqJPUMoHmqY+Pa9W56QVSgJxpPFIkRjc?=
 =?us-ascii?Q?7UzrDsOOO0Qzp1yx/pzZbtSKjLqXlWZDUNfG/z42Xtf45K23bEky9lRHbQF3?=
 =?us-ascii?Q?2Vn9mEgSO7O585wURdUPfmQAe/ksm+NZFJWOcf16oojYT+6APL+FhnkVVQl/?=
 =?us-ascii?Q?bJmlPEclPOXJ33F71YSbivg4qBDphQsroC1XlqVVqeUGzYEzHe4q1iq9S93k?=
 =?us-ascii?Q?/Q5Q0udy+FJ8qw5fgafMT9J8LY1lKWNeairdOH2Ho421bPiOIgX4YXz2mPXB?=
 =?us-ascii?Q?ZJZ0QHz8tMr49Q4cZxSzMALCwID5wXqs2rIXiEfYn9SIbjRhWX5jIZIGTYBV?=
 =?us-ascii?Q?wyLgKEVbbXm/ta/cu4pjJgV43Mb6Ev9AR6sEY6lQa/0FfbZgVkzLacSGzH3I?=
 =?us-ascii?Q?7R37+/MedxE3s9ix3lwqddyY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2241377-49df-4d30-99d6-08d95c2f52fa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 18:47:38.1765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkvadwMYYd+g8zwCx6REBYS76TI47N3DtBVS8cHcX4rTx+sD2BVwPQVOVs4oGxFTBKn+EaSyr/r82PMmtskfN+o7agkKi4r68HuT8y3EZHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2255
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10072 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100123
X-Proofpoint-GUID: 0G7IhDmahsAzce1dqtJAe3agjxVdFpWW
X-Proofpoint-ORIG-GUID: 0G7IhDmahsAzce1dqtJAe3agjxVdFpWW
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 07:29:43PM +0300, Evgeny Novikov wrote:
> There were several issues with handling errors in lm3554_probe():
> - Probe did not set the error code when v4l2_ctrl_handler_init() failed.
> - It intermixed gotos for handling errors of v4l2_ctrl_handler_init()
>   and media_entity_pads_init().
> - It did not set the error code for failures of v4l2_ctrl_new_custom().
> - Probe did not free resources in case of failures of
>   atomisp_register_i2c_module().
> 
> The patch fixes all these issues.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Perfect.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

