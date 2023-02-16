Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC66698E76
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 09:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjBPIS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 03:18:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjBPISX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 03:18:23 -0500
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2113.outbound.protection.outlook.com [40.107.249.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202AF2686E
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 00:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZ2VzCF0EHzcOpniZsrCSmktONcBM8u/pCddNfZ5bpbYnVOXZFhaIjFvn6zGWfkeign1KTH6c6BtU9MlxWue5ev6AcmSB2ihehca25RErr5kQatP2siJbv2cN4rGdgbDi9gmi4RWAKFuJBFJj5j88wdoWcQo8Mnyv9A3M7PYAxCZI9GMHGjGdNi9lGeCPNDgr+IMkhQh8xul7b8f1VwYGkC1ChtEEHJlMQx0+Xh8t27GGiRWjPWp9q+9u2/dAUmobCf3opwVDLnVz5hVVH+dnlXxrODNzadbrilXPB48kAROcfE4YCvDp3ed1tzRSetSAefuziWczdgzDhxnQkxW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHYje7PMH+/cItLg5WygWHDFW6eWd0rPmwQwYVA+sMQ=;
 b=ApectDQtRlXYbYxtda3jUE+D7GxvtsMUjdQjbED0I7MhcMAzPsFqXtwoGC0LquiISTAJMYpEDP62EWq921Jsvzruhzvkr4q8h4SFJbgyoykLW8U/lrXf1LIxitT1MP4Cd4G3J3lzqG9yXG41p0/13OZ/e/U4xqxfz8DPUDfNwwRdF5Fp5utAonudjjZ+1gs52qwU+SYBqbDgG/4zfd8GK22L9UAlBCDby8uH/YxODtkwbSjxx/DUQLFPJV969Qemb8e2QHGPdrjPOFPcBu/dFJHQS8pkUnmjLb33eiQRRdNjCrN7mfC1n8KBERQhtpbjCEReb1w5LKvkLX4ud05qXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHYje7PMH+/cItLg5WygWHDFW6eWd0rPmwQwYVA+sMQ=;
 b=ntuRptmZiD5dsM2KLw8x9B/hT0eAy02TudTemapLdekUMY+Zb45fark5mH+iFdM/gNqErNkqJAegzlCvr8lKFvuYUJ50e9hgHd68ucNdNPn35HBtyOfT1kI8Kla9zCvzkZIhBt9Bu5I/xUC8e6APKP6oNkfkProOXid61NpIWg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB6728.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:400::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 08:18:17 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%4]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 08:18:17 +0000
