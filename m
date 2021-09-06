Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C8D4016F9
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 09:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239689AbhIFHdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 03:33:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31568 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233050AbhIFHdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Sep 2021 03:33:52 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1864tswP024707;
        Mon, 6 Sep 2021 07:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=mZLoAGLXUHix12Vilsj/g02HmOutlDdzDWE22NdwP1E=;
 b=HR3/GwNGwCM/J5+OAOoeuubHbAEit9Df8u5SRD2r9iTFWDa4MnMRip29v6I61R4G08pi
 q2Z/nTR0ZwaG/mPly5y8CMI3Hn7Bb3vVQpSFcwrvGucuO6w9ed9bV4mh/v1SRCQcYthf
 BCv5lQN+pjJKD8MlpWUGDlHzx7EVwkAfWXdcnGZsoa6HAfNzNeGS2Q6dIgByxKOeXG+s
 mhn/tZbEKKXuBTpKDtC20pgaoRlR64cJIyI8ZM58xOfMTr8ZJckn5c9YjUlFsj0eHcDX
 q7hJan1N4a6emwAhTkXxzH7wWQ6hWRKpE1h9xrPQm/ajEBf38WgKS6zFPlpN0jFZbs7U Bw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=mZLoAGLXUHix12Vilsj/g02HmOutlDdzDWE22NdwP1E=;
 b=I661Toy9vUWtYUGBCm/FHj0ZuUrC5S0pJof03QMUV8AZECQOrH6ml3v4TxMsuunZAkRn
 cIasInWqWAvHrWeMlcF85HyyUtp0AEw+t7B0X25mbl+L57UFktuNfOtr8eb0ie41EKRK
 0HOypmJn0EiOLJHnp/2u+mLglnCM4moyJ3C0cgAXpxDJfHGNOs0mACQjZWz1Nc4RZ9be
 i8qWIk2q23bencDREUjpF7DhdoOYAOiRaxZ0HvlrN+yI2C6/hiSs3/X+APCorwUy1zHx
 3EOEYZSvQ5tYJ7uKzYGteBr5wzctvoJY0aAksguGDC7V10WLYFajjw0we7yv59U1v3Om Rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3avy761c8t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Sep 2021 07:32:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1867TvLQ110875;
        Mon, 6 Sep 2021 07:32:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        by aserp3020.oracle.com with ESMTP id 3av0m2u17a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Sep 2021 07:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJaJ7rf0PMGZb9mGJzupHjhcwBkEuD40T9w7Y/xFR4d8XZizRBg53mKnveCWpokz4e625DHIxHxgKq/az8OatCLzsXYH3AmAtNMub+k3/ZX/5XlugoX0PnPJ8cunjaiWvG8pBV0bTl7Bz6PULDTXdGbVqXQXY7c2fgCtid6iaS6INlmTGqn4t5KTKjz3u736r8Djy2dNUECZkKHVdDRUuTCbcT5r4SeNHN4EwkC4MwNYTqsj3+QkH21zkdw+QIB+7IZJECsvR5wW/GM4mxoO88vXaPdSfTimVE6tYra1fgKqzNXvIZ/7eJHfJAmwU5cqqumpX5Op29wLqLQlVQXBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mZLoAGLXUHix12Vilsj/g02HmOutlDdzDWE22NdwP1E=;
 b=g9mMR9k3GQeIEo79XfvBHTODk1sBdv518axvbc4RvRHxklI0YBMOb+QzhIRNlu+kPXL8dgSNjYTKhgGOBF2DJS4a6YHlPgmpNN91LAXPYdkqQ8Amtoeo1D9+A+f6K0Qbwf8Ov9RmEQNbj4wg2sLNQk20bte4HUxbPthSaDOmvTZZjlMHX3DkN1+C/HUDRhK0M4396mfncuVgLNR65UPr/wEJ9X9tsRkUYXb82PWMUxWNqypKTtlmYGU8lvXkUEV4M4p5Xn657xNppSKnk/aX/eZDFmL2XVgK11BBgu/YEabHF4ykx5e+J100xoUvxyIB/6cQ3avMVYSDFoTIE0xYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZLoAGLXUHix12Vilsj/g02HmOutlDdzDWE22NdwP1E=;
 b=zSdvl6ANVDuRBlulhJFQdzJbYEh+3LrejiEa5wMqZdE3Tvr5QwfNzKDHpQsnUz2pUugi+qxcwdCaIVlPoDtdNNPHFDmcg4DKdfiBkzY5HA2rgYN0GtBtDN9MhL4W0qGdEAhbhf2y1BItn4E/k66xf04zYygEpMFw5yB/JpO+CJM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2096.namprd10.prod.outlook.com
 (2603:10b6:301:2c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 07:32:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 07:32:40 +0000
Date:   Mon, 6 Sep 2021 10:32:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alakesh Haloi <alakesh.haloi@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: media: atomisp: fix return value
Message-ID: <20210906073219.GF1957@kadam>
References: <20210903200658.GA552296@ip-172-31-53-182.us-west-2.compute.internal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903200658.GA552296@ip-172-31-53-182.us-west-2.compute.internal>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (41.210.143.41) by JNXP275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 07:32:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa675d17-64dd-47e3-e2f1-08d9710881d6
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2096C06978D746CD4D46F2548ED29@MWHPR1001MB2096.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCAFIYdVjSGV7gZkl3OcRA0CGhj3o8pYN5m5WCUN0w/D8DJrfz2lLz4jNb7apiN7TcnkIDyebJqy1sCgYDvaKoeIRvxAEI1OSaw3SimFjP4C+v63mjk2zQvX7p7pztbkrFQEqy0fZ6SCoVait+YwKpRSXcyzObUllCJCxatZh0YXEkj3OvHHE25Q5E8z865vltYYRLx2o/KwQWpAyX0ScNgnERD4ECSK0TkHA6e7stfoMwsiL+pCreoibXw798ZfMLtb1E5EAf+F262VjPRgHaiijS01D3l5AkSX7zU/qydVuuxdbUg04hYNemEDtlG1PQOamKiOTQ2psrYjEeoAFlLrh/gamB+R1gnmC75qNUE0iLnCMJCjKvafpHYeURA8vZVQIiMLI7sT+yUOBpy/5ic67dwcleV9XiyMEuiJwVdSfSbmei57VgAnl2LgaFulB4CzVekPsIWoqbKrWla4rlmEp4C6U1mbeGKwqy5857HM8hGI6c4nhlHnILVGv+nJGw+KkNYCmdvQHhmI21c6HBX5uz5bOVLoqoY3ZMBy+oD4DKLTJPgHza+IqPlkG/Rjv7lfb4EsahtkKTwovuBabQ/c8071J7p6JsBpoJZyBrGeqbkrfgHTTl65EUHEyrAww1RsJiylW6S0wM/SrqeeRbDj7GHnCngFX9NvxPTYTrH/ln9k9Mwpi3VDVQc4VTiymyJN/vXLPYzV0u9rYRHCjTd3IdEMZIJxtayeqKp6l/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(39860400002)(366004)(376002)(52116002)(9576002)(6496006)(33716001)(66556008)(9686003)(478600001)(55016002)(5001810100001)(6916009)(8936002)(44832011)(33656002)(1076003)(8676002)(4326008)(54906003)(86362001)(2906002)(66476007)(5660300002)(66946007)(186003)(38100700002)(316002)(6666004)(38350700002)(26005)(956004)(5716013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+gh2dNuhuTvf57yeqwdItWjqvoGWTFl3GidgKkVzj6bRatru0ouos7bW5P9j?=
 =?us-ascii?Q?5YVRTPqnM1E1TVZcW/w9VaDaqRZL0Zd6ARB+xiR+sDFnzBgRBZzBty/IpxzD?=
 =?us-ascii?Q?6M8J3arYnt9nobnYXG9r3qi7rfy+XnXpVAixLYO83y30JV/s0AdQ0/X/vzgv?=
 =?us-ascii?Q?s9ww8QEM0eXi7XctJOCfbLZxrkFW2wQPGXESGAhw7bODZ/cy6fwgRCmMjhe/?=
 =?us-ascii?Q?E8gekKHWWHNJDLCGW/zIL5gU2p88oZwufi6X8Jo+seHZ3YXOi0q3dttlQ+KD?=
 =?us-ascii?Q?lP5txv4Cp41qTohicCibqGSuZV6XyVLOj9NDO7z+rK5dtnv8nea2LCtzBWIF?=
 =?us-ascii?Q?kB7jiLqA2lzzs8RI6paezo+7WnZzUIpHfYJW5NVFGSrUoqoukFBWW2x5x79l?=
 =?us-ascii?Q?gjVCWNwvzGjETVcYWK6e1y3HsqBPJOQBNIxN3cHT/EDtMabC+cDAmOmjpBk2?=
 =?us-ascii?Q?Gd7w8DRiPQieo12ShXQRuwQMObH3AE338okKBNRYps3rCaiLUKE/dBYf1/Ue?=
 =?us-ascii?Q?7cPTRN2dcZR3W11zeGvP2cAZRWiznKb9+m2Jmf4bjRR768XEsYyKT0u1u5G8?=
 =?us-ascii?Q?bRUrrirlur3r/+3LH3+oJEWghP2xVRxcWdvoPsheEUiwW+8CisN086XXT9e2?=
 =?us-ascii?Q?gBVsz2q0wGMZ9iBsn7k9Oal0c1qDGuR23WNqx7Lvtb7Ap34Y9xmmVS40Pjcz?=
 =?us-ascii?Q?z+6uJaP36lXvSJha5ofEw1V5Z981tJ6YZpPSX5567Dh8hmk/HsJ56/WLqkmk?=
 =?us-ascii?Q?g5HneArZP1CkXfgKYB3j1p6KYoXZtS5gW4PAUnYSMkFDJUkjrPrdnH4wHDLg?=
 =?us-ascii?Q?KshDFXUiWxv4orO5h+78TNiuJfOq2yJaW5m7jLd8OUgp6msfIAq/s6Lu7ruQ?=
 =?us-ascii?Q?QagjcV89EsheZ0PVRSbep4cPxa8UmRr/lO76bSd/ZrWUhmN1GOxAmfZpMD5k?=
 =?us-ascii?Q?Iwz0LbeuCNcnHlJhkeHXwttQPaoHbNQz+7YGZr1BWOFXC9ZC6FrkfcrV/Xow?=
 =?us-ascii?Q?NweUxCGP+yhXDFm6GjRaZl6kt4fQlPQNWEWIYFT8jHG+mEUoyHyCZLp7CH6K?=
 =?us-ascii?Q?EKw6Ga128jGg7gecc2cSqeq3qJuYakZCnTWcju+jSlRybVfFJzOeNufFh0ko?=
 =?us-ascii?Q?wzQ7sfwjGOTFTxrC3Gw/KgfadGARk0FcSlO1Uim9mI0ydRdI9HHknAaV+ZC7?=
 =?us-ascii?Q?oC2G/XrQLvBxqRsKWwrBULVIXzubYFgBMPzFrlmvUrVKTXSZrzVTIdXjxefq?=
 =?us-ascii?Q?jNNTXjIiDZv3gP/p2H7aaxWXMNlQWVLXASx5P5J4EJ8Sx3ZEocLjJMER4+zn?=
 =?us-ascii?Q?1zV6bgBfEa2cn7RwEuZnO6Er?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa675d17-64dd-47e3-e2f1-08d9710881d6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 07:32:40.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: st87vw43qjvLC+FNY4v19M+cnBqHrvj0fTUwMXC0eGIQPPamHczvV1Hf0LP5bPrsMJL4btFYuHyug+OaHhJb9qKishnh5BtnflaIqahXQmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2096
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10098 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060047
X-Proofpoint-GUID: pUyWpCEOLGbtTxUbWUqHV2p-neUJO4xj
X-Proofpoint-ORIG-GUID: pUyWpCEOLGbtTxUbWUqHV2p-neUJO4xj
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 03, 2021 at 08:06:58PM +0000, Alakesh Haloi wrote:
> This fixes following error seen during module build
> error: control reaches end of non-void function [-Werror=return-type]
> 
> Signed-off-by: Alakesh Haloi <alakesh.haloi@gmail.com>
> ---
>  .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 8e085dda0c18..5d088d6fb01f 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -1646,6 +1646,7 @@ static input_system_err_t input_system_configure_channel_sensor(
>  	default:
>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
>  	}
> +	return status;


You're working against a very old tree.  This was fixed over a month
ago.

>  }

regards,
dan carpenter

