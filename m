Return-Path: <linux-media+bounces-19905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3959A4459
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 19:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1FC1C221CD
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8966B1862BB;
	Fri, 18 Oct 2024 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Z6hw2wdX";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="nuCS/Y9h"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F956200B80;
	Fri, 18 Oct 2024 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729271494; cv=none; b=fRjfxC8qZjwiuNrvwlGkbg3KloYspH5QSvsZzpQq4r0apWepwPh13Eu2C03hdWK/b2wN5YHePGx2EpKE9JEe15bIp2yJ19NwZONB23mhf2Y0wa7nNme9LtrQFLoJuQp98QefccEEX2O5upgQX9RN3NNScew7DVYZq+kIIZaMnwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729271494; c=relaxed/simple;
	bh=bTFBPnqKHdJ1O7O1cQvafAZioqUKzmEHHEQq4azcLyU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H7yOCPb20dLa6bE+dqBnGUqyE2+D2EcG+R97et2f/xhpVBnRmtHzHjpNXmLVQmBnZsRk8TgX/CirevhEqRnJZFUVenEkatAXktjYQSz1a/G1bzFbd/esMe5imPzevdFnn0IGzBjztBaxvMavPk1Xr5xfAPIlLHR/U2ZjHlf5lPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Z6hw2wdX; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=nuCS/Y9h; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1729271485; bh=bTFBPnqKHdJ1O7O1cQvafAZioqUKzmEHHEQq4azcLyU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z6hw2wdXe9yOlesrWcCfooBzWUin8eHFy09AOAVvFVikwSrKV96dFa//P/SMpVPK5
	 eWZaUcUVZ91huXtHEKSeSfQSgAwr16V+iPsOJubU4muKuaGDb4rAitdnVjEbFkJ4fp
	 TQahZrzkG2RFudhNKk4sqtzHa9UjiCdmQk+IDt+v0RhVzlbFd0bWP2Xoh/+FXkXymR
	 JgIYMfL70jFKtatEa7jMudGhuNiWSp9mkpI4QxUTtID3GN3zoDqcnxZBSw6CyNkD5R
	 nZU+kd63OT0ejueg+4yZmspc+qRqMFnwRzLLXnnyPKJds1c8akDowJNFvm7arUTTam
	 v2Xi8Fqw3UcKg==
Received: by gofer.mess.org (Postfix, from userid 501)
	id 27F591003BE; Fri, 18 Oct 2024 18:11:25 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1729271482; bh=bTFBPnqKHdJ1O7O1cQvafAZioqUKzmEHHEQq4azcLyU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nuCS/Y9hba+x8iocujSkNeZtA8d+pGdxlyJGV2kQVj/Z1KsB7PgChNfPSJzyzkvAv
	 P9TIFS8E1dujOLeeRBClyYUfGviLcWTKFWJKGbJzSUDcWuFHagq/nWQ2+yktMolTQK
	 IDuCZoAoLz2Kua1/+W0SwfUzS9vUI9BfgYZyqOLEUXZW+CzJuujUEbMiQwcwQdeEgB
	 ResO1KKw7mMJVeIEZrWkScgXhc/XxqbVPFwvFvsoU9+KjEIjIQsb2pqLrOJp04Nqfo
	 KvmenbCYyvx9cvRy7fayYZYCmFk9yWjel6OHasy+2I7dUEuBGYqvIgLle3RSolNiLd
	 HCYT5Hb8otQ+A==
