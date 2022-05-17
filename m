Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D09529AF8
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 09:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241485AbiEQHgq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 03:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241829AbiEQHft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 03:35:49 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADA74888D
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 00:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1652772895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vQLyEsq3BHoiJR+aijNCFnC5kQae8lH6253kh1gRaio=;
        b=Wz085hwMgz42EKqn4R1daHhHU6TVWvVb9WaTzWvHqwifhUzvHgIW3mjDiAByyUEjS7sfjK
        pNvUGDnZNWV0NMVQzSAT08FikehnCYX5CDpXaLnnDcr5Zxlb/GYXVia8SNiWpypXgmq4fC
        5jbf/jy3HwuUnNNtezQOBjVhlvsBPeg=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-hrV9aMkXOYG8E0ubeGWszw-2; Tue, 17 May 2022 09:34:54 +0200
X-MC-Unique: hrV9aMkXOYG8E0ubeGWszw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jitamyzKVR5u8JHrgX+WNUrLElmmpGZqtpqbqOIxATc6wOWI6gtV9j65YzZlR8gofpPCZN6vpavNbot/Pl5r2ljhMWWqU75lSRtKd6t3QBo0ATZBAbDtTn3J1++cK7As6ro55ko+2AovUGNFPkNtadJVAsQXFRBrAG6P0vnid8Kfcdw7LqXLjHYMx8UnVTzgZbbDyqdkGX+3DiKRBzoJimng47tvNwIfwLGf2l6zVnEm2jdHMnzOQar4FTaAVzrXBHuks6S1acy2RS3XSDa+d8mbkMefBXt46/T9Ip2U0yRsKGG+jgJgjakGvOQt5witV77sAwNfLnT9j5yp1Ljs3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gm0IdsRi8nI0XYO0aaNfeVc1C0EG0j8LrEbRIzvu2uM=;
 b=ib3IjVzlPV+L+TmdM9cFCep1OFfjT6knq1r9KfHBEfQFYLG0y9mEmG6YNnzJA93IyEFNkDScXD5TsfcRffuhDSNZb8TPBDywsmp9dH7mEwy+wTzSrCrc8elOdbDF8u3TOwRsPWtHqXB2ZoQwGTs+hxRZVEbJoFlQ96JwFiO5Qocg8OJzr+0UxK2ozA8aymy6rq6R91NK7HJacTKD03yQcCYgnu/9uULg99XWJh9Qm+ahAjwNEI45G5LRayCEqDIOM+DJMfx+1jfFgpmeuHeK/kaw8CRB98GmnoNI/7BTswSA0Q/rV5Zx2bnNCDBc3RmdnxigF3IuX2fZHj8RddBBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM6PR04MB5749.eurprd04.prod.outlook.com
 (2603:10a6:20b:a8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 07:34:52 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c%10]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 07:34:51 +0000
Message-ID: <61569f96-4424-eb40-c546-47353de33501@suse.com>
Date:   Tue, 17 May 2022 09:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Content-Language: en-US
To:     Sean Young <sean@mess.org>, Oliver Neukum <oneukum@suse.com>
CC:     linux-media@vger.kernel.org, mchehab@kernel.org
References: <20220512130321.30599-1-oneukum@suse.com>
 <Yn6F87BxKsOaDYR5@gofer.mess.org>
 <2c6478af-6247-0cbf-8761-7ca288522f7f@suse.com>
 <YoJ+jhKDxUokK207@gofer.mess.org>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YoJ+jhKDxUokK207@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0201CA0017.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::27) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26f86163-7977-4186-5828-08da37d7ba89
