Return-Path: <linux-media+bounces-17057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D49963153
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 21:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C68541C23811
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 19:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851F31AC429;
	Wed, 28 Aug 2024 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="O8a3KiZP";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="OyLU5CbJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829861AAE0D;
	Wed, 28 Aug 2024 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724874811; cv=pass; b=Fmif0TbxdBOegPyrm82MUx7d0CWkuiuabJi/NuARkpiw+j78ZgStLD+okqG4sCyvy6R/vWSa1YrULjEoHw5me73xdK/+ZTWOgNlCrp34dmJPpbc0T6Oac8lQ0aktxtbSFtnMpbs9hdWegmX+2oQTQSASxkAhe9t3NzQ69ltMKoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724874811; c=relaxed/simple;
	bh=lc5BSaVtMgbDX8gAC4VThV455gmTc3dxUo2vkykN4YM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fHfT6OLcx9cizV9eBBtn8px5hNt9L3QVmQqwFx+JvvCTWnyMGqzbVtXvKtq/w2nDXKHC0GIXzpfS9QSN8A3LzZNvgwptjE3TDGJIU+ard9EbSLTr9qtK5naF1h7jGMKBNauA1kB7EgjVOuTbP3ZKnCEIqBNZoz5jUSbIc3hvi5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=O8a3KiZP; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=OyLU5CbJ; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1724874082; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dztje0vILEdjUGIKWuww9r4Nq6WJJnki/zM1jzVxx3tk4dgygumrWYE6uNjOV0b0BO
    97kC729/owvvKlEYjwmIkIclCWFDCGt5bXKoAYnJ5/zJsACK9E9h1V+WetgieZ+UlkyS
    knfIzwOg5pQZMl9wiPNyVyFhjrQwswXs0oM/6ybdHk9Y6jfZ1qhMlTNBaHHirh5m7ycK
    lRwHa6dRPTITH65b87nNHqP4hxffRtO82d6IVhFFJO0FsoUHuFb4aHUoi6QLe+ZBa7De
    cdAIGFw4AxcQf3tPy1osnyv0iUjOPTG0oRtVF4aorDc3GibahqFB5KbkNtNe7nSzSfK3
    gqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1724874082;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=lc5BSaVtMgbDX8gAC4VThV455gmTc3dxUo2vkykN4YM=;
    b=HtibQybjGsJJwnR8wLPmcvDxpAUsayuY3E5+rZ/6+VkB+VC8Q5VBBFMqqnNJ760+Bu
    xpvwjd4sOz6aqb3k/0uBDen8a7pN7OObe9W04+zTn+0S8NKdJWMDOT5R5QUW5NFdp8Ui
    uMOe62Ez4lroOM0yUaAg8/i+XhCHm3HtA1klg8nPG+Evj0m3nR39N+7A4Yw2tKMMTnn9
    UfceS4X8rIHW5vHBn0FUq81X0ig6xE6iKlhz7ZvDd5PkIs6HaJh2ur8SaRhpBxH9L/NX
    ap3Zp21T52brkSHX87KGHauqHA2BNho+goTB2lVoCOOqNUcV+GjFx/G3iMcBIU//WNHK
    ZDhw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1724874082;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=lc5BSaVtMgbDX8gAC4VThV455gmTc3dxUo2vkykN4YM=;
    b=O8a3KiZPSXg3lf/Nt2LAgVDJCsOKWN+MuG9dX+0NW1RxUX9vT7TcfZU5HArmSAORSj
    rKTW73QWNXGhP2CJ/ACstA1ojg05EZsEJQfF9LkfnhWoutn2QE4V4bL1l/zj4owwCigD
    gjiNFhi9wl63zX+GtQ9YxH8cO1Ng1NhUV5EJgh0weNX2lG9m1nB+tuqsTBKZuEGNEH5u
    L3++GTpCTj5gi8HgXpYPXv1syP4S21l5wUb9xy1KkYF1SHiA81Pu5NUgNoJJsqo2smca
    zu6wwT3FMCpMME/lW/7wqAGTdrsd2B9WhWZu2PFJ48JZy5F9MC/CcI+/FtW2/V5GexrD
    JDqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1724874082;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=lc5BSaVtMgbDX8gAC4VThV455gmTc3dxUo2vkykN4YM=;
    b=OyLU5CbJOECNm7avLli8/iVpyXjJBaLQfGoklgUH1hdgdfnmY74hHs8JU6lc2++dsG
    k+SylEsh1iUBXimAdaAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzoZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c207SJfMzUn
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 28 Aug 2024 21:41:22 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [Letux-kernel] [PATCHv2 0/6] drm/omap: hdmi: improve hdmi4 CEC,
 add CEC for hdmi5
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <83b8be7b-a2c5-42f8-a42b-93dfc528a414@xs4all.nl>
Date: Wed, 28 Aug 2024 21:41:11 +0200
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Sekhar Nori <nsekhar@ti.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D3C502B-C29B-4156-9616-E5EFDB89E4B7@goldelico.com>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <43F64377-8394-448F-A6F0-4DA11DB9AEF5@goldelico.com>
 <3c36b0cd-7b43-4a63-a832-1d8d14a4512a@ideasonboard.com>
 <83b8be7b-a2c5-42f8-a42b-93dfc528a414@xs4all.nl>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailer: Apple Mail (2.3776.700.51)

