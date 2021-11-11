Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537E244D50D
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 11:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhKKKg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 05:36:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59276 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232318AbhKKKg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 05:36:26 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9MSHI025598;
        Thu, 11 Nov 2021 10:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ToBU0lNtJG4IA6hlqOQlR2rjK6h44JDZJHOd8XvXKgY=;
 b=BLyqHn6MgYBhWozXQhfEcsqmqDlA3yAuUlO2lgV9DPSoFjSAzbawMPdI0kbgpVqdR++v
 EN3n0gDLlBw4YCd9Jn8BLlMT1VK2uGkE8UXquRodzlcRzp/Iv2gYbX4e8pEp+ElCcxso
 wiojEKWoFsHtRU+vwfmTZ98KsHD+MgOR9G+Mn8jqF+d3PHD+bDjpTEkWppm629pVWCPK
 n+SJ8SIVNltxMRe7Rk55Lf8a/p3vLPPA4yZK8WruVL+gYYv6oFVsxUT2O17SmeJJ2zyI
 TNukwZQxAnglLABId9aPuixM4YPUt5CNvSARiIQwCJCka10iVf84shUqAiYI1vRaMObR xQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c82vghsby-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Nov 2021 10:33:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ABAW9Mx022760;
        Thu, 11 Nov 2021 10:33:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
        by aserp3030.oracle.com with ESMTP id 3c5frh022x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Nov 2021 10:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuEv5c9WZgKe3+5GfKXkSXlf2VcLuG254jD+XasnpqCrIgCDA1G3bUagQEELgfAGk9CkjMdp0Djitve8Z2cQ1TqXUevWW/NARRMTlQkJiHwsAgxeGkU0hxHAxwBg5eWsfQ2k+rlspFlrbZjo49QpYtlzNfGZ44Vgk5R87mF9dHoweQovcu318eGi3+f5DX6DFCo/qByT+wy5YB/cteHo2q7lUnyGrbWpmzKs60eFagrenXlsQ2/mYj7rnXj6qmG7rXQDjv3AM+nyhJkJXbZvYyuOl/B5rbd903pR8W9rPNLragqYnI1sJmie4wv8FZJcY5J6EJ5tXBw9E2BO2Tk3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToBU0lNtJG4IA6hlqOQlR2rjK6h44JDZJHOd8XvXKgY=;
 b=jPVuNNgzXFHcccG3/HWTkt56RWMYod3Ux+ris9Dli/d8eB5d2c12BJ3yR9752wFyoi83gRR4/lEj7QyuWZ4SvCGRj67m4+uxiJY/2T+rfWlmstm8ZERL36frb0sBtKYn50ZqccVBhIGGCksMM1cjEVrz4/kwbHwxmm/pUcPecQ9yV+j3Q/eh+dl5R+GQmUzU02GnFyrRnkT+WAmkTWx8MAuuGpNT/ldUhtT07GSladGKtWtcK476RXm46AsnGBJd8f1F1i+c5cspl8Qt+DND04SqbatuvpFyd8o1Lf68qlCRaAhORydS0aivyJ5HGRPegWJ1cKUqE7o9VDFzoPvm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToBU0lNtJG4IA6hlqOQlR2rjK6h44JDZJHOd8XvXKgY=;
 b=diuAMnLxRAMO0HOqSKcHPB0mDhyslkuOazbzKX3IogHoWAU4hl3fBmXgqwtlyrSE6D8QdGxDVbFEHMNLQ9dFkDLDDwksgRRzYERvn+DpePjn8Eq3iiDz6jw+Lo8OCZmf4Njl9XCPZWlr/D/Io3UQ0Jv8EsxYw4ft4/7FNVjAudw=
