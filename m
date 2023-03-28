Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6386CB8D7
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 09:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjC1H6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 03:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjC1H6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 03:58:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5034FB
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 00:58:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 603BEB81B8E
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 07:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E383C433EF;
        Tue, 28 Mar 2023 07:58:07 +0000 (UTC)
Message-ID: <2abc1b2f-3f7d-c72a-3c3e-7fde8e3e9c5e@xs4all.nl>
Date:   Tue, 28 Mar 2023 09:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Extremely long delay between CEC image-view-on an standby.
Content-Language: en-US
To:     Shawn Lindberg <shawn.lindberg@gmail.com>,
        linux-media@vger.kernel.org
References: <CAC6x6ivA-zk=NG9MS7bi-_yFarhf=A1ig-Yn9NBy1QuHnN+kow@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAC6x6ivA-zk=NG9MS7bi-_yFarhf=A1ig-Yn9NBy1QuHnN+kow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On 3/27/23 18:33, Shawn Lindberg wrote:
> Greetings, I am having trouble figuring out a very strange problem I'm
> seeing. I have a Raspberry Pi 4B connected via HDMI to a LG projector.
> I have no trouble turning the projector on using the following
> commands:
> 
> cec-ctl -d0 --tv --cec-version-1.4

That's wrong, the RPi is a Playback device, not a TV. So use --playback instead.

You should also add this line to the config.txt:

hdmi_ignore_cec=1

otherwise the RPi's firmware tries to process CEC messages as well.

> cec-ctl -d0 -t0 --image-view-on
> 
> I'm using CEC version 1.4 because that is what the projector supports.
> I don't know whether that's necessary or contributing. However, if I
> try to turn the projector off using standby, I get the following and
> the projector does not turn off:
> 
> cec-ctl -d0 -t0 -T --standby
>         CEC_ADAP_G_CAPS returned 0 (Success)
>         CEC_ADAP_G_PHYS_ADDR returned 0 (Success)
>         CEC_ADAP_G_LOG_ADDRS returned 0 (Success)
>         CEC_ADAP_G_CONNECTOR_INFO returned 0 (Success)
> Driver Info:
>     Driver Name                : vc4_hdmi
>     Adapter Name               : vc4
>     Capabilities               : 0x0000011e
>         Logical Addresses
>         Transmit
>         Passthrough
>         Remote Control Support
>         Connector Info
>     Driver version             : 5.15.84
>     Available Logical Addresses: 1
>     DRM Connector Info         : card 0, connector 32
>     Physical Address           : f.f.f.f

This is also weird: the physical address comes from the EDID of the TV
(projector in this case). f.f.f.f indicates that there is no TV
connected at all.

>     Logical Address Mask       : 0x0000
>     CEC Version                : 1.4
>     Vendor ID                  : 0x000c03 (HDMI)
>     OSD Name                   : 'TV'
>     Logical Addresses          : 1 (Allow RC Passthrough)
> 
>       Logical Address          : Not Allocated
>         Primary Device Type    : TV
>         Logical Address Type   : TV
> 
> 
> Transmit from Unregistered to TV (15 to 0):
> STANDBY (0x36)
>         CEC_TRANSMIT returned -1 (Machine is not on the network)

and that's why you get this: no physical address, no CEC.

> 
> During this time, if I try to poll the projector, it will succeed.
> However, if I monitor events, after a significant amount of time
> (appears to be greater than 20 minutes, although this is difficult to
> verify because of how long it takes) I go will eventually see the
> following:
> 
> Event: State Change: PA: 1.0.0.0, LA mask: 0x0000, Conn Info: yes
>     Timestamp: 30981.428s

Now it appears to be able to read the EDID again and it has a valid
physical address.

> Transmitted by Specific to Specific (14 to 14): POLL
>     Tx, Not Acknowledged (4), Max Retries
>     Sequence: 21 Tx Timestamp: 30981.561s Tx, Not Acknowledged (4), Max Retries
> 
> Event: State Change: PA: 1.0.0.0, LA mask: 0x4000, Conn Info: yes
>     Timestamp: 30981.561s
> Transmitted by Specific to all (14 to 15): REPORT_PHYSICAL_ADDR (0x84):
>     phys-addr: 1.0.0.0
>     prim-devtype: tv (0x00)
>     Sequence: 22 Tx Timestamp: 30981.696s
> Transmitted by Specific to all (14 to 15): DEVICE_VENDOR_ID (0x87):
>     vendor-id: 3075 (0x00000c03)
>     Sequence: 23 Tx Timestamp: 30981.835s
> Received from TV to Specific (0 to 14): FEATURE_ABORT (0x00):
>     abort-msg: 132 (0x84, REPORT_PHYSICAL_ADDR)
>     reason: invalid-op (0x03)
>     Sequence: 0 Rx Timestamp: 30981.949s
> Received from TV to Specific (0 to 14): GIVE_OSD_NAME (0x46)
>     Sequence: 0 Rx Timestamp: 30982.026s
> Transmitted by Specific to TV (14 to 0): SET_OSD_NAME (0x47):
>     name: TV
>     Sequence: 24 Tx Timestamp: 30982.137s
> 
> After this point in time the standby command will succeed and the
> projector will turn off. It's quite inconvenient to have to wait over
> 20 minutes to turn the projector back off again. Any idea how I can
> shorten this delay?

There is something weird about your setup and EDID. I can't really tell
what it is.

Note that some messages (POLL and Image View On) are allowed to be sent
even if there is no EDID, which is probably why that works.

Regards,

	Hans
