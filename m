Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C284508E9
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 16:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbhKOPwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 10:52:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62572 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231562AbhKOPwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 10:52:34 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AFEnWGm000684;
        Mon, 15 Nov 2021 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=7Nq0dXEUfuFwnM4xMKhUUVahVe5UR+CdOKdLrVLwAM0=;
 b=Lam1/F4aAGslU1CaQgY++3DYItmZ4qvb3AoAMzRPCDVZnv/0+v3HqJsyCyv6RIJj4b5U
 Y9YOhRxFzN58Wt7xzQNyhWfj3TNAK9IrMeQHu5cWfgpMp0F/Z8GMQHD3xNvyOHGvJNHL
 c9Y2+pPT+aTLl+LNYl8n3zWHdURf04Munpo31hK6Uibcu6jsp8DCauAwdFU1C5Rmjl/e
 Nk3LHuIgPwkAPrmJ5X2qNBqCcHYukYo3O4kq+JE3ngeKhrxmrCIZMJUAxlv7QCJQH/au
 0JBtAT3K8E2nRott+7GsaA5Ghjqs2pMZMpEkB/hsPklWAyk5ztt5B1OyZH1byr5TWCUf Sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhmnk457-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Nov 2021 15:49:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AFFkNM7110663;
        Mon, 15 Nov 2021 15:49:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        by aserp3030.oracle.com with ESMTP id 3ca3dek6pt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Nov 2021 15:49:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jemYr7cnBSddeyScbQmGB/2kbT1NPT6irmHS+qzCReoKdcdAplgk8RY+DuBx14QhAi9PfhVohSzBuxATqsHUwvc5fEJnM6U5gIv0LbFw2KjFsfo6iwVImw0Gyi4+IREwGnJYtKbB0fQmeitLQhH5fwkEYwJlyDyEn3vb0t+UhQ4TNuwe4Abs3DA+K/jwsDKqgNQ8VRYZr1t566drKPiU5/9gpjSGYH3DOheuYQerl1W8xm/zDU0teq2ukB0eZY1PeyLguLVsudCk+q4pMNbyvTY+lpvXYbJIJ71CZx2l1XE6pH1QSCoeUsSH2c1XPxm2dkhtzp7LfGXKjvyPyMgP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nq0dXEUfuFwnM4xMKhUUVahVe5UR+CdOKdLrVLwAM0=;
 b=KO8y37vMqVz9GNljM0dwoT7EjilSuEihKhYcrMUVYLxzMmeGH6R79W9yyiR/OyMAZxFmQ1ZkIqW8eQ0zQyzOgThtPR1QsygrvOO7NI32ZEfCvqXqRfIpxOmNuN1jjX8kvok/ZkAFJTGog9EWnGl2EZWAnY/R2C7mgUqyB9UX2YVHjWL+zORHYS44ya28A/cFkdcNXtQtBhfIB/OyliAVcB+efDPQDtPAXe5H7UTEdzYhPEj3l10vtyTMNprJCUvW+b7OvHitmF6ShweVMlS4QRoC+0xq1oaFZkRfz9QL5yXV+0lpIe1cNwwi9aM+cCv1aaKXdhGttCvCKyysQubOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nq0dXEUfuFwnM4xMKhUUVahVe5UR+CdOKdLrVLwAM0=;
 b=YZHvgIzOx2dRHLwoE6mlh0U7omvQPscc4U8CJstt1RhJXsfKwIHfQW/lkHv+go+7NZbsgNTOLMTlLX/KcLCc246nM0Pq51mJpOJyeLDZd++rImBmN8moLoZKXbm//kIjIeyuXUexGPzdfzMBsL3O8Oc8hHBAqNB5xildym7XkpM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4689.namprd10.prod.outlook.com
 (2603:10b6:303:98::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Mon, 15 Nov
 2021 15:49:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Mon, 15 Nov 2021
 15:49:26 +0000
Date:   Mon, 15 Nov 2021 18:48:58 +0300
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
Message-ID: <20211115154858.GG27562@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0020.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0020.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 15:49:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb879df3-fa91-416f-157e-08d9a84f809a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4689:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4689C6A7EE09617BEBA3FBD48E989@CO1PR10MB4689.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cO+qm7TYxaRipeBeH/DCm9ZbwZ9wSGWk1NwZQcXYwgmXzq/w+O7Tel7G4Sr9H9rO4Rr6CaczmC/uw+8lWRbMLjj6vnLtN3HHYRXf/FulYfWB1mjf4ed2SliFiTX3faVk04b14YPhB6M9XK3Tb3nygC8qKnqbsgymF2ywfsezYTE2jaynaayESuw7qU8/tSoObDPGvZl5tLFIuBMTXqcjquJJsx97uN80d6flASiH4wyFoZL2R3PTGPxVROjdyzLyZjQAF7kEZ5/4qJVoUzqb9BQZEVgCJ93ghPOtYoLiVnJQ1bOdCB5ZndCa2DeCKFxs9pttIzZhWT+kh8aJpgkbNcdZhtWl+RCNMsOqQb9/kbCs3ik8Vo4Vpn7wJBmCJs+zbE5gH89zGGBaJzBeUxKwxZssb2WNi2f+ZxoFswHy0mZ1Gn01PDFi1E/9GKxa6B143xdsUiCOU+U+nC9gpgdB7HTfn5K1SUmcLrlGajGKQ/R5WcHQi5UF5kxF/WtGGlfBLprD1wYyzLngj0UggMJhw9GhaYtMv4vjkecoeADENak76LKUXwOlq9iJJjU507YIEUBqjLBVKFnMoBpeZx/UZxmfBExaYguGOXdY1t/jMVUDcmls8TSjY/hDW3Gs3fLFn3gCMLVYWNhzzMh6SOap9bS15sG/UPZDgaeGVFhykL72i6Ot5is3TuwHBZTl3eWkxYavbb9XB20m/iCi8ljUWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8676002)(26005)(4744005)(508600001)(5660300002)(38350700002)(55016002)(44832011)(52116002)(6916009)(38100700002)(9576002)(6496006)(66556008)(66476007)(86362001)(33716001)(6666004)(66946007)(9686003)(2906002)(54906003)(4326008)(8936002)(1076003)(7416002)(956004)(316002)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFp2SW5NQVhVaG96NnBLSXZPeTNyc3VLWittTDNkZFJKazRFbEdCWktObWp0?=
 =?utf-8?B?dGYyOFhTZkEzcllNaHQvT2JtYWVnZ3BXNDJ6WHB6aTlyOEtXd0hVVnlBQVdo?=
 =?utf-8?B?d2tySm1OOGcwYmlER1padnpQNTMya08vQ0ZqNTF1ZjJEU1p5K01ib0poVGUv?=
 =?utf-8?B?b09kUS9scGN1STJtT3Z2VnoxNFpjM2FXMmt3ODMxU2lBaWw4V3FUMVN2YnBP?=
 =?utf-8?B?TFZucmZqZVpGT0FGcnZva1IrNjgwWUpCN3cvMzlVdzRnMGVQQzZITm5JN25a?=
 =?utf-8?B?QkV2WlY0b2gvdkV5eXRqeG5kWGFUSVhOd3BTYndDNTg2V1hZVmJmRlAzdHJG?=
 =?utf-8?B?WFVOTHNXSEZGOUtlMldLVWs3SEtIdGJVeGlJOWFBYjVUNVNaWE1GVHVFNG8y?=
 =?utf-8?B?eVU0b0JmNStGdXFVWnhmQWJJWmpHQStXc3BSL2pMU3ZMM2taODhMTnJOT2g5?=
 =?utf-8?B?WkY5Rm1XbDJoaHZHY2ZpL0lyc2ROWU9ydUZZSm5ZZnJ0RWZQSXdqa3liZG9E?=
 =?utf-8?B?WDJML3UzS1Z6L0VSb2pQNStPL21NeWNJM3FvZ1BBL3o4RzlRdFg4VldaUzl0?=
 =?utf-8?B?RGNyTy81WnBRSHVFTXdsU1JSMGZyZlZ6SHZaUm12ZW5mWi9YQ3R4UGxjZUV3?=
 =?utf-8?B?ZjFCU0doejY5em0wSlhuU0t2UTg2TkJBMTduMXpaTDNsQjlPMVBGU2tLYjZF?=
 =?utf-8?B?eFpZZ1FqVVNjWGJkd2w5UnZnZGk5RjEzRCt2bU1uNENvS3FxM3RTVkQ2NUxy?=
 =?utf-8?B?L3NxaTlHaGFWUjFXZ2lwZzFCcHZMSGtTRm1ZSGU3MUZudjE4VzZrMnNWWGZH?=
 =?utf-8?B?ZDAzekNxQWJvU25tZlRmdzI5Y3NUS0I3SzdtdmorSTVVMFlKaG82TlU5aEtW?=
 =?utf-8?B?cFNsOTNDQXh6SWlhNVJ0QUxGT2d6SDl4Y2Yxcm81OXhLT0N3QkYzYlIyRVFZ?=
 =?utf-8?B?WFRKb3hOazhiK0ZiRXJydGJ2WVZuZmxQaUhIYjd2Ym5lVGV2Q2cyNGNFQnpl?=
 =?utf-8?B?dEVod2diaFptcVdEeGUvYjR4Q1hvQkd2dEpYTFg0SVNHdi9LbnYrUnZhRk9z?=
 =?utf-8?B?enRGa241QlhGVVpIQTNJdktrUFkzWDJORjZocnU2dmFESUROR1MyYjBVM04y?=
 =?utf-8?B?ZHBkZHExN0ZqQjNxTnkxV1l1dk4vNjBiK2d5d0tCbWZSeWdjNlNvcUFXUDQr?=
 =?utf-8?B?a2Zyb2N2NzNwZENRLzlSL0NTZE9XQ2cwUEJPbE9yVnM3QzVjSG1NL3l2dm5h?=
 =?utf-8?B?MnF6dTl6UFJ4cmZOWTA3UkZRZnZ3bkRPQ3NhejIwQjRIWngyZThjWVBtbSs1?=
 =?utf-8?B?MkpvOW0wV09jMTZkZzZQajlCUkZEbkgxZjl4M2JWbm40cE55NXdUVU9iUkxV?=
 =?utf-8?B?T0k1cFBmQjQvQ1NURW5XNEtNcEJQYUlBT3dzZDBQbHJDUEhNNElSdkdXazVF?=
 =?utf-8?B?aE4walFwR0x0d2lSZVBIMk9aQ2NNcjBheElQMHZXT1NKZHZVVDJzTy9xbkdM?=
 =?utf-8?B?Sndjb2tnYkIrODNTTERpRWJtK2MwOGpGNnpPT05zTVZJaDl4MExZR09CYVBH?=
 =?utf-8?B?emxiRW9sQmVTbWZTdWM4Tjd0Q05IeHlnS0l4ZndZeFFVaUN3NWVaYUsvL29a?=
 =?utf-8?B?MldqcHlWb2tTQ0hJR3NBMlN4cWxOTmFDcFA4RHBIZUpZeVpPdUxHUXFYQTBK?=
 =?utf-8?B?L1VDOFV2NjRUYkZDSUtxMGFndTkzeEJSNWl6OEhPMlFVMVJtNHZlekFUOFhj?=
 =?utf-8?B?WnFBRUZweEYwWnlmSmxwbHZEU0xnZHpkZERpa2lINFFrcmRDNkF1NXIySHhP?=
 =?utf-8?B?VTNRUGVEV1BFU2FLWHNwS2xQams0UXNOQzBWcFkyUjN3QzBtU2w1UDlNUit5?=
 =?utf-8?B?eHFZWEVmczNyQ3ZzRU9MOUxNeXVLMXJ3eUNVa2RSYXloM3lwT2ZQKzVwSitH?=
 =?utf-8?B?ZmVOalB4ZExwclA1MmV6d0xReTQ1aXB1QTRERHRLOXVvVGtsZExNUnVqUUIr?=
 =?utf-8?B?aG5RMzhmUXBLTUQ2TGY1QWZ3NS96TjMzUEJZbklpUWNDLzdRWEoyTElrRFhC?=
 =?utf-8?B?STRvSXpCNTRYUTFpdmduVjNmdUlrbklqWklhUEFRRUo1bUI3dDRXTjJvTmw3?=
 =?utf-8?B?MldVdSs2TWlJdWsvb0ludStTakEyS2Nxd2g0V3d2Wm1lN3htTWc5TGpwS2Vv?=
 =?utf-8?B?S2tGQkpkUldtM1hQVG83SlJXNU1kV01uQVhTUDRDVm5NN2xXdEtFeENjQmFT?=
 =?utf-8?Q?aUvUBfufDHLHqjFQUt67rSEna3bJu7kECWLxpQf70Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb879df3-fa91-416f-157e-08d9a84f809a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 15:49:26.4639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsIhDVhY93vTa2jk0ygbZ+HhYp0ziLLWqFjRWtIqVI61YI4etZqijewr0YzJjICHvtRWUJG/CN2ZpsEETZFoSd5kksmyFUDEIJI7Aae4uS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4689
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10169 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111150083
X-Proofpoint-ORIG-GUID: OMgz7jKGBnx5Sv3axtvyD246RKfsOYSO
X-Proofpoint-GUID: OMgz7jKGBnx5Sv3axtvyD246RKfsOYSO
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 15, 2021 at 05:34:47PM +0300, Dmitry Osipenko wrote:
> 15.11.2021 15:44, Dan Carpenter пишет:
> > On Mon, Nov 15, 2021 at 01:34:18AM +0300, Dmitry Osipenko wrote:
> >> 15.11.2021 01:23, Dmitry Osipenko пишет:
> >>> +	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
> >>> +	if (!vde->secure_bo) {
> >>> +		dev_err(dev, "Failed to allocate secure BO\n");
> >>> +		goto err_pm_runtime;
> >>> +	}
> >>
> >> My eye just caught that by accident err variable isn't assigned to
> >> -ENOMEM here. I'll make v2 shortly.
> > 
> > Smatch has a check for this so we would have caught it.  :)
> 
> Whish smatch was built-in into kernel and I could simply run "make
> smatch". On the other hand, I know that you're periodically checking
> upstream with smatch and patching the found bugs, so maybe it's fine
> as-is.

I run it every day, and it's integrated into the zero day bot and Mauro
runs it.  So someone would have caught it.

regards,
dan carpenter

