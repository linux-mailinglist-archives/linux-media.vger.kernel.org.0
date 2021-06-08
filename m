Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D247439F45C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 12:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhFHK5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 06:57:40 -0400
Received: from mail-eopbgr150093.outbound.protection.outlook.com ([40.107.15.93]:42974
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231506AbhFHK5j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Jun 2021 06:57:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw1nnsQNlSoIffZgDtU3GHGrprQ62OdWoVWQT87F8RnaQqvzIrbwSBQwhDYK7uWOdT0mVdMYzG6gnJEI0G8hW6RX+9rIDZsC3MVnfelS2cRCy+Z+dQC9c2OAhxWgbybqTKN3qb+M9T1kbPZOnfEQH0t2U3ASx7EdUcu09bPHqeuff+JViWS6/yweLlYVdL18Afl2biBvb+FE7omC6IdDU7C+3yLSCb9iFtzZd2SVl8fO6Q0zAcZDpigJzBZmDjXTQdBdfO6P2kBZMAcrpAGgzBZ9Hfkod04gHp2IjrGN1an+CvKbudqmqQ8Z5dbJynTz+UygXjCbnS68d5jUGM4swg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwvNJbS9klrrzfSVKtLMif3PZauuyvaLAF3HCsL3rnA=;
 b=bhiQnDtwGMX1JXbF6RW2NBsswYoClT8LYJAPtM7kHPoZK/lVy41h/d64+hSYJAiNIIQ9LUuN/wYzvudHDtWtX9Wptj1g3+E2bdt61IInx0k6kuseH7N5h41vnnU3NkO9Pwonvx2+7wIom8osUSC9m88bZjtx1xF90ymmfVHrhVbSPG6Vlv+x9DsGXrGmQ8clibK86VnDYOyIY/sJ/60/oNxOch8PWPNDZhQjwSLnPe0J3b9nuxUBb0wJy+gj9C+dlj1A2lpS7Ki6vKPrd3AvkKLESs1q2q56gehTPadkp5Uxix3DadEm87RTNagMVFIu/FCASNvBe2kJnaYTMyzP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwvNJbS9klrrzfSVKtLMif3PZauuyvaLAF3HCsL3rnA=;
 b=E03On6jEzR+c4yjEhDJk03sycaALMxCNdZOpctOORIpCKD2uZ0BjUHuX4rQps2rrfNTE4XsRivJQrYxvNa1pUD5411/yVph1zgZzO46dYBomqP9XF8ZIGrGI52e0xeoSsgIhlL6gClf6Omtf9Z5ovuR7FaHkSb+YaBBYEW9IsNY=
Authentication-Results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4658.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:357::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 8 Jun
 2021 10:55:45 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703%5]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 10:55:45 +0000
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Ian Arkver <ian.arkver.dev@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
 <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
 <768ccb5c-a02f-576a-29ab-57e3c6d46d26@gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <dfc1ab86-ac5a-4b4e-4cb6-6b99679aaf1e@kontron.de>
