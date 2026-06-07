Return-Path: <linux-media+bounces-64036-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DVzTEZDoJGpFBgIAu9opvQ
	(envelope-from <linux-media+bounces-64036-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 05:42:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 629A464EC04
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 05:42:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=n8ea4Y7Q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64036-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64036-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4619F301C3D4
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 03:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9185348C61;
	Sun,  7 Jun 2026 03:41:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A892273D9F;
	Sun,  7 Jun 2026 03:41:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780803683; cv=none; b=iU3jGUJCiSFlcwEBRPKhU4T5unSlDqPVS+ygS9pJsvaaw26u1lUPpB6o0jhCDszmhiqAfVm3m1WmVA0Y/GFys1KZtU9SG7crBwkVr6wIdx+xWIjwesTcRbLxvQ2wxWyb3PX51xb9iP6meSuyAJi/XY7QD8jkv1BbES/WGClcCP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780803683; c=relaxed/simple;
	bh=QyCPnRf3F8ke+P9wWuP2lHv+Rfb9GviPoqyvg1WWKtg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=N4Avju3nqKSX/Mld+UewpyQW+766rfESb5CiqiFmUhXuKZHslccJ0lqTTEOK+iIjn2OiKGlpm8UjPIOgqdxcD+2Zhd1gM1t0A/cj7EPAJgUXLvjnEs/JdKlJH0AHdyx2lm/8Xqzd/vulb4GbsOAPk9TO6t8GvDJmqLqnfo/2H2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n8ea4Y7Q; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F54D497;
	Sun,  7 Jun 2026 05:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780803653;
	bh=QyCPnRf3F8ke+P9wWuP2lHv+Rfb9GviPoqyvg1WWKtg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=n8ea4Y7QIV1KCBpiZFCJ5VLUYuMlJo5yIQkbLL+NABeBGoLQ0T+wPXTwezklx5DZY
	 qH/ooGzRFbDgo0+IpQiA/gdnB5b9QgafRSCqvq0wU465AACEoz4QnAUGacpNcjibq5
	 E7ft/QoCQMqWrRhsKL8avdbn0lKYWHyPOPo2wTyA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ahyh0ZlwlZqr7VNa@kekkonen.localdomain>
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org> <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org> <5b63761b-07dd-4786-bc98-d8a1c48a2ef4@kernel.org> <ahyh0ZlwlZqr7VNa@kekkonen.localdomain>
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Eugen Hristev <ehristev@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sun, 07 Jun 2026 09:11:14 +0530
Message-ID: <178080367434.9570.8101421417305606672@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:jeanmichel.hautbois@yoseli.org,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:dave.stevenson@raspberrypi.com,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,m:naush@raspberrypi.com,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ehristev@kernel.org,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64036-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 629A464EC04

Hi Sakari, Eugen,

Quoting Sakari Ailus (2026-06-01 02:32:09)
> Hi Eugen, others,
>=20
> On Fri, May 29, 2026 at 06:06:42PM +0300, Eugen Hristev wrote:
> > On 5/29/26 08:12, Jean-Michel Hautbois wrote:
> > > Hi Eugen,
> > >=20
> > > Le 22/05/2026 =C3=A0 17:28, Eugen Hristev a =C3=A9crit=C2=A0:
> > >> When requesting log status, the block might be powered off, but regi=
sters
> > >> are being read.
> > >> Avoid reading the registers if the device is not resumed, thus also =
avoid
> > >> powering up the device just for log status.
> > >>
> > >> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CS=
I2 camera interface")
> > >> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> > >> ---
> > >> Changes in v2:
> > >> - changed to use pm_runtime_get_if_active()
> > >> - add corresponding put()
> > >> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d=
88045@kernel.org
> > >>
> > >> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > >> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >> To: Florian Fainelli <florian.fainelli@broadcom.com>
> > >> To: Ray Jui <rjui@broadcom.com>
> > >> To: Scott Branden <sbranden@broadcom.com>
> > >> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@b=
roadcom.com>
> > >> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > >> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >> To: Hans Verkuil <hverkuil@kernel.org>
> > >> To: Naushir Patuck <naush@raspberrypi.com>
> > >> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >> Cc: linux-media@vger.kernel.org
> > >> Cc: linux-rpi-kernel@lists.infradead.org
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> Cc: linux-kernel@vger.kernel.org
> > >> ---
> > >>   drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
> > >>   1 file changed, 9 insertions(+)
> > >>
> > >> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/driv=
ers/media/platform/broadcom/bcm2835-unicam.c
> > >> index 8d28ba0b59a3..93815b8ab930 100644
> > >> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *fil=
e, void *fh)
> > >>             node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
> > >>    dev_info(unicam->dev, "V4L2 format:         %08x\n",
> > >>             node->fmt.fmt.pix.pixelformat);
> > >> +
> > >> +  if (!pm_runtime_get_if_active(unicam->dev)) {
> > >=20
> > > Well, if I am picky I would say that pm_runtime_get_if_active() can=20
> > > return -EINVAL if runtime PM is disabled for the device. It should th=
en=20
> > > be tested against '<=3D 0' ?
> > >=20
> > > I suppose this should not happen really often, as very few drivers=20
> > > actually test this case...
> >=20
> > I saw that. Some do. This driver enables runtime pm in probe though. So
> > I guess it cannot happen, unless runtime pm would not selected in kernel
> > config, but the driver depends on PM.
>=20
> Runtime PM can be disabled for a device via sysfs.
>=20

I tried this on my board, and you can only do:

echo on > /sys/class/<...>/control

Which leads to RPM count to always stay 1 regardless of get/put.

So if the driver enables RPM and never disables it unless it's removed,
there's no way from userspace to make this function return -EINVAL.

> >=20
> > Ultimately I guess it's up to Sakari or Hans to decide whether it's
> > worth checking for error code, but I picked the simpler path (and
> > considering <depends on PM> in Kconfig) .
>=20
> pm_runtime_put() musn't be called if there was an error as it decrements
> usage_count unconditionally.
>=20
> The vast majority of sensor drivers test for non-zero only and no-one has
> complained. They should be fixed though...
>=20

This driver has an explicit "depends on PM", but even for other sensor
drivers, the only case pm_runtime_get_if_active can return -EINVAL is when
CONFIG_PM=3Dn, where pm_runtime_put is also stubbed out to return -ENOSYS..

So there is nothing to fix in sesnor drivers which do:

    if (!pm_runtime_get_if_active(&client->dev))
            return 0;

    /* write registers */

    /* unconditional put */
    pm_runtime_put(&client->dev)

Thanks,
    Jai

> > >=20
> > > With or without this small change:
> > > Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > >=20
> > > Thanks,
> > > JM
> > >=20
> > >> +          dev_info(unicam->dev,
> > >> +                   "Live data N/A due to device inactive\n");
> > >> +          return 0;
> > >> +  }
> > >> +
> > >>    reg =3D unicam_reg_read(unicam, UNICAM_IPIPE);
> > >>    dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
> > >>             unicam_get_field(reg, UNICAM_PUM_MASK),
> > >> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file=
, void *fh)
> > >>    dev_info(unicam->dev, "Write pointer:       %08x\n",
> > >>             unicam_reg_read(unicam, UNICAM_IBWP));
> > >>  =20
> > >> +  pm_runtime_put(unicam->dev);
> > >> +
> > >>    return 0;
> > >>   }
> > >>  =20
> > >>
> > >> ---
> > >> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> > >> change-id: 20260521-bcmpipm-6c578e73239c
> > >>
> > >> Best regards,
>=20
> --=20
> Regards,
>=20
> Sakari Ailus
>