Hi all,

> Am 28.08.2024 um 16:14 schrieb Hans Verkuil =
<hverkuil-cisco@xs4all.nl>:
>=20
> On 28/08/2024 15:57, Tomi Valkeinen wrote:
>> Hi,
>>=20
>> On 25/08/2024 23:31, H. Nikolaus Schaller wrote:
>>> Hi,
>>> CEC features are useful to e.g. control HDMI monitor standby.
>>>=20
>>> But I wonder what happened to this series?
>>>=20
>>> I could find some reviewed-by: and acked-by: in [1] but it wasn't =
merged upstream
>>> for unidentifiable reasons.
>>>=20
>>> We apparently had merged this series some years ago into our LetuxOS =
distro kernel
>>> and now we found it to be broken (NULL dereference) at least for =
omap5uevm
>>> (and likely Pyra Handheld) after rebasing to v6.11-rc (it was =
already broken
>>> since v6.9-rc1). Fixes were not difficult, but it would be better if =
it were
>>> part of upstream.
>>=20
>> There was a v3:
>>=20
>> 20210428132545.1205162-1-hverkuil-cisco@xs4all.nl

[A clickable link is here: =
https://lore.kernel.org/linux-media/20210428132545.1205162-1-hverkuil-cisc=
o@xs4all.nl/ ]

Ah, I see. It wasn't sent to linux-omap so I didn't recognise/find it in =
my mails
or omap-patchwork.


>> I see there was a concern from Laurent in:
>>=20
>> YLjMZiX71mcQNQdO@pendragon.ideasonboard.com

Well, he didn't reject it although he had concerns, but I am not =
experienced with what
he is talking about for a proper solution...

>>=20
>> And we need an ack from the bridge maintainers for the drm_bridge =
parts. But the series is three years old, so I think someone would have =
to rebase on top of mainline and re-test and re-send first.
>=20
> I never really followed up with this. I still have the hardware, it is =
primarily
> time. And also that for me this is quite low priority since I don't =
use omap5.
>=20
> If someone wants to refresh this series and post it, then I would have =
no problem
> with it.

A far as I see it just needs a rebase - I guess on linux-next (or =
drm-misc?) and some
compile fixes I already have implemented for our distro kernel.

So if you agree I could work on it, test on omap4&5 and submit a v4 and =
hope that you
can jump in and support for the discussion. I would keep you (Hans) as =
commit author
and just add a signed-off: and tested-by:

But I will also need some time...

BR and thanks,
Nikolaus


