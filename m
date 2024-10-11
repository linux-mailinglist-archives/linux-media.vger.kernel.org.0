Return-Path: <linux-media+bounces-19434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5799A666
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921431F22F33
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED152E62B;
	Fri, 11 Oct 2024 14:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="hAT1AtGa"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB8168B1;
	Fri, 11 Oct 2024 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728657294; cv=none; b=qiodrzx7BtptGdCJPCDdNJPqdsr0+J9obME1Jhs0rZaaRhhlZ0KHBHK48/mc+nPS93ieh/5gG84QV4QJN4Cx+JosyE4+iQSdFaHdENJwN8XL7Atm1U20AGmTjxHjyuw+xMa5VoMVucvoBatzT8XvaRxqv6S/gvUpeEi2oKeNH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728657294; c=relaxed/simple;
	bh=YPSyOg6r5kJPVJRZNZIHpCvnsPhYT1Yh8TXomgcKLL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkpmNNtaTluGsxkSk1FK6l6o9C877RX2T68qUTZGJXadxYh/4lXbCk8cAdqVV3u9qmCfzPPyovk37o6rv3C64y5nn6piS+S5C3719a+SRHkFXSVNI5YjqQR7/p2WXgYOeCvgwS03j6vyzuRayDJSr2UEuXNxptvqOjfX5PSZDdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=hAT1AtGa; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1728657283; bh=YPSyOg6r5kJPVJRZNZIHpCvnsPhYT1Yh8TXomgcKLL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAT1AtGaEOoKGUJbfc+NwXuneyBJWF4jKIjHtCfJ1xgsYTnEKW8UJYxV5AHhfUlrd
	 XEDE+z13yUbQfbBc8ThJejL9giYd52yCSYtfu21zt8hbTraxt7xaA6HfhjPC5qRlzN
	 z4JSF6NmzOFQFLcfNidy5V3zLftysyaz781BoP6nMIIP877BuNbxJuN0X7vMMzS/9s
	 ItYmFGcPyIsD1t0h4lfN9wXovLX2j52PBhDL1iMTRXZ3nCXs2cUCmibgVusmk1W0pF
	 8PTRogVt4hJfvmqtNT2whBtw1abe45PM6vdZuHmpYpRpJ9pthsTT7Qx+1ekWCYp6Tn
	 cl0ntoBy437NA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 6478D1002BF; Fri, 11 Oct 2024 15:34:43 +0100 (BST)
Date: Fri, 11 Oct 2024 15:34:43 +0100
From: Sean Young <sean@mess.org>
To: =?utf-8?B?6YeR6LaFLei9r+S7tumhueebrumDqA==?= <jinchao@vivo.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?6buE55CG6bmP?= <huanglipeng@vivo.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjFdIG1l?=
 =?utf-8?Q?dia=3A_rc-core=3A_Modif?= =?utf-8?Q?y?= the timeout waiting time
 for the infrared remote control.
Message-ID: <Zwk3g-B6dJWgqE41@gofer.mess.org>
References: <20240927105808.9284-1-shenlichuan@vivo.com>
 <Zv2xGbdhm8kXgDFe@gofer.mess.org>
 <TYZPR06MB6895415657AFF1C1723F9020DF7E2@TYZPR06MB6895.apcprd06.prod.outlook.com>
 <KL1PR0601MB445295795E1DBE993238FB17DB7F2@KL1PR0601MB4452.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KL1PR0601MB445295795E1DBE993238FB17DB7F2@KL1PR0601MB4452.apcprd06.prod.outlook.com>

Hi,

On Wed, Oct 09, 2024 at 07:03:57AM +0000, 金超-软件项目部 wrote:
> NORMAL: The kukong apk control remote control sends codes for other buttons
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[0]: 4500, 4500, 560, 560, 560, 1680, 560, 1680
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[8]: 560, 1680, 560, 560, 560, 560, 560, 560
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[16]: 560, 560, 560, 560, 560, 1680, 560, 1680
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[24]: 560, 1680, 560, 560, 560, 560, 560, 560
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[32]: 560, 560, 560, 1680, 560, 560, 560, 1680
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[40]: 560, 1680, 560, 560, 560, 560, 560, 560
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[48]: 560, 560, 560, 560, 560, 1680, 560, 560
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[56]: 560, 560, 560, 1680, 560, 1680, 560, 1680
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[64]: 560, 1680, 560, 46920, 4500, 4500, 560, 1680
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x560,
> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x96200,

If I sum all these lengths, I get 216000 microseconds. That's well clear
of IR_MAX_DURATION (500ms).

Note that the last two values 0x560 and 0x96200 look really weird, they are
not hex values are all, and there is no "pattern[...]: " prefix.

> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> 10-09 11:20:18.220  1023  1023 D ConsumerIrHal: IRTX: Send to driver
> 10-09 11:20:18.469  1023  1023 D ConsumerIrHal: Done, Turn OFF IRTX
> 
> SPECIAL :Sending the power button on the remote control of the kukong app may result in additional lines of coding, leading to transmission failure (72-88 extra)
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[0]: 4500, 4500, 560, 560, 560, 1680, 560, 1680
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[8]: 560, 1680, 560, 560, 560, 560, 560, 560
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[16]: 560, 560, 560, 560, 560, 1680, 560, 1680
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[24]: 560, 1680, 560, 560, 560, 560, 560, 560
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[32]: 560, 560, 560, 560, 560, 560, 560, 1680
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[40]: 560, 1680, 560, 560, 560, 560, 560, 560
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[48]: 560, 560, 560, 1680, 560, 1680, 560, 560
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[56]: 560, 560, 560, 1680, 560, 1680, 560, 1680
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[64]: 560, 1680, 560, 46920, 4500, 4500, 560, 1680
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[72]: 560, 96200, 4500, 4500, 560, 1680, 560, 96200
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[80]: 4500, 4500, 560, 1680, 560, 96200, 4500, 4500
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[88]: 560, 1680, 560, 96200, 4500, 4500, 560, 1680
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: 0x560,
> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: 0x96200,

If I sum all these lengths I get 648000 microseconds, so quit a bit more
than IR_MAX_DURATION, which is why the send fails. Again the last two values
are printed like garbage.

The signal looks like NECx1: http://hifi-remote.com/wiki/index.php/NECx1

So there is the main signal, follow by a bunch of repeats. Each repeat
looks like +4500 -4500 +560 -1680 +560 -96200; the -96200 is the trailing
gap. To avoid going over IR_MAX_DURATION, don't include the -96200 gap
but replaced with a usleep(96200), i.e. in psuedo code:

        int i, fd = open("/dev/lirc0", O_RDWR);
        write(fd, [4500 4500 560 560 560 1680 560 1680 560 1680 560 560 560 560 560 560 560 560 560 560 560 1680 560 1680 560 1680 560 560 560 560 560 560 560 560 560 560 560 560 560 1680 560 1680 560 560 560 560 560 560 560 560 560 1680 560 1680 560 560 560 560 560 1680 560 1680 560 1680 560 1680 560]);
        usleep(46920);
        for (i=0; i<4; i++) {
                write(fd, [4500 4500 560 1680 560]);
                usleep(96200);
        }

Note that this what the lirc daemon also does for transmits; it's a well
established way of sending. The write() to a lirc chardev won't return until
the transmit has been successful. It might be interruptted by a signal, so
you should disable signals during write (I don't think lirc daemon bothers
though).


Hope this helps

Sean

