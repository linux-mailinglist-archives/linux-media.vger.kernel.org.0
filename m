Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3ADA4504A9
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 13:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhKOMrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 07:47:35 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46006 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231168AbhKOMre (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 07:47:34 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AFBpNRW005212;
        Mon, 15 Nov 2021 12:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=B86v6Nfmb3MXSeGIRgISNKbHEL+4u4uQqZ99WXAcoPw=;
 b=qwICY1JTusok5raQVBOzzsb3dkVMLSumZW3+lyjJin4CB+kWiJdwFHELZF0VPOKSrZ3G
 PkirDBrWBd5fJyIaO9tXYFIdJdajfpx1QQm3d9NlY61o+pG5j2KI/ox0YIAJb53iYphN
 KPNz9I2sb4iFpWj5K5n1s8bwSqbaxcLTrogizFmrw/WZ4+JiV+PEvvXjjx9nqTODg5O7
 A0VboTggFv9tjm3nSJc9Ku8wtNbBkPZixcbZBsXk6Z8THzMw74w/DGgwNlCC9sJI1AlI
 cSM8DbioO/kSV2d3yXUc2xMgQ+NobiKmS/Sga6Mce2PI/54DIjidp7M4Sm8cD8sYduxl Ug== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbfjxj992-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Nov 2021 12:44:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AFCaN8C032335;
        Mon, 15 Nov 2021 12:44:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by userp3030.oracle.com with ESMTP id 3ca2fufw15-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Nov 2021 12:44:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWGwb12DjShvK1Z8sACuM1fDYKPt4VeVNkvLud7ytCmBAywZHsDscTSlfex38SVRNWAUh30GYqh5XAAqou7ULh+o4/bvUzWd87sVZNInZaR5AenvznzxpHE3HaZVoXLhSv1Q8lrWXw0DkKFn2afsFEkj4B8b9De1PNpTk0eFJfoy3l7bPqF+q0jAJ09Qt1fIgUP3EHMWgW/aV98bG9J0POaT55KiFGM+4RBkg3RuyMWeOchITJK5gQw+Wt08Z7GUNfrUSt7l07MgC4IWdoB4vW7KFnv4XtlwBRd0+VmYIsipu2Vj0KnVQgx28xGLVNDgZ/1IZGlgYdn541XDtZo+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B86v6Nfmb3MXSeGIRgISNKbHEL+4u4uQqZ99WXAcoPw=;
 b=YIgek/V2gttPmbzjFO+Oqo9L27TxpHZgTyArJUlKT7nHXezMw3b2J1974h1RFXiFrmQiv/3mrHOKR0L+rzIegh2ugcs12Y9zMlTlj5MknzxLk8UwdvdORGxHk9qNV9auiyPz8NvS3PImg7gefjpYMoa+yrcTFCpkIOLOlz88L8XhuWCnT2CeyUlXCQd6D8OgCh67Ia1lbQncRjHcHOyyFh2hRsE9tgwE0hrLRM0nDgz+gN1bvZ+vQ+NebNvQGVAVe053DZKRoAnsXgD2F862veEzL+BQ+EsTH8bs7R6xCGs71RhRBYUzLLZ8P9KmNP8VEEV3I5CeXKu9Bcj3gB6kbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B86v6Nfmb3MXSeGIRgISNKbHEL+4u4uQqZ99WXAcoPw=;
 b=aHQH8IsMWxf3DHJo9PdXzyuE5VKLUbB1sOrDr6aalDAZ0Pr1vuwySPFJ/qnYMcXj8W5cLEyt3v4E9Qm2fK21QKA5p+eH8TonVL668BXIJpsMDG6lowW+b/63H91t2LtxmyX4vs1C5vpo0bD5VHtcw/mT4mVoOSJ+JZpDas2+TVQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2157.namprd10.prod.outlook.com
 (2603:10b6:301:32::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.18; Mon, 15 Nov
 2021 12:44:25 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Mon, 15 Nov 2021
 12:44:25 +0000
Date:   Mon, 15 Nov 2021 15:44:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
Message-ID: <20211115124402.GE26989@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::36)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNXP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend Transport; Mon, 15 Nov 2021 12:44:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d265e488-e13e-4f3b-121e-08d9a835a79f
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2157:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB21575301558F8A760C93AC6D8E989@MWHPR1001MB2157.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PbuZvFQb5mIkgScOGYYjWiy1Zp8xlTyMrrALBk26Aa/ZUpx47gO0SKyLpIeQgVxMPPyEJ0VKdgsT+w94l9XdaEwFEPGYyutEDqeRwBm5tFRmbTT7r4tA0lnkrXx+eEVmelTPIqiMmEiV4QSDU13aGkGGNsTwWxScRiwZtq0kJvWJ3QzmifF5JO/sXfrqZqmh5O1SDe7rEXsI5vnOoDEbS21JCWN4Y35ZQalWtFDlyMTgi3E4n5hme61ayVwrzMV0oEn/3Gcp7IWp9UVW7B3hMTpvp0YCUCSFwNOJwea2kAw96N5rOZHyrXXwNlNGBTOWexrJEMknk9tuFU1NsGsebCCqQbgk40N8LJPLg+8Ot20DXVAOJs2umLmeVLeSbjgN+xiyHWjPI7k9k+JMWlddEy0n93G1pnB3QWyH87WUtRViewLLuL+siUJyGfKFO+QRK7H4GiAYZUqbbxMxEOLCk9e2aOdmocZvukVF1lWI9Kbda20tdcEwGd4l1/AJKiXMpepMAVxywMM399cRLzxLqjgT+fyOQUcfKWNZ6BoVcbdiZIYoMLhMboZIM2PODKlvUhkJWVfbxmbfrPYFtM8e1u3Vn7vSxCa0plEOGF2G46fG5WAaJnWOoKEhEdO58X1QkAwO7WSg6fad0eVRRm44nfxoJjJT9HJwaoD5IyfKHt9sNAmfTwgB/XS9EtJxoshg7JKy1D3c61B4yyRr0oN4wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(6496006)(4326008)(8936002)(66556008)(52116002)(7416002)(9576002)(66946007)(33716001)(186003)(6916009)(8676002)(86362001)(6666004)(26005)(1076003)(38350700002)(44832011)(66476007)(38100700002)(956004)(55016002)(9686003)(33656002)(54906003)(5660300002)(2906002)(316002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VyNFhWMXNmcXpTYXJLYTQwSEJTWUNkSVkrR3R2ZTdwYzRlUGluNVIyN3Ur?=
 =?utf-8?B?SW9BZ1BBWU1mZmNVeTR1aUxBSTBVblM5MFBQSDFYT2JHeWduWHhTcUNYMzFP?=
 =?utf-8?B?clVxR2FFZExvNSt3bldnNW0rRDNYWEZ0VlVaRGx0cndSbzYyRnpRQklGNlcr?=
 =?utf-8?B?SERmc2FiVHlYUGpCaDlaejZqaUlXaEcreVhMeWNjNWRERDREaVk1MHNBUXZw?=
 =?utf-8?B?SDMxV0JZOS94L0dQb1hCai9CVkwwbVlocm1jMXNWdGRqMG5WTkVFeUFMQUk2?=
 =?utf-8?B?Ny90S0U3RDF3cExJNko5SDk2MSt1NjRMSU5TaDRRQWU1NkZVazZHaU1McllD?=
 =?utf-8?B?cGFGeWtkb1NsN1lRWTBYNjEvRmZzL2FpRjF4TSs0WnNQdElwTE91U01uMy92?=
 =?utf-8?B?UUtCOWxqK092Smc1cmlFTFRGN1FZcE9oQU8rRnJLN21pc3J1REx6L2ZzajNp?=
 =?utf-8?B?SS9ZTEFhQllzR3F1Z3BkOTJhOVVRTDcyVmZiSG1lOVRYRmpwRmIzY2J3Y3NL?=
 =?utf-8?B?OWlKNGxrSWRJaG1wbyswR1R1QnNlYjBFcmNzZ2FGZ1JYZTZvOWVFdVFqd0dI?=
 =?utf-8?B?ZERudys0YmdUVUcwaC9WeGs2TFlIcjkzVkNVdzJCL1pDNHV0VElZTE1SV0VL?=
 =?utf-8?B?dGhMVThabTdpWnlpbENINTZuR21sMldnUU5jaWN2N0VKMDhXQ0cwZ0F3MmN0?=
 =?utf-8?B?UUg1cTZ3QnB5SXdpdTM4eGRhQ1FKVlRYeUlGbWNQd0JIRWJrekdqTWg0eWdL?=
 =?utf-8?B?SjRkdzJ6UVlDM1paN3dDMHFpeDFKU29oWVBUSHN2Z2ZjakxFWjFKbnVnRGNJ?=
 =?utf-8?B?MG15M1lEZFVhMnVzd00vc2w2VVdBQ29OMldYRHdqbmhNWlA4MkFCcmcrYU5a?=
 =?utf-8?B?S1ZCT3FIVlY5NXBZc1RFZEZwSGZaSmJtTTdjczVCNy8rYlJMbzR1bTkrQzJR?=
 =?utf-8?B?M2RKUWxWeVc1dENtaGZqOHBna3BXaTFGcG1EZXZ0OUtlWnJ1cUdoMzZSb1Ba?=
 =?utf-8?B?dHAzRzU2RlJucytEOC9RT3g5eXZtSzMvZDVsekRiWXptaHlNOFZQMU5vOVVI?=
 =?utf-8?B?bE5CcWkvQzdFVHBSWmZsSDB2V25uT09haDlYbkpmcERzZkpqbnJhYUNOdVdL?=
 =?utf-8?B?RE5vUzNWMndQTE1lSi9oa3FhQm41SFBteVRvbUkyb3FtRWcxNlc3cHU4U1Yx?=
 =?utf-8?B?Sm9HbWZUZTREUVlhZW04VnNpU0daYURIUkh3QVNkN0xxWVpJcVB1dVhXYXlZ?=
 =?utf-8?B?WXdlN2xUKzdZNmV3cTRpYXQ0Q0NVU2hDc2JsYnROVmQ4MkF4RjJHSlFrVFhM?=
 =?utf-8?B?YmdhZjF3WjBMZjdOTUltRXJhcG1CMGdBOFFKR0VidGZmRTVLNGcyK2lpTDY3?=
 =?utf-8?B?OWtTbHl2Unc3dG1kcVJnaGlVTm9YMDBTNFlUQTZNZkpMY2tVL0taeE8weHkx?=
 =?utf-8?B?VERjM2VEdndGT09Yd2ozd29QQzh2bC9zMWZGWE9qN3pMa0FJTUF2WTRNbVgx?=
 =?utf-8?B?SkoxZ2k0S3JYQWl1enR2Qk9YUkdWeUhUNnBYSHlHOWF3VlZwOUJYM2xlUzhs?=
 =?utf-8?B?YW5CeHhYMjZWbS9odHR2Z012QTdjKzFKTURyVUdCNTh2UHRQeEFXZjV0aGFk?=
 =?utf-8?B?V2pvaXBZeXFYWVB6Yk44WmI2N3N1U2QrekwyejhSbEZudU03Q2Q0L1ZKL2E1?=
 =?utf-8?B?b1VyWXRMWVhkTVpsVFVkakM2bkdzMXRnWTFBMGh0WkFOMEpMaUl6RFU5dFhh?=
 =?utf-8?B?WWFLYUgrcS8rQXZ3TklwWDVUZTFDQlgrSWNaalJ4NXlRQ2h4STM4dmJGaEx5?=
 =?utf-8?B?OUw4RTdSL2wzbWlCNkk5cEl3UGpvSkNsSW81L0w0dnhqRUFqNC9FZys0dTFO?=
 =?utf-8?B?S2JTOUJkMjNPTTJvamxHM3ZVSE1QQ1RLNTh5ZjdVRWEwOXJWTlRnc3YxQWVh?=
 =?utf-8?B?STJwMmV3NlV2Q0pkUTNCY01ySVljNDBGbTJlVHNMdGs1RE9jbEhzNzlyQnd4?=
 =?utf-8?B?cGZjRXcweG9jemdhVUtPbTRxK1dNZDZMMWlSelRHSngwdEJYc3R4YjdQOGIy?=
 =?utf-8?B?SjlZOWw3UzJIWmd1bjJ2UFZPRFBmZi9Lb0VMWDRnTzlkVzM2QWJNYk5VYkZs?=
 =?utf-8?B?YVBOZENZSHRwRlBsWEZxb2tDNjJFb2pqUU53cVJHcldXb0lGVTYvUEtnNkw2?=
 =?utf-8?B?QjdRY1NvZHpRQ1NvVTg3TC9DNEJ0NGd0bmdXK1JMbUNuZFh4WXQ0NUFtT01M?=
 =?utf-8?Q?STono/UpowBaFRtS2JvBOwQ3K31hY+GyGiyTA1eSGo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d265e488-e13e-4f3b-121e-08d9a835a79f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:44:25.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAyU8s13YqMcPzgwgDfY5qasucfn2T5xpsf12Kf/9Dhis+YNMJHv0/MnfuEkpAwHHK7tBFK3ZBlvNHGDKQxWz+pXTmpM9TK3XGbqlxHQ+9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2157
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10168 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111150070
X-Proofpoint-ORIG-GUID: a9i8D6tY59keEnnou897LsbH7p__6yz7
X-Proofpoint-GUID: a9i8D6tY59keEnnou897LsbH7p__6yz7
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 15, 2021 at 01:34:18AM +0300, Dmitry Osipenko wrote:
> 15.11.2021 01:23, Dmitry Osipenko пишет:
> > +	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
> > +	if (!vde->secure_bo) {
> > +		dev_err(dev, "Failed to allocate secure BO\n");
> > +		goto err_pm_runtime;
> > +	}
> 
> My eye just caught that by accident err variable isn't assigned to
> -ENOMEM here. I'll make v2 shortly.

Smatch has a check for this so we would have caught it.  :)

regards,
dan carpenter
