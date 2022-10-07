Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7790A5F73F1
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 07:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiJGF26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 01:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiJGF2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 01:28:53 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C0E1162E5
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 22:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPItSbStb0Rv9v05fyDLrRYs9nwgE42cpDPq4CIj65ur3eNPRtPIak2FkM5ijCNVfHasglob+SUKHSCk7Yd/vdym1nl15lKeJQeqkTJNvEMKdU7TcvaC9hc1Jegf4FjkEdnHPsozJZH9jgy4jJq70wGbMVhxFWTU1V5xKUdPm7iTlz1stf2WSbd1Gq0ghslWdQao17oW75ykiXpLpEaqExv1Fozz5bctZHtli77xWF4FrvcwkI7IyaH3i+/ml9HuIT2suy62h+1L5Jxmg1MAnN3tLRWE/tDrihwHaqW7J1SiGfFSG1PuxDYndNJOzXYTY3i7SL5gGFZ8Y077IwQ4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmWY3O05NtBDFO8kurm6VI4DBHZI+PSfZqezfN4k+Z0=;
 b=ZC83QI/M30ODRCqGl6q1dG9faCJ1FTbleC2/jTKPObm37zHM+BeKjSrNkCcU7W5whDuiB+o8PA2yicbmQcCTdGezNl3A67bF/6nsgwBn0KIHSGPZuKIo7Ux9NSldQfCLM5brOTIgpNZpKe4mJF+x0RL25poEAFSM6goOZ1suT87ghXh7rF4Y3f5jfpDKLeNAS8prZus2kDy1KFqWpnYRAANom+PAnvAXfTrylGp9FkniANzhhPX2pTAnvi+gw2EYGjodQw27f61D0bbkr0LpkkDIiLVBQNmdopimR9nQYxpPoq5YgxioXl58k8O3osEvbpOuzY7IFoa8RCyZZQRGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmWY3O05NtBDFO8kurm6VI4DBHZI+PSfZqezfN4k+Z0=;
 b=y/SnjMZmk5oaNH1FjREPCj3jA/lZSzPybuNxzi0O+abT5Udq227KnUoShLkTRN4M0unfcPw3257L9kcM7ycOk5mb6gk89XdRG5cjpPsRcvPetNU9UGxS27gWyWS2EKPOxrix9eC/HkTxdn8tElsJodhi3h+YRoRaaW63vkxT9+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by AM8P193MB0932.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 05:28:48 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 05:28:47 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-3-jacopo@jmondi.org>
        <CAPY8ntB48837t+UN_6k5DJ6QBJvgz0Ohc4w4=7044amrdCy1=A@mail.gmail.com>
        <20221006150015.7p7qlab4dbaldnsg@uno.localdomain>
        <Yz7u0LT2kwhyhc8x@pendragon.ideasonboard.com>
