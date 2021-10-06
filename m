Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24E04239ED
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 10:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237689AbhJFIsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 04:48:04 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64500 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237543AbhJFIsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 04:48:03 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1968iu0j024853;
        Wed, 6 Oct 2021 08:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=KSU3QXU3JS4a1VazPCcwoX/7Y4WV2ZhmjseTaxafd2Q=;
 b=tM2TlTxoPoZXJB+d3tm+mGoKI+qX8i1ZQsy5G+Vtkx8dbqxUSH/Tezj/ik7wsYsR36QC
 GhonNpl9xOIQVCXQcqkVXVJVl/YBqXf5fb6Xp5cRnxKbLnUlYCh61lrM4lzGib1nVG1q
 v2AQY3OfH1I/aikBHUn8olGVdS5Qc+7DJm2RZNswGEsulneUUzVaxlIlkthblm26dkQP
 wRM3wjaOXdSVWR41iz8GAzu0m2KSj4jE10VMlbrEK+17BLZXZyMyBGlCa0DhxWbVjDZ7
 blEf7sxMmE6D0vXQMNx9YJc0/HAgicd2pBxuGe3hWi+rHzS2gGItNqA9yyYUP7cNjhVJ 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bh10ga94a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Oct 2021 08:45:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1968aNmc192872;
        Wed, 6 Oct 2021 08:45:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by aserp3020.oracle.com with ESMTP id 3bev8y12cf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Oct 2021 08:45:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZP7vydQ1EzH1Tu6ZAqYVPwwXCQc94KTBaU50A4rrEPl8dt6hIMHnLQQtCHL+vS8dq7tNeRYcKJRyG8VWqeOIVSfhU1ARItNuEVAU1iNc3UTo1r17FqBHRP1pHOqJFr2ugBWF+WK3OhJVNdRIbwU0tPRHkpHG/pi5XyTVMZrhvdxAvf+FphXOB1uBTqI8sAUB/8e0caPqBlUEEaa3Sp6MsmkVir5jykSc8uDvjTEZa+pE8TrgzxkFQ2EBH1hAU0fEZ6iNhyh8odx4IaGGNrboZaBp2jzq4WdfizBhJ7tL4k1KWfQJIqox5Z+BlB+rf7kuJR3JpOUPTv1E+OXDxHM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSU3QXU3JS4a1VazPCcwoX/7Y4WV2ZhmjseTaxafd2Q=;
 b=Yv3p5OOzKU69u80VhSxz456poi61uxVAXnc+xczLFC9OyKuZ/nbNbOT0jPbVgGNqvSJ+CecQr8BgDIvpEhiYOOSvDMznMrStkPBw59CupLsoF2n+yvH9juxnISjoF7djBfarRScBdUyROZQOzxI9EuhW+XWeh37D9LQQLHTK/CdQrZecuFzyCpoNCWsQ6rsf18c7oOpSuC6sOxOZad0tRYqjK3hZk7KTq+FMNV7hZ1EJ7dp/2hje8xrq9qN0byzJlVDwHhMNKjq7F+qyhmufS5KGY1ijpkbpdw8k5JdE6PNLPk7onVbtcHGgZ9JDbt9Ym1qKoq8/FC9zp4niMa/heg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSU3QXU3JS4a1VazPCcwoX/7Y4WV2ZhmjseTaxafd2Q=;
 b=ragJaJ5y+N61PdYX6C4PoIR6Zro0zDQN/23TiygHDVLqiOtKPBcU1mQbTVze4ussz6VPsyywcmacC89+XIUlzlTeb1whHglQKzDRYWGKrDc+2T4/J4nysyr4FL6Oq+QB2fVPkv6lvxyKZcTNiNmrz7SHpSSqpCS7dWXT8uG57zo=
