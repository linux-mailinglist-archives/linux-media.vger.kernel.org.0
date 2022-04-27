Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE2551164B
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 13:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbiD0K6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 06:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbiD0K6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 06:58:51 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8607C1E2711
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 03:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1651056609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=e5SioH9kFg+TUOjxJBDD486kqHi4eCH/OWKjykG4iW0=;
        b=WzsHFCCS7vJH7HjGNw2iXwYYzZY4FI3Ep5+nVzsZy0yyPcdvMkOb/BZQ+0aHx3LvbS7Rq6
        IQqOqmuMTRvtqjLryVwqC89SXhSm/EMKNP+VyYIbtt/bczTtYH28U0BtA2MM/TAYk7Wz0J
        N1lb8rvMWyxkFlOkk1eEu37Ds9XZ0QE=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-1rjqxti4OFKak0l0eVeJ_Q-1; Wed, 27 Apr 2022 11:34:29 +0200
X-MC-Unique: 1rjqxti4OFKak0l0eVeJ_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMem+Zk2lNMm/p4CR+CqwGQud222RDur60IaisoKWsM3Bt3CjQ70QUr8/Xp6PNbuHqIpu0wubu6rOcu+cCZtieE+Vctid7a1WBiMif3l6DS8w8OABsw7ljqJCbnFrJ2PwmOPgceHBodLDurTnOQNwoCSC0OT9n2s2vXZN7coXKkNz6QhmOuf9Q5RqE4GS42bS8pFYWguPXWdF0c66rB9ll206tGXWM7eOwDw8PDty2bmEmn6C2mIDcvW7fRJFFOi3qZccAsn0u4hcVfv8/xy2h7PanDh77ZW9uaU9lTfhpFZdxdUvT5Qk4LC0jaBFXfn6E2VjROlnEb/VzW0EIhesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z25+0OmV3Yra1Y4Rpl1/4oIjzYL7e7B2lbx9SQ9Pq8U=;
 b=hMEpS99AzMB4TBLYycA2HqH1r1UWCzcaJnrodR3la7XtsWkoVanQuVDkr/w+ncb5mLuuBirhEVya+ycXnw7+rmpAwSPjM6UtmfuxoTrcWAScylH20y14/eOvCH6G1EZnGS61W7BZecXVZ4pufyqf0dIsDA7dTsH5gGDugdJqo4HyceT/Xv+Hs5F2OwUvtln1mr7DiuNOPluR9HTzddGr/M6siP9/NS0M/l8jJYmrJkBMtVAR3Ej9n9urQKGolbW24Isvmt1+PrTOUVrRp80ULozolbDvnlawWICFq360l3d0ffZDYIOEgNRZ+EThc7zHPKnyeYqc/e6s2hqcT+ERXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM0PR04MB6818.eurprd04.prod.outlook.com
 (2603:10a6:208:186::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 09:34:28 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 09:34:27 +0000
Message-ID: <ef931be9-51b0-6990-211b-b8450b395bf5@suse.com>
Date:   Wed, 27 Apr 2022 11:34:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To:     Alexey Khoroshilov <khoroshilov@ispras.ru>,
        Yu Kuai <yukuai3@huawei.com>
CC:     linux-media@vger.kernel.org
From:   Oliver Neukum <oneukum@suse.com>
Subject: possible clash between 8ea0f2ba0fa3f and 4affafd7bec7c both
 decrementing refcount
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::37) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8031a6a-44d7-4d44-28a4-08da28311fb9
X-MS-TrafficTypeDiagnostic: AM0PR04MB6818:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB68187DEE469D737BC3974044C7FA9@AM0PR04MB6818.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVuhzrcyJQrr17qEV9cauGufyVK+fhUz+1HDWBSgk5PjuxEylfWzIwyLzeNFOUsw9M4g+UQ110YOyvaOxGDTAcOSlto2kacl17XVWbQWV0XTeD2CcXKYzb5sgP8TwDdsa6ZwqBmXgjfFh6GD3vRSZGOpo1tkEuXqyE7h46GorAVVl8OhyonnFeuhotHPuTCIFz2WBaZZjUKoxV9QK7etxIcig11g/82HJWXcfgqOmn2xA96DMp03wWW+yHM2/1sSCAi947/4Sbmxp7mLPpUMSSiQBmbHTHG00WDTGCTwxbvHlRK4SHd4Z0jLLJ45gXbfkolHhSwml9x+xZXCFT1dXTAecYXtXtsLSL6+1cmcfdXfcmZY6naG7Goj3zs0IwXO0k4XhFVKpNt0X7VH325KgiTU3vq5/sB3/O5AoTvsigEAU41KsswKBr1U8EjlSAJk/6Fxy7fkmp0AfJQJr57vsGY2n2E73AgqYwnmDJ3J17XPF/JVYABUCyCuOMJ+4a1V/Qq6akU6a/Y9JVKvYqHnRrjDCrT/eDpb6ERvKOALojNz3wrjECuvc29NGqdOrMBYYGUbElgBO3hYseE89fxBT9ZxfSCTbSBom2z5TacfPP1yJUamTx3cyy75IdosIpnjfSE+1J25132vtFAjhFpspY74ume6dEFdGxRss4P/JjBHrjEl9FUZ1NlGWSk6h26+0QQJOL7mZoAA7hJpqQNrrA910614QT3ANJLdsl+sZ+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(36756003)(66476007)(316002)(186003)(66946007)(66556008)(2906002)(4326008)(8676002)(8936002)(558084003)(31686004)(110136005)(2616005)(31696002)(86362001)(6486002)(508600001)(38100700002)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1uoZxdXMppktjYSFQIR2kKonwkZQASG29hV1HW00GLSSj3PqrIt3vwubEKYq?=
 =?us-ascii?Q?Nf+mSCzaFD3bl0RFvjH9a2TmthHSc9Vsx0uZRu+SfgoMui3oG00ufoZCDzX5?=
 =?us-ascii?Q?+XcCiI+zIh3VMu/p4o83duAu5cV5vz74KjxXawugQOFR8j147ShHkoOPYyj5?=
 =?us-ascii?Q?EiDBqWovbXHyZcWkd9HYoAFSl7AbwEuRPEzicYAjugovgs/HcUltSh0zve/e?=
 =?us-ascii?Q?Y73520jIHWJzFyWJdLQfkfnohZ9dMQoNuHBPb/QicPvo553lyZwqiooAFfb2?=
 =?us-ascii?Q?5OMRbIjoJ640p6n9dSUGgrySUrLlNXR576aztCauGm7ih5maotUC6YdnFaKF?=
 =?us-ascii?Q?B6JkRNCjxVtJP9lHnPurV+UfpHFlvEaZw510r5DwO6p1a4WPfzDmt0k1cDm7?=
 =?us-ascii?Q?4xL+iDCWs7KK+DTN1Uyt1+Ui1A4hs7WtUbypHx/5JWf6WLScNTAI4UJF8W2F?=
 =?us-ascii?Q?dkaVG8pu2vdf7nMKBG8OVfoB83hOe51BSvVR2i/mdP97D+v+MeInpKor9AAT?=
 =?us-ascii?Q?mNq5FsdLZ6AsbnJ5AezrzBKFbh8ZeBipo5UjWy8oQGVthpGRLQ5XchHAjHUH?=
 =?us-ascii?Q?WH1hX2nc8eaFG3SCOpTXJqWE8Att0xILBBmjSsc8f5AYwMFikLycsVaxqPWo?=
 =?us-ascii?Q?i1+KwCJqYEKlFdWa1w+wnrxuw0RwEHR5LWa+CrDGRuv/xH4/bi/8edRElmKY?=
 =?us-ascii?Q?m4FkJBNKUAZ93cW8sIe0Hh3mGDe+/+STnUMSARrOky9qiLte2JYGn2kvKtp8?=
 =?us-ascii?Q?bGVJOGoM/H9qkXkkevrGKFTwQbNFmPNnEe9NcS5in4MBxGFqmyw/MuwCoMip?=
 =?us-ascii?Q?0oZBnucWX3yUxGoHPyk27lUOMhervzI4ZOpVt/JgDXsFpfz7WOnPl7sOwxrU?=
 =?us-ascii?Q?8/ms9sbPRdUYwN7uzIp7RSPLHdk48PVfYoOOyB+T8B9QUtICYdv7Whv1WqbO?=
 =?us-ascii?Q?uwwoLGkl5SPNRu7Y04yjrbvLUkMIoORC97x6z+EJbhQzwWfdZ5EqKzoUMJ1W?=
 =?us-ascii?Q?u4df0nJitMw0EYPj5SOt2fqmNd68i44nUow02F9tuJWY+IZb3iiza3+KtsMD?=
 =?us-ascii?Q?ImOKvwARcgveCWsZ767eAye8vcxkXSkhF5P8RVvS0UAO4pwg02dLf3Z6SBIp?=
 =?us-ascii?Q?+4UVT5oxj9ee/4B2OScamUuBVn9r+A1PXW75xNpg6YnMogWZp3hvU8tSFpdl?=
 =?us-ascii?Q?M7Gf9jjHwcbqtkHyrPZ/coHO82qU0bJ0mu4erxewScJUfBuSN8p8DYaohAOd?=
 =?us-ascii?Q?fDS7Umdgj4HO5nWxpgCAbiksgEcNEaoITb3GrcQWbJuL7vKSgwXb5tkRUkjF?=
 =?us-ascii?Q?tHbO9HmQ08E3FHPlWVcGydALcNm9cqW1dgsV8eSPfUQtWM8hYP4mcXtUjSP+?=
 =?us-ascii?Q?u6/6i8ey65bqUShnmfOIl4ec1X5mfLOwBQ0nfLHHy8aFXZkcP6EaPkw4o9tg?=
 =?us-ascii?Q?mFCfLJmBDg21dNZVV+mimSpUewLv7xPlpEC9bpqJLnrxHpj4wJAU7O9BcAlq?=
 =?us-ascii?Q?ryrABgTuC0ESGJOWxHlvdyGsZG+tI+heHCQ0L6iugbQDmNvwY9sBuNNd3M3G?=
 =?us-ascii?Q?eofJNZctAswmqTuAepUE1buJPsuAOWuGZAU4Ul/ZuhIAqWZpGORwnD0X/mF1?=
 =?us-ascii?Q?BiBECxuE81GUP/UlvK+UeHKkecjUaOJo5sKfW+sIzcUEDw2Ad52H5d9TWsPn?=
 =?us-ascii?Q?/uwTTGPPM8b36tTDOErfI8AyFpMKKnNR4Dtmf68aNwFqYxUG3WSBg0EQJkaA?=
 =?us-ascii?Q?SyAIgpSaL+jK+jhVUbDiZ1b0FTBtJaR99AKL4+XpcoSPNBPdbkHMudsIlHhL?=
X-MS-Exchange-AntiSpam-MessageData-1: RJFgDExpV+yxpQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8031a6a-44d7-4d44-28a4-08da28311fb9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:34:27.8801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIA2rW55hVrCvMZgvWAVh6S9/SSYo8j1Hssy/nFcazBau20NOJ4QMdcf7iF+HSbx864nuSf9nKGGArnv2dwKgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I was looking at those two patches and I cannot help myself,
it looks to me like they are both fixing the same issue in two
different ways.
Could you clarify?

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

