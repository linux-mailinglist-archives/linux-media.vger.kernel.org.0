Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CB138FE52
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 11:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbhEYKBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 06:01:16 -0400
Received: from mail-eopbgr60099.outbound.protection.outlook.com ([40.107.6.99]:1090
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232635AbhEYKBN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 06:01:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHbQMcc19MzZ9gaQnmvIBmna8zMilpVm+p+XhtCUbBu3fpl3jqP5+wpvuUXDC/o5Dyf926FUH6UsM17oW1fcwdgDmvVmk9L7ufdHN0hDBaf5RQW1ZJ2xvaVpluW2KcBneIT4Je57pl1R4hxPY4+ZIoKTZyulhJNs/+sTYwXu7ezX+2nf0Q5GIg79CuuCmQOiuRsDV328xsK+wk8nZijHYDgrmfkMq9EayMNGCd327b9CqbgfBZOzk0YvZoFH9dhfDe0mwq6702gqbFvAAH9JQxDDWmvaae/rQy/0Wk4pnezrMx+6IzkmZdZyRXkUxD79D0ZXrrcrby+Z1Qk9hl5u6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxARFSVKwWL0tlo9Z8HvX9VIW8nHRJL0BQ6f3KvWNos=;
 b=FOvvneQtyUzYRqVRyFuuavjhC2hDy1fRnTw/PMufMBoDtU8N7Qnrj8plo0gfhUYrEam3goHr1cNjE2mOJFiqND1Li0YXdu0xkpgZxS9JuG+7q5GWA12QsEK26Oe7C7vpaIfwF+7haq+6Q3V1nmPeKQIRuuhspuDAHhDuyz1PrfRi887eqxys2fKsJuyZjiXIwubIJtgh9gD6cod93J+NB1yIp43jfNgKaosWIgyshai6ko+VtvPL5/t8nswdWvwKKpGBuOFvstmcYHEZPsZBG48kJxdgDzylojhmArf1/lXxhX95dVtqP9B6qGe2OcYKpbMztU/4/aer6DbE6aEPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxARFSVKwWL0tlo9Z8HvX9VIW8nHRJL0BQ6f3KvWNos=;
 b=RTiPn9CS0HpD7Xj+Hicw6RBuF3aFyEtZJBirKsWQttAB1oEknSIE9hxIqyvoET3zJwQxZ4AJFb9Mf6Uk7RDoY7pdQfyPkgFzpVyyt/GRik7uI972XkPBiCUwRBW288B8i+Pn6DC2EU0V3mlz8+EY5T8afAIec/U8C6W9EFuMzwc=
Authentication-Results: puri.sm; dkim=none (message not signed)
 header.d=none;puri.sm; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4242.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 09:59:42 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703%5]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 09:59:42 +0000
Subject: Re: [RFC PATCH 2/3] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR
 for >= 10-bit formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-imx@nxp.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
 <a0b7ab70-97b2-1511-bdd3-b7c78056042b@kontron.de>
 <YKRY7y4ykERzdRSe@pendragon.ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <c4db10e3-9565-a09a-6590-7711c580f856@kontron.de>