Authentication-Results: piap.pl; dkim=none (message not signed)
 header.d=none;piap.pl; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1822.namprd10.prod.outlook.com
 (2603:10b6:300:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Wed, 6 Oct
 2021 08:45:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 08:45:45 +0000
Date:   Wed, 6 Oct 2021 11:45:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i.MX6: Support 16-bit BT.1120 video input
Message-ID: <20211006084526.GA2048@kadam>
References: <m3o882n0ir.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3o882n0ir.fsf@t19.piap.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0064.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0064.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend Transport; Wed, 6 Oct 2021 08:45:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bbbf64a-4fa7-4ba8-30c7-08d988a5afb5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB182286E6C4CA64B040661EC58EB09@MWHPR10MB1822.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hCMyHkZ5yMrS159YOVp3EOeDu39jQcqZt9M+7LM2H6SFlxmFqht+wOMXQxMr7GJbb8yH5NANGHf5scyyp4ygtHYMEHhq/6W0cp/IU1GZn7CZn7xpOCS/ttaCzUPLV7+gpUDDt3xNeAnHjigkM5srralZ07Xoq5+s/jPJCX9wKsTSqlekiATUKWaA+79GCpW2bb63C0pq5j0HjjmLxHeQIO+A9/9ZQMXTMwS8Q5NjIyoOj2m4I8vjjULtLyq1Q38E7yhfS/jFxjYOW8dcApuXuieRSAyM3kPHmEL630Q0GfFWsIhtXfkdbVcZPQHMHccuLfi5eUyVaaBDKugaahoUYTrkIjBMROwOVv5pOKXtrqxgOrTynUw+mSCxdSu9HPpuhYGmxnnww7qDZdivsHe6PoruWAMOqjDGeSFDQrXRT1CV1M+PvAvytjwoXPqjpujK9StG3HZyzlsb08wHXf4QlDQLp2QWenpe2+MCrQBsp3Lj5qjSPdGS9ENCi20eO5EUr3/g8Vr42Jzg2dFFEdXzTP7i9R3snVlL2GQgSR+mkx+KN6Kz97ZZtLhDL8iCTjAUxtmAuk20zYVgky32fDah9+vEK5a3LF6ZvIpMQmfVwEPUEXnn8oV7zwmyFJlRceoLBGThOqOmerqS5eosiuGDcpGpZ5mWORRpTw41K4zlm7r6gk5XgIU8RCKCY524hkHyG/cog0Si5s/pvY11Oivb3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(2906002)(4326008)(66946007)(33716001)(8676002)(316002)(6666004)(7416002)(9576002)(8936002)(54906003)(66556008)(66476007)(33656002)(1076003)(6496006)(26005)(86362001)(52116002)(6916009)(38350700002)(956004)(38100700002)(186003)(5660300002)(9686003)(55016002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czJSTU5RRHNnYU9RYVpicnh5OVRzNWJTSEU3Wmw4S3RoSzdJS2J3RWNleGJt?=
 =?utf-8?B?NlA4RncwejlXck9pSU9PVFQvOFg4a1Q3WkZqNUtZbjMrbklRa3JRV0FVNTY2?=
 =?utf-8?B?dEM4WTJ6Rk5PZGNxamdkVlRxMkZ0d3dJQmtRTlBDakwrZzdQNnl5UnpnWlUz?=
 =?utf-8?B?a25WQnpyRFYxclhQV2xOc1lBTHIrVnZ2eUdyRHRaVy9Ud0V3ZWlUbWFsN01y?=
 =?utf-8?B?Wk9pRzVrdlBPMkZjQTVCUkhqVFBuVHJGMkEwaXd0c0dzZk9wM1lPVEZkWGFP?=
 =?utf-8?B?ZU1SSGFaVUNoRWpmb25TRElzQ1RmOG9JOERGMlBKb0dabi9QTDFVTjltRVdU?=
 =?utf-8?B?WG5KOUltZjZ6NUdPRk5RL0YrSmtHK3ZOajJENnN3NVE1RC9CMDJwNHduSjVZ?=
 =?utf-8?B?V2VSc3pZZmxjcDZrbjlheko2a3pBcGxPeStKT2tOTm9UNTVvNzZEb1ZqaTRq?=
 =?utf-8?B?aGxBTDdwS3YyeHdMWkdQR3pNazlNTGl1KzdobkxSSk8zVzd5eGR1b0pHK0E1?=
 =?utf-8?B?dGhGL1J4bndyR0NDNng5YVpUL1V2QlBXNzVLMXpEeThsa0xhWlRQWm1tVWFs?=
 =?utf-8?B?VDh0dXFEV0hETzlqNXZzK1dOUkREbTFHN1FJcVN0bnFkSU1HZXpIN2dLWGpi?=
 =?utf-8?B?cDZ5QU5GSHl1NU1VeU5KTU5PNTR5Ukp3OE5KVWpuTFd4WFVjZ0ZxbFZwRHBV?=
 =?utf-8?B?aHNaMlVRb1NWdDVNaHFLQ2duMDFwYmFSN3AxV3FZOTd4ZEtTaTFnM1p6aC9I?=
 =?utf-8?B?Q2lVN1hFbVNmYm5od0c3T2FkdW1PRWJMdXdWaDhhaDM4SnV3ZHVwamt5bjFq?=
 =?utf-8?B?bGFzS2FYd3M3alV2V3FzVjJmYmgyUEdPNXVBUnRQNHRlYzUxUVgrTGtteUI2?=
 =?utf-8?B?aEwyRW93R1R5YVhlOE40WlZUN1RkeklONzZlMU9HbXNPSUNNTE5CZ0hrWmVD?=
 =?utf-8?B?dTk2V1VzNGFQczhESjY2SkhZTXVJY2E5MDFuR2dsamI4TFFmT1UxM0MxVmJG?=
 =?utf-8?B?YlpzbFpudGJ1cWR3NlZnbUZLTmRMYU9QdVptS2NOYlhDWFV6WFh3UWJkSjRB?=
 =?utf-8?B?ZWJSVk9nQ01haXczM3BSSDlkSkJyY3g2aU5HcWhYU0krak9NNWFneDVPMGQ4?=
 =?utf-8?B?UG1UZ1VtRVY4ODZBM3c5aEsxL0xoOE16UlNNZ1ROcU1peEV4ZVVkRG9MSXd5?=
 =?utf-8?B?ZWlxNXA3M21WV2dEb0pNSGZObjhtMGhOcVpRa2lOa2Y0Rkl2SW1hVjlXSVg1?=
 =?utf-8?B?QkFQZTlVMmxEMllBUjdkRTczc2pOWnZ2VFdwM0didEhOWW5LZGNUOXQ5REUr?=
 =?utf-8?B?anlxTnVtcGtCeVJpdlNNY3ErWGNNR09QM0syT1NnNXZab1dWcFJtWk0wa096?=
 =?utf-8?B?RWZxUjNEcC9lMHB6WWNFQ2xoV0o4dnZiQmFyQ0t5emdDSnZJSlNhbDdRWEVQ?=
 =?utf-8?B?OW8zbnpyZWZDclpRVm9mbWRSUDJWRmhNRUtDM3kvMVpiL0VmbnVkbFBzdUZh?=
 =?utf-8?B?aG5VVlFFbTdjVTUzM0dOSWlsYmUrRFk0UTF5U3pWMzI1QWpqTStvVWNhYzVk?=
 =?utf-8?B?THp4Y1JFSmFXZU02clF0QVZCMnhacnlScjVlZDMxdm00VDRzZFk2TVRJekpV?=
 =?utf-8?B?RFhpcmN3SHFwTTltVGZCbzdPQ2lLREJiMHVCV0xqSGFjMnJVc1FwaWh5ODcx?=
 =?utf-8?B?NDhrcGtPTEpoaVdDWElxcE5GUHdscVFqWG1HYzVxREcxUDAyQjdWSWFsZFRT?=
 =?utf-8?Q?RBCyk6zqBnRy8dyvB8v1na5M92AcAHrmg9O6eJp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbbf64a-4fa7-4ba8-30c7-08d988a5afb5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 08:45:45.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ae13M7Dl4EHSJxJ5AglSU+fSThNX1B6bk/FxQZdV3ZjynO2ZmigBdpQHE9vuLcuhY1K2yPbgyfbMrIweXqtGw6Gbo8x09fptNjzqXoCk/qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1822
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110060054
X-Proofpoint-GUID: b1KgVySnPSHN7-Eg6tr3TMgod37l1Fmt
X-Proofpoint-ORIG-GUID: b1KgVySnPSHN7-Eg6tr3TMgod37l1Fmt
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 06, 2021 at 08:13:48AM +0200, Krzysztof Hałasa wrote:
> @@ -373,11 +387,18 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config *csicfg,
>  		break;
>  	case V4L2_MBUS_BT656:
>  		csicfg->ext_vsync = 0;
> +		/* UYVY10_1X20 etc. should be supported as well */
> +		is_bt1120 = mbus_fmt->code == MEDIA_BUS_FMT_UYVY8_1X16 ||
> +			mbus_fmt->code == MEDIA_BUS_FMT_YUYV8_1X16;

Could you align better for readability, otherwise it's harder to spot
the two characters which are swapped between those to macros.  (Also
it's basically normal for both sides of a || to be aligned...)

		is_bt1120 = (mbus_fmt->code == MEDIA_BUS_FMT_UYVY8_1X16 ||
			     mbus_fmt->code == MEDIA_BUS_FMT_YUYV8_1X16);

>  		if (V4L2_FIELD_HAS_BOTH(mbus_fmt->field) ||
>  		    mbus_fmt->field == V4L2_FIELD_ALTERNATE)
> -			csicfg->clk_mode = IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
> +			csicfg->clk_mode = is_bt1120 ?
> +				IPU_CSI_CLK_MODE_CCIR1120_INTERLACED_SDR :
> +				IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
>  		else
> -			csicfg->clk_mode = IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
> +			csicfg->clk_mode = is_bt1120 ?
> +				IPU_CSI_CLK_MODE_CCIR1120_PROGRESSIVE_SDR :
> +				IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
>  		break;
>  	case V4L2_MBUS_CSI2_DPHY:
>  		/*

regards,
dan carpenter
