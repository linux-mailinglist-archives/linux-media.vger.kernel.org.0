Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC94444313B
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 16:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhKBPJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 11:09:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60292 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232959AbhKBPJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 11:09:22 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2Ewx7f001786;
        Tue, 2 Nov 2021 15:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=emtqqpYQLTO4M7Mr2El5NUyJ+4LrsclK0AfcZwbSvtc=;
 b=xPLAMjISWBC/F87jAwWWURiolUgKDh5eRIMTbWRWkZoiS1WMThVJEQSuYC9QF8p1N9hL
 GQIY7OHdJ6ofa5xQ+fGC/770a6JNfE29y5j/vDTxRSNOig+vlPhNPXR+X9ccCNHTIH+1
 YsYqhkVRvZ0W3YS5F3WeAzur1osiAezd8VulZyYp1dw34ZLqx2JaRoNqI4GW17eDr7px
 XS3ajmyiT+shx/4hpFG/X0Ttfc86IQf9Jt2TWQpmTFK0VuRRy9t1WScbsl61lWD/eE5z
 J7VTxyzGh4Y50HnH8j++pl1tQBqex2pOvHnn0GkHeJckSJAweHAOUth2UIsNIZ80WmEK eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c27r5fh8m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 15:05:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A2F0IEb145796;
        Tue, 2 Nov 2021 15:05:50 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        by userp3020.oracle.com with ESMTP id 3c1khtmw8w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 15:05:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbdh2nV9wjMIXzMZUF24+w+7/oKduH2fHIp2Ag8d8uPzo8Gr6wqnLZQcT9rQQl4oajLCd45o4/UmpB9thaBbCJ+2Ul8bf8PKmoU4M0cGZY3Rpx8Yshg7UzB7oBBtze7/B3vERds0PbfgTwyLZvA9fjgNUFRaxOWsAFZGG+seJgaVvTiJZE7rFyygCvXpksV+aToM4aV7A+gG2FSudHt9AqCZVAeJ4nrSSr0HkOe6+ZoUiEoULlZZdiUeth2z7wtLdSU1fgU1OqBpBC+S1ioeaUUEL1xrM7eG0wRh0nut56APXVqU+RMSBJA30p+pfv4dUD0lqQWXGsXwtlpcQpHrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emtqqpYQLTO4M7Mr2El5NUyJ+4LrsclK0AfcZwbSvtc=;
 b=Zep6Ft9DlSkZNl6+KRNGDxWv0R8iZ3MZjFgjHIcgAcnnunqD+o8oaR8tDBcrmOXfvJdBI/YC65xvlTddkSABVKKEsbLv65OWRmojJ5c3V4kn4UFqRt4cfWqIyx1u/THiMvFA6tOXAbwU9L6UB8/A4Df61or1jhfsxn9lU6pywjfCcBrll/oCddOTYqf+koBu6XVFcvPA/17NPdwtfCBCI48klw5aimShQa5DrMvDqALIm8XBxtzktasgcW69ka61zinfxnTBNuBXxRTxQYQOo2PIIV/PJzjCLPjvPC7Hv+zBiiOPIQ8CqKIyTNHP8JJNhUpta2niyGrQ+GX9ycPb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emtqqpYQLTO4M7Mr2El5NUyJ+4LrsclK0AfcZwbSvtc=;
 b=sN8knDCuaJPuzZWZcb26pOZwVOsfsP0usjNwjZj7axyDGIDoXjh5+eUMGrfWF5sbuGcxPK1kWJCP+AIajjjdP3xi11utqpD0ZIZKMv/Kb4cDYEbUaTmRmuXPmUFRE+ig7HC+OxlgkXMBjr6LPDuJ2McoWPAB9dgIit+K+Qj742E=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1615.namprd10.prod.outlook.com
 (2603:10b6:301:7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Tue, 2 Nov
 2021 15:05:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 15:05:46 +0000
Date:   Tue, 2 Nov 2021 18:05:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL
 check for asd obtained from atomisp_video_pipe
Message-ID: <20211102150523.GJ2794@kadam>
References: <20211017162337.44860-1-kitakar@gmail.com>
 <20211017162337.44860-4-kitakar@gmail.com>
 <20211102130245.GE2794@kadam>
 <CAHp75VeThcCywYZsrUNYSA3Yc3MjJwfiCBCGep1DpWFFUg71cw@mail.gmail.com>
 <CAHp75VdnvxCWYrdrBqtSDP0A2PCT6dYvHAhszY9iH9ooWKT49g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdnvxCWYrdrBqtSDP0A2PCT6dYvHAhszY9iH9ooWKT49g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0044.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0044.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Tue, 2 Nov 2021 15:05:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f7fcbfe-dc47-4d83-7e37-08d99e123f39
X-MS-TrafficTypeDiagnostic: MWHPR10MB1615:
X-Microsoft-Antispam-PRVS: <MWHPR10MB16159A49C96E6DDD05124E568E8B9@MWHPR10MB1615.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BPY9RDE0B1wzMVEKILEDI0px+0VxEB0DwHW84eQG62H0tjf+gEjqkPmNDd1aQJv9JMZIQDOyYDHD6fczH5843eT3ZO+AciNmL1AEsOA25ceSuq37u2TxQKfwrXOiSXXz4IxsOIWGaa2kgpeym1oQpZLGvVeYN/VezIO1BO57HQzJXrROaKd/3vYJoi4kBKCATNBjd1k+7Euf54JDwri7JIwDfeF5wbd/KHhS79nCNr1Usikz2MMNOjkLF+B75eZmQRWm9nnWIC+iAKYF32oGLFhOxns4HfAhfrKab/hmSSMNY2phFfwc2bIJnsIQjvHtQdV92XpkZPhZsfXvV/Q3jaa7V+t5JaPI0noYYb5hQiscWfDfmswwFOw/jefQRo2D27d2l9ra31JE4gh5cLHZQ294eMHU+IvqFDH5R7OAIKPEQcqAryFW/x5UmyNa0ajALal5V3JlhKN1UZ8Vv7zV9QmtrQEBe/XAMJsDuQnbD3ZyVOSVkwK9z9OOodArdThdfbjNn1JZMthJVK8ybz6h2Vy47fsQThzNHWGu9sPualDuFQpLmF5Mu6C85iMbW8+Ot1Ya7tgLor3XjLRKd1eqF/dtWgvN7dWWP8Ko31kOLBRqW91AjIwTaLkeXGPdgvY8cgxm5IMpSJssvQl72TL4g8c7zGUb7OjJZ1b8AwgpJQ16Q5zjB1WkiLq2g2qgnT6qu+67QaWikXxsTzsT/rPaIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(86362001)(6666004)(38100700002)(38350700002)(8936002)(8676002)(4326008)(2906002)(53546011)(54906003)(508600001)(7416002)(9576002)(52116002)(5660300002)(33656002)(6496006)(316002)(4744005)(6916009)(66556008)(66946007)(26005)(66476007)(44832011)(956004)(55016002)(9686003)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0eeAnHGs6FSY/X2fKNrcTGRIiV7sd2iNJxC3Kpxwvx2A4IoUQtOgvP2BM3ti?=
 =?us-ascii?Q?KdHXmcXLCStS2wQf+Mq04mAVjjKYh6W3ii4KWKTkbHstxG4f3+UI/fykFoKx?=
 =?us-ascii?Q?KWASjhT1vgaw1dbnHb8lsEsYiZ5dpj/3vpzZqGW34/kAd13ET22mqFYsPab9?=
 =?us-ascii?Q?MlhrBiE3CW51IzYpGNfkgC/YNFrdjwZjNMAHRs/tfADin/EYi3fIhfWeXKOw?=
 =?us-ascii?Q?AF6zNdfPskj/6EocNxhg0J4U8VFoCL0WlbY4Pg6qwFJwCjAMrg6Bf6+egvUW?=
 =?us-ascii?Q?rWq3EoEVqSb3h45n8XTX8cISiAgLdCm9rImGFFSm7o4S8J62vpeWHQp4YswB?=
 =?us-ascii?Q?yxB41a7Rfy23E8tr59HE0BuITJzYQc7axIot5TaLGTUhEP2GM+Nk3hamknet?=
 =?us-ascii?Q?2PMXyPWxv1FKTQpUd4l5liOTgYRorwuFox/Deusa8RKZZvtiJ1TKYyJ3Hmyr?=
 =?us-ascii?Q?4XQOHcns2xMxr9upzGk3jXdQ/PXStC8cEgD7cgIrRMK4bMcAXCbT2ehm8Bzg?=
 =?us-ascii?Q?KxQHO2evnFYXgHUMr61GvGMpeMwVQeyOUgfWy7Wuw4geXB4z+/fbgxqd3YGx?=
 =?us-ascii?Q?On9+Q1nqeQLCGJ3YG5I30EayfO81e2D8kaN7LNr2YH34NDMcmC+OCdg9WvSZ?=
 =?us-ascii?Q?l6Y3BfDfyow/RjQK0fOiub4skemKFCyZRU8Wou60yXL5kVYrVXmXMtgeSb+6?=
 =?us-ascii?Q?IkWp+iaPoIRXV5MD7fI249k7N75rEWbwtujlY7UMwFBboh2TotdnbUI9uh0R?=
 =?us-ascii?Q?eiPh+zPgMcLO6nvu2duFZFDRXTeqf0B0jT3jUg4/d97k5uAXejulJgaBlzXX?=
 =?us-ascii?Q?EFU2tYnxbWjfglrqJYjXeUn/BilDLQW1Ou0ZgqXH/4KoiEexyCjKd5M8qeub?=
 =?us-ascii?Q?PvqoLreMHoZ45Y358zLjvemr3kyqvNK3LiD4WdQK5ZHPDN48UqbchL4edTVt?=
 =?us-ascii?Q?csGn0TyL1sqK7KOyZvxcu1fvEjhA+nPyBaHK4DEhOj+0zfCoANfeSJudRXZg?=
 =?us-ascii?Q?Bne1Jmv7O4qM/Dva2Mv+kg4PdO7KA4DUFcChkJtOefLHp+qdd1gSspvCr5D3?=
 =?us-ascii?Q?3zNPt4akM0w1Jp26UTql3dPzRv2IBL7Mq/13ywxKBS6dEUOOfthG0WjTUf6g?=
 =?us-ascii?Q?ErPAeBCw2slvbXwcwFBUSJbR61l1In5Sdu/75hfArCze/PdFf10CfCkSpr5D?=
 =?us-ascii?Q?dvvaaCwykiL+XbvclDTGtIJSpxwVOBrhEjFxPCNG0Q7REF08e6phj9mNh6xf?=
 =?us-ascii?Q?LHZxrdxG5Bnbq6Dwnd5JSIwUWQVMI0UCbcZ0pEXuzMOTfjDiL8saJzezocWv?=
 =?us-ascii?Q?/Qn+VmvjaS4k9Di7x1Os5RRd0oXQZ5TJ5ZHesBW2LmkSIV9dBnWUpgFWL01C?=
 =?us-ascii?Q?27lZB9amTGWmCoH8lreFc8qwMDxu9373/fzoguXwg0ifnm2afr8H05uLSVjU?=
 =?us-ascii?Q?4M00k6hh21Zd5AGVGo9piPbOkqotC7U4gwF7eaZDYIhhtNcbjP/0+0qfeQ6/?=
 =?us-ascii?Q?PYMkwoO6qjELBx1Mjsl4DfDTHyvrVTR7IPSbHPyqmWfeH5zsivJMznkoURrl?=
 =?us-ascii?Q?X+glx8XFxfh8A/yEeJqU5RIxZarNrEjCHuyAV/Uc+Qy0OliPHkpHFE/vVYKk?=
 =?us-ascii?Q?Qc+yTEMzFpaHWKsaX0Bu6mr7ARlZO0MTO0poTWBZ1I5zdEVnm82DcIMGrc2I?=
 =?us-ascii?Q?odzJ9Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7fcbfe-dc47-4d83-7e37-08d99e123f39
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:05:45.9516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mYeAQIDJjacZbWphooZ659fMm/u+K+FlZodNbJowdVwPRJ26aN/53gFrWCvoFCyCg6HbWg65sY96ffWWsMIX7NuGtiP/fHPEAyReaYjPEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1615
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10156 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020089
X-Proofpoint-ORIG-GUID: kgzkLIvATiXo48dBHQ8v-_w7kgltEj7f
X-Proofpoint-GUID: kgzkLIvATiXo48dBHQ8v-_w7kgltEj7f
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 02, 2021 at 04:45:20PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 2, 2021 at 4:44 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 2, 2021 at 3:10 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > On Mon, Oct 18, 2021 at 01:23:34AM +0900, Tsuchiya Yuto wrote:
> 
> ...
> 
> > > Run your patches through scripts/checkpatch.pl.
> >
> > While it's good advice, we are dealing with quite a bad code under
> > staging, so the requirements may be relaxed.
> 
> To be more clear: the goal now is getting it _working_. That's why
> this kind of noise is not important _for now_.

If it's a new driver, then we accept all sorts of garbage, that's true.

regards,
dan carpenter

