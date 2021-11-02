Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8130442CB6
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 12:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhKBLi5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 07:38:57 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23608 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229720AbhKBLi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 07:38:56 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2BVcXq004583;
        Tue, 2 Nov 2021 11:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=VanshryCN9Au14Ruw0EU9iTAsSJSTiFpOJ9z43HQbas=;
 b=moG8ercZzGztvJ6NTNTzihu5SJjYP2CQDPQe2OWHL/OcHdQKxrpRcnOPYoFS6wP56v9d
 BnGSOSluRJvbtqlw+R+HODO0zaLglyPJfJTaQHGU/2yUdSAc37nGQ+/GuJGwCqBfcC9m
 U/8gVNc4Qukhu3qPf5lsUAAgqX/eUqkGP7rHuDgBwB38xSdXuHoXxPMNDbwrwtHxQm53
 OGlHTCzVIFeh0uwaRpewE3fMmkyHLZAweaXbMiOaZGYkf3p7HdGN19Ic9mYT3S2n0hOi
 Ugo0y/BrK6Akd5Qrc7HkSttKCGd+b1dWfxLgrhsJcYjQuaocZx9ewUrLeQtr+qL/HZrZ gA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c2aa3ecj5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 11:36:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A2BVc6W096569;
        Tue, 2 Nov 2021 11:36:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by aserp3030.oracle.com with ESMTP id 3c0v3djfym-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 11:36:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deLlZ0EhkF1OuK9Pf8TpQufOKwZM4hXbFH84MvykVWAUtJRhUgLGrbSd8+e/LCt8kW0IyE/WkhKhXhCvEC+opDcGMhH/o1XkWNAomjdBlJB3jIo+GCoJP2pMVepLkQCBeyKNyNHJNXdutwRCSn4vwTD7Nain+UTJjdJP+dmggZOaR+nboqpnUpu3ITp2jK3NmdT7o3WIf7Mn+FKcuZLaV0BsI68YuzwboZTjXbEScmD6TvG4NyQuV2xnRuOhpuh5pOmIS69NuMuirHecnhM9OWYXZeqga4kBoTw80UBUY4UKIJTx0MXNbbppfIm0Kzgd3/Vt7F0huFN3dTWLug9oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VanshryCN9Au14Ruw0EU9iTAsSJSTiFpOJ9z43HQbas=;
 b=P6S7L+BfMOe+YjgOCEJ5koEzVx4WFDjjP+KzH4K/IE/nMKp6K1D8Dve/jXTWzHqDKmL74KwSXuvdiKAwaSVKoDgHJOP0NhcP7KERUiTSMaqNQ+3S+2JoQ5YWVOl5z7ypcTfiT3cn1qWGPLIG5qUprw19PzKZIVGrprDUiVKEDscJFJrmA/LOiDQcBY4bnONVv7maXKS4Hi+aHIvNB+dk7qE59+lIXnpDfJP4VDMB73ZeVANsgM2KYl7bpnuMRHRVOne3Nyi3HeiPBtrmbAR4E9II5x6Ce8tMlWVYQxPc3zEzBR9TTQXKrRBnnyCec0wqu3ot2EBkUSbRuXFSz66vaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VanshryCN9Au14Ruw0EU9iTAsSJSTiFpOJ9z43HQbas=;
 b=Ng+Kue5kmaEcZF2b4wB2cB4hsCBy3WcbqVm+D3IZo2p/jyaM2SI6iGX69mlAvNOsH1fP3gs5IuFgBxlmXuC9ahrsOD5IOPjdHILpnNJEjFC9ah6vuK0xp77DOoZn58GaBsWweY5ZZFlEmA+3P/3e9MClpw5pq1AsNY0Z3jg1Gqg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5792.namprd10.prod.outlook.com
 (2603:10b6:303:14d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 11:36:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:36:02 +0000
Date:   Tue, 2 Nov 2021 14:35:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/17] media: atomisp: pci: use IA_CSS_ERROR() for error
 messages in sh_css_mipi.c
