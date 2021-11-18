Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5596A455495
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 07:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243250AbhKRGLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 01:11:24 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35568 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241659AbhKRGLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 01:11:23 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI4D4TM019322;
        Thu, 18 Nov 2021 06:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=Td/PEqS1Oivvv3jnykOL/fVHhRyUazuTdvpFzSNW+vo=;
 b=kks1qM1VK2WuQ1ElDVsqPN4lL1CZYL6MUD0CEaeAWsjCBRPwcGR5FqYHkqqXYGrWo3nA
 Q9pyTccILZHLm457FE/zz6uxAx3GBMf6QOp6L2OplO7D5M/J+8/6C3C3VO2Z5P/bBiP2
 KDQtHG3k3vchhjz/oikoW6KwAe/MwOwG1q22/I4mB7y5T15TouAWpsycxoLBoETOw6Nc
 ae0XnLaQJeTbinYc18lcQwU25SG4XT8vApoRuNnQXL9kI8SUzGatXJMHm/w9nZ6sd4zf
 QkINrlVSayQ4rcYWFtXjIF+ZzBN8Ina7Z4e1QJ3BbhyvCyVie/OYYLU6MxmQzgxmkkaj lA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cd2w8vqd3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 06:08:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AI618MS118834;
        Thu, 18 Nov 2021 06:07:59 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
        by userp3020.oracle.com with ESMTP id 3caq4vf9gq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 06:07:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8DpDPHSExUr9QRy/zCG6HOgmJ/YSwhNkDtj+4XaJpo4i1A/FYq+yGWrmnZl8SfhMqIDLgrUENRnofSwAMVpogftZGahV8V6ziuv2EwQ+A4zCh4WC31kf13dFeTLBA/yJ0hf+U+KKfRFjXT+4vr+9DFrkrB9YI/22Gl5eLWylMOF2fhqF9I6ojvibV9vk9kPjorUhOjr2/qCcvfndOQb7g1zWZHS13q8glG+TCss/YLAP6VAF9TmhtpW5lk57JVmLqhQ2PfkG+OepOQ9RrV4gkLT3HeauejnRLV2Ivkq/JhVXvqnINyh23wHtCHGMLd1Qg1rPeN52vYPl8l1PQZTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td/PEqS1Oivvv3jnykOL/fVHhRyUazuTdvpFzSNW+vo=;
 b=b0xUBHGlrR1dkPP1lcCanGP+wASnOXk2hn89S5MRw0NgfIGBaZr+d+TY3othima6etiZYg7CKO4l6Bt5fdbhhA1y3Zp4leoIH/ZPwFd0Q+Sil3fPTsGNs01Yp8pVE/d1Gd3Jruz3VndnfQf7lt++sox/D+jC6cwAU4TvisUKPdL09jji9nLIOU9ixoFp4bitLgrV1vtnFqPNQe59UwiCn3//DMC5gIlR556LKwh1XO095tVrtKoGTQEL1vx0jkeisDaTD9aCi+feRsTSXNSIN/unH6ecSUrP4qroWCAeQd0LeeW89+SmpCSbjm0UBEHDOfOvEL49qKlVdqWZXf6ClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td/PEqS1Oivvv3jnykOL/fVHhRyUazuTdvpFzSNW+vo=;
 b=LjiReW1X2lzzpV6N2PMUIfFD8PV+EwW7WmVwMLPBspWaMeIwlM7wxA+ImDCJ9zxsPHQCAcnkhckPR/CA+BnRX7z7gL0d/UKtg8Ue/uZa7Xgvq2QhxtJ+NS3td/s9FNR8EKTR52egCXIQ7YyOXZY2ts8VRgL704b5YUEaWjZMsH0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5680.namprd10.prod.outlook.com
 (2603:10b6:303:18e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Thu, 18 Nov
 2021 06:07:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 06:07:57 +0000
Date:   Thu, 18 Nov 2021 09:07:35 +0300
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
Message-ID: <20211118060735.GN26989@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
 <20211115154858.GG27562@kadam>
 <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::33)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JN2P275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Thu, 18 Nov 2021 06:07:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97aca53b-b395-41fc-7869-08d9aa59c419
