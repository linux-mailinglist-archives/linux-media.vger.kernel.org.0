Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FCC697E3C
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 15:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjBOOUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 09:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBOOUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 09:20:41 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2095.outbound.protection.outlook.com [40.107.20.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE3F6181
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 06:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWUoYS/r0V86EqMGPGsS+Ic2dJFBtzvO11fuVlDv1BuBqDdCJ/tCChmTxlUXE+p5yzALxgD81ispzRL+42xfxeWTrWVxhHMd2PAK/NS2jupzxro9UXE6TiDhQ2tGZUK3BPhOGCI7IdZyei9KtmHLtHDGyzXAh0ZkYCyHp2FIljQBa4Gso8svm39hBo0CvUu5iZm5eWS3c9YbgzzQyt3pGSTVQNATmqmEHkW0PP6Qax3LEyBVdrysa4DjZlDLiWnXcsvQfk99p8tf1L8Sq3HXNUbVRUPGDbeZBiMSAg8DH2dSQVU+M0/nnm87O30Sc4+x4FMJhLQVs/LdeTy32jxYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTfltmqSsLimjXiI1fn5/5IRrIRPGnkwd3nexQ/J9As=;
 b=oWmb5zQE8kBV9LK5S/WyE14Z3cH0+ECig/KSoIm91GsBRhe1cxevtBgeABi/Jc5SssLy7yPgOgbRmm42FC3X2OiPm1VsvnCiLvQIpDfijCLBhyfRcYd/GCBJ8iWPZM54VSLr8XpFO2DDRCTlmnF2oyPL/4M3yBXamHT54X8+6YXxRJHMzM331GwdyIwj2EAGKN+TSu4cN3r59LN5j8tYxYbcGyI5NTvgsAtShVYec9teZKwd8/gjaNMArazaCKYMXiYSfLxXi4Cpa1sDBhEP0z6i0JcKctZ/2ggC24fZ51Do/tYEQosr+dRLSnxaYIqDuZTMV1E+A9Q9l5NjV9yWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTfltmqSsLimjXiI1fn5/5IRrIRPGnkwd3nexQ/J9As=;
 b=bYT6NvsnYoZpyThqKsoL4Nm8zatuEDUoU9imM0Qyaf9ptHNI/g5cz/Dx6QG9cU//MhApvXfivMZ0vR3wLuRCel+/WeDsz1LWrOFIp+1PepOekzjopPO3lxju1j7lTsVlmnePbLrVrKb5IJ4mjnMWFEfuEGsB3qD60BWF1mzWzJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::14)
 by AS8PR10MB6030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:539::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 14:20:37 +0000
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3931:3416:1ae8:e00f]) by AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3931:3416:1ae8:e00f%5]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 14:20:37 +0000
Message-ID: <d797611e-8e07-402f-ec75-7a1eadbc2122@kontron.de>
Date:   Wed, 15 Feb 2023 15:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: NULL pointer dereference in imx-mipi-csis driver when starting
 stream
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
 <d2fc1a0d-d058-757e-f935-1b91cfd19749@kontron.de>
 <Y+zKibHcez8or6nS@pendragon.ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <Y+zKibHcez8or6nS@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::18) To AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4f2::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB5671:EE_|AS8PR10MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: e64d1141-b38b-4cb4-8afe-08db0f5fcf2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gwiAt7V8YVHz0x6YMMJC1VqMEuletw5PtjMqRuF4T4nIx/OejLSBdj4rFDPcRtmArM8nzlbHU0kC15xQKq9Gb6aqzrpABPEdH0N7G6sMCVS7oeLEqeJ1nPOtYjgbJV+vUEyFugWIlaIHpaPZX8Rx7A/AFBn+M68vbPLrJecIql2jLm3aKMVT8+otaadPDXgtn+zhQljy6SlV2FXovWKUq6yCdzr0Ge+sj8hY169g3WtPbMqTHJnPy15GiE5H+bG8Z6EFE47ScOrbMqWMpFEYqWmAqaY7XdAORIXWjyFaxb7/xAlRcTs1sKaKWDhfIsSVRkwU4qirXfn7YNFef7PvcFwsM2fuK0bVTX1RFzn48bJEBxCsze+ZzbQEJME+xjD9qkCH2QFBT2QaqYQ27bCy0XyJVe2KFeOya0OAQh9wufq4vVYQPxJebYqdtBrrTkr5013XOm3ieAQkJQCw7lCk1a1AfXizfTtX7IV9OTABRIwlI8ij+3EfyjUjqprljj64aKsV0RBrKOF9fEFpCZu94pf6rV/I++MtivEljxOFSS5po4/IBDM7hv5IHc4oSFyL6D+oFSJhNsM0AXSiGgB/vdILE9xC/H37fZBg0E9G9DOymczoP8rLyNjY/Vi1qJdH1jgag/XKbcdSuwaOOfXrbpN0vUhJN6d94AP+h84w0Ng468tJ7evZXMg1CZTOOFfKZhgrbk8Fr9vofxK0y9krUjQwXm9XKqUrd7Ngmnv6rqQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(5660300002)(6666004)(31696002)(54906003)(478600001)(83380400001)(2616005)(38100700002)(8936002)(6486002)(36756003)(31686004)(2906002)(6512007)(8676002)(4326008)(44832011)(6916009)(6506007)(186003)(66556008)(66946007)(66476007)(86362001)(53546011)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UENXVDhtd2lBN0lDZytqK2VZSFQxcFZ4dTFDSGdCdlYvSzB2UkRTenVMbjNh?=
 =?utf-8?B?RXp0aFEvOUhrU3Z2VERTUkNsVm5xSUpHV2s3TFA2VXhvV0NnVHlSdWRDaFFU?=
 =?utf-8?B?U0dEaURJdjA4S3FIMWh1aG1yQTByQVM4WVJpaksyK0ZVbmdTM0VNdjZYWUda?=
 =?utf-8?B?c0kzRDRoOXZUVWJmWEZaREVMR2F4a21PaEJsaTUzRFU0OUVOS3c3V0xRS2U1?=
 =?utf-8?B?MUN5ZTFSQnBXa0NibnM0UndXMWUzQVE5Mnc3ZEFvbEtTUmpCQ0dqNFRaMzVY?=
 =?utf-8?B?L3hqRE5WSUpELzhqYk42R0RhWTd2MFNvT2pqTlduc2t2TmRXdGRRejhiT3Na?=
 =?utf-8?B?SXMxQWR0NVhodEsyZUdIL3pOUHhCWkpHdlJLc010bEt6ZjhMUDVoRDdEUTd5?=
 =?utf-8?B?Z3NNL0YxWjFaNjNVOFhpei9LM3Qrd0h0VlovNUlSdG5iWVlFRmFZSUgrZHUw?=
 =?utf-8?B?VVpXYkdXTWpCUnVOWlozT2hxMnlvdmg5ZjhXbGhBM21mMmJaeEZlelFBc3NJ?=
 =?utf-8?B?ZG1adEFnellKSWFrYm5mWWcwaW5oQnh0WjUySlg0clNnZnpQVTN6WE56RUJp?=
 =?utf-8?B?RSs5RVNUVCt1QkQ3OE9XclRmdnhnTzFnS3pzdVVERk5Bd0dtaUZHRVNOak5m?=
 =?utf-8?B?SThCRnFNYU12SFRpcXpadlVwdzFHeE05N2ZUWjZiTGMrWFlvcXlUbTlrN3p4?=
 =?utf-8?B?bWxMWHdLMjdSd2t0V0x5anJLejh6eVZkRmUvRGQvdmFIdnR0UnlwVFg0YzUz?=
 =?utf-8?B?QkdzUWI3UnFjd0hLMFdOamIvN3VQTTdNR0JVK0JKRmRlRlAyVlhNdTZYMlFT?=
 =?utf-8?B?UWF3OG5sWHBGSzVvcFZOdXJ3TUlURDZLekxaMmVBME9kUm5wdTNiTTJrNTZG?=
 =?utf-8?B?Nm9HNHdITkRMUm9GRnNpdmp0VUhkamdVOVZod2RFUExvOGxPSEZZbTlNUmMy?=
 =?utf-8?B?SjBCUHhjdTR3UXA3Sm9GYldUSWhsUHk3SktxTjQxSE1kajV6eHk2cmlvelNQ?=
 =?utf-8?B?QXBEbEdaU2NYOGYwWDBwT1FwTUNWYnJjSUNpZEFtQ2xQNVJWU0xnK3AySWN2?=
 =?utf-8?B?WUNxRitROENQOGE2NDNvOHE0cHBIODZ5SzE1UWtodWYwV2p0dzZpalNjZW1C?=
 =?utf-8?B?aDVYM20zL3l3QmUrblNwTE5PT1d4YUNtaG1PZUdsOGNKb0xmOVJCMGRUdFZs?=
 =?utf-8?B?SnVBOGtzY1J5Wk9YUFVxd3A2Yjdzb01xMEJyektyZXZOY0p2a2JaWFVrMGZ1?=
 =?utf-8?B?ZzYwU3ExbVpNZFh3S0NOMnlPaUpPZTdIeDdHTHRueUNsamF3YzMvMERwK09u?=
 =?utf-8?B?ZUsrbXg4WENLR0hzQXM2TEdLdnUwOGRIOThrL2diS3JGUHdsa1RZYklNUnB2?=
 =?utf-8?B?bmQ1TTU3eHpKdlJFdzlZczlzYnFHVnRRODUwTXlmY09FeEZIa0ZNbUZUckdy?=
 =?utf-8?B?VzJjUVU3MkQwWnh4Nkd1VnErVnVMK053ZTRyTytpZFJla0pEMis5NmJPTE9h?=
 =?utf-8?B?Y1JGM2VheEhHVmtSLzhDeVF3eHAxbnJ0d0lRTnp2Y3J4c3NTNGEvNXRHYlFV?=
 =?utf-8?B?a25zOFdvazlHUGJ3MWVxcVN1cDRXNVQ2b0c4WjljaHNBemNkWVlKclBpd0t6?=
 =?utf-8?B?MTRTNWsyQmpLUExJalhvWXN6WEtrUHJvbUU1bWpuNk40eHNpVjJ2VVNnUTBo?=
 =?utf-8?B?Y05RSmdlWUpxUndMSTVTRmxZNW1SWWd5SFMwSFA4azZ5VTZrREZuckx6d3RJ?=
 =?utf-8?B?ZFdSS0RXd0U5cnowajByeW9uZUFFMnN2MThpTDAvMEhMWFNSQjh0Z1dJZFI0?=
 =?utf-8?B?QStXRW9pSmFFQTE0eFZsS0FzejBQYmtzVW8wRXc5STFQejJES2hhempNeS9m?=
 =?utf-8?B?YmV1MDRGanJYK1FrNlhTUWkyU0gwU25TZjQyaWk5TTd4YlJSUU84S2tXakls?=
 =?utf-8?B?WXk4c3NVclJSSFN0Ym04SWYvSVprZFp0SXI0allCeG9Cc2VmT0Fvd1BzYXlL?=
 =?utf-8?B?Qkw0V0YySm84Uk1UQkxFUWV5ZXdobnlCWnZYS21tNW5vMXFIVkJybjVmMGdq?=
 =?utf-8?B?NkdZemVDY0dqSElVck5hTWpCemVtTXQvVnQvc3JlcDJrNnExcjdSUVloNUJM?=
 =?utf-8?B?cHNIREZndEhuZmxzT1JsVXI0R3BRVjFpKytRWkpxYUdkeUVsM1BsMW5qRFFT?=
 =?utf-8?Q?6tgramdIiErIaSlBjQN0ammzMjYNKbGBVDbKr7dJS0zK?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e64d1141-b38b-4cb4-8afe-08db0f5fcf2f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 14:20:37.6928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OU5+OTaahl70RSk89u451Ee75rcCCoX6RmCj8pC7pEwLFwMtbsyXBwr/fGz1LlfVlaWedmy08lHvbHfAc/puh3gk0TQws+JKMh3WzpQ/gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6030
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 15.02.23 13:05, Laurent Pinchart wrote:
> On Wed, Feb 15, 2023 at 12:53:56PM +0100, Frieder Schrempf wrote:
>> On 14.02.23 17:47, Frieder Schrempf wrote:
>>> Hi everyone,
>>>
>>> after solving the previous devicetree and driver issues with the media
>>> pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
>>> now try to get an image from the sensor and run into the next problem.
>>>
>>> Below you can find the commands I use and the output I'm getting. Maybe
>>> someone can see straight away what's wrong or at least can make a guess
>>> before I start diving into the code. ;)
>>>
>>> By the way: This happens on v6.1.11 and 6.2-rc8.
>>
>> So it looks like there are several problems (again):
>>
>> First I missed to enable the link between the imx219 and the imx-mipi-csis:
>>
>> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
>>
>> And the imx-mipi-csis driver is missing a check for the missing source
>> link which caused the exception. I currently have this applied and will
>> send this as formal patch later:
>>
>> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
>> @@ -596,6 +596,11 @@ static int mipi_csis_calculate_params(struct
>> mipi_csis_device *csis,
>>         s64 link_freq;
>>         u32 lane_rate;
>>
>> +       if (!csis->src_sd) {
>> +               dev_err(csis->dev, "Missing source link\n");
>> +               return -EINVAL;
>> +       }
>> +
>>         /* Calculate the line rate from the pixel rate. */
>>         link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
>>                                        csis_fmt->width,
> 
> The pipeline is not correctly configured, and that should have been
> caught earlier as both pads are created with the
> MEDIA_PAD_FL_MUST_CONNECT flag. The __media_pipeline_start() function
> should have return an error. Could you try to check why that didn't
> happen ?

Thanks for the pointer. I looked at __media_pipeline_start() and to me
it looks like there's something wrong. During validation of the links,
there is no code to handle the case where all links are skipped before
link_validate() is called on them. The loop is left with has_link = true
and has_enabled_link = true and validation of the pipeline succeeds even
though there is a missing link.

Does this look like a valid fix to you:

--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -744,6 +744,7 @@ __must_check int __media_pipeline_start(struct
media_pad *pad,
                struct media_pad *pad = ppad->pad;
                struct media_entity *entity = pad->entity;
                bool has_enabled_link = false;
+               bool has_valid_link = false;
                bool has_link = false;
                struct media_link *link;

@@ -806,6 +807,15 @@ __must_check int __media_pipeline_start(struct
media_pad *pad,
                                link->source->index,
                                link->sink->entity->name,
                                link->sink->index);
+
+                       has_valid_link = true;
+                       break;
+               }
+
+               if (!has_valid_link) {
+                       dev_dbg(mdev->dev, "No valid link found");
+                       ret = -ENOLINK;
+                       goto error;
                }


> 
>> Now with this resolved, I get:
>>
>> v4l2-ctl -d /dev/video0
>> --set-fmt-video=width=640,height=480,pixelformat=RG10 --stream-mmap
>> [  574.758110] imx7-csi 32e20000.csi: pipeline start failed with -32
>>                 VIDIOC_STREAMON returned -1 (Broken pipe)
>>
>> So still not there, but a bit closer ;)
>> Probably I'm doing something wrong when setting up the format, etc.
> 
> Quite likely :-) Have you configured formats on all subdevs through the
> pipeline with media-ctl ?
> 

I'm doing the following:

media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SBGGR10_1X10/640x480
field:none]'
media-ctl -d /dev/media0 -V
'"csis-32e30000.mipi-csi":0[fmt:SBGGR10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"csi":0[fmt:SBGGR10_1X10/640x480 field:none]'

Is there more I need to do? Sorry, I still lack a lot of understanding
and experience on how to use the media framework.

But I guess in some way it's also good, as I can provide some testing
for the error handling, that you would probably miss otherwise as you
know how to setup things properly. ;)

Thanks
Frieder