Authentication-Results: wanadoo.fr; dkim=none (message not signed)
 header.d=none;wanadoo.fr; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5861.namprd10.prod.outlook.com
 (2603:10b6:303:18e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 11 Nov
 2021 10:33:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 11 Nov 2021
 10:33:30 +0000
Date:   Thu, 11 Nov 2021 13:33:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix a memory leak in an error handling
 path of 'uvc_ioctl_ctrl_map()'
Message-ID: <20211111103303.GQ2001@kadam>
References: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JN2P275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16 via Frontend Transport; Thu, 11 Nov 2021 10:33:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd02e22-7f2c-4300-057d-08d9a4feb430
X-MS-TrafficTypeDiagnostic: MW4PR10MB5861:
X-Microsoft-Antispam-PRVS: <MW4PR10MB5861F3179B9485C2763528478E949@MW4PR10MB5861.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S45RVnfhgl8I3fJAqYALLGwDJ04PqwWhCPHVZrp6gxbB9aTXpvyqdnHYSVGdQCtjmngts53UIbLheXYWWJ9t79297g11iS1hWLXrxHAXANQvLrjLgJHU9GRzsxk7TgmH59JhI4Y6rP6uOfSBecHFCq0XNrcyd2DmGSX5HkJvvo2f4HrkOjFwvT1oKYo0QSWYA5vR+0BRVAaqhqfuYoP5VsP1qxzBTbCLk5/eF8deYILOGulu4hd2Jvsq3km/Xo869r/WFds3vjKXu8Laxy/pTGIS9rnSCB0ukvXlDvSk/nnJcD8pcJGXm+iXAHRUfscDKSEQ3wxpsRJ4iNyhXr/gXK31LX92+sjl3NZhjOTCQusvoVQArYDXOhp768oV9fe/J5Kr8JuWIvrzw+yKNGP+62XdmJ/v8VpfEkUEluWVsWqtRnEPNwBxolZIkPlQ2fdVn5I8g+nsDkEI8xut8U/9s1Fr7zxHBYDVCFFsscDMqnyLPxr4I101relGy9FmlFduvTTyE1lGYkalGLM5bP6J0aO8dZkwoiYdt7LTm+zpXQjiUHKd8ZS3nqi/93IRadbHWfpxia4rOfL3dl06Pl3RM0dQsMuYKEXojl58YXZVuOWhDx3P9I+1HPyJAx/D84WZAHtnPQVEXYp1S+kRaeR98rgD43OqWAwPbMjF+pODzeBJaLqJkN+02rfYpIgITqzCxGf0/EiYF6Vu4X2V2R7nCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(44832011)(5660300002)(4326008)(55016002)(33656002)(956004)(1076003)(6496006)(316002)(38100700002)(38350700002)(83380400001)(186003)(9576002)(33716001)(6666004)(9686003)(66946007)(66556008)(66476007)(8936002)(508600001)(8676002)(26005)(52116002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zY2SPsY5kXblZ4HBpRwmQn9lRhZlEXGZUIFOcpWakyVz8K0csJxa+yClPEz1?=
 =?us-ascii?Q?zivs1kQn+UTudwO5FzwEwmQOHujLx6sjoxb5v3xV68jWpG6wTYouVmrKsNWV?=
 =?us-ascii?Q?57dFexahlKJ9pJEuarSdbwKsdoTgf7x86B9GH9VLQk5XAg5gMGkcOjvZKHJO?=
 =?us-ascii?Q?RJnzbwf3LDbEZhoaRQwmluixUKTIzvzPZ6LkkR0Cj1Cw+ThcJilsd3zGhNrv?=
 =?us-ascii?Q?Ia/PrCJMk/2TvuPQEe1hYuM7ac02RXKwff0Yuve0UlJjKtVa+nb0akWti3lC?=
 =?us-ascii?Q?tgOjOPkyGFVpZqkgpqOz6KcHOt00mh1lpXvfXNI3+uMTJCvKPAc0tE6bLo9v?=
 =?us-ascii?Q?7o43djIxOf0IP/VMWiZXYCqb8ouDYJZ+WQM5Uvc/9KJrnpfsMNPg65Bb6idH?=
 =?us-ascii?Q?HHB8cdSyslHGnzMxvAi0tEkj44weGItbmGsR0FcZpWWS3/1lx5zzEzBawJM1?=
 =?us-ascii?Q?6N+H4n7+0mmPaUjkxeT6y435YmXBW7shDKPMqTsrNnZpfv6tgfDfDIDW6ZmQ?=
 =?us-ascii?Q?bNwj6X0bfQ2lzsmd6ez7ptLdPdnE5wKAkv+lCTvSm4Bs70R15Ff8Ybda1JqB?=
 =?us-ascii?Q?6ZFvIp7a2wBzX4P/uHIL7+zbYrdRdNiDc0nq1LbaWadStWUAp3NbK0nc31N6?=
 =?us-ascii?Q?aJXW6l4pulC0Q+plzbcKvaShWiePM0NA8HdydpopACbGDZyt6VofetSRHDXA?=
 =?us-ascii?Q?gve6YoBLIqmcnTUzW1iCEd62KjjW+iROoq4IyIlRmGwQvxaB7OTOvYp0oil4?=
 =?us-ascii?Q?JF67A3J5kmnAFlZLqteFemm55YBnvaanzURNOxYZtKiKj84Et1GXnwKVQP3B?=
 =?us-ascii?Q?JVLrHHJk9rcTeZpNTfCZPlHmR3D65UItv1QIiR5IeKAGBaFL9dtJkC4eFIKa?=
 =?us-ascii?Q?HhrFSWdzoY1db0DqcsqJ02p0zQYSu/1FZS7PrrsYEsdMdzBFpWgqsIeXlLAJ?=
 =?us-ascii?Q?SC89TLdfIzwt2UYs8zgJFbX7BD9/8/mhGv6ENKnO2n3Ql7NBxFkWTWTxebgF?=
 =?us-ascii?Q?RbhpoNcjNO0vl9RVWUiITX0oQpNU0g9DOHLHEBpZtIpC1YmdNK+P7a4kkSa8?=
 =?us-ascii?Q?HoVy+2c+k9MZzSsG/bErSQprzHVL4F/x6UoQq4mHelZIV+hpsBOTInBrUiVs?=
 =?us-ascii?Q?fMi/6DJD2MEGMHfsP9nGtVCLHZAr/njmRz+J5Mk6fHHl9podsBR6fRnR8Ia5?=
 =?us-ascii?Q?s/B8B93w9+GJDaNjlylqbslnvbsb7a9mGp2T63hW3f4D4aIQ2+B6Z83QmNIa?=
 =?us-ascii?Q?JL8PDbsTokYKnFe9HXPwcgT1Pmt/RB3q16YRJOclEuGp85dosr8GLfvly8sq?=
 =?us-ascii?Q?1zRXMdd+5ov5bUdWK+VMpv8/KF3GSfDL3K6SxIfbV/e3Xtha+UBZPOjThcLD?=
 =?us-ascii?Q?34lqmM5Z+hONQHDjYstMmYOfDdjAELMCQxHwO0uSpDWLIWSCtnx/dJzPWfqn?=
 =?us-ascii?Q?3dWPyOSsBacWBVWFFGQWLyQIiFrrBB4x/RQzwF7aakkvIclutSsdAkEeI4Ez?=
 =?us-ascii?Q?ZRswh9q/nOPm1U/QVTqa7TQc5sFYMt0Sryt/vHw1YGJDNMbOw4Gk7xp4RNTm?=
 =?us-ascii?Q?JVnet7Bo3TS/tv51GdmiBdpmZFGvlOrZCORL7BeuCdxJLh9MTNlAa9wuLRBV?=
 =?us-ascii?Q?zp2cLPRD/H84FB0U2Qz630WYOAVhjFiKmFG+5U5Ti5IpVpeKrtNUWbvq1O3x?=
 =?us-ascii?Q?0FUBdyIZ4mnCVbqTTTtl/lessYY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd02e22-7f2c-4300-057d-08d9a4feb430
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 10:33:30.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N78KbV6KytQAkltVsq8Byozk8LjcxPzPz+fwAum2htUt8KFw7EdJxvFrgL68FUsl2tIT+O35qFQb5QxB9OGkqKzlIyLTVTwHd4fV9t0BjKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5861
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=930 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110064
X-Proofpoint-ORIG-GUID: dMwQwZqfCDv7S4M90p9PQ-qdLIZBN2DI
X-Proofpoint-GUID: dMwQwZqfCDv7S4M90p9PQ-qdLIZBN2DI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 09:06:11AM +0100, Christophe JAILLET wrote:
> If 'map->name' can't be allocated, 'map' must be released before returning.
> 
> Fixes: 70fa906d6fce ("media: uvcvideo: Use control names from framework")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4e4aff8ddf7..5aa76a9a6080 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  	if (v4l2_ctrl_get_name(map->id) == NULL) {
>  		map->name = kmemdup(xmap->name, sizeof(xmap->name),
>  				    GFP_KERNEL);
> -		if (!map->name)
> +		if (!map->name) {
> +			kfree(map);
>  			return -ENOMEM;
> +		}

Your patch is fine but there is a second issue.  The error handling
should free "map->name" as well.  The problem is that this function
frees everything on the success path at all, but freeing map->name on
the success path will lead to a crash so you have to do something
weird like:

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4e4aff8ddf7..953a5cbf7945 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -90,6 +90,9 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 	ret = uvc_ctrl_add_mapping(chain, map);
 
 	kfree(map->menu_info);
+free_name:
+	if (ret)
+		kfree(map->name);
 free_map:
 	kfree(map);
 