X-MS-TrafficTypeDiagnostic: MW4PR10MB5680:
X-Microsoft-Antispam-PRVS: <MW4PR10MB5680686D440A99F6A96419368E9B9@MW4PR10MB5680.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zwgdqP4aHGTsfVt1103XxA2CagL04nuMZSKGqUzfbwPEQpAeTn6lztx6r9fKN51+gc5+5FS86mfYpcNBbPclc3yE0CObwU22hiv0oDiB2gFKC3MsQS3qMw8SGWg1lgQKCZnW/VmeuECF7CoUBFqxUtKjrlEpXD2WSPpVK90ibA7MAynzOqhczhycvm3lCdTin+igelVJLZG7Js9VTdmmOXS555K7WuXRnnpD8R/TQgpJEh5BuMZz/gB0pBgQJuVZbqcVKF2LYTfrk0XE3EK4roGIwq7SPv72fyPrSVJRiZrN2Z/jSC9klD0SIwR8dAYKHuWpH+NIYG6YGclr+Wah1fmBEemP1jrmV3952z/UwM/gusy7aVMcQ5ZjK+UURnWAU/B4fdeRdGNnu6jIjZInkNP6Itah5/ZFx6pg1uzJbtiXNNM/PwWuLi2WcfZWpGcnXraEEwxlgojQebZL+Qxq++RsUP8K6/fuS6+RgsN70cCET43TMScYU6WI/yq/ZUvkS4akWKynBM6Wuo0ON6cQrXQRwNcXl8zACI+eoHZfAb7/e6zC/0E/4o4LuDFy4O4RUHB7G9x3oYDcPhmULPToOEKPDTcGzt+LPwoHSwILkOCnE8z2wVEGutIQ6ALYuepjc5cCs/JUEJVbxJ2Y/Ty4tSa8cC1LjwnTM+AycVFqRrOcIwYXwEwPrSQeokZfXYyTcBhuM203+UUqSH7QkGddQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(316002)(55016002)(7416002)(26005)(33716001)(54906003)(4326008)(5660300002)(9686003)(2906002)(186003)(9576002)(8936002)(6496006)(66476007)(66946007)(66556008)(52116002)(6666004)(86362001)(33656002)(38350700002)(8676002)(44832011)(83380400001)(6916009)(38100700002)(956004)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGhqNVhWTXBySWo0SFZRb3plOUJlaUhyOTZMdktGRFBkaXl2bm1yQVByd1Yv?=
 =?utf-8?B?dTBJNmZaOEppRG4zOUpQdmcvNmF4MVA3YVpFYmFuSmJiWnVyM3NTYWNlTjNF?=
 =?utf-8?B?WmlYQmdSbGsyeHFNY09MeExKdEhpVVYwS0pzMnNZTE9SbzZnSkVWeGswbHhq?=
 =?utf-8?B?MlIxWEZ6WGI1bDUvQVR6Tktzb2twTStiMEJYOWRhbm5HMlI1aitTWmVNR0VL?=
 =?utf-8?B?NDFhRDl5ZkdZbXNDTW8zazBrTVdIcW00WDZaQ2dTajB6cXdyOVc4aUNicmky?=
 =?utf-8?B?VEZVWlpTWGdnSXNCR2RpcVlHSlR6b0xBWHBEN2NPUXpuZkVwWEJidlVPL3g3?=
 =?utf-8?B?bnRvVERaWmZRbzRkSTZJVDVyd3QybHZ2UGNTSEIrTDhiYlNaSUFWT0JuTi8w?=
 =?utf-8?B?NlJOb09TTDBvY3ptaTB0aW52TWk2elZIR2JuTnNKc3ZUbjlobTBjcXNkenBl?=
 =?utf-8?B?ZzhXdVQwRFhsbmhyNUlnQ3ZhM0VkVmVEWE9BaDNOZTFOMzRwbHYvd054VVgz?=
 =?utf-8?B?UmplWVd1RldMdm80YmhFRU5TZktmZXNlUmZXN1RyQkNyVWY4OXVYbkpPa1pq?=
 =?utf-8?B?aDIzekFVbEZIQThseXNpOTZUNzh1REN2ZkhVTGhxYVpFRm1CQ1Y1Zkc5N3dW?=
 =?utf-8?B?VWFna0doMXlCM2ZNVVFoZllYVnlwYnZldDBQYXo3bkpsWmZLUklCL0lvenJV?=
 =?utf-8?B?S1Q0YkcreHVkZ1pmTTBvQUdNK1NwTit2K1pWNGJteGkvQ1J6VlRZT3RxaGRi?=
 =?utf-8?B?K1g0UHRNb016VDlQRGg1OC9qUmRrVjJ1SnU0Y3RiVVFUSC9rN0tTZERYOUtT?=
 =?utf-8?B?NzVkS0c3MmZiUC9ON0xUR1dXRVQzVEV2ZnJyYk92TXRRbWlsTXhuU2lUNnIr?=
 =?utf-8?B?M1RoUTkvaXlpOUl5UmJkWlh6akI2WE5STTlZbzBhWUxjL2RaZTJOTU1KVWdj?=
 =?utf-8?B?Q0xqMUlQQVpOZ01ILzBWcllER3BTTEhVUEE4dVdwYjRqcENjd29qcWJGdzE5?=
 =?utf-8?B?d0dSZm5CTkhGbEpTZ1VPOGl2N0JEOGVHeGU1a3YyQ1ZyYWcwcytacnliQlFD?=
 =?utf-8?B?Z3lkRHFIRDRwQzZ1Y3dvRG9Zd05JUkJXODB1K2lLbzdlSmQ3TFJFS0dLZWNK?=
 =?utf-8?B?OXluVU02dEpXVG1SZWhwSmdQTVNLa1VrRmlYUzhtdjlhYi9lSWVWYTE4TDRL?=
 =?utf-8?B?VitUZmdJL0JSMFJjL2pHZC9tL1V3cVV6c01PZkpnbk1zU2NzTmVXUWxTWTUz?=
 =?utf-8?B?UmMyZ29Mc3dWU2lpQTFSTTVsTDR2TnVHdC9jWkdWZWZJRXdvdUtreFNGZ1Zj?=
 =?utf-8?B?bGxCRjcyVDlvYXM2YmhqZ3luM1ZtdkFMR0tQL2FwSXE5NlF1V3I3SGFWOTcx?=
 =?utf-8?B?Z2NzWGlzYlMyUmpROHdWQ1QzbWN5blg2Qzg3VEhjNFJiamRRUFRSMWxjUnZv?=
 =?utf-8?B?ZWdMRmZpNUx2K250VnQ2clVqSWQxSDZzbHpzVlNjaEtoS3A4UVNKZDdDeUVI?=
 =?utf-8?B?ZEljREF4RS9XQ01BOFB2K1pJM2QxYVdiWUhmc2toaUN6MkdLRmpiZUhpZ3BG?=
 =?utf-8?B?ZTI3YnQreklMWkN5Y1ppSlpOdzJvNjAzOUFOWVprYmcwSGsxbXFlWHEzdEhK?=
 =?utf-8?B?dHo4emZlSjYwcXlJd29WVTZTNFBTL0lhQktyalhTTzR0cTg2VUprdGpQdE9F?=
 =?utf-8?B?UEt2MmdadEVjY1NsVStBeUtTem56Y2t4MktvdXV3WnlvNnRaZ3pqMDNqVEhS?=
 =?utf-8?B?dDZXMEdMbFJwNDZaVUZHNVhGejdJV3lWODZHS2dVRkhHYjZKaGN0eWhVeGxl?=
 =?utf-8?B?WUtUV0ZRZS9CaE9VTmZBU1lieG1ub3ZIdW0wQ1d2TXBGN3lDcGVDR0JkT2Zl?=
 =?utf-8?B?RFk4UmJ2Z2lSRTVlN0F6dElTL0hmZ1NyUWdpTS9EMUx2NlFsR0JNTHRjRHNn?=
 =?utf-8?B?VGtSRTVjeGRyQm9HTUhWL1I2c0FmVzFheFdEMktLQkMxYUI3K3VWNkMrNWo1?=
 =?utf-8?B?RmVzMHpSNE55ZHR5T2lEcVRKUUdrdDVHTy9QVHFYbVUwRDF4V2JPNkE2dVhX?=
 =?utf-8?B?NEJLL2ozVkZWZzJGdzU5TUdIWEw4QlI3KzJvMnFEdDZuUGFYSk9kemJGb2RJ?=
 =?utf-8?B?b0pKbUN5TzV1cHFzOFhrdDJIejU2cDlRU05lMkg3NWZvWjZwaUdkb2paVmRi?=
 =?utf-8?B?NXBtWEdiMnN3d0puVmpIWGR5M05jcEdlSERuSTNjMFRZenNrT2pTNGQ0V291?=
 =?utf-8?Q?lAHOg0jbA7UGYdUJh9RAokpodV4Pe3G5kpbvOn6BWM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97aca53b-b395-41fc-7869-08d9aa59c419
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 06:07:57.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdK53PYOF45ftE8Zu1fDUgfxvfod24buzWvuLem1ZjVWnmE87++6L2DEig47piSirGumTvYTeqlFWKokt63+jDx7ikIPw4vMyIKfLqIF6O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5680
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180034
X-Proofpoint-GUID: 1mSM8V-6x2YwB8NtDPkatXls1BfXH-Rg
X-Proofpoint-ORIG-GUID: 1mSM8V-6x2YwB8NtDPkatXls1BfXH-Rg
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 07:19:30PM +0300, Dmitry Osipenko wrote:
> 15.11.2021 18:48, Dan Carpenter пишет:
> > On Mon, Nov 15, 2021 at 05:34:47PM +0300, Dmitry Osipenko wrote:
> >> 15.11.2021 15:44, Dan Carpenter пишет:
> >>> On Mon, Nov 15, 2021 at 01:34:18AM +0300, Dmitry Osipenko wrote:
> >>>> 15.11.2021 01:23, Dmitry Osipenko пишет:
> >>>>> +	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
> >>>>> +	if (!vde->secure_bo) {
> >>>>> +		dev_err(dev, "Failed to allocate secure BO\n");
> >>>>> +		goto err_pm_runtime;
> >>>>> +	}
> >>>>
> >>>> My eye just caught that by accident err variable isn't assigned to
> >>>> -ENOMEM here. I'll make v2 shortly.
> >>>
> >>> Smatch has a check for this so we would have caught it.  :)
> >>
> >> Whish smatch was built-in into kernel and I could simply run "make
> >> smatch". On the other hand, I know that you're periodically checking
> >> upstream with smatch and patching the found bugs, so maybe it's fine
> >> as-is.
> > 
> > I run it every day, and it's integrated into the zero day bot and Mauro
> > runs it.  So someone would have caught it.
> 
> Very nice, I haven't noticed that 0-day runs smatch. I assume the smatch
> reports from the bots are private to you and Mauro since I never saw
> them in my inbox and on LKML, correct?

The 0-day bot is not great about running Smatch honestly...  It never
ran Smatch on this.  It would have replied to the thread.

regards,
dan carpenter
