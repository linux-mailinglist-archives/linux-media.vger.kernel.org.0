Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9870236B26E
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 13:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbhDZLlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 07:41:52 -0400
Received: from mail-eopbgr140104.outbound.protection.outlook.com ([40.107.14.104]:32686
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231550AbhDZLlw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 07:41:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/OxKN8H/njoy8hT/EwxsOUd8QnEHsGcvlZYKcLK618G44E3Gzgaj4YhPMrd/9gqOmOrPHFAxfd3KdVkgjFVibnBHF2jr1BT1LD9FvxmSFTwjMTxJscKEgXm4Ga6ieszNUlDoo3b/o7E24+ddmNmM+kbr2hNTvxn5LzSVfpunyMI3KHW+Dk/xxRe+GUXy/6UXo/Z6qi4WnfXrN2tg32ahOdr8312M6Sbo4bd3YoHbNXDcTHXJhCsjeoAEFTCiveXw9BhkmxD3qHLGaYyxL6mjBJJhKPAboS1aojLKppuvdxaWU2qGmcKliDX3WNIY1f84frnnp0xfKrJARKrC/sXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5KU7ruM2mV7SFKPOugz7eqJjGxHI/jPXkZ/A3XM8Z4=;
 b=lGD+Vz02OM6OVg/3/Vqfz1n9gCj60yjVkMgtc2Auu9Erwdw+jT0amM5vTb4/BJwX5sMiBVqNiWOXiSR/r1V0IPCgXJqn6Mi6SpZ4jJxZC1c4Mce+RTvYw7ZBSlsDhHUEGD2G//WWkRY4ZXlLuSDhT/GO1dzJdc8r1aqWbsyIuVgxwK7Fdi6RJ1fOw+mBeFMvEHpZdLvIzPnliuX+vc7H718i33B9zngalZQClAagFl4FVl4zRiftTa+bl2VNvpoLBtKZRVDEjLV+cws+Ds80n0vLGoKRDHo1rV+dMFWLsUS7inrUSdMNvd3KvVACWhJDWPufcPH18EQo3aE/ky2C1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5KU7ruM2mV7SFKPOugz7eqJjGxHI/jPXkZ/A3XM8Z4=;
 b=C8EG2AmLZzNPPF7XcegxeZ9aC+WlN3NlZBCCgG99HQyBtVJ/qLqELRQrENXZHXI800kJ6zcOZipWq66tNGTwh5NZ1zN55tcFYY7r2Ly3ibiqhT80cFsIBQj2uBA0wKKPmUmGyNxa3IDLpQDIMMHr+k+P+64/XWr5E5WywBHKMj4=
Authentication-Results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM9PR10MB4402.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:269::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 11:41:08 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 11:41:08 +0000
Subject: Re: [PATCH 03/23] media: imx: imx7_mipi_csis: Update ISP_CONFIG
 macros for quad pixel mode
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210413023014.28797-4-laurent.pinchart@ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <98702f8d-75cb-489e-9e20-66e4df3e3241@kontron.de>
Date:   Mon, 26 Apr 2021 13:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210413023014.28797-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.130.73.114]
X-ClientProxiedBy: AM5PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:206:1::36) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (88.130.73.114) by AM5PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:206:1::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 11:41:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67cb9121-523a-48f2-15a1-08d908a82f09
X-MS-TrafficTypeDiagnostic: AM9PR10MB4402:
X-Microsoft-Antispam-PRVS: <AM9PR10MB4402D0AAD09B5C41C58C0035E9429@AM9PR10MB4402.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loObogrZ3h9guXDSuc7Ar//F3I3Hmq5l5lHX/uF24dmuLQfCF6oHkVVh2ofeDgTBwS1oqY0YLMhRd8TvlpjE4rXC+BjQ0D+c7b4pheP99ZcJSHAMYQfpYLiHJ2k7hLQ2iiKt39aZTC5aCBcTMmXNjmwmzzqAETVgwR8j1o458B8k0FB1f7HhFCIHZWC3qBvOfajYg+TFWkR/2TsDRlIwLEw1O1fnXasIhkv8aOaVYkuHL6noAz+jswzOzIWUwuG3xC1qCGTh8oI/2ZBz2+rGp7cQUN8SFsayiqHZqjRMTH5XWgIB7gpUVlA9C9qmP9/brBLSQf0ajHDVnZXx0b/uLGVoFq6CJ9Mz3rqx2YEHxx58UspHFnn3eGJ302yRsIUmws2mwx3HxPRDwHzN1Ix/qxmiAbMrQmRyPFxPLjf9jYltB4rn8QlJuwGf57T9dhb3UKP6VkL3XZuQQuMNWOIWhAahUES7wXijn7kniMoCFCTv8MdPw4mHHKQFkEZmIe8f7kPiTYrA24SD1oNGgCIwqPMN4PQM46Ulo9GtKmO5ju0OrJrZrqgxmC9xOdOOReSxUjhI15YxbH9z72ivzyt0lyj+tGZVOjGmMwuQ07CpmHTug8LITPeeZd6sJ2yZ0jqdBsGeXODXexDU3i6b9upgtEH0si1nNv02Itp88RPzgSbNVOF+2it3b3NVUlEcZsFbJ5ETyySPEvuka5pehk3m0cc+czl47id3AyJX1B4vnZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(4326008)(83380400001)(31686004)(66476007)(186003)(478600001)(8936002)(6486002)(36756003)(31696002)(86362001)(52116002)(2906002)(38100700002)(38350700002)(8676002)(53546011)(956004)(5660300002)(44832011)(16576012)(15650500001)(316002)(54906003)(26005)(66946007)(2616005)(16526019)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TE1kQVBzcW52dkVpbEZ2YldEOXdoczh5NlpmcVFtSjhTQ09Td0s5SDNRcDI4?=
 =?utf-8?B?ajhsdHFCYmc2NVYxOW55ZWRXdEVVMnlHTDJuNGtGOFpGYXdQNzZGQklHTllo?=
 =?utf-8?B?UmZoOXhqQzRObzRNUzV3S3VWRExqRUhYWjNuci9aZ0tFM3A3TjRKTkNzcDRh?=
 =?utf-8?B?a04zRFN1QjJOUUVNcFJnOHdSZXVaTitWSXZ2bG9SQ3ZEeC9PcmtDaEhoVE1i?=
 =?utf-8?B?YkR2Y2phYWlNNUJxNnhGR1ltMENKTmNORHRMS1VEb2xUa1kxdkRTZnNRWlRz?=
 =?utf-8?B?OTJsM2tWNUVRWHJUQTlJUSt2L2lHLzJYbmZHaHN4SzVjRWl6Q05VZ1J5TER1?=
 =?utf-8?B?ZWxIZTZibDFtbkVPM0tyV29kYzVhUzNTd29KQ0JTaEtvV3NYUmRSQ2UzcjRD?=
 =?utf-8?B?VTU1QlR6bHRJRG5PSEs0R1VqQ2xmTEdRK09mU3RrYXluRTdaL1FTOFFKZHB0?=
 =?utf-8?B?bEFac3VwMTdNN3E3N3BndWdCems0MWJXYWpjUjh5aytURFdtZUV6TjN6L3o3?=
 =?utf-8?B?VDlGQ2x2bXlaVVpleEpZT0FHYUNHZW14cGZ4K3gyM3R6OVBZMVRRYTA0c2tu?=
 =?utf-8?B?bSt0aWsvUUdNRTVOS1FlK0wyZ2FpbW9kWTNMcklDNlowVEREYkd1ZHpjVTM3?=
 =?utf-8?B?MDBydFlPcXFRYnRiblgxSHV6SWhJSXltUWRGNHRHdm5wR0FEZm9VcXVMV1l0?=
 =?utf-8?B?b1Z0RkpCNE5xeno3NVk0L1NxTFBrR21SLzFrZUlYMVFxVVlpczNJU0tFMDcy?=
 =?utf-8?B?NlZZWnFSZmFZbmFmd1NGbUQ1MExzL2EvRHNZZ3hnR0hiVGhCWE43aElndEJN?=
 =?utf-8?B?MHYrRkFrRGtXTVdvemJoSWNJUUFVUm5BWDhnd215SXdYOFRqNC9ncHpGN25Y?=
 =?utf-8?B?ajRkK2NmdEljNCtZd0hwZVI1eTdCOTV5UGZHRGtTaTJ4KzRxVndXNkpRSElN?=
 =?utf-8?B?STd6WVlJTUhjaHYrRFh5NVZBZDRPNjhTRHp0Nkd2TFd0WEg5Z0VpSGFld1NM?=
 =?utf-8?B?bmxKcTJHWUpvOHNOUVVwNmlmNE5SdWZLUmRQU0tLRnNSMjZjRU9JOWlVK3ZD?=
 =?utf-8?B?dURnZ0cyeDNIdC9jMWFLTnJVVnNWcHRnNncwSFpsaHR0Qkg0Z0Q2R0JCNGNU?=
 =?utf-8?B?NFFFSnBFWW5YaWhnYjU4OW9XV1NwWmZTM1J3elJoekhrWnNYVHVrbTJ6T0VE?=
 =?utf-8?B?V3ZNMkp3VzBha0pYT0U2ZzZWSVd3MVVKNm5BMURBL2R4OW1lbHNvak4wRG5Q?=
 =?utf-8?B?VnNFajl0YmFNVGxJWXdVN3ZGcnd0RHRpS2hxMitodjNlTDg4ZDQ1eWZ6SG43?=
 =?utf-8?B?UmpCMlY4RWR5dm80RElBdmxQMVdmNDRJN05zcHpWdVdlSlFaR3lFb0grZWd2?=
 =?utf-8?B?VFVsRGh1UVBpRUtOc0JGdFZWWXZaNTVjS1R1V3J6dXFodCszbDR2UklqNWht?=
 =?utf-8?B?ekxCbFgzSHNObUJHY0lORXprR2JmRUNydzN0L1JuNGc3RGxNZkQxZFdGK2dF?=
 =?utf-8?B?cXhzTHQ0YTVCeEVDN2FmOHB5L0I3Q0Jpd0YwR0tVVDAzUmFIeUFRMXhSOFNR?=
 =?utf-8?B?WlBIZ1FMTUFlVWF6eHdpVmsrTFJ4S1J5cktkdWZvK2QvcVRNNXo0OXFFbC84?=
 =?utf-8?B?aG5rbzZ5S3hsenhSVXFaSEJwYXJZYytqSWg1ZHRkSVc4a2JMdUhBT3ZhRzND?=
 =?utf-8?B?SS9SQUhKb3drTHNzUURMeTlRV3pkRDhoanpKWnQyeHZOdXZTanlJWWExRCs2?=
 =?utf-8?Q?bRaxlTD252d0Py96ZxMlI36ftyu2jK9eF48BdVB?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cb9121-523a-48f2-15a1-08d908a82f09
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 11:41:08.7527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzrHZBB9ecTsStwb70h8/QXOJEv9SQU1E9jAieKnRrOzhL/xigF5fKqNwnMLalNVVAigMCEJhYSDWoGC9++8UeQqERQD6FfylocqqmvzHWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4402
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13.04.21 04:29, Laurent Pinchart wrote:
> The i.MX8MM expands the DOUBLE_CMPNT bit in the ISP_CONFIG register into
> a two bits field that support quad pixel mode in addition to the single
> and double modes. Update the ISP_CONFIG register macros to support this.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/staging/media/imx/imx7-mipi-csis.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 67911eb8761f..f7c8b6d67e1c 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -166,7 +166,9 @@
>   #define MIPI_CSIS_ISP_CONFIG_CH(n)		(0x40 + (n) * 0x10)
>   #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MSK	(0xff << 24)
>   #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP(x)	((x) << 24)
> -#define MIPI_CSIS_ISPCFG_DOUBLE_CMPNT		BIT(12)
> +#define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
> +#define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
> +#define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
>   #define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
>   #define MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT	(0x1e << 2)
>   #define MIPI_CSIS_ISPCFG_FMT_RAW8		(0x2a << 2)
> 
