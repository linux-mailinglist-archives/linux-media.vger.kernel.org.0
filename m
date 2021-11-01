Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD32E442015
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 19:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbhKASfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 14:35:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32194 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230317AbhKASfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 14:35:42 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A1HmBNd030782;
        Mon, 1 Nov 2021 18:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=I+HrdZFUxAwvotpjKIOzrmqKjLpebhuHz8PP+G+HZIg=;
 b=HZSFolSNHBjlU6/8hSf78QDHWfCvBKboQiWv/T6uPxElHVidFeQ8QYMI2zO/E6wT+X98
 x0hZPjuVGf3r4ED+eiOJ2mk+58HM+88gaeVCFjbFmXoopEjgWICGFg9ano//lJkBA2dH
 2FuIy3/OrF9ssD2zfq3mxE+HZSj3cmJo6pV3c2yoCNg6nkfwQRWsOsNnbzcmvpjZMCq1
 xa/Wlx/5MdpeOISRTUq4D1lmV95fcCgTxeFL7opPQnHBCQ8FaTXJuHhYaMacIfv1/fBb
 Rw0EL0JlSg4D+Xn/uFrq3yhk7N/eMen6608/C1s+xfF9rvSgSNVhUjI6qZvuND7qBizY Pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c278nbhxp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Nov 2021 18:33:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A1IJbFc040326;
        Mon, 1 Nov 2021 18:33:04 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by aserp3030.oracle.com with ESMTP id 3c0v3ck2w7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Nov 2021 18:33:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGBY0CbIA5cFLWcil2D2GeKWCnJi/CbV93vVgfWgPyA0jdL84VCJYKqRzkMXWiPwOmg/qV3Uy3aTp2wbJkSQkxL1CZEtI3tMcw29Hti8Fv0aUdF3R4EciP0YFsNljcKVDPh2DUMHmJPd/ZAxnx+q3IXF5cJHROGeronqX/lKMKvBBySXAIUYU4uxtdgerEiYxuKN/Qr4+CCJvFh2QZYpUfMiNnMabvkug+H++Ox9WLfpKf8a/P+E0CjUvEh/333Ej/dAipwO6BOkK31eN6F8b9bXb0a05NTRfM/xr1f1+HkCFQp28b3QJ3euHTno1+7GDG3Y/ctIKBH09juCQS8XxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+HrdZFUxAwvotpjKIOzrmqKjLpebhuHz8PP+G+HZIg=;
 b=KsGU97XtFRNamB4MZ0jFoVRh1xWJ2jnA2FSkm6pjTqvv/fz2AZ+wFH+czYsjTXJWbWiO+17tON5xiY+ct4CFH3I4jyRLUGmCsnNHoGzdjNcbwlpKirzxNRfG1CKg2T0pi1N1sOOdisBB/oqKU1I+HoD9szWgXoc1YJAWFIXIy0ifUgQJ2jI/sqMT57LVh6FW7i5kZ+iDGRowdeCCn4l4xXedvD6ljXK5Zol3hYUpAThE/jLvXoL2wZeUaKynLvcpzLyawq/xiOBJ/3U0zytfo/DYr2ghQNofV6tXoIR+3sTKQW4fZ7New3yoatH9BDlv3QUWYjjjUD5uyWX9RA3NKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+HrdZFUxAwvotpjKIOzrmqKjLpebhuHz8PP+G+HZIg=;
 b=RPnxw+oGcPk5GbJAbXupa1dW0QyKdo+cfw874JbW/zRtXyuxt09I3EAErrv5f2MIi2TZRymTOnGsHZpTnV2Tcaue7aHSzjbbz+gBqa4neLpnlsUIS5gjhWJnbgBVRQRcKpBDJLMaG0wTcURYvX/E9iidDQaJsDaRK9pDSRhoRE4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4513.namprd10.prod.outlook.com
 (2603:10b6:303:93::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 18:33:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 18:33:01 +0000
Date:   Mon, 1 Nov 2021 21:32:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot <syzkaller@googlegroups.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: em28xx: fix memory leak in em28xx_init_dev
Message-ID: <20211101183249.GA28019@kili>
References: <20211101095539.423246-1-mudongliangabcd@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101095539.423246-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0153.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.22) by ZR0P278CA0153.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend Transport; Mon, 1 Nov 2021 18:32:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9547dfa-478d-4575-4de9-08d99d6608ec
X-MS-TrafficTypeDiagnostic: CO1PR10MB4513:
X-Microsoft-Antispam-PRVS: <CO1PR10MB451328DFC17CB67AD531B5DC8E8A9@CO1PR10MB4513.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: esUkI20H95GfXXtlmTL4xFHC3940L5GTbfCyPXn4PzINMEdfRiqos4Ff4sYoHbT6OxC0PmIi7ME7IF9HSmgFofpG5KptARD5E3pD82JxbXSmx87fYR9STpP9ywbUo8A356fZNOURAAmJeMLPAzGxRvfQoG4NEXhu2TwRTs9QqJk21oaTXSAc0q0f6QckExBY8TLG50adr/dpaTYYM44lBCPVzHlqDbi0t5+gFRaUerWEnNn2Zr3BlH2yx0cbXKwGC1iwoLWAJf0/aMmvy6Pap2KSfx/vpWwyVr7XXj4WzxEYQkfVJPdLBnYHdYV4li9Ssg2FwGivi6+9Q8REcHsy3r+k5s/v8thdUmEmbdus5FjZ6GBbqxoHotAwUigyu48FvfT0T8rVacTlAsGJhedbS6ky1GzeGdccVV2PBOiqqSA08gwpraWXfO3SwZsp+tNHsnsXGIctqwujLeb9+1drhjHKw0pe8+7UgsmFEvXMpV0ZbA3Mvos81g2yC1RfASq/e8kXUx7Jggumyuth/dlmz9BvpWecB1dcLsiHMDQ6rSUAbFNMOT3tvDIIn0BGP5w3huaUELJxjtbn8lEjSFChA3QqJv54k5nT437FJzPx6158bgz0Dkuy7EU/ENhNq0+IS3ipqAp9rYQ5J3vmFCQWd47OOrlSIqfgy9lWAhuF1UQ3D++JMmRc4YIurjzxEhWfop0zLBJTJoTGZ8pTF+Jn1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8676002)(6916009)(26005)(8936002)(1076003)(52116002)(4326008)(316002)(9576002)(5660300002)(33716001)(6496006)(9686003)(83380400001)(55016002)(508600001)(6666004)(2906002)(38100700002)(38350700002)(66556008)(54906003)(956004)(66476007)(86362001)(44832011)(66946007)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B+rPUY9vBUyQSPoG4TesjuqyfMTdc/hzVRew6MjYzw2cgoaxyxcNngL/To2T?=
 =?us-ascii?Q?g7RZqeztXcGImDgBkpbWz4EX0jh8PdEGfl7G1s8i53hNVwatB93Wl56/p7hW?=
 =?us-ascii?Q?UxfEmfKbRWr7CT8v67OQdDHMEDF99Bk8LOhjjOWROPeD/5d9mkkhK+pW/6A4?=
 =?us-ascii?Q?oVXuQ12ki7sFhs4a8lQbG0DG1V6rIYE9prhpGeINb2SrMUKOo3Cp5/aNUoRC?=
 =?us-ascii?Q?i7SrE/YAh2jxIC2K7SfUOCHSHOT8CGDp9fKeS+fyRcGFb0NbpDo6BH4rF3+b?=
 =?us-ascii?Q?TqudPuD+DkFQ5tH3IjIpssZ1Y4xCOp78bZ63jXFxcZq95FvPCoMiUNUn+17G?=
 =?us-ascii?Q?5hBW7eLXMvDZ5G2y2LpMRadAkJMxjwhJvSu+G6TEXtpZ5YqWKswnuJvVvmiU?=
 =?us-ascii?Q?vjJ2aNK6MsExAF6J6NrcPdlbxYsVmOglO6Bu4nvdjT1DfNzwRfpdixol03Jr?=
 =?us-ascii?Q?9ipzGDApA/awk9gC7UcNFyqrhzVxPSjj66FRhqlkwmMshiWZ64YTnqBObo2A?=
 =?us-ascii?Q?nRcfRV+vELx7QpqC7t9KP74Lwhk4JT6j6wr3oLvvPMCox7QUl8fAr+Ch6AHp?=
 =?us-ascii?Q?QAvhSwkE5ZoKWXCJPVKiSKf/W0sy8ELID0NkwqWOjGWL14M6GYYF1+AASuuY?=
 =?us-ascii?Q?i88OrgopFBMXK2/4o26Oe17NkdjMLFRReq1paWgVVAA4MXsodkBVLZQ8j1fJ?=
 =?us-ascii?Q?+HvUtNsPiixPSahwlqY0fhv+D/o8E5pSZM29vnOJ8b3N0EUlWE8632Y1ag7W?=
 =?us-ascii?Q?nj935VNYjVu+Z08QSxg4leHfS55McdLmADJOo4u55LTA8w+V3xHiLZGxvh/k?=
 =?us-ascii?Q?YgJor7MqdYxDY6txBarleQARY8DO1ZZnA0ma9xFf1zpK6ZoKxN7UWeagfacQ?=
 =?us-ascii?Q?/UGsDYt96+qY5o/53LDVA6yWb7TtvpOZ5kxaYty8AI0YZJLPaXLgA2iypRs1?=
 =?us-ascii?Q?bZiq9MrZSLut9QYZ8OjUbEJnDXM9DfHvJE35ANRWPX4NC+wEUm9xr6yJhrxy?=
 =?us-ascii?Q?IRK+mGRmuhqYyCZG7uqNOt5yNYya90hr4PKRKLfZGB0T7b4bWIGLSug4YgdS?=
 =?us-ascii?Q?ZKJNTN9WeQc7i/5IvxxoFXLUhMhdLOoMSbIkVJ1VSRK7oj4GvOxRVEfCHIx4?=
 =?us-ascii?Q?LKXhgRBWt2J+rpv2jpLNHk919rLGvPa6OMNUO3QrZwU+ciuxBDImCv2OuPaA?=
 =?us-ascii?Q?SO0M3D5gG9DmDga0TplK0uZ1kHnyxft7p/9dQULvitmms0NAoZLzyxDbVWqK?=
 =?us-ascii?Q?rlUfrsofx10RNfWh9vpXK42tXBzxS79rbuYuesUTRnecB5Ru5THclNOTZTlO?=
 =?us-ascii?Q?18amuEhySnWsXrP+Uv7ss06srBAWcUHfB8lLeycfRivJMCVICBW1B4Mpjbdr?=
 =?us-ascii?Q?g65XesHwScjerkp2NnElmeCD0yBvjqGZnND4tA5K2YjZrsJn3+yZYM51hbOx?=
 =?us-ascii?Q?24F2NwzVXdEciIfaH6UilSqIlu6ZRothubbLhDHHxSlaNLSJcz8hdz0c61oY?=
 =?us-ascii?Q?jFz0pWdWvJqqiGOLLjhLzJbtC3hSlelXsNa/16pmsj9ID6R0AiV6qCmVNEXk?=
 =?us-ascii?Q?D80SD+DDkgLlqkWAwQ62YKJALkBY7OuTQRfP8i3JGnzRoaLGHYl8azFQZwlb?=
 =?us-ascii?Q?Ql4P+jLEoowtRG5Z20dhPVKwy5P1Vmd3z/qgjiLRYvcKdjgYU865lF3LOzCD?=
 =?us-ascii?Q?1WDhbg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9547dfa-478d-4575-4de9-08d99d6608ec
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 18:33:01.4023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JBjeLhl1Nh/E0stLgtdlNMXW+6bsz+b6OVT63N3LgtPODVM1j5zIEH/sdQpMTSjJ9Xdme9axAWmaJdON/qv0UL3+MHbWjn5iROMCEtl0uQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4513
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10155 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010099
X-Proofpoint-GUID: -6yvdZBv7j6hlC1V3Dxkc7DjFfBTb6hf
X-Proofpoint-ORIG-GUID: -6yvdZBv7j6hlC1V3Dxkc7DjFfBTb6hf
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 01, 2021 at 05:55:39PM +0800, Dongliang Mu wrote:
> In the em28xx_init_rev, if em28xx_audio_setup fails, this function fails
> to deallocate the media_dev allocated in the em28xx_media_device_init.
> 
> Fix this by adding em28xx_unregister_media_device to free media_dev.
> 
> BTW, this patch is tested in my local syzkaller instance, and it can
> prevent the memory leak from occurring again.
> 
> CC: Pavel Skripkin <paskripkin@gmail.com>
> Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> Reported-by: syzbot <syzkaller@googlegroups.com>

Is this really a syzbot warning?  If so it should be in the format:

Reported-by: syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com

Syzbot is different from syzkaller.  Syzkaller is the fuzzer and syzbot
is the program which reports syzkaller bugs.

> ---
>  drivers/media/usb/em28xx/em28xx-cards.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index c1e0dccb7408..fca68939ca50 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -3625,8 +3625,10 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
>  

There is no check to see if the em28xx_media_device_init() fails.  I
don't love that we call unregister() to undo the init() but it seems
like it should work...

>  	if (dev->is_audio_only) {
>  		retval = em28xx_audio_setup(dev);
> -		if (retval)
> -			return -ENODEV;
> +		if (retval) {
> +			retval = -ENODEV;

This was in the original code, but probably we should preserve the
error code.

> +			goto err_deinit_media;
> +		}

regards,
dan carpenter