Message-ID: <20211102113540.GD2794@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-7-kitakar@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017161958.44351-7-kitakar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0034.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0034.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Tue, 2 Nov 2021 11:35:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d021da-9523-4694-7f63-08d99df4f2ed
X-MS-TrafficTypeDiagnostic: CO6PR10MB5792:
X-Microsoft-Antispam-PRVS: <CO6PR10MB5792E81D63DC416948D9ED928E8B9@CO6PR10MB5792.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72niiWEsPYebYkHh7sMYnivt3kQZGTPrxLjE3JKV0TmVq9pS+Wok5MBm+YXMgwGuQuSmHooTQW+VqgeOzqlzIaG46jUfTy4LF7wxlZGfehwuxabF2ISJBd+JyNR3iOk6fvdlHlqGCqHMxYIyHC8MIfGsFE5rT/8GmJDLN4dyk5lEzGJCAj/LyBLywCYHLE12tQXXCFg3WObBtCFQ4J74jZ3dMnQRhD7AGDfCPl9xyX6f8DltEnqu3Z6KqcHSPYBHctOupvrABGEHRFaf+30xJheuxux5vN8djTk/oG7HkwEmZb0JbM4FOFXlgyjlPixoY38g1Z0n8uyvu2s4KDpzrqJSGPMtws2V2yodxOzFVEl2kbvNInjDDtktLaxq4VlNGAXK8XDQE6Ymac8YXeUVDXhgTFJW7IVS6gqKZ77RBjFzwEPqgT55xRHJCn1O6NRqfdloI22HoKizXoRYYl+hxxDN1srDzhnlTFcvnW0D7+Q4jX9NSs/MXpDdNBY8C6bJK/Qhk3nXLKLjOT/cS/Bz9a/1LbBK731x2kHzFNO+fNN7IWz6SR7lcQUxQOFLNVn13w6d1Yv1pbtv3xKNmhIiWVM8X13FWsjafLbHwAD4KqpOIFoxGIPlKOl3+mTCh8J/YfW5vfnIxkxdD+uE0S2j67Flup3qx4cdrCKzcDaPJ+vi5xf6nfbQPUGX5W5eTFC9A7OcPtpvRLHrLv8rjHpe3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(26005)(9576002)(54906003)(66476007)(33656002)(316002)(38100700002)(1076003)(83380400001)(38350700002)(66946007)(4744005)(33716001)(66556008)(8936002)(5660300002)(6666004)(956004)(44832011)(86362001)(6916009)(52116002)(2906002)(55016002)(9686003)(4326008)(6496006)(8676002)(186003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FTrYNR0HDKUk65j722UpvmCmMSgBAKO+SoSTg2LWK4PCj6Vnh7TGZoLS09m+?=
 =?us-ascii?Q?Mje6lboFyhKOVix1rrr2Qu5eSQCuLmRf4yY1b2gsv/tkGh6+7L7OC1F/rW5e?=
 =?us-ascii?Q?cR8kMFssKdSIWP8jiC8RNVnTZvubBicXYRWlEtRElHv/xcxeNBW5YPdQyST0?=
 =?us-ascii?Q?ahtU5Y4rWVkH4eLm8vTPLzPAVM5d6q9k6WhNxU21s9mVyIZot+7FO5/tRdoj?=
 =?us-ascii?Q?hN0xX1OCAVBszhKEzd4spY9bQwQLDXsv0VfnuX83KzhXPmMwRUa/P/j9qEKL?=
 =?us-ascii?Q?K2NCX1UVKEv2RWaKqPeQttc4h5WwxF3LDkhjiDr4RtZhtKXYAdKyX45dxJ9W?=
 =?us-ascii?Q?Hx9fhtKpgGS+ulepV6Xnp4bjWKvrAoUG6GhnceuOISRhf1F7ozNbs21XVbX8?=
 =?us-ascii?Q?f0PanFso3Ea0/mbdrQOVYYGPzAeuGFWl82o/LC8t3/BebYircUXJMIaMKrz0?=
 =?us-ascii?Q?V6eF5b10D+Vtm/xlFoi9huOSVvdeOSJRlJvbglJK+1+HcAhtpX3neUn2yeYk?=
 =?us-ascii?Q?LwRdhLU0uXuQkLqnXJlYpZTsNFzKdXEVseXQcJ+abrNozON7qjB48Y+DVXpB?=
 =?us-ascii?Q?vtNXcZFOiS19FUx5ejW4sI0Qy+iWjFC0jeYWSjpGWYdj7oi80vqT0wBSn2mK?=
 =?us-ascii?Q?LwjLXmLgwsCX09vZeYwe1lABZp8SndydMbX2SRs30fPvKFW4o7uGCQ+IS3lG?=
 =?us-ascii?Q?HmB7pMPAAuZXlhTUbMF3VaO/KdNASQ+r32BRPEkT+d5JrSWgmDfAb9MWMG3s?=
 =?us-ascii?Q?fqWimiKQXerCwRZmkMDP0TZG0Q++2EOpsoM7OPA4s/4FbKs1mSXy0aM+3kwJ?=
 =?us-ascii?Q?DyuP9m6sBrCRKtk9GYvSviWcsovlAYCqVmNq/KDQxO6lOlwaSnaSAo83sxvl?=
 =?us-ascii?Q?+Zu3C2fI7rUGroN6GqWlPoTQ8b9Tzvdw6PkEm7r9LK3ZL72RWZeeq0HXjNX9?=
 =?us-ascii?Q?+UtN9Vto/6SMK+V4h9jxaLuAvui5CpOAbjWjZ9CQixEZLVEX+LXiIxcLkL81?=
 =?us-ascii?Q?H/ZZ2zM5pFHhu0voQymMZGPO/pcWVr3X7KZD1cSDcbmLPNtKm3b1H0c8C4zS?=
 =?us-ascii?Q?jHkSPnIzaryRl8mBJkIs6SSNV0ZOIQyfiUnCwWoVaZNVGiCYC2JjhKRl1/K0?=
 =?us-ascii?Q?miHZvtafjqm8dCO1MzBdxrzNEeTPOIbVjBjXRL/NhcNaGu+nrTHH7biudyaT?=
 =?us-ascii?Q?dILDHmZb9rcCa4N5eyM6IKxjdmYbsBYnPLtIrhSO15YeQhxsiC9qhQUtInyz?=
 =?us-ascii?Q?hb15ubk2d/DEeuCLpbIORHtGhW0szHCWcEFKS0pGkh37ITc5Bbn2GvdPGlqu?=
 =?us-ascii?Q?gQLDSKzLGX9zHCGk7xf7cXXNh9/qDPRmm5RI7ty+tHd3HdWzSc2Lx7XrxTcm?=
 =?us-ascii?Q?DVCF9S79VpqwymTa28xzHt0C+T5UaSgXSDrXofZZ/eDw+DGfATNFYCjZGwX9?=
 =?us-ascii?Q?glmMY2apDigT9s8MnZsvxRhAXVk1OMi6XwDCZb+Tli6iUiW1JV5mbH5EGT56?=
 =?us-ascii?Q?Nu1QR7P4xMRbjLXdqJ0n4RI6vv8P63kQ8njubQpd0vG7Otl6fKYOWO010Fmo?=
 =?us-ascii?Q?5+umoAx1/07euHqUlJX2KOzGG54Itc+VYybxomd7yG4P3VVaXGn/3ON51Pis?=
 =?us-ascii?Q?eMaHeaKFmykoqejaRfjpC3gl0MROisWFHWfBGGjpgZhyJKdylgsdlptIfrvO?=
 =?us-ascii?Q?7N+1tQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d021da-9523-4694-7f63-08d99df4f2ed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 11:36:02.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ou214Ti/bLauXp13DkcICn4Jlpn0C29YG6el748dt48eSDMB0nAlRv7JxKcTK7D7fianF8SPUIh/LrZ6uJcwMfnTGpmXuH233N2i3R9dnCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5792
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10155 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020068
X-Proofpoint-GUID: hwANBPAN9Wj2FqA4Z8cslWnha326tFSU
X-Proofpoint-ORIG-GUID: hwANBPAN9Wj2FqA4Z8cslWnha326tFSU
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 01:19:46AM +0900, Tsuchiya Yuto wrote:
>  .../staging/media/atomisp/pci/sh_css_mipi.c   | 32 ++++++++-----------
>  1 file changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index c1f2f6151c5f..de56a1da754d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -434,9 +434,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>  
>  	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
>  	    (IS_ISP2401 && err)) {
> -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -				    "allocate_mipi_frames(%p) exit: error: port is not correct (port=%d).\n",
> -				    pipe, port);
> +		IA_CSS_ERROR("allocate_mipi_frames(%p) exit: port is not correct (port=%d).",
> +			     pipe, port);

Not related to this patch but these printks should be using __func__
instead of hard coding it.

regards,
dan carpenter

