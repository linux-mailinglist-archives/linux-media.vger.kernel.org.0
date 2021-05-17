Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E84438290F
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 11:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbhEQJ7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 05:59:11 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com ([40.107.1.127]:34630
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236382AbhEQJ6d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 05:58:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVnyRgAMFpjrQtg1DJQmgRxj678fki8kcOqWMi5czATjvSMU7DIldS45CeOp+prGVtfFfHZBrHrAF8TvEA7mOEMZjXbPoIpvYyL0aN6Yo+7G2MRu+9hhq3gfnIIHUX/sE06MgwPiAyS+orYHqZ0xRVSNafMvcjnGtF86o66tDnp3v4P1W9X57gz9LvMxatEV6LRGaeJOnLsOjRyk/N2t53Rb23n/asssWY/6udf59vUM5Ph0CO8T6ZLGDr+ML28uvgEutdqITGhSWd+kMkpifmsuFUWDRohnlJEUzXpAjr2sr8N1yEoiRyFVRrsfofJo1iPsIh6A22mFDqZJ3jVo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdYgfQrmGw33nUPIC6zLhebL8bMX/cteDtXZbn0qCtg=;
 b=jp74IWoBPtwOxAww5dYXRagfJLD55icqisgbB8+NpA73fH9HbEJuO8Ugk353mtBq0DD7uv9d97RskC0kymafj6XxZdqW4rpGdRPvamt4Lr61mSH+y2U93CDFed7+piIxBKTnObtwdrPa/qtMF1CLU3gfaH0zWoScoyqWVuf4vKpjt8M45E5MI0YUfw4cOvll73waIckqjpnjslcx1rdxgb10GoVssd583y/Uv6YZ6INq1uzmwg4Tvx9IcCb23Du5BVyzPuJoT1ASlbSL+BdHmlA8mu+oqMxjz0EplH+ugHnfhXtvbuFCdQrVvVus5ifwN3wgmtIpW3KQt17UCXR/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdYgfQrmGw33nUPIC6zLhebL8bMX/cteDtXZbn0qCtg=;
 b=KqSmCE3NW10qKaXi/0kezC0+uunMuuQMiXkSAC6qvaF0Ac72fXUmznZQJGlAajLp55k09MK1+Ps5h8bY9Dr7aw3zZoNpZnOIJOwEnWCVDoixg24JXvHia8ib9Iv+yUKgXW7EjJxS+4SNv61p2AOj3nmE1c2sbIo5tXzCqM8lv2A=
Authentication-Results: gateworks.com; dkim=none (message not signed)
 header.d=none;gateworks.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3220.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 09:57:15 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 09:57:14 +0000
Subject: Re: [PATCH v2 00/25] media: imx: imx7-mipi-csis: Add i.MX8MM support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <31f7ab91-ad36-af79-fd7c-d3eb95d26c59@kontron.de>
Date:   Mon, 17 May 2021 11:57:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [109.250.142.188]
X-ClientProxiedBy: AM6PR10CA0058.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::35) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (109.250.142.188) by AM6PR10CA0058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 09:57:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9e8c193-7fad-47ff-4a0f-08d9191a25e6
X-MS-TrafficTypeDiagnostic: AM0PR10MB3220:
X-Microsoft-Antispam-PRVS: <AM0PR10MB32200A27F58E51605ED98D4AE92D9@AM0PR10MB3220.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHn+9JnnsLcX+xVKcm+wq+X7Itt2Im9cWaSqlNjznkDTMlkee97Tu+PeDlVwrazbxEKcRshkcLQR3UFkuykRgCrqnZswSyFoJt/f1msrB5YSGTDBFStBh5crz2QuJZXPHc69brI3tJNoD+hzfdOqFhq0tf13m0a1hnx/1pyAlCITXocBc/gs2np9bXKOxyu1XU714uJvYWAEroihPHXQrbbUj7WlAfflN4ctBNQ1lEpXG8M2k3qURu/AOmdvvP14FvTZoYXQjMRnoTg7+JLSRMK/mZdVtg+Bmxcb0g+9NtoXb7T7rAMyAOWy0No30V9O1Q8J2yxRnPqOoHgJfNh/Z37+4opkFB4LET01lyPh5GyuyAn751ZABsv8Hf/9ndKsN2/Rzca61yv8a7hKHX4rZBo2ZIJVn9ofk46vjkjv18v7AYVqwxyyt/ZYxW8UGesb1SlurcwqCPVqWn5efux7uOLSVaWoy9FCiX+bi8+PmezzmTa6eQHvdU5oNw4+PXre0DY0WpPg4x0ugUR41ZrUGgI9VZFCbfBdHZPHtEjurW4RHHExH3DN8Mxjjml1tLQds/I0XAxwZITA9PionYNJRVfEImX/GCPn2ZWq6a0T22VogegB2nNYeBu3/d4Fo4arG/kSIWtRRWp/2rOoUfajIReDg1tJEQTKEuADPFQC5MDDp0a0L0G4KNJNy0d2p1psPQzTyziFVxGWoV44CtWqNe0ZKlY0FcmkwHGMbea5rjWBdZb02iFeyEn5qYgQv8T3ZRkqBohR+bfuirCSxKglLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39830400003)(396003)(346002)(376002)(2906002)(508600001)(53546011)(2616005)(26005)(5660300002)(36756003)(956004)(86362001)(7416002)(83380400001)(16576012)(186003)(16526019)(66476007)(6486002)(4326008)(966005)(8676002)(44832011)(54906003)(8936002)(31696002)(66556008)(66946007)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0lrUmxtenVqMzdDeVJQeGNzU0JvdytKYld4M0VBM05zNzZaMTFISlpIcXBZ?=
 =?utf-8?B?V3VUZ0I5RjF2K1BqSzd6WG95eXE5TFlJUmtuM0tXMVI1QlFXUGtlQTFnU3Fp?=
 =?utf-8?B?YUlyTDQzeElqUXBnT2c3aWtQWDB3TmcxMEkyQ0MzZFlQcStJM2xKUzNUNERa?=
 =?utf-8?B?Y1pZYjhUbXJxcDgyc1ZrQ2pMK25ldjlWWU0yb2l1MFdDS0tCNEt3MWFyWDFr?=
 =?utf-8?B?Tm9odllzWWgybWduUHNIMVBMK0VVRUhXdTAwNEY4b05tM2t5QzZlekNaK0sr?=
 =?utf-8?B?cmt4QWdKNitpbmFRdEFDVGlMOEgyQzR5Q3Z6amNHc0NabmRHd0gyVWduT2ZW?=
 =?utf-8?B?M0djMURFbTRkcS8yeGduWFVpdThuVFkyNk5ENHRVRnJBS1YweDV3SDEvNXM4?=
 =?utf-8?B?TXpRL2xla294RHJYbWt5akRWZWpDWHlmMXc1b3hwTVpxNWg3alpmZDRkc1R4?=
 =?utf-8?B?aVpsU2lQYkhjcUVCb0grK0dQS000NkJtLytLa3pEM2x3L2dDclZiYkJPWlZ0?=
 =?utf-8?B?QjNHZVduQ1RXNU4rUmlGVEw5cW1CbVljYzlHeElrSDNKb0ptQVlFWU5nVWZE?=
 =?utf-8?B?bHh2NC9RWEVwSWtIWFNoR1JnOGdqdG1UUENQS2Y4T2dCNkI2L05IdzN0alFY?=
 =?utf-8?B?cWZVVVJzaG5sR0V5YStKM0ZpR29rNmdLWGFUaisyRWZkczY4OWtjYUhSLytQ?=
 =?utf-8?B?WFZaemVVcVVOdVhVWERLSDcrck9xSG4yS0RWMEN1TzB4YUZPMlNteWRVRUFo?=
 =?utf-8?B?NEhiQVdCWkE0N3pwc3dQWlNpdWpsbUpaZEVIc21UMTQ1d1ZKUzlub0JNUE1P?=
 =?utf-8?B?N091S0ErNjJKS1JpUkx2YTYybi9JR1JVdnhpUHJWbXVCN1NZT1VhaGoxZVor?=
 =?utf-8?B?YSs5d25TUk16RDF1aXpQUExOS3lDNHdMcWFabUlVZ3Y4M1hTZlBCTUNIN2p2?=
 =?utf-8?B?TUthZHJ4aVNpd0xsMHBqY2dLaUgvZWhBUEU4UEg0OGNqSkk0QzhjYmN1ZFQz?=
 =?utf-8?B?ZXA5ei82RitkSHN2bkVJNlhlbHBBYlMvbzVxYW1UbnFNWkZJS003eXd5ZFFi?=
 =?utf-8?B?ZGtTMHExbTJydDVzVHVWM0VROFB5SzF3b2RnWGZMQlRVT1FWZUdxMFV4U3dN?=
 =?utf-8?B?aTh4MW42REpab3lnYkErTUFUdmd4T3dOY2h5Q3BsRG9jV2h0cmphVXhCbjdi?=
 =?utf-8?B?enVpb3BaYTNkdUdRMjh2TTk4U1dGQk81Ti9xQ2Z5U1o4NGlyUCtUTnJYREZs?=
 =?utf-8?B?emtLektDczZ6aG5NZDh0TVZ6aCtneGM2WnJ1emN5UUw5VVpobURjKzc4T2Zw?=
 =?utf-8?B?dVFHdTNrL056SWt2ZklDM1dwTkhuWEpwbXRvOTVla2pYUGVwUXU5MmhKMUM2?=
 =?utf-8?B?Zmk1YllQUHdwUGsyQUNsZzQvNlJvQjNmQVBaYTMzRjlkTGtSbHgxcXlCRW9k?=
 =?utf-8?B?cTNBczNhdjVwVjJFakJvdEZFYVl3SVVLTys3YmNnSnV5OXlpWU93R0hrZGw5?=
 =?utf-8?B?aTlTMFh2S0VGWlE2SGV2L282d3hqb3Y1VTRheFUvZE9tYzFPQ200Nk0ybmtk?=
 =?utf-8?B?akpkbU41SlorUEZScUtsMVJ0MWRjSENYeENoWkFLQTk4Tm1JK2hnK1d1QThm?=
 =?utf-8?B?eTErdGp5empIV1pQcUJFK3VzRmxYR0piY3FLeDJka2pzWmtYWXA0eG9udUdT?=
 =?utf-8?B?M0lUam9WanR1enV2L04wSlowS3pWQnk1dXBQdTYrQ3hVdWtQdmxibEt1SmlX?=
 =?utf-8?Q?j+m7uwWux8gDCsdDT/BHPm/vaYZtLLyBrR8lf3n?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e8c193-7fad-47ff-4a0f-08d9191a25e6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 09:57:14.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynddMharH2y6LR1cEpcGf1x7RISSg6VZxdY+SKLR3cw3PdJ4fRH2DctPlNC69N8XrvhSU+191NtRjT1rrcwxecY7WgFJbEejoC61SNw/X8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3220
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16.05.21 03:44, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds support for the CSIS found in the NXP i.MX8MM SoC
> to the imx7-mipi-csis driver.
> 
> The CSIS is an IP core from Samsung, integrated in different NXP SoCs.
> The driver currently supports v3.3 of the CSIS, found in SoCs from the
> i.MX6 and i.MX7 families. This series extends the driver to support
> v3.6.3 of the IP, found in i.MX8MM and other members of the i.MX8
> family.
> 
> The first 22 patches are miscellaneous cleanups and improvements. Please
> see individual patches for details.
> 
> Patch 23/25 extends the imx7-mipi-csis DT bindings with i.MX8MM support.
> Support for other members of the i.MX8 family will come later, and for
> SoCs including an ISI IP core (such as the i.MX8MP) this will require
> more work to handle additional glue logic.
> 
> Patch 24/25 then extends the imx7-mipi-csis driver accordingly.
> 
> Finally, patch 25/25 updates MAINTAINERS per popular request from people
> who believe I have too much free time :-)
> 
> The series has been tested on an i.MX6ULL (for the CSIS v3.3) and
> i.MX8MM (for the CSIS v3.6.3).
> 
> The changes in the integration of the CSIS between i.MX7 and i.MX8, as
> described in the DT bindings, have been found through reading of
> reference manuals and BSP source code, with different sources of
> information contradicting each other. A confirmation from NXP would be
> nice (in particular regarding the clocks).

