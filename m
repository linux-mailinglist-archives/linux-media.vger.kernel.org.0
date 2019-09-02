Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5A7CA4CFE
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 03:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729266AbfIBBCV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Sep 2019 21:02:21 -0400
Received: from c.mail.sonic.net ([64.142.111.80]:51078 "EHLO c.mail.sonic.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729262AbfIBBCV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 21:02:21 -0400
Received: from [192.168.23.254] (bastion.ponzo.net [69.12.218.213])
        (authenticated bits=0)
        by c.mail.sonic.net (8.15.1/8.15.1) with ESMTPSA id x8212JNk007037
        (version=TLSv1.2 cipher=AES128-SHA bits=128 verify=NOT)
        for <linux-media@vger.kernel.org>; Sun, 1 Sep 2019 18:02:19 -0700
From:   Scott Doty <scott@ponzo.net>
Subject: hdpvr.ko kernel 5.3-rc6
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <7530b881-c7d0-74fd-dfeb-5e001d8b2266@ponzo.net>
Date:   Sun, 1 Sep 2019 18:02:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Sonic-CAuth: UmFuZG9tSVYAM6xjZgcQco/AKV+qqHzthjzRMGwVPwKw9iZsRSkhl9u5FqhMiINECYFPyJwYBz8qO6izjm5ix6Z0BL90qny1
X-Sonic-ID: C;EvIWUB3N6RGJXC1SyDiNwg== M;bN8fUB3N6RGJXC1SyDiNwg==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Hadn't used my Hauppauge HDPVR for a while, decided to check status of
driver.

Doesn't seem to be working now.  Everything initializes okay (afaict),
but it doesn't seem to want to start streaming.

In the past, a command like this has worked for playback:

vlc v4l2c:///dev/video2 \
    --v4l2-chroma=H264 \
    --v4l2-width=1920 \
    --v4l2-height=1080

Running that with -vvv, I get output that includes words to the effect of:

   https://termbin.com/re3q

Running the module with buffer debug on shows the following from dmesg:

   https://termbin.com/u39v

I'm probably in over my head, but if I could hazard a guess, I'd say
there's something awry with the frame rate it is trying to set.  Video
input is off a DirecTV box component input using the SPDIF input.

Also tried mplayer, and I sometimes get a video feed (but it tries to
use hwac3 for my audio, wish isn't going to work with my setup).  In
this case, streaming seems to get started (according to buffer debug),
but output is either nonexistent, or it will play video for a few
seconds then exit.

And from dmesg in that case: https://termbin.com/pwsp

If someone could point me in the right direction, I can try to fix this
-- or if someone has a solution, I'd very much appreciate the help.

Thank you,

 -Scott


