Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF6B5F77CA
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJGMBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJGMB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:01:28 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80043.outbound.protection.outlook.com [40.107.8.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCBCD0CE1
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPVVY0C5zTQ/AbO1VUHhKRePTuvEbORa21cqElY0bQRABs7Oa4Xsntr02Pnw80vNzgMF13cPHGx0eltiK3NcN3Qguf9lbjXHlLAP4jwRckJgMADXys8Z3dXbDECEIJ5vBHt9icawy15ommP1s6kTkgyymKnwAFX1+Wl9QYPi+mqNNpOEZc5/mJwBEp71uNxrGRYRhc9JPsNdrGhEyH5YwuMdti8zfe/OUlC4+wbRuJKp024NuuTIWhyElRL/0tzHzp2LmsHu6ycFzRNsWritBtJLLxDDyrUcr8C8KjZYnmzcfr97QRuuOCaH1Ce0xugMy/cm5gMP02HDajAp+RfwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT3yIY9xYXbDXpcPvTofEymqkD0e5dWUZ2t3Isn0PnI=;
 b=lrPJpa7joKjt3iXlds2qlkOoEFRUq7Z/0CsBVCNsoljzUjQ7RVKf/8vKRmFYthoXjtnTWCFmh6z/wTSeSjP0BbWqreeyf/XmudUps04ikjU1H/2O+QCeEnwdrO/jjEqOOZTDy/UzfaeNP1sDMiehwe73KSG/6ZMj9PYPvZ/4sJAUC381JxYVLKwnx3nQ19AgHU+aF0Nk+fDsvrGXA5gBeWneZ/91ztXZEiepJoRhANLaUSpqqjX/mhJVaGHhC54m3qQmG48btwRZK1S5u9JdBso72L9kzyCnrkS8aVK2t1Dmu+oaGNXe6bKobSzq5xZ/1xgVMDQaR7Auwo4e949WRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT3yIY9xYXbDXpcPvTofEymqkD0e5dWUZ2t3Isn0PnI=;
 b=UC46Z4ujg4q6Qz8I3X1oXTifoskO0WDWGJUy5zztFi0j/BkBdolC9lUXnPsRk17DIIa7rWS2KC9qakmEHQtHfPCEH1EeowsZPrXaBCdn9M3+OlqeAX1AvnAKaDNih17G5JR3q6YwEyFxa9Z3DlzU3zrJr4QZ1DYpp3p7echExpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by DU2P193MB2033.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Fri, 7 Oct
 2022 12:01:21 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 12:01:20 +0000
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
        <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
Date:   Fri, 07 Oct 2022 14:01:19 +0200
In-Reply-To: <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Fri, 7 Oct 2022 11:30:32 +0300")
Message-ID: <m3sfjz4zcg.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR08CA0100.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::26) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|DU2P193MB2033:EE_
X-MS-Office365-Filtering-Correlation-Id: 441d9a3b-c03d-4d48-aed8-08daa85ba606
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQ0ariVNB/psGaXtiMPY3IRokEndN+5Dx1u6cFk1UApM1hLDT9YACgRWPLGG/3jjzdvBorXICO+8uevt6uP6vPUCi/XZ2SH3snKths+olrFjec+cAGxWE7z4zafarxOASJCoXpjvA/lrsqrhMaXXqtK+hSexlneXwIjJx3zt7WIuyKxXuEITSrbyFsN7GRD4Plqjce7KJxsmlMY5ZBzIf23zvAxm152F11T37OIoVec1lMG/DZi9TGVy+eT3jB7zQVP20/m5qPzD02t8XIaHnvrTUKDWHFb4gAcrSqMzlIIegT9RuhsqGNqVbom0yBc75x9Cjh/dL5X/OJpwZM5LXIZbid+dcrucO4ixRJFVJAlS2JVK4liVoc1NHAOKCFDo8tTg+ZrUdNYJ7tBWQkKeBa8vwbuIgnZ7Lx7ZxMVZUAuOcoHfHQJhWclIm+xQ+6ZpTBwOouh309Zbei4T+nkrtPDqztStonDAguk+iypQv/DdaMONoc8yoaEonV3cwbvlCzYJk/n62kq2+vyc5YiTUoTzrcou0uRPCHelFmWO0VNcR4y45bSUIHfTNJSCh/lOXVm9sZ7cIkslx9lGTHUNmVSH/muQhDhSAA3rS1fbInoUKWuAyCJJfeGB/vsqocnvUViS8XozzIGw8I85JveVumzXGpSgEfpJEQbDAS0+GuR8P9rvviEXuLgsgIIDFgaxoC03f3nhDUriMIPG1JRuYGVD5p/OBbFvXX06MQMFurewdi6x3tZydnTpF+GvQ4c1gqRyV4IxhWKY/eG1ZK4iLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199015)(83170400001)(4744005)(38100700002)(38350700002)(8936002)(5660300002)(478600001)(2906002)(66946007)(6512007)(41300700001)(8676002)(4326008)(26005)(186003)(52116002)(66556008)(66476007)(316002)(6506007)(6486002)(786003)(54906003)(42882007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpSMnBhRkoxUG9lUHA5Z1lGcjQ4UVVmSFowK1JlTU1KUVNoZ2RTVVhpWTQ4?=
 =?utf-8?B?ZXVlTUwvVEFNQWU3cU1ZVE50cXZoVW40U0JTbGo1YUdyTzZ3YmU2djhTK2NB?=
 =?utf-8?B?QmlZbHF2bFBiVnMwYXorM1doY051M1U4SmtFaWw4dUJwMnBaek5GNFVWUjNs?=
 =?utf-8?B?eE8wMldsZnBkeVg2YWcvQjlOeTE3RG1RdFhSQ1ZKaUJpSVVsOTg0Q2hJU0d1?=
 =?utf-8?B?R3RQK2VnRVpRbkRINkxXU01heGR3QlAvMDdXVDFJSEhjbmFMNEVaZHhMRUxQ?=
 =?utf-8?B?TjhzTHorUlc5M3Zvb2ZiVlNxSlFFeEhKY1hmSUFLYlhPM2hIVUY4VThia1Js?=
 =?utf-8?B?cWdVTlNOays0VmNmYVhDU3pVeDZ5Y3U4TXJORHQ5WDF3R0I4STNBRlpJM3ds?=
 =?utf-8?B?NGE4MlJLdXFxN01XWjA0a003dGJFV25TTThCakJ4UUpDNHl4L0djaWU3UFQr?=
 =?utf-8?B?RjdFdDRrMlZUNWgxOG1rVmlKZUlpK1h2azRrWjRMbUZqbjhxeTVWMzYxemdq?=
 =?utf-8?B?YnFoUExTcUxkV0o2VDRiOE41eS9LcnBGTys0amx0SDN5enhMRUpJZXhuZGlR?=
 =?utf-8?B?eTQvRzU3RG05c3FwRjVZenBid1dxSnJHZHpKSW53RW9zQ1JRMXBIVUl5T1hz?=
 =?utf-8?B?cHZZdmpoY2tDUHhTOFBBb0hsd090VGI2blJjRWJ1NFVVZHFPMGVXMkN3OFZS?=
 =?utf-8?B?SXBrTFkxd3Z6MUlJRnQ5UWc2YmNINkQ2WERvdElDRHhCbEN3OElFZlc3ZEtV?=
 =?utf-8?B?RHR5V2lYeE95Uk1KcFNlTGN5WEdlTkhBRWlIRVJhNmE3Sk5kMlpWTGppZG1n?=
 =?utf-8?B?TDNhcmhVUWZOMlRlcFE2QUx0eVk3UVozcXVkS0lGTFdPdmV0MGx5MW5OVnVl?=
 =?utf-8?B?K0pRVWQ1Qk5FRVF4aHhoLzFsNkxxYnpiZWNnNi83UEdGQzNxRytIWmZTcUh6?=
 =?utf-8?B?WVQ2S0xJWVcxS3p2Nm5CcGpNR2c3bjV0bDkvMUtkNjJCWWRmTHBicFVnd1Ax?=
 =?utf-8?B?Zjh4MjEvaG14YUNZRENTOHVOaURmMUFhMlUzejVhZzZoNW5IN2MxSG53dGNP?=
 =?utf-8?B?MG95d3JtNTc5YVd0NEw5MVJML3ZxQkxja0hCWUVQWlMwK0U3TnRFRW5VWnlh?=
 =?utf-8?B?clVWT2cwalNrUFp1cGdnakpDNFE0K21leEJpd0NKZEFkeHRaYnhpS21TdTA0?=
 =?utf-8?B?aVc4N2pBWHZFZ3hWTGNCbXFlTU5JeHhpZ0c2UEpzWHQrTitaR0ZWbUVtSHln?=
 =?utf-8?B?RFYxU2FUSGV3YmhWMURTYU1SQTdXVjhpKzdLcnJWRWVUUk5uQWxha3Iva1lm?=
 =?utf-8?B?NEhoWUl2Z1VIM29tSkxSTXRoK3RabXU4ajg0YjJScWwzb1RtRDNDU2RhbG1K?=
 =?utf-8?B?NmM5RHExNG4wRkJtRVUya1pGeFFVSERwSXZxM2xBa3ZxWDJUSnI1NGVuL1lX?=
 =?utf-8?B?QkNtVGViYVdXUWI1MzFYZ2luRmVja2xQSlFxd28xYWUwVmg4SXU5akFydWZt?=
 =?utf-8?B?Yklhb1hlYVVYL29WY3U4L2pXdGlsMVo5ZUxOcEQxdzBsT3FETCs5N0xPNU42?=
 =?utf-8?B?czBvRjZobitNaHFramNIQmZMK3Vqek5CSXIrcnVLVHJKbllnZTFlMzl2OUhO?=
 =?utf-8?B?VldHYnN5VkVRU2c2UkFjVHZ1MEx2Mi9rY09LUDlWUmhud1pKSFAzQ3pxRFFI?=
 =?utf-8?B?QkNCYjVvdHRyVVhTSks3V0krcnlINEVKajFWYVhBYzdwNlB5S0dXZ3p4RzdN?=
 =?utf-8?B?NjUrK0JJWEVuenQxa0ZFZmhRdHJ4bHZJQy9IeGJnRDNWbThYVnU0V00rNXR0?=
 =?utf-8?B?WWxVTDdzSkZ1ajhCdGFodWw1dTcrWGNFZVdJRnZMR0pqMmw0NEpTRDJFK0tr?=
 =?utf-8?B?ZDR3QlJweUoydGV5di9xVzE1dXZEQ1hPWkRlNjljY01QcHlXNmJoZWZVblEv?=
 =?utf-8?B?SHRieEFEMUJKOFZUdi9YTUNPTE11cTdPN2pBQnIweWFDQ2g5a1ppeE9uODFV?=
 =?utf-8?B?eWIzOGt0Q2tiWW5vU1EvaW0xTnBwdnpER1B2Q1ZQbWVtZTIrNnNEY1l4Y01r?=
 =?utf-8?B?aE9hN2NCa1pxNndQZTJSQlFpTmFrMFFMQVR0UGI1bGwrR3hseVN5bWIyS1Ix?=
 =?utf-8?B?Zi9PRTdCT2JUc2I1cC8zVGdRSmpmbmJrM3Y4d2VMd3Q3MVk0aEYxNmhjaFZU?=
 =?utf-8?Q?3aSmC/r21SCd4AHyEegX81mMAVSuNtx4u+xtCdh993lX?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 441d9a3b-c03d-4d48-aed8-08daa85ba606
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 12:01:20.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61ATkKG1iJCJwrwO24G2znCqEg17eJaNYPCoeFVzDDptwFxcJv/CobulHb30EHZrSRO2czOBnpr6U2KBQtNzBTnXXRd9uEGe8XiIWbHb9Jrl04D7efsdU46LoBPYxv01xX5z5iJ0vvgDFhyDAyM9Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2033
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

> I think Krzysztof meant caching the value in the ar0521_dev structure,
> so it doesn't have to be read back. I2C is slow, let's avoid reads as
> much as possible.

Right, ATM there is no I2C read function at all in this driver.

> This being said, if all gain controls are in the same cluster, you won't
> need to read back or cache anything yourself, the control framework will
> handle that for you.

Yep. Then there could be a common gain for all 3 colors, or a set of 3
for R/G/B. I only don't know what should the former one return on read,
if individual values are used.

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