Received: from bigcore.mess.org (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id CB2111000C4;
	Fri, 18 Oct 2024 18:11:22 +0100 (BST)
Message-ID: <2629c0e65d5a0007b684ba5a2aefb11acfd7a8eb.camel@mess.org>
Subject: Re: [PATCH v1] media: rc-core: Modify the timeout waiting time for
 the infrared remote control.
From: Sean Young <sean@mess.org>
To: =?UTF-8?Q?=E9=87=91=E8=B6=85-=E8=BD=AF=E4=BB=B6=E9=A1=B9=E7=9B=AE?=
 =?UTF-8?Q?=E9=83=A8?=
	 <jinchao@vivo.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, 
 =?UTF-8?Q?=E9=BB=84=E7=90=86=E9=B9=8F?=
	 <huanglipeng@vivo.com>, "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 18 Oct 2024 18:11:22 +0100
In-Reply-To: <964bdb7a-8e40-4fbe-b85f-571692694b8b@vivo.com>
References: <20240927105808.9284-1-shenlichuan@vivo.com>
	 <Zv2xGbdhm8kXgDFe@gofer.mess.org>
	 <TYZPR06MB6895415657AFF1C1723F9020DF7E2@TYZPR06MB6895.apcprd06.prod.outlook.com>
	 <KL1PR0601MB445295795E1DBE993238FB17DB7F2@KL1PR0601MB4452.apcprd06.prod.outlook.com>
	 <Zwk3g-B6dJWgqE41@gofer.mess.org>
	 <1a2149bb-9ac5-4cb0-9361-c292b66c214b@vivo.com>
	 <bf2d51c1-54de-45cf-aeef-06db1a047c2c@vivo.com>
	 <ZxDDcHcNQLBP69Fy@gofer.mess.org>
	 <964bdb7a-8e40-4fbe-b85f-571692694b8b@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Please send your emails in plain text only or they will be rejected by
the list.

On Fri, 2024-10-18 at 10:32 +0000, =E9=87=91=E8=B6=85-=E8=BD=AF=E4=BB=B6=E9=
=A1=B9=E7=9B=AE=E9=83=A8 wrote:
> =E5=9C=A8 2024/10/17 15:57, Sean Young =E5=86=99=E9=81=93:
> > Hi,
> >=20
> > On Thu, Oct 17, 2024 at 07:15:21AM +0000, =E9=87=91=E8=B6=85-=E8=BD=AF=
=E4=BB=B6=E9=A1=B9=E7=9B=AE=E9=83=A8 wrote:
> > > Hi
> > > May I ask if there has been any progress on this issue? It
> > > affects the
> > > user experience and could you please take a look as soon as
> > > possible?
> > > Thank you
> > >=20
> > >=20
> > > =E5=9C=A8 2024/10/12 11:09, quqiwanzi =E5=86=99=E9=81=93:
> > > > Hi
> > > >=20
> > > > =E5=9C=A8 2024/10/11 22:34, Sean Young =E5=86=99=E9=81=93:
> > > > > On Wed, Oct 09, 2024 at 07:03:57AM +0000, =E9=87=91=E8=B6=85-=E8=
=BD=AF=E4=BB=B6=E9=A1=B9=E7=9B=AE=E9=83=A8 wrote:
> > > > > > NORMAL: The kukong apk control remote control sends codes
> > > > > > for other
> > > > > > buttons
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[0]:
> > > > > > 4500,
> > > > > > 4500, 560, 560, 560, 1680, 560, 1680
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[8]:
> > > > > > 560,
> > > > > > 1680, 560, 560, 560, 560, 560, 560
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> > > > > > pattern[16]: 560,
> > > > > > 560, 560, 560, 560, 1680, 560, 1680
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> > > > > > pattern[24]: 560,
> > > > > > 1680, 560, 560, 560, 560, 560, 560
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> > > > > > pattern[32]: 560,
> > > > > > 560, 560, 1680, 560, 560, 560, 1680
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> > > > > > pattern[40]: 560,
> > > > > > 1680, 560, 560, 560, 560, 560, 560
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> > > > > > pattern[48]: 560,
> > > > > > 560, 560, 560, 560, 1680, 560, 560
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> > > > > > pattern[56]: 560,
> > > > > > 560, 560, 1680, 560, 1680, 560, 1680
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> > > > > > pattern[64]: 560,
> > > > > > 1680, 560, 46920, 4500, 4500, 560, 1680
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x560,
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x96200,
> > > > > If I sum all these lengths, I get 216000 microseconds. That's
> > > > > well clear
> > > > > of IR_MAX_DURATION (500ms).
> > > > >=20
> > > > > Note that the last two values 0x560 and 0x96200 look really
> > > > > weird,
> > > > > they are
> > > > > not hex values are all, and there is no "pattern[...]: "
> > > > > prefix.
> > > > This is to iterate through the remaining parts that are less
> > > > than
> > > > eight digits and print them out.
> > So why print the decimal value 560 as 0x560?
> > The printing error here should be 560
> > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x560,
> > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x96200,
> > > >=20
> > > > > > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> > > > > > 10-09 11:20:18.220  1023  1023 D ConsumerIrHal: IRTX: Send
> > > > > > to driver
> > > > > > 10-09 11:20:18.469  1023  1023 D ConsumerIrHal: Done, Turn
> > > > > > OFF IRTX
> > > > > >=20
> > > > > > SPECIAL :Sending the power button on the remote control of
> > > > > > the
> > > > > > kukong app may result in additional lines of coding,
> > > > > > leading to
> > > > > > transmission failure (72-88 extra)
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[0]:
> > > > > > 4500,
> > > > > > 4500, 560, 560, 560, 1680, 560, 1680
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[8]:
> > > > > > 560,
> > > > > > 1680, 560, 560, 560, 560, 560, 560
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[16]: 560,
> > > > > > 560, 560, 560, 560, 1680, 560, 1680
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[24]: 560,
> > > > > > 1680, 560, 560, 560, 560, 560, 560
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[32]: 560,
> > > > > > 560, 560, 560, 560, 560, 560, 1680
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[40]: 560,
> > > > > > 1680, 560, 560, 560, 560, 560, 560
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[48]: 560,
> > > > > > 560, 560, 1680, 560, 1680, 560, 560
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[56]: 560,
> > > > > > 560, 560, 1680, 560, 1680, 560, 1680
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[64]: 560,
> > > > > > 1680, 560, 46920, 4500, 4500, 560, 1680
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[72]: 560,
> > > > > > 96200, 4500, 4500, 560, 1680, 560, 96200
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[80]: 4500,
> > > > > > 4500, 560, 1680, 560, 96200, 4500, 4500
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal:
> > > > > > pattern[88]: 560,
> > > > > > 1680, 560, 96200, 4500, 4500, 560, 1680
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: 0x560,
> > > > > > 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: 0x96200,
> > > > > If I sum all these lengths I get 648000 microseconds, so quit
> > > > > a bit more
> > > > > than IR_MAX_DURATION, which is why the send fails. Again the
> > > > > last two
> > > > > values
> > > > > are printed like garbage.
> > > > >=20
> > > > > The signal looks like NECx1:
> > > > > https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%=
2Fhifi-remote.com%2Fwiki%2Findex.php%2FNECx1&data=3D05%7C02%7Cjinchao%40viv=
o.com%7Cccbe2b0c91d344e44d6408dcee815f75%7C923e42dc48d54cbeb5821a797a6412ed=
%7C0%7C0%7C638647486650784417%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dg442wKqt=
yI9uyQqq7iTcSB3ej4El39kd9Z51cI5mpa0%3D&reserved=3D0
> > > > >=20
> > > > > So there is the main signal, follow by a bunch of repeats.
> > > > > Each repeat
> > > > > looks like +4500 -4500 +560 -1680 +560 -96200; the -96200 is
> > > > > the
> > > > > trailing
> > > > > gap. To avoid going over IR_MAX_DURATION, don't include the -
> > > > > 96200 gap
> > > > > but replaced with a usleep(96200), i.e. in psuedo code:
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i, fd =
=3D open("/dev/lirc0", O_RDWR);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0write(fd, [=
4500 4500 560 560 560 1680 560 1680 560
> > > > > 1680 560
> > > > > 560 560 560 560 560 560 560 560 560 560 1680 560 1680 560
> > > > > 1680 560
> > > > > 560 560 560 560 560 560 560 560 560 560 560 560 1680 560 1680
> > > > > 560 560
> > > > > 560 560 560 560 560 560 560 1680 560 1680 560 560 560 560 560
> > > > > 1680
> > > > > 560 1680 560 1680 560 1680 560]);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usleep(4692=
0);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i=3D0;=
 i<4; i++) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0write(fd, [4500 4500 560 1680 560]);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usleep(96200);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > Thank you for your suggestion. The infrared code here is the
