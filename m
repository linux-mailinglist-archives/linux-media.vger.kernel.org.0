Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD5936B206
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 13:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhDZLCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 07:02:35 -0400
Received: from mail-eopbgr10105.outbound.protection.outlook.com ([40.107.1.105]:25477
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232878AbhDZLCf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 07:02:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHfSTRRz7n6woGPoVApEgpEVXfqM0qdHqI7cYvsIf97JyI7UZtdzrqxr+1+txSfL54fuaAcFePH0xgpMP8NqkYk/YVycTSgym0Z+nzxkwXlsEsdtKlhvkmb6Yf3NDkF1XGBp3aWSE9Rht2xlEhmPfo9Q1ExF90S9RBw6uHejF7kONM0kTTILR64+hlfjQBRCzcmuR6AbLOYABZC5yuWr4itr1XiTxyc9yvPvHQufm7aY4J6C/R1cZCRoAKk/By0d43mw+TkyPi5rWNvMymtujSKf8QiJNPJkBYCcTEvNiNJzF+KD6JIb/NdcgXgu+kbWq5uqSZVc5gw+SFwwnhDBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT/u6PFs7zfnTP5BkQQflXo19Q7hfsCiUdclsxjaQaA=;
 b=SQoaRTZK5FV8O5O66OVHkUk5+22avZnoP7qMuI3DplMM9DtpsaAzDXIYvGOdSVO7vt0An6YCzwGrBPoHNopMClzcxlU0YBAxQ2kTWtWmBulCsMM6EeHd1JNmMGph2ydFiZDpMNdLmWrJHYMagY+Jk/a9VyMQy94uYCjLZSpBU0jdqNuM3eIHDNEkgoInDMbajIDqjg9oTZwKG6FJsRK5TIzWTn8XuPQacQKvF5C5Pc6xPqepK+DSzd+WoF+Fx7F6rbyzvyZvC1Ddq5aAk96dFXrdLUkVctIt9vdmvWpEDx2jfiYtQfh4aVWyG2bUjWyBfs65c0zD2e0pYeptHKVLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT/u6PFs7zfnTP5BkQQflXo19Q7hfsCiUdclsxjaQaA=;
 b=I5K2fX9GnYxY+TOEBtvC1PH7ofSsv1KsbOERc+xsIxioHZEWBMiD5QN9BOkDK+f0cHo7bkspW32vve9ezRujcYB2D32HbbQFdhll1L7LdT30tmP8IAX8EYCYz39ZWMNs98m7OHrgca/jGp79kBUuy8AyjaZvRJEiHDNiZX7oOFk=
Authentication-Results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM9PR10MB4611.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:269::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Mon, 26 Apr
 2021 11:01:52 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 11:01:52 +0000
Subject: Re: [PATCH 01/23] media: imx: imx7_mipi_csis: Fix logging of only
 error event counters
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210413023014.28797-2-laurent.pinchart@ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <3b17ae30-b275-781a-1991-0412cc42b769@kontron.de>
Date:   Mon, 26 Apr 2021 13:01:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210413023014.28797-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.130.73.114]
X-ClientProxiedBy: AM6PR05CA0030.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::43) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (88.130.73.114) by AM6PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:20b:2e::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 11:01:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4638171-00ae-416f-2b74-08d908a2b288
X-MS-TrafficTypeDiagnostic: AM9PR10MB4611:
X-Microsoft-Antispam-PRVS: <AM9PR10MB46111CCA8F0D31920285748BE9429@AM9PR10MB4611.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEA12rIlAjKrlP1V9ybIhboyeDUL5jTi3sjnKhacJPIP/cXt2hmjtSrYV0ANZnmJaxijYeN5EIljXHVqmSrw0F818O0ZxHSf6eYG2Tr00yfUNmX26nvJCzqHFqmukH/in+r3rb8x1zfSneu0pXzEUXhiLuzM/0tVDwMoymHZ8F6cI8yKWIw7KNA4OL9hxeHolwd2RPQiMGpLguR7PMj5zugI9k1PGNgdVkksaVis/dagwshnxGpabtgbDiUXwE1OqORDqz0ybaR97xpSFwmRi53twSXXnwtiNuvh7xo2RMCb2bRCpGYNkMZxZsQXup0QLnuZgsLULd4gU1yLIFC9qUoiqPnPA0AkU4BdvFMtfMVejVG8RGt90qo352/mBumY85GTw3fTpLRlOulBbt01QRwFFRF7NA5MPjqFiyIDzJXZYE/3+xUb6Vo3lDTpmrAiY92nUGUnFAnDmOP/SdeViaqMAo0AakoMaDgDtbnxAHYBjL2myKC6Bwhk9D7ZZnsOeVQTX+6t40Hf5uKTvI/N0iXzHLnTUKG9l5IVaI5ja6eJwCbDXkR/IeSY2H3L30HX6hsBiUxcq5tUpz73wqEZ+03T2ZzRWfcJZLddHSDKog1o/bGhRYKaLtSFCx1WgRiO49p/7q7k7FOfjAGhz2QL76w9N2Vq7AxUStJX8dffNt+rBFA2eI3obMdRcXF6Y65rh7SvWipNVR1FsOogK0PFIiNF19VWHvv+FKEbw6bJT74=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(53546011)(83380400001)(478600001)(5660300002)(16526019)(86362001)(2616005)(956004)(66476007)(6486002)(66556008)(66946007)(8936002)(52116002)(4326008)(54906003)(8676002)(2906002)(16576012)(316002)(31696002)(38350700002)(31686004)(38100700002)(36756003)(44832011)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXd1ZWdtSDV5WW4vT2FDVUtRdFBsZmZyMCtPbkFrZ0NlMEJ2aGRTTmd5ZnVs?=
 =?utf-8?B?L2RNQXFYQi9ubWZGZUVJUkZVdWtjeEsrQU1QUVJ6N2ErLzJ0UzJVMmhWc1Nm?=
 =?utf-8?B?TERYbklJdWVjL1pOeU5YYnpRRXF1L0YydGxmZ3FsVlJUVFlEcFl4UE1IUytQ?=
 =?utf-8?B?eTVDTWl0NXVwS2NpYThvS3VzZ3F4TjRqaGNKQXZLOWFsaHh5S1lwbC9LZTZK?=
 =?utf-8?B?SjByQmxMLzI3b3FtcUxITThPNkRmeTBtNElTa0dPTXNLaHNWWjZlT3E4UjJx?=
 =?utf-8?B?Ni81TE03dnJNb05VdHR2RlZSUU9uakNPdUt0Q0ttK2ppeC84UEhrSkJmSy9Y?=
 =?utf-8?B?b1FRU2dIaTZVcENXM1ZTQnp3L3pDNTEzc2Q5b2lmU2ZSbGFNL3JYZC94MWVS?=
 =?utf-8?B?QXlndS8vRTlHdmRYdlgxWmFURFgrcC83VHNGRzlrV3Z4MXRsemtNRkdLVmpY?=
 =?utf-8?B?TkJHNnZZRzZLSGNZL0diQ0JFRXgvZjZFSTl6eGpBTkcvMi85ZzAyV2h5aGky?=
 =?utf-8?B?ZndQcFpkUnZQcGJ3Uno0UmlUR1U2SGl3M0tLeW5KQTRYNGtRbnFsWDQySlJW?=
 =?utf-8?B?cUY0QWxEdDhEd2JiZFNqL3hQOVVaTFArSjdxQ1JKTG5TMG45VTBmVEhjR3JK?=
 =?utf-8?B?RVo5ZUNOWkpSell1clVkQ3RjUW9yNjhhOXN4aU5rMXZ2V0JWOWJwUVd1Wng4?=
 =?utf-8?B?bjVaZGVOVVBTTmZyUmhqbEx2ZEorbTB4VXAxNXo0WEMvTG5EQys1OGVlWTlV?=
 =?utf-8?B?ZVFrc2FYRUYzYWZTdEx3dFlJWHNWd0dXOGJ1N1hRS1pNL2RjK3VUdWZhRjU0?=
 =?utf-8?B?dDZ1U1JtWGh6bHZWa3MwMDdWS3FqOXV5OVBlOUlVR0VNeVBTM3RxWWZnZFAx?=
 =?utf-8?B?ckhrQTVmd0ttOHFVL0s4ZDljdWFjN01GYVowbFRncTVlVVRrVnZqMWYyWDM2?=
 =?utf-8?B?U3c5OWlwYWV0ZHF3bGhCQVZJd055Z00yb0h1WVllYy9PbFhHdTZCemJmTUdE?=
 =?utf-8?B?YWk4VlQ2RmNIRG5haVEycGllQkdCZ1MxSHpsRU1idU50YVBFdys5OGxFZ1ZC?=
 =?utf-8?B?cWJPdTBwUXljem1hY1I1bVpkZjF3MVZBYnNtd3VlMlQ2d3EraFNTRkt0MkdJ?=
 =?utf-8?B?b2htR0dSSXU0ZnVkNXJCeUk0Z1Bpc2RoajlTSEhQdnZnVHRsRXVaZXNFaGhn?=
 =?utf-8?B?VWxVK2tMdk5hMHVPVHYreXBqbFZ0eTZQRmNoUlNHS2hqTlZ4TThMMGJ5bW56?=
 =?utf-8?B?ZGdkSFBlMGk5a3lXamQrV0R2bHQyUlhQZksyYmhiYS9Yc1JLY281bE9pSDRD?=
 =?utf-8?B?VEE4dk5reHVSMTFmam5ZQmNyRmJHc1pSZlhHV2pmU2YwMlpONkgySW5HSDFs?=
 =?utf-8?B?VUYzYUdUSWNlR2E5dG9XeHJyK3BJOTY1L0ZxVUJIZ21iWEJEQUtEVCtLdStY?=
 =?utf-8?B?L2MrQktYcVcwTkNWdy9URFZya25DL29IdVVoSGxvQk5Vb2dQVlk3cHB6OElu?=
 =?utf-8?B?MEZHSlFRRGJvRFVicWRZQ2Y5UmsvZ05rR1Z0UGROajdFekhWd3ZwTVpZQmxk?=
 =?utf-8?B?dU03c0hFTEtoa0U3NVQ3aGlHMDFuSHlDVFpiZ2VBd25RRDNTL29zejlCblA4?=
 =?utf-8?B?dW5NY00yNzlwL3ltcFBRM2RmRG1RUHJpQThlRW05NTROVnp2Q3JtZU1lalFI?=
 =?utf-8?B?b2RhcDgvdlVvZDUxWWFsZjcyMm8xSkgxcU5SRENtalNYb1dwVzZBL3dYUXQ0?=
 =?utf-8?Q?Pa0f0j0D2w1STB9iEQ6zj1cYUBSkO6VbLOsAP2Y?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f4638171-00ae-416f-2b74-08d908a2b288
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 11:01:52.3917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEvaLoldh0G8mMn+Kmc5LZf2I/D3t8pmeRNSoCjEorxNWGBrroSUrMj03Up02losHDLD94hiuKsTzjUmBMUv270W+DQb3VSrtAYnEwtN7vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4611
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13.04.21 04:29, Laurent Pinchart wrote:
> The mipi_csis_events array ends with 6 non-error events, not 4. Update
> mipi_csis_log_counters() accordingly. While at it, log event counters in
> forward order, as there's no reason to log them backward.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

As there is currently no user of mipi_csis_log_counters() with 
non_errors set to false, maybe we should just remove this path?

If you think we should keep it, I'm fine with that, too:

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 025fdc488bd6..25d0f89b2e53 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -666,13 +666,15 @@ static void mipi_csis_clear_counters(struct csi_state *state)
>   
>   static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
>   {
> -	int i = non_errors ? MIPI_CSIS_NUM_EVENTS : MIPI_CSIS_NUM_EVENTS - 4;
> +	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
> +				: MIPI_CSIS_NUM_EVENTS - 6;
>   	struct device *dev = &state->pdev->dev;
>   	unsigned long flags;
> +	unsigned int i;
>   
>   	spin_lock_irqsave(&state->slock, flags);
>   
> -	for (i--; i >= 0; i--) {
> +	for (i = 0; i < num_events; ++i) {
>   		if (state->events[i].counter > 0 || state->debug)
>   			dev_info(dev, "%s events: %d\n", state->events[i].name,
>   				 state->events[i].counter);
> 
