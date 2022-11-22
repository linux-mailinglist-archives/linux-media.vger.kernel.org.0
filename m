Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D019B633527
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 07:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbiKVGQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 01:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiKVGQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 01:16:51 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150050.outbound.protection.outlook.com [40.107.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA572D776
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 22:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRtcD83OaRqvAP5fMYv/5eAS4GrTgjTPtS9suRTwo/wYTgO+x05DGKRwdSRDmJxt8tN/7y662qvDUpXqCFy+Xi9X9KFvOtt9wkSNFAJbzLx4VgdOiwJzAabkjNgOGDPPR2aN7mHJX/m+hw5agteDfoxZsiArUsYREJkFkhD3rpIjimP+UnUbQjxDvHk9kG852F7/0rPokobkBZyF0T8Qjkmf2cFnrlHe4A4y5F+vGjdv+rwUnBZRKPfWj8UlH9GTxA0sy7PE/grX5J7/cqEY/ye4EGQikxFnBarKfv0K3FfvWp4Iq2kEZPym0g9zjCkGAS/Phc7r5htpBpqAHr8y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWYkcIw2lu4K/ayrUYzhn7hsmLS7TqnW/h9ZOYMdvO8=;
 b=IwpxOzX079B0WW1nl8KBTECozBBt14IIb1y/uH9cr7i054i0frxBgJNuPdN5OXWT+VZnmHLXwiqKbkvhg2tgbMcLsbeRxAI4kxEwuAhJdAb5lOtrxCn3sPROJ05D9xyK5epPl0CFrOQEaLWIjz7SsT3eqw+ai9ac5FeuxvNl3Fk8E5eTva+r4U09NnyHpq/aK9d/jVvq9nUCZ0VC1Ad8p6VbLikcHjCWQ5YIRakmHtdqG6pl10osvxm8ElVLQ5otiw1DQUgCK5aRT0g9p6avA43KHsX0xkFVz+qDWzEQA8Z/aJoicFvHiaFG5aHehho58lY8WUfoLFR5+436LiBQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWYkcIw2lu4K/ayrUYzhn7hsmLS7TqnW/h9ZOYMdvO8=;
 b=KL6/eGY8cid9SP8T2Ls4BAhXgARchkqms6H/djAUpN7bZSJnhhwNxOLK24w9PhqUtDG8IcaX8Tjk30phTZDHaXLvSet0zmTdbFTh+kci2UskTxE5RrPqC9H8mg0UmPC6mfmGUccwfbToKYIHiNOk9G7xlsE91fR1pX9g7eBTMN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by DU2P193MB2002.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 06:16:45 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::2de7:2e9b:189d:d5cf]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::2de7:2e9b:189d:d5cf%2]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 06:16:45 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 00/10] media: ar0521: Add analog gain, rework clock tree
References: <20221104142452.117135-1-jacopo@jmondi.org>
        <20221121174933.fousgbqgmgxvvdmf@uno.localdomain>
Date:   Tue, 22 Nov 2022 07:16:43 +0100
In-Reply-To: <20221121174933.fousgbqgmgxvvdmf@uno.localdomain> (Jacopo Mondi's
        message of "Mon, 21 Nov 2022 18:49:33 +0100")
