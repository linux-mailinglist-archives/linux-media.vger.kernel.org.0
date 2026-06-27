Return-Path: <linux-media+bounces-65811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xyOROHL1P2o5awkAu9opvQ
	(envelope-from <linux-media+bounces-65811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 18:08:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B4C6D23C7
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 18:08:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Qw2Y59Rm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65811-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65811-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A637A302D94B
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 16:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E513BBFC8;
	Sat, 27 Jun 2026 16:07:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE683161BA;
	Sat, 27 Jun 2026 16:07:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782576465; cv=none; b=SPNlPXe9V5FNqbuWDc0OVJbZ3tVfVun5Kcqfg542eaQexdDvNJW/BB+3kWOk28nv1YmlUyZmU3npxu1NzJD+jiQdGjK44/RyR/UVBjkoy4vdioRoS4bREauJiu4p86FaeQgOy7HNrhW7+M0zj5U1zz4FMHdFr9GBoF3sivP2fqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782576465; c=relaxed/simple;
	bh=kbXE+e2kShUdFQUZEtzV5kb5kIHvO0+olg3vo8dAYAI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=QVIWMeaa2RUosxF2ZKkdx5Qbzu4wuJjA+f3NDKn1y0aqXogXgBvq2l1Shxt6lGEzla+KUv6ZpKEwK6t7BmXWcar0u0In155TyXTsu6x/6fCxfjF/EJy+/AT05+iz7W2sxrKVf7F1Rxiv0Gz7onQCEPjdcD1tJa12M9U780ta9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw2Y59Rm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B671F000E9;
	Sat, 27 Jun 2026 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782576463;
	bh=Eai9illNnwIVHHx82Y8oRRChAijNkCdc6Gtuf6pgPNA=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=Qw2Y59RmKIirc9QicmPqL66sTrj2a2pRKQ4q1v06L1xA9E/C/n8ujusPhFM+JyAMq
	 Sc7C+LA2hGDEhdfXPP6JFmdPW/lxQo9uwCywxV3gUUCsoaqp/p8gFp8rSRqgPX9Rot
	 aq3TQmnmHDhFsytBp0U3bmY62h9aCkV7OgVPCbZZlU8BaFdjaz9P3zEBUeuvx5tPmD
	 4Tx2RvxcWeTQ2au9N+Wnor838KKBkB0xRChuAMilaNqmNIuEwn8ueK3uR1GU+mDUy3
	 YyRV47jAv1zDKiToKjdTIwjPqIKhSumFkr9k6T4RB7BOfeDsDOS70P4Gje9HvpGVAd
	 5T1h6xlOziCJQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 18:07:32 +0200
Message-Id: <DJJYM56GLGXX.2L6RY669ZOJSC@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Mark Brown" <broonie@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Raag Jadav"
 <raag.jadav@intel.com>, "Sohil Mehta" <sohil.mehta@intel.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Len Brown"
 <lenb@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Yemike Abhilash Chandra"
 <y-abhilashchandra@ti.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 <linux-media@vger.kernel.org>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko
 Stuebner" <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <driver-core@lists.linux.dev>, "Jonathan Cameron" <jic23@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Pei Xiao" <xiaopei01@kylinos.cn>,
 "Shashank Balaji" <shashank.mahadasyam@sony.com>, "Ben Horgan"
 <ben.horgan@arm.com>, "Johan Hovold" <johan@kernel.org>,
 <linux-usb@vger.kernel.org>, "Nikita Kravets" <teackot@gmail.com>, "Hans de
 Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>, "Daniel Scally"
 <dan.scally@ideasonboard.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Minas Harutyunyan" <hminas@synopsys.com>,
 "Tianrui Zhao" <zhaotianrui@loongson.cn>, "Bibo Mao" <maobibo@loongson.cn>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 00/17] mod_devicetable.h: Split into per subsystem
 headers
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65811-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:broonie@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:raag.jadav@intel.com,m:sohil.mehta@intel.com,m:dave.hansen@linux.intel.com,m:robh@kernel.org,m:saravanak@kernel.org,m:bhelgaas@google.com,m:rafael@kernel.org,m:lenb@kernel.org,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:nicolas.frattaroli@collabora.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:driver-core@lists.linux.dev,m:jic23@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:xiaopei01@kylinos.cn,m:shashank.mahadasyam@sony.com,m:ben.horgan@arm.com,m:johan@kernel.org,m:linux-usb@vger.kernel.org,m:teackot@gmail.com,m:hansg@k
 ernel.org,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dan.scally@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hminas@synopsys.com,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kvm@vger.kernel.org,m:loongarch@lists.linux.dev,m:u.kleine-koenig@baylibre.com,m:nickdesaulniers@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linux-foundation.org,linuxfoundation.org,kernel.org,gmail.com,google.com,intel.com,linux.intel.com,vger.kernel.org,ti.com,collabora.com,perex.cz,suse.com,sntech.de,lists.infradead.org,lists.linux.dev,oss.qualcomm.com,kylinos.cn,sony.com,arm.com,ideasonboard.com,synopsys.com,loongson.cn,xen0n.name];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48B4C6D23C7

On Fri Jun 26, 2026 at 8:00 PM CEST, Uwe Kleine-K=C3=B6nig (The Capable Hub=
) wrote:
> Uwe Kleine-K=C3=B6nig (The Capable Hub) (17):
>   mod_devicetable.h: Split into per subsystem headers
>   driver: core: Include headers for acpi_device_id and of_device_id for s=
truct device_driver
>   driver core: platform: Include header for struct platform_device_id

With the suggested rename,

Acked-by: Danilo Krummrich <dakr@kernel.org>

