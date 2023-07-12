Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380D674FF26
	for <lists+linux-media@lfdr.de>; Wed, 12 Jul 2023 08:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbjGLG1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jul 2023 02:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjGLG1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jul 2023 02:27:21 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2120.outbound.protection.outlook.com [40.107.6.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7778810C2
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 23:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elX7zPuhZjdpzroKbkGyq2IVLrrZXNgfLwaqv8pyYt4EK9YSxZgyh/gzJ6HnfJqng6hdClbGUmD+urg+snP6NRT8Kk+tDev33LXwY7OT0PmQI4FKRMM2JyFPchquIxrjnhFJf5vszX27bFJMHzMLYdNU1gSPsT8SVYdESDJPLjs7Z0jO6v5nKCJkRVbyKlCuthyNLAwnLTHMyY6ywu+fOZwzojsr3Iti4SOo/Wj3Uo79m+p1mwWYBgkdZFPHRDxmTfMlat4frMYGxKGrp6Iy0TttA02wU6dwS27DKw3czoApm1L0bQ6cw4nU5Sfh6gmo/uOIfi/38PoVix92/F+NbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iY4fZzChUG/jMRDtcdkBwcCwFCcWQsuOZCcDy1PW+8=;
 b=OAM5jxjgzwsshc8smRLlRidTv5pHvG5ytpFvXjO8TG1EUz82E+oj2b0CGCGY0OWhSc55Bgc3oiayJYXr+Iab/smBMRIJ+b+bByi/Sx38zedS5GsmEcvNhtM+AmJAjsO6EWoLBr2GRPoFuD0HdACrm7CFKyNAXZCymAK0+2M6P0hJDHtuhB+IzBuBYMems75O2ZH0hC+Zu1VvHryAy4TeFlR78x4k64tVqTv6v94qtOGUZ7d4OXVIHSB7xs8aqbJjhrqTuQ/p6Kori3s2zUvTnRZGwdXONotOPw/zpbbBhtuK+9SVEF4syRawFYFaHNx9bzH/04HS/zan658Pimj+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iY4fZzChUG/jMRDtcdkBwcCwFCcWQsuOZCcDy1PW+8=;
 b=NeiHB9+eg+E2dr8sCbUrM35ANt46UP8ySM+QulxyHoOM7eiKrPaDo+BUuI7tjkCIBOVAW2YW/1vbwbBhnQgjaRZfVF30cCg175Nxq6eVc8YL6AHnbVJZxNiGospcFMnhP8zxP6LfPv/OEZNGZg+LQ97L65LJ5B+196RE0RaJU/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB7481.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:424::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 06:27:15 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65%7]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 06:27:15 +0000
Message-ID: <b2d91ede-e834-1b78-78a5-00fbefb09d37@kontron.de>
Date:   Wed, 12 Jul 2023 08:27:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Capture image from imx219 sensor on i.MX8MM
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com>
 <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
 <Y+EhsjtL5DYBie9u@pendragon.ideasonboard.com>
 <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <Y+Vxg1lt0aIDRGIR@pendragon.ideasonboard.com>
 <d275e830-5960-0910-ca34-1b990971cea3@kontron.de>
 <Y+toAcOYNFbbvpPj@pendragon.ideasonboard.com>
 <07ceda76-3b3e-10d3-ecd3-e9fb2669445f@kontron.de>
 <12ad73f5-ea42-946b-5c89-5b6a07153006@kontron.de>
 <CAJ+vNU2R7DKoUcebKBC9Y74v_6FEXAGK=8mYD-CpqRypVdnXfw@mail.gmail.com>
 <ace7d422-17de-49d8-dac0-a6e4d74d1232@kontron.de>
 <CAJ+vNU3=AWYLdEom9SUMzQ7ccNa-kbMvW_wvAG1qeHehqoNb+w@mail.gmail.com>
