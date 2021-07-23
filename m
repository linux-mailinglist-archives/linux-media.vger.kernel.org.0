Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72B13D362B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 10:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbhGWHae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 03:30:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23778 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233619AbhGWHac (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 03:30:32 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16N87J6k017677;
        Fri, 23 Jul 2021 08:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=p9Lrxkg3uGsi8uQvirpTJdtCBRDGqqfWg2rYagXqtzU=;
 b=lRf6/CjdAt5MQZgbZ++55o6iiMJ22JFlrNEzvaDuYjP5CVgwUkR16ZW/k2C67LGm+o5c
 20TcQ8iCOzAqwnyhSuevgJlKWAcbgiVqnS95t6a0x1eVdNHyA1BGx84GG/PphtOYDP5x
 Ri5EcgDcUcKMP4iQ+Bqh/uAusqP6YINy5tUOM2/SR3AsBvGd5vaK2sQ5aY7P8pSY2ZzI
 J+qjLRDFaMA1DLBWfc0KfyX4DU0qUAv3P8W8petJy4gQOmQVqhCwqG33MdCiL+sMCq9T
 8nyNF3F78LiqyVrz67xY19Ermm7n65mpVuKidhZqIrHFNteXv5PpEy2QOd8qFS+JV1u3 Gw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=p9Lrxkg3uGsi8uQvirpTJdtCBRDGqqfWg2rYagXqtzU=;
 b=NiqJesQH7ry4HUz1l0P1ASbuaOs6/ASeNE6hHs2COVr2qx6yaM2PHF5DQhyKMM1HAExn
 Gl65eJkKnplSnKUYG+AJSoOVJOvqLTkDeDuUsI9ayj4GwolOjkaapnpSPGyIdI2q9DRq
 y0mhq0tQwHw5iCxp5z6vXljNQlS422eL+MUXDsT5VIu9o1HnS2fVhzYkNw7c/98oSGBM
 Sodg3E1K9gAwFGIZyDBhTV23tVLjguwa5TZBaqWOfpj3d2c+jBzK8YwPv8J/PT96a4uj
 YoVwvqX0kXVZ81SqALrnce0l8rSZImIM9EK+CnB2Pj+bXhciZapTBk91Q3mUzBRd6bA0 Gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39xvm7u9bt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Jul 2021 08:10:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16N85SH1101141;
        Fri, 23 Jul 2021 08:10:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
        by aserp3030.oracle.com with ESMTP id 39wunqggd9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Jul 2021 08:10:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHeIEvePkxJRoVgMTlPcRKX1uJPiaqkvZ42gxhjREkkWM+UgxHDEJ9DZqWjI9R5a7IFUl3fAllsvo4aw2FJEY5LXjnsMGAmSvEdCDM04szHBu6VkP/oadqoFn4Tbfncv3gRo77YBvAPU90fPnkuFk3eFlN/AYqE/bitwtY4Lc02/+hLzCaFW1+hHhQPbZiUlVT4Oy1QgsKJ4b69Az+7Y84HeYU3SZ8Auv9HJqTwYBxf2Luy3yxYV+pez95PJtSj6QjP49awTYUZlRD98oIGon+VPKY/RmLRhihUVYY8nIJfvncYRGB6P1aPutnU+H7c4a0fqQ0zzmMEufyg4lUJMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9Lrxkg3uGsi8uQvirpTJdtCBRDGqqfWg2rYagXqtzU=;
 b=jO4OIE87pqBzMDMyLyZtRS7ZDPmnMso9Py60fy80i7roJOyA95agM2fzum6IGS1WFeUF2dSOE9pAz+rMdDLhoiBmNskYGOiaxwnlU6xkKXG3ZC4VLYnEVKn4A/YZZS1owrjv7xYf7Ptlcn6EQvPLvLOoGl7XC80VphFGe8CH+nEtrs62p2zYmCAWnXtjV/hD00b571m4wX+8Y/955xuH607BqbNB1xZ8PWjQnFqP8JxaMnyWVUzzLLI47sVyOtNpFDQS/fDX8035+WccnlV7gllO8gfIdOcfUHVtzmumS1Wp+Shmc1WD69kkmN4OUlZ/AgalbH+IZ1+K+bjz2lVPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9Lrxkg3uGsi8uQvirpTJdtCBRDGqqfWg2rYagXqtzU=;
 b=tS66bTB8lPKUMSO2emEjBGCrMXoOgfYpoavoYNPvP+l6CPVgmcLPZ+H4eXU1BLw1LhwKYAgxPYQ/azNnQ/14kmsrE+IHfBohbUeb/Eb85RD3McHTkjagYg3a4Xqzl3szuoKo0zQVzjfuucf2u4HYTkSXbH/wi/NdNlKAvRov7sU=
Authentication-Results: ucr.edu; dkim=none (message not signed)
 header.d=none;ucr.edu; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4691.namprd10.prod.outlook.com
 (2603:10b6:303:92::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 08:10:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 08:10:56 +0000
Date:   Fri, 23 Jul 2021 11:10:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yizhuo <yzhai003@ucr.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename
 "retvalue"
Message-ID: <20210723081034.GD1931@kadam>
References: <20210723085145.1ce7ee5c@canb.auug.org.au>
 <20210723003607.64179-1-yzhai003@ucr.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723003607.64179-1-yzhai003@ucr.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::6)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29 via Frontend Transport; Fri, 23 Jul 2021 08:10:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c95953-7403-4def-9c40-08d94db1657d
X-MS-TrafficTypeDiagnostic: CO1PR10MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB46917695C9A387ED79A3643C8EE59@CO1PR10MB4691.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2UMpgTqw0pN5DQyCa2vGy5cpvI+C1NrRTRktFIHu0lmSJgc+6pmNb+YYvfWT6y3ZD1c8KKxMFdH5kikKeqECFOoW/DA0192vLP4giW5S4CHKpQU9NPAICnfqt77drMGioUipTX+Uyj8zw+U93oHVEtUJdK3/WMtXIzbeHHtmt+LFcL9NqeJ4KxWatRz9Ajc4k1UXkPfoFZ4vWitDQtMEy9n6FLJKun1rH4G14M/qY4coIqMop48xPwFDIcBdNH8d37hai3opPkr2WtEIjk9UsqpSyqfp9ewAPJYVUCtzALnJrsPG3aFl877bepwtKmPVZMEn23rsHPfDWCov5GJjyCfMBuRaDXhY6dYp+H7K4rASSUaR0EwQqQ3slaAehsTB9lzKJ45ombQ/DjhEZAyPd+wjTzwY/fmNqmiACe+a912QVCnpNgRQDX9KZR19NiBRh4PcdfD9DXhIxRmetNaqeRTMG1SM49KYzyRB8JOUvmmSsQ0Ro4fJ1xCYWTGhoAMxnGElvgG+Qv2QNSQh/QdULyChRiNatrF+MTcuXzbnv38/COpwpKlS7CbdoQ3L5lFwoqoxhKU0xNZHNeXZ/PP5lJJe3T1tpUDJECo1b+RvJAolhM9pc9YeVD1K2A9x7nX756OHoW7ukOw1TRWAnZD5jCtu4PX2tvznUQRpiQUJvAtvyuL6nK76c6L3eIQouz8n8EVBXburwG6SQNm7P1udA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(6496006)(316002)(54906003)(4744005)(1076003)(52116002)(44832011)(2906002)(5660300002)(38350700002)(38100700002)(508600001)(86362001)(83380400001)(33656002)(8936002)(8676002)(55016002)(9576002)(33716001)(956004)(26005)(66946007)(66476007)(4326008)(6666004)(66556008)(9686003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UXoTOdcTdCt1GjnuwN9cmo/lnFLJwUZ98khhGRjeMU9T3Jw+E39R1iLXkhqq?=
 =?us-ascii?Q?0JCHakr5ki1G1X+Cy78B6p3RR9JTp1YeDdPUdCc64+UO7Evr+RuzE8uL7W6M?=
 =?us-ascii?Q?m4VgE0gf3TMwY/C8OWrj8TPaqPA4ihdRJeU+YZf7nsCMhr4J5q5rKi6fmR+7?=
 =?us-ascii?Q?39pRYgMPo+928Ud+gp+M8SQEChza7JucVN/NkwwMzE9uceTsw34KxU1EwfXR?=
 =?us-ascii?Q?yAiD4B6CQiV86JDREJ7EjT1uyR+v7speWx2YFo47IIa/zH1NoF4nMXTkpQ69?=
 =?us-ascii?Q?f2QX8as73GtdZ0RXfEHV11JzCkWfHUWuOeobDgM4kLkrYIucydyTbxZhBe5C?=
 =?us-ascii?Q?jE3GgqMGnqvIklO8FpqE463L5+vJ5nqs8yIgBOK2sKDOVZ73R2bnhl67Ky33?=
 =?us-ascii?Q?WjgkeGzajUW4J2PVFOTgfX2wPaRf+2D3xWN6CF6FQgdsuS7b2/uNakaulsiO?=
 =?us-ascii?Q?pmQvvE6DQUA29N6x53NpjzmESqVCaekv/Vy7iHkW4/8gk28tIJETDMe+gGWt?=
 =?us-ascii?Q?YP4Jc2h81G+IbLtK3W88O2oPths+vTQnTfxnWFYlGjb9gXzezmGCKMM8ocli?=
 =?us-ascii?Q?O4TXyY2s3Z9YZzxGBS4vdkzTvtV1TQhQ/NTFu252zjWZOYBZ+YiYZLyVwVul?=
 =?us-ascii?Q?Vo0ZLDmvK+ukmpTKFOkvOPx/trwMeblv7lqaKC0GbiAVG10lqGCmKYtLhlO6?=
 =?us-ascii?Q?UyUEF8mJ+xxr+4H+7rUxD2ke+zhoq6fctdlkq3wDjGNAUuC9ggNuDZsyBph3?=
 =?us-ascii?Q?fFUzonvtoxQmJRYOCiBihCW6n5vVFt5au7cSoFogj0yIe+cgCJ4hsO2Bvx3o?=
 =?us-ascii?Q?cRwczrYQijkbPo5c/c101ZsxeXM3RsSYxa5GX0HAP8kqOiAbjmMeqCS4Y0/n?=
 =?us-ascii?Q?CZZqiqVhnikAdhQsuKxyfT25cTcB3/3KXd6UmT0R+Msvx1bc5oxR7bWhtCvJ?=
 =?us-ascii?Q?U29USIk2nK6+tlZdU40QpUv4QT1yM9eg8EjCSRgtYrodu/1SOFPCmKw5S9pG?=
 =?us-ascii?Q?Hynm5Oi3noQBJm89piL8Mc++M0yQpUTph/S3I1mfgqZVjnLVd79RFWZ5Lj63?=
 =?us-ascii?Q?U+N6x3hW4YxkkVkOYE/GQ2tabNZDea8pXGRFvWfzb5mINcwkRnl3Lo9z92cq?=
 =?us-ascii?Q?JDnJ/6VouZ1kU67Fh4rRnLtV/0H6cSso6PPzPiKkyMa3cxZPP3lIkzBMm4rO?=
 =?us-ascii?Q?QIIrkxOMNtVy4lB3q4HckhQQ4l/ySQfVbcD9iA2rH9UMiL/GjxpKKjR1zcgz?=
 =?us-ascii?Q?5dTIvPNF4+QFbFpEV1bXDS2C3wT+Ol99k+FUS0oF7MriUHnNuNcro+QLSAjt?=
 =?us-ascii?Q?XEMJG1mF/QWD3wfU8+N/smNe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c95953-7403-4def-9c40-08d94db1657d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 08:10:56.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBEjkMzyoXCmXui6gFjs4QKHX3p5VNTu8Tgp2yNasBV0YkS0vkDsUgrCJ23UudKZ2PguDnqcKHWjikCqpRipudv6idwZIIkgQ6rbbur1WR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4691
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10053 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107230047
X-Proofpoint-ORIG-GUID: KVy6VQzOlVy4vQQRw4_JXPmEMsOJinPp
X-Proofpoint-GUID: KVy6VQzOlVy4vQQRw4_JXPmEMsOJinPp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 23, 2021 at 12:36:04AM +0000, Yizhuo wrote:
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
> 
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---

Is your full name just Yizhuo or Yizhuo Zhai?  Please use your legal
name as if you were signing a legal document.

I don't think you have changed anything in this version?  It's basically
a resend of the patch from Jun 25?  Please put that information under
the --- cut off.

Looks okay to me.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

