Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F756696A2E
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 17:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjBNQrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 11:47:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjBNQrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 11:47:17 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2103.outbound.protection.outlook.com [40.107.15.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790E24203
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 08:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqqgN3uOJUvCHoq+szWwOIqJhMRf7/tGfSkXcZaLSONnsa3QhB8ufd3BvCF8RVQNaHaMU16zsRiLMccFkD0m0swEe1SP+aPPLVTMRDxdXP27ZDXae4ckr3/h8icaabNqpbwPJN9vfBcgOWhKpKq+YhCUTz2x/jCXo3NdsVpF2KftUndx6u8w973zat18MkMHKL9EbN9XqYr8/g2uPGD2K6C0I29yFE2wYasTRtpuwi+eTrnXeNxG3oKp/xS+j7yakd7ceK0SnggGRr3RmybU/HcZwZVr8JX0qiSwRXIwIhvTzTh2Ocz9lZkq787gIxuYeW21+7KgPnPxQZ7LsO6g1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bKhxj/I/rkOVzKb00xohjTofQ05/BzYXg/7OY0Q4uc=;
 b=hr/dIcCHoRqGK4BZuJ+MiCkKgUrMLhdMWIk3pLcMSLpMPkFlJh6gkPWA5CYg5tbOplP3pf83y7OjSfvP9jUt3r7/ceuj/92CZybf2t7btnd8Mv5xaLuCnf+bwW6iRKg0W2UqUhdqafP21PnQiwkRwYMZRRhU9N27p7ZhNvNDFtleq2n6SMjSaJ/EeuLUUc2tzuKOxZ9sn4PaBn7lNYjbmabXrEOlCip2UJokx3kqhWCUFh+dDnrF8xvp1UnMpgMi7G1fQIkCFMn0T/vrSBDCPMiwNMzR7ytLvI0ztyhM1x/9SedJlIVXpL3rZuKw35aJ7VLsMfD63HdZOxYYTdleWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bKhxj/I/rkOVzKb00xohjTofQ05/BzYXg/7OY0Q4uc=;
 b=GB+Hod7orDRMMZnxEesD4QxU/F544HaTidRFGZSJjSn3+9bKI3E2ct+gVQ3NRgztq/+WD27TMzsXVL+RJgB9BuPXSW73V6J7TL/9b48v++ezW3mVYCwSUD48qMCUwabB9kOuZNOI0Lf/RQaCg7ybTJqbHIOqAAl9RNURqTWsiN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS1PR10MB5167.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:47:10 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:47:10 +0000
Message-ID: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
Date:   Tue, 14 Feb 2023 17:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: NULL pointer dereference in imx-mipi-csis driver when starting stream
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS1PR10MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: cdfbadc7-36ee-4fe5-5dcc-08db0eab1d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ehH4uMhU3iAxpfhSnDI4TT1SExAxB11VQTGS+r48Ghl6BxS9Rp6nTtqyoG1ntap0qRvT1wl5zLctHHaVZiJx3vLaqV53hQ4MeS0KNVrr3jLaC5xFCl66PpHqO4+3i2yVwZqDMFfN1xq0TtLnMAQ7pmaHV2gi18HkS1D4x6ehPalfVgcfEijEQmd1KRImLiYKgngxuwxk1K9AHj3f9EQFOwzKEM+GcfTZzESQFWLgaN3xuBYr4D6iRBsr4as9sVX8F31LBzYPS+sMGallYkO3C5Wvw1zse30DDqyR9eYsNB4+oMtH37x6L37Q+9d/tQA4ZGAWWVM36lVk7zc160LO39gyPFDNTg6ZtIgHOpXqE7QKvTITXjKbY91VPSWPJA74jDASRMjuIRzDkg2yJTmfYBu3Z5PhGNfomziFgTQLDDohCBi5qQvaOYqyeW3e/4tiMvOeJzH8+evBGfEGLylLoghCByX+JYMlvWdXJrjLt6/A2jIQh0JQ9GWpnVK1zh4xB3sPTNKHwIhDjYA3FfY7Q09eORC7ifb3H4JvSospAzXG6NRTsAoOJJIJwdZTZ6PyonM+gDh6UDDaGcqgQTUlMfHI6o74Wa6FoXixLJdQB5Yu2dEteyU0cA6+GfDznXaiTzi8jNI/yeZ6QSwdtBFCkMcXIseJsXtcrrp1oznCTp/8xF1SUAIDKQulPV40R7GvIeueu2AmsvU833mqbF7tIymbm6KC0FUSLTPdJt2ydZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(8936002)(5660300002)(36756003)(86362001)(41300700001)(31696002)(38100700002)(44832011)(2906002)(478600001)(6486002)(2616005)(45080400002)(186003)(6512007)(31686004)(6506007)(6666004)(316002)(66476007)(66556008)(4326008)(8676002)(110136005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJnRmpUdnV3V1I3RDBlVlZLaS9CalpqZ09xeXFKTTd0RGJ5Rmx2TU04MWdP?=
 =?utf-8?B?a1Rrd21rZEE2R011RVh2eDIzUmR2c3pla2RjcFFyODZOd0FDRXFRMWMrNzcz?=
 =?utf-8?B?TTh3TllNWXZRakU4aHNhbE82WEdtR1RRbkJHNFppL3dlWFFNeXdUbTZqV3hP?=
 =?utf-8?B?RStLZURlYlVpWk9oZGVQR0d6YjRLSWhpQVpiQThvWTBJRTJsdGZVVHQ3T3BL?=
 =?utf-8?B?Yi9SVlhFaVlaVlVSWmVaR1NKNzFENVgwdnJvUGNvNGg3WklxcXdiSEdya0x5?=
 =?utf-8?B?YXp5OGp1RDNHRVZQOVY4RGMxekM3VkVhUW02dTBZWlB3TlM0Z0M2bERBUEdq?=
 =?utf-8?B?ZEVlSXpWdHJrQ0VQMCtqQ3krWFNPSFNIQmdhZ1lvbGs1clBONEF5ckk5Z2Vi?=
 =?utf-8?B?VHRmZUw2WncyemFWUjQyeEhIcXFBenZCa28rc0NEU0N0eGtmNzhIUHBWcDdR?=
 =?utf-8?B?bHMxenkzeFN6V2IvWHovZEtsMExxVS8zbkJMU2crSEdhZUhWRWM4N2FLZGVw?=
 =?utf-8?B?R3FJbzdLTkVGUWFyNTc1dGFJVnJqdDNTYXQ0dU9OdXIwdFFHMWdkOFUzaGJL?=
 =?utf-8?B?SThyYVZDV2FaMkVmVmZiaUdLZHlJaU5NLzF4R1ZVN3BqM1J1Y2x6M0ZxNTdL?=
 =?utf-8?B?UUYxdTZkV2kwM1E2Q2wvK2VzUjcxaXE3N1Y5WFAzdkJMQzdzUnJOT3RzL2lJ?=
 =?utf-8?B?ZzIwLzJmYmlkYkZ2bnlzMmFjbGo5UlhtTURqdGtjT0IyS09uUHBJM2N0U21s?=
 =?utf-8?B?ZWVDWDRadmhsVlpjNnliU1E1b0JuNEt5dUJiZVZ4OXlCODk3cnZuRkQ1Yk5s?=
 =?utf-8?B?V0hodm0rUjd3NEVYWWx2S21xZDltdlNqTWwveFladE8zRk54Vi9TMExobTZC?=
 =?utf-8?B?ZGM4a1JHeWFwT0U5YlRXZDdkNDd5MXphRG9DT0wvTnhKNnlpM2d4eEtwM2Y1?=
 =?utf-8?B?UGZZaWJNK0hXendDRXlqUDVUOElYeUN2VGZkakxlVDNkSXNaazFQRXpxYVVx?=
 =?utf-8?B?Mm53aWg5L1RVNmhFcHUxUDNGL2NSZnd2ZEN2R1M4eTByRzNNZ0daYlhFU1NI?=
 =?utf-8?B?SlZCM25YRVJyN0NuRkZGYWp5N3d2UlVaRVRTeURLdndxZ1dDWndGQ3Z3a1pa?=
 =?utf-8?B?U2ptNFY5d0ZPOEZKM1dlVFV0eVZCUFd4NVo3bk81L1p0Y0gzWGp2dnhnY2gv?=
 =?utf-8?B?Qy82NDBEK1NIYUVRUTdIT29FMWxtTHEyam1DbGVPQWhsRTQwV1hSeFpYN3hC?=
 =?utf-8?B?QTltcUNvUDJtcmpnT0JXK2J4RVkzcGRNNmoyNTNUcE1CTEJKNHB3a0xFeTdk?=
 =?utf-8?B?b3ZWMkNoY0VCdGlHQ0dFWkUvQTlVS0M5bDlFTmRvNmFId1hwTm5wMG1BWmdB?=
 =?utf-8?B?aHNnejR3REluS0ovTmJMTHE2Y1lwQTg4dTNOZ0VCOW1MWkptM2htK2k3aW1u?=
 =?utf-8?B?UTIwVjBmdXNacURZbDR1cVlraS9TUXhPb0hxT3V2dWI0NStpNzVpaTdjMGNW?=
 =?utf-8?B?OWkxZEhxZVFiZU0wUmlzTVVkRmxDRmZrU0xXMEhpUVJ1eUhlbTJ3a2g0ZytH?=
 =?utf-8?B?a2E4cGhIT2FKTGRaa2FnWHpjMjNkcXJsREE4WEY5S2puNE5jSVZXT3R3WTVY?=
 =?utf-8?B?bnZzL21qd1huSUVTVVg2aDFEVjFuNE5lYW1QaXA4K3Q0bGM1UTZwTDdRaGUz?=
 =?utf-8?B?emhJSitsQ21EREJyUk5XWHlUb2swR3Z3bUlwcVBRZFNUK056UTlvYlZlUVBC?=
 =?utf-8?B?eEt2N3h1blhhMmY4cmJjZTdzdmFXdlZ2dnJWUTl5ZHh5WUVRY2VCbCt2VUp2?=
 =?utf-8?B?aGVidWN4c05vZVJtejROWk1MNVpOeWgybHFiWURBMXR3RFNPUTBmR3pnUFE5?=
 =?utf-8?B?WEdWc1I2dmFGMHV1cVA1MGlRWkRjejh6TUVML1p5QzU5SXowcCtaelUzRytC?=
 =?utf-8?B?QmtseHFCcFQvK2dnWDBYMXdyTjdneGdlSnUweW5TUFRsMlNtVDJiSmN1UUtG?=
 =?utf-8?B?QVkxZDlrR1lObHBlZXBCREFkTUczTWY4alZpVWdrYU5NZ0N1RWdTSHdOU0I4?=
 =?utf-8?B?SXlWRTI3bEdMa2NjeHhpaEoweWdCSlc4azRueWZsZnphTFh6QnJQRERDUk41?=
 =?utf-8?B?dDZQSndJOFRWMUsrcFZ0dEg0M3hKQTd6YjM3blZUM29YWUhsYk5YU0NaeTBa?=
 =?utf-8?Q?GpSD7vYsU4jbgkvniwR+qBkZKfkjCIVQeyUKgs/1l91V?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfbadc7-36ee-4fe5-5dcc-08db0eab1d75
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:47:10.0590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zqMsGKG5u6zOoMbno5kXZI3NC60ClAWDDaW55kdq1YBgl/oq7vpUPh4rLoD/6ndBSQB25fm1utqF28EKI2nu1mqFL/LkHfbR2Lg46kbJc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5167
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

after solving the previous devicetree and driver issues with the media
pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
now try to get an image from the sensor and run into the next problem.

Below you can find the commands I use and the output I'm getting. Maybe
someone can see straight away what's wrong or at least can make a guess
before I start diving into the code. ;)

By the way: This happens on v6.1.11 and 6.2-rc8.

Thanks
Frieder

###

I'm setting up the pipeline like this:

media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SBGGR10_1X10/640x480
field:none]'
media-ctl -d /dev/media0 -V
'"csis-32e30000.mipi-csi":0[fmt:SBGGR10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"csi":0[fmt:SBGGR10_1X10/640x480 field:none]'

