Return-Path: <linux-media+bounces-35180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA2ADEFE9
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 16:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8C3188DB6B
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 14:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965B62EBB8D;
	Wed, 18 Jun 2025 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+4tQe71"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9276285C8E;
	Wed, 18 Jun 2025 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257611; cv=none; b=MMTRkXoZ9axzi/AbTsUafHvLov+qKC1McFhv+3EkmOzAzVQdGR7Xp3FISXKAbBRkH7ixFDUvrZ9GJ5WBdyUSSUxjN0uxU7Jws2hIU99fPIs1jpJRm7CiZTBgbGU7ipt+2EBTTHguCGMIU4QmjjCv6fFM7IGoWUZ1En1ishobxoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257611; c=relaxed/simple;
	bh=Hvjt5mvmBXT7F/XR96SVx2NWm++TIC0IAHqhT8Dl+DU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u8HLzRkJa94LmhSJhd5gOPUfzNyN3jo7Bz+JAsVZnkGqbSgbWSaFC8Aawp1/8eUvjVe+Hkfkj2vpUGlME7OgOuBgcgvZcDTv6rLhIRc5/C0a0HNF+7VYGLk6CNlOgpk2ffJ2KF7uEKuReLQj9QxDNizTHWb7lZLgaWCMOnp9NIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+4tQe71; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF497C4CEE7;
	Wed, 18 Jun 2025 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750257610;
	bh=Hvjt5mvmBXT7F/XR96SVx2NWm++TIC0IAHqhT8Dl+DU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a+4tQe71pzIVfYwLGd/4H7AlntOQ3YgtfA3mtG/ffElIWzdvfR1Pfl20EgsW0ewjD
	 bfAoS9+/xZgP23hFLRu82thEbLjC/p/Vh5Nm03knKRjv6SLOHhcgri3Y2DKhdvOH/S
	 eRIepCF8P5HwdZFISKsyiQ1YVB6b7733nGnKFB3i2O5aBRzRUmZCwBUesmtqJZ/5/W
	 6vyZbJeA1By88Zx6pt1Yiz3EXIvNq+L25kQvRp1QbxbCJIchbKw1YFVlAG2zwgW+Lq
	 h6me0sUSklS4XyBNwiBiMVeTGmigxl+rIeDouLYX+ZAoSLmbXRyf9adG3r+Ba3/VM3
	 Tg9yK1F2stvfA==
Date: Wed, 18 Jun 2025 16:40:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Alexandre Courbot" <gnurou@gmail.com>
Cc: "Albert Esteve" <aesteve@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Jason Wang" <jasowang@redhat.com>, "Xuan
 Zhuo" <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, <gurchetansingh@google.com>,
 <daniel.almeida@collabora.com>, <adelva@google.com>,
 <changyeon@google.com>, <nicolas.dufresne@collabora.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <virtualization@lists.linux.dev>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250618164002.10220d81@sal.lan>
In-Reply-To: <DAPQ1LPH05P4.HLIMQEJCRHLX@gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
	<20250527111311.105246f2@sal.lan>
	<CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
	<20250527153547.6603eaf4@sal.lan>
	<CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
	<20250617104938.09d21b7c@foz.lan>
	<DAPQ1LPH05P4.HLIMQEJCRHLX@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 18 Jun 2025 23:16:47 +0900
"Alexandre Courbot" <gnurou@gmail.com> escreveu:

