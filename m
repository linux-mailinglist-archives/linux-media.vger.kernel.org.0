Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCB06A1874
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 10:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjBXJDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 04:03:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjBXJDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 04:03:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497EB2D4B
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 01:02:50 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EEDF2E4;
        Fri, 24 Feb 2023 10:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677229368;
        bh=haoKZnLMdADBE2dapd4wMDgPitGOsyCq853s3h/CHkQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qbjXu+AwpwdEffUCg9vQfp0/RTSYcUNvUSyXfnzgkDob8E2UeNwU3xAIDJ9Ud1+EA
         ekcFtT8lkkReVimBdE6VTUXeUs9/B6nLV+Imk32NH7djqNnLoSQ3ER1XSY2AyAHwGK
         viOaoNWvIc4ttVn93xh8BhQmU2zHdcca6UAWfEMI=
Content-Type: multipart/mixed; boundary="------------AyWBC307p0SQ8Hb9i7qM1pzF"
Message-ID: <49b1eca2-8997-0ff1-3151-d9656ef16fb8@ideasonboard.com>
Date:   Fri, 24 Feb 2023 11:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/3] media: ti: cal: Add support for 1X16 mbus formats
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-2-tomi.valkeinen@ideasonboard.com>
 <20230223171021.ukttr2xwcuxlzdzu@uno.localdomain>
 <bca4cd33-eb4a-693f-5663-365459d89cc7@ideasonboard.com>
 <20230223180325.zicvisvqf6vv3ypa@uno.localdomain>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230223180325.zicvisvqf6vv3ypa@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URI_HEX autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------AyWBC307p0SQ8Hb9i7qM1pzF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/02/2023 20:03, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Thu, Feb 23, 2023 at 07:52:48PM +0200, Tomi Valkeinen wrote:
>> On 23/02/2023 19:10, Jacopo Mondi wrote:
>>> Hi Tomi
>>>
>>> On Wed, Feb 22, 2023 at 02:56:28PM +0200, Tomi Valkeinen wrote:
>>>> For legacy reasons the CAL driver uses 2X8 mbus formats for the CSI-2
>>>> link (e.g. MEDIA_BUS_FMT_YUYV8_2X8). 1X16 formats are more correct and
>>>> used by many drivers, so add 1X16 support to CAL.
>>>>
>>>> We keep the 2X8 formats for backward compatibility.
>>>
>>> Eh, this is the usual question about what we should consider a
>>> to be a userspace breakage or not.
>>>
>>> I presume the reason to maintain 2X8 formats is (assuming the CAL
>>> interface is CSI-2 only, right ?) because sensor drivers that only
>>> support 2X8 formats will then fail to link_validate() if you remove
>>
>> Yes.
>>
>>> all 2X8 formats here. I'm of the opinion that we should bite the
>>> bullet and move to 1X16. If any driver that used to work with CAL now
>>> breaks, the sensor driver will have to be fixed.
>>>
>>> In my humble experience, that's what we did with the ov5640 sensor. We
>>
>> Yes, you did.
>>
>>> removed the 2X8 formats in CSI-2 mode and some platform driver broke
>>> and then had been fixed (it happened in the same release cycle), win win.
>>
>> No, CAL is still broken =). OV5640 is the only sensor I have. I just haven't
>> had time to look at this and fix it (and no one has complained).
>>
> 
> Ups, I was thinking at the ST and microchip receivers, I thought CAL
> was fixed already :)
> 
> See ? win win (almost)
> 
>>> I know it's controversial, let's see what others think.
>>
>> I'm all for dropping the 2X8 formats, if that's the consensus. It would keep
>> the driver simpler, as we could keep the 1:1 relationship between pixel
>> formats and mbus codes.
>>
>> I'll look at your other comments tomorrow.
>>
> 
> And I'll look at your last patch tomorrow if I can get a media graph
> dump!

I have attached the txt and dot versions of the graph of my FPDLink 
setup with three cameras (MC mode with streams).

Some clarifications, which may not be obvious:

The current upstream driver supports two distinct modes, non-MC (legacy) 
and MC modes, selectable with the cal_mc_api module parameter. 
Supporting the legacy mode does make the driver rather confusing in some 
areas...

With this series, the non-MC mode is unchanged, but the MC mode will be 
extended to support streams.

The non-MC mode (afaics, I have never much used it) only supports a 
simple setup with a single sensor subdevice connected directly to CAL. 
As we don't have MC, the subdevice is not visible to the userspace, and 
thus the CAL driver does tricks like collects the controls from the 
sensor, and exposes them from CAL's video node.

And this is why we have two sets of ioctl ops in cal-video.c, 
cal_ioctl_legacy_ops and cal_ioctl_mc_ops, as the behavior is quite 
different between the two modes.

Describing this makes me wonder if the non-MC mode could be dropped... 
MC mode has been supported for some years now.

  Tomi

--------------AyWBC307p0SQ8Hb9i7qM1pzF
Content-Type: application/msword-template; name="graph.dot"
Content-Disposition: attachment; filename="graph.dot"
Content-Transfer-Encoding: base64

