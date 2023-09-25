Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35BA17ADCE7
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 18:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbjIYQRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 12:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbjIYQRL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 12:17:11 -0400
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF81B8;
        Mon, 25 Sep 2023 09:17:03 -0700 (PDT)
Received: from 104.47.11.174_.trendmicro.com (unknown [172.21.162.147])
        by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 7C856100004DB;
        Mon, 25 Sep 2023 16:17:01 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1695658607.507000
X-TM-MAIL-UUID: 98eb904b-928d-4c2b-87bd-5b45f6393613
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.174])
        by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 7BE7C10001793;
        Mon, 25 Sep 2023 16:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHbO+jXyCLelwUpDQI+aGElKiWfX+9LJLUWWXTGmhwm9jwW+1COPdcVzEgbMw/r0xhIXT99raESh0E69djF9OkE2UzJBK/AYrsW+qCl5NfVk+hbJX0K094KUHQScojK8GsnJIgrlFqEOeVi7EBQFHlNCgfYF6q6PD2NALJqqnSx+n7zf9oorc6LzStoAN/NMK0oLZ+tRiXgmAKDmopJZEGIDrsSNqu5cdg7UNS3/jlL5cjqKOINF/Zwma3Z1WYqwRHvhBXawEMu8j4/L+UEIl40Ka6aY/0zi32fAdDl1jpxZt0YHf9jHrqhXMPvEiFzR87U9BGSFnxxFYHehePvHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBWRXxqpMgapwFqD9Z7Jke8m/5piwWcaDKlPLpOpAEw=;
 b=T8Ggwn/Gm2d6wgR/JNyOSwQI9QcHsBeVkqHF1nHEQ7fFHWl2ypDMSHlhsSi4599MEDuL7mB8+t6gd2+o2ITeTmSB2pCkrktCPjqpP6LntWv5m/yhn+svvhofCwqmIQ1Fh2ne/JEzRNssYRLytymXc2gBZzJJ/myXFDxM/qQbNLIZ3/3gPeuXH4x+mxsFqexFrbCGzcPX9elK+Y5ZHltlLI3hM8kIMM2tOs3mvNyNxTBmBdrpB2kmK8MI836ANDt2FUGEHE+f6zpEC5T5+OuBkbx0IUEd3HlmX/OI8FeqsUDgd0LDZplMzZAwRbZFmrBXPMmpHxvwdtyvndc59XdE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <a297deb7-8b7c-441d-901b-eb910018fba9@opensynergy.com>
Date:   Mon, 25 Sep 2023 18:16:39 +0200
From:   Alexander Gordeev <alexander.gordeev@opensynergy.com>
Subject: Re: Potential ways to describe virtio-video device capabilities
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dstaessens@chromium.org, egranata@google.com, fziglio@redhat.com,
        hverkuil@xs4all.nl, keiichiw@chromium.org, kraxel@redhat.com,
        marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com, devicetree@vger.kernel.org,
        alex.bennee@linaro.org, aesteve@redhat.com,
        Matti.Moell@opensynergy.com, andrew.gazizov@opensynergy.com,
        daniel.almeida@collabora.com, cohuck@redhat.com,
        mwojtas@google.com, mst@redhat.com, peter.griffin@linaro.org,
        bag@semihalf.com, bgrzesik@google.com, hmazur@google.com,
        mikrawczyk@google.com, srosek@google.com
