Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741545F73FD
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 07:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJGFmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 01:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiJGFmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 01:42:37 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9642FE76C
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 22:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYLv0EswymxWY72ZJ+OUPrSz8Sv8935nDx2usB0mG04PLi4tdUmr15KB95VAjScJbozQUM0LiyGeSAcTmkaqyHg1OS9QdPhdfA/PwSJMicviUs5ccICIQ78uJPokSCsqu1TqqCeDLUH+vcueIqJoiLkzc3Ynz4fgHx99Vb7ISvTS83ssTFOGP5JAlEf1I2MnOr19JUBF+PNBMOgb3EkecZXX+CYqu2BGt5rhHr3z4ptonXFFGqLS3HnvzEj+W1efWNbpqKfMbqPLm967Gad7KYsPx/sFuCS973RQXVjtNZkh/xfeYKftP/qIQTE8Ek13YDon9/9yA/VEN+0k4MwgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsCIIhpIEejw+fyzCd6FwzqvxjO0EYEOEgg2lokw9tk=;
 b=Xu31HptfYvD3r1pswA1jgLuqudk9C60ncqmMSvM95IzwG2f1dt7frLdJdHy9IWmsRGwEXlseDAoDVvFze2U9yns60NW1q5x+k4MPrWjYpOviRTPJBTQIqMoiLW1tR8+akj9jwejItDldcAdGAyisuEoYf6oU6b2w5J4ZK4yHkFf+LB+uDUc2mWpTUInT2J6Z2jqCaBC1tbL6CIH/JtaRSzMtDz9Nz8sUjCJ1LA+hlHBsM8KGRzDx01Etlq4CENLd8izuXthG/LGgqgoAgLsDItkERyHHx68oICA4hwiLs0Z0YMM122/790RMM5PWYOhsT8HQs3rinJffQWgklD84UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsCIIhpIEejw+fyzCd6FwzqvxjO0EYEOEgg2lokw9tk=;
 b=e8SMCWJuEZ86mCfWNzWkfr5+vBoYOvP8D/igH7Jsoq4j846FEgEvR/aupYbafGrL6bGt3pVz0ntVnQjA1Rh1B3gIHwE5hhbfonE+1Xo1rR1ymDmjuispENBjW2I761OtWVKmWTIodk6AT36sUqZBc0iStHjg29hK/IhgfUUno3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by DU2P193MB2371.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Fri, 7 Oct
 2022 05:42:32 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 05:42:32 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 10/10] media: ar0521: Tab-align definitions
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-11-jacopo@jmondi.org>
Date:   Fri, 07 Oct 2022 07:42:31 +0200
In-Reply-To: <20221005190613.394277-11-jacopo@jmondi.org> (Jacopo Mondi's
        message of "Wed, 5 Oct 2022 21:06:13 +0200")
Message-ID: <m3ilkw5gvs.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BEXP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::13)
 To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|DU2P193MB2371:EE_
