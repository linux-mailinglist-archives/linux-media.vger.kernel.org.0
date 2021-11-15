Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C024501C0
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 10:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhKOJzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 04:55:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19194 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237611AbhKOJyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 04:54:02 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AF9T2P7015606;
        Mon, 15 Nov 2021 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=NhsVs5owuDylgLsW/hTpW8LLuzoueM1AqOZ67dr30Z4=;
 b=QROb9qZXosBK3mhNP2/lSDKiLr/atWj2P/4c9oJLusUj1Xg2MrtjhGe5Rjs8dBOGyaCo
 C5qUXe3kajsdrafTARzCfG3tBicCLc5Slkbr75yo5szRHHlCOlBnTBeITyME2sGnnRDq
 z49ziM2OJWSoTn9FiWV6B7DRYebfyiWg1Mvj8qb4XP37VFeHpy9qTQURVI9/aowbTsxI
 RZBIJgZyeSfTUG68WXxYfS8aQriViC0wVO//h90nJRfpZ/DpTr4jBMcuvnvVfcajYODF
 jXpvX6OzLzoRCXEWXTDwYrhV6+ZuyBrteOGa+NShCAZe1uJLLihQAu+YkhYtvUi5g/7F PQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbh3ds6w3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Nov 2021 09:50:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AF9aNGG149435;
        Mon, 15 Nov 2021 09:50:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        by userp3030.oracle.com with ESMTP id 3ca2fua9k8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Nov 2021 09:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8RlYm6C9Vqsdvtz/ThebgjLbjVLQkFjglr14kM6H1niznM4IlWocvxzTraolUucE/Lg2k7A8IajK46JxyGmS/mPz8MWKsCQzHxWw9jIMcjlNCjCElmYb43Feq9W+mYYwjOIIaWwPg9UvXDqddf2ECL2phwJb5+cG5fwhWRqkcpojYp/S+gz97ipMKzBVT7uAmSBRDdX6OUCMashDBfJWYpXJ2T5E2YHyApnF7NhIVVIEVDTJxaM+0C40yVqgZYilXlR3EzLkNK+M9kpXuIRK7g+jSQXDL9BOj7HMm0VjF95XoTtCH7qfaDdsZRjdWgHbhzDojzPOzb66aRSQhXOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhsVs5owuDylgLsW/hTpW8LLuzoueM1AqOZ67dr30Z4=;
 b=jbuLvCUgHHRXN46GqmFbV8oTONhCU9sgEg1f39DAnwV57P3T1awNUJ06kPKTKHyUTcGps88nhs+0mCS7GnPzaSbRt1qMUB8v0TNRnDwM/9cD9TmXnjpEQ27SkKyW8dKIWTplmC+2TcUMZ4Sj2XUx6a5th4+g5O2BBv7MFoXhDU2mmnK11JDmaRu8itE0PO5AuPeTn11ZBC2aho/lnOoDx77bRdDaGw70khvFoIP0qE/551Y6OT0mj4s1T14iKvNOm2k838YlilBPrUk7zLddTg9gB2Eixq5/4sfRljlNaH39LzCEdmJnwRMabVOlVU8OExO6nWsKESkI7Hf68JftFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhsVs5owuDylgLsW/hTpW8LLuzoueM1AqOZ67dr30Z4=;
 b=zMgG+fjBe8bVj12EAXNkIk5FDcGrgPkXrB3iEaHbRfL53s3TUkW2KBQyl/Zy/JPcqp2/e36D5+qTd9wPob5g4QhGX2NwB7NIXHMbn5ZaxqLi7K1q7FUBTdSJw8kodJCXc//FZBKU9zPP12vqTCsMnx6q4QMN9mmY8FrUDy77QX4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com (10.174.166.156) by
 MWHPR1001MB2253.namprd10.prod.outlook.com (10.174.168.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.27; Mon, 15 Nov 2021 09:50:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Mon, 15 Nov 2021
 09:50:39 +0000
Date:   Mon, 15 Nov 2021 12:50:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Deepak R Varma <drv@mailo.com>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] media: atomisp: handle errors at
 sh_css_create_isp_params()