> > > > power key
> > > > code sent through the Kukong remote control, and there may be
> > > > other
> > > > infrared codes that exceed IR-MAX_DURATION.
> > 1) If you send repeats separately then no known protocol exceeds
> > 0.5 seconds=20
> =C2=A0=C2=A0=C2=A0 Now it is being sent separately and not duplicated. I =
have
> confirmed with the remote control manufacturer that the code for
> sending the power button will be over 500ms.

The signal above is 61ms plus four repeats. If you add a ton of repeats
yes, then sure, it becomes a lot longer. You haven't really engaged
with the suggestion that you send signal plus repeats in separate
calls to send.

>  The length of the power button code varies among different air
> conditioning manufacturers. For example,=C2=A0 the power button length of
> Panasonic air conditioning is over 900ms, there may be codes over
> 500ms

I'm always interested to learn more about infrared protocols. Do you
have any examples/documentation?

> > 2) There are databases of protocols, and no protocol here exceeds
> > 0.5 seconds
> > =C2=A0=C2=A0=C2=A0(or even comes near).
> > =09
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fhi
> > fi-
> > remote.com%2Fwiki%2Findex.php%2FDecodeIR&data=3D05%7C02%7Cjinchao%40v
> > ivo.com%7Cccbe2b0c91d344e44d6408dcee815f75%7C923e42dc48d54cbeb5821a
> > 797a6412ed%7C0%7C0%7C638647486650807965%7CUnknown%7CTWFpbGZsb3d8eyJ
> > WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0
> > %7C%7C%7C&sdata=3DUQijcgNqYDRV48noNxXewkdKlEYHldrAvFiq5DD5Aeg%3D&rese
> > rved=3D0
> > =09
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg
> > ithub.com%2Fbengtmartensson%2FIrpTransmogrifier%2Fblob%2Fmaster%2Fs
> > rc%2Fmain%2Fresources%2FIrpProtocols.xml&data=3D05%7C02%7Cjinchao%40v
> > ivo.com%7Cccbe2b0c91d344e44d6408dcee815f75%7C923e42dc48d54cbeb5821a
> > 797a6412ed%7C0%7C0%7C638647486650821914%7CUnknown%7CTWFpbGZsb3d8eyJ
> > WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0
> > %7C%7C%7C&sdata=3DeSnjJeKxIF37B9PKxiW4cFqNjeYEALXqx59A3Lu%2FKro%3D&re
> > served=3D0
> > =C2=A0=C2=A0=C2=A0The longest protocols I know of are for air condition=
ing units
> > and I've
> > =C2=A0=C2=A0=C2=A0never seen one longer than 0.5 seconds.
> >=20
> > 3) If a button press on a remote would take more than 0.5 seconds
> > the latency
> > =C2=A0=C2=A0=C2=A0would be awful, so no manufacturer would do this. Als=
o, the
> > chance of
> > =C2=A0=C2=A0=C2=A0signal being corrupted during transmit would be quite=
 high.