Date:   Fri, 07 Oct 2022 07:28:46 +0200
In-Reply-To: <Yz7u0LT2kwhyhc8x@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Thu, 6 Oct 2022 18:05:52 +0300")
Message-ID: <m3wn9c5hip.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0289.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::29) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|AM8P193MB0932:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3f4a4a-30ec-4cdb-f869-08daa824cf61
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vhzqwCCRyIKxyYXta4lnju7S304whCSbenGK9oRyWOS+NDZcwMPY5QKIbfh1fIcanDV2NN1XiGW0lfvzdqzFuyG2sCz1muvs7cYiYJY3vSPVHogcY1kefuDJFcEtuOXhyoPvdfM67vG6qRzs7bTpKAMS8MOI5nTZ3NSqZNO25aLktpaIJS5VOIyIPbXgCP0+sjaaWb9HgdmdLH1su5mdUP3TEH5/RLXsI3CdjrS9G8Os99MXL0nzp3uE6tRpOnV1ZhTHF3nDviQ2PiJYWpsLlKgB7RYLkpgUCxf9y/F3XZHzlDCNUZ7xy2nq2wRoxqDR6Os9vnPT1hxrNaEmS/dB8YN96tzrzP39d3sQx/UTeb1GIidz3VUQBF/KTimZJd0oKTY6fMjzb3Gtu40eOp7Rl21nZuZQR92sYQ+Fa1TzvER4678NnTV7VTGWbaMiuB2diqLkksIMiuf/Rmfl/bLVbwZh2O01v3ZXNDaXYqu3xWaXShLIqqfYbJpeH6EhYKjOU0ffpY70b2dIPQf6NOvWnE4tuv1z+5z92m4+FPlsq5eNxlD8cBadnKOXAoGFsIKj7ZKDHZMa1aRBvveSU4EqQ1yG+LYmKv2fG9RSuOIt5c2dcF48b+bfifao23RU9x/0SmatFxvtyraHjn2f5nyxPFr2IRfSvFT/vHSHy76pIiZXA0Aed+Op/Y7Y06Mk/11QLzRqNPdh3qo5HhxjTjr3qOMbOJ22D7a5FpHZ8noj6K1o1LcvmnSHFiVBvHRVItQp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(396003)(376002)(136003)(346002)(451199015)(38350700002)(4326008)(8676002)(66476007)(66946007)(66556008)(38100700002)(2906002)(41300700001)(8936002)(5660300002)(83170400001)(186003)(6486002)(42882007)(478600001)(6506007)(52116002)(4744005)(6512007)(26005)(316002)(6916009)(786003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzcvMmR4Qksrbi9OMkNwcWNJbVByb3E2ZXdiUjBaZzB3emhvNGxLSWZ4a2dw?=
 =?utf-8?B?TTBkbjZkVnQrS2Ztc2pGcVNDNUpYNmxvbHNHSlpybDYvUnhBK0F2THVuQUlN?=
 =?utf-8?B?TEd0QXJtbmdIVncvZHRneFB0dy83YlJMVS94SVpHellaakd1UzVQOTdJL3FG?=
 =?utf-8?B?THVqMVhodG1jMFlFVUFQZHJRdFVUNHFXZXNsaVI2TnJBV0lQS3RIRmM1cTNE?=
 =?utf-8?B?WXRlejVTWVFnRGthWCthYXBNVENvbzh6YUlPc3NWS3ZEY0RHei95TkR3ZGpm?=
 =?utf-8?B?QlE0dHprUTBPbXdrVloza0xvNCtUUC9scWpPdGFDN1VYYUZPWVprcWpUcmcv?=
 =?utf-8?B?aVVsaEQ3eFJZamlmNWpPemlnOCttWDVHQ1gxM1RwcmFjLy9vY2JZTFZWdzI2?=
 =?utf-8?B?UE56YnRBZ09aakpnaklSVjFKa0Y1WDhqYW5ZWXFoTTVrYS9LdkhVUisxb2Z1?=
 =?utf-8?B?L3gyRkc3MmVveGJEMjY4TkpPTHRTNGhISjFKUkdKMXErL2tUbVJJaUFiQnZB?=
 =?utf-8?B?SnZxZzlybCtET25XNkVEek12MUJMNXFHOUJ0R1B5YjhjRVZNRzhFUGNCTkgz?=
 =?utf-8?B?Ukd2Yk85dS9KRzQwdVd4TlJTRkFaNnNHWTBzVXg0cDIwSHJ6RmxmNVcrb3c5?=
 =?utf-8?B?dlp4cVFvNXJUdU10MU9DSzY0UzdSZlZ2NUJiV05iMkZLMUlZN3o2Y1FoMm53?=
 =?utf-8?B?RmVUaWVaUjZpVDlmaHFkOFF0Q0hnY3ljK0l5bW5heHR2dml2SzlYbjhXQ1Yz?=
 =?utf-8?B?bHpJTzV3TGc2QldjczdNemo0Nmp5SWxLWU1zd3BqZm5aNVVQWGxaM3kvTlN6?=
 =?utf-8?B?RXJOOUpQRnBtK05MR1ptWXZiTklCMlg4VWZNSWNnWlV1aklLOVM3VnN0ME9N?=
 =?utf-8?B?MFNuOTlxT2g4UHhLaFFURHVuRzR6NG9FZXFEdmU1aWJWMDlHK0RxQzNNbGFl?=
 =?utf-8?B?Qk5EVkpNRDV5VVhNSUErdWZOKzVtR09XRnpLMWFnbElPQTZSVCs5enQyQmQw?=
 =?utf-8?B?U1VPMzdzY29vbDlRc1V1ajBYRndkV1ZPc2xCMmN5eTZLYlJmYWJkT0xuV2Q3?=
 =?utf-8?B?aG50eGkzU0I5SFVPUkdjZ05ETEl0NjZCbG80ZkV1TndVLy9IREJDUEd2czZ3?=
 =?utf-8?B?aVBPdjlpZlZoMXI4ZStTUklNY1VQMHo5SzB0NUgxalNMTE9TU0V6N3UyVW9I?=
 =?utf-8?B?d1MzRGFwZytHUHFrZi83a29OZGxaY2gvbCsvMFZjTGtlZEZFRFFxZDJ0VnhV?=
 =?utf-8?B?M0lWNjZqWkliME9UYU9NaEJwY2FtTFozakxHeVVmbGFEdkpwQkJlaUcwbndn?=
 =?utf-8?B?MDdhK3ZRSnN5blR6WlVWeW5YdSt2SElNaWJXY3puUkdGZGhuNWs3QVEvRVNB?=
 =?utf-8?B?Y25ZcDVkc3JkUUdsSzlMS0cySE51Si91dDBPdWJ5UVdCTW9KQ0p6VlFUWTlv?=
 =?utf-8?B?b2hEZ0JBNlZiNWIwWjZpbGtyMkEvdno5dm02M01IMVVWc1NkN2RRb2dYR3FE?=
 =?utf-8?B?SlZlMGljQzdyZFFYNUlpek1rcURBRlROZVlHWnFwaXNEWnlyNEpIcmJPNG1i?=
 =?utf-8?B?VW9aT3NielFIVzRaaitadE1lZ0JlY2svT2ZLUThpdnVXSko0eHRGYlF4b09N?=
 =?utf-8?B?RVl1WXFlN0pEUlRmZkdxU09NNHZMOC9TeTdKeWowRHUzVlhvY2hOQjdPemhk?=
 =?utf-8?B?NGlmR3I2SHNCUkNNVUNFM3dEM0dNZkpWdHZQak5tTlViSWVuNVNWR3p1amJQ?=
 =?utf-8?B?K3RQRldoZ0JUTUxOS1RkZTk1SkJSS2ZGQmhFMlQ4UDlkQklLZnprNTZ1Y2Jq?=
 =?utf-8?B?YXdNUElnNVYzR3hGRzJNZjRoSDhkSGVhRHlDQ05lS0lsVlVZTWhsRjdHSkcz?=
 =?utf-8?B?eis1dW55ZGVsSXNiN2JacW1pTDFKMCtwNndtaG0rMUtLbjdUblpUbENWWTRo?=
 =?utf-8?B?SlMwSUdKcHBsc09YdWxqUlJwNEN5bDh3ekJKT3hrZk1aN3I4cytwU1ljOGM4?=
 =?utf-8?B?eGFNYU4xaFhZYWFjNXQybGVldWplNWRuYVJIMzhOWTJrK2x0WHYyUzN5YkN5?=
 =?utf-8?B?di9ENFRHeUVFQmp1cWY1Ui91UjhRWGdOaVd1TlMxK1ZHOTJVdGpIczlCMW4z?=
 =?utf-8?B?eUV4S1hUcHZhSTZZZys0QmxZS1ZvcUFNa05FUElYQ2pBVlJLbDRjbjVKYXJ3?=
 =?utf-8?Q?dyEi0oVxn1EXJb7qKj0zFJpacm/kuxnQCZx8kecfr9+z?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3f4a4a-30ec-4cdb-f869-08daa824cf61
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 05:28:47.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKDs18Ac18QLcO/1+i9fjAiOrZRyKbhO6iTZymPT4JJGpE/loY04jL54ikOzr2yUdG5lCcNTlkam+XvUGJ2sHuLer152QOqfrVDDgjBSIFin/bkbSLroZwcf+lDEX5qkqbVtiflIigRmGbQ/bWxtyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB0932
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> I'm tempted to drop support for the colour gains really, and turn the
> V4L2_CID_GAIN into V4L2_CID_DIGITAL_GAIN. Digital colour gains can still
> be useful on platforms that have no ISP, but I think we need an array of
> gains in that case, not abusing V4L2_CID_RED_BALANCE and
> V4L2_CID_BLUE_BALANCE. Any objection ?

I'm fine with spliting it into analog/digital as long as there is a way
to set individual R/G/B (digital) gain values.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
