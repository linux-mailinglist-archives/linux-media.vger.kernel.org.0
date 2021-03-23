Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD13346119
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 15:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhCWOMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 10:12:33 -0400
Received: from mail-eopbgr110099.outbound.protection.outlook.com ([40.107.11.99]:18218
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232243AbhCWOMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 10:12:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekyPXyWH3mjNsBf6yJNCpc4BuHMgK7Uy+xH1Vgih+0dTqZkSkB+PakayhdKQzc+aCkD5xZ2nwkAGVIh9mq5Kxh4k279+/bPo5Pzcwk+4QGNc8Rr/iAG2CMI8EFTdT8HXrB4Ll0htw1iO1CTeT+jNTMZlt1j6Fn4WD89XyOq8GYDdGSfywjn9tbx0C/W158TBUYoIwr9U3AitjAzgp8EdcZWbf0hhFoezBgCCAey+qo+YpSnFMHKDEz0lnuvmkSzNqhUn6A3X7Xuw35DgOVPN6Wd6gmAx4Y+owWhVFz+87/A3kOO2yAzHo5K67aGpy2c6kaSRKzlZmjLscPdg1rZ+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAA9MNHqv+eMdAv1Ir4AMo4s9yd2Ep0Ji1UzRHu3JIg=;
 b=T018pOq5Qj72DSlnRkFh+lASp5+KJ7wv5r+dqa88opdKaq4ILAKaFk3prpT3l3x14X5MQrV/dv8fHUyfXeN4wHe/8cVLO1oit4IJRjhXirP4y0Ux9ub7qj4oqd6+hE4n38wTrUpm8wZhc+rM844zVBit5pBldr0qM3nGWeh7wBE9f4lMlQ9Q686Z/nJAA8m/tTBuryevvV1CHO6cJ2+T0HNqieqc3ZGyTKt6tg4LyOZQsUjJelORo+rdapvJlPHl0DxSkq2G59FhkIdd5a1ZoCTStGgw2KY2VsMl96/EyMxZHfeT2gJhSlRxw4mBkP9c4vxqsVUWa38Q0NXrc7zKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cam.ac.uk; dmarc=pass action=none header.from=cam.ac.uk;
 dkim=pass header.d=cam.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=UniversityOfCambridgeCloud.onmicrosoft.com;
 s=selector2-UniversityOfCambridgeCloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAA9MNHqv+eMdAv1Ir4AMo4s9yd2Ep0Ji1UzRHu3JIg=;
 b=fwKDXvxFVZd/9oJU+4TlYGcuawOCKR9E+kytNy53soU1Elx0iH+3llHqpmU5URO75spDWVRchbiyI0Iq3jwndWyhV6nHB3MXN5dq6Fcl/XOIdwe3Ccg9eeR5P75nEfKCmBG3dIBTBe8Piveq+Sgp+4iGVaQArYyInYbqFWY1Zhg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=cam.ac.uk;
Received: from CWLP265MB0401.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:1c::22)
 by CWXP265MB3400.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Tue, 23 Mar
 2021 14:12:14 +0000