Message-ID: <m31qpv7buc.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::9) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|DU2P193MB2002:EE_
X-MS-Office365-Filtering-Correlation-Id: e09df10f-616b-486b-a456-08dacc512197
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fr7RFQbLHYbknLE6Iej6ylSyq9ma+wXoRALwaUhMkeKlY63+3a1zJR8YjIf0uLJ3brXDJSexrdDwINOq3xyE5yDJo60IUa7jP4UDWuKmLi+VnzjeHgh+lnbLOI4aqk6KLQp8N5iaLikmOqAXsqQGx2/y2PXpD18KiG/aNLpRYRu2akILJ6/oHbI4mmyB9zlLdFbDdFudxFEAIM84QR0JLy0mY5EnO/dy/WZ5UEvzHByjiGddNB0Hen3IFTmop+cyDYleSgYDVY/7QuPXJ/F7VX0bFW4U2AEhm3saVng0A6IsUOzitcBm1dr9oUUaUTQd73m1GGLh3X5UlFw773CvULEOIC9t/9PgPWQsKurOdaahCnafgzmTarVGyKxtk9dJ8UCAn8v+rc+kUSiYCC92gfBznlpwNRYClGspCMmVkRj8glwfMADQ3dKMLbAn0B+g7i9XLxxQkgKeOD/C087gHq0jZKkd+0DpEdfoPWmUWKuSRKdLCnahrvcYgk2fLUFYxYu7gA9DZ0qJDdHZpzOsCt0/Ae+wcym+yhJHt+SO4sFNBvwHEU8BrPXhcSVtniPH6/MnPwf/wPKjy22fh7uzw7rUa6ZZhLIVzokSAAQOfIxnhsVydv2EVUSj2a0v/RLPWhSBdJmoUuykYAi+DXEAgb6uGQa18wjeZMv2R6xnMYZE7dXtxFVoSktZ505k0rc9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39850400004)(376002)(136003)(451199015)(83170400001)(4744005)(38100700002)(38350700002)(786003)(186003)(54906003)(42882007)(316002)(26005)(6512007)(478600001)(6486002)(52116002)(83380400001)(6916009)(41300700001)(66476007)(4326008)(66556008)(66946007)(6506007)(8676002)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWVrTUx0VEUrc3JwYXZITW9aTmt5ZnlEZE5PKzR6WllVYmt2cjlPbTNRZVJ1?=
 =?utf-8?B?S294MUxQYlczcHRybENPVFVrUWladXd6dkVRc1I4S3hEWlc5SXZtV1ZKZFRQ?=
 =?utf-8?B?dG1iM1NTYXZ5bnhKK3RRZFIrcURhNDBZMGhBaXdLZlNNbkVla05pTzNjb1dr?=
 =?utf-8?B?cHQrR3ZhOFI5NjZhU3RDazBrZ1cxaUV1encyZnh5bk84SzVRSlFMdFQxZU55?=
 =?utf-8?B?RkwxT0J4MEdYRnNuOWp3TGtDb3JYUDNPRTEzVzBvRU5UejhmTnN4VGQ3TnQ2?=
 =?utf-8?B?Nk40QkVMUGlhTFhjbGc4YkpSS1hpUGJCblpJdXNZZnNUU3VBbHNzcE94elZu?=
 =?utf-8?B?bitjcmEvUk1KTzZGbVZDTk9UdEhSWUNVNmFQVlA0Q1lqbFF0TmRoZktjNlE5?=
 =?utf-8?B?SzZPYUJqekgxYzBSOTZmNFdaYjlKaDhHMHpwcVd0N1RNaEpkWUJ1Y2lkZHN1?=
 =?utf-8?B?M2FlU2U4UmxVQTJXMmN4cGJPcVRhQXVUWEdHS0krSmRteFB3dDVGS3pTb1NL?=
 =?utf-8?B?VGpIc3Q2Vmdub2N2OU5rVDdXUDdKdmtkY1hxcDdBVmFnYzFqbXhvaGtoeDVh?=
 =?utf-8?B?NER4K0VYckEzaExKaWYyZ2xHOUZQSVdrNHF2bTI3L0lickFCTEpuakxIOEJ5?=
 =?utf-8?B?R3pDRkVndnlKZC9UTUthY3ZJOEMxVXJzTjFZVXJwQ2dSdU5rZDVhd0tzVFJy?=
 =?utf-8?B?Tks5TFo4THpGUElrdEpIWXZQUEowREJ6YWhxSnNDQXpxVnZPWGNObTg5a1R1?=
 =?utf-8?B?VHNXS3RGa0RPQmtXQURNNUtWb1FvRGJNTlZISXA3MDE1WjEyakxRdTJuWFhH?=
 =?utf-8?B?UUw0aTdSQ0Q5OFF3Zmg0TmlFNTRSNHUvMU5uTmxCSkJCL1dYaU01Qk5XUmdO?=
 =?utf-8?B?cmR4K1NWeG1MSThMWFFqQkJQZzdGMzBGdGVkTUF0Y2N5NHhwRDJrVmNUdWRU?=
 =?utf-8?B?MEYxbEViS3JnNk1SY1N3ZzNMS3hlK3A1NzdEN1B0UGoyaW5ZalVlMXRlZTZq?=
 =?utf-8?B?UmtwbmVqekxNV29pUXNOYlFOTDJoRTNNOEdOckxKQlZiZHRNMDRBOUE2NGZO?=
 =?utf-8?B?REVsYnZOWDEraU1xdFErY0xoWUhKU3dybENzWU14d20xNkt4THYwMllJdEVB?=
 =?utf-8?B?Qk1xYzkzeEJqa0FOZ3VOV3ZFV0Y1UEc1WFdrdjNOb2o5VVNsd3p2NzQ3U1px?=
 =?utf-8?B?dW5kelE0UjB6Uk1zZ2lYa3pTcTJ3VnIyM1YxZlNacUdzMTRqMmkrRUdSd0w1?=
 =?utf-8?B?MlM3MGdHL0RLQ2hYMVV3N05uamtiZWhhb0d3Y3ptcnZBZTJxMFo3N3Era2xp?=
 =?utf-8?B?OUVla2N3aVlxSy9FdXlQdFI3M0MzSzZNNDF6OGVJR3dyM21QOFY3bmp6QU1j?=
 =?utf-8?B?cEFtT2ZwUE5zRmZKTGpEYitLSEZxNVdaK3ByN1FETi9XaU5JQ2I3V1lIVU84?=
 =?utf-8?B?b29YWU53Y1F3c1JHR0doMTVsakxiU3JIWjE1aTdlQ1JjOE9FNjl3ZWQ3UTIx?=
 =?utf-8?B?Wk40a3lFYjJRY1duOW03ZjNNR2FUNGNaM0VUOWtuV3dsOXZxZ0pGNUJ6M2gz?=
 =?utf-8?B?dUV5QlhQcmt6Z1FQRlVNWUtMdXZ5WW5EL2J5L0JYUE9COVB4NkxZa0FmWXpl?=
 =?utf-8?B?bXhQcTBMY3hJdkVsWTU4Zmp1Y3pCak1SNGFVY0pqc0t6WFBMNVNQYVZiNHNa?=
 =?utf-8?B?WFF3NmdQSUF5ay9FbXVpRjl1NmZYUmsvOEpYNm9tQ054SFR3b2p0SGxhNFZK?=
 =?utf-8?B?ait0eEZ4SnlxdmlNOThHQVlKWjlSUHpPMHFqeEp1UWtlUUlhNno5TDlpUlhi?=
 =?utf-8?B?STNlWWtqYkd0MTBOUCtLcTNBbmpuNnZnNEprYTI4SXV6NHZ6L093ZGZ3S3Ir?=
 =?utf-8?B?MkpEMVhsUmtxOTZrN3pNOWFEc1J2WXJkdm1DZ3FCbXo0L3ZDMG9qSmFaNU12?=
 =?utf-8?B?LzVseWZiT3BWa0M5MUpxOEsxREEzZ2FrbGl0Q3RQcG8zU21aTkd1NW1CcVFx?=
 =?utf-8?B?VmxIVTNLMldNR0JoMDZMOVNDc1gvSHd5MTBoOUVNK1NzSStIek95U3RCNDc1?=
 =?utf-8?B?UlgrbWliQWNOamY4M25XTmlMRW9LTGFjSFN0elZ3UDg1MmdGYithVkp5WFFO?=
 =?utf-8?B?cTk1Z3doUC9BbDlMTGlQMkxXRkhranZPVHpaZlh0VGJ4c3RNSzFTUnNJV2dx?=
 =?utf-8?Q?PzLdsXzRg2nS3lM5cxgC/B68NwWDnS0k5+4KvFgR4GG2?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: e09df10f-616b-486b-a456-08dacc512197
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 06:16:45.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Xx9YQZiUCfi5ht0mNfRD3ySYZvex6/QfEwXr3KKyPEo7hskJxv8bUwxDYVoAh3BwkOKWpzab1xLsX8MVSmKGFR1BK3PdzPdCrqQoNJRMhsWINMaOAoXdJDhk12IFCdWDctamTNiuhvuHdSdip9uHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2002
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo and Co.,

Jacopo Mondi <jacopo@jmondi.org> writes:

> I just noticed patch 10/10 was missing.
>
> Now sent in reply to this thread.
>
> While at it, gentle ping to see if this can make it for 6.2 ?

I understand this has been tested on actual hw. I'd like to check how
does it work in my setup as well, but it is currently out of question.
This will eventually happen, though. For now I guess I can
Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
