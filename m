Return-Path: <linux-media+bounces-15923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B6F94A7E8
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 14:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B3251C21218
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB1B1E6726;
	Wed,  7 Aug 2024 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="RmPDQMp1";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ptL2dRb8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864CC1E6723;
	Wed,  7 Aug 2024 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034464; cv=none; b=Qk653vJtlyodMhgKxHnwRZ4xf/ujaegz4xiZpA0QqTBFgPrJbQtUnc9hC6kEWGVTG5CeiUrffryovgw+Sl/yKSAiQnAfbC0R5ZZt27ns3bAMtyru7lgj1cahpv572Z3MaWHLCd43xt/Xed2OnKhDqmOemEvZL/Lqef4/EQpzTW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034464; c=relaxed/simple;
	bh=qdDZchZPEDr+NDQKAPaxoBsdOjUhQDDibzBGxUQrorY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEuhrAeAtgpcSqT9+/AG2m9+5v0i8bEqFnNlSsVPlO2PrY5aPCmo8iCgZaC7Lvo1Hra/5nh3m5g27lGs+3U9B19cuG34Dtlmo7pnZsIjNPf1BvWDPPYcM4DewhHk6y1FcteX95G859+oJ1xYN9IihnVAOK2CxQrR6zqHgR6Oy80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=RmPDQMp1; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ptL2dRb8 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723034462; x=1754570462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lrv+qEmOFUTvTH1/K++g2w+GrgLw9NLSJ9jO9n9ZdIA=;
  b=RmPDQMp1pcC2AC+rDL8Lg68jx34cUFSq1S6VvbT0hKBJ154YMJbWVuBY
   ph3VRVHvcz7K9CAcYoEyiulpvz/ZzTDNRWLPvSkoVMcw5lObmuW8Cw2Oy
   CUWsisxhvRDZKwCHQBJOiRDY6tTM0y2tXFkwgqJuJ0nU2T0/0ODMnjeo4
   Uw0b0CwDK645/nFSgup1W2B8xZgfhq7CZ5jilaOzv5aKzg4fsoHZplSNs
   dNkgT6LSKISOFSwec2W86WRnAJMnvPYE3kBjVnz5lyznXqqaySuXJR2zC
   TM9WC9UzrzfLtNziCE5ANuVswjQ6dqY3d9HJTTVssSzZ00bfXKeFYpfaf
   g==;
X-CSE-ConnectionGUID: T9nvCsZPSRWkQAOVL+ENXg==
X-CSE-MsgGUID: uj6J48OpTXeOXG68iLhq/A==
X-IronPort-AV: E=Sophos;i="6.09,269,1716242400"; 
   d="scan'208";a="38293311"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Aug 2024 14:40:59 +0200
X-CheckPoint: {66B36B5B-19-19675C26-FC5C2C95}
X-MAIL-CPID: 321DA80D7A81F9BE72475A83A38A7913_3
X-Control-Analysis: str=0001.0A782F29.66B36B5B.00F3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8052E1673D8;
	Wed,  7 Aug 2024 14:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723034455;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lrv+qEmOFUTvTH1/K++g2w+GrgLw9NLSJ9jO9n9ZdIA=;
	b=ptL2dRb81XK3nYKbOR1er2+zcoiq0QB2bUCQT/Ih4ExMCs+F01jMqPCEZw0hg+uadI0lrs
	2IzG+v3JIAzBUrznTnt+5f7Qb8kfjBl5brMmPUoKQ/Fl1WJEDnO6VwpRqxKmesZpabo6U2
	MD/Uo5feQvMGBB4N9YVqUREwe3zQMckrBkxUE+4OFZ8fdaDRWydNd0sDKygRuKCkCezP6l
	jSalj71Psluv6fOOY0UfUZ+QioVY8QaiBgI7o011wTLSeuwKv9rlHhw+Iev36Txme1joLP
	/K+b8xgpEpprw0j8pSLYn1sr6BiK+lvnz4dzISG/RjH/voTFW7o1N06utck2+Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Bara <bbara93@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>, arne.caspari@theimagingsource.com
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
Date: Wed, 07 Aug 2024 14:40:56 +0200
Message-ID: <13572841.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <1897006.tdWV9SEqCh@steina-w>
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com> <20240807121648.GC8166@pendragon.ideasonboard.com> <1897006.tdWV9SEqCh@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Mittwoch, 7. August 2024, 14:39:01 CEST schrieb Alexander Stein:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten =
Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> Am Mittwoch, 7. August 2024, 14:16:48 CEST schrieb Laurent Pinchart:
> > ********************
> > Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie =
wissen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leite=
n Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> > Attention external email: Open attachments and links only if you know t=
hat they are from a secure source and are safe. In doubt forward the email =
to the IT-Helpdesk to check it.
> > ********************
> >=20
> > On Wed, Aug 07, 2024 at 02:12:04PM +0200, Alexander Stein wrote:
> > > Am Mittwoch, 7. August 2024, 13:07:24 CEST schrieb Benjamin Bara:
> > > > On Wed, 7 Aug 2024 at 11:50, Laurent Pinchart wrote:
> > > > > On Wed, Aug 07, 2024 at 10:47:39AM +0200, Benjamin Bara wrote:
> > > > > > On Wed, 7 Aug 2024 at 10:33, Alexander Stein wrote:
> > > > > > > Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin B=
ara:
> > > > > > > > Currently, the V4L2 subdevice is also created when the devi=
ce is not
> > > > > > > > available/connected. In this case, dmesg shows the followin=
g:
> > > > > > > >
> > > > > > > > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > > > > > > > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > > > > > > > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > > > > > > > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> > > > > > > >
> > > > > > > > which seems to come from imx290_ctrl_update() after the sub=
dev init is
> > > > > > > > finished. However, as the errors are ignored, the subdev is=
 initialized