Message-ID: <c841bb0e-2044-5a91-9e61-9f47063e002b@kontron.de>
Date:   Thu, 16 Feb 2023 09:18:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: NULL pointer dereference in imx-mipi-csis driver when starting
 stream
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
 <d2fc1a0d-d058-757e-f935-1b91cfd19749@kontron.de>
 <Y+zKibHcez8or6nS@pendragon.ideasonboard.com>
 <d797611e-8e07-402f-ec75-7a1eadbc2122@kontron.de>
 <dfdd11f6-8692-1bec-2a7c-1d890039cfe7@kontron.de>
 <edddba07-c5c3-bab4-ca0c-49e1a5dc1135@kontron.de>
 <Y+0iMyLnHmqdDJOk@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <Y+0iMyLnHmqdDJOk@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::7) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 360b7997-b5cc-4d2b-efda-08db0ff65b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 057b9/dC5zUU46a0hgfXABeIxiVOUmMQ8xi3eLELeL3YSscDPRvZusSdVRrCzuXkdTDAd7IV/oP9JkauAjzIn7RT0Rofu5X9Ye/iRK5TXbk+78xt416QEmoOt4XSYOeygUOEJYycdXDYy/RkJ90IVLoVeyiwHzjlEV53MbnwywRBXiCDlqeRRIXr/ZYQ4mXAAFa8O3QFSjlChqOqclrnWcT4srdy2zlva4dVNfvUXzH2DFWb9PRJckMavBqceBuvTJHzoiDFcVs7Pb6qpdq8qF2wp0y8Bcaz+faMH8u6NpPIypehhXOzdm2P/tVPzLDqHqAWHrSR8wByqvXbcEjeOkW7qPLZ0e4TcRDWFnaCaqSlaVYf5c0XNSyZHSGQYaa/bs6Lq8CMb1wtLiR8po/b7P2jkpM9YHL/piWf1E/Djs2EmD+AN3D5ZohfMRYQ/61TEhOlYLJBgri9Erusoe6X1tTr8z0N2nA8o+gihw8Un8+HnsMD1pRugCYjWh4+1xnzhG6xDKmp8gMc93QFTyRUopSuYZsN1761hZPY69yX7AIkHF+yhiec8/ExD3h3LIk3QdV8LLCoMJqUl9XRhgHRo0U2Zd2JRWz0p37+V6LJ6EvGD1KUZg5ZWNvlbnq7qwzKpR02f7ap2Gz90z6/+ofFeuCnxnz0frsEwXELZZJUrlGfco0AidyLwSHIf/gMAWLrpCzbULJY6mLdUiex5VY7sH9UQ4kzQmDcaeH7IlYxxIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199018)(54906003)(316002)(53546011)(8936002)(6506007)(6512007)(186003)(86362001)(478600001)(6486002)(31696002)(2616005)(38100700002)(6666004)(45080400002)(83380400001)(44832011)(36756003)(5660300002)(2906002)(66476007)(66556008)(66946007)(8676002)(4326008)(41300700001)(6916009)(66899018)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHozVUp3Z3dtS1RpaGFKamxwRmIwRGp3WlRaN2phcmprNUtQNTVIZ3pjbzR4?=
 =?utf-8?B?cFN2dHZwZUQ5c3FjRWluUGUvN3ZNUmtBdjRuLzVuUlRWaDJaeUdtWExtUUFu?=
 =?utf-8?B?c3pBV0lxUXdoaVBLYlpCZTc0aWlYVHZKV0dhUGV1dDNRZ3c3eHpvRlBKYnp6?=
 =?utf-8?B?VHB4K2ZXM0JDR2V5YTZtT0xIeHlKRmFHTzE5WWRzeG5GZ0ZkR3NTRDc2aEpp?=
 =?utf-8?B?UlZuMjlZM2hXZXhxK0ZtcE9kbWJLMVZLK0NBRGVDcmQvd2xDVHZlTVhFWnpn?=
 =?utf-8?B?QnlwRDcvZElqZ2hFSnRUaGN2bWl4cVloNlhIZUxIUDNVTnduL3FLZkNFUyty?=
 =?utf-8?B?NDZ0ZzRFK3pVT3BNak5GaTM5V05ybDRKTHJTTTFLc0VOQmlwTlNiSm13U1h3?=
 =?utf-8?B?c3BtejU5MW9JcXY5TFVuTW5DOEpDaU5Hc1V2ZDBRTW1MV1BkK1VRM1FFVzdy?=
 =?utf-8?B?eXJUOURab1VqZmVmLzRoZC9XbHd6eDlDeG44Kzk0YVc5NFAyeU5pNHBQTytI?=
 =?utf-8?B?SUpUMjFvWnZ1UkxDYUlVQmNSb3dpcGdGbW1UMEVHdDNpeGRNeVdWMTdadTNs?=
 =?utf-8?B?RUJ4TmlSeGJINS9TM1IreUVSS09XdXcvaTkvRGJRK1kvUjlMM1FWak5IRlRq?=
 =?utf-8?B?RklBeHd1S0VQNXB6ODZ6MUZ5bkVFc2ZNWWg3b0REUVpXWlhxTWk5WnhTUk4r?=
 =?utf-8?B?V1dOZGphUlhkT28yMnZXWnVHSFBPVUVyS0hYK1RFMks0NVRydnkxNGY4RnZB?=
 =?utf-8?B?S3VLSWN6eEFxRkRBZTVjMkR4Z0xRWENqZDFFejJ5RDJhc2RRRHZod0FlWUpu?=
 =?utf-8?B?T0Q1L1YwUXZ5ckRUSDBEa0NpZVhEQmlYcGZsanlLZU1YOGRVNG1HcUR5cG95?=
 =?utf-8?B?OUprTW82NG1yeVYxeW5mNU1GL1pjWXliS0s2dnYzbGxib1J3Ny81MjF4TUJv?=
 =?utf-8?B?K0JUZWk0S0t3WVRCa21lZW9PaWN6UWVkM1hhVXF4TFlVSlZWc2ZNZEdBQ0Vr?=
 =?utf-8?B?RENYTUYzendwbUIrbk1KYjdRaFNGVEdwUTJjUTF1RGcwYnVVa04wUmIxZGNQ?=
 =?utf-8?B?UjFjUjFiUzRMdkozY2ZGQTJ5RFZFN05BR2RxeDJiMkdiR2Q3R0Jpd1B6RGFX?=
 =?utf-8?B?SnBNbG9GNmNGR04xRnAzTGlkNytxK2lheVhRWThzWUwzeUk1TGoxVnlnbjVE?=
 =?utf-8?B?NlQrbUVXNVJQcUc0WGt6dlh6b3R0d1NWdUNWUldZNmVPWkJBRXRXa1ZXOXdK?=
 =?utf-8?B?RnRwaUU4ZFlkQ2E0U01yMWkrZ0JpcFhFUkZQQzltRFhWd0dOK3hnZFpVWXg0?=
 =?utf-8?B?SVVncktZZXozQkFxUVoxdXJyM3VEeGI4MWY0UGpjVGdJWUhlSjZvd1Avb0hZ?=
 =?utf-8?B?LzJoczFyQUFOOHJuM04zVGVzcXFHaTZ3a3ZhbkY3M0Q1cmpoWmlVbUwrdTNn?=
 =?utf-8?B?VmhTbXk2Z253NzF0ei9EZ25oZ0xHbmttNkozN2Mwc05qSVpXd2dBdjFEYm9i?=
 =?utf-8?B?WnVEaU5TM0NBMVVxWXJlNnVsZGtCMnd2MSt1Q09WSGhaM0dXRVVheTRoYWxB?=
 =?utf-8?B?ZndUYSt1ZWg4b1VjWWFNOHJ2a1dqNlpiN0srWUU4dTNiL292b0wwZXRmYkxu?=
 =?utf-8?B?RGJyWGFNajBwTXp3VjB2RDllT2FjVXlJaUEwZXRMMkE4b1dydGhZRWZseVVD?=
 =?utf-8?B?YkRVWkQ4bUwwOHZYOTF1dDgxMTlTUTFZRGVGTFJXa0ZCS0J3dVp0UzMrVHht?=
 =?utf-8?B?NnRXeTlIeHpER0ZxWFFLOXptc1YvMHl4RWdZOEo2dXZ6ajAyU0J1SlJ0dzBa?=
 =?utf-8?B?MHgreWQ1VUxyd2NUS3dxekxwTHFhdFY4R3hpQXBnNkVTWEI3VWpGSUE1TjB2?=
 =?utf-8?B?d080OWpVQlNObHNUWGJ1M2s4eVF3S1RHNEprNFZhSEszMzVEM2RRNzR6QVFJ?=
 =?utf-8?B?d2hKaEFEaDY1SlpUN2FQK2pzQURGTGI3ZU9xaXMwMWx2T0NNZlFvQU9aMlpx?=
 =?utf-8?B?V1FwVU5Ma0hkNkthVGhKTVo1dzJOb2ZGLzU0NmZ6a3JRczhsVWdRcXN0bjVZ?=
 =?utf-8?B?Z3ZpNHFNdTdYc0h1MUlKb3R6OFl3a29CQThEUGJCL1RBNUFRSUYwcjllYXc1?=
 =?utf-8?B?UmM2VXFrM2pMaVVhbkY0WU8rSG8xMEpuSU1rNEpUZThtcHRRMGJ6UkMwcHB0?=
 =?utf-8?Q?bfbCnOrrgjcWDKUnYZGWY76IOVbvRjkYIgz8v7AqPRmL?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 360b7997-b5cc-4d2b-efda-08db0ff65b44
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 08:18:17.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD4ORWpV1CHNCO/IjDfVRiGeDCvr76tra7v6uHjRaLWASLv8ivTvdP29rE6wzpPTxlzfmyLJzaiQ/oUYsFXxdHcGmiIgWAytu4mLbCMuy2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6728
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.02.23 19:19, Laurent Pinchart wrote:
> On Wed, Feb 15, 2023 at 04:30:49PM +0100, Frieder Schrempf wrote:
>> On 15.02.23 15:40, Frieder Schrempf wrote:
>>> On 15.02.23 15:20, Frieder Schrempf wrote:
>>>> Hi Laurent,
>>>>
>>>> On 15.02.23 13:05, Laurent Pinchart wrote:
>>>>> On Wed, Feb 15, 2023 at 12:53:56PM +0100, Frieder Schrempf wrote:
>>>>>> On 14.02.23 17:47, Frieder Schrempf wrote:
>>>>>>> Hi everyone,
>>>>>>>
>>>>>>> after solving the previous devicetree and driver issues with the media
>>>>>>> pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
>>>>>>> now try to get an image from the sensor and run into the next problem.
>>>>>>>
>>>>>>> Below you can find the commands I use and the output I'm getting. Maybe
>>>>>>> someone can see straight away what's wrong or at least can make a guess
>>>>>>> before I start diving into the code. ;)
>>>>>>>
>>>>>>> By the way: This happens on v6.1.11 and 6.2-rc8.
>>>>>>
>>>>>> So it looks like there are several problems (again):
>>>>>>
>>>>>> First I missed to enable the link between the imx219 and the imx-mipi-csis:
>>>>>>
>>>>>> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
>>>>>>
>>>>>> And the imx-mipi-csis driver is missing a check for the missing source
>>>>>> link which caused the exception. I currently have this applied and will
>>>>>> send this as formal patch later:
>>>>>>
>>>>>> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
>>>>>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
>>>>>> @@ -596,6 +596,11 @@ static int mipi_csis_calculate_params(struct
>>>>>> mipi_csis_device *csis,
>>>>>>         s64 link_freq;
>>>>>>         u32 lane_rate;
>>>>>>
>>>>>> +       if (!csis->src_sd) {
>>>>>> +               dev_err(csis->dev, "Missing source link\n");
>>>>>> +               return -EINVAL;
>>>>>> +       }
>>>>>> +
>>>>>>         /* Calculate the line rate from the pixel rate. */
>>>>>>         link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
>>>>>>                                        csis_fmt->width,
>>>>>
>>>>> The pipeline is not correctly configured, and that should have been
>>>>> caught earlier as both pads are created with the
>>>>> MEDIA_PAD_FL_MUST_CONNECT flag. The __media_pipeline_start() function
>>>>> should have return an error. Could you try to check why that didn't
>>>>> happen ?
>>>>
>>>> Thanks for the pointer. I looked at __media_pipeline_start() and to me
>>>> it looks like there's something wrong. During validation of the links,
>>>> there is no code to handle the case where all links are skipped before
>>>> link_validate() is called on them. The loop is left with has_link = true
>>>> and has_enabled_link = true and validation of the pipeline succeeds even
>>>> though there is a missing link.
>>>>
>>>> Does this look like a valid fix to you:
>>>>
>>>> --- a/drivers/media/mc/mc-entity.c
>>>> +++ b/drivers/media/mc/mc-entity.c
>>>> @@ -744,6 +744,7 @@ __must_check int __media_pipeline_start(struct
>>>> media_pad *pad,
>>>>                 struct media_pad *pad = ppad->pad;
>>>>                 struct media_entity *entity = pad->entity;
>>>>                 bool has_enabled_link = false;
>>>> +               bool has_valid_link = false;
>>>>                 bool has_link = false;
>>>>                 struct media_link *link;
>>>>
>>>> @@ -806,6 +807,15 @@ __must_check int __media_pipeline_start(struct
>>>> media_pad *pad,
>>>>                                 link->source->index,
>>>>                                 link->sink->entity->name,
>>>>                                 link->sink->index);
>>>> +
>>>> +                       has_valid_link = true;
>>>> +                       break;
>>>> +               }
>>>> +
>>>> +               if (!has_valid_link) {
>>>> +                       dev_dbg(mdev->dev, "No valid link found");
>>>> +                       ret = -ENOLINK;
>>>> +                       goto error;
>>>>                 }
>>>>
>>>>
>>>
>>> On second thought, I see that this is probably not a correct fix. But I
>>> still think the current code has a flaw. Or maybe I'm missing something
>>> important again. ;)
>>
>> Looks like the pipeline validation is only run for the pads of the links
>> that are enabled. As the following output shows, the pad
>> 'csis-32e30000.mipi-csi':0 is not part of the pipeline and the link
>> 'csis-32e30000.mipi-csi':0 -> 'imx219 1-0010':0 is therefore not part of
>> the validation in __media_pipeline_start().
>>
>> [   36.069274] imx7-csi 32e20000.csi: media pipeline populated, found pads:
>> [   36.080901] imx7-csi 32e20000.csi: - 'csi capture':0
>> [   36.085926] imx7-csi 32e20000.csi: - 'csi':1
>> [   36.090222] imx7-csi 32e20000.csi: - 'csi':0
>> [   36.094524] imx7-csi 32e20000.csi: - 'csis-32e30000.mipi-csi':1
>>
>> So the first time the disabled link is detected is in the driver in
>> mipi_csis_calculate_params() which leads to the crash.
> 
> Of course ! That's what I was missing. Indeed, we have an issue there.
> I'll try to cook up a patch.

