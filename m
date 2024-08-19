Return-Path: <linux-media+bounces-16456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A08D95655C
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 10:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD481C2039B
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 08:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF8815B12C;
	Mon, 19 Aug 2024 08:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr/xWu/4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5D158538;
	Mon, 19 Aug 2024 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724055317; cv=none; b=fVG4y65zwJlhVEhwMiXKwVw2izEubCRF4dUwoTJejUGUXk3Na8TyuuGCXPbsk5RCjhWfVo8uJVDiyFJyQBFirnXpTk9cwnaMoUSFTthIWCvN7X5hloelsOv0cV+EI9jHT1YT4zRDD9F/nYH3ZEKNeZOErOzZVxcjpLUKsBkLwNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724055317; c=relaxed/simple;
	bh=uUjOUhqNuYQkT3tijVkTub3u4TjTMOVy0LCez1Ku3fY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3otyARxehfbvaJ/z2g3sw9iv5b2A1/V133/HXf0CeQKD1e7tIDaQEmKjec1NnvW7+/Y7Hq+n0lN4J6rW0wBT9c/cSOlDc67Vku6rwOX1WfMTfVnn4Z+aeIDjojNglaiO7wH9UcOx5EPhMqpC7sqw6sl2CpcPdlP4x27DjDJjgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr/xWu/4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9D5C32782;
	Mon, 19 Aug 2024 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724055316;
	bh=uUjOUhqNuYQkT3tijVkTub3u4TjTMOVy0LCez1Ku3fY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jr/xWu/4BSgH7i41+5/IDArM500AJbEw5UKqKN7F4WwZRBAlUrN4pVNqYW4reJSF2
	 rAl/TWDnpULY4JvtTPRipAY6OUv+IThFFX0FfLFRJACJqje/Kqqrw4oJnmdX/7ly+4
	 +P8lnwS8s7sJ1SG7sovGX5KM/fWZOOVIWaNpY+4T3D2+W54/Lm4asxhS2Nh6DLKVMq
	 9qj351TTO5xb05bG7RFRec0GfZLfSPdHfaszFPHUQoIKiH+mgjE7utq1JLwWRd2HpZ
	 C73r+tjtMBAvla3bjh1LAvvthGIZS4aLrNy/UBJpuJ2TV3gCN/OAhYaDqt/YivXbUE
	 Pv+Qd1vaSTpbg==
Date: Mon, 19 Aug 2024 10:15:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, syzbot
 <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <20240819101358.77aea582@foz.lan>
In-Reply-To: <2024081909-afar-trolling-2a67@gregkh>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
	<0000000000009f6f85061e684e92@google.com>
	<51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
	<1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
	<2024081909-afar-trolling-2a67@gregkh>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 19 Aug 2024 05:11:47 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Sun, Aug 18, 2024 at 02:20:44PM -0400, Alan Stern wrote:
> > Greg and Mauro:
> > 
> > Was this patch ever applied?  It doesn't appear in the current -rc 
> > kernel.  Was there some confusion about which tree it should be merged 
> > through?
> > 
> > Here's a link to the original submission:
> > 
> > https://lore.kernel.org/all/51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu/  
> 
> I never took it as it was touching a file that I'm not the maintainer
> of.  But I will be glad to do so if Mauro doesn't want to take it
> through his tree, just let me know.

This patch is duplicated of this one:

https://patchwork.linuxtv.org/project/linux-media/patch/20240409143634.33230-1-n.zhandarovich@fintech.ru/

The part I didn't like with such approach is that it checks only for
bulk endpoints. Most media devices have also isoc. Now, I'm not sure
about Siano devices. There are 3 different major chipsets supported
by this driver (sm1000, sm11xx, sm2xxx). Among them, sm1000 has one
USB ID for cold boot, and, once firmware is loaded, it gains another
USB ID for a a warm boot.

Your patch and the previously submitted one are not only checking
for the direction, but it is also discarding isoc endpoints.
Applying a change like that without testing with real hardware of
those three types just to make fuzz testing happy, sounded a little 
bit risky to my taste.

I would be more willing to pick it if the check would either be
tested on real hardware or if the logic would be changed to
accept either bulk or isoc endpoints, just like the current code.

Thanks,
Mauro

