Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A6F441CA0
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhKAOdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:33:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53122 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229826AbhKAOdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 10:33:03 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A1DIwPs022262;
        Mon, 1 Nov 2021 14:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=g3wtUD8nN55eQCPgBNWu0g5bjqTiXjzpsOCrX/0h03w=;
 b=TncJ+938rKhxpnGSEnJsC0YEpznlJD8vdSt43DJl9NzQDTXbanffetBhJhd1iVWFrjWx
 M18QLfTLaJAkZZH6CbNL1DNYDLHNNz3yvEgRqgsw1OKz8aIAKgSQDTBjvbmwwJjL5lSn
 tegqjDzAfbt1JfLFfHcdcHgLl4ON8ekQq0VQM8GogB1nKTRF72QNO87yTAWvMo2FPCnZ
 xPMK+0R2I7FnHSEO6txKu2gcegJHjEpSJf4KzUsXu4wPr1iW21xynjY5zm0zuAobmccU
 Ht0/hlHN+KYcztMH2L8+amcSO2lX2SRRs1kxXURHqh9oaloE+4xzEUNDCJaAnyz+C9qd 6Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c26e8aaxx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Nov 2021 14:30:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A1EHYF1157493;
        Mon, 1 Nov 2021 14:30:26 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by aserp3030.oracle.com with ESMTP id 3c0v3c81xp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Nov 2021 14:30:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQU4leO40Nmg73IS3Vj5gUZWpRxMhhX+C8BmO16XC7e8gHwZAVM3aRK4onbJebTyuGjMB1VDdv32GNQGbJE65qEOcJV6BK084u5hRF/vvX7FbZ+n+K65RelhRuocUv5UVw+TQ45IKXsywElR4G1+1FZrAlt+jfjCD7mInpeSvnoZ3CcsalA66Atbpv694d/j5kHH7dMakETKdqd4dyTmu+hz6Cda3lWiWm9xM55GEv4eoa8uumv1URP26hOuMyOhbRQnvIq+rshs4ptMtUY8S7ydXL9JjX8xVE1W627CWT236pSvnJgvVBzsHy6X0N/TwzGGa56G9nc+ysQ9XHHseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3wtUD8nN55eQCPgBNWu0g5bjqTiXjzpsOCrX/0h03w=;
 b=mJKd6jN4BJ8je09Yy8RCBPjwywXNdhDuxM4qq5qxI4OlL9ivwXaF48lspI0b9GRiTnMqeOwAsLBjbWPf+N3uT1o6Z3MlFwTAnfUN2mgTS5YkH/TIXXsbm+I9OW9VATuZyHvKXB5kqWiGFbup3gr1aUHeV5aSJe/mbln4WQIaKY2LVIFQU/Gv/ls5vRIAPwEJHFhOU6eS+2ruAWPb6YGhNmdkd/icN4tdxK7TN9YtIzf0VQG62KzjHDb6H2HQV/wZ+eklcT2ohhvj96/UIPWSO/Dom60ld9O4YY+q1rvq9fz3boSJER+FqfwD0fiT5t5gvX2FdeOprQySg3I+oRqFsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3wtUD8nN55eQCPgBNWu0g5bjqTiXjzpsOCrX/0h03w=;
 b=KZqZBqIhMPk7JZwU7NToI+OGgPB0jCMZYopCRK39YEfsb7t+DrywUzIqWMpsrCX1w1KxAJMeLj1jUtuCPMyO2k0C5DYCHItANVn0PmxSX7pX083NoytiSKI3boX8OmLBH0FimfTlhOwDT+bm25ViilT853MK5kvpa0RATxn7ARs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2254.namprd10.prod.outlook.com
 (2603:10b6:301:2d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 14:30:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 14:30:24 +0000
Date:   Mon, 1 Nov 2021 17:30:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
Message-ID: <20211101143004.GD2914@kadam>
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
 <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
 <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com>
 <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0040.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::28)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JN2P275CA0040.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend Transport; Mon, 1 Nov 2021 14:30:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5e402f1-eb62-48b5-3c69-08d99d442459
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2254:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2254E04CBE441DFEE7C32D858E8A9@MWHPR1001MB2254.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzcOOeDfmyOC2SdPghWHRcVQSLehBFYIveoiVWsiAYgVzH7A4Igp3YRA03kVc6q6ZOfsD1gzQx42O6r5kwZh0IEIMo2XCpyElWKaYLnaFiZDQ8sGBUDgWd/CQCk9XZc/xBPi9dTRMkEP1z3JRPWP99lBeI/FdCOF2X0msySUgA7OnFce8aUnBaxv9Z0fAgd08prjGfdHc9rMB0PF+shGDymBUJH9ocF2H4e4Fpjy/ROhlmRh3T+0TCvdq214O8VmLQXOrwdT8yjpYs5sOoBd9bYACeQ4iXY8WqrzRfj6FDChklR6EDgMXqrZyFCb9xRKXiypzKJXePiTV0BqTQtSl4ZpWN2bgaGVIITYVkQqCJNH5gkAnbIDXREDz1yArQjOO77rK9QDVSTwvRjSKvcmj3CXRKnqH/XXl2dFY5c9VsGsr4YEsM0pdt4ex+hQp8tGGeo6RiQroBpJxxqyLlAeNh7d9bkCIf6KRoAv25n0q+88aKymSnZC6iCgfmZXxtPBgfZs3CfLyP/4gnnGhrXDvh3yY4ofICgB1sKamM2lvgTydWxcaqZ1xYCyJuA0GbVz+m2LswI+UIPu92YdYoIwoOe+uNOARM6+1QaKxQVSyZ+Fp1Y7NfbqWqEnkl9bld/P/N4EIZZnlh1NqFAtFbHuJENMCGDqk760jXGjshEWgHcMcENXT+cGp9WLML+vk7hYLeVY5nAUpdnbMwJmOf6A9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8676002)(5660300002)(956004)(55016002)(54906003)(316002)(53546011)(2906002)(4744005)(38100700002)(38350700002)(26005)(83380400001)(9576002)(6916009)(6496006)(33716001)(4326008)(66946007)(66556008)(9686003)(44832011)(6666004)(508600001)(1076003)(8936002)(66476007)(86362001)(52116002)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O9KU2t1ZBJ78Y6woXiz/LJ72IJW/VJ2bP2sDpdnRwIU1n6F3cb2tZK8gTSvv?=
 =?us-ascii?Q?WRfinm9b9bVv9y/nvLYG16XAhNP9ehVrrUpILxm/zno9oavaDuHrNomvtlr9?=
 =?us-ascii?Q?8u2CkZsf7iqeErFgcSOL88HsWMrAUUKnbImeK8XKp936G52Un0NSkmEzHYZ3?=
 =?us-ascii?Q?54NUBS3mwHm3L1SlsSLhiW4rEKDAaJ+rpWjjpS+e5oHFLPJEMB9zSnh/x8VL?=
 =?us-ascii?Q?kh1xRf4v6HLRPe318EOvGjTkzw5vEQjMipOGIPbE/4GcGZ1QOxjTm+b9oFm+?=
 =?us-ascii?Q?TU5H+nHT3y/WM34IqDaNiDlBsYsaWVzPgEvy5Lf2sYIw+UhLx2UYm891jHav?=
 =?us-ascii?Q?eql0+cBu2DNaZpS/ZWc58sCOiJKU11k2Zb7kjCIuc49tE4VRcqSI1Fkb05AM?=
 =?us-ascii?Q?xthqK19O0TdML5DHY3W2EJzjGseVRD993BJ2dJ2IEuLBtm8Xf/93d+s31i0S?=
 =?us-ascii?Q?WKpVJGJuMXtK6Ljl2XH8E+eZudSrkFHlPZTIX1O4qLnWS9zTaHEP6YX04gZ2?=
 =?us-ascii?Q?rGWeg62PSwA7E6Jx2qgUKITZbZ7YEgUBaHxP8gWwetNu0bzL69X2tDLhvHLE?=
 =?us-ascii?Q?Ra9CYJ2ItE5VUOr4H/R8ld3yCRY+YrIRJ4Is6jgRQRad2WQaRG3w/b9fYNx1?=
 =?us-ascii?Q?8h7vtvuxSZWX8e0YtQIBLzXxkRswZ6cDSh6PHcFmtyryZCYIvAgj+BcU3Lyx?=
 =?us-ascii?Q?XvD/mPMvfk0uy4kYaLpXLmMyFQq46D7QgX2QwtPV9am3IBJKbxV8VqoC3jPF?=
 =?us-ascii?Q?QNU60qBmG/kr/4HmQXhyVXbGJbplND+/qONqvP4ImlZdYY5n/2i2b0Ha5z6g?=
 =?us-ascii?Q?LBiftrV/bOOYPiS19IDq2/GHq0vYDdw8WthoP5Mj9Xx6EJxw8dmay21JibSS?=
 =?us-ascii?Q?vNFb7g8YZLzD1Ar2vVoR8q3/eWHH4wIlwHUzfO0neJW0fsM/EsW2d4HuldWj?=
 =?us-ascii?Q?nw0W1rcegQtU5DCGk5ey8U8Qi7pCEGnxAJ39V52wdNbP6P8DJ4iws+/U5ymA?=
 =?us-ascii?Q?NHty5+V5yA9jGtFgHnpt6lUVuhm6pYY2/oZ/INK1LqNA8lf5B6SgIlnm8Flh?=
 =?us-ascii?Q?oywOQSDDke5/vX2W7pxN9ufznWryUKeqHHQYaPMFoFoMjM3I2K75BFlomUzE?=
 =?us-ascii?Q?jlnp/bIpC/kqf20k6LdkJafrSk4auxxFoyzRhQJIyTH5S9PTzZ82egnF0B/W?=
 =?us-ascii?Q?/ESWGJPWRnmX7hZh+fgK9JBaAr8xF4fq6SOwVNWEtWT+yGVaW26F8sG2pWUT?=
 =?us-ascii?Q?SEFIWwCqxTlV5zxENYeBQTVf7YYoHGlYAb+CVgk5ZqlmBwI/ViWC6Z4C2pD3?=
 =?us-ascii?Q?iGXNYFJPer/MwBWjmwgN0fJpJ8H8kwyIc6gZlGVrwPmBkSVuyRi/kgCdP/wZ?=
 =?us-ascii?Q?dv5Xbx6Kc1bd+ERwoBpcIkcqq1ZvBNnLLBGf3LcSUso87GbQkZMizaMyFs2B?=
 =?us-ascii?Q?OfLF+J9wcL9tFrHI4IZnQ5FZmbgOuUEsx1Z5/wZ7SR/P8esVX/MPTb1c+ie9?=
 =?us-ascii?Q?+M2k/GGbRoU+nTwIgMi7ebWeLhvP1BgStpilkzIWs1YNgZOzPzQad+rzwrJx?=
 =?us-ascii?Q?eI5tEcBbKthdGwAUJZfPveh4fE/XUqyso3kvwn8TTlCjjr42ZWcv76YoWrDx?=
 =?us-ascii?Q?Xz+hbZouVRnBJLRr40IU1KDlpbWX8BlUiizKciEKH0P4cm+xPcBjyzO84K0Q?=
 =?us-ascii?Q?+ktfVw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e402f1-eb62-48b5-3c69-08d99d442459
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 14:30:24.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRBgYl16JY4VClp47vC1iqNF+PkerhvIps4imQvJav5TSP/LLmZN9Xx4AS2QTxW4My7UN7WkUrvfaR7OLd58/sYL11i423UwCOrxULAkh4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2254
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10154 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=925 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010083
X-Proofpoint-GUID: enWCbyvde4HwVNMHT6FhzY9zHLrjnBhR
X-Proofpoint-ORIG-GUID: enWCbyvde4HwVNMHT6FhzY9zHLrjnBhR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 01, 2021 at 05:58:56PM +0800, Dongliang Mu wrote:
> On Mon, Nov 1, 2021 at 5:43 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
> >
> > On 11/1/21 12:41, Dongliang Mu wrote:
> > >> Hi, Dongliang,
> > >>
> > >> Did patch attached to my previous email pass syzbot's reproducer test?
> > >> Unfortunately, I am not able to test rn :(
> > >
> > > Yes, it works. The memory leak does not occur anymore.
> > >
> > > But I am crafting another patch based on yours as there is a small
> > > issue in the retval and I would like to make the error handling code
> > > uniform.
> > >
> >
> > Cool! Thank you for confirmation.
> 
> Hi Pavel,
> 
> Thanks for your advice. I have sent the patch and you are on the CC
> list. Can you please take a look at and review my patch?
> 

What's the Message-ID of your patch so I can b4 it.

This whole thread has no patches.  I don't know why I'm CC'd when the
only part I'm interested in is not included...  :/  Hashtag Grumble.

regards,
dan carpenter

