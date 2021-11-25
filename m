Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D0245DA05
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 13:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352692AbhKYMb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 07:31:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:8412 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345004AbhKYM32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 07:29:28 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APBxSBp012709;
        Thu, 25 Nov 2021 12:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=p2yTzdPsc707far2C8TbZsWraN74C7iht7pCe2hND8Y=;
 b=qlDOezNx6ijhxjGL+yt7CsOtOYUwbFYWrFAnm95e+Fpbeg0/yPie6az247zyTilvLBm+
 73LLzQDF3L9jjwcOqMvd8q/WCP5JO9PKnBHqDqDw25GUlnAbelxThzKA08Lp0du/KwIZ
 K5RjBoWkhxLU7u6ooA7dmNVbWfKq6iW3ScnpTCD8P7YJgH1GHifUII5vSRdUj8zHKnY5
 UKgONcavekeR2eiaRNu+UIWQck1eCUrNEYiiWVwkINlfBWcddWcVydNW4Zc6e2h9Q4fK
 uCHFzXQPnH+4EymIbovXoAAfcBIyX+qL82h6xX4vHTdMktzbbJqyP6VlZsgX0JT53eum yQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3chpeex901-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Nov 2021 12:26:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1APCLPnd134289;
        Thu, 25 Nov 2021 12:26:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        by aserp3020.oracle.com with ESMTP id 3ceru8m1wq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Nov 2021 12:26:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBsb5JI+MImy5nf5Go8aLgsMjkOcHb1QuWnUbcIhO9L1vPMnk9mRP2RxdxmBU3/WEj/t+k03BHxoPcQyjSd8wkIWrnZvia7BpBt5gsgQ9C35UhfqIzUvK/3CffH7m6JD4V9PGHyYPMW9Tl1r2gDiDWRFLkxdY9dWKuN6fCAQir+SbZEbE5AfqFQ9s7V8hVCabRLh579Dg+exl2WsLr4hcZmb+Harq/06qw1ZRRk6ZTGDvgFMvs25d8numw1k0oS83Tr4FfLohkDRqItPSJ/NTklWgo8dU4OYklpr30KQTeyxZ+fy87vH3DCSbvcs9vL+q3Z6fHldUkzNiXSRbt80ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2yTzdPsc707far2C8TbZsWraN74C7iht7pCe2hND8Y=;
 b=WF/76pf2n01T4QRtn7C4SaArlBzR5Vf0Qazyul/7XGUdAMiH91wxlSASj0IMNmDA6Hidpk932KmHDMrXcMuQ3Mdekcr2V5yLWr8NTG5BwwX00XWLiMSYhsABnKpDKK2g+90k12cenTrCUuE4zFtLVCwOa/9XDeARf0TnIGlkj6ost3ZHyjMj5ZGb8deJ3u3XGjVA93DJ2nL8UIdMh+BkZ78o4Yab7XLOl5regUuEJr4rdTTjoZCN6nWFYqfvysdLVMICrfsSYi4YyQTYweaAh2Uic9oxCibbzTkhDTOkpWzVjS0ZTbTsW9IPRT4b2Xj5q8axNTPSqg45FP/AZhW1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2yTzdPsc707far2C8TbZsWraN74C7iht7pCe2hND8Y=;
 b=qaKIhyAmOjD1Xi8kOZFREOI2Llp3890+8zb+PLHG7qaE9rA30Pe0jBj1kkwGHnUoohGR8F0fL/xWW4O1stR582S/v7tplUB54PDXylECPLiLPijlC2oaBz4AifdUMKkNCkV+k5xJFeKdntgjMZSV3uLKpmeJyn5/LVwRNsDSXBQ=