Great! Thanks!

> 
>>>>>> Now with this resolved, I get:
>>>>>>
>>>>>> v4l2-ctl -d /dev/video0
>>>>>> --set-fmt-video=width=640,height=480,pixelformat=RG10 --stream-mmap
>>>>>> [  574.758110] imx7-csi 32e20000.csi: pipeline start failed with -32
>>>>>>                 VIDIOC_STREAMON returned -1 (Broken pipe)
>>>>>>
>>>>>> So still not there, but a bit closer ;)
>>>>>> Probably I'm doing something wrong when setting up the format, etc.
>>>>>
>>>>> Quite likely :-) Have you configured formats on all subdevs through the
>>>>> pipeline with media-ctl ?
>>>>>
>>>>
>>>> I'm doing the following:
>>>>
>>>> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
>>>> media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SBGGR10_1X10/640x480
>>>> field:none]'
>>>> media-ctl -d /dev/media0 -V
>>>> '"csis-32e30000.mipi-csi":0[fmt:SBGGR10_1X10/640x480 field:none]'
>>>> media-ctl -d /dev/media0 -V '"csi":0[fmt:SBGGR10_1X10/640x480 field:none]'
>>>>
>>>> Is there more I need to do? Sorry, I still lack a lot of understanding
>>>> and experience on how to use the media framework.
>>>>
>>>> But I guess in some way it's also good, as I can provide some testing
>>>> for the error handling, that you would probably miss otherwise as you
>>>> know how to setup things properly. ;)
>>
>> So, I found out that I used SBGGR10_1X10 but the sensor only supports
>> SRGGB10_1X10. Now the pipeline seems to work.
> 
> Great !
> 
> On a side note, if you don't want to deal with the complexity of
> configuring the pipeline, libcamera (https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flibcamera.org%2F&data=05%7C01%7Cfrieder.schrempf%40kontron.de%7Ce522d5e5757e4a6d58b608db0f813049%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C638120819750552954%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=GaL%2Bjlm0pcKs2Ijy23UQ6PzWuDVxpTTkjbhuiBASoJw%3D&reserved=0) can do it
> for you :-)

Awesome, thanks for the note! I will give libcamera a try.