I already tested your pre-v1 off-list patches with my setup with ADV7280-M and I now tried it again with your v2 patchset and the RFC set for the bridge driver. It works fine with some additional changes specific to the data format as already mentioned here: [1].

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>

[1] https://patchwork.kernel.org/project/linux-media/cover/20210215042741.28850-1-laurent.pinchart@ideasonboard.com/#24139291

> 
> Laurent Pinchart (25):
>   media: imx: imx7_mipi_csis: Fix logging of only error event counters
>   media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
>   media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel
>     mode
>   media: imx: imx7_mipi_csis: Move static data to top of
>     mipi_csis_dump_regs()
>   media: imx: imx7_mipi_csis: Minimize locking in get/set format
>   media: imx: imx7_mipi_csis: Don't set subdev data
>   media: imx: imx7_mipi_csis: Reorganize code in sections
>   media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
>   media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
>   media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
>   media: imx: imx7_mipi_csis: Drop csi_state phy field
>   media: imx: imx7_mipi_csis: Rename mipi_sd to sd
>   media: imx: imx7_mipi_csis: Rename csi_state flag field to state
>   media: imx: imx7_mipi_csis: Turn csi_state irq field into local
>     variable
>   media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
>   media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
>   media: imx: imx7_mipi_csis: Drop csi_state pdev field
>   media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
>   media: imx: imx7_mipi_csis: Reorganize csi_state structure
>   media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
>   media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
>   media: imx: imx7_mipi_csis: Move PHY control to dedicated functions
>   dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
>   media: imx: imx7_mipi_csis: Add i.MX8MM support
>   media: imx: imx7_mipi_csis: Update MAINTAINERS
> 
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 109 +-
>  MAINTAINERS                                   |   1 +
>  drivers/staging/media/imx/imx7-mipi-csis.c    | 994 ++++++++++--------
>  3 files changed, 658 insertions(+), 446 deletions(-)
> 