References: <a9235fe7-7448-fa9f-ea52-fd27f4845bc4@opensynergy.com>
 <20230922100303.GF19112@pendragon.ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20230922100303.GF19112@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0243.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::8) To BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:4d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2663:EE_|BEXP281MB0149:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b62f2e-6a23-4ae5-3728-08dbbde2d04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6mgz7l8ayj4oW2cZCKtDV4KqaDmmRc5WqKE0kbeamzIygfiuDYf2UTnMWZ83PoDijsHm4ox04hH0qCcXdNnQProqw/kdkYL362m/OAcdy0U30bg6y2tB5duexmida3M30t7NQyg9doltCr2YF7yjKOAt486G98LJq5RgmNJAs+vOMsFAyX6dtuikd+TZJijbASxi+jO9PX8UMAA2raVESAG0tCr6aeylfJEFandIQtsN/3UqtSC347GsPNuvDh7k8xuti9mogAGCXN2q2fWqVUbsBNBv3z+xfyKzH2uQKtM9OQh2Nu9MFoH2hmghVFZHFGj3QRbnDpYH2YdwMx7moiZIwImnkzzRL90iHL2499Fgh48xCluW88pMKJe7U/1IlkQDsC8oOjH3Vxv7135dQDPjDKRNThcZ0a8+XO/kd00cXAsyfqr7LYZwgWT1esUS5DRjeEmdZVm/NUp9Ij0zA9Aab5Fr6vMakZADaYp9SVh6EMa8gmHtD+hT6uJcnBYOzHbvv2GTIBsKw3ad8MdQbwtug87rCg77Pxyzv6Ai3Fm5i23jFefQTYdCZtJj1h7mK+eSeVzhs5HVHs6HYvnzoAclL5f7LLkSTERpZJMrU4BwyrIJ9A277Opruq8vaLQhHq2+rUw54RLkQz3Yt2rhSdmxlW95ab/SfCF4oPCz+VpopQSP2JyZP8xYLJzIcDQh1in5dgwqNS4QbMhGKwpxAkCA55UEpZxRGywM3b7aHtGSKP+V56vYwIskxxB9nGej1+h76fhHLh5ZpZrWVDkHfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39840400004)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(83380400001)(26005)(8936002)(8676002)(4326008)(66556008)(316002)(966005)(478600001)(41300700001)(5660300002)(42186006)(6916009)(66946007)(66476007)(53546011)(2616005)(2906002)(7416002)(44832011)(7406005)(55236004)(15974865002)(36756003)(38100700002)(31696002)(86362001)(31686004)(5930299018)(18886075002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlhDN2dPSVFjR3o3Z3NCcFdSWmtlUEFRYWpseDhpbmkzanVtemVLc1JZWjEw?=
 =?utf-8?B?ZzByTHN1Y3haZHd4bWJoRnhPOEI5VFZSMVg4M0hpQVVqVXh1V25pZUFWa0Vq?=
 =?utf-8?B?eDcrd1BUUElOSFQ0ems1SEVqOG5ZMWJRQXdRZEUzTFZGT2xzdTFkTXUyVXVC?=
 =?utf-8?B?bTFscE12RWluYjlEaitVQW9udlRRNmdaTyszOHF5eUozZmR2OHFvM1pZbGRz?=
 =?utf-8?B?NXJETkxqQ2VxcEVqeHRDS3JxcllWei9OYzRxMmphanl1Ym94RnEzYjdLOXJG?=
 =?utf-8?B?UlBibEFPZ2NVQUtESDR0akRlRDFrV1hHQkdiOFgyTDBQOGdDWERUb3Zub09m?=
 =?utf-8?B?aTA1dmdQdGpLaXdCUkFJT29CTFY4WjlVRnFLaDluQm9Xa1lKOFRFblpoSVJW?=
 =?utf-8?B?WmJSa0VFR1p2QVBXWllCdFkwSnpQN2NsUTBrZWpScndQZGZqZHhOWTlvbjJF?=
 =?utf-8?B?aHo0c0hUOXRCMkg4bFZFM3JWY2RYT1hSQmFlaFp3clFneG5oK0dMdU1aTEdm?=
 =?utf-8?B?THlVM0lpaDRkMStzWThRUS9KOGdacDNOamhtK0toaTBvOUh3ZU5xK3hKNnI5?=
 =?utf-8?B?OGVSRUpROHJwOHJMNHIrbTFxQVBrWVB5TllubU52d0J3aHhmbTY2M25EakM3?=
 =?utf-8?B?SnNEcUNiUy9NUmVncGJ1aDAxMTVOZjB2Mm92ZnNwNG5hVnVYbTZ4YWh0NzBh?=
 =?utf-8?B?Y0ptSFlnM3I5dVZKZkdIKzFUbWUzd0tuV1FHbVY3VXhTbjlkRzRHR0xHV3B3?=
 =?utf-8?B?NHRiZHZ4Ky9IdVRrbE1pTnh4S0VINW9vV3JCK2s1dThKYWRXa250UmVENDdE?=
 =?utf-8?B?czhBT3lNM0tvdDFlb0VBSlcrMThvZnlOU3VHaW4vOVB5dGNFQUNUVzQ1STFT?=
 =?utf-8?B?aFhlYlBpS2hOdUFVa2V2TUpuaWtHL0xSYmljTG9FL3dtL2JKYWFMeCtVdEly?=
 =?utf-8?B?ekZ5QU5BMG9vWGRBdEUwd25sQzlxRHBlR2J2MlhMM1VHc051QXI2K0NhKzJG?=
 =?utf-8?B?bzB3NVJhcDdtTWJKR3Z0NytnRERyeVh0UGF0a1Q2S01JWmZRRkk3YTg5czlx?=
 =?utf-8?B?RlpCRmlpWEJucSs4eVlzK3BoTXlDQUkrbGk3ZzhzcDlzc2p2TGxEZ0hPY01v?=
 =?utf-8?B?K2tBY1A1dDlsU3B4Y1lUeHluK1pMTmphTGhsUkFZRi85TjNzRXNPS0hOYVBC?=
 =?utf-8?B?UlBrYU9HbWQ0QU5FVmkyUGx1cmpWK1pzR3M2N1U0aEw2dVZzUzZEYmRkZXVR?=
 =?utf-8?B?Rm1DdW0wb0hpMm9sSnhlcVkxU3A1RkZ5elhIelRlV2xvRmNJVFloZHNMbEJi?=
 =?utf-8?B?ZmRNUjhDa085QVFKMW4wUktrblhtSXlCQlREbmFNalpFc0JEckNtRHo4eGhS?=
 =?utf-8?B?SzRQOThVSzZKWXI5c3QvQmQxRmtrSU16T3k3T21MSmk2Y3A0RjNtMDBtdG5h?=
 =?utf-8?B?YXAwZjltL2F2NTYyMG9IZ0RQbnJEaElic3NhbUNWZ3R2NzVSTjgzeWVUczBZ?=
 =?utf-8?B?NFV0WXIzSmkyRGI2ZnFyVEdmNFpBTytiSisxU1NUVWU4NnYyc0pab3NkYk1P?=
 =?utf-8?B?RTJYbkFiNlJrbXdhK0t3ZENMTFJBeWhmT25IZVBIMU1HYmpDeFp3NWZNTFpj?=
 =?utf-8?B?U1djQkIzQ3lHM3hSUGdFd0cvSFU5VVRJc0Nrditjd0ZqV2wwM29PSnZWTFFU?=
 =?utf-8?B?RjJCSE5vT2dhaXR6SEFwRGZqNXU3M0FYdEVlak51WUpISVl5dFFZZzdWZnZY?=
 =?utf-8?B?Y3ZNbmpMcDhEU2FhNGpvL0RmREd1a1VBbE1KYmp1ZkF3dTVkVnJVUmFnclFk?=
 =?utf-8?B?VlIraGRkbGNLdHFQanpXTGlYL20yazIwbEJoVkZ3ME9hL0VKWVhVTUQ1azho?=
 =?utf-8?B?c2lCY21uMjZpbkM1WnpqWE0zamYwTWVQRnlEMDh1MXk4NUhiMGlMMnJXMyti?=
 =?utf-8?B?N25Ha0Nvc2NBL1J6VVBHUyszMHNUcWVzTlhYdDViU05yN2ZzclExSEorSkM0?=
 =?utf-8?B?UFVPYnpiaFFwQTdHUW90UVBkUjVEazc0ZVpDNEdoNXJKRWNqV3ROOENBSCtO?=
 =?utf-8?B?K1BNZTRFVGFIbE1NWEtnSlJMTXd2WHE2Wk5ubllqTUxhUEhkcXlkQlYzOW91?=
 =?utf-8?Q?cRKK6uk50/woEUh48DFaawfTm?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b62f2e-6a23-4ae5-3728-08dbbde2d04f
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 16:16:45.9821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dc2P4fbzd5ivVS2rrN/xcIh7+5JRCMDriW3ueZbtOfd5X8Zxo6mLNGRRzOrUkd3+H+uOWU6XkRIo9Dx/GXwlvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEXP281MB0149
X-TM-AS-ERS: 104.47.11.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27898.000
X-TMASE-Result: 10--40.187100-4.000000
X-TMASE-MatchedRID: iKTMlETJ4pvJjvpr29Z2QHTvf6d+YucDDDgMha/WNJWmiVeoNe/DCjwj
        HDiOsFcFQ1wDzjTPU3laGZcyAf0vNi7ZLsJjpCUPQvBVww1CnWc70BtMXRaQwtVOnN7i+WoGNiX
        SKppuWEkKCsu+OWACaG0i642nGquUB0lk0hmon5ozBJn3PDO4dMWRrnuF8w1zB4BMfq4SzeLlbw
        jdfEVENCMU4UslUsVcwlWW+xzj3MLWy2rJK4eMPG0+k9MhHUhysX4aFYAMIYPriyrp6RgprbLYp
        wOck9HZAa+s0lW1ZqQg2kvpApScAdyvdUTaWVvuEfinJ3N6jMwIjw+vaMoIm+aPNLebur6Dlja+
        I+hTvQKp0LbUi4tp6AwXH/xGjK+MJLy+6CFlC9e5e3S8qRPhgVo/1P3BDpl/xWc5pOGo87gyjxR
        r39/xwhFmqrD9IqPqf5IgAdmuOnYHV0MiAgw75yx4RW/3LuIKuEKZe9OwaKwYSi2tIBS3CoyVhx
        B8WWw9eGmk8XSExgHQu+YGwjjHcnUHkxTRq4C53v325aRdTsjU0ho7mxaK+BvlZxq14kYAmRe+l
        3HbYsEwIsfl+1c0m29ChqKqS3E39iJtv4Em8ydmaxFtxxNj+yo16IZYyQ7Lls6RilmnIsSXYoGY
        te3R6uwNFI7ui5rI6mz53q60RG7V5DFTSN/zXdNH2fq9dvP3ajuQRPPofdJE64d0xcPXxVJ7G83
        umMVvZ2k7mV7r/t99KXLwHGfNYeTCLpdQ10cv4FXis8rXx1Bxev1HSNY2wJWa6EbToghtwtRBzT
        IfyPiSkFoZxFIaxWjPQNkB1rR8xiurQszX6rAJ4vmrWAiMs0I9AEPfED/do4NJa7SjFsoNof8VS
        2Ruh07zklyhPTD9Y7lOQ6fvf34AkucAPJ85a6JYuGaIjh0/IOKWWMbJYW0ONKiUWfcjWwP90fJP
        9eHt
X-TMASE-XGENCLOUD: cb20cfa2-fd24-46c7-be0c-28e2e4decc6f-0-0-200-0
X-TM-Deliver-Signature: 72B56D9B37A9212C0906A6F6DC85D31B
X-TM-Addin-Auth: paBiH2xaRclWN1kfVUOE1v4G8KfSMneo8yimeMoqmQFjqpHYX8y+y12qv3+
        GLQblJi76l6Q7pdKHdNa7ur+9CK7BUVcqafUkiZ7l6k6wcPE9eW9r+VAP6rgu0dy8i0gscycH51
        jOxbfXm0pKXr1/0HSwlKYhiP7aVHyOxoxM1NzsNMg+1j0oQU7AecPAHiEHr1M96PQUO9sJ/rVr/
        rz4K4R5S2kxtR7CPVnojQa0NdLHKZFmpzm9DRwHLm6Yrepsyq2og32Js6ZGfGZL9KHAWuhc17nD
        0bjkiagKhNEu5jc=.Bp8TW2PuGYgvxpi/Ths/OxSmlOq7hwD7HJRT2voGbosa00ROSVx2CadkYI
        xYg5OqckS21sI5KPZBMz4xKtMufQEGX1aea0/J8YMyZXwt79zw+ccQw+FPg8wqF0jriWMGbPj5b
        4jpMZEF7ed26aDk/DwW84Ix1p532tQ5esXvwc+r9DdrpLZDKdOwjIgJ6eSPpsarXDHg6EtjP/Z2
        osKinb189eDXkb8FO7o7z9LBbMm1jgspCc/3I9tQqWEHA4t+5MJ3IN/5EPAmuP2k6Dj0mir3i61
        Vcix/Z1O1Sdxh8l9X+Sd6JcfUGhebOlpbKGYmw3z8l49T6ZDeqJXYXJq9dQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
        s=TM-DKIM-20210503141657; t=1695658621;
        bh=ODweGhEQ4u3bIox4QzCJkrbRKWImPbfZ6f2J4lHPhSA=; l=8956;
        h=Date:From:To;
        b=qPLwnwpCPxv3Xzg/X9bFqQWw5gEIA0LucaPgeKUPdiIQ28+FH/iY3S/xGYxzucs++
         QO0mdjnDrOjHEJvOuxNstlVbhy4uBe1UF0mz19BbAy94shXwLvhIldkIkAsy5PmUuH
         dIbSE7ho0RWVg0VUKvc8ht5QEH0u5rPdznMas6YsYHEs4u16h7CrUSZj3L83y9KSOz
         DH9SG6qfIQcTbFh77jcEdQGJn2/PM0RfBzsKO7QwyPy/Ze8s5Oyw2ArAxI1e7PKK7i
         hFUIqZPmQ+W8Wwmyd2K48NA4ynnMpHHcxBmaEneHapLyLU6qliId1d2/WHly48Xe3o
         6HcZaQoXU4aTw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22.09.23 12:03, Laurent Pinchart wrote:
> On Fri, Sep 22, 2023 at 07:07:34AM +0200, Alexander Gordeev wrote:
>> Hi,
>>
>> I'm working on updating virtio-video draft v8 spec [1] and the
>> virtio-video V4L2 driver [2]. One of the things, that I don't like in
>> the current spec draft is sharing the device's capabilities with the
>> guest VM. The main requirement is making these capabilities compatible
>> with V4L2.
>>
>> These capabilities could be pretty complex, see [3] and [4]:
>> 1. First there could be several coded video formats. Coded formats have
>> their specific sets of supported controls.
>> 2. Then for each coded video formats there could be different sets of
>> raw video formats, that could be used in combination with the selected
>> encoded format for decoding/encoding.
>> 3. Then for each combination of the coded and raw format there could be
>> different sets of supported resolutions.
>> 4. (Optional) for each coded format, raw format and resolution there
>> could be different sets of supported frame rates/intervals.
>>
>> In the future new formats, controls, flags, etc could be defined. Right
>> now there is a rather static structure, see section 5.20.7.3.1
>> (VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS) in [5]. It looks too inflexible.
>>
>> The V4L2 approach with many different ioctl's and complex querying logic
>> doesn't fit well for virtio-video IMHO. syscall overhead is only a few
>> hundred nanoseconds, so doing tens or hundreds of them is bearable in
>> case of video. But a roundtrip over virtio may take hundreds of
>> microseconds even in the local case. We at OpenSynergy already have
>> setups where the real hardware is accessed over a network. Then it can
>> take a millisecond. People already seem to agree, that this amount of
>> overhead makes V4L2-style discovery process unbearable on a per stream
>> basis. So all the relevant data has to be obtained during the device
>> probing. This means, that in many cases there is a complex structure
>> with all the data on the device side, and we just need to move it to the
>> driver side. Moving it in one step seems easier to me and better because
>> of the latency. Boot time matters too sometimes.
> 
> No disagreement here. For what it's worth, I think V4L2 should also
> evolve and get a way to query capabilities with a single (or a very
> small number of) ioctl.

That would be great in my opinion. Maybe a little bit different use-case 
ADAIU because the direction is somewhat reversed: with the virtio-video 
the kernel would need to read a DTB, and with normal V4L2 kernel drivers 
it would have to write a DTB. I think writing a DTB in the kernel is 
already possible with the current implementation, but I haven't checked. 
Reading a DTB in user-space is not an issue. I'll take this use-case 
into account in the future.

>> One of the ideas is to replace the mentioned
>> VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command response with a standalone
>> Device Tree Blob. It looks the most promising to me right now. I guess,
>> it may sound crazy to many people, but actually it fits into one of the
>> device tree usage patterns outlined in [6]. This document is referenced
>> in the kernel device tree documentation, so I assume it is correct.
> 
> If we want to pass flexible structured data we need a binary format, and
> DT provides a binary format. Whether it's the best option or not, I
> don't know, but it doesn't seem too crazy to me.

Good! Well, I'm not sure if DT is the best option certainly. Form my PoV 
having a spec that hopefully could be used as a normative reference is 
essential. The there is a lot of tooling, that I mentioned. There is 
ACPI, but it is too bloated IMO. I know of ALSA topologies and netlink 
protocol specs in YAML, but looks like they're very Linux specific. 
Besides that not sure what else could fit...

>> A simplified version could look like this, for example:
>>
>> /dts-v1/;
>>
>> / {
>>       virtio-video {
>>           compatible = "virtio,video";
>>
>>           virtio,video-caps {
>>               h264 {
>>                   profiles-mask = <0x3ffff>;
>>                   levels-mask = <0xfffff>;
>>                   num-resources-range = <1 32>;
>>                   buffer-size = <0x100000>;
>>                   bitrates-range = <100000 10000000>;
>>
>>                   yuv420 {
>>                       plane-layout-mask = <0x3>;
>>                       plane-align = <1>;
>>                       stride-align-mask = <0x10>;
>>                       widths-range-stepwise = <96 1920 8>;
>>                       heights-range-stepwise = <96 1080 1>;
>>                       num-resources-range = <4 50>;
>>                   };
>>
>>                   nv12 {
>>                       /* ... */
>>                   };
>>
>>                   rgba {
>>                       /* ... */
>>                   };
>>               };
>>
>>               hevc {
>>                   /* ... */
>>               };
>>
>>               vp8 {
>>                   /* ... */
>>               };
>>
>>               vp9 {
>>                   /* ... */
>>               };
>>           };
>>       };
>> };
>>
>> Or maybe the resolutions could be defined separately and linked using
>> phandles to avoid duplication because they are going to depend on the
>> raw formats exclusively in most cases, I think.
>>
>> There are many benefits IMO:
>>
>> 1. Device tree can be used to describe arbitrary trees (and even
>> arbitrary graphs with phandles). The underlying data structure is
>> generic. It looks like it can fit very well here.
>> 2. There is a specification of the format [7]. I hope it could be
>> referenced in the virtio spec, right?
>> 3. There is already DTS, DTC, libfdt and DTB parsing code in Linux. All
>> of this can be reused. For example, at the moment we have a custom
>> configuration file format and a big chunk of code to handle it in our
>> virtio-video device. These could be replaced by DTS and calls to libfdt
>> completely, I think. There is also an implementation in Rust [8].
> 
> How does libfdt fare when it comes to ease of use and performance ?
> License-wise it seems to be dual-licensed under the terms of the GPL v2
> and BSD-2, so it should be fine.

There are some tools in the dtc repository, that use the libfdt. They 
seem relatively simple:
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/fdtget.c
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/fdtput.c
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/fdtdump.c

I haven't tested the performance that much. I tried dtc and the 
mentioned utils with dts file similar to the one above, it was always 
instant. Also the representation of the DT in memory, when parsed in the 
kernel, seems pretty straightforward. I've found the description here: 
https://docs.kernel.org/devicetree/of_unittest.html#adding-the-test-data.
So I guess it should be fine from performance PoV. But maybe we should 
discuss a benchmark.
I'd be happy to learn about other options as well.

>> 4. I think the standalone DTB could be integrated into a board DTB later
>> reducing the amount of queries to zero. It is not going to make a big
>> difference in latency though.
>>
>> If device trees are used, then we'll need add a binding/schema to the
>> kernel or to the dt-schema repo [9]. Maybe the schema could be
>> referenced in the virtio-video spec instead of duplicating it? This
>> would reduce the spec size.
>>
>> I don't know if anybody has already done anything like this and I'm not
>> sure if the device tree maintainers and other involved parties would
>> approve it. That's why I'm starting this thread. Please share your
>> opinions about the idea.
>>
>> An alternative to using device trees would be inventing something
>> similar and simpler (without phandles and strings) from scratch. That's
>> fine too, but doesn't allow to reuse the tooling and also is going to
>> make the virtio-video spec even bigger.
>>
>> [1] https://lore.kernel.org/virtio-comment/20230629144915.597188-1-Alexander.Gordeev@opensynergy.com/
>> [2] https://lore.kernel.org/linux-media/20200218202753.652093-1-dmitry.sepp@opensynergy.com/
>> [3] https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#querying-capabilities
>> [4] https://docs.kernel.org/userspace-api/media/v4l/dev-encoder.html#querying-capabilities
>> [5] https://drive.google.com/file/d/1uPg4kxThlNPBSiC4b5veyFz4OFGytU7v/view
>> [6] https://elinux.org/Device_Tree_Usage#Device_Specific_Data
>> [7] https://www.devicetree.org/specifications/
>> [8] https://github.com/rust-vmm/vm-fdt
>> [9] https://github.com/devicetree-org/dt-schema

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
www.opensynergy.com