> > > > > > > > but simply does not work. From userspace perspective, there=
 is no
> > > > > > > > visible difference between a working and not-working subdev=
ice (except
> > > > > > > > when trying it out or watching for the error message).
> > > > > > > >
> > > > > > > > This commit adds a simple availability check before startin=
g with the
> > > > > > > > subdev initialization to error out instead.
> > > > > > >
> > > > > > > There is already a patch reading the ID register at [1]. This=
 also reads the
> > > > > > > ID register. But I don't have any documentation regarding tha=
t register,
> > > > > > > neither address nor values definitions. If there is known inf=
ormation about
> > > > > > > that I would prefer reading the ID and compare it to expected=
 values.
> > > > > >
> > > > > > Thanks for the link - it seems like Laurent has dropped the pat=
ch for
> > > > > > the more recent kernel versions on their GitLab.
> > > > >
> > > > > It was a patch that I wrote as a test, and I decided not to upstr=
eam it
> > > > > as it had limited value to me. The downside with reading register=
s at
> > > > > probe time is that you have to power up the sensor. This can have
> > > > > undesired side effects, such as flashing a privacy LED on at boot=
 time
> > > > > in devices that have one. There's also the increase in boot time =
due to
> > > > > the power up sequence, which one may want to avoid.
> > > > >
> > > > > The imx290 driver already powers up the device unconditionally at=
 probe
> > > > > time, so reading the version register wouldn't be much of an issu=
e I
> > > > > suppose. I would be fine merging that patch.
> > > > >
> > > > > > This was also my initial intention, but similar to you, I don't=
 have a
> > > > > > docu describing this register, so I am not sure where the info =
is coming
> > > > > > from and if it really contains the identification/type info. Pr=
obably
> > > > > > Laurent has more infos on that.
> > > > >
> > > > > That's a good question. I don't see a mention of that register in=
 the
> > > > > IMX290 datasheet I've found online
> > > > > (https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a7=
2f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf).
> > > > > Looking at the git history, the IMX290_CHIP_ID register macro was
> > > > > introduced in an unrelated commit, without an explanation. I don't
> > > > > recall where it comes from, but I don't think I've added it rando=
mly. It
> > > > > may have come from an out-of-tree driver.
> > > >=20
> > > > Thanks for the info!
> > > >=20
> > > > > I don't have an IMX290 plugged in at the moment, what's the value=
 of the
> > > > > register ?
> > > >=20
> > > > I currently have an imx462 available, which is not "officially supp=
orted" yet,
> > > > but basically an imx290 derivative. With your patch applied:
> > > >=20
> > > > [   10.424187] imx290 7-001a: chip ID 0x07d0
> > >=20
> > > Okay, this is from a imx327lqr:
> > >=20
> > > [   15.265086] imx290 3-001a: chip ID 0x07d0
> > >=20
> > > Doesn't look like an ID register to me.
> >=20
> > Indeed, it's quite suspicious.
> >=20
> > I wonder if we could find a more applicable register. Chip ID registers
> > are usually located at the beginning or end of the register space, we
> > could have a look there.
>=20
> Dumping all registers (8-Bit reads) from 0x3001 till 0x3480 only has a few
> non-zero registers:
> > # cat /sys/kernel/debug/regmap/3-001a/range
> > 3000-3480
> > # cat /sys/kernel/debug/regmap/3-001a/registers  | grep -v ": 00"
> > 3000: 01
> > 3020: 01
> > 303c: 08
> > 303e: 38
> > 303f: 04
> > 3040: 08
> > 3042: 80
> > 3043: 07
> > 319a: d0
> > 319b: 07
> > 3418: 38
> > 3419: 04
> > 3472: 80
> > 3473: 07
>=20
> Note I am on a Vision Components imx327, which might block some reads.
> Laurent is also aware of that behaviour. But maybe this list gives an
> indicator.

Ah, just for the records. I hacked the kernel to get these debugfs entries
for cci regmaps. They are not available by default.

Cheers
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