Date:   Tue, 25 May 2021 11:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YKRY7y4ykERzdRSe@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.130.72.72]
X-ClientProxiedBy: AM0PR02CA0176.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::13) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.32] (88.130.72.72) by AM0PR02CA0176.eurprd02.prod.outlook.com (2603:10a6:20b:28e::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 09:59:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3d774e0-c7f7-457b-e50d-08d91f63d161
X-MS-TrafficTypeDiagnostic: AM8PR10MB4242:
X-Microsoft-Antispam-PRVS: <AM8PR10MB4242C27A325EAFB73B69D849E9259@AM8PR10MB4242.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHoXaYz+tDJwTXCA8HT8rzoVRr4I+c58fia7W7PRAaWjzc+eLCF06b4nR7DI8oXlfdYTfFkwDm3pePsqNhvkU7rUjD0jqjSOqGFZc4hi1bjuvSJBWmstu8ChVJv2nDCnrXQv0HnqNiFgdLo1bmwVORzaSflUXs7Nrcyg8aRtUg/XzG3nQkRAFfqKflB1XGRSQqO2toE7jeV7oO4ifFWahNc7x1ZtNNpZdKS/CHDPDtQh8UmON4Aki2z4nldTQS7MnO2ydSM2Uy/BPjojTFVzbZs/862LAmDV+hYh41ug9Qof9e6jd15wQkq+gdmhO9dl2sCNMPMgmZxIBzvebmY3xK46J6tUmZQmkj0osToDV7lzPHDxniqpOEX23dY63pQbvYp7pHd7KfD3vqahLbO3cvH3MCO4TG+Jn+OWyf4softwBQaoyFeSao08bGTF3f7/+mRkuPMGi/+zknPzTEYxY7VpuyKZn2BIPDSoUraUO0jIzgKqHwa2pSqlsi/ugEGYPViw52r3SvMvMId7U0XykXt2/W81IteSu4vN/ybMO/M3H1gMyj/qpt55A5Aq6Ksv3pYnBScVsQUSSwz1BavQcSjd3yFdOJsw5f79Gf7f03pZXjvRn5fXmwSpTXuRX1tfjB7Akgrij/ivg3Jd/lQ5P0pCyw1a3BIJ+72U4oZJLlT/DS8pd4iSpLLtj/7ouPAZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(366004)(136003)(5660300002)(2906002)(6916009)(6486002)(86362001)(66946007)(54906003)(7416002)(44832011)(66556008)(53546011)(66476007)(31696002)(186003)(31686004)(83380400001)(316002)(8676002)(478600001)(38100700002)(956004)(8936002)(16526019)(4326008)(26005)(2616005)(16576012)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cmdXVTgyZlFwWUQzY1dnakFEcTBFbjhBMEV1WGxMYmVIdU55Z0FlcklRZmtw?=
 =?utf-8?B?T0p1T2NsbDdDUy9JWm9oMmlwREpMdnFyWGwzZGk5OFVROS9wMmVMNjVlZlNS?=
 =?utf-8?B?Y2loK3dXWjBwU3Q2MEZhc0lFQ0RCTE9MZ1dtcGhXdStjRXN6anloSUc2b2kx?=
 =?utf-8?B?QS9IZGhmOTZpeTdZbEt6MkJDaGNWaVBiYjFXSjNhd1laK1B1UjIrRjhQdG91?=
 =?utf-8?B?OGlxd1NBaVczVitDUGJUaW9tekpNY3NaOU9aWnFuLzVwZDdZcnZERDhaZVZu?=
 =?utf-8?B?QTFFQnVnMkxRTlRkTVo2aVVhVW4zNW9WaGxIc2ZVZE1GMDE5SzVuVDlMUE1x?=
 =?utf-8?B?VmFaTlAzUTZ2MUladk1JbEpUOGNkQUwwYlYzN0Vpc2RjckFuSTJFUVZmd0ow?=
 =?utf-8?B?U2hZNzhXdUNQRTdjWnlFSXZjYi9SbVEzQjRRSndPRS9vbkNIazJ2MzlsbDF0?=
 =?utf-8?B?aXB5TE05THRDVTdneEFlOVQ4aVlNcXdMVFdtVnFQTjhFN3NlWUkyYUhoOUly?=
 =?utf-8?B?aGZPMExkWnBMN0tpSWhiYU90Y084bUVIQ1lXL1g4SzA3ZzlRWkNXZ2p1S0Vp?=
 =?utf-8?B?Y1NCcjBuNXlaUHUvbk1EZ0tzTXgxeFE1aDMwMFQwVGkvRDVGUUd1U2Yrd3dt?=
 =?utf-8?B?WHo3MklhYTdlVWNEamcrZU03MEwwTjFRN0xaTGU0VzI4RElnTlY2NjE3OVYz?=
 =?utf-8?B?NEx6elBGa2d4TzRYQjh1M2N6Z2NGMy9UMitZM2VrODJTdG9RbERnYi81V1RG?=
 =?utf-8?B?ZlFxUDlSM0pvcXAvdlVjY2p4WDd6QlZIT2lNaXRTdGxIUmloOVRzb3pETWZm?=
 =?utf-8?B?YUhDaTBKOG1HS2p3alFyaTFnbGE1a2VsdGtqdlRmZ2g4dkZ2SHJEMGpCRDND?=
 =?utf-8?B?elhkVkU5OW54ai9yOXlYUGcyZEd4QlZUb2RFU1ZqaElZdDNkYkFqVjlHeGNa?=
 =?utf-8?B?V3ExRGJPd1JhWmx5aThBVkxnMTE0L0ZrUUpJMXpRdk1WSHhXNUpyakJRU1FE?=
 =?utf-8?B?TkVDSitFd2VLU0ZaRSt2VkZYVkZLUTJBRkI1RnpXVm9VeTY4U25YUWt2aVUz?=
 =?utf-8?B?U0prNi9JUTkwdS91aC9qSXk1TDhlZko1SVVpcW5IdWpVeU1tb29QclZnV0lN?=
 =?utf-8?B?c2x3dXBQcjZNdWwwdnVWRjVnQU1PU3FVenFZdmtHQ3hUWkZaU2JpU1Y4eHpp?=
 =?utf-8?B?YXVsQ08yeUF4ZnhiTUd0ODRqRkxGMDR5dEtacUo2ZFE5bzNMc2F3b0hHbmpZ?=
 =?utf-8?B?cTlja0FvRXhaWWpxbDcvdGVIK0E0STQrK1ZsbTIxcWZ3WEd5NHJlQXdZOTE0?=
 =?utf-8?B?Y3RESUpJRyt5VTZQRk9GdG84UGg1Z0pPNUVzcEwxQ0RtMGY3dmhFN2ZKTFNt?=
 =?utf-8?B?ZXFLR3FmYk1tb1V6MklaT29iQ204TGZNbzhHVDhVZWlRVUwxVU1ieEJhMzRZ?=
 =?utf-8?B?RWE3bU1WQTNxTjhKWVJBMXNDK3crVVR1aUFzM3ZJRFF5OU5CVEhncDRzamUr?=
 =?utf-8?B?WEdYQjZKQ2w1YW1tM3FOMUMxb2hkUFJUTkRFM29RcjNvMENUek5pWVlDWGVa?=
 =?utf-8?B?a0dHblYzbFc4MG9rM3ZzOEpoZXFYbTd2UjVOaFhvWHhwNGw2dzc1M3QrZ2I1?=
 =?utf-8?B?V0wyNnFtLzZkekhEblpjL3poR3FiVG90VXNMUHpQQm1UMHE0Q3RsamNFUk4r?=
 =?utf-8?B?MmRDMHcvOFNiSWtIbEEzVEdzcHRXTS9Fa2VBbHNSNmVnMk12cTZ2aFFSUlQz?=
 =?utf-8?Q?duUhfk4b6ia2A4fUzd8t/tomB9xFWteWHAcJziH?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d774e0-c7f7-457b-e50d-08d91f63d161
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 09:59:42.6601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pBEwD7X7SEWyT1Paubbn6BGSFIYMoCC66fycjRlgf8XsfRXE2OgfApyqrbQgNsYrvu1UcT+TeXC4sUm07VD488l5qbAcnwhdGMHbGVqPKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4242
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 19.05.21 02:16, Laurent Pinchart wrote:
> Hi Frieder,
> 
> On Mon, May 17, 2021 at 12:21:17PM +0200, Frieder Schrempf wrote:
>> On 16.05.21 04:42, Laurent Pinchart wrote:
>>> Sample code from NXP, as well as experiments on i.MX8MM with RAW10
>>> capture with an OV5640 sensor connected over CSI-2, showed that the
>>> TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for formats
>>> larger than 8 bits. Do so, even if the reference manual doesn't clearly
>>> describe the effect of the field.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> For the ADV7280-M I also have the diffs below applied. Do you think
>> setting BIT_MIPI_DOUBLE_CMPNT is specific to MEDIA_BUS_FMT_UYVY8_2X8?
> 
> Do you need MEDIA_BUS_FMT_UYVY8_2X8 ? Neither MEDIA_BUS_FMT_UYVY8_1X16
> nor MEDIA_BUS_FMT_UYVY8_2X8 match exactly how YUV 4:2:2 data is
> transmitted over CSI-2. V4L2 uses MEDIA_BUS_FMT_UYVY8_1X16 as a
> convention.

I just use MEDIA_BUS_FMT_UYVY8_2X8 as the ADV7280 driver sets it. But if the convention is to use MEDIA_BUS_FMT_UYVY8_1X16 for YUV422, then maybe the ADV driver needs to be fixed.

> 
>> In the RM it mentions YUV422 in the description of
>> BIT_MIPI_DOUBLE_CMPNT and without setting it, the colors are all
>> wrong.
> 
> That's interesting. I've tested YUV 4:2:2 with an OV5640 sensor, and I
> don't recall having to set the MIPI_DOUBLE_CMPNT field. I'll try to
> retest.
> 
>> I know this is not really related to this patch. I'm just wondering
>> how to properly support my setup.
> 
> It's hard to tell :-( The MIPI_CSI2_ISP_CONFIG PIXEL_MODE and PARALLEL
> fields are not well documented, and neither is the CSI_CR18
> MIPI_DOUBLE_CMPNT field. While the CSIS and the CSI bridge are
> documented, how they're integrated isn't described. So far, I can only
> guess.
> 
>> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
>> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
>> @@ -346,6 +346,11 @@ struct csis_pix_format {
>>  
>>  static const struct csis_pix_format mipi_csis_formats[] = {
>>         /* YUV formats. */
>> +       {
>> +               .code = MEDIA_BUS_FMT_UYVY8_2X8,
>> +               .data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
>> +               .width = 8,
>> +       },
>>         {
>>                 .code = MEDIA_BUS_FMT_UYVY8_1X16,
>>                 .data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
>>
>> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
>> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
>> @@ -504,7 +504,7 @@ static void __mipi_csis_set_format(struct csi_state *state)
>>         /* Color format */
>>         val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
>>         val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
>> -       val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
>> +       val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type) | MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
>>         mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
>>  
>>         /* Pixel resolution */
>>
>> --- a/drivers/staging/media/imx/imx7-media-csi.c
>> +++ b/drivers/staging/media/imx/imx7-media-csi.c
>> @@ -492,7 +492,8 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>>                 case MEDIA_BUS_FMT_UYVY8_1X16:
>>                 case MEDIA_BUS_FMT_YUYV8_2X8:
>>                 case MEDIA_BUS_FMT_YUYV8_1X16:
>> -                       cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
>> +                       cr3 |= BIT_TWO_8BIT_SENSOR;
>> +                       cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B | BIT_MIPI_DOUBLE_CMPNT;
> 
> I notice that you set both PIXEL_MODE_DUAL and MIPI_DOUBLE_CMPNT. Have
> you tried setting neither ?

Yes, but as soon as I don't set PIXEL_MODE_DUAL, I get overflow errors from the MIPI CSI2 controller and it doesn't work at all.

> 
> Have you also tried using MEDIA_BUS_FMT_UYVY8_1X16 ? The difference
> between MEDIA_BUS_FMT_UYVY8_2X8 and MEDIA_BUS_FMT_UYVY8_1X16 in this
> driver is the width value passed to v4l2_get_link_freq(). With
> MEDIA_BUS_FMT_UYVY8_2X8 you'll end up with a computed link frequency
> equal to half of the actual value, and thus a wrong Ths_settle value. It
> shuold have no other influence though.

The link frequency calculation doesn't work for me at the moment, as the ADV driver doesn't provide any of the controls V4L2_CID_LINK_FREQ or V4L2_CID_PIXEL_RATE. So for now I just hardcoded the Ths_settle value.

Thanks for your efforts!
Frieder