Date:   Tue, 8 Jun 2021 12:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <768ccb5c-a02f-576a-29ab-57e3c6d46d26@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [89.244.177.254]
X-ClientProxiedBy: AM6P194CA0062.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::39) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.32] (89.244.177.254) by AM6P194CA0062.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 10:55:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7caf8196-d3fa-4e2b-fe9c-08d92a6bf755
X-MS-TrafficTypeDiagnostic: AM8PR10MB4658:
X-Microsoft-Antispam-PRVS: <AM8PR10MB46586936FAC3896AA876E388E9379@AM8PR10MB4658.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 878xN1ko/TYy8iwmaYBrmTlv9ujAEq2EPh8dCLcdqemlXHYk54ReyEHVcYNVekRYlncy+xu6kTVj8Pk2Y1tVmFbZpca+0QWXB8aBi8e2JuvCFgRWdObomGXOvrgoik/fD2OsnuWtqzy1BzzdK4pyf1wSx/XuoDAVba+h+p+N0ISDfHdwhOzz4Hm/8StYSoU70h6GmzDQYaxzwcS7oHTA9g0nG+te6I3sX8pWa625iObSSpK6wd/XI1L0VWLwTW80QvM7y6DvKCFeOMNJjCIRiGTd8qeHWBYWVu42M6+KVuEM89dQ0DRmjApUeQkCPjS5La31T0kTEoSpz2Nx9oBiOS1t+gDD4m7rnpow06K7f0i7+tAqNzUsXzuRdI0YmnRLlhWiQnOLoTvhbCOs5+tE4SpHajncCrBy3CvfmszR5LvxT4/pp4lAEwMP56pJPb5q1mHWcLf2eXx8nHf/l82cCgHtHDXxbmWkDt3eiEucisiW1CJWChpmYyoAVQ9evjOZQW5Otsv3MyRJ9+0x3F/w8J27urbTsNOmUzmriQNfd8TUG/KBZsRxLNPlzjVE6RWmYF7usWFLJHuFS4U4EWROx3GhWoHtgULIk8qSA1u1CdHAjKqJNXtgG/NDynwqEa0WZmGqzgciS3us67VyCg6t5+P/e6AhhMPWMZ6D9W+wRATknKG0ly5Q4zjrEvcOcj0GuMa2548UX0iL61y9KWFM4gHtc4Ml8ajA5sAWymgZVYchxXJQzQ7TdIn2ek0RYk5xc7vdPb1is8OdU5wBJpulEYTLgStrCvKsoK9AI+CRqn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(366004)(8676002)(53546011)(54906003)(4326008)(83380400001)(31686004)(31696002)(8936002)(316002)(110136005)(478600001)(16526019)(186003)(44832011)(5660300002)(26005)(956004)(2616005)(45080400002)(38100700002)(86362001)(6486002)(66556008)(66476007)(2906002)(966005)(66946007)(36756003)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHM1U210WHFTRGp2N0g2STJHNTRWUHBhS29ORjBvcXlySGYzU0EraTVJN2lO?=
 =?utf-8?B?NHBNWGIyTzVmWXBjSTVEWjVDZUJmUXE5SE5kNy9WOS9rZjVIaTQ1SUJkbHVH?=
 =?utf-8?B?TWFPS1ZIVTBHa3k3b1lVUzlrZWphN28zU20vUlN2OHJ6V01wRHpwZWRYcVhE?=
 =?utf-8?B?VnZaQjdqdWpMSTFaTkVWQktERnBlajlFS2FCUkJBTlhuTU5oc0FNOGZ6aEh2?=
 =?utf-8?B?NkgwYTRDOC8xRG9Za1dOTmVhNWs1WFlpVXNsVHpNRFNQVU41a0ducTJxTFRt?=
 =?utf-8?B?dHh6SHlURS9mUlhMTVA5NUw3Q3VBZ0tQN094bHRIdHBRb09jU3VpLzV4dXRI?=
 =?utf-8?B?MFhZL291bUh2NkN2bTkyaVJjYjFHUEdsVDJlSnpEMW5jME85dkZaZ2YwSmNj?=
 =?utf-8?B?MkNDeGk0WTF5K29STHRYeklXb1VSekJMcWJUN0libFRtM3pXaExEMkZiNHRh?=
 =?utf-8?B?aUNqRWt2dExJOVFwczh5TFE2ZEdlYkE1Qk5hT2tLS0tPMVMyNVJOYWJDMHNQ?=
 =?utf-8?B?YkY1UWJOUitIL2ZGRElhR2d6RURmbTEvdzlLVTdIZEdUUzRsOWkwSnltYXEr?=
 =?utf-8?B?a1JIM3ZvNi90WlVSU1JkRVpMalh3WG5yMTVLN0dBb0l0S21BbHhraVE0SGti?=
 =?utf-8?B?SVFYUjFsQkVSYTloYTdwbktrK1p6TTlJaWl0UHNJRFF6MW9RVFZaSEJsVEFx?=
 =?utf-8?B?VFM3TWRDcjhWdTFMekY4UUVZSWxPVUtpYkVzZWp1RWw4WTc1UnVKVHByc0kr?=
 =?utf-8?B?SGszekRDUFlXa1hZU3paMkh4QllvcUlJb28xckdIdnRIOGhVQXFzdmJJY3Zz?=
 =?utf-8?B?b3VCNGVaZEh0clJtNExzNERLcDZDTHJLS1lRbVhyQ2FxdTlZbHBqRG1ZMGcv?=
 =?utf-8?B?bWE4OURMMzNHWElPSWJCTUFaeXM0cXpnN2g2RmNYTDlDNXVlM0RWVnM0Zi9j?=
 =?utf-8?B?dy8wTVNWWjlRSEc0UjF1dzMzUlh1YW1FZWNLVjVCcU1ObTg2dUs5cEt2QWRO?=
 =?utf-8?B?NjJ3YjZyem4zRkxjVEZ1WjNSSXhjdTVXT1FuVnRVYkhMeE5FVWxjbjhTck5s?=
 =?utf-8?B?aldleSt1UUNsTFdEOU5FZ0F3OFNQTmtTVUZLQXd0eExYeWZWeW84TFFhNEVy?=
 =?utf-8?B?Z1NEa2sxVEZsK3k5WVRIejJ1MWp3WldoQnRvdlZYdzQ5d2cwUlIrNUFjSjkv?=
 =?utf-8?B?aTZGTXp5V1JyaHM4Q3RvOURBME5mcGVqdy9WTzVaeVU1eERiYjQ5cGJQMFpK?=
 =?utf-8?B?UVMyMy9tTEprVURBb0QzeXFUQVA4MVhKQ1BQYU1FTFltUlVjUjBoM1lWSlVk?=
 =?utf-8?B?Sit3WXpBWWkvcUhlWUlVc0gxaWZtUGE3Vnh5VXNMd3NsU0Q2VXU1SFEyZStQ?=
 =?utf-8?B?dFJNSWtydzRhdlgzakNpckkzbU96NFZXQ29FZjA2TzU4aXRjMUg1TXpoZW8z?=
 =?utf-8?B?VWp0UkhZeVBxdG9iTVl5TkxlMW5jOEpYMVo3R2xTYTNHZlJSSlBPcHFvY1Nt?=
 =?utf-8?B?Smt3dEJBUUhyY09uSmU5dU9QQVJwSE81eGpybnEyeDMrY3dzZ3REMEFqTEpC?=
 =?utf-8?B?VTQzZDFCdVdVS3A4c3RrdnpnYWFWYm1lSlArdlRaZitiaHd6VTZsR3BwZkVD?=
 =?utf-8?B?dE5ibVVqVGVtckVneXZxU2tkNThwQ3hPZUlMN09tVTNzcnJDK2hnTXZVYURU?=
 =?utf-8?B?U3AwTlBGNUxuZVIvbFQvbmVyeWZ0djhtRElsSER3YUpWQ2xWUE1zMm5iaSto?=
 =?utf-8?Q?f22QTeamIirL9bibLp9KHxTl3ApctbT7ORmNINO?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7caf8196-d3fa-4e2b-fe9c-08d92a6bf755
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 10:55:45.0560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mny/0r6vH94OX3ubdYro4seDUhpatSnR5qDi/7roAj/S8TKQRAlVcqNnCFqK4BHUWwESjaKCT8iK9T0VIl++xjqyKsLWXQsNnBMxeKBZIKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4658
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08.06.21 09:54, Ian Arkver wrote:
> Hi,
> 
> On 08/06/2021 08:09, Philipp Zabel wrote:
>> Hi Fabio,
>>
>> On Tue, 2021-06-08 at 00:13 -0300, Fabio Estevam wrote:
>>> On Mon, May 17, 2021 at 8:48 PM Fabio Estevam <festevam@gmail.com> wrote:
>>>
>>>> Setting pipeline to PAUSED ...
>>>> Pipeline is live and does not need PREROLL ...
>>>> Pipeline is PREROLLED ...
>>>> Setting pipeline to PLAYING ...
>>>> New clock: GstSystemClock
>>>> [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
>>>> driver bug, expect capture failures.
>>>> [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
>>>> [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
>>>> [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
>>>> [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
>>>> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
>>>> to allocate required memory.
>>>> Additional debug info:
>>>> ../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
>>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
>>>> Buffer pool activation failed
>>>> Execution ended after 0:00:01.072478334
>>>> Setting pipeline to NULL ...
>>>> Freeing pipeline ...
>>>>
>>>> Not sure why I am getting LP-11 and clock lane timeouts though.
>>>
>>> I saw this post:
>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fez.analog.com%2Flinux-software-drivers%2Ff%2Fq-a%2F535279%2Fadv7282-m-dts-how-to-connect-adv-to-ipu1_csi0&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7C81057e8e187d4f2bf61908d92a52b30a%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637587357508272332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=tb3C%2FU20jo5tp58olvCo%2BRWREFNZEJaZop1hHGMksBE%3D&amp;reserved=0
>>>
>>> and Frieder's patch:
>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kontron-electronics.de%2Flinux%2Flinux%2F-%2Fcommit%2F0d90331a44d0f718b7327a94fc72612ddcb4ac0f.patch&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7C81057e8e187d4f2bf61908d92a52b30a%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637587357508272332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=hsuRqyEYAh1PtGiwZRKcmENkVbJuRN85DBmuXHOZhBs%3D&amp;reserved=0
> 
> Frieder's moved adv writes should maybe be inside if (enable) though, with the else write-to-clear as well. Maybe gst sends a stream off?

There's an "if(!enable)" before that and it has "return 0". So it should be fine without "if(enable)".

> 
>>>
>>> I applied Frieder's patch, but still getting the same errors below
>>> upon launching Gstreamer.:
>>>
>>>   New clock: GstSystemClock
>>>   [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
>>>   driver bug, expect capture failures.
>>>   [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
>>>   [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
>>>   [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
>>>   [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
>>>
>>> Does anyone know what needs to be done to avoid the LP-11 timeout error?
>>
>> The i.MX6 CSI-2 RX needs to see the LP-11 low power state on the lanes
>> during streamon (before it calls the ADV7280-M s_stream(1)). That's
>> where the LP-11 timeout error occurs.
>>
>> According to the ADV7280(-M) datasheet, "after the ADV7280-M is
>> programmed, the clock lanes exit low power mode and remain in high speed
>> mode until the part is reset or powered down."
>> So it appears the ADV7280-M has to be freshly powered on in s_power(1)
>> for this to work. Is the ADV7280-M powerdown GPIO connected properly on
>> your board? Moving the CSI-2 configuration from s_power to s_stream was
>> exactly the right thing to do in my mind.
>>
>> Just as a test, if you remove the CSI-2 register writes from either
>> s_power and s_stream from the adv7180 driver completely, do you still
>> run into the LP-11 timeout? If the CSI-2 TX never leaves the low power
>> state, I would expect seeing the clock lane timeout instead
>>
>> regards
>> Philipp
>>
