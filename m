Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E9421C5A7
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 20:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbgGKSR5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 14:17:57 -0400
Received: from mail-co1nam11olkn2021.outbound.protection.outlook.com ([40.92.18.21]:30241
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728507AbgGKSR5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 14:17:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTk73Qa19qOHWxeNdwz7hdCd2KP2N9mpX8mLKt0tAw8OyVruN7Vl120UZxPaNeK7EDrfNFrth/MB2Hl9cELLFXF2Z2DYNUbGo5Rmfubi70SZDCoV/L3iNUBIPWqt1Hqmn0I1NeZPDu5WCzoi7djjtmbToRZHqJwlAsQ7nPr6LjP0tidYfPiTxW4dd9R7EmVPWpIyskyXmy2bkTgzB2ZANzV1Xe1J17DCUeFsCJoOzA/cjKoLCe59GRNI5X/23HWN0OFEtCuMXjvxSTbyUvD/OMx8R4mf9ESX4A8LEIGQMvWakbQrqsDLEf64SptAqjdg4fwECSpV4ZY92+GSHGO6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VKSI+YIQzSPmFxzGzGhf93QH9PmL6oI18YwE5JqW/U=;
 b=BUjZzPcR8J0S4PfD5oj6b3cXEqa7OJsIMYxncRJSesJByCvdyATjn8Ex59e4cCXC5babEgdnd9kEkDKpKEa8wVENDH4C2Eh7NOgGHO3KaORsd0anXyKWEHU2Oz52DVIqK9G9WoH30ZYXloAyedjJiJvDjWGUhgiwqPQxYofYZl/YhuJwGQHP+hlkTk78l1fHQe72sL0Ve/KN06kFiT5bA4LblLDI9yIjKw16jLgcTopJEjXhBtgnnypvQYXDotk1RTPMmZsvptketMznaeAtxAYDr2EA5lvC0QBuX4QO91DEOwibBGLZVjPP+oTe7DMs8BtxrnyTZBdWg32p19NeVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::4a) by
 DM6NAM11HT013.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::340)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Sat, 11 Jul
 2020 18:17:54 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::43) by DM6NAM11FT041.mail.protection.outlook.com
 (2a01:111:e400:fc4d::98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Sat, 11 Jul 2020 18:17:54 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C052B90293D42502E93A5D63605774185197E817384AF58A13E208416A14345A;UpperCasedChecksum:A244C54F690AB9BF32693978B311102DB56ACCC13C813C75F9BE957F96029783;SizeAsReceived:9198;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3174.024; Sat, 11 Jul 2020
 18:17:54 +0000
Subject: Re: [PATCH 10/11] media: exynos4-is: Prevent duplicate call to
 media_pipeline_stop
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660DB1C884EE9F9C7D94857A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200707184412.GJ2621465@chromium.org>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB0660C1942C3738F9F9D1AAAFA3620@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Sat, 11 Jul 2020 11:17:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200707184412.GJ2621465@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR19CA0078.namprd19.prod.outlook.com
 (2603:10b6:320:1f::16) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <821026ec-61bf-131f-f4a2-df519eb73feb@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR19CA0078.namprd19.prod.outlook.com (2603:10b6:320:1f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sat, 11 Jul 2020 18:17:52 +0000
X-Microsoft-Original-Message-ID: <821026ec-61bf-131f-f4a2-df519eb73feb@live.ca>
X-TMN:  [G/TLD2hGdTTT3ENvRjgYReZbpkn6Hj0Zo10Dhs1cSCoNFw8+T5syPs4xISXPeTcU]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: eb6c3866-b26c-4fa5-1c41-08d825c6baba
X-MS-TrafficTypeDiagnostic: DM6NAM11HT013:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UAlI3125qArwL4+7qyob7Jb0+c37+Cc5mhVnYIjAkgHdIIYqz8Vio2vFdgLt6Lqgo2MtDfDuxVL+9leXI04Kyv3b6IxrYrmEst4SePdhvHlDVWpsup0n20mrWrpnif8VxbEPFlRMdZ6CUvwiEI3Ye2VXXwQOQaPNwDKmn6p6lAhIPvfORvG45Bi0jg0pfgewXu/RmF2r42isfxv1JWtdvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: iyjQSTR6oJ0xeKh8+Xli4SPHYnwKLxx17phXAYXfx0WzKtx0pcmxd93SPIXlKvqv+nxoCuOjaBskVKoq4OntZqigTtSF0fhewCiETNkfm0vHILOQUlD2O0+7vSueiI3YiLNECP1TJ7hgyS6UnL6WngFCr6IVotdhLakpPachckDKcIduyqpDZ9jh+CVD/pJCD6xaBniqZRDhkrZ+pu98PQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6c3866-b26c-4fa5-1c41-08d825c6baba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 18:17:54.3584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT013
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 2020-07-07 11:44 a.m., Tomasz Figa wrote:
> Hi Jonathan,
> 
> On Sat, Apr 25, 2020 at 07:26:49PM -0700, Jonathan Bakker wrote:
>> media_pipeline_stop can be called from both release and streamoff,
>> so make sure they're both protected under the streaming flag and
>> not just one of them.
> 
> First of all, thanks for the patch.
> 
> Shouldn't it be that release calls streamoff, so that only streamoff
> is supposed to have the call to media_pipeline_stop()?
> 

I can't say that I understand the whole media subsystem enough to know :)
Since media_pipeline_start is called in streamon, it makes sense that streamoff
should have the media_pipeline_stop call.  However, even after removing the call
in fimc_capture_release I'm still getting a backtrace such as

[   73.843117] ------------[ cut here ]------------
[   73.843251] WARNING: CPU: 0 PID: 1575 at drivers/media/mc/mc-entity.c:554 media_pipeline_stop+0x20/0x2c [mc]
[   73.843265] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common videobuf2_dma_contig pvrsrvkm_s5pv210_sgx540_120 videobuf2_memops v4l2_mem2mem brcmfmac videobuf2_v4l2 videobuf2_common hci_uart sha256_generic libsha256 btbcm bluetooth cfg80211 brcmutil ecdh_generic ecc ce147 libaes s5ka3dfx videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
[   73.843471] CPU: 0 PID: 1575 Comm: v4l2-ctl Not tainted 5.7.0-14534-g2b33418b254e-dirty #669
[   73.843487] Hardware name: Samsung S5PC110/S5PV210-based board
[   73.843562] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_stack+0x10/0x14)
[   73.843613] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0xd4)
[   73.843661] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt+0x60/0xb8)
[   73.843734] [<c01170b0>] (warn_slowpath_fmt) from [<bf00c20c>] (media_pipeline_stop+0x20/0x2c [mc])
[   73.843867] [<bf00c20c>] (media_pipeline_stop [mc]) from [<bf145c48>] (fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
[   73.844109] [<bf145c48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf03cbf4>] (__video_do_ioctl+0x220/0x448 [videodev])
[   73.844308] [<bf03cbf4>] (__video_do_ioctl [videodev]) from [<bf03d600>] (video_usercopy+0x114/0x498 [videodev])
[   73.844438] [<bf03d600>] (video_usercopy [videodev]) from [<c0205024>] (ksys_ioctl+0x20c/0xa10)
[   73.844484] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_syscall+0x0/0x54)
[   73.844505] Exception stack(0xe5083fa8 to 0xe5083ff0)
[   73.844546] 3fa0:                   0049908d bef8f8c0 00000003 40045613 bef8d5ac 004c1d16
[   73.844590] 3fc0: 0049908d bef8f8c0 bef8f8c0 00000036 bef8d5ac 00000000 b6d6b320 bef8faf8
[   73.844620] 3fe0: 004e3ed4 bef8c718 004990bb b6f00d0a
[   73.844642] ---[ end trace e6a4a8b2f20addd4 ]---

The command I'm using for testing is

v4l2-ctl --verbose -d 1 --stream-mmap=3 --stream-skip=2 --stream-to=./test.yuv --stream-count=1

Since I noticed that the streaming flag was being checked fimc_capture_release
but not in fimc_cap_streamoff, I assumed that it was simply a missed check.  Comparing
with other drivers, they seem to call media_pipeline_stop in their vb2_ops stop_streaming
callback.

I'm willing to test various options

> Best regards,
> Tomasz
> 

Thanks,
Jonathan
