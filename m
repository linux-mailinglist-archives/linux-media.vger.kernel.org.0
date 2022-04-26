Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60016510AEF
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 23:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355135AbiDZVGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 17:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353626AbiDZVG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 17:06:29 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736824A923;
        Tue, 26 Apr 2022 14:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjPYNlEJ0KBmWMLE+yny40gHvxt94Ydzk9nK0iK3L5Sk1YJMeoL4nC8D8kF514uSDObhSqu+bHUvBLrE4A5SGZcdiPpBgtoxzZXtH8q+MdQLzueYumfBEMDyzdTMhWqukVG3sMZqDCZoQD43f2LPzp4d4lFPULvq0+uIUDLakKgB0TxLBzIlT91NhqcRXVYrktusOqhRJU+J2yE2+xdEsdAr8XyE9ZvXqAxtit2HtivHaoXCkwTkn+NuIOssve0hlrha4NhHr0FpNALJIQGc4uOSGT6eX7X2i3iJZpr+aleeYo+8wfwDOBrxZrs7d58zAJ2aGy7Kq9bHbUEnpgSQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6AOzponjga7O4in5lSecWlvD5c3BapxOx6T/GZd0gA=;
 b=VAtv/ktuCGuzDxi2DArPrcUUohWYPRzcAorgKEj/6baP+HqQVRcjrnT3ux9BBE8EJx9yojPRmYWXRL/cIt3ivj98ozsmVJ0Qh199UvbjRig8dW2sqV3421VV0D1lRjbN6jkcsEcQwQWGTKuG4J6QXRPeEUGsJTzokHDpkhqKX8/TpZ8+Eyp0jnhbZhd4AREuQsctwmlLS/OYQ9EM6zDZkHoHhdVGPZ/j+9d8KAoQWrnpeYG7gN3KU6KCq3f+NlCC5w4+44D1WmKsf3VDUmyD3mcO/peZGkJLi66m1duisHSxq9baY0b3YjtLX5hPN4JCBFYKXCWrQDmiYY4eXu9rOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6AOzponjga7O4in5lSecWlvD5c3BapxOx6T/GZd0gA=;
 b=knsNE9fYjMggFH02uBvCFXbCTjUEjBNGBaM2uDcfHGWd0jm1qe9MtRSljmPOohftwzr29Ek1wTRdG2/NS0WHTOhUdNBmjC6CwxqIwmymN2qvXVTvUZHDV1lWwcgC080des9+v8dTn+OKtV34D/alycJ23NNGrH495ssw2AcPcsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by HE1PR0402MB2907.eurprd04.prod.outlook.com (2603:10a6:3:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 21:03:14 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%9]) with mapi id 15.20.5206.012; Tue, 26 Apr 2022
 21:03:14 +0000
