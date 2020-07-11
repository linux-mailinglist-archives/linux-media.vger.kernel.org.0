Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32BB21C557
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 18:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgGKQoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 12:44:02 -0400
Received: from mail-dm6nam12olkn2026.outbound.protection.outlook.com ([40.92.22.26]:56929
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728412AbgGKQoC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 12:44:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsBQdnDDfy+8jAczhw0HwlH4jTl18CD+kYFk3Y7c3brcfCkcOhJWzEbb/QPaKKsmKS7BjUzah05cH0SIASl9QLTZXTVuX1oPQBgwj6uCkphjSpsWtjO7gsJvKgwzxhPZn4wUwgPnVhLO8ZhCNuFVXC3f7QxwLUpJidnNLsS9tEa3IMdq7l2i7hZCWPphmABDz48dj53dXGEIPm0ejpkjAavJcHsFcNTzjNaBQ6WwzqYGWQwDENfjjgU1M0GUUmMHGDgkxKcTcK+QAMI47gX+OgbdyM4XmJBV+3vhnj/tRAOEL8DiqfbgWvSWKUrNXIclFkVxmEMqbw9OvW5/mDAD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTmij94eek59fgduBQkHKe/UgoVNAM3onvQ8nD+PHL4=;
 b=Wq1ahGKWvAgwm48AGwucfNacWva1GL/+JhEyeZKvwYhWhFZRLIoag4HryULGdxPeunJ8sFrBdUFEYF1/2Z9t5grOamZXmMwp4acWNHtUntHz9xeOmTOCa+1Wuy7HZyW4UrmyuIPe6ZlZU0vm1ITJ7c/bkmmOUqWixLK0ivT/JBSDga2HoF9xhLVxiqHt+G96K6WqtKpcAKfQFksh92u7m+mu4A+VggQwOEE7zGy09azj55B0lCCy8Oys7hQ5hpeyhKuZ61vKnGbYFnL1LQbu/JfqmZned5aDZv4EAHHwiZ45E91CQGP9JRuxRZlUX3imt4v4LrzZjz7/e7Jqq0iS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM12FT016.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::52) by
 DM6NAM12HT046.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::296)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9; Sat, 11 Jul
 2020 16:44:00 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc64::41) by DM6NAM12FT016.mail.protection.outlook.com
 (2a01:111:e400:fc64::217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend
 Transport; Sat, 11 Jul 2020 16:44:00 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1F7FE254158FF7041F46C77E2D743D54D4FA62F97AE2A933A120F5AA0FFE7F0B;UpperCasedChecksum:DAAAEE8CACCF18D83EB1A43A59F8175A968B0225403E6F9F100903B601580436;SizeAsReceived:9356;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3174.024; Sat, 11 Jul 2020
 16:43:59 +0000
Subject: Re: [PATCH 06/11] media: exynos4-is: Properly set JPEG options when
 not using CSIS
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB06606F63C7ACE765B57331A1A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <CGME20200707182328eucas1p284f1ed2d1d10a67c88e15ce01653885b@eucas1p2.samsung.com>
 <20200707182322.GF2621465@chromium.org>
 <e60ff1bb-730a-11b5-f870-61a4f24f6195@samsung.com>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB06601BC74285644C47ED8BB6A3620@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Sat, 11 Jul 2020 09:43:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <e60ff1bb-730a-11b5-f870-61a4f24f6195@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:104:5::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <bf04402a-585f-d3dc-2b6c-20df880c7aa2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by CO2PR04CA0182.namprd04.prod.outlook.com (2603:10b6:104:5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sat, 11 Jul 2020 16:43:58 +0000
X-Microsoft-Original-Message-ID: <bf04402a-585f-d3dc-2b6c-20df880c7aa2@live.ca>
X-TMN:  [fVBN6pxicS4rIrGkrOboUZt5rl/gU82bNWDS4yhff4liQRmUYSa8/T4ikNUmMUkJ]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 23a15fd9-e9f7-4522-d469-08d825b99c67
X-MS-TrafficTypeDiagnostic: DM6NAM12HT046:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BSMt8KzORylzIm9rSjSeS2fpW8kjOGOAt+LRdAqb9LPoeOXlaQ/4iZsXCOT4WjZHjN4V7mAKHmIHdmlZNZPFIqqDWeNIbOuE40r3sOfOeB/FqoTCFEI8UaVUUJKuSo3vu3w1dqmA/1HeSvjPfNaea/lfLhdG4h9cEnsj15ef4obQ1VPZfwXccjShL4knmaP/O+QDfi4Qpq3lgrDNZdT1eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: iwhLRJYl3j+wXsDGYL0xp26nPqCmCoz6APg4EhJpng1vZbGPYxi2tB+h6lA0Gkhj+Sh81Sm+hV5n1CEqzYfv49C6X46kR0EAWOQJqnAf+Kb1Pdse8F9ea2z5tNGUqLJ5Sn9RdZHzZ8hoV8/yOk9sRi2A2yBBoStnBFB9Ntx2hnxojbLVFuEtpb+UBLAIzaoFSh/+UtnS/tRwPdUJudYzMQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a15fd9-e9f7-4522-d469-08d825b99c67
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 16:43:59.9341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT016.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT046
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sylwester and Tomasz,

On 2020-07-08 8:45 a.m., Sylwester Nawrocki wrote:
> Hi,
> 
> On 07.07.2020 20:23, Tomasz Figa wrote:
>> On Sat, Apr 25, 2020 at 07:26:45PM -0700, Jonathan Bakker wrote:
>>> Commit ee7160e57c98 ("[media] s5p-fimc: Add support for JPEG capture")
>>> added support for JPEG capture, but missed setting a register when the
>>> CSIS device wasn't in use.
> 
>> nit: Since this isn't really about using the CSIS device or not, but
>> rather about the interface that the sensor is connected with, could we
>> instead say "when a parallel interface is used"?

Yes, that's a better way of stating it.  I'll reword the commit message.

> 
>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>> ---
>>>  drivers/media/platform/exynos4-is/fimc-reg.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/exynos4-is/fimc-reg.c b/drivers/media/platform/exynos4-is/fimc-reg.c
>>> index 5ce2bdebd424..269a98fca1e8 100644
>>> --- a/drivers/media/platform/exynos4-is/fimc-reg.c
>>> +++ b/drivers/media/platform/exynos4-is/fimc-reg.c
>>> @@ -606,6 +606,11 @@ int fimc_hw_set_camera_source(struct fimc_dev *fimc,
>>>  	switch (source->fimc_bus_type) {
>>>  	case FIMC_BUS_TYPE_ITU_601:
>>>  	case FIMC_BUS_TYPE_ITU_656:
>>> +		if (fimc_fmt_is_user_defined(f->fmt->color)) {
>>> +			cfg |= FIMC_REG_CISRCFMT_ITU601_8BIT;
>>> +			break;
>>> +		}
>>> +
>>>  		for (i = 0; i < ARRAY_SIZE(pix_desc); i++) {
>>>  			if (vc->ci_fmt.code == pix_desc[i].pixelcode) {
>>>  				cfg = pix_desc[i].cisrcfmt;
>>> @@ -707,6 +712,8 @@ int fimc_hw_set_camera_type(struct fimc_dev *fimc,
>>>  	case FIMC_BUS_TYPE_ITU_601...FIMC_BUS_TYPE_ITU_656:
>>>  		if (source->mux_id == 0) /* ITU-A, ITU-B: 0, 1 */
>>>  			cfg |= FIMC_REG_CIGCTRL_SELCAM_ITU_A;
>>> +		if (vid_cap->ci_fmt.code == MEDIA_BUS_FMT_JPEG_1X8)
>>> +			cfg |= FIMC_REG_CIGCTRL_CAM_JPEG;
>>
>> Should we also handle MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8 as in the CSI
>> case? The S5C73M3 sensor supports the parallel interface as well.
> 
> The parallel interface has too low bandwidth to transfer image data
> with the maximum supported resolution and frame rate, I doubt anyone would
> ever use S5C73MC in such a configuration.
> 

Ok, good to know.  I'll leave it as-is then.

Thanks,
Jonathan
