Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 028D35F73F6
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 07:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJGFdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 01:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiJGFdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 01:33:09 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150078.outbound.protection.outlook.com [40.107.15.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05F8C90C9
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 22:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRUPqywRZyFDBojLd4XjpbnJitr1ShAU5w7lOq3sX9XZpsfgNRVwArQFU828vutBJ8pbO384fUPE4DbkohColw2i9/akoaKqKwHRK08OvzwddFxkbisrR2bJ2eumywgCXOh08poic+8HonlNjuFHqXWgX5fiBsw4Dzqg0dqe84qhMVjnEHpkfrh4PKrzxIOYWsofH+PfuNsPyvHDnL94Bw7Qe/sMBT8oQZ0KA+lxj2UXUTbf4c9qm7GzR9GSQrVTJUp7XAOU18EzYAZlyhJdWU3z+q6Sb/YQH3eItzC5Az3XZdJpcFp8Gia3RHCowi6iTHOdjPURtI5KE6ISn442qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+5kxpC2fUFnIalwq52c6CTnibt5KbY9jv77J6zoGUo=;
 b=DBxgh+q9K9WAWzJq99ZUyRyjhu5ZPkl/qGGOzgrUmk9phAGU4+UvjZ3X3mYeNT/Sxp81C+eisaLdalL1JtzlzDCCT8Zi1/9OA6irLlsyoUtqsj/N8hTba//9oEPEOWpeu+V165ncLCoWTU2y6SV0MhNrt9Ca2onw9NHWQ5K511drAiRm1wpzfoYAd7JKwVdIIVCTaw+lm/t0m/jRSe4fKuS/awkN6zQR5bgyzJEtDTGE4JD96y4INTEOwQItOUAvHVONw9wjrO+ep/9/pQ1pWMD8tRiLcbbnuM/jLe9rb/3K6BB3WjJOKZqUR+apin9Ijb3x2oebMJlaqStKSDdQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+5kxpC2fUFnIalwq52c6CTnibt5KbY9jv77J6zoGUo=;
 b=jcM/nwYcCyZGsN7HEWkKF/6uNzCPy/GyxYS1lyiIc1fgQL5/7kAYGOXmRvAIcAIU165SA9M0mvC3tmC4qZFsEQagBV1LoSzdl4FYO5QTMSWK9t0B61ob+tsGiNMVqa4AaBsjA73RES473692Gt/VNWJRwZcgS/ncxBPj7Im47PA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by GV1P193MB2359.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 05:33:06 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 05:33:05 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 03/10] media: ar0521: Set maximum resolution to 2592x1944
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-4-jacopo@jmondi.org>
Date:   Fri, 07 Oct 2022 07:33:04 +0200
In-Reply-To: <20221005190613.394277-4-jacopo@jmondi.org> (Jacopo Mondi's
        message of "Wed, 5 Oct 2022 21:06:06 +0200")