Message-ID: <45730a52-eb5a-acce-0787-5c76ee18bc53@oss.nxp.com>
Date:   Tue, 26 Apr 2022 23:03:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 6/9] media: uapi: Add a control for DW100 driver
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, stanimir.varbanov@linaro.org,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
 <20220328141309.177611-7-xavier.roumegue@oss.nxp.com>
 <dba106ac-cee1-2493-13c7-ad9aef556a49@xs4all.nl>
 <YmZJhI291wruvjlt@pendragon.ideasonboard.com>
 <44c597b0-17f8-97cb-7922-7beff59c0b16@xs4all.nl>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <44c597b0-17f8-97cb-7922-7beff59c0b16@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::30) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f780e067-f863-44e8-63b4-08da27c828aa
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2907:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <HE1PR0402MB290756D8FAFA7A0B20079CC7BAFB9@HE1PR0402MB2907.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uNHPq6zL9DK3RFc0qgSRmDhX5IlBx/ty4/jNZS0s0xj5p9OTHvBE/qlvUx1OC5OZigiqpGqIj8BvXigao895m04Zg3eOmHeog4KJf3pjtkqprCxHzZBbayKmPo8gweJ1TB3XcxnUf7tLj/SDFG0uvnhe550gUcfS/KJER38zpmPc23krJVK36ZdNcfH9gNN81F0VeE1eS7AqvrHxnybHVqrZYHOGZvCwSBTUrJl/awjJI8XBrEntA8NgusFL7+Ofg6qmGBXwez0JUv7bBz5LX6jsrCau448GFRxIbR5Vz2bBV1N8OW4GAQ0NCIuobCvhg7pH8oGGeZfdTY7LkD6HgsIzOEh43r+wjgTn0J52NgnAjFzqM9YT2xfUwVRjJzxTvQxywXjT6RAd2yzEZhCKKw5af8392uz7VbAyiz019q4Bh8UA3U4nodrELKC/dux2PoHsbZ6lM415YtIYAaUL0CCe/eKeJpzkL7ubUSPA2+XaPAfc2hL5KPkvbpGVYRqmUUnwrAJzqFkR5PMll+7aAazC4ECvxBIAjaWafAnSDOsXYYvLkY608WU0eUNkYZDtJcYVp1K8P/DHXr0svKIFNDMw/ikecagv0o2Q+5tb3K9ZCBkcxgMtwYqkQRF3FoW2pqr5fwUZx2FsEyeKNXr0Y4jgGkJkDjXlSZHAisye6POylMyDmDryp02fmAYyYjHFOwonR/gKf6PoOvp/aROGfdvwpXPX3rDGQvmkaArxP/gHtHSjrVT8fDSEdimZjdW4GsKHL75es3L7c4VPl9q3utFe5z5llusMwYsys27pPHXwKx33z+d7aLARE6p7WmU6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(52116002)(6506007)(966005)(5660300002)(53546011)(8936002)(186003)(2616005)(31686004)(7416002)(83380400001)(6512007)(110136005)(4326008)(6486002)(508600001)(316002)(66946007)(38100700002)(86362001)(8676002)(66556008)(66476007)(31696002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3M2MUdqWUVKV1ZRR3NVUjJydHAwREpkd0NzcWNUYjlpK3F1djdkM2U3MGhL?=
 =?utf-8?B?TGJrZ2ZaVURIZTRTNmgrZ3NXeG5rNkNhb1gyMWpuL0VEQ2JHQVU0Z0F5OHph?=
 =?utf-8?B?bmdqdkVQaXkwTFEyc3BYRXkwdlUwZkFDZjZRZy90VkI2eHo1a0M2bUFqQ0ly?=
 =?utf-8?B?b2FQWlhNeVA5V0tmMXlBSldGQjUxQkJMdWltWmhubEdDV3hhNzlpVncvNTZz?=
 =?utf-8?B?V01zRW02TFlHTEkzNlpvRnJjSHUyUEdOeExUTEtwQ3NjVy9jbzE0T1h5UXQ5?=
 =?utf-8?B?WDJXTmZtYUY1ZjdMR3pIVHBvUEZDbk0vRlRTSllBRmlSQm1VV0xuVzJBYy80?=
 =?utf-8?B?YzVjZkxJMnhVdW1veXJ4a2hENHFFRnZCTUxoMk14K29IQitCb2NtU3hxVk5K?=
 =?utf-8?B?NVZ6M0NxcDMxakVmUUxaai81UndJQVlHNUVxcWNHeFF6Zkt1NG1sQ1FFckh2?=
 =?utf-8?B?R3VyS0tsZ2lrS1ZOa0FQUzdqS0tCM2sxMkdIRlQwei9VL09aUXVURGJDZ3Jp?=
 =?utf-8?B?QmVuSEpRWFBZV2dHNDNzZnNINU5LeEhwbmR2Ri80ZW1rRzkyMXRCcGN3S0Nv?=
 =?utf-8?B?Z0U0anM3R3BuTzhiMW40NVNPNGFYYXd1cHBWd0hsYnlrWWIydjFNczBhUy9v?=
 =?utf-8?B?ZkRDWGVTck8vc3R3cEk3YmxWZHV5V08xYjU2OWw2amNIOXJPZ1NHbTZyMEJK?=
 =?utf-8?B?bFRrUzQ2VFc0WXJ3eGhERDZWTEJYNDBXSVVwc04rY0tkVmVqWnliLy8yQXBI?=
 =?utf-8?B?bGVsbTh5TjJFWDNoSFNONEtONVpaY0ErUmtFYjYyalhJOUpoSnZyYWJhRkZL?=
 =?utf-8?B?TEVOdVVzaGR1Y1VIYi9DcFNkcDJnNzJUOUprT2pKS0VMZFVyMHE0K1lYQk01?=
 =?utf-8?B?Uk1NdGJ1cDkrMEhvSDZadk4zbGNuVjdOeVRjVm5pbk1UMzc0dnFYUEZUalFn?=
 =?utf-8?B?WjZ2Q2kvZUNIRVMvU1crSFo2RWxHZE14em42V29NMkh2eE92QnJOUDV2dFhG?=
 =?utf-8?B?SXNUOWlRSjdNZGQ1bGNORW5YZDFZLzJlN2tuanloZHFkVWw4bWZhZmZHclZ4?=
 =?utf-8?B?K3MvSExzeHc1ZVpYMXNIREdoV0RtYVJKa2IyQy9NSnpVNVlMOFU3K21vQlRs?=
 =?utf-8?B?WkRmK2V6SU5kVEsrcFIrNWl5dmxCS3FhT2lWQU80MjlucnBqcTJMVHY3MDNQ?=
 =?utf-8?B?SWxwZ3YwQTl4OVY0OGRwNnd6OWFmQkRNR1ZLMzA4NHBEeXVjOGtScUlrZmFO?=
 =?utf-8?B?WEo3bXpVNFBINGZ1VldITi9BSEdnZHlrOG9KMFlobEQvZ29BVCthOVdBYjg0?=
 =?utf-8?B?VzRxM28zbkVaakZ0VzlucXpBeGw1YTZpb1hwSkNBTzVrbWZoeVNOUEpWalU0?=
 =?utf-8?B?UkJEVE5XNUFYSEJTdWZTRDhGbTF0RlVydU9KRTVsUVJnTkl6Ry9ENE9COHIw?=
 =?utf-8?B?TlAvUkl1aDR5ZGI5WldFcEFaSVppWG1wNVZHNTEvVkZwTGFuekVBa2lBTTZi?=
 =?utf-8?B?dS9oR0pVYVViQ29xcGlQeEhsYkt1MVhnL3VHTHhHUmxEc0VaRnNkQUQ3WDRj?=
 =?utf-8?B?Q24zbS96dUVLVkJQZ2VOMysra2diSUFUdVpQR1Y2YjdnWFA5dTM1WFJhUFMv?=
 =?utf-8?B?Vkk1Y1pIZUxWWENJWGlVeW82MXRTSlpTQmZHalVaWWJqMUJ2a3VnSGlmNVZZ?=
 =?utf-8?B?WmIvbW9sYmIyTzlmcDdDWk5WbWRsMjlzSFJ0ZFVkMmZ4ZnV4S0RRQXZoMmhM?=
 =?utf-8?B?NGhYZUF6OTRldWNQN09hdXBNOXpqSjlmTjJxeTFXckhKRFRyYVVZQk9zL1Fu?=
 =?utf-8?B?SXdlZllqamFjdnk3T2FzdUovelBkRUR1eEM3QVpkOUhhSDI0SStTdUo2amtD?=
 =?utf-8?B?MDMvVzBuSjVsSHJoeDlhdkJKQ0ZPc0VIMmtER0pxOHEvUG95OUUzTmRlbzNN?=
 =?utf-8?B?RkY1WndtZ1gvOTVBSk9reG11RDdLVmRVdjNBSnVOSzlhMHdZNGVMZ3BsYXhs?=
 =?utf-8?B?eHlMVW8zMjBkUDZFYi9CVnlXQTNRQ1c2VHZGMSs4WXRYby8wODdSM2I4VS9D?=
 =?utf-8?B?b1JxTllQSytTZHg4WU4xa3A0ZHFhWUk2bjdGa1JWd2k3MzNSdGFKcnVNUFlE?=
 =?utf-8?B?aUREbFljWStrZkc0K0hBTlpsMXc1UUI2cEt1Z0RXc1Jwa2xjaWpuWTFOQ24w?=
 =?utf-8?B?RzR5dHZvL1R3NGVMREJaemVCdzZ1bGhLZEUvQTVQWXAvMlFDdkJqMml5M3VC?=
 =?utf-8?B?TnRwc2tDM1h1TFc2akhuVDJWR3FGOUlVV2xmNmR3blEzc0srN0drQUhyUk1w?=
 =?utf-8?B?Z3d3Mk1wUGJqY0dNVXBTd25SUkNFYXdTNHJmVGRSYWF2anNITjRva2I0K2pT?=
 =?utf-8?Q?g1RFMSvZM8D4LozRKHomRjN96HN9VVFZdlClqG1H2PPhN?=
X-MS-Exchange-AntiSpam-MessageData-1: kS8NHudto4CoU+Dnh7lX6DZKxVcDHwMMvVo=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f780e067-f863-44e8-63b4-08da27c828aa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 21:03:14.3616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cynP5WlA+mYItuEyFKJxiLM5/eMSa1q+pqUncCy3SHY5BXng7XqPkqj0IDC4ihkN3FxzuuDopfIcogWSZpM6Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2907
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On 4/25/22 09:38, Hans Verkuil wrote:
> On 25/04/2022 09:11, Laurent Pinchart wrote:
>> On Mon, Apr 25, 2022 at 08:57:07AM +0200, Hans Verkuil wrote:
>>> On 28/03/2022 16:13, Xavier Roumegue wrote:
>>>> The DW100 driver gets the dewarping mapping as a binary blob from the
>>>> userspace application through a custom control.
>>>> The blob format is hardware specific so create a dedicated control for
>>>> this purpose.
>>>>
>>>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>>>> ---
>>>>   Documentation/userspace-api/media/drivers/dw100.rst | 12 ++++++++++++
>>>>   include/uapi/linux/dw100.h                          | 11 +++++++++++
>>>>   2 files changed, 23 insertions(+)
>>>>   create mode 100644 include/uapi/linux/dw100.h
>>>>
>>>> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
>>>> index 4cd55c75628e..f6d684cadf26 100644
>>>> --- a/Documentation/userspace-api/media/drivers/dw100.rst
>>>> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
>>>> @@ -20,4 +20,16 @@ match the expected size inherited from the destination image resolution.
>>>>   More details on the DW100 hardware operations can be found in
>>>>   *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
>>>>   
>>>> +The Vivante DW100 m2m driver implements the following driver-specific control:
>>>> +
>>>> +``V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (integer)``
>>>
>>> (integer) -> (__u32 array)
>>>
>>> But should this be a __u32 array at all? Wouldn't a __u16 array make more sense?
>>>
>>>> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
>>>> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
>>>> +    dynamic array. The image is divided into many small 16x16 blocks. If the
>>>> +    width of the image is not divisible by 16, the size of the rightmost block
>>>> +    is the remainder.
>>>
>>> Isn't the same true for the height?
>>>
>>> The dewarping map only saves the vertex coordinates of the
>>>> +    block. The dewarping grid map is comprised of vertex coordinates for x and y.
>>>> +    Each x, y coordinate register uses 16 bits (UQ12.4) to record the coordinate
>>>
>>> As mentioned before, UQ12.4 is not necessarily a standard notation. 'unsigned 12.4
>>> fixed point' is better, but you also need to specify exactly where the bits are
>>> stored inside the __u16. I.e.: 'the integer part is stored in the 12 most significant
>>> bits, and the fractional part is stored in the 4 least significant bits of the __u16.'
>>
>> Isn't that implied ? I've never seen fixed-point numbers stored the
>> other way around.
> 
> True, perhaps that's overkill.
> 
>>
>> Regarding the Q notation, while it was coined by TI, I think it's
>> widespread enough to be used here. I don't mind much though.
> 
> I had to look it up :-)
> 
> That might say more about me, though...
> 
> I think the key phrase that is missing here is "fixed point".
I will then replace in the documentation and comments "UQ12.4" by "an 
unsigned 12.4 fixed point format (UQ12.4)". Considering that I am using 
"UQ12_4" in some symbol names, this might ease the overall code 
understanding.

Regards,
  Xavier
> Regards,
> 
> 	Hans
> 
>>
>>>> +    address, with the Y coordinate in the upper bits and X in the lower bits.
>>>
>>> And with a __u16 array this becomes: 'The array contains pairs of X, Y coordinates.'
>>> Or something along those lines.
>>>
>>>> +
>>>>   .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
>>>> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
>>>> new file mode 100644
>>>> index 000000000000..7fdcf2bf42e5
>>>> --- /dev/null
>>>> +++ b/include/uapi/linux/dw100.h
>>>> @@ -0,0 +1,11 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>>>> +/* Copyright 2022 NXP */
>>>> +
>>>> +#ifndef __UAPI_DW100_H__
>>>> +#define __UAPI_DW100_H__
>>>> +
>>>> +#include <linux/v4l2-controls.h>
>>>> +
>>>
>>> Add a comment referring to the Documentation/userspace-api/media/drivers/dw100.rst
>>> documentation so users of this control know where to find the associated
>>> documentation.
>>>
>>>> +#define V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (V4L2_CID_USER_DW100_BASE + 1)
>>>> +
>>>> +#endif
>>
> 