ZGlncmFwaCBib2FyZCB7CglyYW5rZGlyPVRCCgluMDAwMDAwMDEgW2xhYmVsPSJ7ezxwb3J0
MD4gMH0gfCBDQU1FUkFSWDBcbi9kZXYvdjRsLXN1YmRldjAgfCB7PHBvcnQxPiAxIHwgPHBv
cnQyPiAyIHwgPHBvcnQzPiAzIHwgPHBvcnQ0PiA0IHwgPHBvcnQ1PiA1IHwgPHBvcnQ2PiA2
IHwgPHBvcnQ3PiA3IHwgPHBvcnQ4PiA4fX0iLCBzaGFwZT1NcmVjb3JkLCBzdHlsZT1maWxs
ZWQsIGZpbGxjb2xvcj1ncmVlbl0KCW4wMDAwMDAwMTpwb3J0MSAtPiBuMDAwMDAwMzkKCW4w
MDAwMDAwMTpwb3J0MiAtPiBuMDAwMDAwMzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpw
b3J0MyAtPiBuMDAwMDAwMzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NCAtPiBu
MDAwMDAwMzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NSAtPiBuMDAwMDAwMzkg
W3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NiAtPiBuMDAwMDAwMzkgW3N0eWxlPWRh
c2hlZF0KCW4wMDAwMDAwMTpwb3J0NyAtPiBuMDAwMDAwMzkgW3N0eWxlPWRhc2hlZF0KCW4w
MDAwMDAwMTpwb3J0OCAtPiBuMDAwMDAwMzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpw
b3J0MSAtPiBuMDAwMDAwNWQgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MiAtPiBu
MDAwMDAwNWQKCW4wMDAwMDAwMTpwb3J0MyAtPiBuMDAwMDAwNWQgW3N0eWxlPWRhc2hlZF0K
CW4wMDAwMDAwMTpwb3J0NCAtPiBuMDAwMDAwNWQgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAw
MTpwb3J0NSAtPiBuMDAwMDAwNWQgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NiAt
PiBuMDAwMDAwNWQgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NyAtPiBuMDAwMDAw
NWQgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0OCAtPiBuMDAwMDAwNWQgW3N0eWxl
PWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MSAtPiBuMDAwMDAwODEgW3N0eWxlPWRhc2hlZF0K
CW4wMDAwMDAwMTpwb3J0MiAtPiBuMDAwMDAwODEgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAw
MTpwb3J0MyAtPiBuMDAwMDAwODEKCW4wMDAwMDAwMTpwb3J0NCAtPiBuMDAwMDAwODEgW3N0
eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NSAtPiBuMDAwMDAwODEgW3N0eWxlPWRhc2hl
ZF0KCW4wMDAwMDAwMTpwb3J0NiAtPiBuMDAwMDAwODEgW3N0eWxlPWRhc2hlZF0KCW4wMDAw
MDAwMTpwb3J0NyAtPiBuMDAwMDAwODEgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0
OCAtPiBuMDAwMDAwODEgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MSAtPiBuMDAw
MDAwYTUgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MiAtPiBuMDAwMDAwYTUgW3N0
eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MyAtPiBuMDAwMDAwYTUgW3N0eWxlPWRhc2hl
ZF0KCW4wMDAwMDAwMTpwb3J0NCAtPiBuMDAwMDAwYTUgW3N0eWxlPWRhc2hlZF0KCW4wMDAw
MDAwMTpwb3J0NSAtPiBuMDAwMDAwYTUgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0
NiAtPiBuMDAwMDAwYTUgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NyAtPiBuMDAw
MDAwYTUgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0OCAtPiBuMDAwMDAwYTUgW3N0
eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MSAtPiBuMDAwMDAwYzkgW3N0eWxlPWRhc2hl
ZF0KCW4wMDAwMDAwMTpwb3J0MiAtPiBuMDAwMDAwYzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAw
MDAwMTpwb3J0MyAtPiBuMDAwMDAwYzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0
NCAtPiBuMDAwMDAwYzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NSAtPiBuMDAw
MDAwYzkKCW4wMDAwMDAwMTpwb3J0NiAtPiBuMDAwMDAwYzkgW3N0eWxlPWRhc2hlZF0KCW4w
MDAwMDAwMTpwb3J0NyAtPiBuMDAwMDAwYzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpw
b3J0OCAtPiBuMDAwMDAwYzkgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MSAtPiBu
MDAwMDAwZWQgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MiAtPiBuMDAwMDAwZWQg
W3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MyAtPiBuMDAwMDAwZWQgW3N0eWxlPWRh
c2hlZF0KCW4wMDAwMDAwMTpwb3J0NCAtPiBuMDAwMDAwZWQgW3N0eWxlPWRhc2hlZF0KCW4w
MDAwMDAwMTpwb3J0NSAtPiBuMDAwMDAwZWQgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpw
b3J0NiAtPiBuMDAwMDAwZWQKCW4wMDAwMDAwMTpwb3J0NyAtPiBuMDAwMDAwZWQgW3N0eWxl
PWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0OCAtPiBuMDAwMDAwZWQgW3N0eWxlPWRhc2hlZF0K
CW4wMDAwMDAwMTpwb3J0MSAtPiBuMDAwMDAxMTEgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAw
MTpwb3J0MiAtPiBuMDAwMDAxMTEgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MyAt
PiBuMDAwMDAxMTEgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NCAtPiBuMDAwMDAx
MTEgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NSAtPiBuMDAwMDAxMTEgW3N0eWxl
PWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NiAtPiBuMDAwMDAxMTEgW3N0eWxlPWRhc2hlZF0K
CW4wMDAwMDAwMTpwb3J0NyAtPiBuMDAwMDAxMTEKCW4wMDAwMDAwMTpwb3J0OCAtPiBuMDAw
MDAxMTEgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MSAtPiBuMDAwMDAxMzUgW3N0
eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0MiAtPiBuMDAwMDAxMzUgW3N0eWxlPWRhc2hl
ZF0KCW4wMDAwMDAwMTpwb3J0MyAtPiBuMDAwMDAxMzUgW3N0eWxlPWRhc2hlZF0KCW4wMDAw
MDAwMTpwb3J0NCAtPiBuMDAwMDAxMzUgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0
NSAtPiBuMDAwMDAxMzUgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NiAtPiBuMDAw
MDAxMzUgW3N0eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0NyAtPiBuMDAwMDAxMzUgW3N0
eWxlPWRhc2hlZF0KCW4wMDAwMDAwMTpwb3J0OCAtPiBuMDAwMDAxMzUgW3N0eWxlPWRhc2hl
ZF0KCW4wMDAwMDAwYiBbbGFiZWw9Int7PHBvcnQwPiAwfSB8IENBTUVSQVJYMVxuL2Rldi92
NGwtc3ViZGV2MSB8IHs8cG9ydDE+IDEgfCA8cG9ydDI+IDIgfCA8cG9ydDM+IDMgfCA8cG9y
dDQ+IDQgfCA8cG9ydDU+IDUgfCA8cG9ydDY+IDYgfCA8cG9ydDc+IDcgfCA8cG9ydDg+IDh9
fSIsIHNoYXBlPU1yZWNvcmQsIHN0eWxlPWZpbGxlZCwgZmlsbGNvbG9yPWdyZWVuXQoJbjAw
MDAwMDBiOnBvcnQxIC0+IG4wMDAwMDAzOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQyIC0+IG4wMDAwMDAzOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQzIC0+IG4w
MDAwMDAzOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ0IC0+IG4wMDAwMDAzOSBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ1IC0+IG4wMDAwMDAzOSBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQ2IC0+IG4wMDAwMDAzOSBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQ3IC0+IG4wMDAwMDAzOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQ4IC0+IG4wMDAwMDAzOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQxIC0+IG4w
MDAwMDA1ZCBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQyIC0+IG4wMDAwMDA1ZCBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQzIC0+IG4wMDAwMDA1ZCBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQ0IC0+IG4wMDAwMDA1ZCBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQ1IC0+IG4wMDAwMDA1ZCBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQ2IC0+IG4wMDAwMDA1ZCBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ3IC0+IG4w
MDAwMDA1ZCBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ4IC0+IG4wMDAwMDA1ZCBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQxIC0+IG4wMDAwMDA4MSBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQyIC0+IG4wMDAwMDA4MSBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQzIC0+IG4wMDAwMDA4MSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQ0IC0+IG4wMDAwMDA4MSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ1IC0+IG4w
MDAwMDA4MSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ2IC0+IG4wMDAwMDA4MSBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ3IC0+IG4wMDAwMDA4MSBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQ4IC0+IG4wMDAwMDA4MSBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQxIC0+IG4wMDAwMDBhNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQyIC0+IG4wMDAwMDBhNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQzIC0+IG4w
MDAwMDBhNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ0IC0+IG4wMDAwMDBhNSBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ1IC0+IG4wMDAwMDBhNSBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQ2IC0+IG4wMDAwMDBhNSBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQ3IC0+IG4wMDAwMDBhNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQ4IC0+IG4wMDAwMDBhNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQxIC0+IG4w
MDAwMDBjOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQyIC0+IG4wMDAwMDBjOSBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQzIC0+IG4wMDAwMDBjOSBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQ0IC0+IG4wMDAwMDBjOSBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQ1IC0+IG4wMDAwMDBjOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQ2IC0+IG4wMDAwMDBjOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ3IC0+IG4w
MDAwMDBjOSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ4IC0+IG4wMDAwMDBjOSBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQxIC0+IG4wMDAwMDBlZCBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQyIC0+IG4wMDAwMDBlZCBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQzIC0+IG4wMDAwMDBlZCBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQ0IC0+IG4wMDAwMDBlZCBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ1IC0+IG4w
MDAwMDBlZCBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ2IC0+IG4wMDAwMDBlZCBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ3IC0+IG4wMDAwMDBlZCBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQ4IC0+IG4wMDAwMDBlZCBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQxIC0+IG4wMDAwMDExMSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQyIC0+IG4wMDAwMDExMSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQzIC0+IG4w
MDAwMDExMSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ0IC0+IG4wMDAwMDExMSBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ1IC0+IG4wMDAwMDExMSBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQ2IC0+IG4wMDAwMDExMSBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQ3IC0+IG4wMDAwMDExMSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQ4IC0+IG4wMDAwMDExMSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQxIC0+IG4w
MDAwMDEzNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQyIC0+IG4wMDAwMDEzNSBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQzIC0+IG4wMDAwMDEzNSBbc3R5bGU9ZGFz
aGVkXQoJbjAwMDAwMDBiOnBvcnQ0IC0+IG4wMDAwMDEzNSBbc3R5bGU9ZGFzaGVkXQoJbjAw
MDAwMDBiOnBvcnQ1IC0+IG4wMDAwMDEzNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBv
cnQ2IC0+IG4wMDAwMDEzNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ3IC0+IG4w
MDAwMDEzNSBbc3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDBiOnBvcnQ4IC0+IG4wMDAwMDEzNSBb
c3R5bGU9ZGFzaGVkXQoJbjAwMDAwMDE1IFtsYWJlbD0ie3s8cG9ydDA+IDAgfCA8cG9ydDE+
IDEgfCA8cG9ydDI+IDIgfCA8cG9ydDM+IDN9IHwgZHM5MHViOTYwIDQtMDAzZFxuL2Rldi92
NGwtc3ViZGV2MiB8IHs8cG9ydDQ+IDQgfCA8cG9ydDU+IDV9fSIsIHNoYXBlPU1yZWNvcmQs
IHN0eWxlPWZpbGxlZCwgZmlsbGNvbG9yPWdyZWVuXQoJbjAwMDAwMDE1OnBvcnQ0IC0+IG4w
MDAwMDAwMTpwb3J0MCBbc3R5bGU9Ym9sZF0KCW4wMDAwMDAxZSBbbGFiZWw9Int7PHBvcnQw
PiAwfSB8IGRzOTB1YjkxM2EgNC0wMDQ2XG4vZGV2L3Y0bC1zdWJkZXYzIHwgezxwb3J0MT4g
MX19Iiwgc2hhcGU9TXJlY29yZCwgc3R5bGU9ZmlsbGVkLCBmaWxsY29sb3I9Z3JlZW5dCglu
MDAwMDAwMWU6cG9ydDEgLT4gbjAwMDAwMDE1OnBvcnQyIFtzdHlsZT1ib2xkXQoJbjAwMDAw
MDIzIFtsYWJlbD0ie3s8cG9ydDA+IDB9IHwgZHM5MHViOTUzIDQtMDA0NVxuL2Rldi92NGwt
c3ViZGV2NCB8IHs8cG9ydDE+IDF9fSIsIHNoYXBlPU1yZWNvcmQsIHN0eWxlPWZpbGxlZCwg
ZmlsbGNvbG9yPWdyZWVuXQoJbjAwMDAwMDIzOnBvcnQxIC0+IG4wMDAwMDAxNTpwb3J0MSBb
c3R5bGU9Ym9sZF0KCW4wMDAwMDAyOCBbbGFiZWw9Int7PHBvcnQwPiAwfSB8IGRzOTB1Yjk1
MyA0LTAwNDRcbi9kZXYvdjRsLXN1YmRldjUgfCB7PHBvcnQxPiAxfX0iLCBzaGFwZT1NcmVj
b3JkLCBzdHlsZT1maWxsZWQsIGZpbGxjb2xvcj1ncmVlbl0KCW4wMDAwMDAyODpwb3J0MSAt
PiBuMDAwMDAwMTU6cG9ydDAgW3N0eWxlPWJvbGRdCgluMDAwMDAwMmQgW2xhYmVsPSJ7e30g
fCBpbXgzOTAgNS0wMDIxXG4vZGV2L3Y0bC1zdWJkZXY2IHwgezxwb3J0MD4gMH19Iiwgc2hh
cGU9TXJlY29yZCwgc3R5bGU9ZmlsbGVkLCBmaWxsY29sb3I9Z3JlZW5dCgluMDAwMDAwMmQ6
cG9ydDAgLT4gbjAwMDAwMDI4OnBvcnQwIFtzdHlsZT1ib2xkXQoJbjAwMDAwMDMxIFtsYWJl
bD0ie3t9IHwgaW14MzkwIDYtMDAyMVxuL2Rldi92NGwtc3ViZGV2NyB8IHs8cG9ydDA+IDB9
fSIsIHNoYXBlPU1yZWNvcmQsIHN0eWxlPWZpbGxlZCwgZmlsbGNvbG9yPWdyZWVuXQoJbjAw
MDAwMDMxOnBvcnQwIC0+IG4wMDAwMDAyMzpwb3J0MCBbc3R5bGU9Ym9sZF0KCW4wMDAwMDAz
NSBbbGFiZWw9Int7fSB8IG92MTA2MzUgNy0wMDMwXG4vZGV2L3Y0bC1zdWJkZXY4IHwgezxw
b3J0MD4gMH19Iiwgc2hhcGU9TXJlY29yZCwgc3R5bGU9ZmlsbGVkLCBmaWxsY29sb3I9Z3Jl
ZW5dCgluMDAwMDAwMzU6cG9ydDAgLT4gbjAwMDAwMDFlOnBvcnQwIFtzdHlsZT1ib2xkXQoJ
bjAwMDAwMDM5IFtsYWJlbD0iQ0FMIG91dHB1dCAwXG4vZGV2L3ZpZGVvMCIsIHNoYXBlPWJv
eCwgc3R5bGU9ZmlsbGVkLCBmaWxsY29sb3I9eWVsbG93XQoJbjAwMDAwMDVkIFtsYWJlbD0i
Q0FMIG91dHB1dCAxXG4vZGV2L3ZpZGVvMSIsIHNoYXBlPWJveCwgc3R5bGU9ZmlsbGVkLCBm
aWxsY29sb3I9eWVsbG93XQoJbjAwMDAwMDgxIFtsYWJlbD0iQ0FMIG91dHB1dCAyXG4vZGV2
L3ZpZGVvMiIsIHNoYXBlPWJveCwgc3R5bGU9ZmlsbGVkLCBmaWxsY29sb3I9eWVsbG93XQoJ
bjAwMDAwMGE1IFtsYWJlbD0iQ0FMIG91dHB1dCAzXG4vZGV2L3ZpZGVvMyIsIHNoYXBlPWJv
eCwgc3R5bGU9ZmlsbGVkLCBmaWxsY29sb3I9eWVsbG93XQoJbjAwMDAwMGM5IFtsYWJlbD0i
Q0FMIG91dHB1dCA0XG4vZGV2L3ZpZGVvNCIsIHNoYXBlPWJveCwgc3R5bGU9ZmlsbGVkLCBm
aWxsY29sb3I9eWVsbG93XQoJbjAwMDAwMGVkIFtsYWJlbD0iQ0FMIG91dHB1dCA1XG4vZGV2
L3ZpZGVvNSIsIHNoYXBlPWJveCwgc3R5bGU9ZmlsbGVkLCBmaWxsY29sb3I9eWVsbG93XQoJ
bjAwMDAwMTExIFtsYWJlbD0iQ0FMIG91dHB1dCA2XG4vZGV2L3ZpZGVvNiIsIHNoYXBlPWJv
eCwgc3R5bGU9ZmlsbGVkLCBmaWxsY29sb3I9eWVsbG93XQoJbjAwMDAwMTM1IFtsYWJlbD0i
Q0FMIG91dHB1dCA3XG4vZGV2L3ZpZGVvNyIsIHNoYXBlPWJveCwgc3R5bGU9ZmlsbGVkLCBm
aWxsY29sb3I9eWVsbG93XQp9Cg==
--------------AyWBC307p0SQ8Hb9i7qM1pzF
Content-Type: text/plain; charset=UTF-8; name="graph.txt"
Content-Disposition: attachment; filename="graph.txt"
Content-Transfer-Encoding: base64