This is how "media-ctl -p" looks like afterwards:

Media controller API version 6.2.0

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial
bus info        platform:32e20000.csi
hw revision     0x0
driver version  6.2.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:SBGGR10_1X10/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range]
                <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [fmt:SBGGR10_1X10/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range]
                -> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: Sink
                <- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
        pad0: Sink
                [fmt:SBGGR10_1X10/640x480 field:none]
                <- "imx219 1-0010":0 []
        pad1: Source
                [fmt:SBGGR10_1X10/640x480 field:none]
                -> "csi":0 [ENABLED,IMMUTABLE]

- entity 15: imx219 1-0010 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
        pad0: Source
                [fmt:SRGGB10_1X10/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range
                 crop.bounds:(8,8)/3280x2464
                 crop:(1008,760)/1280x960]
                -> "csis-32e30000.mipi-csi":0 []

Then I try to start a stream using:

v4l2-ctl -d /dev/video0
--set-fmt-video=width=640,height=480,pixelformat=RG10 --stream-mmap

and run into this NULL pointer dereference error:

Unable to handle kernel NULL pointer dereference at virtual address
00000000000000b0
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=00000001039d2000
[00000000000000b0] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in: bluetooth ecdh_generic ecc rfkill ipv6 smsc smsc95xx
usbnet crct10dif_ce imx_sdma
CPU: 1 PID: 539 Comm: v4l2-ctl Not tainted 6.2.0-rc8-ktn #1
Hardware name: Kontron BL i.MX8MM (N801X S) (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : mipi_csis_s_stream+0x28/0x500
lr : call_s_stream+0x28/0x64
sp : ffff80000a6bb9c0
x29: ffff80000a6bb9c0 x28: ffff0000c4618800 x27: 0000000000000001
x26: ffff0000c0e459d0 x25: ffff0000c0e45a80 x24: ffff0000c0e459e8
x23: 0000000000000001 x22: ffff0000c0e450a0 x21: ffff0000c0e459e0
x20: ffff0000c0fe18b0 x19: ffff0000c0fe1880 x18: ffff0000ff7c2e80
x17: 0000000000000040 x16: fffffc0002a17008 x15: 0000000000000100
x14: 0000000000000001 x13: 00000000f0000080 x12: ffff0000ff7b1cd0
x11: ffff0000ff7b1b00 x10: 0000000000000000 x9 : 0000000000000000
x8 : ffff80000abc2000 x7 : 0000000000000000 x6 : ffff0000c4619408
x5 : ffff0000c0e459d0 x4 : 0000000000000000 x3 : ffff800008a1ba60
x2 : ffff800008a4c680 x1 : ffff800008eb36f0 x0 : 0000000000000000
Call trace:
 mipi_csis_s_stream+0x28/0x500
 call_s_stream+0x28/0x64
 imx7_csi_s_stream+0x464/0x830
 call_s_stream+0x28/0x64
 imx7_csi_video_start_streaming+0x150/0x2b0
 vb2_start_streaming+0x7c/0x1c0
 vb2_core_streamon+0xf0/0x260
 vb2_ioctl_streamon+0x5c/0xb0
 v4l_streamon+0x24/0x30
 __video_do_ioctl+0x184/0x3d0
 video_usercopy+0x20c/0x644
 video_ioctl2+0x18/0x2c
 v4l2_ioctl+0x40/0x60
 __arm64_sys_ioctl+0xa8/0xf0
 invoke_syscall+0x48/0x114
 el0_svc_common.constprop.0+0x44/0xfc
 do_el0_svc+0x3c/0xc0
 el0_svc+0x2c/0x84
 el0t_64_sync_handler+0xbc/0x140
 el0t_64_sync+0x190/0x194
Code: a9025bf5 34001921 f9412e60 f9415661 (f9405800)
---[ end trace 0000000000000000 ]---