Message-ID: <m3mta85hbj.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|GV1P193MB2359:EE_
X-MS-Office365-Filtering-Correlation-Id: e52f3ba0-01f2-48fb-8716-08daa825692d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eolNeTc3Rw5M1/tFvRQV91cmnneraD9PFjyJO+2tjP8qMtNofJ7+wSyhWV5obTlNjCsXcd6azcSq6F0hXOfdcn+mnjK0LrF3ylbu2toJSyDdjGYCIYr+Yex78oNDVp8LU0OM5zeJOQWf8FNq2yEe2R6uGpVSVkCQB3DZrh/0mxQGuqalvjtgajrABDVHSxbYVXsaACrAx/EGaN3xEYJr0k3hTZIcpZGM7vk686NGiOD8onghNUf6gGMxmyAkJoL5jbNhbDhA8NYoLFkTtYJtmJjmj7/2e1bgc/6If+hgVZ7Iu7lyFl4Up/Vyz5VeUQgrbTaCrmF7D1+Z8RHSKyubbdhgcTgzuVWZISEza8Rkj0sdSV/ObSNZz16ZsYxcOswIRMKVb0g7nWreymmBscvgfkrluvTYhIKMBqsMjXLAxxM8SZQ7Q/22wksDYt/3qR5mv93kxD+Nf97EpyTOngs6Iss0thA+v60RbBtA0HOtRXtDx+oaOEDoI9xKrTx6/+9GPAjH9+C+LMTAoBVt284Z2RDS0hkzO8s2HlGF/SypzoBwULxIhax9Y9Uhr5Sh6SkjVq/Z5Cm6j6GNnx5Ur/BpXF7DfCkiATcwEaoQHu4FO4P+YqT2h/dYewg/0utUQDgwqZR0SuWKTY32H45IWA2SB1EgjrfF9lTzXnhY5t5Yo8SnggzXGVOlpCiZ5sMwbNfRGirbTUgOzUD4kP1pI7krzLn9dJAFyjZy5QD9pGiGgKwih9CZK4JEuBBfln98Xhw482Ilh4Ni1az6ytnAZh+bJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39850400004)(396003)(376002)(136003)(451199015)(66574015)(42882007)(83380400001)(83170400001)(38100700002)(38350700002)(66556008)(66946007)(66476007)(4326008)(8676002)(786003)(6916009)(316002)(54906003)(4744005)(2906002)(41300700001)(5660300002)(8936002)(186003)(52116002)(26005)(6506007)(6512007)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFNGSFRSRyt0NUZBc3dNdXdDVnltcGE2RVVMWmQxMmlranF1ZjNaQ0sxNG8v?=
 =?utf-8?B?YXQwSkNERk15TG9aUFVSeGh6dUZpTU5LWGVDVDJ5WHNGNTFIamVxT21IVXdS?=
 =?utf-8?B?ajRYdFcra2tSSmVoa3VCbzlaVWpNWFFzYTZpK3hLQkFad3llVDUyempnelFV?=
 =?utf-8?B?RnFzUm9LUDJqS1Y2VnhyYkpFbDZ4TkF2MGs0RGdZcTJRNVQxNnZPT21ZYjJk?=
 =?utf-8?B?eVNJWkEvMzFGdEdYRkpSdm4zdlVpVW5FY0hpQld3cmJwcTNYd08rZ28zSVlT?=
 =?utf-8?B?bGZjMEQ2OFM5VDJzZHF3Q0xOMjY4di9oZjlDakFCZE5tZy9FSEUvVXRaMG5E?=
 =?utf-8?B?aDZGNmp0dHViWTJOZXAvQ1pOMWhCZElVSy9ybGNwUFBmbDRTQjdYc3g2eWRX?=
 =?utf-8?B?ZFh6VmJ3V1hoUC9LNzJ5NXRnOHc1NWYwWTg0dWUxZG1MWmc1dzZwWCtyL25Q?=
 =?utf-8?B?NmIvc01PajhVSHl0Ujc5VnFLVjBVMVp2VW5YWFkxcXN0a2NBVHBMd2d6Y0t2?=
 =?utf-8?B?YlBzSVNXY1VydERGK1RraGxzR0dzdlF6cXdOMGVFa0liVVAyR2g0bUY1OXU2?=
 =?utf-8?B?L3BhWk5GNkhFYnFxVkgwMUNyREJJelRkMm8vTUd5bDdxbmEyYll0cWZLa0g5?=
 =?utf-8?B?REMwZ1BUNFVGUlY2QlpyZTdWV2FNQ2JGVEEraEx2dkNzZlozbGJPRW5Cc2ho?=
 =?utf-8?B?SEozdGJId2hQWlRUMGRma2M3KzRGcTlXWjhTd2VaUy9jYlUvMExLTVUwalNq?=
 =?utf-8?B?NzE0OWRvU1VYM3kwU1NOckRUUUFCd3VVTVhaTG5NTkp6YzlmZW56SEJmcGNn?=
 =?utf-8?B?SzdoUytxY3ZOWTJSMkIrc2cvcThrQVdMU3MwdDNaTzIweG1VRDIvZWk5YmhD?=
 =?utf-8?B?Z0VEYVZmQ3hLYlp3THl4Mm5jalZRUXU4MEVYNXR6Q1hzaW43TlBJcWxqL0hk?=
 =?utf-8?B?ZXR5Z3JvNGY5ODRBbTh2a0hUbit1YW95MzcyblN0Z0FnWW5kOENuLy9OUlg5?=
 =?utf-8?B?ZlE5cFh5bFhrT2VaSXdRdFFnK1EzMVl4Q0Z3V1VwV1FGbnFjKzRMTW44NWgv?=
 =?utf-8?B?c2FyZXpHSzd6MnlEaHRpZVlKS1g3YnFDMFJhY2tPdGRScnVML3htdURzYVg1?=
 =?utf-8?B?NytrY0p1Sk9zZ3hVNytFbFErQllJY0VVRW1HU3l6YlRpRzBxQ3hESlF3aU1p?=
 =?utf-8?B?QTB4WTR1Y2VuRkJiaXJSN3NLeUQ5aXpSSW10TXZHZWJ5UFdaVjYxSEpzU2wr?=
 =?utf-8?B?VTcwdDBxejMrek51N3RodFpvWHZMQ1daVjRxUkUzTTVzVWtOVGlDNTYrcmdx?=
 =?utf-8?B?UWZoczE5ZnZsR2h5YnJsVkpXYkRWSWRpdUdjb3p2VVB3c0xFbHFDYjlENUpk?=
 =?utf-8?B?SWU1UlAwRndKVkRoN0JvWUJXY3Vkc1J6eTUwblNnSyt1SHJsdWV1SC9NMXRs?=
 =?utf-8?B?MFZuclg1Rng5dWp6UE5mOHV2bEhBY254ckxMdXkxUHdHSncvRTZQeU1ieVFY?=
 =?utf-8?B?ZldSN0x6K2pkaStqd1VjTnA3R3VjOUIvZkNNYnZPRTBvMDA5S3Ria1RHajF2?=
 =?utf-8?B?alZTZHZBVk9PTDBhdnB6enQyQXN3OUJhN2NzWlJxd2Q2VklFTFVCcXFtc2pP?=
 =?utf-8?B?bWIxRDQ0SmU1L2xOTEdyYW9pQ2NGZTgrbEFaU2svQW5CdTNBcWVPNWFVZUZE?=
 =?utf-8?B?Q3JwdkFzV1pKT0pmbGtEZHc5SFk5TDF2d2VwelU2TTM1Sk0zdmxBNmNuL2g2?=
 =?utf-8?B?V0hzOVgwTzMyQkhpU2NrUmxGUjdOM1JGOTNUVERjbDZCdW9LOHVLNCtVeU1L?=
 =?utf-8?B?YTJaNllvNTFLUjNIOWYweGFSMUxaTGkzVU5IRjRzUk5pQXo2QXM1N3h0YW5a?=
 =?utf-8?B?UmFWeVExbEdZMTIxb2hTeXVBMW9GR0lVYkxtOVRoY1VCeXEvSDVkb09BQkNW?=
 =?utf-8?B?OG1HclhVMENYYzV6YmRMMXA1eWtBZllQQUZUSVMwelFzQnRLSGVxdXlnQmRP?=
 =?utf-8?B?Ym9yMFNEdExKMDVQaFhieE1TL1hEMzRNNzlxZFBrdDZ1WWs0SWF1TmdveDBu?=
 =?utf-8?B?TmcrampZK2FFRWVKdEY1Yjh3V2hFWmhvWE1Pak1HNHdsalE2aUFrZDRoUnVT?=
 =?utf-8?B?cUVQYnNsTUw1eGIxR2o4NSthbWNZTGZya040blZjNkZZRjBqYnJJR3E3by82?=
 =?utf-8?Q?yhKzKJRCg57VgNz1N8p3nLXaT73h5hsmevGJDMv3ZKtv?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: e52f3ba0-01f2-48fb-8716-08daa825692d
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 05:33:05.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCrIwwEKe3S9bcK+BSZMHYQ/kqmMbutyCeNYtdsMW0n9iOapqHlRDVUBSBY5mY2zdY9tdpkeqZMbxT6UzFYjtfMLgDtFy4reaDoTLEyyPSQFav5fsIukKqJpZ9GEBJ7JsBuN/h4baVtnFIp1St/NYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2359
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> writes:

> Change the largest visibile resolution to 2592x1944, which corresponds
> to the active pixel array area size. Take into account the horizontal
> and vertical limits when programming the visible sizes to skip
> dummy/inactive pixels.

I will need to test this, I don't remember the larger limits to
be causing any problems, but it was 5 years ago.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