TWVkaWEgY29udHJvbGxlciBBUEkgdmVyc2lvbiA2LjIuMAoKTWVkaWEgZGV2aWNlIGluZm9y
bWF0aW9uCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkcml2ZXIgICAgICAgICAgY2FsCm1v
ZGVsICAgICAgICAgICBDQUwKc2VyaWFsICAgICAgICAgIApidXMgaW5mbyAgICAgICAgcGxh
dGZvcm06NDg5YjAwMDAuY2FsCmh3IHJldmlzaW9uICAgICAweDQwMDAwMzAwCmRyaXZlciB2
ZXJzaW9uICA2LjIuMAoKRGV2aWNlIHRvcG9sb2d5Ci0gZW50aXR5IDE6IENBTUVSQVJYMCAo
OSBwYWRzLCA2NSBsaW5rcywgMCByb3V0ZSkKICAgICAgICAgICAgdHlwZSBWNEwyIHN1YmRl
diBzdWJ0eXBlIFVua25vd24gZmxhZ3MgMAogICAgICAgICAgICBkZXZpY2Ugbm9kZSBuYW1l
IC9kZXYvdjRsLXN1YmRldjAKCXBhZDA6IFNpbmsKCQlbc3RyZWFtOjAgZm10OlNSR0dCMTJf
MVgxMi8xOTM2eDExMDAgZmllbGQ6bm9uZSBjb2xvcnNwYWNlOnNyZ2IgeGZlcjpzcmdiIHlj
YmNyOjYwMSBxdWFudGl6YXRpb246bGltLXJhbmdlXQoJCTwtICJkczkwdWI5NjAgNC0wMDNk
Ijo0IFtFTkFCTEVELElNTVVUQUJMRV0KCXBhZDE6IFNvdXJjZQoJCVtzdHJlYW06MCBmbXQ6
U1JHR0IxMl8xWDEyLzE5MzZ4MTEwMCBmaWVsZDpub25lIGNvbG9yc3BhY2U6c3JnYiB4ZmVy
OnNyZ2IgeWNiY3I6NjAxIHF1YW50aXphdGlvbjpsaW0tcmFuZ2VdCgkJLT4gIkNBTCBvdXRw
dXQgMCI6MCBbRU5BQkxFRF0KCQktPiAiQ0FMIG91dHB1dCAxIjowIFtdCgkJLT4gIkNBTCBv
dXRwdXQgMiI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDMiOjAgW10KCQktPiAiQ0FMIG91dHB1
dCA0IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNSI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDYi
OjAgW10KCQktPiAiQ0FMIG91dHB1dCA3IjowIFtdCglwYWQyOiBTb3VyY2UKCQlbc3RyZWFt
OjAgZm10OlNSR0dCMTJfMVgxMi8xOTM2eDExMDAgZmllbGQ6bm9uZSBjb2xvcnNwYWNlOnNy
Z2IgeGZlcjpzcmdiIHljYmNyOjYwMSBxdWFudGl6YXRpb246bGltLXJhbmdlXQoJCS0+ICJD
QUwgb3V0cHV0IDAiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAxIjowIFtFTkFCTEVEXQoJCS0+
ICJDQUwgb3V0cHV0IDIiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAzIjowIFtdCgkJLT4gIkNB
TCBvdXRwdXQgNCI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDUiOjAgW10KCQktPiAiQ0FMIG91
dHB1dCA2IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNyI6MCBbXQoJcGFkMzogU291cmNlCgkJ
W3N0cmVhbTowIGZtdDpVWVZZOF8xWDE2LzEyODB4NzIwIGZpZWxkOm5vbmUgY29sb3JzcGFj
ZTpzcmdiIHhmZXI6c3JnYiB5Y2Jjcjo2MDEgcXVhbnRpemF0aW9uOmxpbS1yYW5nZV0KCQkt
PiAiQ0FMIG91dHB1dCAwIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMSI6MCBbXQoJCS0+ICJD
QUwgb3V0cHV0IDIiOjAgW0VOQUJMRURdCgkJLT4gIkNBTCBvdXRwdXQgMyI6MCBbXQoJCS0+
ICJDQUwgb3V0cHV0IDQiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA1IjowIFtdCgkJLT4gIkNB
TCBvdXRwdXQgNiI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDciOjAgW10KCXBhZDQ6IFNvdXJj
ZQoJCS0+ICJDQUwgb3V0cHV0IDAiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAxIjowIFtdCgkJ
LT4gIkNBTCBvdXRwdXQgMiI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDMiOjAgW10KCQktPiAi
Q0FMIG91dHB1dCA0IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNSI6MCBbXQoJCS0+ICJDQUwg
b3V0cHV0IDYiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA3IjowIFtdCglwYWQ1OiBTb3VyY2UK
CQlbc3RyZWFtOjAgZm10OnVua25vd24vMTkzNngxIGZpZWxkOm5vbmUgY29sb3JzcGFjZTpz
cmdiIHhmZXI6c3JnYiB5Y2Jjcjo2MDEgcXVhbnRpemF0aW9uOmxpbS1yYW5nZV0KCQktPiAi
Q0FMIG91dHB1dCAwIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMSI6MCBbXQoJCS0+ICJDQUwg
b3V0cHV0IDIiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAzIjowIFtdCgkJLT4gIkNBTCBvdXRw
dXQgNCI6MCBbRU5BQkxFRF0KCQktPiAiQ0FMIG91dHB1dCA1IjowIFtdCgkJLT4gIkNBTCBv
dXRwdXQgNiI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDciOjAgW10KCXBhZDY6IFNvdXJjZQoJ
CVtzdHJlYW06MCBmbXQ6dW5rbm93bi8xOTM2eDEgZmllbGQ6bm9uZSBjb2xvcnNwYWNlOnNy
Z2IgeGZlcjpzcmdiIHljYmNyOjYwMSBxdWFudGl6YXRpb246bGltLXJhbmdlXQoJCS0+ICJD
QUwgb3V0cHV0IDAiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAxIjowIFtdCgkJLT4gIkNBTCBv
dXRwdXQgMiI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDMiOjAgW10KCQktPiAiQ0FMIG91dHB1
dCA0IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNSI6MCBbRU5BQkxFRF0KCQktPiAiQ0FMIG91
dHB1dCA2IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNyI6MCBbXQoJcGFkNzogU291cmNlCgkJ
W3N0cmVhbTowIGZtdDp1bmtub3duLzEyODB4MSBmaWVsZDpub25lIGNvbG9yc3BhY2U6c3Jn
YiB4ZmVyOnNyZ2IgeWNiY3I6NjAxIHF1YW50aXphdGlvbjpsaW0tcmFuZ2VdCgkJLT4gIkNB
TCBvdXRwdXQgMCI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDEiOjAgW10KCQktPiAiQ0FMIG91
dHB1dCAyIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMyI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0
IDQiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA1IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNiI6
MCBbRU5BQkxFRF0KCQktPiAiQ0FMIG91dHB1dCA3IjowIFtdCglwYWQ4OiBTb3VyY2UKCQkt
PiAiQ0FMIG91dHB1dCAwIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMSI6MCBbXQoJCS0+ICJD
QUwgb3V0cHV0IDIiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAzIjowIFtdCgkJLT4gIkNBTCBv
dXRwdXQgNCI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDUiOjAgW10KCQktPiAiQ0FMIG91dHB1
dCA2IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNyI6MCBbXQoKLSBlbnRpdHkgMTE6IENBTUVS
QVJYMSAoOSBwYWRzLCA2NCBsaW5rcywgMCByb3V0ZSkKICAgICAgICAgICAgIHR5cGUgVjRM
MiBzdWJkZXYgc3VidHlwZSBVbmtub3duIGZsYWdzIDAKICAgICAgICAgICAgIGRldmljZSBu
b2RlIG5hbWUgL2Rldi92NGwtc3ViZGV2MQoJcGFkMDogU2luawoJCVtzdHJlYW06MCBmbXQ6
VVlWWThfMlg4LzY0MHg0ODAgZmllbGQ6bm9uZSBjb2xvcnNwYWNlOnNyZ2IgeGZlcjpzcmdi
IHljYmNyOjYwMSBxdWFudGl6YXRpb246bGltLXJhbmdlXQoJcGFkMTogU291cmNlCgkJW3N0
cmVhbTowIGZtdDpVWVZZOF8yWDgvNjQweDQ4MCBmaWVsZDpub25lIGNvbG9yc3BhY2U6c3Jn
YiB4ZmVyOnNyZ2IgeWNiY3I6NjAxIHF1YW50aXphdGlvbjpsaW0tcmFuZ2VdCgkJLT4gIkNB
TCBvdXRwdXQgMCI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDEiOjAgW10KCQktPiAiQ0FMIG91
dHB1dCAyIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMyI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0
IDQiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA1IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNiI6
MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDciOjAgW10KCXBhZDI6IFNvdXJjZQoJCS0+ICJDQUwg
b3V0cHV0IDAiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAxIjowIFtdCgkJLT4gIkNBTCBvdXRw
dXQgMiI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDMiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA0
IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNSI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDYiOjAg
W10KCQktPiAiQ0FMIG91dHB1dCA3IjowIFtdCglwYWQzOiBTb3VyY2UKCQktPiAiQ0FMIG91
dHB1dCAwIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMSI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0
IDIiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAzIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNCI6
MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDUiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA2IjowIFtd
CgkJLT4gIkNBTCBvdXRwdXQgNyI6MCBbXQoJcGFkNDogU291cmNlCgkJLT4gIkNBTCBvdXRw
dXQgMCI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDEiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAy
IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMyI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDQiOjAg
W10KCQktPiAiQ0FMIG91dHB1dCA1IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNiI6MCBbXQoJ
CS0+ICJDQUwgb3V0cHV0IDciOjAgW10KCXBhZDU6IFNvdXJjZQoJCS0+ICJDQUwgb3V0cHV0
IDAiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAxIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMiI6
MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDMiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA0IjowIFtd
CgkJLT4gIkNBTCBvdXRwdXQgNSI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDYiOjAgW10KCQkt
PiAiQ0FMIG91dHB1dCA3IjowIFtdCglwYWQ2OiBTb3VyY2UKCQktPiAiQ0FMIG91dHB1dCAw
IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMSI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDIiOjAg
W10KCQktPiAiQ0FMIG91dHB1dCAzIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNCI6MCBbXQoJ
CS0+ICJDQUwgb3V0cHV0IDUiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA2IjowIFtdCgkJLT4g
IkNBTCBvdXRwdXQgNyI6MCBbXQoJcGFkNzogU291cmNlCgkJLT4gIkNBTCBvdXRwdXQgMCI6
MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDEiOjAgW10KCQktPiAiQ0FMIG91dHB1dCAyIjowIFtd
CgkJLT4gIkNBTCBvdXRwdXQgMyI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDQiOjAgW10KCQkt
PiAiQ0FMIG91dHB1dCA1IjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgNiI6MCBbXQoJCS0+ICJD
QUwgb3V0cHV0IDciOjAgW10KCXBhZDg6IFNvdXJjZQoJCS0+ICJDQUwgb3V0cHV0IDAiOjAg
W10KCQktPiAiQ0FMIG91dHB1dCAxIjowIFtdCgkJLT4gIkNBTCBvdXRwdXQgMiI6MCBbXQoJ
CS0+ICJDQUwgb3V0cHV0IDMiOjAgW10KCQktPiAiQ0FMIG91dHB1dCA0IjowIFtdCgkJLT4g
IkNBTCBvdXRwdXQgNSI6MCBbXQoJCS0+ICJDQUwgb3V0cHV0IDYiOjAgW10KCQktPiAiQ0FM
IG91dHB1dCA3IjowIFtdCgotIGVudGl0eSAyMTogZHM5MHViOTYwIDQtMDAzZCAoNiBwYWRz
LCA0IGxpbmtzLCAwIHJvdXRlKQogICAgICAgICAgICAgdHlwZSBWNEwyIHN1YmRldiBzdWJ0
eXBlIFVua25vd24gZmxhZ3MgMAogICAgICAgICAgICAgZGV2aWNlIG5vZGUgbmFtZSAvZGV2
L3Y0bC1zdWJkZXYyCglwYWQwOiBTaW5rCgkJW3N0cmVhbTowIGZtdDpTUkdHQjEyXzFYMTIv
MTkzNngxMTAwIGZpZWxkOm5vbmUgY29sb3JzcGFjZTpzcmdiIHhmZXI6c3JnYiB5Y2Jjcjo2
MDEgcXVhbnRpemF0aW9uOmxpbS1yYW5nZV0KCQk8LSAiZHM5MHViOTUzIDQtMDA0NCI6MSBb
RU5BQkxFRCxJTU1VVEFCTEVdCglwYWQxOiBTaW5rCgkJW3N0cmVhbTowIGZtdDpTUkdHQjEy
XzFYMTIvMTkzNngxMTAwIGZpZWxkOm5vbmUgY29sb3JzcGFjZTpzcmdiIHhmZXI6c3JnYiB5
Y2Jjcjo2MDEgcXVhbnRpemF0aW9uOmxpbS1yYW5nZV0KCQk8LSAiZHM5MHViOTUzIDQtMDA0
NSI6MSBbRU5BQkxFRCxJTU1VVEFCTEVdCglwYWQyOiBTaW5rCgkJW3N0cmVhbTowIGZtdDpV
WVZZOF8xWDE2LzEyODB4NzIwIGZpZWxkOm5vbmUgY29sb3JzcGFjZTpzcmdiIHhmZXI6c3Jn
YiB5Y2Jjcjo2MDEgcXVhbnRpemF0aW9uOmxpbS1yYW5nZV0KCQk8LSAiZHM5MHViOTEzYSA0
LTAwNDYiOjEgW0VOQUJMRUQsSU1NVVRBQkxFXQoJcGFkMzogU2luawoJcGFkNDogU291cmNl
CgkJW3N0cmVhbTowIGZtdDpTUkdHQjEyXzFYMTIvMTkzNngxMTAwIGZpZWxkOm5vbmUgY29s
b3JzcGFjZTpzcmdiIHhmZXI6c3JnYiB5Y2Jjcjo2MDEgcXVhbnRpemF0aW9uOmxpbS1yYW5n
ZV0KCQktPiAiQ0FNRVJBUlgwIjowIFtFTkFCTEVELElNTVVUQUJMRV0KCXBhZDU6IFNvdXJj
ZQoKLSBlbnRpdHkgMzA6IGRzOTB1YjkxM2EgNC0wMDQ2ICgyIHBhZHMsIDIgbGlua3MsIDAg
cm91dGUpCiAgICAgICAgICAgICB0eXBlIFY0TDIgc3ViZGV2IHN1YnR5cGUgVW5rbm93biBm
bGFncyAwCiAgICAgICAgICAgICBkZXZpY2Ugbm9kZSBuYW1lIC9kZXYvdjRsLXN1YmRldjMK
CXBhZDA6IFNpbmsKCQlbc3RyZWFtOjAgZm10OlVZVlk4XzJYOC8xMjgweDcyMCBmaWVsZDpu
b25lIGNvbG9yc3BhY2U6c3JnYiB4ZmVyOnNyZ2IgeWNiY3I6NjAxIHF1YW50aXphdGlvbjps
aW0tcmFuZ2VdCgkJPC0gIm92MTA2MzUgNy0wMDMwIjowIFtFTkFCTEVELElNTVVUQUJMRV0K
CXBhZDE6IFNvdXJjZQoJCVtzdHJlYW06MCBmbXQ6VVlWWThfMVgxNi8xMjgweDcyMCBmaWVs
ZDpub25lIGNvbG9yc3BhY2U6c3JnYiB4ZmVyOnNyZ2IgeWNiY3I6NjAxIHF1YW50aXphdGlv
bjpsaW0tcmFuZ2VdCgkJLT4gImRzOTB1Yjk2MCA0LTAwM2QiOjIgW0VOQUJMRUQsSU1NVVRB
QkxFXQoKLSBlbnRpdHkgMzU6IGRzOTB1Yjk1MyA0LTAwNDUgKDIgcGFkcywgMiBsaW5rcywg
MCByb3V0ZSkKICAgICAgICAgICAgIHR5cGUgVjRMMiBzdWJkZXYgc3VidHlwZSBVbmtub3du
IGZsYWdzIDAKICAgICAgICAgICAgIGRldmljZSBub2RlIG5hbWUgL2Rldi92NGwtc3ViZGV2
NAoJcGFkMDogU2luawoJCVtzdHJlYW06MCBmbXQ6U1JHR0IxMl8xWDEyLzE5MzZ4MTEwMCBm
aWVsZDpub25lIGNvbG9yc3BhY2U6c3JnYiB4ZmVyOnNyZ2IgeWNiY3I6NjAxIHF1YW50aXph
dGlvbjpsaW0tcmFuZ2VdCgkJPC0gImlteDM5MCA2LTAwMjEiOjAgW0VOQUJMRUQsSU1NVVRB
QkxFXQoJcGFkMTogU291cmNlCgkJW3N0cmVhbTowIGZtdDpTUkdHQjEyXzFYMTIvMTkzNngx
MTAwIGZpZWxkOm5vbmUgY29sb3JzcGFjZTpzcmdiIHhmZXI6c3JnYiB5Y2Jjcjo2MDEgcXVh
bnRpemF0aW9uOmxpbS1yYW5nZV0KCQktPiAiZHM5MHViOTYwIDQtMDAzZCI6MSBbRU5BQkxF
RCxJTU1VVEFCTEVdCgotIGVudGl0eSA0MDogZHM5MHViOTUzIDQtMDA0NCAoMiBwYWRzLCAy
IGxpbmtzLCAwIHJvdXRlKQogICAgICAgICAgICAgdHlwZSBWNEwyIHN1YmRldiBzdWJ0eXBl
IFVua25vd24gZmxhZ3MgMAogICAgICAgICAgICAgZGV2aWNlIG5vZGUgbmFtZSAvZGV2L3Y0
bC1zdWJkZXY1CglwYWQwOiBTaW5rCgkJW3N0cmVhbTowIGZtdDpTUkdHQjEyXzFYMTIvMTkz
NngxMTAwIGZpZWxkOm5vbmUgY29sb3JzcGFjZTpzcmdiIHhmZXI6c3JnYiB5Y2Jjcjo2MDEg
cXVhbnRpemF0aW9uOmxpbS1yYW5nZV0KCQk8LSAiaW14MzkwIDUtMDAyMSI6MCBbRU5BQkxF
RCxJTU1VVEFCTEVdCglwYWQxOiBTb3VyY2UKCQlbc3RyZWFtOjAgZm10OlNSR0dCMTJfMVgx
Mi8xOTM2eDExMDAgZmllbGQ6bm9uZSBjb2xvcnNwYWNlOnNyZ2IgeGZlcjpzcmdiIHljYmNy
OjYwMSBxdWFudGl6YXRpb246bGltLXJhbmdlXQoJCS0+ICJkczkwdWI5NjAgNC0wMDNkIjow
IFtFTkFCTEVELElNTVVUQUJMRV0KCi0gZW50aXR5IDQ1OiBpbXgzOTAgNS0wMDIxICgxIHBh
ZCwgMSBsaW5rLCAwIHJvdXRlKQogICAgICAgICAgICAgdHlwZSBWNEwyIHN1YmRldiBzdWJ0
eXBlIFNlbnNvciBmbGFncyAwCiAgICAgICAgICAgICBkZXZpY2Ugbm9kZSBuYW1lIC9kZXYv
djRsLXN1YmRldjYKCXBhZDA6IFNvdXJjZQoJCVtzdHJlYW06MCBmbXQ6U1JHR0IxMl8xWDEy
LzE5MzZ4MTEwMCBmaWVsZDpub25lIGNvbG9yc3BhY2U6c21wdGUxNzBtXQoJCS0+ICJkczkw
dWI5NTMgNC0wMDQ0IjowIFtFTkFCTEVELElNTVVUQUJMRV0KCi0gZW50aXR5IDQ5OiBpbXgz
OTAgNi0wMDIxICgxIHBhZCwgMSBsaW5rLCAwIHJvdXRlKQogICAgICAgICAgICAgdHlwZSBW
NEwyIHN1YmRldiBzdWJ0eXBlIFNlbnNvciBmbGFncyAwCiAgICAgICAgICAgICBkZXZpY2Ug
bm9kZSBuYW1lIC9kZXYvdjRsLXN1YmRldjcKCXBhZDA6IFNvdXJjZQoJCVtzdHJlYW06MCBm
bXQ6U1JHR0IxMl8xWDEyLzE5MzZ4MTEwMCBmaWVsZDpub25lIGNvbG9yc3BhY2U6c21wdGUx
NzBtXQoJCS0+ICJkczkwdWI5NTMgNC0wMDQ1IjowIFtFTkFCTEVELElNTVVUQUJMRV0KCi0g
ZW50aXR5IDUzOiBvdjEwNjM1IDctMDAzMCAoMSBwYWQsIDEgbGluaywgMCByb3V0ZSkKICAg
ICAgICAgICAgIHR5cGUgVjRMMiBzdWJkZXYgc3VidHlwZSBTZW5zb3IgZmxhZ3MgMAogICAg
ICAgICAgICAgZGV2aWNlIG5vZGUgbmFtZSAvZGV2L3Y0bC1zdWJkZXY4CglwYWQwOiBTb3Vy
Y2UKCQlbc3RyZWFtOjAgZm10OlVZVlk4XzJYOC8xMjgweDcyMCBmaWVsZDpub25lIGNvbG9y
c3BhY2U6c21wdGUxNzBtXQoJCS0+ICJkczkwdWI5MTNhIDQtMDA0NiI6MCBbRU5BQkxFRCxJ
TU1VVEFCTEVdCgotIGVudGl0eSA1NzogQ0FMIG91dHB1dCAwICgxIHBhZCwgMTYgbGlua3Ms
IDAgcm91dGUpCiAgICAgICAgICAgICB0eXBlIE5vZGUgc3VidHlwZSBWNEwgZmxhZ3MgMAog
ICAgICAgICAgICAgZGV2aWNlIG5vZGUgbmFtZSAvZGV2L3ZpZGVvMAoJcGFkMDogU2luawoJ
CTwtICJDQU1FUkFSWDAiOjEgW0VOQUJMRURdCgkJPC0gIkNBTUVSQVJYMCI6MiBbXQoJCTwt
ICJDQU1FUkFSWDAiOjMgW10KCQk8LSAiQ0FNRVJBUlgwIjo0IFtdCgkJPC0gIkNBTUVSQVJY
MCI6NSBbXQoJCTwtICJDQU1FUkFSWDAiOjYgW10KCQk8LSAiQ0FNRVJBUlgwIjo3IFtdCgkJ
PC0gIkNBTUVSQVJYMCI6OCBbXQoJCTwtICJDQU1FUkFSWDEiOjEgW10KCQk8LSAiQ0FNRVJB
UlgxIjoyIFtdCgkJPC0gIkNBTUVSQVJYMSI6MyBbXQoJCTwtICJDQU1FUkFSWDEiOjQgW10K
CQk8LSAiQ0FNRVJBUlgxIjo1IFtdCgkJPC0gIkNBTUVSQVJYMSI6NiBbXQoJCTwtICJDQU1F
UkFSWDEiOjcgW10KCQk8LSAiQ0FNRVJBUlgxIjo4IFtdCgotIGVudGl0eSA5MzogQ0FMIG91
dHB1dCAxICgxIHBhZCwgMTYgbGlua3MsIDAgcm91dGUpCiAgICAgICAgICAgICB0eXBlIE5v
ZGUgc3VidHlwZSBWNEwgZmxhZ3MgMAogICAgICAgICAgICAgZGV2aWNlIG5vZGUgbmFtZSAv
ZGV2L3ZpZGVvMQoJcGFkMDogU2luawoJCTwtICJDQU1FUkFSWDAiOjEgW10KCQk8LSAiQ0FN
RVJBUlgwIjoyIFtFTkFCTEVEXQoJCTwtICJDQU1FUkFSWDAiOjMgW10KCQk8LSAiQ0FNRVJB
UlgwIjo0IFtdCgkJPC0gIkNBTUVSQVJYMCI6NSBbXQoJCTwtICJDQU1FUkFSWDAiOjYgW10K
CQk8LSAiQ0FNRVJBUlgwIjo3IFtdCgkJPC0gIkNBTUVSQVJYMCI6OCBbXQoJCTwtICJDQU1F
UkFSWDEiOjEgW10KCQk8LSAiQ0FNRVJBUlgxIjoyIFtdCgkJPC0gIkNBTUVSQVJYMSI6MyBb
XQoJCTwtICJDQU1FUkFSWDEiOjQgW10KCQk8LSAiQ0FNRVJBUlgxIjo1IFtdCgkJPC0gIkNB
TUVSQVJYMSI6NiBbXQoJCTwtICJDQU1FUkFSWDEiOjcgW10KCQk8LSAiQ0FNRVJBUlgxIjo4
IFtdCgotIGVudGl0eSAxMjk6IENBTCBvdXRwdXQgMiAoMSBwYWQsIDE2IGxpbmtzLCAwIHJv
dXRlKQogICAgICAgICAgICAgIHR5cGUgTm9kZSBzdWJ0eXBlIFY0TCBmbGFncyAwCiAgICAg
ICAgICAgICAgZGV2aWNlIG5vZGUgbmFtZSAvZGV2L3ZpZGVvMgoJcGFkMDogU2luawoJCTwt
ICJDQU1FUkFSWDAiOjEgW10KCQk8LSAiQ0FNRVJBUlgwIjoyIFtdCgkJPC0gIkNBTUVSQVJY
MCI6MyBbRU5BQkxFRF0KCQk8LSAiQ0FNRVJBUlgwIjo0IFtdCgkJPC0gIkNBTUVSQVJYMCI6
NSBbXQoJCTwtICJDQU1FUkFSWDAiOjYgW10KCQk8LSAiQ0FNRVJBUlgwIjo3IFtdCgkJPC0g
IkNBTUVSQVJYMCI6OCBbXQoJCTwtICJDQU1FUkFSWDEiOjEgW10KCQk8LSAiQ0FNRVJBUlgx
IjoyIFtdCgkJPC0gIkNBTUVSQVJYMSI6MyBbXQoJCTwtICJDQU1FUkFSWDEiOjQgW10KCQk8
LSAiQ0FNRVJBUlgxIjo1IFtdCgkJPC0gIkNBTUVSQVJYMSI6NiBbXQoJCTwtICJDQU1FUkFS
WDEiOjcgW10KCQk8LSAiQ0FNRVJBUlgxIjo4IFtdCgotIGVudGl0eSAxNjU6IENBTCBvdXRw
dXQgMyAoMSBwYWQsIDE2IGxpbmtzLCAwIHJvdXRlKQogICAgICAgICAgICAgIHR5cGUgTm9k
ZSBzdWJ0eXBlIFY0TCBmbGFncyAwCiAgICAgICAgICAgICAgZGV2aWNlIG5vZGUgbmFtZSAv
ZGV2L3ZpZGVvMwoJcGFkMDogU2luawoJCTwtICJDQU1FUkFSWDAiOjEgW10KCQk8LSAiQ0FN
RVJBUlgwIjoyIFtdCgkJPC0gIkNBTUVSQVJYMCI6MyBbXQoJCTwtICJDQU1FUkFSWDAiOjQg
W10KCQk8LSAiQ0FNRVJBUlgwIjo1IFtdCgkJPC0gIkNBTUVSQVJYMCI6NiBbXQoJCTwtICJD
QU1FUkFSWDAiOjcgW10KCQk8LSAiQ0FNRVJBUlgwIjo4IFtdCgkJPC0gIkNBTUVSQVJYMSI6
MSBbXQoJCTwtICJDQU1FUkFSWDEiOjIgW10KCQk8LSAiQ0FNRVJBUlgxIjozIFtdCgkJPC0g
IkNBTUVSQVJYMSI6NCBbXQoJCTwtICJDQU1FUkFSWDEiOjUgW10KCQk8LSAiQ0FNRVJBUlgx
Ijo2IFtdCgkJPC0gIkNBTUVSQVJYMSI6NyBbXQoJCTwtICJDQU1FUkFSWDEiOjggW10KCi0g
ZW50aXR5IDIwMTogQ0FMIG91dHB1dCA0ICgxIHBhZCwgMTYgbGlua3MsIDAgcm91dGUpCiAg
ICAgICAgICAgICAgdHlwZSBOb2RlIHN1YnR5cGUgVjRMIGZsYWdzIDAKICAgICAgICAgICAg
ICBkZXZpY2Ugbm9kZSBuYW1lIC9kZXYvdmlkZW80CglwYWQwOiBTaW5rCgkJPC0gIkNBTUVS
QVJYMCI6MSBbXQoJCTwtICJDQU1FUkFSWDAiOjIgW10KCQk8LSAiQ0FNRVJBUlgwIjozIFtd
CgkJPC0gIkNBTUVSQVJYMCI6NCBbXQoJCTwtICJDQU1FUkFSWDAiOjUgW0VOQUJMRURdCgkJ
PC0gIkNBTUVSQVJYMCI6NiBbXQoJCTwtICJDQU1FUkFSWDAiOjcgW10KCQk8LSAiQ0FNRVJB
UlgwIjo4IFtdCgkJPC0gIkNBTUVSQVJYMSI6MSBbXQoJCTwtICJDQU1FUkFSWDEiOjIgW10K
CQk8LSAiQ0FNRVJBUlgxIjozIFtdCgkJPC0gIkNBTUVSQVJYMSI6NCBbXQoJCTwtICJDQU1F
UkFSWDEiOjUgW10KCQk8LSAiQ0FNRVJBUlgxIjo2IFtdCgkJPC0gIkNBTUVSQVJYMSI6NyBb
XQoJCTwtICJDQU1FUkFSWDEiOjggW10KCi0gZW50aXR5IDIzNzogQ0FMIG91dHB1dCA1ICgx
IHBhZCwgMTYgbGlua3MsIDAgcm91dGUpCiAgICAgICAgICAgICAgdHlwZSBOb2RlIHN1YnR5
cGUgVjRMIGZsYWdzIDAKICAgICAgICAgICAgICBkZXZpY2Ugbm9kZSBuYW1lIC9kZXYvdmlk
ZW81CglwYWQwOiBTaW5rCgkJPC0gIkNBTUVSQVJYMCI6MSBbXQoJCTwtICJDQU1FUkFSWDAi
OjIgW10KCQk8LSAiQ0FNRVJBUlgwIjozIFtdCgkJPC0gIkNBTUVSQVJYMCI6NCBbXQoJCTwt
ICJDQU1FUkFSWDAiOjUgW10KCQk8LSAiQ0FNRVJBUlgwIjo2IFtFTkFCTEVEXQoJCTwtICJD
QU1FUkFSWDAiOjcgW10KCQk8LSAiQ0FNRVJBUlgwIjo4IFtdCgkJPC0gIkNBTUVSQVJYMSI6
MSBbXQoJCTwtICJDQU1FUkFSWDEiOjIgW10KCQk8LSAiQ0FNRVJBUlgxIjozIFtdCgkJPC0g
IkNBTUVSQVJYMSI6NCBbXQoJCTwtICJDQU1FUkFSWDEiOjUgW10KCQk8LSAiQ0FNRVJBUlgx
Ijo2IFtdCgkJPC0gIkNBTUVSQVJYMSI6NyBbXQoJCTwtICJDQU1FUkFSWDEiOjggW10KCi0g
ZW50aXR5IDI3MzogQ0FMIG91dHB1dCA2ICgxIHBhZCwgMTYgbGlua3MsIDAgcm91dGUpCiAg
ICAgICAgICAgICAgdHlwZSBOb2RlIHN1YnR5cGUgVjRMIGZsYWdzIDAKICAgICAgICAgICAg
ICBkZXZpY2Ugbm9kZSBuYW1lIC9kZXYvdmlkZW82CglwYWQwOiBTaW5rCgkJPC0gIkNBTUVS
QVJYMCI6MSBbXQoJCTwtICJDQU1FUkFSWDAiOjIgW10KCQk8LSAiQ0FNRVJBUlgwIjozIFtd
CgkJPC0gIkNBTUVSQVJYMCI6NCBbXQoJCTwtICJDQU1FUkFSWDAiOjUgW10KCQk8LSAiQ0FN
RVJBUlgwIjo2IFtdCgkJPC0gIkNBTUVSQVJYMCI6NyBbRU5BQkxFRF0KCQk8LSAiQ0FNRVJB
UlgwIjo4IFtdCgkJPC0gIkNBTUVSQVJYMSI6MSBbXQoJCTwtICJDQU1FUkFSWDEiOjIgW10K
CQk8LSAiQ0FNRVJBUlgxIjozIFtdCgkJPC0gIkNBTUVSQVJYMSI6NCBbXQoJCTwtICJDQU1F
UkFSWDEiOjUgW10KCQk8LSAiQ0FNRVJBUlgxIjo2IFtdCgkJPC0gIkNBTUVSQVJYMSI6NyBb
XQoJCTwtICJDQU1FUkFSWDEiOjggW10KCi0gZW50aXR5IDMwOTogQ0FMIG91dHB1dCA3ICgx
IHBhZCwgMTYgbGlua3MsIDAgcm91dGUpCiAgICAgICAgICAgICAgdHlwZSBOb2RlIHN1YnR5
cGUgVjRMIGZsYWdzIDAKICAgICAgICAgICAgICBkZXZpY2Ugbm9kZSBuYW1lIC9kZXYvdmlk
ZW83CglwYWQwOiBTaW5rCgkJPC0gIkNBTUVSQVJYMCI6MSBbXQoJCTwtICJDQU1FUkFSWDAi
OjIgW10KCQk8LSAiQ0FNRVJBUlgwIjozIFtdCgkJPC0gIkNBTUVSQVJYMCI6NCBbXQoJCTwt
ICJDQU1FUkFSWDAiOjUgW10KCQk8LSAiQ0FNRVJBUlgwIjo2IFtdCgkJPC0gIkNBTUVSQVJY
MCI6NyBbXQoJCTwtICJDQU1FUkFSWDAiOjggW10KCQk8LSAiQ0FNRVJBUlgxIjoxIFtdCgkJ
PC0gIkNBTUVSQVJYMSI6MiBbXQoJCTwtICJDQU1FUkFSWDEiOjMgW10KCQk8LSAiQ0FNRVJB
UlgxIjo0IFtdCgkJPC0gIkNBTUVSQVJYMSI6NSBbXQoJCTwtICJDQU1FUkFSWDEiOjYgW10K
CQk8LSAiQ0FNRVJBUlgxIjo3IFtdCgkJPC0gIkNBTUVSQVJYMSI6OCBbXQoK

--------------AyWBC307p0SQ8Hb9i7qM1pzF--
