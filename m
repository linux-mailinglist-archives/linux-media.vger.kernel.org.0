Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 704AA5F7954
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 16:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiJGOAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 10:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiJGOAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 10:00:42 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2069.outbound.protection.outlook.com [40.107.105.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6AE68881
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 07:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMI0K+xfY+QimedZK1EjmsbaSIlHY6x0bAHePonPAEFAI/jC+loZwoYteAg8mb7k81VcSAayPafnncmO8slh0jnUpNuW0oCWpKqOnlzJk7MFH6TNBpEBj6nkuceKKelvmgHkhvKQtgh+icerbWeloVW8NSL8qoNwqN6YkzeePsBPij6A96BC0vytHNwXlteyMzMXP5NSzR8YZ36C4bmvepgJWdS5FAkurfLOadfJV1iuNaUXPie8eHK42fJrhjXwVeCMC1zJp11NikvIOZPD6RGlaPRDSZ46mF+r+m4okfKziEC6pt1sNel+47faDr3vBazz2MFW5VCoZqA+Yvp9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDCuuCIxAyrxeSBdXWugpvzBsV/Ph7xTjTgKqIG+Qlc=;
 b=QZxETEzIdfdQcvW3M3lgjWIdSTYn0ktQPHwcYPfXC4UHsRX9W9w1jxAbd1Wm3xFzCsPxgq20BdUsxFL0TtZd/barkMSykekJ4iyIDCmxZ3CY7SmWjxUWngp0dIE9EvGO0/upaJWyCAO4RMwr1vvam/abDmb/FhXL7D83QnCHrPVUrTh9OcshT/gXeyQM+mv5Mq/J/z0d+I7hz08f94poSw4KS28cxtmF4GAsf4Q5QgLy5ftq5HEbGUQ2xVVxENAjR5O6mtbjF0NoD53BwQpcCkFNKMFgO3aLtg+v9PG82XK2j63ZClDooX1GULIdt4aT7eu2bpM11DipCJ/AGGwdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDCuuCIxAyrxeSBdXWugpvzBsV/Ph7xTjTgKqIG+Qlc=;
 b=0FKdQO9pFKfv+m4gjZ0Aql9b8HHCIMlEoZClUTDYpuZCvpA+vgU5kMuyRh+zYKqFJoawQD8VA0UUdx4Uyl43y9RpzhdRcpLQDh0FAQigjqfKmi/DTCFI2fQmh1wi5+OK4BcBvSVfDUviV4E+4lvRr5C4kk0QgTbVoYsRsVZtgBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by PAXP193MB2171.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:233::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Fri, 7 Oct
 2022 14:00:36 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 14:00:36 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-3-jacopo@jmondi.org>
        <m31qrk6wgc.fsf@t19.piap.pl>
        <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
        <m3wn9b4zl0.fsf@t19.piap.pl>
        <Y0AXj32rub14CDWY@pendragon.ideasonboard.com>
Date:   Fri, 07 Oct 2022 16:00:35 +0200
In-Reply-To: <Y0AXj32rub14CDWY@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Fri, 7 Oct 2022 15:11:59 +0300")
Message-ID: <m3k05b4tto.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|PAXP193MB2171:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d9d759-9c88-447e-0113-08daa86c4f3d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSKWPleRqxXFcB2ikvflM2dD7JRu6TWwBdOwyj06qOafWlyeOpFneVnv0WUdcuw4UfPef4zhiWklcXKulj6HOuJO4r52I9irOLCEvqEfCQWVTM6/5c8OT3rAU4+xsWzBe3eMZ/9fyD3kHWIYNXnE94vXt1oSlFbalL1U7pCECnucRSht0Axl4OoqOxLhGv+Ly5rJ+x7yuATWrs0nOtWhAZvLqKV8O/HHpnjosrn3chvZEPXLYJ/q7RM4tRtlJ6BgBiipI4JC7UGYIQLE6OMsMp6r0JpAbEhf4iaIsEnZ4jtLpN/Z6EyoxNy0p6HuCzcltqql0u7JXravTEWcXji7gw78G987FdHlQD0cTOnEqwQoFxbSkDZ0Lcs9DM/OqJy8/qa6ooURV+Z/RkU/8ZHdAoLUKLdpU/wSbqqj9W4OznOldLA9ICvtNedUc7Wz/yW8hNN1H9WDkj7+4Z2S8KxPT/nu5tvZJoHFCzdM7xzhNjupHPrLPfQllVOHutC6Y+F3SaX1AjFbYLA7bPkklWr/VieeMiZGnw2d/5yiUplZ/Sbyfc9MFD/bAJ5BOi8gGuy19curSS5G9NAeA0yuEzY0cQ8k/5dh82vSRt06Gi709N5U0D4PGIwo1keUTmsWRCbEWvYq/UWBkxpJLowUOHf5BCBJXC65ZvFEFUaa5XzM5F4h9INEl2RO31P1Ktsbz8v7KzKrSPfs4xjIP71QihaFFUsZmmiqHOa64vSy43o2ALM2HVi7OHPcEAEGeQmu6VaJH1n3pjKlibG8YNwyvEmzTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199015)(66556008)(83170400001)(38100700002)(8676002)(38350700002)(316002)(786003)(6916009)(42882007)(186003)(4326008)(54906003)(6512007)(26005)(478600001)(4744005)(6506007)(2906002)(6486002)(66946007)(66476007)(5660300002)(41300700001)(52116002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlROWVgwd2lqSXMrQUJ3dDdBZkFhZGpPUFZ1VFFUZk9VZC9vNWJvZWVrekNK?=
 =?utf-8?B?MTk2dWZ3S2l6S2NoczFUTyttMDhvdnJuenM2TEpteTVxSEY3THpvdHBibHk5?=
 =?utf-8?B?V21uS1J3WnFXand3Si9aM1RCN2UxQkl6QytvVWpldEIxbDliWjF4M1lNUnQr?=
 =?utf-8?B?RHUwdUtiTnIwTUNpTHErZDBXQmUzbzFVeGhFNzhtN093UHUvRVVRdk5hUlQw?=
 =?utf-8?B?YjNIdlROTnMrNTFpYWNWajliVXR2b0lIdkRQQkg5VDlaeVVLMksvRkJBRGF5?=
 =?utf-8?B?b2FiL3czajIveW5iZ1Bna2tXZ1Vnb2NXQm5GaTBnem1BY2ZOOXN5N0d0RnQ5?=
 =?utf-8?B?KzZOQkEvem54M3lCeXRyZnRJbFM1L2ZLTXBRWEthTHd2WDFIU1Nia0NWOFVq?=
 =?utf-8?B?cnBBcFhZMFplbDlvM0o0UXFQWTBEczJHcFVvVUVtL1pwejVlaVVMZ0NJWU5s?=
 =?utf-8?B?N25Nb2xCcllIY2pWblJlVFQwZUF2aUk4S0ZrVXBnNmhEdlY1MDl6OEZKSm40?=
 =?utf-8?B?ZVg2QnplUjZGb2EzUnd6SHdZWG1tU2xGU2pqNDBXOUdmQW1DRVIyMDJSTWJi?=
 =?utf-8?B?ajd1cDJyVVkrUDNwVDJkYy9zOFY0VUVrbStXcmN1MWNJMG9nZkg5UjVLU0lD?=
 =?utf-8?B?NUZncVZSUEpqajFrYWFXQmR4TVRlTDNSdWFKalJYSlNIYzZ3aWJZcmJDL0E1?=
 =?utf-8?B?Zm5yV1JzZzRVVEpoc240Y3BUNTFjQWlVNWtOdFlTRmYreTVPUG9RQmNxUmx3?=
 =?utf-8?B?MmJwS3NKTnhaZW9ZREpqZ0llamJEa3VYcnE2N0kvWE1qOE1qZE1qd25qNDBr?=
 =?utf-8?B?U1hRUWY0Mkg2enR4U2swNkVFVmlTb2dlRURWdXhQbExBQVFRNTNSL0VWUXBn?=
 =?utf-8?B?VGtrQkZTaWpnUXFrajlsTG40cmxRSjRBcSt3Tm5vUW9JWWhPcTdROFZLcTZh?=
 =?utf-8?B?YUY4RXNOU3JDZ1hMTVlETUdHbSt4enEyQ3U2OUg4NjBtTjJUVXYwdkpLMkZX?=
 =?utf-8?B?SnkvbHphZkRqM0NoN3JPNUd6RzhYLzIyb1QvUjFyTDZ1RGNXR0ZtbzBIaHlq?=
 =?utf-8?B?YTVhUENVQnFRL0lQWklrZWxiOExWWFZseERrRXVnVlY0L3lYS0FkQjdYcngw?=
 =?utf-8?B?MkZJWFZFR1ZmWnJ1SlU0SG9zVU16aXdIYUVXYkx3dkRUbit4MEIyaGQ5amhh?=
 =?utf-8?B?RHl1WkpGOVZCVXZ5czA0RnBqcFpkL3lxWXM1WTBiZHRoR2UrQytuV1AyTW95?=
 =?utf-8?B?dlNHUjlSTEwwaDR2WUsrUkpLblc2cmdMVFlZSDlKa0xmUkdVZmVGNlFXd1ZT?=
 =?utf-8?B?S2ltWFZrOHdQUXJNRUdESmlqUEZVTGtTMnd5ZWVoTkFXMHJWRlAyN1pzRWFm?=
 =?utf-8?B?Q3p0bmxLbHZobEZKRm41TjRpTzU4Tk9zSEd0Q1lyNzBDMGZneGtUdllKRGRk?=
 =?utf-8?B?cTB3b2JjVGFSWmhtekhRQ2JNL1hlV2JySU91SURoL1BUdHRCQ29zbERkajhR?=
 =?utf-8?B?ZXVuckQvbVNrQVZaQmxobDJmZmltOGhyMHdGME1ERTlhVU4zL2I2N2Z5RU9R?=
 =?utf-8?B?R2VOR2dlcTcxbWpsT0JRVGFiUUlQWW5la3EwY3dQZ2RZcTZ3N3loaGZVOVR6?=
 =?utf-8?B?eTNPVlB1ZWF1SmxHeHFINVo3Y2RMYU1xcTBUcnA5M2YxZG9uT0UzOXMrcjBk?=
 =?utf-8?B?QlNvZHNIYkxXaGtSUjJacmxORU9SNkZRY0dlTHhqSER3YnUxa0d0YzNuOTdW?=
 =?utf-8?B?VnEvdGhMdzdtYnlqcmR5Q0xyamt0TkpobnNVZndOc0dwR25VSEgvdFowb0lK?=
 =?utf-8?B?RnhFTkxwc3JXZjBPUjFuQzFoQWpSWmo4Q1YrNUY1bU9pTHZTSVFXcytXcFIx?=
 =?utf-8?B?QWRwR2huK0gyTkw0YW54OWpocE8vUEc3S0ZJM0hyaFR0dWcxMDJ5azdxV0R1?=
 =?utf-8?B?cEdVcHd0T3kyTkFlemVyMGtKN01wSWxyNmdxNytjTVhOZzd2QW1kZDJ3a0ZR?=
 =?utf-8?B?SUZZbnhrYzBWWkJGaWRpcDgzN3FsZ3Z6cHZyYTdIQklycE9MS05QKy9vWU5Q?=
 =?utf-8?B?U3B3Q1gvY2hCTHB0YnU1L0hBQ1BtemVpaDBHWWtCMTVuT05Wc1haaWd6ZElC?=
 =?utf-8?B?NzVIcERmaERhTGlrNFMwTFRjMGlUcUU2VjR4RzJsTmFoSEc4eHBrMFFBbmto?=
 =?utf-8?Q?vXMh63b6Zp/W/aXxtNpIcin4QSTC4gsE72DkV9V2ZxN3?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d9d759-9c88-447e-0113-08daa86c4f3d
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 14:00:36.6459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxNSRMs4OmdEqGRV9mdG/F6rk30+I2fBaot0vmXOZhMughdbMUe12uZwxO9FTOtjCf/HHaiEBDGUg8uRd6bhoXIqunWeX9yWsBiOViAFmPdV3lDl9xngrEDccuccGE/3YSCLHFdooUvPn2W0e2ymqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB2171
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

> But if you apply colour gains in the sensor, they will apply before
> black level correction or lens shading compensation in the ISP, which I
> think will cause other issues, possibly worse.

Maybe. I don't need these, but I need white balance control. Video
streaming only.

> Out of curiosity, if you can tell, what do you use this sensor with ?

i.MX6 + its built-in H.264 encoder. NEON fixed-point debayering with
half the resolution etc.

That's a "mature" :-) project, though.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