> There may be some air conditioning manufacturers who set the power
> button code to more than 500ms, but we have not found any issues such
> as delay in our testing
> >=20
> > 4) Some of the IR transmit hardware cannot handle such long
> > transmits, e.g.=20
> > =C2=A0=C2=A0=C2=A0mceusb, iguanair, redrat3 have limits on what can be =
sent due to
> > usb
> > =C2=A0=C2=A0=C2=A0packet limits. That means your software will never wo=
rk with
> > such hardware.
> >=20
> > 5) This limit has existed since the dawn of time in infrared. What
> > has changed?
> Our software only runs on Android 15 and sends infrared signals by
> scanning the air conditioning remote control. Therefore, the length
> of the infrared signal depends on the infrared remote control, There
> are no relevant changes, some air conditioning manufacturers send
> power button codes that exceed 500ms

So you're "learning" the codes from the existing remote and then just
repeat it. Rather than sending it in one go, you can replace large
gaps with a call to usleep(), e.g. anything above 20ms or so.

> > > > In order to ensure the
> > > > universality of the code and adapt to different situations, it
> > > > would
> > > > be better to directly modify IR-MAX_DURATION.
>=20
> > I get the feeling you are trying to avoid the problem that you are
> > sending
> > the IR signal with the key repeats all at once.=20
> Communicate
> =C2=A0with the manufacturer that the length of the power key code sent
> here cannot be modified and must maintain signal integrity for at
> least 500 milliseconds.

What is signal integrity? What problem are you describing? Why does
usleep() not work?

> Therefore,
> =C2=A0we hope to modify the delay from 500ms to 1000ms, which is more
> suitable to match more air conditioning manufacturers

Sure, I think we need to understand more about the air condition
infrared protocols. The example you've given so far is not really
showing anything special.

> > What driver are you using for transmit?
> > Use the infrared remote control driver provided by MTK for
> > transmission, and the interface called by the program comes from
> > kernel-6.6

I am confused. The mtk driver in drivers/media/rc/mtk-cir.c is receive
only and has no support for transmitting. Do you have a modified mtk-
cir driver or are you using gpio-ir-tx or pwm-ir-tx?

The reason I ask is that some drivers take more locks that others,
and it might be possible to do something depending on the driver.


Sean