> Hi Mauro,
> 
> On Tue Jun 17, 2025 at 5:49 PM JST, Mauro Carvalho Chehab wrote:
> > Hi Alex,
> >
> > Em Tue, 27 May 2025 23:03:39 +0900
> > Alexandre Courbot <gnurou@gmail.com> escreveu:
> >  
> >> > > > Btw, I was looking at:
> >> > > >
> >> > > >         https://github.com/chromeos/virtio-media
> >> > > >
> >> > > > (I'm assuming that this is the QEMU counterpart, right?)    
> >> > >
> >> > > crosvm actually, but QEMU support is also being worked on.    
> >> >
> >> > Do you have already QEMU patches? The best is to have the Kernel driver
> >> > submitted altogether with QEMU, as Kernel developers need it to do the
> >> > tests. In my case, I never use crosvm, and I don't have any Chromebook
> >> > anymore.    
> >> 
> >> IIRC Albert Esteve was working on this, maybe he can share the current status.  
> >
> > Any news regards to it?  
> 
> Albert shared the latest status. There is one in-flight patch series
> required in qemu [1], and then this branch of vhost-device should
> contain the necessary support [2]. Albert is waiting for the virtio spec
> to get merged before sending a pull request IIUC.
> 
> [1] https://patchew.org/QEMU/20250217164012.246727-1-aesteve@redhat.com/
> [2] https://github.com/aesteve-rh/vhost-device/tree/virtio-media
> 
> >  
> >> Note that crosvm does not require a Chromebook, you can build and run
> >> it pretty easily on a regular PC. I have put together a document to
> >> help with that:
> >> 
> >> https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md  
> >
> > I started looking on it today. Already installed crossvm (I had to
> > install libcap-devel to build it). Still, I'm not familiar with
> > crossvm, which is a little be painful. In particular, how can I
> > enable network on it and speedup it?  
> 
> There is a "./tools/examples/setup_network" in the crosvm repository that
> will setup a TAP device. Once this is done, you can pass the "--net
> tap-name=crosvm_tap" argument to crosvm, and the network device should
> be visible and usable.
> 
> Let me reply to the rest of your questions in your latest mail, with the
> most recent logs.

Heh, I just managed to get it work maybe 10 minutes before your e-mail...

I'm building crossvm with:

	cargo build --release --features  "gpu,media,virgl_renderer,x"

To also have GPU working.

Network setup required a rather complex script to set it up without
breaking my ssh section with the machine where I'm running crossvm.

In case you need, I'm enclosing it.

Now, I need to allocate another time slot for tests and review.

---

#!/bin/bash

PHY=enp0s25
BRIDGE=crossvm_br
TAP=crossvm_tap

IP_MASK=$(ip -br addr show $PHY | awk '{print $3}' | grep -oE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+')
if [ -z "$IP_MASK" ]; then
  echo "Failed to detect IP address on $PHY. Exiting."
  exit 1
fi

GW=$(ip -br route show default dev $PHY | awk '{print $3}')
if [ -z "$GW" ]; then
  echo "Failed to detect default gateway on $PHY. Exiting."
  exit 1
fi

restore_network() {
  echo "Restoring original network config on $PHY..."
  sudo ip link set dev $BRIDGE down || true
  sudo ip link del $BRIDGE || true
  sudo ip link set dev $TAP down || true
  sudo ip tuntap del dev $TAP mode tap || true

  sudo ip addr flush dev $PHY
  sudo ip addr add ${IP_MASK} dev $PHY
  sudo ip link set dev $PHY up
  sudo ip route add default via $GW
}

if ! lsmod | grep -q '^bridge'; then
    sudo modprobe bridge
fi

trap 'catch $LINENO "$BASH_COMMAND"' ERR

catch() {
    echo "Error on line $1: $2"
    restore_network
    exit 1
}

if ip link show $TAP &>/dev/null; then
  echo "Removing existing tap $TAP"
  sudo ip link set dev $TAP down
  sudo ip tuntap del dev $TAP mode tap
fi

if ip link show $BRIDGE &>/dev/null; then
  echo "Removing existing bridge $BRIDGE"
  sudo ip link set dev $BRIDGE down
  sudo ip link del $BRIDGE
fi

# Create bridge device
sudo ip link add name $BRIDGE type bridge
sudo ip link set dev $BRIDGE up
sudo ip link set dev $BRIDGE type bridge forward_delay 0

# Add physical interface to bridge
sudo ip link set dev $PHY master $BRIDGE

# Create tap device
sudo ip tuntap add dev $TAP mode tap
sudo ip link set dev $TAP up

# Add tap to bridge
sudo ip link set dev $TAP master $BRIDGE

# Get an address to the bridge
sudo dhclient $BRIDGE

# Start crossvm

sudo ./crosvm/target/release/crosvm run \
  linux/arch/x86/boot/bzImage \
  -c 4 -m size=4096 \
  --disable-sandbox \
  --block debian-12.img \
  -p "root=/dev/vda1" \
  --v4l2-proxy /dev/video0 \
  --gpu backend=virglrenderer \
  --net tap-name=crossvm_tap,vhost-net

