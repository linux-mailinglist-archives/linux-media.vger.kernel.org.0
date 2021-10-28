Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6744043E385
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 16:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhJ1OZU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 10:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhJ1OZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 10:25:19 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04BD0C061570
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:22:53 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id a132so4865135qkg.0
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NCMjksj+hqjh/L5xilahGgbzgnA4TVJaFClfAGnzcEg=;
        b=bA1QA6H6VPs69PJWrPBz+iSkCf8ax14omnk/4VEey+CyqxMXqcd/kl6cQCMjMY0by0
         2VFav3is8jIUvf6cx7BXN+EPq+7ZNpOJh4gqzar3lGrR+Poaxz+rl7HLpaDLuI2F7yhc
         9s6pUY9VXYZDhWePdFHnJidMqsAQFY/XkA/DS2VjBpPR2Y45hmdG/Wk6c1i8tZ5NXF61
         wgyJWEz5iCH3qoKBS8aC+l7JUIX1nRsjMX3VBkAv1NIpaXBBGB2bCUpuE/QB8ykbalgB
         6d72mgoN8gzQr1XMss6I3QtpOQyTEqo6HNNoGDLMDR1VwZnnrMZGh9aLAxr4dk4Wvy8s
         qCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NCMjksj+hqjh/L5xilahGgbzgnA4TVJaFClfAGnzcEg=;
        b=is6B9ZO+X/OUoLFJbGGRutjmFoqCcN+82zW+o9SviVwGdh80TXNmCHNr2cKA74QXnj
         4RMB+/W/mH5+SvJKqFizYRyXb1H3YUTeBgMEMtjEAlkljIkanyRdk6jDu05jZTitnVNA
         JIHj9heF7FoIN8JRdFCYoOqcD8FagKhm7LycK/H3uZkzyvd8OqtbsGXXYvM8Npvcubya
         htyi/s+C6gDu1eiGnUZblFMi/6beU+KiYBpBRhPI5T03d/1ctGm3t7gTP8C6UPnBPezS
         m2rBBmoHmShI4wLK23YOxRK6p+uy4CZwOYyf8kYya/GLjOEyjrpxH0Dhvr/huT6MwLJv
         Ns3g==
X-Gm-Message-State: AOAM533g0amoucK7SyCNRdo68AYixvSk7+mKud/f8yAsSwZ3B0i82EkG
        S6mwj8AkqPzAaAUuSPzrGn0O0KrAPPtbyA==
X-Google-Smtp-Source: ABdhPJw5uUP8xKXhLXtw4Zmu+PLh3xdpWh4U11GM9JcPLDXYsVrin69SpPJ4cLsFPYjW7WT5PWXBUQ==
X-Received: by 2002:a37:2d87:: with SMTP id t129mr3814504qkh.88.1635430972191;
        Thu, 28 Oct 2021 07:22:52 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id s14sm2263816qtc.32.2021.10.28.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 07:22:51 -0700 (PDT)
Message-ID: <5bedd0bf4cbe3501b30334905f5814567dce9600.camel@ndufresne.ca>
Subject: Re: Problem with NFS when unplugging laptop from docking station
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Norman Koch <kochnorman@rocketmail.com>,
        linux-media@vger.kernel.org
Date:   Thu, 28 Oct 2021 10:22:50 -0400
In-Reply-To: <cf7d0c4c-e8b4-2611-8dfe-58fe6d74a813@rocketmail.com>
References: <cf7d0c4c-e8b4-2611-8dfe-58fe6d74a813.ref@rocketmail.com>
         <cf7d0c4c-e8b4-2611-8dfe-58fe6d74a813@rocketmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Norman,

Le dimanche 24 octobre 2021 à 13:16 +0200, Norman Koch a écrit :
> Hello,
> 
> I'm not sure if I'm correct to ask this here, sorry if it's not.

The linux-media mailing relates to the media subsystem, which deals with support
for video capture, video output (non-display), CEC, CODECs, TV tuners of many
kinds, etc.

I believe linux-nfs might be a better place for this.

> 
> I use Debian 11 with 5.10.0-8-amd64 #1 SMP Debian 5.10.46-4 (2021-08-03)
> x86_64 GNU/Linux as Kernel on a ThinkPad T440. I also have a network
> attached storage device which I access over nfs. I load it via
> 
> //192.168.0.103/fileserver /home/norman/fileserver cifs
> auto,rw,rsize=32768,wsize=32768,uid=1000,gid=1000,defaults,iocharset=utf8,username=<HERECOMESMYUSERNAME>,password=<HERECOMESMYPASSWORD>,vers=1.0
> 0 0
> 
> in my fstab. It all works fine if I start using it while I am at my
> docking station (with LAN-cable to my router and IP 192.168.0.109), but
> it fails to access (and even re-mount and umount, when not using umount
> -a -t cifs -l) on wifi (having 192.168.0.102 there). But when I umount
> before unplugging, and then unplug and re-mout, it works just fine.
> 
> When I am in the situations that it doesn't work, all windows keep stuck
> and I cannot interact with them anymore, if have anything at all to do
> with my NAS (even ls ~, because it's mounted in ~).
> 
> I am not a kernel programmer, so I cannot look into the source code to
> tell why this happens, but I can speculate. I believe the NFS-driver is
> somehow linked to the interface it was first connected on. So that, if
> you connect on enp0s25 first, then plug it out, and try to access the
> same host (the NAS) when enp0s25 is down, it fails to do something, and
> there seems to be no timeout set by default that prevents the system
> from crashing. So in short: use the IP so long as it works, but if it
> doesn't, use the MAC-address to arp-scan the network, maybe you're on a
> different port now.
> 
> Is this reasonable?
> 
> If this is the wrong mailing list, I'm very sorry. I'd like to be
> corrected on where to send this to be dealt this properly.
> 
> Thanks,
> 
> Norman
> 
> 


