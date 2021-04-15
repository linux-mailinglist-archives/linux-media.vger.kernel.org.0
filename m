Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4154D360FB4
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbhDOQEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:04:38 -0400
Received: from mail-eopbgr80112.outbound.protection.outlook.com ([40.107.8.112]:60591
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233919AbhDOQEf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:04:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfAVUkEbnETWEnQg1/GOu7KUBBcwJfzBxYuFrcdjaXHiEWwrtS71lZQcSWiOb/R5aSGkUCYUd7kzOIH48MGSbfIwF+8g6hjywVdAokfFV1Sxv+/UERSn+1yxf1Hq4+1b31PWUSF5cUwDvO4gm4T5iDm9XJ2V1wt5tJv14P5oSW8zeNXJQaXtqT7S4OHkiTfRWD8VV14539nKu6iHCee4GJZDCJ2+Na1MNXNMVJe3gC2AiKUVSLkX1oGp3mSYr6JL5se0khwF8cE2gAlkm/NW1xzDsd0ltFo8uvWF6veNEsq/ta1IQbMKTX0K2GnFgiyvvSP3veutYiesT9FWjiSB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcYXlYQ9MLQVJ7KSv1XjA+svzt1Z+GaFZJh4blqcGdc=;
 b=LrXMo1d+SK0LdlRA+7koQS6/q598ZRnlluUGJ0U3/FNBsmthq9ihY2CUSCVNetkWvJ+kghypWLItdSeDEXfAjg12Ifbn/aWtsJ9cv5+fMR5Thi/P6ilxWb41n5VCypadvpkmGxJYR0+q0gnlcIIJjKFonUL7iobP+PwXv1xcl8NUnFE/lYo+jwshyl+n4Q+QIqbSgBf76qzejjnaLFW7f7VhFdMkJc/P8XdkHrMBLhtU5KSDAQz7UViDXo4zn8AkG/OZTG+StPov8nWTkQ6KZlOGzbRg75yk8Q6Mi96PBR7hUBCNUxM7giEz4xsaa5j4OkrTdDu6YPHM2RWwh3AEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcYXlYQ9MLQVJ7KSv1XjA+svzt1Z+GaFZJh4blqcGdc=;
 b=bqZLF35NhYJxZYBTmbuXB6AUtjdtzON5V/jplOp3QsMACPvATrIv0eU592QV6SCQv2Za1OUcQhm1h6sMoExMhX97vw2RnrkvCdoNU3pzZLn2bq1QOhV3/aEcEdwq+7XCfkDg7gBRt6l2dDNJv8ST0Ys5x/gr4riHnKF12JqkNHE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3249.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:186::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 15 Apr
 2021 16:04:08 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 16:04:08 +0000
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
Message-ID: <71888be2-faf3-f4c2-5cac-2a39acbeba81@kontron.de>
Date:   Thu, 15 Apr 2021 18:04:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ed2480a0-7950-64d2-6490-d2d7dab1bbfe@kontron.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [46.142.74.26]
X-ClientProxiedBy: AM0PR10CA0068.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::21) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (46.142.74.26) by AM0PR10CA0068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 16:04:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f0a26a8-3e38-4d2a-46c4-08d900281977
X-MS-TrafficTypeDiagnostic: AM0PR10MB3249:
X-Microsoft-Antispam-PRVS: <AM0PR10MB32490A7A8CECCB393207DE00E94D9@AM0PR10MB3249.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKcLM6q+84N46eSGcyx5i4tNlkRSE+VdIJpj67vdDz7mcYStMxlbHnL5ydZ0+JZseI1JLqDXyN1ybkGhlA04XS08mXJUESsSCsGovEYlF9m33ucRAcn3s0Gf2RM1OLkPunrhqE81rIoJ36ZE8nbLf3bm0GPAnvyKbcdyCTNrIEBfvsS30zLTasbqLauVyOsNv839ce45QISqIcjBTMshXoaH8q6OavyLN/bxQrOI2ekQrOK4dJQE0p/+fXpHEys6Jl+wpqomvJWaFdPIjIDxA8DG2odPWjxca6An8vx08UjihMoGOFwM+nt64jACAWCQeyNTiyrRclbpb3gsSfZ3/9xIsHgTsyQzRn/yRrn4OLTubWymrYTrMbLgQNh2Jut4pz9i6SR9omZlWeIZrhbdqG30uYUt/uERiiV10dqRb6lkNFTwKTe5D4MiuMPMa1T5rnAm11mGDzJap2fljNpGXKSZ53nzFMlQfdKr5M/JPHirtNsusBeWAfUc20kngO2PC4RsWxTwK4xglYSpxhpKptyOVOEun/PJI5DBncpfu06I412L8sDpnpsMMfRz6KBxzMLen18L3+xUJYEBTDfVyOBaaNWPrbNXp7upDJKb5WKUYvKjBNY2/aCe0nUEpr7zigg6FrE3NlzoAfXRSr7RY/vXFPOQTczb4XHRWAIGZmq0QpTGzu6pH5OqPhP8dkkoXLMcRVygzZ9+0Vf06Igz2zpKZqW1weyK34WWTgO8PigG+V+A3v8UYWL78nKZRlKNDFIKSQlkh6EMxmV2G4Gh5AqzaBLStuXuIc8Vor2GXHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(478600001)(966005)(4326008)(5660300002)(66556008)(66476007)(66946007)(16576012)(31696002)(86362001)(54906003)(316002)(36756003)(38350700002)(52116002)(38100700002)(53546011)(83380400001)(186003)(2906002)(16526019)(8936002)(8676002)(26005)(6486002)(31686004)(2616005)(44832011)(6916009)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkV6REdPc0ZDN25wTlZPSjkwaE1wdlhZL1dPcEt3a2J4ZVZySnVsSkw0Zmh2?=
 =?utf-8?B?VHF3elBsNVJFS3Z5WVpxWWlSTWNaSFZhMVlTcTd4bFNTdHRxWXZxczJZVzNq?=
 =?utf-8?B?bC96VDJSMWN3ejArbGNZZHFsYzZTOTMvazhndE5POFVRT0lReVY0aThxN1B3?=
 =?utf-8?B?Mzc2V3pDRTQ3djkyTFgwNzNhMXh1eng2VWdFdnBQdXN5bVJVSnNFcTd4clM2?=
 =?utf-8?B?eEpEeUlYWjREMXNsYWtmWURJdS9ZNlJDb3laQmdHUlFMcFhsazhJU1BKYnc5?=
 =?utf-8?B?aTlienhqZVNvQkZramtxbzJMc2ZaT3pWMkltSmpYRkkyQTd0T25HT28rUmJm?=
 =?utf-8?B?WHd3MHNoZ0tqTkNQeWg5anoyRWtpdFN5aVI1dGVGUXp5RW5hWHVYcVl5aVZB?=
 =?utf-8?B?UGFzL3hDc0xhVWlOdmRKa3ozTkt1eDFWajNzMWlBWjg2cXZWNXoyelN4WnRh?=
 =?utf-8?B?UnZXdisyYWFHRlR4NnFpdFRGRlZaaHRyTmhSTk5hL2hrcVBXQ2RwYjlVN1N3?=
 =?utf-8?B?eDdBMS8zRjZzaDVqaUpKb2FvWTlhWGE0WmNHbnRsWXVCRy92VzBJcS9GaCtM?=
 =?utf-8?B?NGg0MDBJK1BuWHhGa3ZjQjhranRqYnplODBZMDNaOUpnSXBuMFZwYmJocmxY?=
 =?utf-8?B?bFdIcUEvazRBWm5ON1hhN2xQc1NMTWRsRU5sWVRZNWpFcWcwWFp1QzVyL01o?=
 =?utf-8?B?UTAvb0laOG04amRIUWhhcG0vNjJPNzRxMCt1bXA5bzZGTGR0UnlwTE9BUzNU?=
 =?utf-8?B?akpXM2tqSitzVjBxZG9FRCtQTTRXYW1CaHpFM2VxY2lIWGpmV2lnTzVqcThn?=
 =?utf-8?B?Y3pjQW15ZTNwcHFQUDhiWHE5eHRYV3hVL0Z1L3lwRERqc1V3N1ZXQklrTUQr?=
 =?utf-8?B?ZjF4cGNjVlNCK0pIaXRhZDdJOCtRdW5sQmVhUERubWRZeThVN1ZHVm05dnly?=
 =?utf-8?B?UTJuSGswdDhLa2RKeUZXZmtDaUgyWXo1OWV5NHhnMzYxeTNIaE94S2FUMTNu?=
 =?utf-8?B?WlNDU0pkaHhYNEgvTk9kc1ZqdjlYdUdlU2MzNlZ2S0VtQUhyR0QxZGZQeW41?=
 =?utf-8?B?MlMwNHJlOENEZG5Jd3BWZzdVbFR2dnF2WUo1SWkvTmo5NzcvZGdjV1RwcWhy?=
 =?utf-8?B?d3I4aHAxTjR4TFhGTkNtSWhIWVJhelY2VFJTZm5CYURKK1Ntb3N2Z0J5VVZl?=
 =?utf-8?B?NWJiRnFQUTNYcHlsZ3g4ZlM3YStVMEhBUXhGd0NweWxrSjBRNXpVZ0tFZWF0?=
 =?utf-8?B?WFJxUldOUUE1aTl4QzQwMWJrSnZuM05ad0dPY21VQ1pGNHg2SnZqaTdrUWxi?=
 =?utf-8?B?T2pqR01rQTBIVnJFK3JvNW9ValErWEtQRG5LVHN0cmdOWmhSbG5ISDFXZkU3?=
 =?utf-8?B?YnRRc0V5TTBMSEdabnFRd0JILzVlNHBFOGt5endCNlhlYUlXdVo1anU1TENW?=
 =?utf-8?B?dDdHNUxqZVc5VW92ajdKWXN3bk1LdTFNZEw1S2NsSUNOU3V1TGVmNENKRXFI?=
 =?utf-8?B?eGRYWnRRdFBCUU5XaTNIM0paVFJ2amFreWdkNlNvZ0RpYzhQUm40SGhjNnY2?=
 =?utf-8?B?R1J4cG1zYzhFT2x3dHp0aTJhT2s5RFcxTjF5WlBKSjhrOUM0Q3NHYWhvN0VJ?=
 =?utf-8?B?TXRaTXlKcW1BTXN0WnIrdFg4a1pwa2tDcUJyU0wxOWIzRklnQWtIZUJKYXBX?=
 =?utf-8?B?Z1JBRG9TTVFmVnEvYlZUUzl5TTRIYlVNci8zenBrbE5NVEg1S0hlaENpYUNo?=
 =?utf-8?Q?Ef6fEULaELyss2BXk0KyAeZRDZ6l/t7qN80PPip?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0a26a8-3e38-4d2a-46c4-08d900281977
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 16:04:08.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiZ+gbLjtvKaRzSqE8zi5NYJ5JHh89dWATScD1wndbvao4r9GDf0XsVfZPutj1wLNIDyBzj0h2hQiFL/dwNQwZFnyM+7qQZ8IXDavUkd7BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3249
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.04.21 11:00, Frieder Schrempf wrote:
> Hi Laurent,
> 
> On 19.03.21 02:27, Laurent Pinchart wrote:
>> Hi Frieder,
>>
>> On Wed, Mar 17, 2021 at 07:04:19PM +0100, Frieder Schrempf wrote:
>>> On 15.02.21 05:26, Laurent Pinchart wrote:
>>>> Hello,
>>>>
>>>> This large patch series is a collection of miscellaneous fixes, 
>>>> cleanups
>>>> and enhancements for the i.MX7 camera support. Most notably, it
>>>> implements support for the Media Controller API in the driver.
>>>>
>>>> Compared to v1, review comments have been taken into account, and the
>>>> patches have been rebased on top of the DT bindings and latest imx
>>>> changes as present in the linux-media tree. Patches 38/77, 39/77, 60/77
>>>> and 61/77 are new. For additional information, please see individual
>>>> patches.
>>>>
>>>> I have successfully tested the code on an i.MX6ULL board (with an
>>>> MT9M114 sensor), an I.MX7D board (with an IMX296 sensor), and an 
>>>> i.MX8MM
>>>> board (with an OV5640 sensor, and additional patches for i.MX8MM
>>>> support).
>>>
>>> First of all, thanks for the great work!
>>
>> You're welcome.
>>
>>> I'm currently trying to get a setup with CSI + MIPI + ADV7280 working on
>>> an i.MX8MM system. Would you mind sharing the additional patches I need
>>> for this?
>>>
>>> I guess you are referring to patches for the MIPI CSIS PHY and the
>>> devicetree. Anything else, that I'm missing?
>>
>> I've pushed my work in progress patches to
>>
>>     git://linuxtv.org/pinchartl/media.git imx/next
>>
>> I haven't tested this on mainline though, as the i.MX8MM board I'm using
>> currently requires an NXP BSP.
>>
>> For the DT integration, here's what I have in imx8mm.dtsi:
>>
> [...]
>>
>> Mainline seems to be missing the power domains, so you'll likely have to
>> sort this out.
>>
> 
> Thanks a lot for the patches. I finally found some time to test this 
> with our hardware. I'm working on v5.10 mainline and applied pending 
> support for the power-domains from Lucas [1].
> 
> It doesn't look bad and I can bring up the media devices, etc. but up to 
> now I couldn't get any image from the ADV7280A-M.
> 
> This is the first time I'm working with the media/v4l subsystem, so I 
> might be missing some trivial things. Also I'm not quite sure if the 
> adv7180 driver is currently fully compatible.
> 
> Anyway here are some things I noticed. Maybe you could have a quick look 
> and see if you can gather something from that, which helps me to get 
> this running?
> 
> After enabling the link to the adv7180 with:
> 
> media-ctl -l "'adv7180 1-0021':0 -> 'imx7-mipi-csis.0':0[1]"
> 
> all the links look ok, but not all the parameters seem to be propagated 
> up to the subdevs (see [2]). But I don't even know if this should happen 
> automatically.
> 
> After setting up the format like this, the subdev setup looks ok as far 
> as I can judge (see [3]):
> 
> media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x240 field:alternate]"
> media-ctl -V "'imx7-mipi-csis.0':1 [fmt:UYVY2X8/720x240 field:alternate]"
> 
> Also there is one small issue with the adv7180 not implementing neither 
> V4L2_CID_LINK_FREQ nor V4L2_CID_PIXEL_RATE. So v4l2_get_link_rate() 
> fails, but as this seems to be only used to calculate hs_settle, I just 
> hardcoded the hs_settle value for now.
> 
> Finally I don't get any image from the analog converter. The stream 
> seems to be setup correctly, but I don't receive any frames. Though I 
> can see that there is data on the MIPI CSI lanes.

I discovered, that when the stream is running and I toggle the 
CSITX_PWRDN bit in the ADV7280 (disable and the enable again the MIPI 
CSI TX), I receive a single frame from the camera, but nothing more 
until I restart the streaming and toggle the CSITX_PWRDN again.

Also I'm not able to get any frame data if I try to get progressive 
frames from the ADV (setting field = none and fmt = UYVY2X8/720x480), or 
if I try to use PAL instead of NTSC.

So at least I know now that my hardware seems to work in general. But I 
still hope to get this setup fully working...

> 
> I'm also not quite sure which value to use for the CSI clock-frequency. 
> On the clock lane of the CSI interface I can measure something around 
> 106 MHz coming from the ADV7280.
> 
> Maybe you got some pointers for me to look at?
> 
> Thanks
> Frieder
> 
> [1] 
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201105174434.1817539-1-l.stach@pengutronix.de/ 
> 
> [2] https://paste.ee/p/HuIfu
> [3] https://paste.ee/p/os6dU