X-MS-TrafficTypeDiagnostic: AM6PR04MB5749:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AM6PR04MB5749E6D9168A4687626D04EFC7CE9@AM6PR04MB5749.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56nwpH+FmKf//afV2rwtKyJoE1C/uXxfmnq5HRhCm9BMO62kygbmk959rHJHP6lD/CucyvY2oRuRheQiZOwAIO5QkM4djegF5T86cVoX3xzq1ZAo5lSLfHNTUkd79A/4WLRviJ5T3TtlkMwmnW0Jnwj42dOeCAlcxlNpHNQ2nVIAZzePHoDAvDeP8qEslVpldrQMWCBqZqgN4vu4nitgPwsU24MXM3c5lwikMp1QmYqexuRpM64zkMm/QcLrXHZUT4P9xYA723zk3K0lFsXZyGaRBMxF/UndZgl8dy9BIks1k1AAbpXnO9jOZBwfBknA1HDa7GYxWNBUkZFhaD7bKiz4dnZbKDEOdEhkVHzv5io5k+zotQlGWbAJR0uyyOOCfM7qYDnywMQbaI9yJKWiRdcXMqHuks80sHmM/0loUbYGzh7vU1pWs1o8Q6z6Hdcl49NEXPajR+N1os3ueAloAjljEuOxJ8qs6Ip75/M1Yn+rUYt1vhxX20Akap06I5QPWKXClxxoZFdvlPtYFsydafCGg5S/OSBYbxaoMVxLCONVsOZ7yoMawvjWWiBWUTBSmbWEOKX1PL333WbEcxn52w8SrzE1Ylor4KvmG21AKc+n7pzMu4L/63dQWwDXOkCSd0iVnEbC1VarphAG7PoOzuLPjxQ27x/EDT11TUA1FgCMS0cUX1mVKd3c5P9Jt7zwgbxSrqAH92qpo6DVYD6Pe5yiCzAtHsCN+CARLyYqzvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(83380400001)(36756003)(508600001)(2906002)(31686004)(66946007)(316002)(110136005)(38100700002)(6512007)(4744005)(5660300002)(8936002)(4326008)(8676002)(6486002)(2616005)(186003)(6506007)(66556008)(66476007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MZUhYGgR9U/xlUEQDajZ2CProaMoadweXV3HqjviAqwtC41RaqgDWMhsLJvA?=
 =?us-ascii?Q?mJAFSecVvIKhgDiLarg2KqlaMqdYn24SM5yuHWG6g44/lCCrERAyWoQR8uh2?=
 =?us-ascii?Q?iXkHTIoC+8KXp+0+jalTsGdA3jR1vJUFhG/4jmgb6nTOHasl8WtRiO15vs43?=
 =?us-ascii?Q?d+QeUik8JpimnQ+zk1W0ApGNqVZJ3iuzmTqeOT8F8IbVvp3WcQq1K1l9zKTF?=
 =?us-ascii?Q?mCMsJt7J9aVWtcPy4kGjtfGnipW+jUAixHu3DJlDMNzZ2Tea3G0qU9Lr837n?=
 =?us-ascii?Q?bgfU2VOGjiAN7DFmaalZjj4QBptnvlVaifhKiYGCp10FxDYzxN1wUDI4xDC0?=
 =?us-ascii?Q?wikRL1gkbjRSrnHxgqWGjYAzbTHd3fRXwdvhztBfeP1w26ApnXCHLNIA6sBU?=
 =?us-ascii?Q?6no0MFHEIhRplMAHvczQaABD9nUKhzEOWkADhWulDUkk2SaZEsgiOcyV0P87?=
 =?us-ascii?Q?v0bSgn+aceq1npxziWurhzfCbJwDMtpXFQOuwQgaA9g+72qSqhWUaPcHaY+n?=
 =?us-ascii?Q?ml9uV4UTJWhRUGJSAeSigvmUy5ad+vv0fJuTlU2eZ97L2nsjmkJWTLAaP6o9?=
 =?us-ascii?Q?vSUX6yguqEZcXjL/dlcUHrcqHqui0XG/tpWKSq+ZsZSZ+uQV8C1j14FevrPb?=
 =?us-ascii?Q?Vvuq8XeJP8xhdQAQ160yY5LBV8VHW1XNg56coospzHqK0vzmPNb7Ehbqxvzc?=
 =?us-ascii?Q?vN+mwWaR212x8uljGFK4HcRueUecLRr3eqyvouGcvMLXZxfiaEx+YdCwDObx?=
 =?us-ascii?Q?1xcvAPuI2P2XNusQp3ybF7yguHlmuqXG/5/tbpXrZZVjH8u/CAgD+cHuxMtQ?=
 =?us-ascii?Q?kLyHrHMuYFci1RUiHjpaFKNgiByAI29V0qtJMLqGoPhHOghZey0G6FQ/5x6d?=
 =?us-ascii?Q?v/k8kj2RnXIb4mBP0OesotmCoMKPgvWsrRmzl29g/6rX5GKKaBTfFSp1KHB8?=
 =?us-ascii?Q?lE2P/P0JSsuHslDq3E3GLS3mN2Ut8/8+5fp71YyK6k4iykSuv1Xoo5UW0+al?=
 =?us-ascii?Q?BtCzKUqoWlnv+lyKM4alhFpp3nb1wm0+vZofLzsVFqdAM8/eciqjVU7RYGzn?=
 =?us-ascii?Q?DqdN8t6T+y06VZivX+qFKRvPqGasbIHSpnV4i63m0w7eHIIsYGpDa3NgVPx9?=
 =?us-ascii?Q?pVsAvEwt2Ubc2Uhh1TqP1kB7gYNYzs0LzToV3bo+k1aZv1QMmhWHPJxweq8o?=
 =?us-ascii?Q?BGMi9dm0KQ+GJ1rJCbtXr3shIxw2/Ok409db7JvSxdF84Om7kCzhfVvg04ZZ?=
 =?us-ascii?Q?JZUm3Js/amJslLc1TW6qEFuIpE1UywwBWnYOXsiNfv1Dh6DW2yk9YbLorqQS?=
 =?us-ascii?Q?4KITqpyRgOpiDY0N+XvB3S7dL39YNRf5P6+g1o16sJUwhcsEO6qTQYZ+6DNF?=
 =?us-ascii?Q?KorZR9t0Si+gBrdGCyxCUrBgyEheqtjfLztBQ78x3TzTw5aiKQG3KY45MejW?=
 =?us-ascii?Q?ToY34GuVYr8tMpvF/BhnPRjd7s+Y4W0WICVJXtL3BkWqfW41Uc9csEUBt2UZ?=
 =?us-ascii?Q?sYb90R7O9wileoM3JjxTao1+0pL/x99EPl/bIxpYSCMAsxOx7yWwzUoJoajB?=
 =?us-ascii?Q?M8yPIkgsyXOBGTcR4NVMOxxaYWjc3tzi8aBLEYFV3PHAMG4ff+r7r5f5U8lJ?=
 =?us-ascii?Q?CsTjOZyC9/e8lQIY6dYz6UqLHsw9nk6LTMy2NrTmGawzB9OkrnTIU88nK+5t?=
 =?us-ascii?Q?7uVQzNpKsTvR8KX7hiQtfaO5qyrhiCd3UlH810tAD7kM/4qysACd0uthEzav?=
 =?us-ascii?Q?WXcG1Nup51bxha4jSfLytIdYXK9fjLUuKpNdKeddEJQGvTH1aHpaq2oEDorj?=
X-MS-Exchange-AntiSpam-MessageData-1: wrfHnsPZE4j6lQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f86163-7977-4186-5828-08da37d7ba89
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 07:34:51.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZd2BH1MVn83KyaNniw3c3rmxGxkJmj/2sirwBDyWh32L3ADqcQEQ4e0hxjUyMMu7aZjR+9AfZGmXDsg+ykt0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5749
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 16.05.22 18:40, Sean Young wrote:
> On Mon, May 16, 2022 at 01:00:30PM +0200, Oliver Neukum wrote:
>> On 13.05.22 18:23, Sean Young wrote:
>> Hi!
>>> On Thu, May 12, 2022 at 03:03:21PM +0200, Oliver Neukum wrote:
>>>> No buffer can be embedded inside a descriptor, not even a simple be64.
>>>> Use a separate kmalloc()
>>> This patch needs a tiny change from be64_to_cpu() to be64_to_cpup(), I'=
ve
>>> tested that change with the hardware.
>> Needs? It is certainly not wrong and the subsequent logging will be in t=
he
>> converted order, but need
> It certainly is wrong, and it doesn't compile without it, so yes it does
> need it. The kernel test robot also complained about.
>
>

Hi,

sorry, it seems I forgot a "*". You are right.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

