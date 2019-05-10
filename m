Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41B0A1A47C
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 23:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbfEJVZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 17:25:57 -0400
Received: from mxc2.seznam.cz ([77.75.77.23]:30194 "EHLO mxc2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727767AbfEJVZ5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 17:25:57 -0400
Received: from email.seznam.cz
        by email-smtpc15b.ng.seznam.cz (email-smtpc15b.ng.seznam.cz [10.23.14.195])
        id 3d93edf9ea28549c3d3bf33e;
        Fri, 10 May 2019 23:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1557523553; bh=m66xDE33CsioR3Gyc3h/uDdSCY2cHh449cn+aiBLVp0=;
        h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
         X-mailer:Content-type:Content-transfer-encoding:
         Content-description;
        b=HWxXIqA02YSPZTNBcXGb4nRM2ERcKwIETUP0aQ+/cMp5Vi0CJ4ACY6/31Yg/v4DvH
         oPw18aztakQvsVYxaim0CBgOnj0vW9UwKzucf2Qwk3OFAmLKM5J6GRwYB/TWiDY7ah
         kJpfdRVkd8D3gXkJe0yaEGTj7OUbk/miN3GcLgKM=
Received: from [192.168.254.6] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay9.ng.seznam.cz (Seznam SMTPD 1.3.103) with ESMTP;
        Fri, 10 May 2019 23:25:50 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Fri, 10 May 2019 23:25:49 +0200
MIME-Version: 1.0
Subject: Re: Noob DVB-T2 experience: Mygica T230C2, CrazyCat, VDR w. output plugins, and friends...  
Message-ID: <5CD5EC5D.14355.73BAB431@Frantisek.Rysanek.post.cz>
X-mailer: Pegasus Mail for Windows (4.63)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

I have a small update on how far I got on my noob quest.

As I've already explained, I have a proven and good quality T2 HEVC 
signal source = a multiplex transmitted from a nearby tower, reaching 
CNR values up to 35 dB.

Today I got myself some hardware with a mobile Skylake i5 and plugged 
my boot drive with Ubuntu Disco into that box. I'm still amazed at 
how things tend to work "out of the box" in Linux. I had to smile at 
how the Ubuntu, moved from a 65nm C2D, booted on a Skylake without 
any objections :-)

So I now have a working VAAPI. And a friend explained to me how to 
tune into a DVB-T2 mux and then select programs in VLC.
The vainfo utility is telling me that HEVC decoding is supported by 
the hardware, and indeed VLC seems to call VAAPI for the HEVC 
streams, including one or two freeview T2 programs that are broadcast 
in full HD. The playback runs at under 10% CPU consumption.
Out of all the "players" that I have tried so far, VLC is the most 
stable and smooth. Almost perfect - except that it's still basically 
a "desktop app". I need the user interface to feel like a stupid TV 
set with PVR capabilities = I'm aiming for the VDR. I've got a couple 
noob questions that I plan to ask at the VDR mailing list.

If I tune into the mux and select a particular program using the 
command-line tool "dvbv5-zap -r",
I can try to launch some independent players on 
/dev/dvb/adapter0/dvr0 .

The ffplay does accept that, but does not use the vaapi,
plays the stream in software, and freezes in a few seconds or 
minutes, depending to some degree on what material I pipe into it 
(codec and resolution and maybe some encoder details that I do not 
know.)

The Mplayer does not even open a video window - just stays stuck in 
the command line.

Stand-alone Xine doesn't work this way, nor does smplayer.

With the VDR, during my early steps I was using the vdr-xine output 
plugin. With that plugin, Xine displays DVB-T MPEG2 encoded streams 
(including the VDR GUI), but fails to display DVB-T2 HEVC encoded 
programs... curiously, the GUI is there, but says "no signal".

But, now with VAAPI available and working, the "vaapidevice" VDR 
output plugin has started to work. And it does play back a T2 stream 
- apparently starts with a program preset remembered from Xine
(I don't have another explanation why it would start at preset 50).
I have yet to find out how to control it from keyboard :-)
and I have some noob homework to do on the IR remote.

Curiously, the video playback in VDR+vaapidevice is "stuttering". 
As if short (sub-second) sequences of the movie get repeated.
I have a possible theory: I'm still trying this on the PC machine's 
built-in LCD, which likely runs at a 60Hz frame rate - while the HEVC 
material from DVB-T2 is nominally at 50p I guess (the old DVB-T was 
50i). Maybe the VLC can somehow cope with that (perform rate 
conversion on the fly) but the vaapidevice pluging cannot. Maybe I 
should attach a TV as a second display and set the PC's HDMI frame 
refresh rate to 50 Hz.

Enough of my scribbling for today. Any comments welcome.

Frank
