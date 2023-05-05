Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2336F86C9
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 18:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbjEEQdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 12:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbjEEQdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 12:33:24 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2039.outbound.protection.outlook.com [40.92.98.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C597118FF4
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 09:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJxswzdLfXZKM50diugjdUc7rH7Lxyo96X8cyS2VevQfYJfkB//8knxSZjnKutYo1SLcOFv1JPVi91m9UXdzOQFPGycfjOl75rYyVYts5MPFh18RnIcrO2Jm34sFd6hxodxgADcs4JmtNzJn9cb8QA/aaMHcHj+18YHNdPWlup1RI56LM3P2Fz6m2G63vtmDfyRt4Ik/0LWnUORza+jC27EJeb2YJhl4m4959T2l0padh4l6TsSKwa4+16PMsQCeIUaubdZLHrEWeDRvU3mlau4LdXIBjQm72jHsHstpcIJcbpLGXkG9QCjiKa6tMIgeCrfZnCr/QeENeIIqoBmAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l70l+YlSHOANlI1ic3f0EpCK6FoE/pXRci9XK/DXRHc=;
 b=hpTA23iUilO8HT9NVQ48HncdDtTdhySFHzZZdlemf9V3+qPeKT8cH0RDXLwQolXew2THjQ4zjecivyNwFbaJOejzJFKKgERDMBTQ6XaSQkx8BUfhAqdvZ0HlslTuPgXmO1XhS4x0T4mGshjhhREGO0qDy8dxtU+YfjQ/89P8XxTm5g50nnmgytNQvtg1yD8b4BeC9+yEw3Osaz3Xi9WI3nW7UfC65pqB5ZGX3z0uQFdE+uu22RfDwFsWLbVLIB0VgunWx6QUUTeknc2Hlzx/3/k5ct1yfZemUmoRy7VDlWz6CyqIncMAqRo7nuXsGUQgkJPmMJOrbhTLb2B2qeOlkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l70l+YlSHOANlI1ic3f0EpCK6FoE/pXRci9XK/DXRHc=;
 b=MOSkz5kcFdb+wjRRm2BfSXMOz2Fb2BmsreKZ9f9g7z7w0NABl4ZM0KPbGMtXz4+6xI2yIU7AI+MhKJuOq9DR10UoOCjVHuX4MFUbqxMug/B2ex+Y/a3lIY+sgjp/6FeFnYJO0TiZvvQ+ThOeifU3Uxh2Is0npd3arzuyfVhCyuPUhk+ZIVhMPuiMNPKAZmLtzXFh7VtLFpNfGizLvW3JezF3tu75ZeoSCvE4lRH8/9m+2wgaNAW9CwY1j+qNzoB1dapheiiMR7LX8U0wjNzipsZgrYYLWF3+hVSGilUH+NaQ0Uqdzi/VGkBFW9U/v0DIQtPFBdkOIUyoWXdFz/4HgA==
Received: from TY3P286MB2886.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:311::6)
 by TY3P286MB3515.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 16:33:18 +0000
