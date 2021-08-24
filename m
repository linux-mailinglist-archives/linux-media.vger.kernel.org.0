Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272463F5F49
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 15:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237500AbhHXNgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 09:36:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61370 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236661AbhHXNf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 09:35:56 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17OAU309025089;
        Tue, 24 Aug 2021 13:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=s76S5KqvicaexCRlLMYPrrkT/x0ZFMCIV7/buuvano0=;
 b=mKgYmjEaIMuWzkwINob8WhWQhPdOiJylHe0XUme09IYHegVTR44+8VLRI+N5/2ih0tuK
 MdI70FtmPYUmzNZARPqQQv77GKOLndvHaLWkXLE4qDeBF4W+RNp6pABZTkZ7Xg2cvJSl
 A1RBdLXkMkBJX/zxnupzg3yjek+Rt2522yLXRL5oQra6dfErQb5y01hToe2G+jakkb6G
 d/J/GcwKs7wq9ihPKcE40jKMVail7pZAQ7R828R+PU1Jx70t5tG05HDkDQ/cq7WrcOIa
 1RkanI3qZ+TPTGLyPqRut9Y/t/DGwltK8lGTOp7WAE7Guo/IpXXaGCQtI0GWoBf1BVOH Lw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=s76S5KqvicaexCRlLMYPrrkT/x0ZFMCIV7/buuvano0=;
 b=LSJKjFVJpTylZAlWNMTDadF4agnf/pRJHJxGHKzGof5LFOcX87ccMZ102BP6DMY4jpyv
 gdyyGTvoup7tT4nu3riLyDr3AR/ut4Dw7kWXZ5syPfGLprEx0byeAshGLRXtiA9hYQeo
 fE9odXOkRTeqr5BY6QQ8dxpA6UMFVTNiniIi+JwDBfznsFD5qtf9W9TK3JD6TuEw/ZoC
 0fRB4+HTUzm2S38bKeWzyopaXnAknqhwqI1949ps2Clc2arOJp7UHdeUm+HFQAYjheFZ
 EaQOqz8du3ZVe3L0XpP2xMTdt9D8Byku0ijnbbCM3x85QTzk8LkaD/oag1RaI/8GqV22 9A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amu7vs2c0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 13:35:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17ODVVlI076702;
        Tue, 24 Aug 2021 13:35:01 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
        by userp3030.oracle.com with ESMTP id 3ajpkxagde-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 13:35:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jb69TWANcbhLciJ6t/5phog0ldImUk/os3kV6oo3RndrKyOlB7XmQZ3Ss3kbvNysroosEGKkSums8h0G9i9P7J/3MfaaLcM0TIRLMIyf2Vv5SBPnPcddUnKu7lEARBa44DOCoqx1EkSFktW1CGUYHe2U9suE9YJkcroRxJ7DB8b3LBUBBBSUzzjLCr7BrOL2mBihbDQeJojGYl8APGLPA0SdQYvEuyR8UNAilOAhpU8ZHF5lVl5mLJgqmsxCWhFx9rTybN+yuUxEdThTK1bQiGZqXVBLBXrM31gMi01DbRs4xhG1T8VEf3WbYFd6m0oaCe7+aeCelsHyLFTFEnsSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s76S5KqvicaexCRlLMYPrrkT/x0ZFMCIV7/buuvano0=;
 b=B5XdZqb8JELqvMSofSEa0mP1o7cyZd35LRsEHWphALBhMdxtv8zF3FotcG4E0ne4bBFJ0sQcr7O6pctuv3NoVRwwzq4T6YtZebMKrJmip1n4iEYv9iFFT1IkcRqV2O68F4Wy5C+1fhHDITTW+lrFRNPT7/F2cg9fbiW9ikwYnAyruPsSM6utzIkqWbs0iYu5tHowVemZ0/PdOiVRHkzFaAQAoKpF0rQpe2bY4h7/VULxqNy8NNaA9dAzmNeR7kSOX4DQvDi79rIvRqLxM4UX26L29ftlL789a1cLDMaZdk2P2MnHb8v8kGu0OBQkk/8tk4JOgAjjaB/io2M8fM/vYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s76S5KqvicaexCRlLMYPrrkT/x0ZFMCIV7/buuvano0=;
 b=qZzSGmOzOEoSa52PQIqotrlsqnOLS20Wtgdyc38/GZCPg616lJO6qqx2DH0CJLGQTopa7jT9EIQTGYayG4J3eg6PYIdlr4XSQaXu8VQqYSljI05vom68pLM7NMVu+hvF9bE4pX4c9yMdZqfiEQLINXQJdUQC3FuxXWa1KEK0DYU=