Authentication-Results: danwin1210.me; dkim=none (message not signed)
 header.d=none;danwin1210.me; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5861.namprd10.prod.outlook.com
 (2603:10b6:303:18e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 25 Nov
 2021 12:26:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.022; Thu, 25 Nov 2021
 12:26:02 +0000
Date:   Thu, 25 Nov 2021 15:25:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kyle Copperfield <kmcopper@danwin1210.me>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Dragan Simic <dragan.simic@gmail.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip/rga: do proper error checking in probe
Message-ID: <20211125122538.GF18178@kadam>
References: <20211120122321.20253-1-kmcopper@danwin1210.me>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211120122321.20253-1-kmcopper@danwin1210.me>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JN2P275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend Transport; Thu, 25 Nov 2021 12:25:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97f89e9b-fcc2-4e79-0d6b-08d9b00ebe26
X-MS-TrafficTypeDiagnostic: MW4PR10MB5861:
X-Microsoft-Antispam-PRVS: <MW4PR10MB58616A9E9F68E4F40D53F51A8E629@MW4PR10MB5861.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TOhJ3ozZwW4D9Z0z4kMuWap6o6+gR85jrutp9I01HM/dJBqfAwLteBMU82O2a0cYcnYz39caGLQ4IwutAxMuE1iSAP0yAsBOsKoQ3GcFAXeA53MaGhs9UgKV2G93M38P6w5H5pQbyNwbaXO2oFXRl/dszfyh9dJ0U41Dl67XpNGhB+ts+yhBeHTfaTXhg71pAewTSg6TY1hIUZJyJBn3cpj0hqjBK5y0+yjePa2Az6kLql+C3hMWwLdEt3MDfpphtkuC3KMn6PmgEhlVYKd8Jw1HzytN09HpGkHTZQIawWmOuPQQwmryomJQ5Uu7N6RYyDDDtAyegNbMcP7R8AkJHdVIY1vBc08MVNQKTpO9UVXkGlr+enhZoiBVvko+Qe5M/tPdG+SP6X3Dnl+uVf5hsFqpBv3lYxdo7ZG4y+15QvGyFiW7vv40Pm5xnvw/oS6vo/Z03hjfo5NRk0yG3EDTAKC04CiG+1qAwDmKUbWLpE1/Eqn9fLakyxM6Gsq9hmm2xlAhXgBf5k4+bK3mLdIcl41YJRU4Y3v2tiPLqi1HQqmCQ1KEHOpaEmd68cWKJDjBT5VEdnj7bRppuQu6CPGfz4x73tWEsh6UTfWsxAzeeJXNyB1v6CMesP3/EvMJ8Jt7OSWLzIPgWOaJSHctaH2LUPRmnULrdiFES+H6dWRWO/EAmwn+sAZCnNc597KeOT6ymWauJCBBdvSri8Uv57KAZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(84040400005)(54906003)(2906002)(33716001)(6496006)(26005)(508600001)(8676002)(316002)(33656002)(6916009)(8936002)(5660300002)(9576002)(9686003)(86362001)(956004)(44832011)(66556008)(66476007)(1076003)(4326008)(52116002)(186003)(6666004)(66946007)(38100700002)(83380400001)(55016003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ua6ndyV4eUEZCr12oA9jqbAOGl0g2SkcPCrOqhIrEWRPyzx2fD/tdvvGRCKp?=
 =?us-ascii?Q?smUNSZxPGLV6VPkgYD2o2L7XGy5kDJqS8ivYLYjHIKoYfxrx6Hu6QG6M0enO?=
 =?us-ascii?Q?wrxBUW+OColvupXaFc1xU+uW/VKk2sPdkLH5klNMvisvsqfh31xE9/gBORzb?=
 =?us-ascii?Q?UUPjc5wZ5XyYj+pMM0DUJX3TsRBHk8vCSSJkFkZ/fE8vSidldxTkPOFdXAjA?=
 =?us-ascii?Q?fkqPMmR3yj9I1XxkZ4FahagB7t0Sn/EyDM582k+4iuEqesQ4FiHQv/rF5RQH?=
 =?us-ascii?Q?r/RB3xhKvFGk36XF+xZuzgbJRrHTLAGGDPBWASCJ7Qp7fDB+WbpQpH4yoT/l?=
 =?us-ascii?Q?L+Kx7aEnGCySs9/lBzSb9+664zvqEPi3oz6rpMyIVuB2w+ilwXtUi+azaZO0?=
 =?us-ascii?Q?/VO9VyocP3DVgs/92ll8LaUtQrhJ+RHLvAuDHtO0t5ZLzzdlbswKsiky6Lug?=
 =?us-ascii?Q?WI79pmW2GWBYV3gBS25wQuMFiZcD33kmOjw2TJRGB5R8l3CgFfKnAK/0btIA?=
 =?us-ascii?Q?GkjBTHEfDWEOT5A8um+TyQxqbG065xwnKz3Bot9igktOsXnCmiPVXyMmX3uW?=
 =?us-ascii?Q?K4YCie4q5t/zxV1dQ5wbMyaZEEc6NGekieT6naqEyNTtz34dUgBNRCfTOEok?=
 =?us-ascii?Q?XeCub3hEno7jjq/Cas++2mqkHz7TNSqPiqRCPNp7xyf6PDIg0YzstFcqiAmC?=
 =?us-ascii?Q?tnNHg86yVQnR/HKmIDkxwoR5i9eGPtLHpDG7Vq0Tt5TAokDjGhFZJrxFsOrJ?=
 =?us-ascii?Q?gOAZ6m0bxv7+gIe2ffjEoX3pecOafcc2QP1LLpmnA0f7zMy99fYe0HaJra8f?=
 =?us-ascii?Q?zpqLB3NP9SCQbA6D9Q/OCeftHwgKJ1nXghn6laMa239ND8YtNb26GnF9Y2h6?=
 =?us-ascii?Q?MGGIsuEna9HQ6acQe49G/OiUrAy3mdk/849HFfWq88/dMcJRwtYmHJsuUcDB?=
 =?us-ascii?Q?7/tUfiq5lt7DOEJ5OnJN/JyuVMEHYhUNvjKK8p8eJMtk03coMWEYFy9z5m1n?=
 =?us-ascii?Q?uVuItDfsZdyqPibgBVaY7j4lSvmLl/UNSoJRIRVDyXBpcTvKfIhefTYhv6iw?=
 =?us-ascii?Q?S3LloKt2fLehFDb/vNjyQVSvVHjD95V0tBOu9aow5rI8dMmNH8Xn/DBMgCXE?=
 =?us-ascii?Q?AhhdOmKFBYGb0pUqjw13bY5NuYwi7pArkugYBHFVC3vMsPAQHV0fa7Jsk+n/?=
 =?us-ascii?Q?MNQMvkOKx8cuIDPhFSGY/6ubNjO6qD7ruLJXHqBbqt0bWTAtcMc/ctnPACmU?=
 =?us-ascii?Q?6n2zK39i3cgIHMuLdrj0VlKlOgFnX1slczFRaFMsgPB6sbDhgfcR74GbZGZh?=
 =?us-ascii?Q?kP2pCg5oOu0eYqZM+R7zEAUWoej/xqPLctFJWK9rMPKFBxpk5oqxa8HkxaKO?=
 =?us-ascii?Q?duLqwzLsXEzEaOKKJiSu/QsUglHhidFcfxD/woLb0V1NM6UxyRIZlKXjM6+D?=
 =?us-ascii?Q?uCAcrcyO/7IZXPCxDi8PCXONIFbnBz0JORPfwvjni1dcDmoGo78eV/lF2yhd?=
 =?us-ascii?Q?TBxy9udbyRZq8mHNBJK/21gyUc40NpdiKWL4uFwXJPrpQz7dk1eT+OP5Ct2g?=
 =?us-ascii?Q?l2jW/EJkuxNv9IfMHFsGIIq3ijfzA3RTcQ25ns7mSUsCOJBXUGrjQXsp/J4l?=
 =?us-ascii?Q?smmLlS5Eb64GUlEfGh4EcMNZuRA3oJachrpv4+8E28yvECIyGpKABrG4N5eM?=
 =?us-ascii?Q?l4X55gOe9x61HYkFP8lSDQ8l6hA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f89e9b-fcc2-4e79-0d6b-08d9b00ebe26
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 12:26:02.0888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Om9HyNhwEuKaPgYpGo8txCB0mc+p/9QMudaFjy1bVXJCxWphB0hrX+sBZGvMSGwuYrx5Dlmz3JBMtz31LKu9S7zbGRXAh/D1RE6zyP0RgHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5861
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10178 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111250069
X-Proofpoint-GUID: ANASO9_yt9weuGCVHE_KZRDsSlZUMOIt
X-Proofpoint-ORIG-GUID: ANASO9_yt9weuGCVHE_KZRDsSlZUMOIt
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 20, 2021 at 12:23:02PM +0000, Kyle Copperfield wrote:
> The latest fix for probe error handling contained a typo that causes
> probing to fail with the following message:
> 
>   rockchip-rga: probe of ff680000.rga failed with error -12
> 
> This patch fixes the typo.
> 
> Fixes: e58430e1d4fd (media: rockchip/rga: fix error handling in probe)
> Reviewed-by: Dragan Simic <dragan.simic@gmail.com>
> Signed-off-by: Kyle Copperfield <kmcopper@danwin1210.me>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 6759091b15e0..d99ea8973b67 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -895,7 +895,7 @@ static int rga_probe(struct platform_device *pdev)
>  	}
>  	rga->dst_mmu_pages =
>  		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
> -	if (rga->dst_mmu_pages) {
> +	if (!rga->dst_mmu_pages) {
>  		ret = -ENOMEM;
>  		goto free_src_pages;
>  	}

There was supposed to be Smatch warning to catch this bug but Smatch was
not parsing __get_free_pages() correctly.  I've fixed that so it
generates a warning now.

drivers/media/platform/rockchip/rga/rga.c:928 rga_probe() warn: 'rga->dst_mmu_pages' from __get_free_pages() not released on lines: 928.

Also I have introduced a new checker warning for code like:

	foo = alloc();
	if (foo)
		ret = -ENOMEM;

drivers/media/platform/rockchip/rga/rga.c:896 rga_probe() warn: inverted NULL check

I will test that out tonight.  I've also created a warning for if we
return success when a function returns NULL but I'm not really
optimistic that it will work.  Still, you never know until you check so
I'll test that out as well.

drivers/media/platform/rockchip/rga/rga.c:912 rga_probe() warn: success when 'rga->dst_mmu_pages' is NULL'

regards,
dan carpenter
