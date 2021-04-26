Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228F136B26B
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 13:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbhDZLka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 07:40:30 -0400
Received: from mail-eopbgr60105.outbound.protection.outlook.com ([40.107.6.105]:10366
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231550AbhDZLk3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 07:40:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa8gIzUziurYWK4scKUBmeUUc5gs8wOatypnLjm7k1kTiS1isd60rHK7BSfOBSZwCJRF4t2inta+FljQ4au/QCcWLidUTOy8HNWI506JzOlxZy/ZYuPRfg4ic4aRmOwXtra/f1mldE0shNz1jWazx6jFCI2oy7tagVkAK+3NwUEic4B7LuAM6M9kz3ULs6KKuC1D3GubcZ0YtVd9j0O7FkNT6HA4vz4W5pyTgX1AgDQD9hFZqSjeuSuXdYsVvCQW2CNAzFMKRtKhoAdH7IoZSG89W7Q6qA0lw9xhC6TFCQaqbJGdrzWepfS4tNPcOD24tsxJX8Goz6smBvymO2nJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbvaAmYl+lJ5s9i64mGl+wsECpBrRCGv3+4Aoz3qIVI=;
 b=G+ZapXs1hWA3wfYpDpkhCeLVnRieN+W1ftuf5e7aNTQtt7M1t7lKLuD6fUoqTSM32sV4+2WrBsI9+W0L1u8exdgP+ll6A1W4xdfq3biLz/Dr5rWZGWbiNNQxm3hB/rTOv0TjZlLQyGU1fV3wVKxatiohqiiYQiLLkKD0sdY2zxv18P2PLYre7p7z3Uz0OHDCuI+lIzqigk3IGjZ2hffXM6gtV2pM3PS3w6sdTEspy6zw+fVSN3MR7jQgfY7hEMfdXX+8sUfiXCd4Yrm7gho4STznx+IEqbrZLuHLCsAX2CL0KFXF8HXORZ9QBEpTKAwEnPEEDj+yV7KCbwhsuBqIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbvaAmYl+lJ5s9i64mGl+wsECpBrRCGv3+4Aoz3qIVI=;
 b=KkXmfMvcsh3mdGaxP5jAST8bHZ1PasMiiilXb9WM02hqomaCSTn5Tjeo6gianrh/JYAnMyZzV2QyWCk6Fm7bug/nE3LzAwwIJDC4gD1JrwZfb/8xuS9BP9xgyzVBWN2XzcvQEwVO9ohy7ybfNk+RvjKlQL55P7kULugEES9sxKo=
Authentication-Results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3587.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:144::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 11:39:46 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 11:39:46 +0000
Subject: Re: [PATCH 02/23] media: imx: imx7_mipi_csis: Count the CSI-2 debug
 interrupts
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210413023014.28797-3-laurent.pinchart@ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <0cce756a-7b79-d59d-ed43-a7c7ca44b506@kontron.de>
Date:   Mon, 26 Apr 2021 13:39:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210413023014.28797-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.130.73.114]
X-ClientProxiedBy: AM5PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:206:1::33) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (88.130.73.114) by AM5PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:206:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 11:39:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c36a4c-8560-4fd5-c36a-08d908a7fe1d
X-MS-TrafficTypeDiagnostic: AM0PR10MB3587:
X-Microsoft-Antispam-PRVS: <AM0PR10MB35877ACE6524DAE85436ACDAE9429@AM0PR10MB3587.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpslZwTOXxpuAqir8tXH0HNkW2a5Z3IaV/6MyicGbVQV2Qsk+cuEeMCOL/9mIglZdBjUxEL6UyA9lJa1PQFG5X6uo53qbJhXkabh4UKfthzuxS3dklpveu23ybRC6EEYfMe3rz3oc8Gll1Ut1yIaJE77xontaVcdzFpreECxpdb+Pz9GM6n/SFBK8Tocf5SYZWNX94c66/NNCSxqWnkwrpa5DWbFFXy32+OPfFr/zciTTesLI+BRNx6ScHzKjWEhq+aTJ2707o3dNtu8XkF0OgKcSBTA+wqQH9JSWQeqbW/NUjCGxCu2PBOVwGlQSHjVoTj+G+hEXoNVUt3t0b9RqHrA2952ezukKQBLx1iAjQ8Q8RXOjPMYqeOPkQ7RayhnXdvbw78a2VeUVjYCWfwKoin7zLdGJmIbrpfH1uOc8CDj4ot/TX778BGPA3hGatnJW6i6vL0ZduxaE5/MB/8JnfSNpD0GF/Yg1Qq1yxwCqd/ocB7YPX3YEnWvfQHrsVZlfoSdOzxjtTuVd5OlggrvNattWTm7n+3CVdME3zbcoG7LrYXrq9+zlyR7Ix9OwTRbvSIBIf+6V4ZYyTYKbT3V1UNd26KfxIxn5PRbOhKXo1A1WNzgBBmoVdR9Djm2QgGO/lWAE0BO7jvxXHiSor+aSYr/ixoLrQoUr5aCYc6HuGRGzdtdvPuOhE4D9QFwcTMlvpAku2tqRnd0JLPBNQfXJyRT7qUibE2O/chwgF9BQww=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(66946007)(54906003)(478600001)(5660300002)(31696002)(186003)(16526019)(53546011)(956004)(8676002)(4326008)(52116002)(66476007)(66556008)(36756003)(16576012)(31686004)(83380400001)(8936002)(2906002)(2616005)(26005)(86362001)(44832011)(6486002)(316002)(38100700002)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnVrUHdyQjdVeHVLSzdBaWtjUDFmMitpSlZMWkt6ZE8wL25DWUVWeHAxb25R?=
 =?utf-8?B?WDdQSnphNUJEMnYvTEpmRGNNZW1ZNUVaak9iRy9IMURlM0Q5OWM2eTg3Yno1?=
 =?utf-8?B?VlA4aHF2MytPNG8yWWNHQXNLQnlVMzRhYU5wRmxUWVVDaTRrNlcwNmFCTHlT?=
 =?utf-8?B?ZW9HWU5jMmRJQmRic3ZLcERrUHMvcjhqZ1JDS2tKNXg5QVpYTXA4dE1yeXJi?=
 =?utf-8?B?ejc2YWl4b2ZKQVFIdDZENXllNXRMMWlKcHY0OFp2Y0NaYXQwNW11YXRZaHZ0?=
 =?utf-8?B?SjlONnA3Q01ibUVsR1VJNFBmM2I1N0dxOElkRmxVUVMyaEcxYUlxM1lxc0lB?=
 =?utf-8?B?dlVORjU5MExzcGpxdEorSVZVWS9YNDhrRUNGQnk2Q1JybVR3dDJ6aStyTlhH?=
 =?utf-8?B?ZFcxL085SmNOUEJBd3dkUGxKengrY2JxZ3hKQnpHRDlNQVZiL296L1dRYXpE?=
 =?utf-8?B?Tkt0akIzNlNWMTBPVEJmYmJTSDBJNlhlZitFN2NYWlVwNGk1S0NNRUhpTmdU?=
 =?utf-8?B?RDZ6SkJtbjk4QkttazQ5NEtGK2tFR1U3akk4YlZvclErbk1QNCs1T3Z3UkZ1?=
 =?utf-8?B?SU13UUNIU0J4elZOdjdBUnJoODVVdldZdm16eExuZFRoeDk5R01MYitvYlNp?=
 =?utf-8?B?alE0K2RuYzFvUHY2eDhNamVNajVPclhhSGs3cmI1L3NEbC91dXpTekl0UGk4?=
 =?utf-8?B?em5pbW00ejVBb0pSbVpBeitDYzE4L09mOWl2UXE2ZzlSYzNKWklJVGFxdHg5?=
 =?utf-8?B?TTdrYWg0RVZ0VG5ZSkV0bEJjM3JlSEhlZEhXdFRDUktkWTVtVUdUaXVOTTRs?=
 =?utf-8?B?bU1kUUQ4b3YzM0hhYjBVNlRHK1MwaS9kd3Y2b080Mll4a0R4UlA4SU1xWldH?=
 =?utf-8?B?UmM2dnhvSVY1ZjJuT1pSSU0wOXBtMXBXMHZERlQ4QWxFNjlaS2JzOGFaQ2NM?=
 =?utf-8?B?U3JBUDdkaG14ZWxSZHVVWGs0a1J4MnVNOGVwYVZkendSRXc5R0pOMGlRZGt5?=
 =?utf-8?B?amMvYVpZeVZ3YWJpWW5oRlRINi9nUjBmVkt6UVRlbWdjQUhScXA3M1ppR0Z1?=
 =?utf-8?B?dWJ0cmVjbnJDWlJ6NlJUeGdoc2U3T1Bhdnk4b2cxbEJvaGxES1VuYnJkbU5s?=
 =?utf-8?B?eG5ZWnBOckcwT0R0NEtob3plZnVXeUY1Ynlwcnp2SytuY0hoMDZKWG5LWXph?=
 =?utf-8?B?ZU9MLy9IbU1kcXRQZVFRUnJkdFNTdVJzSm1HOFZsZDdPN2VsbG00UmVRa28z?=
 =?utf-8?B?eFNhNEhzejJFUkhrQTF3WGhEaDJkTVVXMDJmU3BkUHF0dzRtWDUvN1hvL05S?=
 =?utf-8?B?SC9qcCsrdExjdkI0U240YUEwUkxsRjQ5ZHIxRGRkWlFMZFVnTGlnYmYyV0Yx?=
 =?utf-8?B?V3NHaXBRTDNaY2dtVEgzV3JDc2ZLSlJoRGJ6ZHd1UVh6cEZqNzg0dnRRY1ha?=
 =?utf-8?B?THBZR0lGekhwd2Y2R1Npbi9KbWt3Y2NadGdWanJxMVJKbVJhUGtENG9nM3Ni?=
 =?utf-8?B?TVYzNnFCZHE0L0NRdEg3cy9iaTI5cXhRNHRhUU9vNTV5NnU4enpkQjBMQVVK?=
 =?utf-8?B?ZmxhUm1PVHQ4WGZrSXU0RHJrOEU3bzlqZlVsVm05dFFJT282VU4rVk95SHdu?=
 =?utf-8?B?ejdTZUxNbDJyNWo4VkUzdDhCSERNKytXMVNHeUVTcy9KVHV1dWs4OTkwb0g4?=
 =?utf-8?B?VlREM0NLY3daUTllVnpiTzlzTkNnMFJNNmpzMTMrYkRYYXhWQjMwd1pmQzhG?=
 =?utf-8?Q?SY51P3vEvpeb6GvE7JJ7wjUMWxfuOSjR9XJQKuT?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c36a4c-8560-4fd5-c36a-08d908a7fe1d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 11:39:46.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iccos3v76I70rVD2jK/BveW/h1rEhCCgJuyFAdELvQ0CclV6ZeAGfwQgwuDf2wlb+MVIB7Y7ez17Xj0CCtitG3svtp/88MYwtt8EulRAD8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3587
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13.04.21 04:29, Laurent Pinchart wrote:
> In addition to the main interrupts that flag errors and other events,
> the CSI-2 receiver has debug interrupt sources that flag various events
> useful for debugging. Add those sources to the event counter mechanism
> and print them when debugging is enabled.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/staging/media/imx/imx7-mipi-csis.c | 69 ++++++++++++++++------
>   1 file changed, 51 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 25d0f89b2e53..67911eb8761f 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -195,6 +195,24 @@
>   
>   /* Debug control register */
>   #define MIPI_CSIS_DBG_CTRL			0xc0
> +#define MIPI_CSIS_DBG_INTR_MSK			0xc4
> +#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT	BIT(25)
> +#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE	BIT(24)
> +#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE	BIT(20)
> +#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME	BIT(16)
> +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE		BIT(12)
> +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS		BIT(8)
> +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL	BIT(4)
> +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE	BIT(0)
> +#define MIPI_CSIS_DBG_INTR_SRC			0xc8
> +#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT	BIT(25)
> +#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE	BIT(24)
> +#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE	BIT(20)
> +#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME	BIT(16)
> +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE		BIT(12)
> +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS		BIT(8)
> +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
> +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
>   
>   /* Non-image packet data buffers */
>   #define MIPI_CSIS_PKTDATA_ODD			0x2000
> @@ -210,6 +228,7 @@ enum {
>   };
>   
>   struct mipi_csis_event {
> +	bool debug;
>   	u32 mask;
>   	const char * const name;
>   	unsigned int counter;
> @@ -217,22 +236,30 @@ struct mipi_csis_event {
>   
>   static const struct mipi_csis_event mipi_csis_events[] = {
>   	/* Errors */
> -	{ MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> -	{ MIPI_CSIS_INT_SRC_ERR_LOST_FS,	"Lost Frame Start Error" },
> -	{ MIPI_CSIS_INT_SRC_ERR_LOST_FE,	"Lost Frame End Error" },
> -	{ MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> -	{ MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
> -	{ MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> -	{ MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ MIPI_CSIS_INT_SRC_ERR_UNKNOWN,	"Unknown Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> +	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
> +	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> +	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> +	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> +	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
> +	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
>   	/* Non-image data receive events */
> -	{ MIPI_CSIS_INT_SRC_EVEN_BEFORE,	"Non-image data before even frame" },
> -	{ MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
> -	{ MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
> -	{ MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
> +	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
> +	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
> +	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
> +	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
>   	/* Frame start/end */
> -	{ MIPI_CSIS_INT_SRC_FRAME_START,	"Frame Start" },
> -	{ MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> +	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> +	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> +	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
> +	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
>   };
>   
>   #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> @@ -455,6 +482,7 @@ static const struct csis_pix_format *find_csis_format(u32 code)
>   static void mipi_csis_enable_interrupts(struct csi_state *state, bool on)
>   {
>   	mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
> +	mipi_csis_write(state, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0);
>   }
>   
>   static void mipi_csis_sw_reset(struct csi_state *state)
> @@ -667,7 +695,7 @@ static void mipi_csis_clear_counters(struct csi_state *state)
>   static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
>   {
>   	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
> -				: MIPI_CSIS_NUM_EVENTS - 6;
> +				: MIPI_CSIS_NUM_EVENTS - 8;
>   	struct device *dev = &state->pdev->dev;
>   	unsigned long flags;
>   	unsigned int i;
> @@ -963,22 +991,27 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
>   	unsigned long flags;
>   	unsigned int i;
>   	u32 status;
> +	u32 dbg_status;
>   
>   	status = mipi_csis_read(state, MIPI_CSIS_INT_SRC);
> +	dbg_status = mipi_csis_read(state, MIPI_CSIS_DBG_INTR_SRC);
>   
>   	spin_lock_irqsave(&state->slock, flags);
>   
>   	/* Update the event/error counters */
>   	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug) {
>   		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> -			if (!(status & state->events[i].mask))
> -				continue;
> -			state->events[i].counter++;
> +			struct mipi_csis_event *event = &state->events[i];
> +
> +			if ((!event->debug && (status & event->mask)) ||
> +			    (event->debug && (dbg_status & event->mask)))
> +				event->counter++;
>   		}
>   	}
>   	spin_unlock_irqrestore(&state->slock, flags);
>   
>   	mipi_csis_write(state, MIPI_CSIS_INT_SRC, status);
> +	mipi_csis_write(state, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
>   
>   	return IRQ_HANDLED;
>   }
> 
