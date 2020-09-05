Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D55725E65D
	for <lists+linux-media@lfdr.de>; Sat,  5 Sep 2020 10:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgIEIUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Sep 2020 04:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbgIEIUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Sep 2020 04:20:07 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2FAC061244
        for <linux-media@vger.kernel.org>; Sat,  5 Sep 2020 01:20:05 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id t76so8822709oif.7
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2020 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Y7/WkCwyzu6DX1XpffFjDUY8YRiYJqGmrsJ/7ZiD4tY=;
        b=aG98ArGrfnS4Bi8SCqBWMgFEVB6belldtwTsJVutfY7r81/lmAoNcpLqoAV57dY3J9
         nQM3mJBVtVUmBFL/NNAIeQ4vjzCs/8koqJOeEqzdKll4NFcyMsI+Ij7kB5CaHGtN16sY
         vEA8QHz8J3h0DecHll7eJnmzRQiuWkdBWP7B8cUTEpW+1RWsolmguivw3uaaKMjYu3o4
         zPGDiZXd+Ik+IOHNX9sG28S2fDEq/XHiA2/N/auNSYlm1KT4cFqkbpCV+kx9PZQm2VHa
         UsvmYRuMpelypIQSWm8hoYmmTjMBpBl4jVCiOm48hnGyTYbv7w7elCQUPBXi2gL6Rh/D
         fVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Y7/WkCwyzu6DX1XpffFjDUY8YRiYJqGmrsJ/7ZiD4tY=;
        b=ri4LljW076mJV+pc5QoaaWIebk8ClpHxuESknhqP/rNygiXtpW5ycxNdQzeABixPwA
         LxkzI4jqEQ6k66npANgc4xiY7QAvxs1T+udaCEUqo8zF+oW9Ns5yGAXTwmZrRcISig+K
         8PeSNXBjl7sIEySsmboJvIOO/r5aZokp7vk53/BMRY7tOQTy+2WR+PTpt7+EODjxpM+f
         OmqBEcYzhNh8r1U5usxrSLUi6YT9h5tFS+/YzjBrXRN+807oQm+zGa2UnxwB0AvOu75o
         S2r+nt/fbNMmZ1k9o6Xmf3Yd9pkS3/mBkxDgdYpb9pbzh2drFm1fVBUrJ4GbvvIhicyZ
         CU3w==
X-Gm-Message-State: AOAM530CiAkqZ0NgLj285xIA9ItGBe+px3L+va2xSomu4gQy6LABL3l/
        Q5urBz/fInDtzCD5vgGRvovMsdliMZ1nzx++uidVpsj9hBX6qG2p
X-Google-Smtp-Source: ABdhPJzIQhrji/I2cXpunwI8DFMwFeZAwZdRmIu1kUEl4Lu2kZ1mcNsnch6+yj1gyOtT8pEoeZgK0uQZz4diN2zPBos=
X-Received: by 2002:aca:7503:: with SMTP id q3mr7735691oic.179.1599294002490;
 Sat, 05 Sep 2020 01:20:02 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel Scally <djrscally@gmail.com>
Date:   Sat, 5 Sep 2020 09:19:51 +0100
Message-ID: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
Subject: cio2 ipu3 module to automatically connect sensors via swnodes
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, heikki.krogerus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        jorhand@linux.microsoft.com, andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello


Following on from this thread:
https://www.spinics.net/lists/linux-driver-devel/msg135122.html -
apologies, can't see a way to reply to it directly.


Myself and others [1] have been trying to get cameras working on
Microsoft Surface and similar platforms, currently I'm working on
expanding Jordan's module connecting cameras to the cio2
infrastructure (which works - we can use it to take images), aiming to
discover connection information from SSDB in the DSDT, as well as
connect as many supported sensors as are found on the device. I'm just
struggling with a problem I've encountered using the swnode patch that
Heikki linked in that thread; the module's working ok when I only
attempt to connect a single one of my sensors (by preventing the
driver for the other sensor from loading, in which case this new
module ignores the sensor), but when I attempt to connect both cameras
at the same time I get a kernel oops as part of
software_node_get_next_child. The module is creating software_nodes
like this...

/sys/kernel/software_node/INT343E/port0/endpoint0
/sys/kernel/software_node/INT343E/port1/endpoint0
/sys/kernel/software_node/OVTI2680/port0/endpoint0
/sys/kernel/software_node/OVTI5648/port0/endpoint0

And that's the structure that I expect to see, but it seems like the
call to list_next_entry in that function is returning something that
isn't quite a valid swnode. Printing the address of c->fwnode after
that point returns "3", which isn't a valid address of course, and
that's causing the oops when it's either returned (in the version of
the function without the patches) or when the program flow tries to
call the "get" op against that fwnode (in the patched version). I've
been trying to track it down for a while now without success, so I
posted the problem on SO[2] and it was suggested that I mail these
addressees for advice - hope that that is ok.


My copy of Jordan's module is parked in my git repo [3] for now, and
requires a batch of patches from Jordan's repo [4] (one made by Heikki
to fill in the missing swnode graph pieces, and some further tweaks) -
I've been applying those against 5.8.0-rc7. Any other criticism more
than welcome - I'm new to both c and kernel programming so I'm happy
to take all the advice people have the time to give.


On a more general note; Kieran from the libcamera project suggested we
ought to be talking to you guys anyway to get some guidance on design,
and some more expert eye on the things we don't really understand. In
particular; we haven't been able to figure out how sensors that are
intended to work with the cio2 ipu3 stuff have their clock/regulators
supplied - in fact I can strip all the "usual" clock/regulator
functionality out of my camera's driver and it still functions fine,
which seems a bit weird. So far all we're doing as "power management"
of the camera's is turning on the GPIO pins that DSDT tables assign to
the tps68470 PMICs the cameras are theoretically hooked up to...but
given the drivers continue to work without using the PMICs regulator
and clk drivers (which we found in the intel-lts tree on Github),
we're a bit confused exactly how these are connected. Given the
potential for actual hardware damage if we mess something up there
it'd be great if anyone can shed some light on those elements.


Regards

Dan


[1] https://github.com/linux-surface/linux-surface/issues/91

[2] https://stackoverflow.com/questions/63742967/what-is-causing-this-kernel-oops-when-parsing-firmware?

[3] https://github.com/djrscally/miix-510-cameras/blob/master/surface_camera/surface_camera.c

[4] https://github.com/jhand2/surface-camera/tree/master/patches