Message-ID: <20211115095012.GB26989@kadam>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
 <f1157236eacdaab3def9b7d18f1c2e7ef9a3699d.1636672052.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1157236eacdaab3def9b7d18f1c2e7ef9a3699d.1636672052.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNXP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend Transport; Mon, 15 Nov 2021 09:50:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 007f5f15-57d0-4f1d-8eb3-08d9a81d6156
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2253:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB22537AC80A52A0DF524511198E989@MWHPR1001MB2253.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a3cQOfimo83xnJIiaum+DBP7za4SaowKIoWF2FaRE2pkOoKBsLN3O3hg+xaRSg19RNt2w9vsHolOjal7LI90dUdFK9O1ARg+KPeUA6rRDSi6tyc7QpBk8dqxA4FqzU+1ehak1qzsjbxZu2QWhCXCKYMdtPF/L8o1SjBbbkwh60jGAsX24i+EpHroUGzbsxG0U3Sd+wq35oeGVOLXpPH1AKQtjcsJdGONv2jbHzW0rpJLfcTq7phcspQgDdyJpOS/x+Lias3/GEtYCbwoGJowbA7t4ZrwXK8jIBap2H9Ac+l+3nx9T4EcvmMN59SCUCOw6zTU7HUWi0jsBo19awpO5nBWzarKRLitdpyJlBuIjTMyL36h//W+d9Q25nPT474yTqkO6RfWJE3xylcDTKVCCwoCrK2hdu+9SPf8xrA6jV+ojuQSQz7f8IAtN25eJBlYYthm5y1IcicGCS5zxzGzQF1ljUkbAkwAp4BdUiqcSjHu9WB1yeamr8w+ypd1kAL8FGiEr6J1tSTpv9HCtzHFVew5zJLzAKujXCTdcXIh4j+TDCtYnMh2kVBI66mxS7AZlWwUG3GoGgG6BGPct2C4DbnthxtKOO24xSp2j8gXmX3okYKQBX4HiwDf+zE+2y07kREi4Y6bkg0SlDruixhW3PRzwXuav7eYI5tM84OlR47MR8tTN2qUJXia0IEOOWMa0U4kNDmkCeE0JoHC4f59+xR665GXf+9DrITGB4HNX/gW43N/Tg/L/QoCJ+afBoD5I3fa8VR6/gqJBY8lrr/w3LI0a/F23TyTaiTwCvMLSso=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(33656002)(508600001)(2906002)(66946007)(8936002)(966005)(7416002)(4326008)(186003)(1076003)(66476007)(54906003)(9576002)(26005)(316002)(956004)(6666004)(9686003)(44832011)(8676002)(52116002)(86362001)(38100700002)(38350700002)(83380400001)(5660300002)(6496006)(55016002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/MnGi8sVBYKlEpbhqzQAVBZcrRaqEIiunDZzMQNeN2t3Uyn4+vFxajH8fxa?=
 =?us-ascii?Q?a/Yy4gYdyxQmTmPa9fQ5o/Qz67YCOcMGuhaDVkc3dQxo3rVBmlNrEgogUOqo?=
 =?us-ascii?Q?icPDCbDJ/TW3DFDdkOXN0JGZokqHotJTb1ygtlnzGjdWPKFBri0zyNlRDeyk?=
 =?us-ascii?Q?E+MlaXxpJmxYXiRUQ5EQov7TNb75vzu4KCQqzkmFvoUv5QTXxm+S2BB1IcBG?=
 =?us-ascii?Q?KHbZUjsGo7QCknWqOGA79j9UVaDV4pQD5REXU2Ct1A5DAfgsZ3bNKzi2kddW?=
 =?us-ascii?Q?h+jYKDOoRM07y8u0DQi8HWbyUMqKef/PxFv6ZvWqISJLDSmri4j5h70iNgQz?=
 =?us-ascii?Q?7p7DB44SoAMW8WbFiT11T6fW9GF+xSGHytrYk/ke9P1I449mcar8T+In3PyT?=
 =?us-ascii?Q?M8GYnYsXwDltjZ7EmAhQvnSRq4LRC0YJAnYTqYt01FvQtznrXWS4LyZ/yrIR?=
 =?us-ascii?Q?tRYnzAiB4OAbgSxCdu3xwVG2yGQg1eNDYvoySV9MT1Ac1yo1vTm7GrY5C6WA?=
 =?us-ascii?Q?Qy7oB/SnoTpxucniMWK2Ul2Nby0efHVbp1n5VJIlaFUuuTXVaaJKI01DEx7q?=
 =?us-ascii?Q?zgpYTDDQtTxTRObO3hh5cZjm28OGJRGD5vs25Nzv/cI5QSGZpeMIwpc+yM9c?=
 =?us-ascii?Q?IYHulo4tZSCOybutc5pMEoRWOkGr0i16k67x6lWeO/dD7M4RJL7XeD/+w0+d?=
 =?us-ascii?Q?Rt0LTFdk67qEgZ5SO6vsf2jMY/4oHeq2SvKpkRrU+PVusI0Ni6mqG57SHfvv?=
 =?us-ascii?Q?1u9DvJ3WvRaYTqvG1r2EsHnwn71pala03EBMrVr7U6VFKlw4JkKVYwFAgoVJ?=
 =?us-ascii?Q?6E3hyEWohyT8spaZXgjmQcxMSEXRGi8+vik0E+QTdACJ5z6EpNRrIl2aKULN?=
 =?us-ascii?Q?ooZl2rTnl9UJZ4skzWo2xU9JbncIvUOkXM81kkTUbguDC7QXg0qE+7kD3FSR?=
 =?us-ascii?Q?o73x7fIvVHBRAsTYGouSaVHjfyHVN9zjuGK3h8vkl6QjAuMPst+AkLaguQJd?=
 =?us-ascii?Q?uIWpLTj8+BepM4lHZFSx9OCm/lsvU8mbUNen4CRWaIJ+P60d5dGn0Y9PrG8M?=
 =?us-ascii?Q?Zlw5jhJj1MxQ5gF5ypLnqf806cqpTYuOD8mK2EkleXl871RwfKYwm3Sf6S7+?=
 =?us-ascii?Q?MQvROdz9pXvF5aeUOF6FNzzh0CjwdH/o3qnSauXsX6JVlhNJWPzYoRw446WS?=
 =?us-ascii?Q?lyx0NN+x79NIzoDGD3GRgPloz8E4LcGMk12gQXAuqusuk5UDSoJ9lFczDbeN?=
 =?us-ascii?Q?D33/J4Ne406k1JN+xkmVMxxehau7dyIaLokmj2UBaMGd29tjXn2dqMe0ZHO5?=
 =?us-ascii?Q?EKrC14UcgGMQPmmGz9H4uA7MqdSUsk/soSaeNXC+o6snVIf0e4say9+4zF0e?=
 =?us-ascii?Q?ZrZ44CldlYUWlJw+tuacUS8erx9Gk3AulORQ2SeAHvMrCm5nDHJogfmYB+VJ?=
 =?us-ascii?Q?NcEtWdxVP9MMPTd6ii9CPL1qP7XQnoTEsDEXfYHOAGt2W782iuO1UhlTtAY9?=
 =?us-ascii?Q?b/F98/+ReFgg0Bg5yJ2lJP4wyWYycXP0eMh0qjLhkjVW7nbC1RjZ/JNVSoDB?=
 =?us-ascii?Q?r+8JFzx8rBu2SdpA1/t056vpVTS65rIDTOXY7GLaWF4FoDufqoHPkbFoY5JZ?=
 =?us-ascii?Q?VbnR33Hzt41ioMcpmKcUhdNVS5liZnEBLeKwtHLZVNJ5Zxgmj+mI7mi+KrLX?=
 =?us-ascii?Q?EaGpoqyaRzGaj4za5PVBx039+oM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007f5f15-57d0-4f1d-8eb3-08d9a81d6156
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:50:39.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HVR5D8mKnoY/WonnIrZ9Ye/11qp9ue4BX4GUoANboUG2cNC+D/4evWgBTFIU9U4V5SmNn/1y5MTcUNbfoXcBpaPLKJctCm+FqRSUzKsjjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2253
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10168 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111150055
X-Proofpoint-GUID: vkoQO_ov-pu2pScFOjTNP3dzaGpCtWGg
X-Proofpoint-ORIG-GUID: vkoQO_ov-pu2pScFOjTNP3dzaGpCtWGg
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 11:08:53PM +0000, Mauro Carvalho Chehab wrote:
> The succ var tracks memory allocation erros on this function.
> 
> Fix it, in order to stop this W=1 Werror in clang:
> 
> drivers/staging/media/atomisp/pci/sh_css_params.c:2430:7: error: variable 'succ' set but not used [-Werror,-Wunused-but-set-variable]
>         bool succ = true;
>              ^
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636672052.git.mchehab+huawei@kernel.org/
> 
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index dbd3bfe3d343..3cc5b82a8a31 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -2473,6 +2473,10 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
>  	succ &= (ddr_ptrs->macc_tbl != mmgr_NULL);
>  
>  	*isp_params_out = params;
> +
> +	if (!succ)
> +		return -ENOMEM;
> +
>  	return err;

Better to "return 0;"


regards,
dan carpenter
