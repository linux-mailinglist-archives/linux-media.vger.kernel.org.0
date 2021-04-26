Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2CB36AF6D
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 10:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhDZIHg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 04:07:36 -0400
Received: from mail-vi1eur05on2118.outbound.protection.outlook.com ([40.107.21.118]:23862
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232068AbhDZIHg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 04:07:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtcd7YsE13XZ0BxgTC/KJMaqRN01Vxko9sIroxPYk5kVBPF2Ja6zIzJEhjg4Ie5johq2eAJcmA4tz3xw38ZLRh3fg4lNfqX0Q4ndhvmKc6quJpIAWKztKtnEC/VQRFNXIdL1AZGC+tErCRekRer4C5Escg8qh+AEemBew7ZZYFwiecWgu/J0xsZkX6ivWr1lOu9rMVDikN+K8g/raQGOYz6ve5GeH4OtiAOnggSqSLA9BB6IInHXadMfcMLQXO/0alckmrofcUd1/rXj2409BwSYTMycw0i6opViy4vhRz3Uo7n3XA26d1TgTsZgboEi2xEu4gIUnSHdx0W2teTE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7rgQVvSKx/DLrwzedrlN37sMCcNy1RaMQtwECVP9Bg=;
 b=BU/4fewpEBNWR/Tzfsnefc/ztCILqLFZIxLkci8cMrUoJ0aasMujWqLmDuor8hWR2NY4vMqiiyFJVTJ8ko38aX6hTcYB9pukiKi9+hDRV3c9A0suScie5GMCu5TV4P8cJscr73kGA8SFpeYBsKQJBbkH33hqUBNaVqTp7/HnEx/ElF2n623MnznWlmHcT1nK8Ge9UkkKK12Fz/9lNqyl4IFZ369MK4WWtjFtOG/BtUNx/chMk0jwE8omACUMgm+gNBpfCBbUgCFMI7dJxmwKuswF8o/STTZdHTlkLre6Pvov8139IR8o5If931n/ded0cqeMVBn8IqvC4s2KrhlIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7rgQVvSKx/DLrwzedrlN37sMCcNy1RaMQtwECVP9Bg=;
 b=CdHEiiZ764B6JjbHGzVsykZrU6y9kH8OmCiwEFpnoJTCm6QMpyUPNueQ+S7idaZQvF0uK+zsAaVQDgO8giIyX4OyZl4vhJ/um6mSJQxrLeY4uS+3Ox2WvILc8oawOoqCIbeeG1d0pdXPr+PN6MxCwpgUqvdRKCLFCZ63aUrunDA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4674.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:368::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 08:06:53 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 08:06:53 +0000
Subject: Re: [PATCH v2 00/77] media: imx: Miscellaneous fixes and cleanups for
 i.MX7
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <268621a5-03ab-4cd9-d95a-bf5b6a4b4f7b@kontron.de>
 <YFP+GH+3sS0cdd2R@pendragon.ideasonboard.com>
 <ed2480a0-7950-64d2-6490-d2d7dab1bbfe@kontron.de>
 <71888be2-faf3-f4c2-5cac-2a39acbeba81@kontron.de>
Message-ID: <5a600024-b5e9-e57f-f2c9-d75520666163@kontron.de>
Date:   Mon, 26 Apr 2021 10:06:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <71888be2-faf3-f4c2-5cac-2a39acbeba81@kontron.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [88.130.73.114]
X-ClientProxiedBy: AM6PR08CA0037.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::25) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (88.130.73.114) by AM6PR08CA0037.eurprd08.prod.outlook.com (2603:10a6:20b:c0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 08:06:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21b18c97-21a9-429f-cc0c-08d9088a4061
X-MS-TrafficTypeDiagnostic: AM8PR10MB4674:
X-Microsoft-Antispam-PRVS: <AM8PR10MB4674299544BDBE766FB9654BE9429@AM8PR10MB4674.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IslZvu5smXq1EbNISuzPXw8ElHljKHZ3eFFMb5LKBi8gQVn+AmZeqc3wOSA35fxmSDHInbMMsMdGHcXEP3V74T6wNe8FDGgHpxg4UsPKBDqSqtm1f1VBqQCvQYuXYFB8hkZn9O45FXuWgSBuSjxP8/MsbLjGF87wp9Oi4kUkMaCpVmtI0dBt+KgB0Waz8Gw5ubjj+7PcVOgyEe4P11CF3vqI3jWJkZBNeQ79IChfZ+Ub8FJ/00ySp+DeWGYJ0v6Yjv0UKI5stiVPXpIrZjzOLw9H9vkDTzp2w8Oz2jnuCqsQ8HbfN3sy+oqQ3e8WA1uZi6ouW4Dk8fvMSa6eeTiVsw4qMFrrAkM4UocnbSg7F7KS7Cv3ESIdJv9r2OZwsEEYrJ06fe2uDyy4+JCjUadEaILABa8j2hSsmwm/kqLrPFubLW6f5F3dlk9VqbTStpXUvbWDAdODO6L3YRwDRlxtc/PzCp3WXbpPJN2U6oJ/UugAHYZru+vu0/OsmH/ioGBURpL58qnLqwZcy1UW2UY+GIhQuEbJXJkDUQ0IumYZpnolRa8xQYmsi1qKboDe62N8Sp1w0j/k2MVWV2F1jkBypWa9DU/Ry6G5szoc9bIKN0fMCK/Y4iGmCtz1IYm1i792k1gSZUb/3RxGrm5glrQ76vxAITxUsJNaGwWUvKbMGYoFrWIJ0++lyEe2zR3u9HGkJ9hSq47aJNKviRxFLBG+9aY4yYFafWKPyNMbrHBpdudsILPJsJNyRD7pVuJuLXVGr5+c3zjscFi7nDHTfkdIUeu3HGB3P0xV29/VzkCnZiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(316002)(31686004)(16576012)(956004)(5660300002)(66946007)(54906003)(38100700002)(53546011)(86362001)(6916009)(44832011)(2906002)(8676002)(26005)(966005)(4326008)(38350700002)(186003)(83380400001)(8936002)(52116002)(66556008)(66476007)(16526019)(2616005)(31696002)(36756003)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkNySEU4eHdaU1dTUnBXdk1CSmxReHpCb0o2dXhhQ0FnalRSNVFGYmRWK3Yx?=
 =?utf-8?B?Z2V0RlJTL0l6UWJSdEtJZmxvcFJmbW1sRlRYdkw2b0R4REhTelEyQWJzcWVD?=
 =?utf-8?B?ejhsZU9nMDRDR2lLT2hyNWNkaFJHVXlZMFU2bm9vU1NQa3ZuSTZ4S2RiTk1G?=
 =?utf-8?B?bUszcVVEanhGMUxpcS9QQ2NjTkNSRlJkZmpleUh0N3gyT3JDdVV0NmhHVUdi?=
 =?utf-8?B?NG5VQWkxK1FGeWVDYVVQWnhBRHd6MXV0bnRVdEVCcDhYcUZLc2hGcW1KdWor?=
 =?utf-8?B?T3pNRWV0Z1N3Y0JRa2g3Y1NXcFh5dUdoRHkvYndva2JlTEY2dmZaNHo2NXpP?=
 =?utf-8?B?Y3FZcmw2aW5MdkdkUEdld0xkbjJ6MWZhanJ2ZGdmNUhSZEtXdEZlZzNhYTls?=
 =?utf-8?B?TTREWlpuOWh5cjNwaTVHcW9vZ24rUWtoYmNQeXBQTkpKd3BzUE8xdDd1SGIr?=
 =?utf-8?B?TklXYWZNUEdoK0ZTT0dzOE84VUxrenZNKzI1T0lsRTZVRVp1b0VPbXRuZkM4?=
 =?utf-8?B?QlNMc0dTelVyWEFSS2YyTFBVd20zQ1JxeUFDVi85VVQxZ1JBWGF3cFhWamcr?=
 =?utf-8?B?czJLNmJMUllSVFJqMndxSTRzZERNTHpndlVpdWx5T1FaZ3RmYWhVc045N2FM?=
 =?utf-8?B?bnlNZWFmVnBhSVJWTm5zc2JkbitWaE9GbjNHVW5ZMmdiRGE4emVhaXpHek5u?=
 =?utf-8?B?dUwwL1IwWWtmQ3dXa2ZhTWJGMEJMUHV1T05nVDVOT1BHMjY1U0EyaHdQZFJo?=
 =?utf-8?B?RkZSTUV3OWJ1NllJL21mVmNoUXRscEc5QzRVckxKM2ZXWEgwL0JLRlhSY0Z0?=
 =?utf-8?B?bkpZS01VbERVZ2Vza3dtUFdVbXA1WDBMbGFJY2dpL0hyK0RqOGVYMjN2cTR4?=
 =?utf-8?B?OSszMlVZa0t6WG15Kyt6ZmRTN1FDQzUzZ3JDT1FpVHF5c3NBWmphTkIrdnJP?=
 =?utf-8?B?YkpKUnJteU42TUw3ZTVORlovOGdFSFVDR1FJZC9iMExIampmN3dkMWxQYVIw?=
 =?utf-8?B?OG84dDlYYm8rSVRBT3NtbjRwOE92bmlKOFpUY1dXZzFLL0Zhd1hvbjVzRTJv?=
 =?utf-8?B?OHJOUkRMRUpNWlBRK2dPZ3ZZeUlhV0lPM0lmZkt2cE1ucnFia2lIN3NNV1hh?=
 =?utf-8?B?Z2QwamJBTXkvYVplakNHb2JqSFRSUVNGZmMzQ3dvZ3JSVFAyZ2wvT1VKakdn?=
 =?utf-8?B?ZUF0MW4vSTNqbmpxc0JuSUQvZDl4bmpXVm9tUFh4TGNad1hpNFNlakUzZmo1?=
 =?utf-8?B?eU00a051czE5cm9jOHgwWW1mQjlmVmtoNS9CM0RSUG5lUUNMS0NVdE56SnVl?=
 =?utf-8?B?cUNGS0FkYU5WdExZTGxpb0M4SW1QSE9tUU1lRWRMTUdCcklaWW9vSGFzc2xw?=
 =?utf-8?B?YXNISmZjWisybkJhTlNmMmh5NU45Tkw2UUVQNWM4a0ZiVk42N2U0VzQrSllo?=
 =?utf-8?B?Z0VnNkhQWjMwYUhaWmZHUG92ZW9Rcmhia212YjAvQUl0RGNKR2xNM1d3U2Jm?=
 =?utf-8?B?cnFsdWNuYmZnOHFLOEdqWjRkV1RidHVaRS9mUFRxSEh0SnQvMkRrOGJ3U0dY?=
 =?utf-8?B?dGZHcUpVVmFCejhvTi9DZkFPVkFhanphRGZMZlJuOE9wU2p3TFRSWFo3emtU?=
 =?utf-8?B?a25DcFRVc1ZBMWFBT2pXWnNHZk5TWTVjLzBGUFFiVnNhaHlEQ1E3eklicmRR?=
 =?utf-8?B?UFhjNmx3c0VqSVcvTDV4UWpVY3RaY2JFZ0lqMWdkcHBrK0pDc3pzZlI3Mmd1?=
 =?utf-8?Q?OB2qEB6fzy2F1wHUb/H7mT1ES6RQkytssvNGzpb?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b18c97-21a9-429f-cc0c-08d9088a4061
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 08:06:52.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4xDzIr8w2ipgDbcDYlcjNLWEO+JYbPFs71pRXrXMKGplUa4970OK0SkqypCargrvMAIqarTkMcsXyUZh46Pe308lEwPAncqv4sREoCNero=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4674
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.04.21 18:04, Frieder Schrempf wrote:
> On 15.04.21 11:00, Frieder Schrempf wrote:
>> Hi Laurent,
>>
>> On 19.03.21 02:27, Laurent Pinchart wrote:
>>> Hi Frieder,
>>>
>>> On Wed, Mar 17, 2021 at 07:04:19PM +0100, Frieder Schrempf wrote:
>>>> On 15.02.21 05:26, Laurent Pinchart wrote:
>>>>> Hello,
>>>>>
>>>>> This large patch series is a collection of miscellaneous fixes, 
>>>>> cleanups
>>>>> and enhancements for the i.MX7 camera support. Most notably, it
>>>>> implements support for the Media Controller API in the driver.
>>>>>
>>>>> Compared to v1, review comments have been taken into account, and the
>>>>> patches have been rebased on top of the DT bindings and latest imx
>>>>> changes as present in the linux-media tree. Patches 38/77, 39/77, 
>>>>> 60/77
>>>>> and 61/77 are new. For additional information, please see individual
>>>>> patches.
>>>>>
>>>>> I have successfully tested the code on an i.MX6ULL board (with an
>>>>> MT9M114 sensor), an I.MX7D board (with an IMX296 sensor), and an 
>>>>> i.MX8MM
>>>>> board (with an OV5640 sensor, and additional patches for i.MX8MM
>>>>> support).
>>>>
>>>> First of all, thanks for the great work!
>>>
>>> You're welcome.
>>>
>>>> I'm currently trying to get a setup with CSI + MIPI + ADV7280 
>>>> working on
>>>> an i.MX8MM system. Would you mind sharing the additional patches I need
>>>> for this?
>>>>
>>>> I guess you are referring to patches for the MIPI CSIS PHY and the
>>>> devicetree. Anything else, that I'm missing?
>>>
>>> I've pushed my work in progress patches to
>>>
>>>     git://linuxtv.org/pinchartl/media.git imx/next
>>>
>>> I haven't tested this on mainline though, as the i.MX8MM board I'm using
>>> currently requires an NXP BSP.
>>>
>>> For the DT integration, here's what I have in imx8mm.dtsi:
>>>
>> [...]
>>>
>>> Mainline seems to be missing the power domains, so you'll likely have to
>>> sort this out.
>>>
>>
>> Thanks a lot for the patches. I finally found some time to test this 
>> with our hardware. I'm working on v5.10 mainline and applied pending 
>> support for the power-domains from Lucas [1].
>>
>> It doesn't look bad and I can bring up the media devices, etc. but up 
>> to now I couldn't get any image from the ADV7280A-M.
>>
>> This is the first time I'm working with the media/v4l subsystem, so I 
>> might be missing some trivial things. Also I'm not quite sure if the 
>> adv7180 driver is currently fully compatible.
>>
>> Anyway here are some things I noticed. Maybe you could have a quick 
>> look and see if you can gather something from that, which helps me to 
>> get this running?
>>
>> After enabling the link to the adv7180 with:
>>
>> media-ctl -l "'adv7180 1-0021':0 -> 'imx7-mipi-csis.0':0[1]"
>>
>> all the links look ok, but not all the parameters seem to be 
>> propagated up to the subdevs (see [2]). But I don't even know if this 
>> should happen automatically.
>>
>> After setting up the format like this, the subdev setup looks ok as 
>> far as I can judge (see [3]):
>>
>> media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x240 field:alternate]"
>> media-ctl -V "'imx7-mipi-csis.0':1 [fmt:UYVY2X8/720x240 field:alternate]"
>>
>> Also there is one small issue with the adv7180 not implementing 
>> neither V4L2_CID_LINK_FREQ nor V4L2_CID_PIXEL_RATE. So 
>> v4l2_get_link_rate() fails, but as this seems to be only used to 
>> calculate hs_settle, I just hardcoded the hs_settle value for now.
>>
>> Finally I don't get any image from the analog converter. The stream 
>> seems to be setup correctly, but I don't receive any frames. Though I 
>> can see that there is data on the MIPI CSI lanes.
> 
> I discovered, that when the stream is running and I toggle the 
> CSITX_PWRDN bit in the ADV7280 (disable and the enable again the MIPI 
> CSI TX), I receive a single frame from the camera, but nothing more 
> until I restart the streaming and toggle the CSITX_PWRDN again.
> 
> Also I'm not able to get any frame data if I try to get progressive 
> frames from the ADV (setting field = none and fmt = UYVY2X8/720x480), or 
> if I try to use PAL instead of NTSC.
> 
> So at least I know now that my hardware seems to work in general. But I 
> still hope to get this setup fully working...
> 

Just to wrap this up: It seems like for YUV422 you need some "special" 
settings.

First of all, just as with the RGB formats I needed to set 
MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL in the MIPI CSIS driver and 
BIT_TWO_8BIT_SENSOR in the CR3 register in the CSI driver.

Without this the MIPI CSIS hardware will always run into an overflow 
condition as soon as some data has been received.

Further I needed to set BIT_MIPI_DOUBLE_CMPNT in CR18 to get the colors 
right. No idea what it really does, but the RM mentions YUV422 in the 
description for this bit.

With this setup (and some changes on the adv7180 driver) I can get 
proper images from the camera. Though there's one problem remaining 
related to synchronization. It looks like the ADV outputs some invalid 
data at the beginning of the stream which results in an arbitrary 
horizontal and vertical offset of the image.

I guess that this could maybe be solved by implementing g_skip_frames() 
for the CSI driver, but I haven't tried that.

If anyone is interested, here is my WIP branch: 
https://git.kontron-electronics.de/linux/linux/-/commits/v5.10-mx8mm-csi.
