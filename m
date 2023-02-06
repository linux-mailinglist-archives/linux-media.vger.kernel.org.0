Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5253E68C1DB
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 16:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjBFPkp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 10:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbjBFPkK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 10:40:10 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0729.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DBC32BECF
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 07:39:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hT8i3xLLUR2Xkh6Qow2KOPsEq+WTDTylJZKS1o8M8YaZM9kUS5lfSMS4YAj0uxx4iQqKP/cyvo9i9iEt1ycOr6iRCEVM2fpuGl11zseAD058bNd8KBVRsJPP8y+kHfdQUHJy5L5uSjXPO8ZC3wIvl2Brdiv+tOJTIEvk9VMCiPA3Uv7RZfPIK7wzvsEO3/KcPb1ebwz6Bv4YNIyq9/xCpKYLm9K8dqKGhKxtutWQrG6pFxdhynGcr4ArCZPpjuhkl5vu6OCfAxBmuccVexG4mAd1GEddlxz/oGCP57Y3xXLAsHWHR5a6jfxj0BvlcnKiY6pUfi1MKjc+CIkkBOScCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fJSd5i5yYqFRVmexU9WA5H7kxXGht+PJqYiHn1oULk=;
 b=GdLoBQ9gqJFA8NMZKfSDHMcUdq3QOBMWQCMIG7ksiIUHhbazjH6ZwXgpz7m+mVBIBxq0N5Ia41pDSfAGj76f7+6FL3l1e1BxO6i3TT6qR+v95/2l0qVSu7BbuHXcNhd6HH0h9fGLWcxZ+xBfZiaWORF3rcYW9ImcHXlpHKm9843E8qXNfibvZmf3C7DV7n3EBzdadTZtyckaf4jCJudKiUmFfy0ntKqKBDDxRSia+wMzdR+ws/sg69DvjEcdG6Sai9OjA5hcCcD1DW3JIscLrEeY06pw/Lt6WzuAPUlpuFlHaFPubgvN/Qf6QoSY87Km7vX87T0Otx5+U14fZFJUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fJSd5i5yYqFRVmexU9WA5H7kxXGht+PJqYiHn1oULk=;
 b=l5SAmZGGyaKiZv2oI6OtecGKp3bYE53Kt3L0cnzDITl2tooK47oCqRqUCqGz8AIxvKkxqikm6jyGFtiJ6yxbEVttYJxIMJME+NAO8zZ2CTxvaVmI/nHoqiFIJDoj++eICgViKjVm/Am/PDUeAG03nkyUtcIX/rthaKNwvJgsCT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS2PR10MB7660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:62c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Mon, 6 Feb
 2023 15:38:29 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6064.025; Mon, 6 Feb 2023
 15:38:29 +0000