X-MS-Office365-Filtering-Correlation-Id: abe50027-6384-4433-ca64-08daa826bad8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VU7+rFCdor3A2lnt7gJL2Jrtnx6opPnoGDQOe31lWyAhd5Ja7/yX3Ui0Uuh7UphI5MyT/WGcLnoV3yHDi+jHwUbFeyJwWz8J2DLAc1TQcQj9ofJa4Xc6J/gnNttVUDg/yZMotvG4re3OKhKWRQPJFlrO8D2BP4eEeDR4gABVUiObCqLG/NxELOtMTauHmPC/tdO5Tg3SvDjcX6qlbyTLLkoTSCmyxRUNsED++++ljjk8B3MUthW/Xj+xDdEOMZmhW05Zl/v4pwY9ZC6jfxOZsbpgOawMHkxxf847tqVqDppRVF2JNjzcOCOFOHP7iv4zIXss69g4hyoUqut0o9IEfESoCwB06uRXEX3gAGlKo30+WdbxcsywkUyRGtwyIdgACjIlOb8xlZ5dybzDoP58yxEDeLHzJ8n6fmIBuXWvgP1pXzcko9leJozFcu0wyPUNita119/BoGPkVcT+K4ssqZn1Kz/pu7MWlXTrg+oAOl+VroRxPu+uYgNxQCqQA5C3sMW4sx48umQl/w7h4qzwO/WJQAK9clS1kgU8RvL8Ww19N2Ier/abJOTz+Euzhb43Gi5XExqQiQgLk4/3XDt8rU81v2ew+P+Fu+hQoeeWEtRfYzcMqoOyplG7hClEO5KKXpuGWbhMYke97tlB919rhxwrLbx5W3BROJB3p9uQUtnT77Vb9P78hYtl2XgMvvCIQGnAXGciXhF4N/lZpfBkAu+bEPx1pjNZtbwep2W2X9Ie01wTYjEQV+no4DH6i7vvI7YwgqmxqE0hMBLPtTxPDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(366004)(136003)(346002)(376002)(451199015)(66556008)(8936002)(41300700001)(66476007)(83170400001)(38100700002)(38350700002)(42882007)(2906002)(26005)(6486002)(6512007)(186003)(6506007)(54906003)(52116002)(4326008)(66946007)(316002)(6916009)(786003)(8676002)(478600001)(5660300002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFEwaE1NTjc3MFhJaFBINkp4WnBFL21WbjZWYkw1ekhhTzArdzJWQWNZalJJ?=
 =?utf-8?B?bDNCVnFsRlhKNkRCc2czaVZTL0o4Z0h1S3pBSXZaZG9uMmxCWCttbk9xUFN3?=
 =?utf-8?B?Sms3RDlBOEtTM0tUc0ZvQXZXaGZ0Q0g2S2ZLb09UZjh1Qk9tM2FzMEl4VFpC?=
 =?utf-8?B?ZGxkQjd0K3orcHRUa2ZONjR2NjQzcms1cDlrV2pjV0pnWWw5Tis4YnlUOFlw?=
 =?utf-8?B?L28zN1dDUEFHdDFDditHNUZGbmJpTm1NQXVPTE1LeEhHODhGK1FEMmpUVDEz?=
 =?utf-8?B?L2p6aU5UaFNCbmh6T0tvNURpb3psRm8renNwMzRsTVB1MTdIblhCK3liVnU3?=
 =?utf-8?B?SUljYmF4THBQczZONSs4dThERklDbUdYQTJJQTF6ZVdPQnRudTQwek5CWWxI?=
 =?utf-8?B?ZnhTVEhLQVZYQmdmS2JsQThSYjEvWjUvcWh1clZKb1d3MmpkT2Q2REs0VHQy?=
 =?utf-8?B?Y04xb3lMUTljYnRmanVJU21TQlo3UHBLMGthbDZzZ3A4ZjlRODMrYlM4cFFB?=
 =?utf-8?B?MTB6SUVoZjVpa2VGaGxFdnlaTDRHUnhFQVVIMVpoN0ozS1ZmT0RUemE4ajI1?=
 =?utf-8?B?VENIOEt0Z09zRU1wVmhPVUQ3UWhtOW5ZOCt4YzF6NndLVnRYWXlDZDl5SE5K?=
 =?utf-8?B?Mmc2U2FGQXAwYzUyVFMxbmxaRWNKUW5KbmFBaVRmTDI1L1lzMzIvZ2Nva2ts?=
 =?utf-8?B?c1FJSFR6a1cyK1AzL0ozVjBiMzgvL2FReDl5cVJMSmJWZDJJS1RFWjlNN0pS?=
 =?utf-8?B?SzhTdGZLK3JxSFdvL2l0VkV5MmxqZ2M2ZE9tUnlXeGZMOEJUQldUQzlYRGgw?=
 =?utf-8?B?aGhnN1djaWV3dEQ4Z25OK0ZqeGRZQ3krWVRBYW1PVjgydUd2b3B1RkVSTC9o?=
 =?utf-8?B?RENjZHhPaVYrbGlTbWM4aXNwdHd0Y1FZT3BqdGpacm9BcVhZSXVkVCt6SDFv?=
 =?utf-8?B?Ry9PV1RQWHdma0c4ZEhOUHZkNTlnM29pYU9Rd21IbXlmVHl5UzZxSXlYSTlv?=
 =?utf-8?B?YnA4RlliNThSakFYQXc3VGx3cjl6TU5sN0h4VGZpaVNQWmZCQTdZSGN3VDNp?=
 =?utf-8?B?bU9YMkNyUDd6UFJ3andsdGgzR08xRStDZUcvdVZZcjlmV3B3eVhkSmxvU3Nk?=
 =?utf-8?B?VGUyV3FTOVQzQm9HaDNESnZyMityZUhydG5uaURVOElYUmtOSVpRZEphNVJn?=
 =?utf-8?B?bXJIbU5JeUE3SzZmR3NpRXYxa3pZbldCSlhMUXRlaWVZeXZicmJLRUN0RnMy?=
 =?utf-8?B?YW1XaTFNYnNZVVJqbDAwcDJqN1dYQjg5azM3Q011RUVoM3dWdFEwS2F4NW5L?=
 =?utf-8?B?ZXBHaUxtdXFROHlNSmlLNHhlcG1QWlBNdkozRS82azBhV1ZNK0VYeGVpOTE0?=
 =?utf-8?B?L3JoUlo3MkxBdzZBb1FPeURXS0JyeWJKS2tmUllrT1RGZVMreTh6bDZ5S3V1?=
 =?utf-8?B?UlJMdUZqM3plS0NSRFc0UCttdzd0R3NGNGRpbm45bHZKRVoraU5jQTNHNFU4?=
 =?utf-8?B?ZCt2Z1NpWkU5aWl6Rm56L2FMS0dUTWliRDZoZnJqYXNGOTU5RlY3OU9HK2J2?=
 =?utf-8?B?VXd5RFA3bDdWY0Y1NmVtdTJRVE9rSktwa3FDSnhxcG5jNER0SzZibHp6Skk2?=
 =?utf-8?B?c3NaVE5JbGZMTUliekJ0Nk5pSmk3bE5MNlBScms0SmNRMHp2eE13c2p1RXZ5?=
 =?utf-8?B?b2Qxd1RLRmxQcW0vZExGYlZjZ3BZT1RGbmM2OTZOZTNQRHFQNWlsZTk4VnVt?=
 =?utf-8?B?b0lJV3dwY1FvM3JtbUtNeDFvdUxwQUozVGxPNlpFUzkvc2czM3BIKzYyK3FM?=
 =?utf-8?B?bXcyOG9RbzZTOHF2MnMyTVZ5SWtrUGZFcklDUXN2U2pwZWtIbEwyV3dIVWt3?=
 =?utf-8?B?di9nNmJVOWY2Sml5TzUzbFBCT0NtS2ZwZjhnSWFxL3kvbXVQTkRoQ0p5eG9O?=
 =?utf-8?B?YUdHZDdMNWlGOEZZdEFjcHNKL1VpRnRpamFQdjJSdTFidVVBNXk4VSttTFhN?=
 =?utf-8?B?ZmsvWEwwZ3UvbzNNMnRNaTRIUm8xcHcwdDNxbW9vWnpzT0hJVU9JUnE4L0JI?=
 =?utf-8?B?OTE1Smt3d3Zxd1NIVFVZMUljaStWb2R5cWRMa2YrNmlHaXRueG9xSmpiZTJX?=
 =?utf-8?B?L0d4c2tOenVCOXVDdUVqYld2a0p6QmdLbVp4a21IQzkvQkVWb0xXQW5VcmFl?=
 =?utf-8?Q?VZ3PvwQYGz52l60gCvhg5E8H1V/0fUGNMgasLTz74Fm0?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: abe50027-6384-4433-ca64-08daa826bad8
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 05:42:32.4902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W9k4/6COrFIclsxL7MC38rAv22RE8aRhol2HDZcQfRkSbx/zQUSvJSsvfxzK+Fd7USXpOgr2fJdQyKdaNuInUjHuoBlDKZ8+f0snsTnUjy3rN3B0S07wS2w1QRq0GAqrJ/i0K7OoanSrjGgG5bvfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2371
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

> Align some register and constant definitions using tab in place of
> mixed tab+spaces.
>
> Cosmetic change only.
> -#define AR0521_PLL_MIN		 (320 * 1000 * 1000)
> -#define AR0521_PLL_MAX		(1280 * 1000 * 1000)
> +#define AR0521_PLL_MIN			(320 * 1000 * 1000)
> +#define AR0521_PLL_MAX			(1280 * 1000 * 1000)
1_ANA_GAIN_MAX		0x3f

Is it better now?
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
