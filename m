Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81723829B4
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhEQKWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:22:38 -0400
Received: from mail-am6eur05on2128.outbound.protection.outlook.com ([40.107.22.128]:47393
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230248AbhEQKWh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:22:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMevp8fJFf3oeeUjD7wSLjGAqoyQlX4oLLPDwMOXNcYlLvBgXAkU/QTMIEKruKC4I7kbMSO5FGh5KIgLQWdkNFwtHbImq4oEChXF6XNNF/RxXQ0uESRbyOkuG47oyy8uoBtd9O6GJ5AQN/rz7Ea76wFQ+5AP8exiKM9xKAAZaHqVigY4W5s8CYUfC5+8o/ASt1qGE7aqPEGYX/j9D66PlRDjDrQ1D7PmtuDYjS2IUob0rjJ7oUsalijMLrZQ1cL+FRMAglxY8gD7UTdG2BABW+nFPyGiBaxafF8h6H7lFnYmWWFZckFQGJGUmckBmNDnIEOGz8UoRA/0CvN6QK6eZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16XL1e+OYlYVSdadmzfa3bkIfKsQoyOwynHsM9Pwrc8=;
 b=BoXOeYYw2nnyA9sE2gBPPqFCINsck0qPyOq0sGIJR7li5BzYaIkH4dq4MTHW8MeEKgfC06jwt7gXU6cTpNnRxLHaEm17JL+MtCUrfsY9+d0Oo07J/S4WSTv63WjqJtNnVpPLeW529DQpKv6nS+JLzxmn9vabb37OhRyuUwyKaREfw2awo4SAb3N2jOEni8GSqntNrcfB6Jo5pufVkoUPLegEQF5ABG1xkHcYQt3EZHl3E0mwE2TVwibZnWL7/t0X6kxhULNzLk1HILdzWMcZXkPqyqsry4dbPSo8DGpbxewYd9QO1ZmD+KA3IcKhIcWiurWteGttprqZvKhmvJrd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16XL1e+OYlYVSdadmzfa3bkIfKsQoyOwynHsM9Pwrc8=;
 b=i/hjKM4oNMPxJYId21O/ZtG8P1Uj3lropv5b+phsEgAVhghZDNilJj4hNIeVjW5EH32Oz297XIp902VQDBEnqCavyQQmFwpNmWRthkPGLpaIKvOv24j45jIQe79g1RIT62P/o/+xwn3aTR1VTAdzLeQ1PlZwh/imgwAUU6GR6dc=
Authentication-Results: puri.sm; dkim=none (message not signed)
 header.d=none;puri.sm; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2356.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e4::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 10:21:19 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 10:21:19 +0000
Subject: Re: [RFC PATCH 2/3] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR
 for >= 10-bit formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <a0b7ab70-97b2-1511-bdd3-b7c78056042b@kontron.de>
Date:   Mon, 17 May 2021 12:21:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [109.250.142.188]
X-ClientProxiedBy: AM0PR02CA0220.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::27) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (109.250.142.188) by AM0PR02CA0220.eurprd02.prod.outlook.com (2603:10a6:20b:28f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 10:21:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a51ddc6-3420-48af-47f0-08d9191d832f
X-MS-TrafficTypeDiagnostic: AM0PR10MB2356:
X-Microsoft-Antispam-PRVS: <AM0PR10MB235657D9C2C33F333D959AEFE92D9@AM0PR10MB2356.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NgAt1MbZVbTy6fN2HgrmxV893Qw1YqVosTYWpdgfB3a7Ur7xHpbCTnccER/plwU0JfHkHVeMBDPwfhKeheKSFrrm+w+J4UigJ2FHmmSRI9NVGcFWKWCltyJ5d75Mz1wILtb+bY9oPKkPI4f6zkq5HdzGNM0r7YGrLknGZ9WLBzsOU5872sIaHQPAmLKJ2Nosg6epoMQ+sgzP1pGgm3XexDjrPSKAWUaTgFxkbbWtPPGPJ4lg0XxBbv3Sc1QAvPzQheYCJpaSEAwcMSzQyCFEKPbaMEKXWi7ONcej+tHYbCtFk0PLPNRsDWtGmCD4IBjDZtS5ydtbBJtXl7DjVqRvvK3l1y7pLsSmoLXeLV1wUGwLZvvXW+FrVJo4DcnpCM3AJ8yQjVw5/vEduTH0iRUh0g91dN1gt75WWudbYjfUsaP9EHhztB5Ui5G8pivtHZI4D6aZ7neGmbiSN3o94SZ+Ow/MUOfH0zOx1Zt49h+eau1hnAvmrS4V5B+/HSLO/wtcp92nAAOce795WM4ilB8vcVWgbkwSVUvF6g/jZ5V/Ni7Y3JZqPKBw3kbQyx+GrZzjgdaPwNIELPsZduinLXbEqAuH/tu4xGQgkWL4KGyq877wfHvNLtYPaVzUZFRMLO23u8B8h75c48OQfs/PU8nY5RZYNgfIHhdVRy3hBLCs/IeRexHWaE+RKn9RxLnhR/Zn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39850400004)(346002)(136003)(396003)(83380400001)(16526019)(7416002)(86362001)(2906002)(478600001)(53546011)(5660300002)(6486002)(54906003)(31696002)(4326008)(16576012)(316002)(38100700002)(956004)(2616005)(186003)(66946007)(66476007)(8936002)(31686004)(66556008)(8676002)(36756003)(44832011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVdsQ2FWZUQzY0FlSWFGUTYrdTQ5UjZQUCtZa3Fvbyt3amp2Uk9DeHVLdTE0?=
 =?utf-8?B?c0V1M1lsK1hPdmhLY1J5dDVPam4xb1JYUTNLRnRESzZCNDl1ZTJpVzdlVUkv?=
 =?utf-8?B?enMxWlBzcjRZekRwa3U3R1NiY1lKZDR0aDV3SWI1K3dqVnhXY2gxWUJ2OS8r?=
 =?utf-8?B?Mmdkc3hxMEhpV0tmMzZseVJKdVZoZWp2ZjBCRXUwUjZVOEhJdG9JV3Z4RWgw?=
 =?utf-8?B?OVVxbHFsYmtkdzd5cGx5Ni9JWkRtVlV5VWdXNmJ3YThSUXhtYjBrdXAxeHJB?=
 =?utf-8?B?SjNVL2FjckltM1RFb3o4S3VVOTR3UUtLa0ZMZnJqaURVVTRnRjBPV0dGUkdv?=
 =?utf-8?B?dlc5Q3QySkZMaG9XbVErbXlBWEMrRDVqMm5Ld0M5R1diRFltUVpqQm5na2xY?=
 =?utf-8?B?SFFHVEFFaCtBRWpmcHYwR01ZVldJMmV6UU9BejZEajUxVVhJaGViOGpydzFW?=
 =?utf-8?B?cFJFWmVrTUFHWmQ5Z1JKWkY5a0E3OXAzcHpuZGpxWTNuVkRlTlJ1Zmphdk12?=
 =?utf-8?B?ZUwwMmYzOGRxbEFYNUpMVkxwbkVFM083VnIvbzZHdEo3eTBxWVhYcTRkcDl2?=
 =?utf-8?B?M3plajJSUHRmRE1mdmVTSE5Eb0JXdHJtZjA2RUxSR1ZIVWppaFlEaDhhMzNY?=
 =?utf-8?B?bjlFaG84QTdnaVovWjgrV3ExTWg5SlpDTTV4R203ZmwwRnNNZXAxenRHOGUw?=
 =?utf-8?B?dXQ0dHRKUUdkdDR3RS9nSFdTMFVIMDdML21kRmpBQmlYa0k0K2FOQnZRR3pP?=
 =?utf-8?B?bitha2c0eVJyell5MmZZdVQ1S0F4dEZDNER5d2ZwZUorSU9mbGFCa0hNR1RF?=
 =?utf-8?B?R3JCMWpTU3VrZngrMEd2MEFUZVd6QTRDVll0Q05CamNlSTl4RUtUN0dsTFpF?=
 =?utf-8?B?ZWhyczJuSlcvbUlYb00yVVZ6eVdYVlY1cm8ybnpKOVhIa1dIZkwvR3pQMzNL?=
 =?utf-8?B?b1FvNytxZ3ZMdWpNYkpnODRZVlo4SjZWWWtHWkFLWU5RR1VyY1pHZ1lOM2lD?=
 =?utf-8?B?Vk40dUxxd0QyczV4YUFjZzFIUy9LcndjLzl2MGxyWWlsaE5nK0IrdTkzdlZK?=
 =?utf-8?B?cjBoQXcyQVY5OEpzb1ZjR0FFUDZEbEVQTDhaUlNlc3FiejBJLzkveEZ2c2d6?=
 =?utf-8?B?NERwSC9MUWdiQmNMdDgxNGYxMGhVTkdOZTN3SWloTXJGNHY3bFVIZDJITjhD?=
 =?utf-8?B?MXk2UUFLRElCb25aa1Rod3ROV1p6YkxuRURDMFpqMXZ2SmRLazQ4dEtxZmNC?=
 =?utf-8?B?dTRXWjE4VWhUTVdTejlLdzNVOU5MZStRdGVCSDFkcGxYL1RQaVhaSEZWUEVv?=
 =?utf-8?B?eENscHVwMktUL1ZHMXV3dDlvbzBDMEVjTXJjbnJ0L2tLMlNiVklmZjlzaFE2?=
 =?utf-8?B?OWxGTHJzZ3JCZHpmUlZ2RjdEVzMyWitocG5jYm5na0R3WFQ0Z005Zk9lNlZD?=
 =?utf-8?B?KzBhaGJUNER0TTh3SVVIK05qbjA3ZkZPdVNzeEtPek9pdGJwSXV0dHZGU3Zp?=
 =?utf-8?B?ZFA3clZNSEhrWUFZWFFURkwwMDBEaDZ6T3hzbkloK0ZDak1QM3F2dExqaDFY?=
 =?utf-8?B?U2tHL2FXOS80NkZIQzJqdVR2TGRGeDRqcS92eExRQ1grcW1GMjA1M3B5L1JS?=
 =?utf-8?B?UXpqYTg3QXBRdDBXY3dESy9vSXFScUQ0TVh5NUxSWEdQTWpzM1NTUEhQMVJQ?=
 =?utf-8?B?M2NVcUJSVFduS2FGMFZoNUhzVktKY3NKNnJtL1R4dUVTQSs2dVFhc29IWFd3?=
 =?utf-8?Q?Rud8ntBxT/OgdPF5mXiwo4Iq7k6fr+qhm3Sseo6?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a51ddc6-3420-48af-47f0-08d9191d832f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 10:21:19.6714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDJO6RJfNs/QmSBF9FOUPtOZswgxG8hYkvkN7PXLrn5GznIm3B/paKWKsTM49xqM9ntwGZk2Mt22SiK3+GZUfoGSU4SbfuBYHxjG8VVK8Ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2356
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16.05.21 04:42, Laurent Pinchart wrote:
> Sample code from NXP, as well as experiments on i.MX8MM with RAW10
> capture with an OV5640 sensor connected over CSI-2, showed that the
> TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for formats
> larger than 8 bits. Do so, even if the reference manual doesn't clearly
> describe the effect of the field.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

For the ADV7280-M I also have the diffs below applied. Do you think setting BIT_MIPI_DOUBLE_CMPNT is specific to MEDIA_BUS_FMT_UYVY8_2X8? In the RM it mentions YUV422 in the description of BIT_MIPI_DOUBLE_CMPNT and without setting it, the colors are all wrong.

I know this is not really related to this patch. I'm just wondering how to properly support my setup.

--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -346,6 +346,11 @@ struct csis_pix_format {
 
 static const struct csis_pix_format mipi_csis_formats[] = {
        /* YUV formats. */
+       {
+               .code = MEDIA_BUS_FMT_UYVY8_2X8,
+               .data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
+               .width = 8,
+       },
        {
                .code = MEDIA_BUS_FMT_UYVY8_1X16,
                .data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,

--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -504,7 +504,7 @@ static void __mipi_csis_set_format(struct csi_state *state)
        /* Color format */
        val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
        val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
-       val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
+       val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type) | MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
        mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
 
        /* Pixel resolution */

--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -492,7 +492,8 @@ static void imx7_csi_configure(struct imx7_csi *csi)
                case MEDIA_BUS_FMT_UYVY8_1X16:
                case MEDIA_BUS_FMT_YUYV8_2X8:
                case MEDIA_BUS_FMT_YUYV8_1X16:
-                       cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
+                       cr3 |= BIT_TWO_8BIT_SENSOR;
+                       cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B | BIT_MIPI_DOUBLE_CMPNT;
                        break;
                }
        }

> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index f85a2f5f1413..256b9aa978f0 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -422,6 +422,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  	int width = out_pix->width;
>  	u32 stride = 0;
>  	u32 cr1, cr18;
> +	u32 cr3 = 0;
>  
>  	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
>  
> @@ -464,6 +465,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		case MEDIA_BUS_FMT_SGBRG10_1X10:
>  		case MEDIA_BUS_FMT_SGRBG10_1X10:
>  		case MEDIA_BUS_FMT_SRGGB10_1X10:
> +			cr3 |= BIT_TWO_8BIT_SENSOR;
>  			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
>  			break;
>  		case MEDIA_BUS_FMT_Y12_1X12:
> @@ -471,6 +473,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		case MEDIA_BUS_FMT_SGBRG12_1X12:
>  		case MEDIA_BUS_FMT_SGRBG12_1X12:
>  		case MEDIA_BUS_FMT_SRGGB12_1X12:
> +			cr3 |= BIT_TWO_8BIT_SENSOR;
>  			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
>  			break;
>  		case MEDIA_BUS_FMT_Y14_1X14:
> @@ -478,6 +481,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		case MEDIA_BUS_FMT_SGBRG14_1X14:
>  		case MEDIA_BUS_FMT_SGRBG14_1X14:
>  		case MEDIA_BUS_FMT_SRGGB14_1X14:
> +			cr3 |= BIT_TWO_8BIT_SENSOR;
>  			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
>  			break;
>  		/*
> @@ -510,7 +514,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  
>  	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
>  	imx7_csi_reg_write(csi, BIT_DMA_BURST_TYPE_RFF_INCR16, CSI_CSICR2);
> -	imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
> +	imx7_csi_reg_write(csi, BIT_FRMCNT_RST | cr3, CSI_CSICR3);
>  	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
>  
>  	imx7_csi_reg_write(csi, (width * out_pix->height) >> 2, CSI_CSIRXCNT);
> 
