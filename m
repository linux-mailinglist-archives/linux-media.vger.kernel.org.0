Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7235F4397A2
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 15:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhJYNgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 09:36:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46762 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbhJYNgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 09:36:12 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68EE9E0A;
        Mon, 25 Oct 2021 15:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635168829;
        bh=QB60RLer42RaRmmfdGHG1smpau9MFiLMb5LnfGBDlp8=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=UL7oNVKUVg0UWdpr8QlQBiu4saBeMmcVW2NPKUhHafdFDwQ9fUn5/shK4dbHL4Pkg
         KbVpYTfRSlnAnaVGB5+s8yi4DtvJa3eLhKUnSbjGN3B+Rmx0fq63Rw2y2qX6KPNGd9
         W7W1CTKbWEzALDjbflWrtp6a2DQ/Py+OOXpeOqgQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cf7d0c4c-e8b4-2611-8dfe-58fe6d74a813@rocketmail.com>
References: <cf7d0c4c-e8b4-2611-8dfe-58fe6d74a813.ref@rocketmail.com> <cf7d0c4c-e8b4-2611-8dfe-58fe6d74a813@rocketmail.com>
Subject: Re: Problem with NFS when unplugging laptop from docking station
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Norman Koch <kochnorman@rocketmail.com>,
        linux-media@vger.kernel.org
Date:   Mon, 25 Oct 2021 14:33:46 +0100
Message-ID: <163516882696.905629.2979605611158192768@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Norman,

Quoting Norman Koch (2021-10-24 12:16:38)
> Hello,
>=20
> I'm not sure if I'm correct to ask this here, sorry if it's not.

I'm afraid that I don't think this is the right place to ask your
questions, and so I'm not sure you'll get much specific help from the
linux-media subsystem on this. It's quite unrelated.

> I use Debian 11 with 5.10.0-8-amd64 #1 SMP Debian 5.10.46-4 (2021-08-03)
> x86_64 GNU/Linux as Kernel on a ThinkPad T440. I also have a network
> attached storage device which I access over nfs. I load it via

Having mentioned that you use Debian, I suspect a better place to get
support for your issue is the Debian forums.
 Perhaps: https://forums.debian.net/

However, I don't believe your issue is specific to Debian, but just
general Linux system adminstration. So perhaps any forum related to
linux system adminstration might also help you.

> //192.168.0.103/fileserver /home/norman/fileserver cifs
> auto,rw,rsize=3D32768,wsize=3D32768,uid=3D1000,gid=3D1000,defaults,iochar=
set=3Dutf8,username=3D<HERECOMESMYUSERNAME>,password=3D<HERECOMESMYPASSWORD=
>,vers=3D1.0
> 0 0
>=20
> in my fstab. It all works fine if I start using it while I am at my
> docking station (with LAN-cable to my router and IP 192.168.0.109), but
> it fails to access (and even re-mount and umount, when not using umount
> -a -t cifs -l) on wifi (having 192.168.0.102 there). But when I umount
> before unplugging, and then unplug and re-mout, it works just fine.
>=20
> When I am in the situations that it doesn't work, all windows keep stuck
> and I cannot interact with them anymore, if have anything at all to do
> with my NAS (even ls ~, because it's mounted in ~).
>=20
> I am not a kernel programmer, so I cannot look into the source code to
> tell why this happens, but I can speculate. I believe the NFS-driver is
> somehow linked to the interface it was first connected on. So that, if
> you connect on enp0s25 first, then plug it out, and try to access the

Yes, I don't know your full issue, but I can concur, NFS mounts don't
usually like to have their network connection removed from underneath
them.

> same host (the NAS) when enp0s25 is down, it fails to do something, and
> there seems to be no timeout set by default that prevents the system
> from crashing. So in short: use the IP so long as it works, but if it
> doesn't, use the MAC-address to arp-scan the network, maybe you're on a
> different port now.
>=20
> Is this reasonable?
>=20
> If this is the wrong mailing list, I'm very sorry. I'd like to be
> corrected on where to send this to be dealt this properly.

You would be best to find something like a system administration/network
adminstration or networking support forum.

Good luck with your investigations.


Regards

Kieran


> Thanks,
>=20
> Norman
>=20
>
