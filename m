Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD9B36B277
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 13:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbhDZLq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 07:46:59 -0400
Received: from mail-eopbgr50134.outbound.protection.outlook.com ([40.107.5.134]:13320
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232520AbhDZLq6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 07:46:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOOBa7gUGyH3GSX2nqMm2ZcGZCPoGZ0LBfw5kms/UolTozusYqztuH1l36k5IEKJagV7dVgP01oXIGih5UbXyE2GSX3Cg+Dp7pD2Swa3NOORLg9NFf8tFbelaid+bPgXesdxOthfWG42AUERfPj1lJRdG3dDgQjNhMxGHqxE8aDxTUEBdYr9gs+QyNk2Ouj+Udt2D9WnN1l0sIeXX0l3oBsV0JUjLVWWrRvspptrzZrqZn1U3QKBIuQe4MmYo//DiHKHx3V6hqFv8E/XA42W8TlZP8Si8ArRedBWKjxHzLJP9fhKqoODMzCNg11HLRwGWD9yvK+pxx4WbJY/019HBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irFOJ8h7i8xTlYmSlVGKdTlQ//qn14ABOTsakS7Q1Xk=;
 b=A6j9VOyW4yauKVtaet8xvqYzRXyA4N8A0OFCiQTCvHc8Lh9K/S2+f3WmQFQ7gzT9zcAyLZR9fcouT9BQArRpyUfPwXE9XzbqelMsFMtWEO2p5hRFFS7jqQzVl+WaDxX0JEGZZkDNWCw1c4Nzdh8VG31BKUVzOZTJfZVg+nC3yh7fuH9OZ1nMUiDu0X7ozzm0kdfbHWWshvKCG+jKGVSpMN0BtVwKHg06ZD3wLK+DjNBqypwuSs+nYTQH6Al8fvm/emz7C+Ny8rK6DbdC1VHWt+yjQm4Izj8Czf9duQ7xyzBKJIZWN1FGctUd9Nr739j8TuxQQp8UAg3gxaVDe6qt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irFOJ8h7i8xTlYmSlVGKdTlQ//qn14ABOTsakS7Q1Xk=;
 b=fh7O3uWXG3u/aukCAQOnslSVtNWx8aCoS2B17M/q97AlL9833diHHArjzfplO+W8v4jZEfnV6LcVKjabKGDKm0GzXbEfxL6dMyxmdFW1bJv6iIvIMz1zQYsp5h1cX0OjIzODWym6JGqlt/d9CGH0d4IJH9FS/Aj2sE7MFDHjKNI=
Authentication-Results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2275.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Mon, 26 Apr
 2021 11:46:15 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 11:46:15 +0000
Subject: Re: [PATCH 04/23] media: imx: imx7_mipi_csis: Move static data to top
 of mipi_csis_dump_regs()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210413023014.28797-5-laurent.pinchart@ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <aec1e4da-1f4b-ac41-6143-f93a7ffa8395@kontron.de>
Date:   Mon, 26 Apr 2021 13:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210413023014.28797-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.130.73.114]
X-ClientProxiedBy: AM4PR0101CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::52) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (88.130.73.114) by AM4PR0101CA0084.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::52) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Mon, 26 Apr 2021 11:46:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a00477db-e907-4521-0478-08d908a8e582
X-MS-TrafficTypeDiagnostic: AM0PR10MB2275:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2275EC92C450F0512A5DC442E9429@AM0PR10MB2275.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b90D3FjD2ibAJLYLl8aGBPxA1XUk6FRDFSFVR9NbSiR8H5A6+24P7m/rLN5rSYVn/1Wrz8m1fnTCabTUWl5nycW5tURcob6JNQD7ptVwOqS8CF6J91eokcKmaiUQWoYe1PdzU3Aj2FtPBxbwI/fRX9zey0Oy5SfCny2ZZJ9lwZWvydWlcorVHYXHxHb8VNacQQzCBK/m1n6Qshp5U+oue/bCWPecm0e034FXot6jOuWwO6c5R67biMhpBFXnJi1vI7EN8LMMbtIxcJ0k5nXfb0Wr7HmGbrPILRg0G3qj1Rmld38f0cw8v8vGjNGgvVffapugQNdsBBXlGOI0nQDtmBk4q/QfOKxLmckAdYlHXdg2ItRmLKI/j1lolnwfgJKQ1VmNowqTuGu+BFqY+i9IrcIAFDCvviQH4nvaEnS7AL34iWBVQwD6Y5I/gyCVSI3bEo36fw9UMtIGiBqJhKdz4cL8dUONhA2ye+qyP7KlNsXyCg/8RbiVL9WvWzU/ADdCh7P4QAwtEO9Fcw8IyqQrRZX3w7SmKC8rMXpzN9PGBWktQchepIctk1alK5GtzUHRcfC+Hx+9V729wJhioqqoj/DJdCPmNKf1rM8AIQxhzNLyTuMZCEcFFTID7duE4nupXJbKW0CAIImzvzvKEFL44jHvDI4A9YopOhCE2xIDk24ULyySiUE7hj+3OvzvHoqZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(54906003)(44832011)(316002)(53546011)(16576012)(2616005)(478600001)(8936002)(36756003)(8676002)(52116002)(31686004)(66946007)(66476007)(66556008)(2906002)(38350700002)(31696002)(6486002)(186003)(4326008)(83380400001)(5660300002)(26005)(86362001)(16526019)(956004)(38100700002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGZUSkc0S1E2VG5ONXRHQzJiVVlVUDltMzBaZHg0WkNxcUpaa2I1SlV0Qk5D?=
 =?utf-8?B?ckc2V1lsZldKNUI1TTM4dVp0Q0dyK0dmSkZRMjM1cHE4RThmS3BMdmpCbDNv?=
 =?utf-8?B?clhjcTV4aXlLWGl4UlI3QVhKa1RzUzJIYjJPNXdsN3docTgxSTBMdG5VU1BL?=
 =?utf-8?B?RFJmUVo3RjJxb1JyemVEVUF5dDU3M3c2N3p1N1p1MlJJSDQ0allFbVNDUTN6?=
 =?utf-8?B?SXBqQ3hFM1Uza3JFVWd4aEphREFzWVA0NEFrbVBOTS83MzRzSWpYMVJveS9G?=
 =?utf-8?B?MlFsa2Yxb2w0VCtpd1c0VnhIQnVtemxBTUx5UzFvdGNXTGtYZWs5K3k0TnZk?=
 =?utf-8?B?blM2dFhEc2tkVEpTYTAzMzZ4MVUxM21QcVhiYXh1NkJlZjVITUNNaG92cldQ?=
 =?utf-8?B?UEQ5WllPR1owSmdoL0R2NEl4OW5JZTJaUkN3akFhR0xZWnBsRHZkNXFaQmJn?=
 =?utf-8?B?N0hmM0VEUmpwRHFUbG1Sb0gzdm40WTZlY3NRYnFTRUVIWkZ1OEZiaGxjSENv?=
 =?utf-8?B?RGFCV0NiVFkrNzBxMUF5ZFJ5UGZoWlFHYU9ycW51MDRWWU9hV2NocHY0Y25L?=
 =?utf-8?B?K0J6RXFOZXRneEVXeUY1V2VBYmVyYlVEMHhqbGNEVDRCTVZERkhGOTNvV1lN?=
 =?utf-8?B?NGY1c1lKS3E2S3VyamZ4TzZXMWs0cFhiQStOWCtCekJOWlFzQzZ3MzhKajdq?=
 =?utf-8?B?RkhvWWxQYk9UdE5OSnFjSWQ2Z1VuaU1KTnczb1o1VkVkV3YvQ0RHQStBVEVh?=
 =?utf-8?B?OHNaYklaWVJwRWxxYW5HdHA5TER3MTFmUGEyQjhNZnkrR2hNdEVIR1ZjenJZ?=
 =?utf-8?B?UzZHU2RFb1pIQW84NGRYWVY2c1NvNWdhbWk4YVZWRGFkeWtRMlJ6a0w2c0Ey?=
 =?utf-8?B?dXF0bTFhcEZPMlNKREdBUjlXcTJwcUhrT2xsRHdwaHYrY29YYWZBRjNnRjhC?=
 =?utf-8?B?bnRFcU5lbmNtWUVWdEZEWEtXQ3VKNjB5UTZONFN3eWZoWDBTRytHc2kzUFRD?=
 =?utf-8?B?V0hmMFR5bzE0RGpBRklGdGEvSFovSjh0SWpQR3hIekMrK1BHRW4vS2dqTXNm?=
 =?utf-8?B?RzFHeUNxcDRQcnBhbS9FaGJOa3FpcURtWUpEM0llaUxUbytWTWhhek9JOEh1?=
 =?utf-8?B?UjBQU01jajZvR3VVanFTcTBRa3dzUGFUcHBablFSelV6dEVaN2pzRlBDclBV?=
 =?utf-8?B?SHcxem9yS25FQTRybFYrOWlQcG9wNGxXSmZYSzlrU01GQW02M29nNUxFRGhJ?=
 =?utf-8?B?c2RZbk5zWmNMWnJaSjRxaUtKMkx5djNmVVhhOXBVVXpQeFdEU05xL2I3QXEr?=
 =?utf-8?B?T3N2WWMvb1l3NVc2QStnYlNNQmhDRWRBOExFT3NsbmNKRFl3Nm1EUGxtMUxl?=
 =?utf-8?B?UXl0ZmVnT0tUNjlQR0ZwWkZwT3Y2QnZmTHF6VDFEQnNya1J5anU0dERuekhJ?=
 =?utf-8?B?TjZKNGo4NDFmTHcrRlFXWEMzZkppbk1tT0xUazh1Z2IrQzZjYjVzU1lpclpo?=
 =?utf-8?B?aUNJaDNOQ2R4SlpqbElrbVFINGkwazdjYWFSTkZxMjJmSzhWeWdLWk5idVI5?=
 =?utf-8?B?VWZucDdNMDhjM1dndDBkbkEzRGtINmd5a1QxTmRwTmxuZTFCSmZXUy9pWHZL?=
 =?utf-8?B?YUF0ZWJxZVZYM2d4OFBHNFBObTVUNGhvRytUT0xSZ3lmTFB1MStzTXJobVV3?=
 =?utf-8?B?b0dRMHRMSHE4ZnN0KzNQd2hMZ1owYkdQaVRwWnAySllNSEpPSzRxZDVTUUcz?=
 =?utf-8?Q?sZ+W9l4Dl7hWBoYcAmwkP3mmtH9rc7/KybIYDoR?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a00477db-e907-4521-0478-08d908a8e582
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 11:46:14.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbhTFOHZWOdmTa+UYIMMtK6y5YuV30OcSmZsjBmEDsdOEToR0MUV5Liecdk7VguoGBXjpJSytXMEfJHsS8q42DHRcYh4X+laerVIZi8kF8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2275
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13.04.21 04:29, Laurent Pinchart wrote:
> It's customary to declare static variables at the top of the function,
> with a blank line separating them from the non-static variables.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/staging/media/imx/imx7-mipi-csis.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index f7c8b6d67e1c..25125e067aa7 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -429,9 +429,6 @@ static inline u32 mipi_csis_read(struct csi_state *state, u32 reg)
>   
>   static int mipi_csis_dump_regs(struct csi_state *state)
>   {
> -	struct device *dev = &state->pdev->dev;
> -	unsigned int i;
> -	u32 cfg;
>   	static const struct {
>   		u32 offset;
>   		const char * const name;
> @@ -450,6 +447,10 @@ static int mipi_csis_dump_regs(struct csi_state *state)
>   		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
>   	};
>   
> +	struct device *dev = &state->pdev->dev;
> +	unsigned int i;
> +	u32 cfg;
> +
>   	dev_info(dev, "--- REGISTERS ---\n");
>   
>   	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> 