Message-ID: <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
Date:   Mon, 6 Feb 2023 16:38:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Capture image from imx219 sensor on i.MX8MM
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0039.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::16) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS2PR10MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b509f5-fc90-4be4-d912-08db085831e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99pyUmWcUvkEV/z4+k/cJuZ8zTe2Q3E4z/GjZ9GJuliLtz+6T+hAU5OICxsvOOUH3ga5RV3FK9utnmE/CnL3j+GFxaZ9aKRb/DvKFPclIuyq0nMADa7GpHHvbkIw0zccGkGxigwokRbocHqHDxL1htkOU5ABpqq2ulG3fch/Xe/7pev6tUg8BrOcR6uwd27PdrX9LEtoLNpNopz07jFGVbRtrpiX0yf8TPUzmS73xf55tY3kl1hsP5OidA4HWlf2TN1kQKqGNeOw0UQrY8DZPqBRiN2koNWGrbR21Yecvt8wFxa1wTBfSkU4DIQzwYcM7H4f3tlrCFYn1NXxt9EJ6x+8mE4wp8SVC6CcFNSzT7ScMvCGvlcKuP5AVLIOzEg27eajJ5XM7ykRLdVCo2YTA8pCDLal9JCM5cLXXbYe9pkOtvdrkgNacru8CIfwSTozN5dvCZiQhz6jZKLri+bLaZntf/PTurgN6vyWaUxBhSb34GsNtPT62FXCEcH5M6SS2aSjBqy9p0+9xCwdjk2R7jPxQFTk/Cr98HOoXMrqTEt3+C6viInpASnww0GA0LCO2U2DPsKeGJVjspemWnw2+EFJdRMG+TXO3VF2ZXqWB9HbUDoRegMhSfmHbU/Nr7gfhkmjyoT7rpQoVeWNfnD2lp65O4WePSHmZvkVKRP22S0W1g2jMo5+7/8eihlwGgfqMdJmr5sGpkZ42Qsao8fFVVAErjnQoo3us/yy4Ivd4Fk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199018)(8936002)(31686004)(2906002)(41300700001)(8676002)(6916009)(44832011)(4326008)(5660300002)(53546011)(86362001)(66476007)(66556008)(66946007)(186003)(36756003)(26005)(6506007)(6512007)(478600001)(31696002)(6486002)(54906003)(2616005)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1pralhmVDhKdWhZRy9aY1VQVUdHRDc3YitBcSsrdERaMkFETlBVcTh1MDZy?=
 =?utf-8?B?ajFBcFZEd0dENFZqZWcrbFM1blc2L3dTTFJPaVJ4YWVuQlhxSlZCNHEyb0xV?=
 =?utf-8?B?cmcyTVVTTjBzekMyVVM3UlNSVWpraGc4TlJoYUdSRnhOSnFBYjlJWUtRZE1Q?=
 =?utf-8?B?VHE2RXF0TmhacVkvb1hTc29rMW1pRXU4MFhzNnMwb0RCR0lWVG9hcXhDSWdt?=
 =?utf-8?B?ZFUrSGd0ZG41SEpnM3Ixc215QTl1QTd3NkkyOWs2TlBQZFgxWDJ5dkJSUHRX?=
 =?utf-8?B?cFVub3V0SHBpblF3V3ZxN0dNSzNnY1pLNUNFbithRDNqYnNSb0E4czF6cWZ1?=
 =?utf-8?B?ajJ1dXM3Q25MYlIrN09rMG5YdVEraWF1L1RCeGhNNnhPSlhxM05OdHJhQW1i?=
 =?utf-8?B?YWlGWUxHb2ZHNzRaMDhXUHZWQmRUdmpMSTd1cDVtTEhBQWlWazU2RnJqUkIw?=
 =?utf-8?B?ZDZFV0xPMkxhbHFyaS9IVEg4U3ludXIrY0JNNVRCcjRVTkprVEZsYmFGTFZm?=
 =?utf-8?B?QldTL0h1RTdjditkZzliZVhBZURSd1hIZm1JKzBZallrOGUyTXc3WXJibkFz?=
 =?utf-8?B?MzZZNkNPclRjK2NMZGxYSk9EaXhkc3lJbUxpK1dWVElBTFN4SkJXOE42REU0?=
 =?utf-8?B?WThCeXloYW92NVBTeDQ4NlQ4SmdUL2djbVdDM0JlMkc3UDJpWmIwM2prNEpU?=
 =?utf-8?B?WDVqKzJjOTBhekhZM0xzb1RPODcxZzk4N3BVTG1JVC9WYm1XWlo5TGpxN1U0?=
 =?utf-8?B?ZGk2aGpldGJpdEMwbmFyTWdFOVdJY3dJYmh5TDBiQ0hRNk1Ic1pTekticWlx?=
 =?utf-8?B?aWFQNUVzY0JGQ2QyT3EyRXl4SHhkaDFqczZJOWg5VFV6WVNTUFphOFBlT3Vk?=
 =?utf-8?B?MlV0bjJtK05IVTh1WDVERUJ0V1dZRUJDVzNrMlhtejJVcDhLbXBjZUpUZUlq?=
 =?utf-8?B?TEZFWUtibmpCcHVjc0pFOFdQOSszbkxTSHh0Uk5Ja3RPWHdXK2MvZURBT0Fw?=
 =?utf-8?B?d3lGdi84Smt0VDUxZi9GU3NyVVJWUHRVeGFPL09qbVJibFpLSi9UeUhNRFhU?=
 =?utf-8?B?WThRM3ptS1FjbFgwdUJiQXFYa1BCR3p5TFZiZ0duUTNGcnh6TGVXMGsrQ1Fj?=
 =?utf-8?B?d25QNW5hdG5vdzNsRWdkWU43TE5NYXFFLys2WmdIYldwaXRQZ21DRlRFUWQy?=
 =?utf-8?B?YkVCVTRnYmRGenQwNUc4dHlVYXd4WFVodUpLU3JCeXVPNmZ0N25HdEk5Y010?=
 =?utf-8?B?TGZOdS9NNlFsMkxSTEpNQk9ENWRjcjhLc1VHalZUR1FjUS9HYnRQTUdvQk90?=
 =?utf-8?B?NEVUc3NjVTFpR0FQWlA5djBUN3ZZbHhqMGdSQSt1MmU2c2JFS1lhSmo1ZnB2?=
 =?utf-8?B?d051R0x1eWdmYzFydVhYY2ZIRVNHQXNGcmlyaWd2cnpabUFFQ2UyY2l0aXlt?=
 =?utf-8?B?S2dSVzdTYjgza3JvVDU5VjRvMDVVVlgxK3J6VmdmQkpwMUVZNS90UDB3T3RB?=
 =?utf-8?B?MHduaDJVcTZIaEFLOVExYXV1NTVFTmhsTklpak1HVjkrTW0xTjNlOWNiVjZL?=
 =?utf-8?B?VTJGK1RYTVFMOElMYWFjYmRsV3ZkYWhxUUdoSW5ZeDVIVmNEY0cvU3pUWjRG?=
 =?utf-8?B?TWdiNnZHVjBUT0xOQ1J4ekRtRmtBNzc3dVFISTc4dXYvZmVTM3lYeU9ZVDBU?=
 =?utf-8?B?eDNhcllvNlI5ZC9YTEJJWnhTMStPTXYyYVVHdXRoS0RZd09RdmgvZUZQbzlZ?=
 =?utf-8?B?ek90Wms1bVQySDJxT0tNZ3lSVFRvL2YxMGpIcDFvd3hJSFc2TVlRRlNpT2FZ?=
 =?utf-8?B?THN2Vlo0V0pMVVZRN25xRmpVSEFHNXhCbEhoWHFnbEFTVS9MVkFocEJ0WUI5?=
 =?utf-8?B?Y1pnQTJveUFyVVNNeHNYQTZkekZLWDRIc3hXNTd2blBxeUNsVFFVbytBcDho?=
 =?utf-8?B?WGdWZWNUVUQzZVBkRjFybGNNOEZPTFNsZ2xodDRQck9zc0N2Y1BIMSsvaGhh?=
 =?utf-8?B?MSt0L2FlWXg1MWxFRnBlNlMxeWkyUG9qcEhpOTljb1VhbXJFL3VuRFlnL1po?=
 =?utf-8?B?eklpTU1VK2lZRnU4RUJteFRGR2NLOTZpcDFCU0tURllEYnlPS0k2dWZmaDll?=
 =?utf-8?B?M0EyQnBxb2RtV1JxbW16NHdNTnJnMHlSeUtqMjNqQ2NYMkpJU1hkcERaUk0x?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b509f5-fc90-4be4-d912-08db085831e2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:38:29.1401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8C9azlB16aMgrYLZXoxOIHr+ttvz0G48PCvT7mun73PRJzvbT9peXZUPvWSD3AsSbCsQdpi0SrUSkn429FNRcehKUybtIZ2ggpUyJtUfETQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7660
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 06.02.23 16:31, Laurent Pinchart wrote:
> Hi Frieder,
> 
> On Mon, Feb 06, 2023 at 03:24:41PM +0100, Frieder Schrempf wrote:
>> Hi,
>>
>> I'm trying to get a camera stream on our i.MX8MM board up and running
>> with Linux 6.1. I'm using the RPi v2.1 camera module (imx219) as sensor.
>>
>> I basically copied the devicetree setup from Tim's overlay at
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts.
>>
>> With all the drivers enabled the devices (imx219, imx7-media-csi,
>> imx-mipi-csis) seem to probe just fine and I see /dev/video0 and
>> /dev/media0.
>>
>> For the v4l subdevices I would expect to see one for the sensor and one
>> for the CSI bridge. But only the latter is there (see below).
>>
>> Is this correct? Am I missing something? How can I setup/enable the
>> pipeline/stream?
> 
> Your expectations are correct, but the result isn't. You should see the
> camera sensor in the media graph. Has the imx219 been probed by the
> driver ? Did probe succeed ?

Yes, the imx219_probe() works just fine and returns with code 0. I also
see v4l2_async_register_subdev_sensor() and the underlying code being
called.

So I really don't understand why I'm missing the sensor subdev. Any
ideas how to continue debugging?

Thanks!
Frieder