Authentication-Results: pathpartnertech.com; dkim=none (message not signed)
 header.d=none;pathpartnertech.com; dmarc=none action=none
 header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR10MB1751.namprd10.prod.outlook.com
 (2603:10b6:910:b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 13:34:55 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::784c:a501:738a:143a]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::784c:a501:738a:143a%2]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 13:34:55 +0000
Date:   Tue, 24 Aug 2021 16:34:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sidraya.bj@pathpartnertech.com
Cc:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, prashanth.ka@pathpartnertech.com,
        praneeth@ti.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 03/30] v4l: vxd-dec: Create vxd_dec Mem Manager helper
 library
Message-ID: <20210824133438.GO1931@kadam>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-4-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818141037.19990-4-sidraya.bj@pathpartnertech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0007.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::12)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNAP275CA0007.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 13:34:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1e4146-70a8-483b-e49e-08d96703f54f
X-MS-TrafficTypeDiagnostic: CY4PR10MB1751:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR10MB175155E544878F4330ED6C5E8EC59@CY4PR10MB1751.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dv52RqFDi0aZ/zbKuNehawRj2OBH4P1scT/8gP1tjYrQOBE9NuthoiIBDebKTBNzRTCVuEyRWut/GkFPlH0qR9MhzViPB4nywdPw/IDXrivGmFXh91rqzbWYKq1703Suv5zBmziqjDp3+Ev5UVy0OZUEu2NGLOu0/tOqUteLEhAw+aw0jTVJoqcVz2n01l/LVAWBGJ4zEs8dw768MBCvqQJ/9wsvHQb0MDdJRITxZokw0fhb3fDmseYBtA8YczF7UpIFNxqP0PYB7pa5W4L1hVKIFEKuRhGwWU2Z8ICIhkFbciw47F7Wzu7bXPn3eEgyfL/3oiImO6xieg6W+HGA4jlctZaqSBmvhfUUgw9yAeXZshJIXfXEpYHiUmh5QwQJmGdVwKxklsVcnMAwxz3UdUfi3UMg8rdiah2G+U0YRglGJhLDlrZdk6qqgLs9XoK/0UDy9nySjMZwNqMKblDHotExTXvTZch4Z5gk4ZVlGmCEMwgd94zOJUDxKQfwRmm2WettHyC34WEiruAAzxv7ZrB9Lg8Knbp2iELqOSWFtEz6IJW9kFmvFRT5ZACR7hf/RBNG1pzHQwdFyiMk/9D6BzxMf5SEePr7ecNxruihIP7UEkilsYBDyHwA6VArJcaBWpT4ZGzVWAS/zO8WTPEnX/7lOrIZzLpw/yfFIsdhIx6JBYeoNSDU6r8mmQ8bGVCwsNW3HW4V3uw5B3kVNw401ao5wPkKPqp1aLKwb51BC4q6aMhpiN7WlkwEfL+b3Sg9jI1X6I7bNCJR1nwTT309ltMIVl1nrK91bB1ygpB6emU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(44832011)(316002)(2906002)(33716001)(66476007)(9576002)(66556008)(6666004)(9686003)(55016002)(86362001)(186003)(6496006)(5660300002)(26005)(1076003)(508600001)(52116002)(33656002)(8676002)(4744005)(966005)(6916009)(4326008)(8936002)(38350700002)(66946007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fO3goUoPw3FRa0rXoaLpMBtX7LJP4sn+DrTMM+/NvbRMUaHaxz4zlZRPDj2r?=
 =?us-ascii?Q?SE+xpKcwYCVeIK5mkuNEoKjCX/FgdTfNtEbyMew4mhIug0csHQYtscLhtKmt?=
 =?us-ascii?Q?AaoZmGZOuXuAw1Es2Ih5IoZOZgn+erQ57cvGbeYvOXF+5XoXWW+Pwxxrj8+z?=
 =?us-ascii?Q?FLSu8hj3Y6pk66x+AfAkDMBbDe6eol3+w0YcfLn393zoA/0AZfOxJU+aIHDd?=
 =?us-ascii?Q?dtvMQkWSJERYaNfxgvOg/FZFRZIqkXu4bkoODcbNdTXrBKZjtfPGcGk5C67A?=
 =?us-ascii?Q?pJe9/22zZk0b8YWhJHnaOU1Q/B4vp+9xJyuM7ecwQL3kkjLoKvekW/0ka3le?=
 =?us-ascii?Q?rpyfrYeT46kV1lpf4SkwXUrmSvG4iLJLRIyDKXbRanZ344nbuh7AyV+YG0s8?=
 =?us-ascii?Q?AGeQMtoMgJ3SxF893LqUj4XR+DNS742PGzKWOQVTMgYQLtW/uv036iIbDx3Q?=
 =?us-ascii?Q?eJD6kzEtnx9hD/eVg8auXQJhCay+okIVTNn/YPHqvZIWj7lY/K6HqWD85Ekp?=
 =?us-ascii?Q?0syLmF6cDpX/Hf9qxGM4qUXagXDQBIMhsNIAmveLy0kP5p87z3X6fnyPHEPd?=
 =?us-ascii?Q?egNBcFEEdom7641Hjs6Nh1Dg0/RSY3Wbup/FJooIUXePiZS6zbk5ekrdfxMq?=
 =?us-ascii?Q?8x500eSFtnvzvPqA66X38/p2ZDF/xufRhmLguL08ncmGZUU7dFGOnPmdnNnl?=
 =?us-ascii?Q?k5pOQfz9aP3/TLdad6lhKoHJVNwLn9yO8sJeeuWxxY3MHCD26zle92HZwH4A?=
 =?us-ascii?Q?Tm2MEkC803Z4jgvlqAU+c9bJ0QQaDWruFrjekdORea3OkkUJyELz/1muXa+i?=
 =?us-ascii?Q?j51Hv22dHrWpPdTMvQf9dwVCc26M5X33Tu/6Wed8+EhU0p2lfTEQdE1tuFdg?=
 =?us-ascii?Q?/M+z/V+eQ8QS5jF2Q6Elwbk/NV8K3RPDFUnDoBOF3s2UiTmC/evO1y/CUZGO?=
 =?us-ascii?Q?rNw9tah1EzcMuox6AX0/hO31cKJOXlJonJMriYo0hQfFMGrrZpaXvR1SLmiU?=
 =?us-ascii?Q?gTS0yJnfT5M1Gez6PHLOr/8qG7pu1C2oB7mSmwdbwbJtZOL3npiyct6Tm9Nl?=
 =?us-ascii?Q?JKT5mDF9lEtJ85d78e/RTgD9Nq4TdZbsflVuOV8w/0Tm4SJ4ub77e3GU9dSv?=
 =?us-ascii?Q?GYd6/dwiq6xz81QpbLI5PU9TfoRM12gBAfClmV41a/P0dIDWsYqZUk29Do/A?=
 =?us-ascii?Q?ahIj/jK2L5SlqaPPCihCyzpkhXqYWEJo2i2CdUvDyPyjBn2DhZ97SasR2h+F?=
 =?us-ascii?Q?9UBhVmNJBcfzOGK9WNgiezMmivLMkdPMtmAh27Wr4nTZfXkGRH/uAEl5q2qm?=
 =?us-ascii?Q?+zFPcjbmvw4zX3kzaYioHG6Z?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1e4146-70a8-483b-e49e-08d96703f54f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:34:55.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RW6xNeJxjnmvZfXig51dXfI8BsIZYr/Prt+M9Jp2STR10m5KVLhhpoU4H5+Mazop+uTHpE5QZqGlJ0LQXeqJ83ueXfM6XO3MRwzdC0tu38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1751
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240090
X-Proofpoint-GUID: Ux2SaoG-fnCOitEzybVfvpLJ0khEnV_8
X-Proofpoint-ORIG-GUID: Ux2SaoG-fnCOitEzybVfvpLJ0khEnV_8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 07:40:10PM +0530, sidraya.bj@pathpartnertech.com wrote:
> +int img_mem_create_ctx(struct mem_ctx **new_ctx)
> +{
> +	struct mem_man *mem_man = &mem_man_data;
> +	struct mem_ctx *ctx;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->buffers = kzalloc(sizeof(*ctx->buffers), GFP_KERNEL);
> +	if (!ctx->buffers)
> +		return -ENOMEM;

Smatch would have caught that this needs a kfree(ctx); before returning.

It wouldn't hurt to run Smatch over this code.

git clone https://repo.or.cz/w/smatch.git
cd smatch
yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny
make
cd ~/kernel/
~/smatch/smatch_scripts/kchecker drivers/staging/media/vxd/common/img_mem_man.c

(I am the author of Smatch  #BlowYourOwnTrumpet).

regards,
dan carpenter

