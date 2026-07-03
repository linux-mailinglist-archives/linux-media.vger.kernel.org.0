Return-Path: <linux-media+bounces-66435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Ip5MwBpR2qMXwAAu9opvQ
	(envelope-from <linux-media+bounces-66435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 09:47:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B32F6FFB65
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 09:47:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E7fzZHQj;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66435-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66435-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A32F43037166
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 07:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588AF36B067;
	Fri,  3 Jul 2026 07:37:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0DC352010;
	Fri,  3 Jul 2026 07:37:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064275; cv=none; b=YxJAf2Uoj2J2FzV71Au/s7OL5wa/l9PuWmrsEi3/SoED0Vn55IuDKGTjcIxG50l/WLThWdvj8ygKI9fsGAw1O/91Luq1I4aaQM8VdGgkSWHLo1jTqpQ/YBiIFcM1oDRoTZr7K0x5q78NY/M+sOktHteCtRVBrG8x40K15645iYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064275; c=relaxed/simple;
	bh=/zEdjDHHDOZlLYDj/HrAahZZ9YvreIDGoxRLp/b3nmc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GGt190/paI8ppa/vkzHoMhH7vj2FjlLiaXho3tJL5WVg+G9SXLyGzNhzqYKDWN612x/NqkfDqn6C2ZwYBAI8jS6tntZXySna6YiIwTVs5HetdDAF9U92csY1UroNZY6Uv2F/rjXxmyTey+B1E/TlUjzhDIX3grldEVFXVJsqP4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7fzZHQj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69951F00A3D;
	Fri,  3 Jul 2026 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783064274;
	bh=BNjc89ZTwEE6sAh5F09SyQEpJODWyJuS+YsA1L114gk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=E7fzZHQjHbuqRbfY5w8N/zq/LIGZMJY1SK41CeUUib7CZ4WxWm5MqtADiZytRVf8k
	 B6AmxstGKgmn9k/gnWEMrYU/U8prhEH9/KBSrez2/6+NEuF1ehCnCime+EeHT7H/Vc
	 3uPHNJ7e7l0I0rxnW+Hr072aIgsDpQNOHShnhFE32hDNXp6obtBsRggP9gjJ9qOPxF
	 gm5mTrJ5kP99/8S/EVRiBrZq6SeYg8SxwOWKk+cApIcZjDHtKLqJQAQJJvgyCJU9Xh
	 uvtmeyMNf/xe4qOOa2+jWsvz9DD00nDyID+u4LEyyFtC11nrDHmkAIGykMv8cZ9zSV
	 H59njUBru/Yjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56D2B39389CB;
	Fri,  3 Jul 2026 07:37:38 +0000 (UTC)
Subject: Re: [GIT PULL] Split <linux/mod_devicetable.h> in per subsystem headers
From: pr-tracker-bot@kernel.org
In-Reply-To: <akdIS8mW2IubUWQh@monoceros>
References: <akdIS8mW2IubUWQh@monoceros>
X-PR-Tracked-List-Id: <devicetree.vger.kernel.org>
X-PR-Tracked-Message-Id: <akdIS8mW2IubUWQh@monoceros>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git tags/device-id-rework
X-PR-Tracked-Commit-Id: 995832b2cebe6969d1b42635db698803ee31294d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2c9a99135da931377240942d44f3dea104cedb8
Message-Id: <178306425679.2510133.17664517627067155845.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jul 2026 07:37:36 +0000
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Raag Jadav <raag.jadav@intel.com>, Sohil Mehta <sohil.mehta@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dani
 lo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Pei Xiao <xiaopei01@kylinos.cn>, Shashank Balaji <shashank.mahadasyam@sony.com>, Ben Horgan <ben.horgan@arm.com>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, Nikita Kravets <teackot@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@ker
 nel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,gmail.com,google.com,intel.com,linux.intel.com,vger.kernel.org,ti.com,collabora.com,perex.cz,suse.com,sntech.de,lists.infradead.org,lists.linux.dev,oss.qualcomm.com,kylinos.cn,sony.com,arm.com,ideasonboard.com,loongson.cn,xen0n.name,linux-m68k.org,linuxfoundation.org,ker nel.org,sakamocchi.jp,sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:torvalds@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:raag.jadav@intel.com,m:sohil.mehta@intel.com,m:dave.hansen@linux.intel.com,m:robh@kernel.org,m:saravanak@kernel.org,m:bhelgaas@google.com,m:rafael@kernel.org,m:lenb@kernel.org,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:nicolas.frattaroli@collabora.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,m:driver-core@lists.linux.dev,m:jic23@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:xiaopei01@kylinos.cn,m:shashank.mahadasyam@sony.com,m:ben.horgan@arm.com,m:johan@kernel.org,m:linux-usb@vger.kernel.org,m:teackot@gmail.com,m:hansg@ke
 rnel.org,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dan.scally@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kvm@vger.kernel.org,m:loongarch@lists.linux.dev,m:geert@linux-m68k.org,m:gregkh@linuxfoundation.org,m:broonie@ker nel.org,m:o-takashi@sakamocchi.jp,m:wsa+renesas@sang-engineering.com,m:nickdesaulniers@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66435-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml,renesas];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B32F6FFB65

The pull request you sent on Fri, 3 Jul 2026 08:04:04 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git tags/device-id-rework

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2c9a99135da931377240942d44f3dea104cedb8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

