Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C1436B1B2
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 12:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbhDZKgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 06:36:15 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com ([40.107.8.109]:35463
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232194AbhDZKgL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 06:36:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZraVheJblfu1BVOIuBJOuOMdLr5OwkQ87uxxXvTT3PkNKZbmTHMdzYsF0l6Aahz8nHMoe4uxsXvI0Qrf6fRtcm1y7vFLOKZi+mYX2jR4sTTDeS3yK7mC4k2txxTkrU/4lcejyvlWO3h92YXaWjX2b0t8454NfXZ2YeZPNCGHVNYB7cU2sd+2JIvWGh3rEyMTWCFU9XBrH1gG6UDKc8a3fCpylhTbEUb0sDZwzgiyD+OqywyX/Dc6dUWW8DNNv5baeL/6LssrTxY0lUpbHPpbIdQrbceEfluD7Hvp1+MTLLAkxRyjCOYK4tf0m8xGq63UknKopn8HUYHtyYO9bJPsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmwQwGI2pNIMoFlZrM4gOhh3Vo6+6pEAQ0W13ZCaqNI=;
 b=GClsrB4I4Tr0wcPzKvmg6Cz/hqiqtnlQw99V9BHd4gcvde4UO7urmjdpHjkCKW/QwZDolU8GA40ShBSP69L3PTkMTBY+bGZf1d16jTTV6VR0QkC62YQSVMWxv8+T2rTYiDRq0kiMIGZtrTMk04uVNlMI0944oWWcDohqbMc4q4NciqCL3jxJJZpQQH2RHgrZNeRWLH7Fk0Yc0ITvpZGLu0phbVAe8ufMk5I/kdTcdS+5mlsQJcGP78sIIWJahXd7WqTjiJvaoMuKm1N/ms4rHX8y7WweZZHWEA1fZtXZmuFTjLW+TuyJehJrzGgnJpYtSXeYx0MoWnPov3Uu+CuLYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmwQwGI2pNIMoFlZrM4gOhh3Vo6+6pEAQ0W13ZCaqNI=;
 b=HFFNqMbBi5H8qDcW16alCpjPEVkqthmeI3aBWHSrCOw+8jZBJxDJXCjoIVwr/9Ued/ZHPywRiNjxisPsz48BovcZV/fiJ7+7vaIQ92Vs9kkFKm08LhereH65qK11O3QOe100iCD/KHa1VzDGHsQ7knK8cMCmoC2LaRz31NE/FT0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2625.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:12e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 10:35:28 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 10:35:27 +0000
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support
To:     Tim Harvey <tharvey@gateworks.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <CAJ+vNU1bnR+L-QkHAN_Yar0MUTjF+QoxgTHV9ZxQW+VWpM6cpg@mail.gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <e0ac6633-498d-ae9e-5eea-7d7d59742cab@kontron.de>
Date:   Mon, 26 Apr 2021 12:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAJ+vNU1bnR+L-QkHAN_Yar0MUTjF+QoxgTHV9ZxQW+VWpM6cpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.130.73.114]
X-ClientProxiedBy: AM7PR03CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::12) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (88.130.73.114) by AM7PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:20b:130::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Mon, 26 Apr 2021 10:35:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44a37439-6ae2-4573-36d6-08d9089f0212
X-MS-TrafficTypeDiagnostic: AM0PR10MB2625:
X-Microsoft-Antispam-PRVS: <AM0PR10MB26253ADAE07110E3121F8F59E9429@AM0PR10MB2625.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHyBiTJaQXhz+l7p1vhB9W3xPXgRd0Ilx698NoCT4N+KOpQ6ENrWXzB7/0QSGTFiwhBYTjRrNt99NnOgir/LfZUUiZ2eipKRb08ZEnxSXTIB5aprzkCMWeNRFMo7vg00XpxXtZZSGhuH6FIAfgF83EpVrNLu7vdQ2zvcjM3yA8r962h32CKsMuk961GJF41ecMERBrkxJCtMmpqPgbAUdFkaoa5txodagPj+33gsm5vdmuxl5jKmv7quxOlCsu3+cj3AoZGPgnexcg469oEMTgWj5nhRudOOpgGyBdRD5DFcGm7ZmlaQgb3Ny39PJHWfvyPVDPn68IVHMs9zZ/9vnnDQRB7TBbZoNWMB5nWnJnJwJ/Z75n85bSh2HxBM0KMlTYD1C+4sNe+SVNjwKBDyz6ptaGprnhIs/RmY6gC42gPRHU2M18AIDXZtfo4tTWf7MT7oipMwTnHfqfk9X/zqE0UrGHmZ3BFUk84qPJwKNHZO/Q6HD3+AmhsLGGVxKLHbk2firtYcUafL5q7gCelYGfrYG4wJ16PJFEwTy53Spv5IvV/vkpS0gVyU1tLrwFxNWG4MWbEcie/ifQvkyrH9W5ET4Vo4N7oEpKeGSm39s1Thz4hsIgCRTJq/dO8QF6VrxoGXFZV5WiKr6n6gPx/dRbcW+f1R/bSuI1v3Jz05rwI5oK3xzIB0UjMTtahzfFmiGbq19eeIYspk/awqYIeAU46jBcm5iavFBHTaGzgnnfNtn+txFbi+pvvRzTjUt+3IebRpWbawzUW61xMLrD8UXXNLO/6RzmDsP163TjhhnmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(2906002)(44832011)(5660300002)(4326008)(26005)(2616005)(31696002)(83380400001)(31686004)(8936002)(52116002)(8676002)(478600001)(66556008)(66946007)(186003)(86362001)(66476007)(16526019)(36756003)(6486002)(7416002)(966005)(54906003)(38350700002)(38100700002)(316002)(53546011)(16576012)(956004)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UCswTnNjanY4RzN5aHc5OGJSeGRNV0Q5QTR1VWVpSWNFN0pnb3RQR1Y4bklj?=
 =?utf-8?B?YjdUYUpscUFxNi94eWtuWSs4bGFkWFlkdVhjdUdqYW5xSEx6K2MzMEdrVXVn?=
 =?utf-8?B?bXh4V0t4WVFSaDdMbWorSHJvSHQxT2tkMC8za2FlR2pzSTMyZlBOK0NNTHln?=
 =?utf-8?B?NWVac1ozQXNhVlVHNnJ6cDVIRUhLRFJ3UENodWFERzA2RkVwWDFuQm8wbDV4?=
 =?utf-8?B?ZVBuWnVRME5aMTFpQjJma0txM2IrTWNVNHZzZmpyMUFNQ0Y2aVNvK1VGMnM0?=
 =?utf-8?B?WDBiNCt3bHFrNUdaVDBYcWVPc282ampMUTNNSmo2aHdaRWNuUXlqelY5MHdq?=
 =?utf-8?B?eG5UWEJwM2VwYWtPaysvOVMvZXlKdkFhb1BteXJmNllPZ1FoMDN2aEswdjVF?=
 =?utf-8?B?NXVpL014d2VqTVgwazNScnJFNmw1dHVWeUVsVHFJdHNrVWpCUEdnaWNPbDVU?=
 =?utf-8?B?eGhESWVmeHd2WDhub3BhTEFtaTZ5QU0xeDQ0aWhKc1ZpWUVzRENrZGtqL2Rw?=
 =?utf-8?B?akwrc3ZDbDdjbVV6NnNNbkFXbnlYZ0hpMUxKL3RXMDA2eUU2MHZtUFpZOUNK?=
 =?utf-8?B?b2JPcUVsREZUZkZmSkh0KzFocUVGZSsxZlJEclM5bk5VY0hQTGZnZDYzQlhB?=
 =?utf-8?B?Yk8zUHJlUXpRMHMxa0N2aVVheFI3Ylpkc2NuK1d2a04xOUxpaEFXelMrRzVu?=
 =?utf-8?B?STBSbWpnOCt2NDlVaHhBNHZ4eUNtZzY4eEw5VjdwMzU4elk2ZXE4TGdjdDJl?=
 =?utf-8?B?ak9KL1hIVXE3YkFlOE4rbHA0NWFrSjdmclpmU3g1bkN1THBxZVNDd0RJUmNi?=
 =?utf-8?B?R1hCNWZzbGhHbjA5cFNmUjJQWGNOT3BGVTJ6ODhuZHdsbjB0bGdEU1dYRHg1?=
 =?utf-8?B?RXFqZUxSY1JYUENwcGRUV1lXOHhCb3M2SEdXWXlTcXVZREI0TUVLREpiaWhZ?=
 =?utf-8?B?Q2dFZE4vdElqWEFZVkhFV3ZTc25RUWFDVW80MjBSaHlVMkZSZ0lNRmhVQ0l6?=
 =?utf-8?B?cU5IbVA5bTNvb3orSk44SkYzeThVZS9HYXgyM21pWGVTc05XVFJuSGVaTTA1?=
 =?utf-8?B?OHdjYjR6TlV3RWhPUjgydG5DakdPRVZ0ZnoyS1NrM2t4MC9tTWJGME1lcG9T?=
 =?utf-8?B?dUtBQ2ZYMmtTRjB2cTU1cGt3RGlUV0dZbyt3ZFR6dHl2SlZLanhoZTJUUVRV?=
 =?utf-8?B?VmYxNXI3K0pKN0xQNkhCdTc5cEN6aGFYcUFrY3pDcmMyaGRHZXUzMUhQZ0p3?=
 =?utf-8?B?TXBKWVJWZ0FraVNKSFIwR1YyaWsyQlB4SnMvS2Z3VzRkb1FKZm9jNzM0UGJl?=
 =?utf-8?B?SkJJT1Nva2hhcnVtNWV5TGlKdWNOYXF6NDNvR0lGM3FNcDRXT0kyb2VISUUw?=
 =?utf-8?B?VmlaTng2UzgvSnNWVHZ2RysxTytRaXBMY2gyaDd3OHlISFRFWU5SUkI4WEhG?=
 =?utf-8?B?ZXhLL1haWEVHd3AxYnZWLzdSckoxa0tOS2lSYXdmZWh1c2pmYjh5WllKVXF3?=
 =?utf-8?B?Q29wWmhUL1ZrclNYVVBVeHhROGk0QkEwUU9oR2pnL3dzbmxvdGJSRWt5dEJv?=
 =?utf-8?B?dnJXa0pheUhUbzZidUFKcGxjcGJZUTV1L3dibnRmd1pEUlFrOGhZVEJyWVRa?=
 =?utf-8?B?aUozS2dSQjN2aEZyMVIyUEVKKzdzZXIzYWpNOHEyTjBXVEtwM3ZUYVVvV3Y0?=
 =?utf-8?B?anlKczJQYUFveno2aHpJSGJIT0J4VzBialpYQVhuZFhTRTdhdFZTdmZIMDhp?=
 =?utf-8?Q?304BsTB/UgIz+cI/BFsg23bJpJ4QF0utAvMIvty?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a37439-6ae2-4573-36d6-08d9089f0212
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 10:35:27.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++i6zy5QrgKeZFfUAmTebIXWzKTj341jfIutKDTCYJdCReV8oMtZ9eVsxdd28Sgj11cAFTQ2nWCqdGe3RuOnwYKCRCk2iK9TaSUXgLZPVB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2625
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On 21.04.21 17:27, Tim Harvey wrote:
> On Mon, Apr 12, 2021 at 7:31 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Hello,
>>
>> This patch series adds support for the CSIS found in the NXP i.MX8MM SoC
>> to the imx7-mipi-csis driver.
>>
>> The CSIS is an IP core from Samsung, integrated in different NXP SoCs.
>> The driver currently supports v3.3 of the CSIS, found in SoCs from the
>> i.MX6 and i.MX7 families. This series extends the driver to support
>> v3.6.3 of the IP, found in i.MX8MM and other members of the i.MX8
>> family.
>>
>> The first 21 patches are miscellaneous cleanups and improvements. Please
>> see individual patches for details.
>>
>> Patch 22/23 extends the imx7-mipi-csis DT bindings with i.MX8MM support.
>> Support for other members of the i.MX8 family will come later, and for
>> SoCs including an ISI IP core (such as the i.MX8MP) this will require
>> more work to handle additional glue logic.
>>
>> Patch 23/23 finaly extends the imx7-mipi-csis driver accordingly.
>>
>> The changes in the integration of the CSIS between i.MX7 and i.MX8, as
>> described in the DT bindings, have been found through reading of
>> reference manuals and BSP source code, with different sources of
>> information contradicting each other. A confirmation from NXP would be
>> nice (in particular regarding the clocks).
>>
>> Laurent Pinchart (23):
>>    media: imx: imx7_mipi_csis: Fix logging of only error event counters
>>    media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
>>    media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel
>>      mode
>>    media: imx: imx7_mipi_csis: Move static data to top of
>>      mipi_csis_dump_regs()
>>    media: imx: imx7_mipi_csis: Minimize locking in get/set format
>>    media: imx: imx7_mipi_csis: Don't set subdev data
>>    media: imx: imx7-mipi-csis: Reorganize code in sections
>>    media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
>>    media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
>>    media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
>>    media: imx: imx7_mipi_csis: Drop csi_state phy field
>>    media: imx: imx7_mipi_csis: Rename mipi_sd to sd
>>    media: imx: imx7_mipi_csis: Rename csi_state flag field to state
>>    media: imx: imx7_mipi_csis: Turn csi_state irq field into local
>>      variable
>>    media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
>>    media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
>>    media: imx: imx7_mipi_csis: Drop csi_state pdev field
>>    media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
>>    media: imx: imx7_mipi_csis: Reorganize csi_state structure
>>    media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
>>    media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
>>    dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
>>    media: imx: imx7_mipi_csis: Add i.MX8MM support
>>
>>   .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 108 +-
>>   drivers/staging/media/imx/imx7-mipi-csis.c    | 943 ++++++++++--------
>>   2 files changed, 622 insertions(+), 429 deletions(-)
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
>>
> 
> Laurent,
> 
> Thank you for your work on this!
> 
> I have an IMX8MM board supporting CSI and a couple of devices to test with:
> - Sony IMX477 12.3MP sensor (do not see any mainline support but there
> are some hits on the net as this is a RPi camera)
> - Sony IMX219 8MP sensor (should be supported by drivers/media/i2c/imx219.c)
> - Auvidea B10x HDMI to CSI-2 bridge (Toshiba TC358743XBG HDMI to CSI-2
> (MIPI)- 2D+C) (should be supported by drivers/media/i2c/tc358743.c)
> 
> Can you summarize the state of IMX8MM CSI capture in mainline? I
> suppose the MIPI power domain is still an issue? Anything else that
> would keep me from testing the above devices?
> 

Just in case it might help you: I tested the previous version of 
Laurent's patches (not on the mailing list) against mainline v5.10 with 
Lucas' power-domain patches.

It should work fine in general. Here are some notes about the problems I 
encountered: 
https://patchwork.kernel.org/project/linux-media/cover/20210215042741.28850-1-laurent.pinchart@ideasonboard.com/

Best regards
Frieder
