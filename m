Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB9636051F
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 11:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhDOJBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 05:01:13 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com ([40.107.20.91]:45219
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231732AbhDOJBM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 05:01:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFByHnZ+6WuvTZ37kU6EGrhXvmkDOzjrH2njJ4KoYYKNNsJ7gjqZChoVXzV6sx53OYCw8I96GdqwbVUcAFwlicyodx5zkF4CmMgZH0Urj2RRn8DfLBFz1TzFmojsgIuG6tiXRiTSxMNj/8K/w/Hez6nShKBUWsxmNy/Hi9hZa9IQbtfzK3/io95RmfttC6JOoD8k0acCn6mhNG+j+ylJNyA9Y7SugRKxpDHZfV0PGny56ILXAyXbEQu9FnUYSvStg8gwWDdw7aGu7Vvv4TtNylep3Qs8USjLydhz8bKkYaOYQd70OJK5aLmHE+1VycTNhsHgANxpsYB938fvo/GzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot3bPCtYS4VCSpIZPNaqqOvabrI4KYsxlIxV4SKrjQQ=;
 b=fnKaz53R8XRPkkeDzqH8RKEFLW9e19aSY5HceCLZpGk5rvdCN7QMTCodGYahOGD+1Fmr2yIpGDk8RhTc+bqz6DYVhW5PknRYj0CJQSLn75NuHt8jOTbVOJFpRbCBJxlmd2VVwQs8FhyAGH+ktSDebZnpJ1VJboNUHMbae24VB7WhcYqBwIt9TgWERnFm65ZQAQ1SQKWWuw1JG3YAbY98kGJ0aeHol/rcBp4G0umdjcYJrFJ1DZDrQEK6qwYxnbS1t1YLuoxvKEJUU1ymi1SsWbDIgiug+uNdw9RepY1SE/k3aGSRvv/64B1aVF8kVsHA2kdRpOxihBGMT1AtlE8X5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot3bPCtYS4VCSpIZPNaqqOvabrI4KYsxlIxV4SKrjQQ=;
 b=lR15cBz4wnWYkvUpb/OZJ0F7FkzuWXEY+zt/s1YPvowlhOZhcL8vmY79KtiGoYpfcq5CQSYBJ/4x8Uqw3xWFxGsJb0eQPI5tIMp92MRffZ/aEvvqybqdqUXtgwqLdZPIiB+leT7TraFbO6QguOsNDRmZxJmfuNYXJ1jFAOxWzpY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM9PR10MB4322.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:26b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 09:00:48 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:00:47 +0000
Subject: Re: [PATCH v2 00/77] media: imx: Miscellaneous fixes and cleanups for
 i.MX7
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <268621a5-03ab-4cd9-d95a-bf5b6a4b4f7b@kontron.de>
 <YFP+GH+3sS0cdd2R@pendragon.ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <ed2480a0-7950-64d2-6490-d2d7dab1bbfe@kontron.de>
Date:   Thu, 15 Apr 2021 11:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YFP+GH+3sS0cdd2R@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [46.142.74.26]
X-ClientProxiedBy: AM0PR04CA0140.eurprd04.prod.outlook.com
 (2603:10a6:208:55::45) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (46.142.74.26) by AM0PR04CA0140.eurprd04.prod.outlook.com (2603:10a6:208:55::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 09:00:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16b925c3-3ac5-4c66-55fa-08d8ffecf5d9
X-MS-TrafficTypeDiagnostic: AM9PR10MB4322:
X-Microsoft-Antispam-PRVS: <AM9PR10MB432276864ED7CFDDA9C7E43EE94D9@AM9PR10MB4322.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BPxiz2CjeKBhPEgrW4oY6ajyr/2kGWHhGsQD+XVPdGHD9mUvqCDcq2orSZ6EDq4qCGBzc0DeVo67UPLZYBSG6ZFwz3Ve4IzrHJYQUMETysLFdE2uvvuakS7zAj83FvFU9gvFtruoYqTDFm0gbPwdsJmGNYsFXVQo9Rz3Ie3siw6vJT2fCtinHnj+P9DoUVS3Qa3MgesrAZ7hp8fM2IPnzYilcpwalM7wHGBspPw0LgzOMUDNRLdO4hqp09V+ZYeFbXZbFc41DBTrA711jF0qUNfrdfBoyRO4XjgZGrk2RD0A9VfVF9DdnBjhgOyLJZWMJpIWFJkmZfmBaWPj3DkhTQA2njLjOBFOXBVKfRMFPnqrPIpQYuB42FIl7mExO2wpn5OEzgeWSv+SagVbqdLWfO57RZ9wW8Hi4yZSQKQbbV3U3YJAFkFxp2UomzojwsQzxF2CMSQf6B/Xq4yBhyZW1cfVt/SZzg4sAGc2Mj+G9EimaBvXBDEmUg/SdfKsde2tmDvvFb69tyivSvOlsrMnC/L0NBdVdCbk2TMvNZSJeHu0s1qUKYjmD4v8dSu2U5mFvS35rGwdPxWuMhT90NkeEgjQlvP6p2mx75SjeCTnuQ2+dCb1ww0WRXsWik3nIGRQTL2JzF8riN5iPYdQ7CFmcjA4xORgOD6c0BxhONN6KZbJqu1ZvCQb2/8g/FiKe+A1nzbngQF/MOtvFzZERMLAwVRQBXy4nrKtQiX6hszy4C5TwlmbT4aRCC63dr4cBOl2RLGaEwxBjzcs/I7uM7xFIn2KM4HsR7t/rx37UIhBdWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(38100700002)(52116002)(5660300002)(66556008)(66946007)(53546011)(8676002)(4326008)(66476007)(478600001)(966005)(38350700002)(2616005)(54906003)(6486002)(316002)(31696002)(8936002)(86362001)(83380400001)(26005)(16526019)(2906002)(6916009)(956004)(186003)(44832011)(16576012)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djJiVjNiczU0MHhCaEQ0d21CR0xTUnpNekkxY1BxNXAwck1SMDdYOTgzOWVF?=
 =?utf-8?B?QWhCbUVhOHNlTGxmWnV3cTZFR1QrMkxidnFVU0J2OUhlVWFjdnFtR3YySWpq?=
 =?utf-8?B?dUtHdUZIMTUrUTJQbEJMcDQwWHhLOHJXenNTcXBSRGo2QlhZQTUyUnkrQld2?=
 =?utf-8?B?cmozZWdtUTRvdncySDRUU09jZk14VDg2RzI2bjJIaVZwcmRqb1ZDeUlGRnlm?=
 =?utf-8?B?YkJMSTBFZHJDRk1aZ3BSWDlTU3VZZDh6dzBMS2FOMFpBZE1QRUR3Y1EzcG5l?=
 =?utf-8?B?KzBZVWlnYUt4N0JWZVI5VFd0SEJCbnYzZ0pERU9vRWhMQ2EwczZwcVEzeXdS?=
 =?utf-8?B?YWFvc1JURUtxck5HNDZhYjZSQk1hUWNWbnNsVnhtUnhIWjhmYnA4Sk84S2FO?=
 =?utf-8?B?ZDJVdDNmNzlaUlJoYUhtSWhRRDdtK09nais5QVRSQ0VFbHFjSGFCdTJWdmYx?=
 =?utf-8?B?NzZTenRTcW51REdKQkczc3lRaktJNUhKWnI4V3hZTGJZQWUybDJtZFc4eW5Y?=
 =?utf-8?B?OXRrbWtUa1MxZnBlcEpSZmh2THpmb0dQRlRxUFJvWW1UL1BFcnhRcEJNcHBm?=
 =?utf-8?B?UnRqUmJFVE55elQ5bVg5NStPazR6ajNVb2o0RnhZN2lLUkpoNkkwMnNPT0hE?=
 =?utf-8?B?M1p2bXJpVHNyMGEzUzJXTzlRazE1eXFuSzhSMTJpRjZydGJtcndja29JaTBG?=
 =?utf-8?B?c0tEaTNGWklrOHFnTXYvTll5ME0yOHdPUlAvUTdjL0UveHJ3VlREQ09WMXVt?=
 =?utf-8?B?WGh0ZzkyZVB1Nmp4MzMxRDRrWEg2eUY2OHlIR1g1MWtOeXBURTRGR1R4LzVO?=
 =?utf-8?B?RTZ6NFFZeW91MEFabEFIYWdPUXYxMEYxWlQydTIyQktCV1BKNERzUk9Zc0hS?=
 =?utf-8?B?TXlhK2xDWVpFei9wdUVVc3gzUS9relNrUE91NHRpYUh0RkZRMTRGalVVSGZ1?=
 =?utf-8?B?MCs3a2RyeWNpL0lybXpHSndVSy9UaUlHNlVNYzJQRnpSTnRaYU9qcFRlQmE5?=
 =?utf-8?B?dklFQmI5QUMrcWNMWHdXWTJNL2ppT3FkZTh1MGpxK25DVkthR3d3U1dmRm13?=
 =?utf-8?B?d3pkdVpIYkVzNmNJRnRuMHY5a1lheXJabTJFdGN0RHRadE1wMGR1cktJbEt1?=
 =?utf-8?B?aUJZbjB4SWFmMW1sYWZGRlpqWnRERFVQb3NGOGRDWld4SkN2eFJYY3MvNGVm?=
 =?utf-8?B?Y2k5U1FlTHR5YW9aeVF2d0VSamwxbkhVck9xQTBXM0pVNXpNcWlnSWZTUUln?=
 =?utf-8?B?c0wyTnVSUWlCcW5MYXZZY2JmZ0VILzJIU2thVWorU0w1RXFxanAxa0pTQVMr?=
 =?utf-8?B?aE0yRGtqMFhscUIyWDFWR254ckJRenpvbEJ0a2c3dUpabjh1aHVzU1gyWExx?=
 =?utf-8?B?ZnVFYkdzcytrUDdrbklDcTZtYkc1N2FZZHk1Si9OZTc1anl2cmQrc011WEhn?=
 =?utf-8?B?Rk9VWnFJMWRLc0VoUURiUXhFYjU1MEJFbExkdmowRFhya1N0QWttR0MvaXlQ?=
 =?utf-8?B?NEVPVkVoc0hXRnJxQ2E1dHVoL3gyVjZGVklOSlJQcTZFU2lWM1p3Tk5aeThS?=
 =?utf-8?B?T1hhZnFUc0JGblpZWC9Ma3Y3Mm01bDJ2OHJHWG9WeDB0V3NNUXFJS2hnOTRL?=
 =?utf-8?B?ZUt3NkFTaFlMbEgrTDBTbWZmTElIZURCNFFBbUJobEttQjBzZXFOR2NFNENi?=
 =?utf-8?B?NnpnaFh6WkVEck9TNWZ3bHJwYTBQYys5ZjZUSHNrQ1Jna1A1RUorT0pRUDFC?=
 =?utf-8?Q?NzTTe559I5dAeMtewB96z5CvbN0Nh1Aw+DysUSG?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b925c3-3ac5-4c66-55fa-08d8ffecf5d9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:00:47.7079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: is/RwJEh9lqPqVCXaeZGsfBpeYgwxhkOP5rKIdfYG8kMzUA8gngqEz1I8+GVhvLCkb1yOY2vxvoge+qj1i8UvyC66Sb4foxMJnlRRtxEkcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4322
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 19.03.21 02:27, Laurent Pinchart wrote:
> Hi Frieder,
> 
> On Wed, Mar 17, 2021 at 07:04:19PM +0100, Frieder Schrempf wrote:
>> On 15.02.21 05:26, Laurent Pinchart wrote:
>>> Hello,
>>>
>>> This large patch series is a collection of miscellaneous fixes, cleanups
>>> and enhancements for the i.MX7 camera support. Most notably, it
>>> implements support for the Media Controller API in the driver.
>>>
>>> Compared to v1, review comments have been taken into account, and the
>>> patches have been rebased on top of the DT bindings and latest imx
>>> changes as present in the linux-media tree. Patches 38/77, 39/77, 60/77
>>> and 61/77 are new. For additional information, please see individual
>>> patches.
>>>
>>> I have successfully tested the code on an i.MX6ULL board (with an
>>> MT9M114 sensor), an I.MX7D board (with an IMX296 sensor), and an i.MX8MM
>>> board (with an OV5640 sensor, and additional patches for i.MX8MM
>>> support).
>>
>> First of all, thanks for the great work!
> 
> You're welcome.
> 
>> I'm currently trying to get a setup with CSI + MIPI + ADV7280 working on
>> an i.MX8MM system. Would you mind sharing the additional patches I need
>> for this?
>>
>> I guess you are referring to patches for the MIPI CSIS PHY and the
>> devicetree. Anything else, that I'm missing?
> 
> I've pushed my work in progress patches to
> 
> 	git://linuxtv.org/pinchartl/media.git imx/next
> 
> I haven't tested this on mainline though, as the i.MX8MM board I'm using
> currently requires an NXP BSP.
> 
> For the DT integration, here's what I have in imx8mm.dtsi:
> 
[...]
> 
> Mainline seems to be missing the power domains, so you'll likely have to
> sort this out.
> 

Thanks a lot for the patches. I finally found some time to test this 
with our hardware. I'm working on v5.10 mainline and applied pending 
support for the power-domains from Lucas [1].

It doesn't look bad and I can bring up the media devices, etc. but up to 
now I couldn't get any image from the ADV7280A-M.

This is the first time I'm working with the media/v4l subsystem, so I 
might be missing some trivial things. Also I'm not quite sure if the 
adv7180 driver is currently fully compatible.

Anyway here are some things I noticed. Maybe you could have a quick look 
and see if you can gather something from that, which helps me to get 
this running?

After enabling the link to the adv7180 with:

media-ctl -l "'adv7180 1-0021':0 -> 'imx7-mipi-csis.0':0[1]"

all the links look ok, but not all the parameters seem to be propagated 
up to the subdevs (see [2]). But I don't even know if this should happen 
automatically.

After setting up the format like this, the subdev setup looks ok as far 
as I can judge (see [3]):

media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x240 field:alternate]"
media-ctl -V "'imx7-mipi-csis.0':1 [fmt:UYVY2X8/720x240 field:alternate]"

Also there is one small issue with the adv7180 not implementing neither 
V4L2_CID_LINK_FREQ nor V4L2_CID_PIXEL_RATE. So v4l2_get_link_rate() 
fails, but as this seems to be only used to calculate hs_settle, I just 
hardcoded the hs_settle value for now.

Finally I don't get any image from the analog converter. The stream 
seems to be setup correctly, but I don't receive any frames. Though I 
can see that there is data on the MIPI CSI lanes.

I'm also not quite sure which value to use for the CSI clock-frequency. 
On the clock lane of the CSI interface I can measure something around 
106 MHz coming from the ADV7280.

Maybe you got some pointers for me to look at?

Thanks
Frieder

[1] 
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201105174434.1817539-1-l.stach@pengutronix.de/
[2] https://paste.ee/p/HuIfu
[3] https://paste.ee/p/os6dU