Received: from CWLP265MB0401.GBRP265.PROD.OUTLOOK.COM
 ([fe80::98e:d7e9:4c58:3846]) by CWLP265MB0401.GBRP265.PROD.OUTLOOK.COM
 ([fe80::98e:d7e9:4c58:3846%4]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 14:12:13 +0000
From:   John Cox <jsc66@cam.ac.uk>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [RFC] media: v4l2: Variable length controls (for h265 slice headers)
Date:   Tue, 23 Mar 2021 14:12:14 +0000
Message-ID: <o8sj5g9fq0jkganestl771ld2dqrp2fqu7@4ax.com>
User-Agent: ForteAgent/8.00.32.1272
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [86.21.218.248]
X-ClientProxiedBy: LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::17) To CWLP265MB0401.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:1c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CTHALPA.outer.uphall.net (86.21.218.248) by LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a4::17) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 14:12:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0318c12e-0b83-420f-e416-08d8ee05a80b
X-MS-TrafficTypeDiagnostic: CWXP265MB3400:
X-Microsoft-Antispam-PRVS: <CWXP265MB34000FD12937A5C3FCC43F53F3649@CWXP265MB3400.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXb2iwW7k7klJ6zKb5kX5WcSni1M4rZUhNtZV8zRaAr0PVDFMAZ3bIWrX5nZeRtyGuHhyt/sooIpLjTLzTxFULTb4yVafaxYVeBcBgZo+sE3PWQ/C3BzYWn1NOksGWijGBzPWXLa7dWiACazmDj9o0UCD430F0b20S2qq2VLGZrLDJYUxOjx2GhFJFQ0QOxzJvHkaCRql9b7xjVunpGUCUhA4gJFt/LXyb54MZH0zxeNymXfCyiRlUrXrrokuyrrDSeoKIofs5CbDSQvI++ldMXwCLKAhTCGRi7Du2buAhVPduGQwEiCsh+TDlaQwNQedOO29CXl04Lgf5lJ3BIpGh+c4DswL98+mKuVJfUIHRj6zdLylIXARXantArSP5m1DPtjTPeSA3X/vvDac4YNfl9CUjeUIo+D3J4w5ZWLFbhv7SLn0JTg566XGGzYfvBVNwZzg/x4HuT1xbf3amHpl5aTGc09HPGlrdEI4kF4tel0etETkmbvYGgbkPD6+62W4h7UKiOOPDO152h/EfqSGJwniK2xyo+P6DLIW3Mi4blhzCLdZLIEeDjU53VPuMLt8MazFd0Fx+os+atEJK7ViKNUCnnJB4KluUbk2I8gV6tzSJIy1/FqNSzI0iqiybn+cq7icNN4eZIW0fUzm4bzQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB0401.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(9686003)(38100700001)(5660300002)(478600001)(83380400001)(6512007)(8936002)(2906002)(8676002)(66556008)(786003)(6486002)(6916009)(52116002)(186003)(16526019)(6506007)(36756003)(66476007)(66946007)(316002)(4326008)(26005)(956004)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i+p5vH05q9aWAXPC0d4Z9KFOcn4Z2jN2428NXgCuyPgpMeWql8WJ60aPzP9v?=
 =?us-ascii?Q?Ttszpq6EMEb7bJC36FUqHFuuTMycwc5exoiS9n3YW9wXVJh36TjaTQmYButx?=
 =?us-ascii?Q?KvaQVcwBgywQRIaMNXzXthl8VX4pIYvvG+L1D/+Wz1TeaM9VajF2EiqvO8b2?=
 =?us-ascii?Q?XRwYw55Oz3omHLx3j1jorxw9/DG0valkYHXmgsFjd6fJ539I37W+KX9UCJnE?=
 =?us-ascii?Q?/HBsShWMgGzStmg1jhgsck/kvzl5hEJgcUDB6+9Dt/AYaAlRH+TMh+PdEjeE?=
 =?us-ascii?Q?J3ASOaKFWdVL7r85dcRKXihVeLhqzu5R3pDDKSrj/uQSrQR2PN9m0KbYETn1?=
 =?us-ascii?Q?f2Ec0OZTDB/hLjexHFX0J1PKIbVcGOVkC1cYlqjZkFGSlsd19g2o/ZLufsLp?=
 =?us-ascii?Q?OldTk9SynVJdq6axbibUFgWxL2DtUJyfLTMsjjgtkNn8TfEO4M5i1/prfVGE?=
 =?us-ascii?Q?a2ZBVbw0WUXxmxFItooBZvoPKFxdCEUucMP/dW9LUdunmLN3qgAwFh52MDNz?=
 =?us-ascii?Q?XLJ640DGMJrh4i+6oV+VqToDD9lw4LJqSei1eBG6jx8jJtC/wi3N8SwXjjny?=
 =?us-ascii?Q?psXXtOLA+Ea1mRAXQqTses5QdMKd0FDHFNZ/Y0PcTG/RdI86pBgnnBnoFSZv?=
 =?us-ascii?Q?FUlc0yLZGi+lmTDwgB9FZGd4XrtvSLJ7CjxcKvPrXPUfTQQ3su0CO9x/72aP?=
 =?us-ascii?Q?3ZnN/UHRXqFImBjjhEXSQ3wWt0Uw6j+LMkanxpDoFlwdf+lpE8K0NL3ApG0+?=
 =?us-ascii?Q?UAsptRxKCzxuhl1u4t6IxRxeTTimcKdyqDk0vwYqh7dInSGOTCIRG8LOXSqY?=
 =?us-ascii?Q?77J1hyY/uARJ9PTbJrCzbB0xBA1ybQ6DcXXXI/K9hF2DaeHcIn6bxQDmJu22?=
 =?us-ascii?Q?9AR+a8bDw+iBdWPFpOBGLnLJt4yICqBOaS+c09c81641D5C14CBTnqOWcABt?=
 =?us-ascii?Q?MeYpqtMR86fGAvw+W9tayfhCmEWEMcVKRv6D/OGgKYVjU2mUJLT4VFMmNjOR?=
 =?us-ascii?Q?m5TRHEr8yUcTZCiOztwS1065ULx/AMAU5tB10UzS67aKztZJDmpY9L8bp06G?=
 =?us-ascii?Q?j2NSDBl74KJfUOPF2bqvCw5lfKUIp28Jk6F9la8Dl6el4AVoVUzvzXJ+fGp0?=
 =?us-ascii?Q?/8rmWkB/55imsRaxhZ8pPdUlknwPrXl5cdz/U5zZWmwMJH3iPHO7Ad7Hs2lS?=
 =?us-ascii?Q?RaNO5LznTCUYp7Iy+U3rXTBD45DlwsUCDdEZ46t1nm/5EmmOQyCDiE9WFIq6?=
 =?us-ascii?Q?1MDnvz1QwHeYN7CdzsUr4+MFBsgsTr9vwksmBbpa0bDe4gGP3HW4Zn+0pGSj?=
 =?us-ascii?Q?S2uppvHOstW/Lfkb2K7IL/Yu?=
