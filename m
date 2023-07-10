Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD6674CF42
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 09:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjGJH6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 03:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbjGJH6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 03:58:03 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2120.outbound.protection.outlook.com [40.107.20.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE33120
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 00:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcalPU+BHy4Afc3j6ZEyI+Fl7uIg1MnBHZ+AdIqTITgSvaUXZqRpR3IQQxqNBV/ERL1dJZKme16H7hq3L37ylbwcyzXZNV03DwtZYyoMGsepBPd+o50XRlyUygdOk5K4PErxMZpcs6AnPT1TS7UagDqrILNiRvfMHF4RL7u1yTPYWd3wfIWem4wlZnkoWbbP6pc5zeufsQNFt4IYkrXjF9Za/SsqF/bMMl447Xl+ZJZIuRQUV03a0ermo98ezqiQV4Xj7gF6g10AcTuKFgcgH/IA19j7egvsvAAC2sMcchtgODQCkWBhXQnnwVf9IT7G1H+ifdhiMeqTiDhKaQneYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ3KfleDXmbxUBpnZmJMFc6co2zG7sEZegtuMSdjz3A=;
 b=cxOPtyGyyJX0Kp+whfdfhiyZ8DtM4pD6zuiOD7O6fgSmMKwlhYu+SDzbDdvPakisxnXuq2pLfx/+6P9j6XJeJLU5agbM2fJCZlJOXCJg2LyXkkt4x6CIAun+OatIgHWEGiM28440DzPX8JFWuPLIJ++depWk+2j23B358xgIF5XHp6jo29IIW68elLKaUSLHhEbi8jyDNG9boj5DgZV6F0Xamj5UdljMt2JDhK8gsRuosgMtE9dGJj1Jiq8b1gg/i1dA3II3A7wh0reUPMneb2VJr9v3PkU8NGFLAsTWzD4kLQk9qNKJbSv3kFhB/ajayRGbHScvoccrMANkY7UA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ3KfleDXmbxUBpnZmJMFc6co2zG7sEZegtuMSdjz3A=;
 b=Gez0iGIsVG+x9XAhHTu9K4rz1VX4Png/twzYh17wxof2odAnnTmAn82EjUSW2QvFGWFdJGvWsdiH6EWNVEmvdZWtkqygZkPdOSkjj3xzcJtPCrb9He1gYaYr15hP4DFt9DlbLGUQnbIuVE1dYqtb+9be2zady/ikENjGqL7tyD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB5654.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:318::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 07:57:59 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 07:57:59 +0000
Message-ID: <ace7d422-17de-49d8-dac0-a6e4d74d1232@kontron.de>
Date:   Mon, 10 Jul 2023 09:57:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Capture image from imx219 sensor on i.MX8MM
Content-Language: en-US, de-DE
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
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAJ+vNU2R7DKoUcebKBC9Y74v_6FEXAGK=8mYD-CpqRypVdnXfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b297d8-5b63-4261-ad2b-08db811b60cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PekMXy4xJcaJrDbT71M4c8UdL+NiASCFT4S+MCnZsp6SoSpnTlHhb/DxKUasieWuMIaNzLmcOjtB1otGUwt7CuoSH3xuzEdMV6GHLc7SX5853lMobKAqf5eEnWk59maVGIuH/oWymLOepzpnH0F27+1u/Ay1AWsBwMMBsO2WZTL1uoJrWEpdzBp5/FpRYvfYxsCIoQRiYM7TUjNOwLzNJC3iAPruxIgrvQxJEntQbKhjfirLWGoZbTvmgPB6ayTs0WuuZdjQHYIhCSgnhJXJglnywXxPH4tS2W4kSCce+o1wYXB6m64GWzS01EquJvbhhlsCfU6Y1Z5htcJoSiSb01oigS5jpjYF7vVYTWmMbttkFIdKN52UaGumJqWZ+/w+wMc0fErLSitSkB8T5ZAlfG0z/W42CiKFWNb65q/FliWfF4drjXvCxcGkXpL28+iVsw4mkJbNYdbj3QFKLKJP6TeJfZGrVd80ZaT6hkS/iXWqn2Mv0GoYfBCUcOoyP8KJTcWSwGz7wGHF3PsUr1bqiXZ13YmFdHXDfgIFlW20EzzgxtyY3SxrJMsn9avcI1HNjVomP5pV4IEj4dESglkc3oWyYPNNJH/B13wezwWH/QGIuugJxru2t6hE7gvcnVxg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(6486002)(54906003)(53546011)(26005)(6506007)(186003)(966005)(6512007)(2616005)(44832011)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(6916009)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0QxSmNmQlMzYXhiUVRnYTJmRHBrV0UyUy85cFhqYnRPNHdrQmpVY1NmVWZX?=
 =?utf-8?B?R0pMRjVFeVRaQ3Yza0ZxL2ZMUnN3MmpIK1FqZXdlTjZoUG0wMDZtSkh5RHVN?=
 =?utf-8?B?ZmFQVzRveFVjSVI0c2xCWVk3VThmcWN6NEhEaDE5R0hXeU9XVklySHNuZTVF?=
 =?utf-8?B?QWphY21CTmwyc0UyaWpyY05vWkl1UjlSeG9nc2lBMFRvNkl3UUtCM2FGaFNo?=
 =?utf-8?B?cXZXZ0FxdG5vMWQ1T3NVenJ5ajV0RTJEYnp5Wi9tSHdIN2ZFNjJHYmlUdGs3?=
 =?utf-8?B?QWJ1eVRjODZpZ1RyNFJVZU1EUVZFY2tsR2lzdEErUTdGVUM3eUJrVjVJd3hi?=
 =?utf-8?B?NVdjbXErVGMyb1hFeUhJaWs2U01SVnNnS25YclNPa0c4ZHpNR3RZUmF4YVBa?=
 =?utf-8?B?Wmo5aElVd1JSLzJGaHhocEtncE0wRU5jMXhxdVpkQUZwNkQvdThUeFJsYlA4?=
 =?utf-8?B?RG84eWpqd0Zuc0Q5d1M3MHd5WjU3Y0ZGUjU3RWVueisrU1pzd0FtMmExWmdD?=
 =?utf-8?B?UnU4N1hpcWllSm5KdGF5Rm1HNzFYNURJSWsvZUxEK3F3TktnVzlQeTRhRU5j?=
 =?utf-8?B?Z3VwdjI1ZVVTZkJYUTJDeDZKMmlZcUxIQU43c0svV2VpWUFGRG90aWF2SHFi?=
 =?utf-8?B?ZytiUWdmRHgvMGwyOXR1dlZheEdXcVBJMVNwYUpTOERkYXNPVE5CcEkveDRy?=
 =?utf-8?B?cUtQMnBjWnoyNnNYellDYjFqRmdqRjVZNllsYTBpVGNoSGdsdWRVMDRBNGow?=
 =?utf-8?B?K1UvQ01jMU91YjkzRncxczFCZnEwYUFzQ0cwRmlTeDhzbURNdnQvSTdqOXVR?=
 =?utf-8?B?OWt2OUNCVGkzMTRpSjA1S1hkblk5SFdmMGlJUm5rL2FwemVzS1dvUEcyVHI1?=
 =?utf-8?B?RlZxZUlpZVkyWklsV1RZZUFhTGRLZmIvaWwwemthMFJzbWxyaCt3M3NxTTNq?=
 =?utf-8?B?R05Uc0Y3Q3hXN0pPR0tpVS8zT1BZZEFaTDlPajVFczFuMzVzUWxLRDdxVk05?=
 =?utf-8?B?OG4zbTlOVUFxVUJRZ0hTTjEzM0RMQjIvcVRwV1F5NSt2bEtRS09iZnE4TkRN?=
 =?utf-8?B?K1JOdjBKTVJveDRYQWoybmhhRHo0VWJtVTc0TmpQNjdBN0Y5ZlpOZTN1UjBW?=
 =?utf-8?B?VmY0c04yUTJUWXhZd1FXS0R5K0thMXZrNk9uZWdialVGZE9EaUlIZmxqQjc5?=
 =?utf-8?B?c1hMb3I5cEZqT0pHcVBudjlIOVUwNlFpVUZNb09RS1RDUDFPRG1Ud0ZWeXBj?=
 =?utf-8?B?TjdvQzEyMDU3YlAyOUQ3K1NBS1F2VTk5S3g1SlVMTXI5U0taeVJRSmNkU2JR?=
 =?utf-8?B?R2ZYOWsrNXdQUUY1ck1EYjJnbjhVWFNQaU5wS05kak5zaHFqZW44bDNCUStF?=
 =?utf-8?B?aHoxcDgwRU0wMk5WVHNRYXp5ZjVqV2llMHJpUWxBcmdaOUowa2xkaW1QcHZJ?=
 =?utf-8?B?K21DZlhidEprdDRtU2s5QXRPUEE5WmVJTkl1R085d0U2Q21BOWt1dzRSbGVU?=
 =?utf-8?B?K1NQOU45SnU3aUgvYnJNQ0NXaHJKUXdtOXlJRFZHVjQxWFBraDl3ZjlwNmsr?=
 =?utf-8?B?R2x1WGxpSFFWRjd6WS9UVHZLZzM5M2FUNmR4M081NjZBQmhzejZoZHZVVTlI?=
 =?utf-8?B?azAwQ0QvNmlsZXRGQmxoSWw3enF3SzVDeWxmZzRDVENBcmtWMC81V09SWXpi?=
 =?utf-8?B?Mm9mQ09rL0hnTmkrazQ5QzZZL0UvbmExMnBMblJZTFZBTTNkN2xxNlppNFRF?=
 =?utf-8?B?WjhiWjNObnBzWW5wWlBpakJQSXQzVTkrdnYxaWVkOEg0ckNkY0dGNVVkdVlD?=
 =?utf-8?B?OHRuNmpVSHVIK0RFMk9Ka2NvbWRJbERQeDQ2bXBMZnkzS1Nib1hhcTBQbjcv?=
 =?utf-8?B?SVk5VmlsbEFoU1MwRVo0dmk5aGtMdTJGSkh5cFJCcCtEdGxyOGZsWTVONVRh?=
 =?utf-8?B?cFcyNk1Vcmw5bkd0aGI0RTBIWnR6Z2ZxZTFUdjdFTE5odWg3QmYzL0lOZ3A0?=
 =?utf-8?B?bmtibGI4SE1USXlNWUVSazd5V2pGcm9iWmhid2cxWWphZlF0VzA5cFp0YVVY?=
 =?utf-8?B?cnlzcS9Fb3V1WWpab3NiNXR4a3ZoSWpTSDFLQTFyeUh3QVhwVG9qYUdOR2NP?=
 =?utf-8?B?VDhxOW4yRjBMdndnaGdQMkVqUFZDaHlWL1lxcXRCTjFxRmoyQU5hQm9ITWFn?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b297d8-5b63-4261-ad2b-08db811b60cf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 07:57:59.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qb5kp7uXvF2ppu3vp9ixgJsHRiLhwp0dMKu44vGOwbsBEP4NZshP7vD5zNr/oIOM51R/6DZCQMnre1STADIgYQ2qcEWFlk04c3cx0w2m8ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5654
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

On 07.07.23 23:57, Tim Harvey wrote:
[...]
> 
> Frieder,
> 
> Where did you end up with this? I have imx219 capture working on
> imx8mm on a 5.15 kernel with lots of backports but have not managed to
> repeat it on a 6.4 kernel. I don't run into the issue you are running
> into (I have the imx-media device showing) but the media-ctl entities
> have changed since my 5.15 kernel and I can't figure out how to link
> them up and configure them with media-ctl.
> 
> On my imx8mm-venice-gw72xx with imx8mm-venice-gw72xx-0x-imx219.dtso I see:
> root@jammy-venice:~# cat /sys/bus/media/devices/media*/model
> imx-media
> hantro-vpu
> hantro-vpu
> root@jammy-venice:~# cat /sys/bus/media/devices/media0/model
> imx-media
> root@jammy-venice:~# media-ctl --device /dev/media0 -p
> Media controller API version 6.4.0
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info        platform:32e20000.csi
> hw revision     0x0
> driver version  6.4.0
> 
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: Sink
>                 <- "csi":1 [ENABLED,IMMUTABLE]
> 
> - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [fmt:UYVY8_1X16/640x480 field:none
> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 <- "imx219 2-0010":0 []
>         pad1: Source
>                 [fmt:UYVY8_1X16/640x480 field:none
> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 -> "csi":0 [ENABLED,IMMUTABLE]
> 
> - entity 15: imx219 2-0010 (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev2
>         pad0: Source
>                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range
>                  crop.bounds:(8,8)/3280x2464
>                  crop:(8,8)/3280x2464]
>                 -> "csis-32e30000.mipi-csi":0 []
> 
> When I try to link and configure the pipeline I run into issues I
> don't know how to resolve:
> root@jammy-venice:~# media-ctl --device /dev/media0 --reset
> root@jammy-venice:~# media-ctl --device /dev/media0 --links "'imx219
> 2-0010':0->'csis-32e30000.mipi-csi.0':0[1]"
> Unable to parse link: Invalid argument (22)
> ^^^ not sure why I can't link imx219 source pad with mipi-csi sink pad
> 
> What changed for me from my 5.15 kernel is the entities and pads
> above. My 5.15 kernel looks like this:
> root@jammy-venice:~# cat /sys/bus/media/devices/media2/model
> imx-media
> root@jammy-venice:~# media-ctl --device /dev/media2 -p
> Media controller API version 5.15.15
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info        platform:32e20000.csi
> hw revision     0x0
> driver version  5.15.15
> 
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video2
>         pad0: Sink
>                 <- "csi":1 [ENABLED,IMMUTABLE]
> 
> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [fmt:UYVY8_1X16/640x480 field:none
> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 <- "imx219 2-0010":0 []
>         pad1: Source
>                 [fmt:UYVY8_1X16/640x480 field:none
> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 -> "csi":0 [ENABLED,IMMUTABLE]
> 
> - entity 15: imx219 2-0010 (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev2
>         pad0: Source
>                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range
>                  crop.bounds:(8,8)/3280x2464
>                  crop:(8,8)/3280x2464]
>                 -> "imx7-mipi-csis.0":0 []
> # configure media controller links
> media-ctl --device /dev/media2 --reset
> # link the imx219 source pad (0) to the imx7-mipi-csis sink pad (0)
> media-ctl --device /dev/media2 --links "'imx219
> 2-0010':0->'imx7-mipi-csis.0':0[1]"
> # configure the imx219 source pad (0) for srgb 640x480
> media-ctl --device /dev/media2 -v -V "'imx219 2-0010':0
> [fmt:SRGGB8/640x480 field:none]"
> # configure the csi sink pad (0) for srgb 640x480
> media-ctl --device /dev/media2 -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
> # stream 640x480@30fps
> gst-launch-1.0 v4l2src device=/dev/video0 !
> video/x-bayer,format=rggb,width=640,height=480,framerate=10/1 !
> bayer2rgb ! fbdevsink # works
> 
> Maybe you have gotten further than this by now?
> 
> If you are still having issues getting imx-media to register we can
> look at kernel configs. I believe the following are necessary:
> CONFIG_VIDEO_IMX219=y
> CONFIG_VIDEO_IMX_MIPI_CSIS=y
> CONFIG_VIDEO_IMX7_CSI=y

I got this working back in February with Linux 6.2-rc8 and a few
additional patches (see [1]), but I haven't tried this anymore since then.

In my notes I have the following commands to test the camera:

media-ctl -d /dev/media0 -l "'imx219 1-0010':0 ->
'csis-32e30000.mipi-csi':0[1]"
media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/1920x1080
field:none]'
media-ctl -d /dev/media0 -V
'"csis-32e30000.mipi-csi":0[fmt:SRGGB8_1X8/1920x1080 field:none]'
media-ctl -d /dev/media0 -V '"csi":0[fmt:SRGGB8_1X8/1920x1080 field:none]'

v4l2-ctl -d /dev/video0
--set-fmt-video=width=1920,height=1080,pixelformat=RG10 --stream-mmap

I currently don't have the time to look at this any closer, but maybe
this already helps you in some way.

Best regards
Frieder

[1]
https://git.kontron-electronics.de/sw/misc/linux/-/commits/feature/v6.2-debug-csi