Received: from TY3P286MB2886.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc81:7c1f:480d:d0d3]) by TY3P286MB2886.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc81:7c1f:480d:d0d3%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 16:33:18 +0000
Message-ID: <TY3P286MB2886879B6489BA89D9CD6B78A3729@TY3P286MB2886.JPNP286.PROD.OUTLOOK.COM>
Date:   Sat, 6 May 2023 00:33:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To:     andrzej.p@collabora.com
Cc:     ezequiel@vanguardiasur.com.ar, heiko@sntech.de,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, p.zabel@pengutronix.de
References: <20230309125651.23911-3-andrzej.p@collabora.com>
Subject: Re: [RFC 2/2] media: rkvdec: Add VP8 encoder
Content-Language: en-US
From:   guan wentao <otgwt@outlook.com>
In-Reply-To: <20230309125651.23911-3-andrzej.p@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN:  [tBBFBEeFsjHgkBvDk5Upvx/V4SqNSJ7z]
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To TY3P286MB2886.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:311::6)
X-Microsoft-Original-Message-ID: <0dc6f024-35ea-3426-627e-8b4554b59610@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2886:EE_|TY3P286MB3515:EE_
X-MS-Office365-Filtering-Correlation-Id: 971e8dfb-5038-4859-b298-08db4d866ebc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F28LcA78yALoVaA/ypjgyR8mmMSPHIjMuYGCNJ+G2dkk72Kl3pTFRFIG62eEeCv9hGRCrsQLAE4XDTUkgSnpKF3fkw9nsPYwc19juNinQcrBSxXHDu24knVKNxLhlVBQHoXsbkIt0WZlA55Zz82I9LnHDrOv+zuPJ9BMhALYAhB9i6ktKbg1nCOfCD57R4wYCnZaqyOMZas5kDEjBv6RwbnEO18gaSRyjP6tuqVBtSoEYGeYXpDd1vOOXP8T2TYgKNZ1PTPzwhViA1RWhPo2O7++qZ6QG4GTbRM6UPOkGXlsRl+sBYgLSCoD8/l37iZPSsRvNc52h7+fq/DNgMR+0w1dnIxZyKT/p5vwCE6SxDBeKTtvhRWVNA0lHrLq8cjt/8oX/dIC0XvHVYKkTl042eOu1Zt6fc+EiCVf0tyM284qxN4Z6EeUVVq8N2nlUv+0Kwmr+P/2GhjknwouLtERgEb3dL6b5Ao0OXwdiv63uQbLvx+zmCPrs0O8CCeF+XZaluuM/h/qk1iPb40ALi6l42aeP87rHTgbrXBR3LTEQNPeTZV6zDm6auHiB9QnPBe+Djf+PWC6v4OQCQ30u2fe50hJG6h/1wkCybgJz9RtKG0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzBUSWlpL0JBVnNjZ2x1YVpkb3pUd2dQWTYwK0NPVWRrU2dtK1dYNkl6aE5F?=
 =?utf-8?B?dFBXQVJvL0Y1RXFGL0l3VnZnZEl1NGVDN2Z3TjloeUU4WGRXd0hIaW82RWdZ?=
 =?utf-8?B?QXpXYzdQN2o2VG1qNnVMMFUxQU1TSEF3L0p2WVI3SHlQL0hnaUtmWk12UER3?=
 =?utf-8?B?ZXlKNjlsaU5QTXZYTC9XZkZqeGYrYzJ4ZGtkZWc1QVpTZ3ZYeFhzQ2psRGcw?=
 =?utf-8?B?QWVVOW9Dek03Mlo3bUxOVkc4ekxXYzljNVNYNFNwc1lGZ1B4aXk4L0pyVmor?=
 =?utf-8?B?RDJ5bTg0S09TdlZSUTVtOHYrQ2d2K2J3b2xZRGh4N2QwMUtSNjZXV1ZSUFFI?=
 =?utf-8?B?QUhPaSsvWmFsUnVuM2ZRNHRLVnhsdXJ2cllZZFVJSFhseTI4cWpTYkQzR01r?=
 =?utf-8?B?VUhoYTl5SDNDVmhnVEREZDNWUy9sQjJWRWc4cVhSenQvNm11aG1VZXVWZy95?=
 =?utf-8?B?ekVKaVcwdFFMZnBhL2RqbjdVbS8zYTQzbWJoUUtiOVlCcEE1UkV2dE9lUTh6?=
 =?utf-8?B?dU9YU2JNRlNvdEQ2NlpoMXpqL0g3SzExdFZITXJia2ZlWkdnN1J6MjJQZzhs?=
 =?utf-8?B?cEoxOUdxMG90dnQ3M1BieVF4QjFLMy9oOElzdmdBdDFpbzBLQTZxeFVNZk1k?=
 =?utf-8?B?N1o0QWhLSnRyNUxnVXJ2U3BBYkRNcGwyRXNiUWlTc2NWeEtMZzNaYmlpZ3U1?=
 =?utf-8?B?WXFtV3djRGJxRjZkSlppbm9LOXZkSjNVSDlHWldCQUFlMzZEUk1qdks2Ry9x?=
 =?utf-8?B?QTZpR2E2eDRUY2hHYjV1Y0t2MUxLMXpUQ0EyYzVtMUoxV2xlL1Yxb1RXR0tS?=
 =?utf-8?B?c2dYRlJldmVPa0g0Y1h0dkRyRnVwNExmN2lQTlJXZllsMlkzZUswaTVUQXNl?=
 =?utf-8?B?dGM2ZVdPWUZYcENQTnFqWElPN0NYdnNwem85K1JveDB1c1NJNGdPdUltZ1BD?=
 =?utf-8?B?TWFMVm83emc1SCtWUmQ0VFJqaWlub1ZiK0xURSt3Y2taWC9KSy9BaUVrUE5F?=
 =?utf-8?B?Ylo5TUJBM0NwWklEWXQ3Tk5mYVlTenlIbVdsUnFPM29YZW5QY1VWU0xaVmk0?=
 =?utf-8?B?NXBNMUNuQTVsZnV5SUpmOTJ3dXROSzYvU1F5eDhZZkV1Y3h3SE9nS2xLTXAv?=
 =?utf-8?B?WEdkNmZ2OWJnSUR4bEdMNWVNRDNKRjFXeDFuZUF4MnErZUNaV1RzaFlRNmMw?=
 =?utf-8?B?SVJIN09nYmdjOWlYN0IwYnhXTVEwNlJySFVlN3ZIQjdFNUk3elJaUHBqdmd0?=
 =?utf-8?B?b1JGbm1pWUp1Tms3c1BNMUxqWmcvbUsyUUZ2K21zZ0JNajRUT3BZdTdVY3Zu?=
 =?utf-8?B?aDgxeXRqOXltZWZUZTd2cGxnc3kwRW1jL3FBbFpBNSsyMFJwSU1hUGx3amhQ?=
 =?utf-8?B?RXB4LzVWSU1ZZW9MelJ3ejNpM3d1eHFCSlJTcmw3YTg3M0NHcDBlMDFZQ21t?=
 =?utf-8?B?clA2NnpyR2RBQkRiWVMvdVAwN0x5OGQwdFc1VXd3ZW85UW9jWHZVWWphckxx?=
 =?utf-8?B?d2YrOTVWMTZiajFpUEZtMkJZL1hrcXdpQWZwSW9mczVwSzhrb0NNWGI4Umxu?=
 =?utf-8?B?Y1Z5Q0FCRC8veDNUTW5NZzQ1UTZMVHlNcWYwN25ubkw2Y1VPYXFPR2o1QzZP?=
 =?utf-8?B?QVVTdi9Bbml3YWY0akpqUlJWcE4zUmc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971e8dfb-5038-4859-b298-08db4d866ebc
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2886.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 16:33:18.3557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3515
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SORTED_RECIPS,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej,when I looked at this func:

> +static void rockchip_vpu2_vp8_enc_update_entropy(struct hantro_ctx *ctx)


> +				for (l = 2; l--;) {
> +					old_p = entropy->coeff_prob[i][j][k][l];
> +					old_p = coeff_update_prob[i][j][k][l];
> +

The second "old_p" in "old_p = coeff_update_prob[i][j][k][l];" is very strange,
it may be "upd_p", and it is broken 5 years in
https://github.com/rockchip-linux/mpp/blob/develop/mpp/hal/vpu/vp8e/hal_vp8e_entropy.c

Best Regards
guan wentao