X-OriginatorOrg: cam.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 0318c12e-0b83-420f-e416-08d8ee05a80b
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB0401.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 14:12:13.7802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 49a50445-bdfa-4b79-ade3-547b4f3986e9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+FVm4539IaEpYEMCJWfkGS+TqUDMXZA3DDZ78NcTDkMtcemicH5utBMzsYZL3PM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3400
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

I am developing a H265 V4L2 stateless decoder. After some
experimentation it looks like the best way to achieve performance would
be to submit bitstream data for an entire frame in a single buffer with
an array of slice headers that point into it. The number of slices in a
frame can be very variable, often there will be just one, in nearly all
cases there will be less than 16 but the worst case could be hundreds
(actually theoretically it could be thousands but I'm prepared to, and
it is probably sensible to, reject any stream that looks like this).

Given the large range of possible array sizes a (large) fixed length
array is very wasteful and probably slow in nearly all cases. As it
stands V4L2 has no variable length structure so there is a problem here.
My experience with v4l2 controls in minimal so trying to add a variable
length array control myself seems brave.  Luckily (in other channels) I
was told "Hans offered multiple times to implement variable array
controls himself, he just needs someone to send an RFC with details on
what's needed." so here I am.

So as a suggestion for the interface:

From the user point of view:

Only the last dimension of the array can be dynamic (like a C array "int
a[10][15][];")  Otherwise we add a lot of complexity.

VIDIOC_S_EXT_CTRLS
In v4l2_ext_control the user can pass in any size that is a multiple of
the element size.  If greater than the max then .size is set to the max
by the ioctl on return.

VIDIOC_G_EXT_CTRLS
On entry .size contains the buffer size to receive the values and on
return it contains the size actually wanted - if the buffer can contain
the data then it is also the number filled in.

VIDIOC_QUERY_EXT_CTRLS
Add a flag to indicate variable length and either use .maximum/.minimum
or some of the currently reserved structure to give max/min sizes

From the driver point of view - frankly anything will do as long as I
can find out how many headers I have. I think it is probably a good idea
to dynamically allocate the storage for such an array rather than having
a fixed size block on the end of the ctrl structure to avoid unnecessary
overallocation.

I imagine that I've missed many important details in the sketch above,
but probably good to start the discussion and Hans, am I trying to take
you up on an offer you didn't actually make?

Regards

John Cox
