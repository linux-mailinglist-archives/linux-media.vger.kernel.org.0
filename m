Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26DA442F6B
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 14:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhKBNyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 09:54:05 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62404 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230415AbhKBNyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 09:54:01 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2DOxE0001780;
        Tue, 2 Nov 2021 13:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=GBJ0F3TQ4X3gRVqQHOHwi4UODS99rjovtlMskVoV9R0=;
 b=yL53ObFsIgQGje1hU8Yq1xgBkrJOx+Xd7a6Xnwc23xir+yDraRLSFsjZ6h6jZYK7MXGb
 BWpZmiDUvgv4zGbTSFLWN5WHBBNCYM6R76mvzwLvhNP+zkyHOOyk8LvI7noY6PFcditP
 AmFYJZ6uBmz7npYW3ib3hUScahzoM1fw8EZpD3KyiScmAtfME1wbmldAz+vFncSbsZxT
 4GCIHMx2mmjIqgGcWbPnfZvEZDZmFz1J385hG6IS4Jf8OZge2lQ85kHdYcUDDYId8dpd
 Y/yongj5xy8OMcRTUJwXHfGUEkINxWZEblKVvBy41RD1dmy2RyowBeGUhvqCRqyG+TNj 8Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c27r5f4ns-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 13:51:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A2Djbf6002498;
        Tue, 2 Nov 2021 13:51:23 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
        by aserp3030.oracle.com with ESMTP id 3c0v3dqcj1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 13:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPQOZpd0fr8Ck9aldt/B052QNeMJfy6E4cQLHtFXBLeNnMKTMtqoW9plfuFJQ0OiDVDy6dmW/cR+7igNTLF50kL+4Y8p3j2EOChjSD3GldnFqOYMwCqQEQxhzAsVEJf5WTph8LkxW35gGgP8llml4x9eZJ7JG/wUiZ/blgJXNr+iMaKxspsC0iUL//K/P/jvaqdRNKnPS++xVZEw+smR4rAtPQr5Z9AuC7/Ra1+GjSnUfMY5raz9YV/zRoAupuoHqPv1dXHnDw6sXjNxQkQNuUkTFjpOzygaCDuRzOVLydQJRzEK928fZWpsrI+tRTLTneLeP3XMqQdXnFSVAfodhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBJ0F3TQ4X3gRVqQHOHwi4UODS99rjovtlMskVoV9R0=;
 b=l8EUWGAOExL3UeoQZWIKAW9zZ94upti3uak2oB5yLZJjJ92olM2mzjN5av4Joe8bf0+lzkqTAZRF4DUU10jfC3X5PF3ezBTPCihnvXBtBXkKudA1VvUNxsKbPxBWlmp7DxFQIM3BpMTh8NIfEi/6WZOj04iUmYMJZYq0MpWV6Wd3TGuaxc404zUNR0Vk3YWPxpPcKx0OAQ0L/vRJMPGd7s0vl+eXcqRLC1oI1Dwe6X3is1kymA95/pi8UUP4U/iRNFFUJ3QdGrpEsC2fRFQS3io0n2anJ1bzhFfBUmx3q+/Dpa/vR4kGGVdP1oeE5UyCQfdMh1QHNNmbmb8cVL8gkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBJ0F3TQ4X3gRVqQHOHwi4UODS99rjovtlMskVoV9R0=;
 b=ixNOjRnWFWQ+ZnOF8jhJk1O+qsxoh3WbjsXZkufXIpiibMeZaAILSM1pDyVUjl80p1Y2R4d2ManLdrZHnybmP3jpIDGCZkqdcdIcfqP0a5E9oA1hh3zZ82P9PfMqKaN3vOkjkze30V6mblYbDn/0lVXddz0lawOEXAUvg/TdTpM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2400.namprd10.prod.outlook.com
 (2603:10b6:301:33::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 13:51:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 13:51:21 +0000
Date:   Tue, 2 Nov 2021 16:50:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot <syzkaller@googlegroups.com>, linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: em28xx: fix memory leak in em28xx_init_dev
Message-ID: <20211102135054.GG2914@kadam>
References: <20211101095539.423246-1-mudongliangabcd@gmail.com>
 <20211101183249.GA28019@kili>
 <76e1264b-87d3-c7cb-c9d5-bcf461fbb2bf@gmail.com>
 <CAD-N9QVxOObXE-voToHxFTDyJtyZ0PjWg6JQ-rQB5dB2ivrjtA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QVxOObXE-voToHxFTDyJtyZ0PjWg6JQ-rQB5dB2ivrjtA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0009.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNXP275CA0009.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 13:51:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3805aa28-5bb4-46ee-04e0-08d99e07da30
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2400:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB24003B4806AC92FEC3E60AE88E8B9@MWHPR1001MB2400.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OH4XttAmPGBFFqUxpFq3ANJjw6St3rafxAolLV+AZ3kcYtfUrsN75h857+mk0Ek1S5AWfP+wDpJS4Wr9bH9GSAegTaOxUM1xi2GCgN3novgp+6Stiyw3G+aZNJVBpkcAdEuDil0Z+AkAxGRsg1Gmkz6Lhg3pBPNt0ppUm9k5I9GCMOYEi3UIjW4xDspXvK8Mw8DY8GRFbvo0k87SfFb3iYTDmQO+HGFB/RbFWNyQNGQNfVHBfKUexVxfuetcV8R7JdxlD5sQABX8DaO2NpsvKmB81z/JicDLbW62IO+vaGyaavdlUK3kFsFM6MGExcD286XzcCHODt/pwQgsExo4cjbLYCofi0q2gU9dZ35U/z7nKnvwdNnRQdZw0yiPCMM7eNhvsVdmWxVmAx9hPuHSEUJ8M/l6snJSbR1i8XRYxevMHs/UtM98NS6HKHu/X0gOSTdcj9aKQ7a0wgRnbKJxfZSHcKD8vWaZW8r1HSLR8K4UbVUPwQMP3JjxfXuOIIyFteZf0HldPDM2ZJ6MHIqBF2Gsmil8gbuXJjGtrt27DWsvEs+MvRRRPvXQ5fI6gdon5GCSt4DZyWvZGzRF5ZpDwaTpx1Ussm2bi8VyWsI+kXcqWHdYFlIF2u55nnYTFZhWbHuOb+TSv634bAPehj2f955obtLn5+3MUReXqPhk1k84f1hFEwefPyq+2PhB7+qIfA9wqjJqfqOvXSbuuxyzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(316002)(2906002)(5660300002)(186003)(9686003)(83380400001)(53546011)(8936002)(956004)(55016002)(44832011)(66476007)(52116002)(66946007)(33656002)(33716001)(66556008)(6496006)(4326008)(86362001)(508600001)(8676002)(38350700002)(54906003)(6916009)(6666004)(38100700002)(9576002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uhB5DjOQOB2Ymq/HzbgYVQ/KPnFECPEj4ramvC52EwXC07cAh8EvXcW7acHW?=
 =?us-ascii?Q?zRnen0Qsa1TOGonXKdQ9Rp2AxhquKD8lhwDUrx4DinXuR8oh8JsY/jR7FOqR?=
 =?us-ascii?Q?08bF8qJsmdI7CMKfpBUO9D9poiI4dBOEZxIyzrZCmO27sJuCV3ayVqQZoq8j?=
 =?us-ascii?Q?K7kipIonu+ldOuV0eXDBt0obEMYMa3LpKdKfnYmWYIbSx34m+p0y/6phDT83?=
 =?us-ascii?Q?cRt1BXEP2jT5LtQHrs3VSZBKz26NdGUeF3FnkVFNem78lOggA5wWg0r/hLIi?=
 =?us-ascii?Q?DiXHwP/QLU532YmeXaqipAYFmiODvgqlk3AtcM4Pj8wFSFyVYGwsnn0BCBLo?=
 =?us-ascii?Q?6gihoQrOIVxDpA1j6kgwi5dg5BstOpJbVSFijYElWtxS4SMbuOIeBnpRfDvp?=
 =?us-ascii?Q?apybSReE4cUSS6+tZGD+gqVOmRqlIb4H6yMDFOBQJ/ll6Hdm1/XnCabjRzt7?=
 =?us-ascii?Q?etifR0r1O+4ItlMQQ165APhsJlZ87L85YjDRfq3kr+9Mmwtkr/9kxVcs3FX9?=
 =?us-ascii?Q?UXCoCGs4PEWsxrZm9IFlESjqNaEdUKy+MSdNvvZBB0QQzQhCFKAfFXm2PnTp?=
 =?us-ascii?Q?YFcJMx6s/TLfnb1vocAA1UM5v656SWGOO29Tlxlf9QdaEd0W1O1tNfx8S+R6?=
 =?us-ascii?Q?YjOJF6HGfjzJ5kNoN8SQFsYtyVwOlYde4bp24V9evrRf1E7KJyo8D55h19g3?=
 =?us-ascii?Q?DJYkQphrLBp/0EjMOYebu+XPWT4h5hbAVESbk4RF9L+CttWnDTznhuGkErSD?=
 =?us-ascii?Q?L/SP3IH7jK3JZe9HZi1v8w0lasTtvGCWIMpi7rH3ZO92g+mfdAdt6o82wPcG?=
 =?us-ascii?Q?HkLVhbkDicAjW5sBx6lqyW3+cgc3s0efKQoxorls+LWEG5LN+Kf5A/qNrOpS?=
 =?us-ascii?Q?zKHgEqxibliThSjVVB6+52rQ0PPrEV8+4hkmIMZ07bBr1nd8m0+7VY5OWN0q?=
 =?us-ascii?Q?8vSexAgjMtnt8Asg3ff/DA7re4DQcBENvNRDhH0Nnp6KIYJKcMtHLedIZ77N?=
 =?us-ascii?Q?Y1xBL50IVgK5ViT8R5kSYwT7yarl5/ePGg4LjHxbwrFKjC1B6gmMcJJuXhvz?=
 =?us-ascii?Q?mggfEqpo/Zg0Mn09LL/TN3sCcsqPaZViGTwlihqp4R+klwKJQyQ0zjqH6VMk?=
 =?us-ascii?Q?peA9om/CbEMvv5fg4aIl2hg3iBWHyXPRWGly7+uR5QHKNANDSyVwTM/ZzAfX?=
 =?us-ascii?Q?YRl28t7HX4pLJRgeEf9GCGdf52Fmpd/NSDHtC13cicbXVf6g6BjgWuP9n1DH?=
 =?us-ascii?Q?lpikaloD7u4AeAunT/gh1RUkeovTkF0tfruiLu7C+RMQd+3z9BkwL2sMSiKY?=
 =?us-ascii?Q?/M0WwcjZYglsej/MUfXokZFam+r3bH4pLW9ENcGsntRfnfG4n+XHnhTXsLS/?=
 =?us-ascii?Q?DY76p6RpGYtEWOD/ZiXvGd8bdRPXLzGip4fmNDwkUEzaW3tXIjarJPluk4/q?=
 =?us-ascii?Q?hFZd6Jnew/zMTRfgdlDZhn1q4SmaQKehchd90fCdBLdio1ubp0dOaLlStnSd?=
 =?us-ascii?Q?G6Djt2CJOMglNATUps7KW7CLC3i9LP+sZA86UdnnWsjy+AzXllPVxpfGUAt5?=
 =?us-ascii?Q?KHFGDHS1xK16LsAJVesqzaUHB6bo14wh5oEEj6jh7PFmElj2HAE1oUjtmLBn?=
 =?us-ascii?Q?4qZjNCdpvc/++5UxA1OomuEk4lgCANp6Zv6hhacalaye3o7eE5krSgguMxLj?=
 =?us-ascii?Q?TZ+Axw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3805aa28-5bb4-46ee-04e0-08d99e07da30
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 13:51:21.4284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvRnfB2wgzUcUcPluA7TBznMywJim6VXfEYIb7+MWmV6DFT02/bRgOSUPhdtLImrsdjyEcpM56kQKpZBrq0fzIAdO9ojpAyLVaowfOpYNWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2400
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10155 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=995 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020081
X-Proofpoint-ORIG-GUID: t8y09CX2LpEpK7E1tUhTD2dEFNU8SUw3
X-Proofpoint-GUID: t8y09CX2LpEpK7E1tUhTD2dEFNU8SUw3
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 02, 2021 at 02:31:26PM +0800, Dongliang Mu wrote:
> On Tue, Nov 2, 2021 at 3:28 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
> >
> > On 11/1/21 21:32, Dan Carpenter wrote:
> > > On Mon, Nov 01, 2021 at 05:55:39PM +0800, Dongliang Mu wrote:
> > >> In the em28xx_init_rev, if em28xx_audio_setup fails, this function fails
> > >> to deallocate the media_dev allocated in the em28xx_media_device_init.
> > >>
> > >> Fix this by adding em28xx_unregister_media_device to free media_dev.
> > >>
> > >> BTW, this patch is tested in my local syzkaller instance, and it can
> > >> prevent the memory leak from occurring again.
> > >>
> > >> CC: Pavel Skripkin <paskripkin@gmail.com>
> > >> Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
> > >> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > >> Reported-by: syzbot <syzkaller@googlegroups.com>
> > >
> > > Is this really a syzbot warning?  If so it should be in the format:
> > >
> > > Reported-by: syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com
> > >
> > > Syzbot is different from syzkaller.  Syzkaller is the fuzzer and syzbot
> > > is the program which reports syzkaller bugs.
> > >
> >
> > Bug report is from his local instance. He just wants to give credit to
> > syzbot for finding it
> 
> Hi Dan,
> 
> just as explained by Pavel, I leveraged the local syzkaller instance
> to find this bug.
> 
> I can modify it to "Reported-by: syzkaller
> <syzkaller@googlegroups.com>", this one looks better.
> 

No need for a Reported-by at all, but if you want to credit syzkaller
that's an okay format.

> >
> > >> ---
> > >>  drivers/media/usb/em28xx/em28xx-cards.c | 19 +++++++++++++------
> > >>  1 file changed, 13 insertions(+), 6 deletions(-)
> > >>
> > >> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> > >> index c1e0dccb7408..fca68939ca50 100644
> > >> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> > >> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> > >> @@ -3625,8 +3625,10 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
> > >>
> > >
> > > There is no check to see if the em28xx_media_device_init() fails.  I
> >
> > I guess, it should work, since there a lot of checks to see if this
> > pointer is valid, i.e driver can work even without this pointer, AFAIK
> >
> > > don't love that we call unregister() to undo the init() but it seems
> > > like it should work...
> >
> > Same here, but it is out of scope of this patch :)
> 
> >From the implementation, em28xx_media_device_init and
> em28xx_unregister_media_device should not be a pair of functions
> (do/undo).
> 

That's how it is now, but it's not necessarily how it should be.  Anyway,
it's unrelated to you patch.  Just forget I mentioned it.

regards,
dan carpenter

