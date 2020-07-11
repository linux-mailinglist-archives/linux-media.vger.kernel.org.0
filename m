Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1860121C5AC
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 20:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbgGKSSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 14:18:52 -0400
Received: from mail-co1nam11olkn2081.outbound.protection.outlook.com ([40.92.18.81]:10208
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728507AbgGKSSw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 14:18:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsmEr0yB6WhOFGjTfmr7C2Oftjdpj7tH5s99pvxjc5FtSfwRMkc0XD3YO0zf6u5+dgWeZZsXIKISXLZLMEObXR5UpLl2vgUlL9ToF1yB1E/At+UGxQwGk2ZehHNIlXD7iW1NIyh0CEIQ82pWsZm2Y9Q08dhqWDtcHrAcT92gQDPNi3GCMpf/Im0UBoEf30W0uj2vp6jlD2FVLuShtfygh+7JSOuNwkrjYenquq1tVjwvwPUo3Ob1cgKCvfZ83F+hey2UoMVC/ssE36qrrxLlRQR1GMgJWD5LrXGZ6wxfoJwXPuwAQcHmtXGJ4S6VC9/onEiovnOewl46k/rRvCYFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/3H5Qp15Ji/VDc0m5kDEKKHgyUxwGZR4wHNX0v5cbA=;
 b=fw+ib2epDwbOF6wBOj4u5t87k79yrqE3+GZrSXNlBOJFW504RaktvATYlZBnshmjaeEIGbxkrjRthVEC1TlJOLI7iA3d5mOmXGYOwJ61HkYhsXaemfxFTM+OdO/3b66kvR7kBC7WtxxoO4b4L8MQSKh1q14BHseZReMkzoyXe8+IP+8BtW5kcg2V16qdBJYahJ26q6VMGgQ768BLrjPxDUt3MN5c2l0Ln4fmJrUFy4azdE2ggxKxeYirk0eNgL4M9pDtv+Q7Sk6NkaO35HINFDoZ4bazB/bTyiOyV2XO3/xdmdPBe7TdAXqHg2njH6E9p5LSSrQMqC8UHWUa5nKrfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::45) by
 DM6NAM11HT016.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::318)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Sat, 11 Jul
 2020 18:18:50 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::43) by DM6NAM11FT041.mail.protection.outlook.com
 (2a01:111:e400:fc4d::98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Sat, 11 Jul 2020 18:18:50 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6F301C493BB595ACA55296A749C0BB73C061BF52215884F4ACC90F02979CF891;UpperCasedChecksum:B4396C0EF1F8BF50F664E0598DE52FAF6952286387767C7CE59EF9872EF08A6B;SizeAsReceived:9280;Count:48
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3174.024; Sat, 11 Jul 2020
 18:18:50 +0000
Subject: Re: [PATCH 11/11] media: exynos4-is: Correct parallel port probing
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <CGME20200426022757eucas1p2d10b653b3d974a1226560ccceed0d120@eucas1p2.samsung.com>
 <BN6PR04MB0660A14860692EAB2A658AEFA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <05381b4a-3581-e57d-3ecc-43eaafd9d527@samsung.com>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB0660D832F51C14CD10257B9EA3620@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Sat, 11 Jul 2020 11:18:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <05381b4a-3581-e57d-3ecc-43eaafd9d527@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR19CA0085.namprd19.prod.outlook.com
 (2603:10b6:320:1f::23) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <c94c2b00-7dd0-9b05-7f3a-0032516b7d93@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR19CA0085.namprd19.prod.outlook.com (2603:10b6:320:1f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sat, 11 Jul 2020 18:18:48 +0000
X-Microsoft-Original-Message-ID: <c94c2b00-7dd0-9b05-7f3a-0032516b7d93@live.ca>
X-TMN:  [aeG9F7CT36SXSoG7+mQoj0Lk4fmE18ZZudW9Qc953ZMvoAK4HxdOCtbCKG8VgpH8]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8589d836-1a41-40e5-e3e9-08d825c6dc2e
X-MS-TrafficTypeDiagnostic: DM6NAM11HT016:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qp3N6CTTtQdBMKXy6DdldoRYfNX4qXuNAtD5P9nUOS6DUjqG05PZ6Wq1dhHP11g9+7H+INxKRk2gcX8JTNcq1sIy185lSf3MquyQAnoJTWcWCBXcz5jsNL/FHyjTFyYlvldPgvzYJCQC+NENcA0/j+9x67NzHdz7EysjyoGdb36ITTmN6oPPutFViKzR8/ViteGvESNDuY1T+GPkar1e4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 72Z21YTWq7QgusVeMQMm8GJFR6qzo3K/w1Hv+5ITy3iu6YAcDDw/UKkNSPARRMAfvA5WcmmK7iTj5NnnOl/tB0Yd/O2SKr3sT3D3AnzDjjDAJYw4IM7Zwyd7jeaxi/cofGYGEXb2PuEZm1WCoUoQAhbeOu2WUtZHSYReiDzq4k5mHjfuUns+midf50sKFpHw7/DFluMPDY9gBHUVvC3liw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8589d836-1a41-40e5-e3e9-08d825c6dc2e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 18:18:50.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT016
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sylwester,

On 2020-07-08 9:15 a.m., Sylwester Nawrocki wrote:
> Hi,
> 
> On 26.04.2020 04:26, Jonathan Bakker wrote:
>> According to the binding doc[1], port A should be reg = 0
>> and port B reg = 1.  Unfortunately, the driver was treating 0
>> as invalid and 1 as camera port A.  Match the binding doc and
>> make 0=A and 1=B.
>>
>> [1] Documentation/devicetree/bindings/media/samsung-fimc.txt
> 
> Thank you for correcting this. I would prefer to correct the binding
> documentation instead, so it says reg=1 for A and reg=2 for B. 
> Then it would also match what we have in dts for Goni and 
> enum fimc_input in include/media/drv-intf/exynos-fimc.h

No problem, that works for me.  I'll drop this patch and replace it with one
changing the documentation.

> 
> 

Thanks,
Jonathan