Content-Language: en-US, de-DE
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAJ+vNU3=AWYLdEom9SUMzQ7ccNa-kbMvW_wvAG1qeHehqoNb+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::13) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e769f8-f572-45bd-75ac-08db82a108e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAerElnbEW7yBRWgV0wNK35N4fYTwA7lqOCYK3+3GgU0N5AwvomKbv9ylQQfp1YzwgaClmBp67/ajMwH0RARAZA4Y9RjjVN/Zr9W2FaPqt8rFgim4anIIjEtSh1lkrbmJP0HjIZWfp2EXQL2t94YTpkjuN51qeWDF1PWQ3jehJMLiEbw0TAY+AGyx8ePNLeHGoTWDE2Ehdz5elnRDDs/9l1yAtyRemxZNOpcHkGryUAeQd+4wUOwB6uCo8N5FkGEWx6YfI2tnqEKiZeRRyqvxeSuRk3HDYbhn+N6fZFEd6mRF+cxASkJi5N+13yqFAI0bNzdQiL2zi4awqgARcEdrIXNZc7WzD6tsVWh6DiMjbvjc9ZqP4M2zd6XdhecGN2yzCCj4nyPGN+tWNGlm8485zs9qfrMOtVcbmmRxdEB9JbWWW6Gj7ZkHRC8Dr+E0Yrbd2DiovNFapkGsjjCNcq53d6iguo7/tLt8RTAQeWFbCbLDaV8dAAuTJAqSILUSHKW2rFgm+6Ykt8Sd7f609LVKSodQFQV7bhXbadF8RNE97LqLgqQKr2szlDckkqylfbY9hjDqpyD8iMAihRkIjkZ44BvteFgh4xDbeFiFN3Udzh8x8m3bOs4RS/orruPi4ZD9XZuF9tuplKjcOTy7JFOMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(6486002)(6666004)(6512007)(6506007)(186003)(53546011)(26005)(83380400001)(36756003)(2616005)(86362001)(31696002)(38100700002)(4326008)(66946007)(6916009)(66476007)(66556008)(41300700001)(2906002)(316002)(44832011)(31686004)(8676002)(5660300002)(8936002)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3VJWnJ2SDdnSmV0UTBFakxtT2RzSGpWVElzZXFSYmtQZ092ajkxU2h1WVF4?=
 =?utf-8?B?U0hzaXZhUXpZSGNTQi9HdGhNd21rS3NMZGcvNFNVMnJhYlVselZ4UDhYNFRa?=
 =?utf-8?B?VDhFYlptL0E0MUo1Wk9BOHVCaG1qZjdtakxrSEhNSW5CTjdEZ0FoTEI5aXVO?=
 =?utf-8?B?b1hnOG9qa1pMT0MvM2lJb1NScFlOUzBaZ1BmdlhYb3RzalppczNUQTdLamVi?=
 =?utf-8?B?WmI1Q0JENnMvOWRIRjY0aFR5dmF4ZXZHdXhZd1cvZXFORnE0b2gyTVQvV01y?=
 =?utf-8?B?U1FHcDBYYXVQbTg4dm1ia1Qwcm5nanpWU2hISXJIODFibVMyR0h3ZVh0R1hq?=
 =?utf-8?B?SENXUEhscW9mdXFBcHhkSThKL2tXUTJabCtKREdKaERRdFFrRVVIWXJGQllq?=
 =?utf-8?B?SkQ1UnNyYWFGV2lqNmNyRFdNbm5HNVRiNjNTeWdpVFlUYnJUbmU3RkxOWEww?=
 =?utf-8?B?SVpraUJISHMxV3BBczZ1VlA5ODNnSkQ2c3dFWHF1UHZyZlE5SGNHZWpPQ1py?=
 =?utf-8?B?ZnZLTmRvTzJ4WDlhekpGNUtqb0Ryc1hacEx1d3pRejNwSUlPb2IzRnljRE55?=
 =?utf-8?B?Q2pkNmI5SUplMVRISTEwenZZa3E4SUpIc2xhKzRVKytNKzVhU0tjWHFxNTJC?=
 =?utf-8?B?Mlc2cXlGNXN0Y2V3bSt0Y2dhRmxuK01CV05PQ08weWpHTGlaYmFLUTBiUzBu?=
 =?utf-8?B?djBUYnlkV1FtWnpVMWRPWUtQMzlGYk9wUVpJWjlzL3FFYUFZMjl4Nm1YL2Yr?=
 =?utf-8?B?YkhudTB6d01GcnBuczZ3UnhFVjUwMXFUbTJkaTdGc09kdlA0WW92dmMzeEdl?=
 =?utf-8?B?RERpN1JWZzVFNnU0SGJpZVNjTFJKZVpGMWVyY1VETWt2L0JWVnI5dDJIV1Na?=
 =?utf-8?B?WFArR2s3VVR6bWxCM21uNkpBcGFPTzRmaWNNWjZyQmJ0Vks4eWJ6aTJoRVBN?=
 =?utf-8?B?eDR0MHlTc0hnSGhJNU1zMlZFd3Y5OE9YWlJRd3M4NU9CeldwSWhTNC9DR0cv?=
 =?utf-8?B?S29UK1lFc1pobDJZQ0psQ203RFpodm0zVWxobmN6a3NPUEl1WVNpWWhjRy8r?=
 =?utf-8?B?bHpwcHEzc2ZlcS9wYUVqdEl1V1NtUnpBZGd1dnIrYUVySXV0S3pMNWNvR3Ro?=
 =?utf-8?B?RGpXeHhnWlp3R1NiVkFLd0xQTnh4R0MyWVJIOGNPenRQSmwzeUhRb0JPMHgx?=
 =?utf-8?B?Ymt4V2hFNDVEK0txV1huZ2ttT3N4NnFvSWNyMThBZTVBR0ZuVnlBUzRUYy95?=
 =?utf-8?B?YmdVR1Byd002NHNjajJSSTQ3RTBwY0VBaDRuOUZNeCtqcFBTV3lLMGV1RFVZ?=
 =?utf-8?B?UE1hVXN4bEx6andPVzlRWTZFd0lrRUdUQjV5Y01KdTdPTXlzREZJdXBRMTJx?=
 =?utf-8?B?Q3krQXNiZkJ0K3dWK0h0UzM3RXQzaWRPbFhzcUk3ZHd6VjRMK1hyeVNTWGZs?=
 =?utf-8?B?VCsvTjNJRWpsZ1EwRjFVSHp6dlV0NXdEdlJiTGZkRGNnYzdjdk5TNFYrOHV6?=
 =?utf-8?B?UExNbXhCbTJqMmJJQkN4RGhzT3NDQXdRdWdlYyt4NnpRMSttMzhCcHUzY3Za?=
 =?utf-8?B?TU9HRkFBQURvamlwY0NEd0lzRUJxQ1NreDBETXQ4NmlseENBelhxRndBOG44?=
 =?utf-8?B?MDVjZFVFTnpUSVdxV2dyZ3M0SEdoQnRkOHM0ZCsyT1JUYkluL3ZnUi9kdER0?=
 =?utf-8?B?Y1N2UXY3M2s0SjN3YmF4MzhUQ05CeHc2ald1RzZCaDd5MkNZeFB2RmkyYUlK?=
 =?utf-8?B?bHphQkVXQm9EZExCdHc5QVErR2dnMVhTMXJNa3VBbDRKTmVHQ2tsTHR3YUtj?=
 =?utf-8?B?WUhwM0t0QUNwUG1sckEyVWxHZ3hXSGtsMys2cUQ4eldnUTVPUzFLcStZSWZI?=
 =?utf-8?B?MEFBY1dKWHFTT1oyanhDeCtFcXZMblAyWDJDNlgzaG9Dem9rNGZ4L1FuNU5M?=
 =?utf-8?B?Qk1EbVg1NlBtWGY2TVhnZ2trQXJ2Ui82N3FnR3dqM3d2NkpZbUc0M2g1ZUxz?=
 =?utf-8?B?emhTNEpwRHd3cjV1L21QN3pVbG5ERzAzNDdEU0RDazN0REJ2MmJWd3BSNE1V?=
 =?utf-8?B?dmdnMlRCMkV3bi9QU3dPQW5xZ00ydFlnbld2U0NLWURUTXFUbzBaMzNNUzFV?=
 =?utf-8?B?RUFNR3h0Q1FXbDJ4ZithZ2tNTTFCVTcyR1JuUTVyZEFZSjEzV1R6NE9xNjR0?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e769f8-f572-45bd-75ac-08db82a108e6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 06:27:15.5071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WplzERIk+LQKHe0f7Ejo4q8OOMW69PcQ6GsV1wTW1SSdBzQGmptI4O3pc1Rcb7ZH6uOqdVzC4hh1TMIuNT0JHyWlB6sQR5vJcME8gkKOzP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7481
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On 11.07.23 22:02, Tim Harvey wrote:
> On Mon, Jul 10, 2023 at 12:58 AM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> Hi Tim,
>>
>> On 07.07.23 23:57, Tim Harvey wrote:
>> [...]
>>>
>>> Frieder,
>>>
>>> Where did you end up with this? I have imx219 capture working on
>>> imx8mm on a 5.15 kernel with lots of backports but have not managed to
>>> repeat it on a 6.4 kernel. I don't run into the issue you are running
>>> into (I have the imx-media device showing) but the media-ctl entities
>>> have changed since my 5.15 kernel and I can't figure out how to link
>>> them up and configure them with media-ctl.
>>>
>>> On my imx8mm-venice-gw72xx with imx8mm-venice-gw72xx-0x-imx219.dtso I see:
>>> root@jammy-venice:~# cat /sys/bus/media/devices/media*/model
>>> imx-media
>>> hantro-vpu
>>> hantro-vpu
>>> root@jammy-venice:~# cat /sys/bus/media/devices/media0/model
>>> imx-media
>>> root@jammy-venice:~# media-ctl --device /dev/media0 -p
>>> Media controller API version 6.4.0
>>>
>>> Media device information
>>> ------------------------
>>> driver          imx7-csi
>>> model           imx-media
>>> serial
>>> bus info        platform:32e20000.csi
>>> hw revision     0x0
>>> driver version  6.4.0
>>>
>>> Device topology
>>> - entity 1: csi (2 pads, 2 links)
>>>             type V4L2 subdev subtype Unknown flags 0
>>>             device node name /dev/v4l-subdev0
>>>         pad0: Sink
>>>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
>>> xfer:srgb ycbcr:601 quantization:lim-range]
>>>                 <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
>>>         pad1: Source
>>>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
>>> xfer:srgb ycbcr:601 quantization:lim-range]
>>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 4: csi capture (1 pad, 1 link)
>>>             type Node subtype V4L flags 0
>>>             device node name /dev/video0
>>>         pad0: Sink
>>>                 <- "csi":1 [ENABLED,IMMUTABLE]
>>>
>>> - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
>>>              type V4L2 subdev subtype Unknown flags 0
>>>              device node name /dev/v4l-subdev1
>>>         pad0: Sink
>>>                 [fmt:UYVY8_1X16/640x480 field:none
>>> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>>>                 <- "imx219 2-0010":0 []
>>>         pad1: Source
>>>                 [fmt:UYVY8_1X16/640x480 field:none
>>> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>>>                 -> "csi":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 15: imx219 2-0010 (1 pad, 1 link)
>>>              type V4L2 subdev subtype Sensor flags 0
>>>              device node name /dev/v4l-subdev2
>>>         pad0: Source
>>>                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
>>> xfer:srgb ycbcr:601 quantization:full-range
>>>                  crop.bounds:(8,8)/3280x2464
>>>                  crop:(8,8)/3280x2464]
>>>                 -> "csis-32e30000.mipi-csi":0 []
>>>
>>> When I try to link and configure the pipeline I run into issues I
>>> don't know how to resolve:
>>> root@jammy-venice:~# media-ctl --device /dev/media0 --reset
>>> root@jammy-venice:~# media-ctl --device /dev/media0 --links "'imx219
>>> 2-0010':0->'csis-32e30000.mipi-csi.0':0[1]"
>>> Unable to parse link: Invalid argument (22)
>>> ^^^ not sure why I can't link imx219 source pad with mipi-csi sink pad
>>>
>>> What changed for me from my 5.15 kernel is the entities and pads
>>> above. My 5.15 kernel looks like this:
>>> root@jammy-venice:~# cat /sys/bus/media/devices/media2/model
>>> imx-media
>>> root@jammy-venice:~# media-ctl --device /dev/media2 -p
>>> Media controller API version 5.15.15
>>>
>>> Media device information
>>> ------------------------
>>> driver          imx7-csi
>>> model           imx-media
>>> serial
>>> bus info        platform:32e20000.csi
>>> hw revision     0x0
>>> driver version  5.15.15
>>>
>>> Device topology
>>> - entity 1: csi (2 pads, 2 links)
>>>             type V4L2 subdev subtype Unknown flags 0
>>>             device node name /dev/v4l-subdev0
>>>         pad0: Sink
>>>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
>>> xfer:srgb ycbcr:601 quantization:lim-range]
>>>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
>>>         pad1: Source
>>>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
>>> xfer:srgb ycbcr:601 quantization:lim-range]
>>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 4: csi capture (1 pad, 1 link)
>>>             type Node subtype V4L flags 0
>>>             device node name /dev/video2
>>>         pad0: Sink
>>>                 <- "csi":1 [ENABLED,IMMUTABLE]
>>>
>>> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
>>>              type V4L2 subdev subtype Unknown flags 0
>>>              device node name /dev/v4l-subdev1
>>>         pad0: Sink
>>>                 [fmt:UYVY8_1X16/640x480 field:none
>>> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>>>                 <- "imx219 2-0010":0 []
>>>         pad1: Source
>>>                 [fmt:UYVY8_1X16/640x480 field:none
>>> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>>>                 -> "csi":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 15: imx219 2-0010 (1 pad, 1 link)
>>>              type V4L2 subdev subtype Sensor flags 0
>>>              device node name /dev/v4l-subdev2
>>>         pad0: Source
>>>                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
>>> xfer:srgb ycbcr:601 quantization:full-range
>>>                  crop.bounds:(8,8)/3280x2464
>>>                  crop:(8,8)/3280x2464]
>>>                 -> "imx7-mipi-csis.0":0 []
>>> # configure media controller links
>>> media-ctl --device /dev/media2 --reset
>>> # link the imx219 source pad (0) to the imx7-mipi-csis sink pad (0)
>>> media-ctl --device /dev/media2 --links "'imx219
>>> 2-0010':0->'imx7-mipi-csis.0':0[1]"
>>> # configure the imx219 source pad (0) for srgb 640x480
>>> media-ctl --device /dev/media2 -v -V "'imx219 2-0010':0
>>> [fmt:SRGGB8/640x480 field:none]"
>>> # configure the csi sink pad (0) for srgb 640x480
>>> media-ctl --device /dev/media2 -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
>>> # stream 640x480@30fps
>>> gst-launch-1.0 v4l2src device=/dev/video0 !
>>> video/x-bayer,format=rggb,width=640,height=480,framerate=10/1 !
>>> bayer2rgb ! fbdevsink # works
>>>
>>> Maybe you have gotten further than this by now?
>>>
>>> If you are still having issues getting imx-media to register we can
>>> look at kernel configs. I believe the following are necessary:
>>> CONFIG_VIDEO_IMX219=y
>>> CONFIG_VIDEO_IMX_MIPI_CSIS=y
>>> CONFIG_VIDEO_IMX7_CSI=y
>>
>> I got this working back in February with Linux 6.2-rc8 and a few
>> additional patches (see [1]), but I haven't tried this anymore since then.
>>
>> In my notes I have the following commands to test the camera:
>>
>> media-ctl -d /dev/media0 -l "'imx219 1-0010':0 ->
>> 'csis-32e30000.mipi-csi':0[1]"
> 
> Hi Frieder,
> 
> Thank you - this helped me identify a typo in my link configuration.
> 
> My link configuration had an invalid argument in it which is why I was
> getting the  invalid argument:
> # media-ctl -l "'imx219 2-0010':0->'csis-32e30000.mipi-csi.0':0[1]"
> Unable to parse link: Invalid argument (22)
> ^^^ the entity name does not include the .0 pad
> 
> I believe this is the correct setup for imx219 on 6.5-rc1 with imx219
> for 640x480 raw8 bayer:
> media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
> media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
> media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480 field:none]"
> media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
> 
> I still can't get this to stream via gstreamer however:
> # gst-launch-1.0 v4l2src device=/dev/video0 !
> video/x-bayer,format=rggb,width=640,height=480,framerate=10/1 !
> bayer2rgb ! fbdevsink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> [  411.185357] imx7-csi 32e20000.csi: capture format not valid
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> ../sys/v4l2/gstv4l2src.c(759): gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:00.010357497
> Setting pipeline to NULL ...
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Internal data stream error.
> Additional debug info:
> ../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> streaming stopped, reason not-negotiated (-4)
> Freeing pipeline ...
> 
> I'm not sure if your notes show you how you captured/streamed data
> after the linux media pipeline configuration?

I have the following gstreamer commands in my notes I used for streaming
the raw data to a host machine via network and viewing it remotely:

Host:

gst-launch-1.0 udpsrc port=5000 ! application/x-rtp,encoding-name=X-GST
! queue ! rtpgstdepay ! bayer2rgb ! videoconvert ! autovideosink

Client:

gst-launch-1.0 v4l2src device=/dev/video0 !
'video/x-bayer,format=rggb,width=1920,height=1080' ! rtpgstpay ! queue !
udpsink host=192.168.1.10 port=5000

But as you are getting "imx7-csi 32e20000.csi: capture format not
valid", I would assume that there is something wrong with the format and
your gstreamer pipeline might be correct in general.

In contrast to my setup you are using fmt:SRGGB8 instead of
fmt:SRGGB8_1X8. No idea if this makes any difference...

Does streaming with v4l2-ctl work for you without errors? I used the
following for testing:

v4l2-ctl -d /dev/video0
--set-fmt-video=width=1920,height=1080,pixelformat=RG10 --stream-mmap

Best regards
Frieder
