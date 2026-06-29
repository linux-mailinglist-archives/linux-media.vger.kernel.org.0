Return-Path: <linux-media+bounces-66031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3KM0MLUGQ2rONAoAu9opvQ
	(envelope-from <linux-media+bounces-66031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 01:58:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6E6DF4CB
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 01:58:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sakamocchi.jp header.s=fm1 header.b="v8s/eY4L";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="R MKRqs/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66031-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66031-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=sakamocchi.jp;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BE583009F07
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B2E3D3304;
	Mon, 29 Jun 2026 23:58:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1836518871F;
	Mon, 29 Jun 2026 23:58:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782777504; cv=none; b=emT2c/1XRTQA4nYwBB210PbZwDn4Zr7TsPCfpx/aZBXIcg/qV3jS1qjOP488mlerCzjU/TQFGePENg6TdB/tVN7oHIdgHotoaekishfnxjd82RGoz0iu47uR4cRVBNmjOiCuSBemRWyRBdX/H5h/1SK3wIfaOz+NWWiRjiKKmI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782777504; c=relaxed/simple;
	bh=qx9osW3wKKlKpE0YvFkVp52jSRf+weom0e3+8EbHzJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSNUouzR0lUnJ8+TdOrAqv5ol1qwFlX5yRnbW3xPodh/UECFd+A5m0XM8xFtxyFUEkk8gV2X9DBUU0hAZuwsvDBEvGE9c4/S+Hj2qQ5LsnPPFDgE9r1BEZhJ7hxLUL7sHYe4lYDyU/3ds19k9mkG1RqNK8bPanZd9nZdl8h8q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=v8s/eY4L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RMKRqs/f; arc=none smtp.client-ip=103.168.172.143
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 0BA48138039B;
	Mon, 29 Jun 2026 19:58:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 29 Jun 2026 19:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1782777501; x=1782784701; bh=ntoVNrERxl6CnLB0Obl/d+Xz+xme4tJI
	lufgMOjhiwA=; b=v8s/eY4L5HFOcjqnQZ823UAS/LHyaUEm85qu0XmCc71uXnG2
	cvkOxCYPzFLBCTTDnPAcBSYZzJ2+yE6N4fPa6sEGIBJIYZcOAN8qpj2nfzQLi9F5
	jV1vvPyEhEYVlWNvh8/BzDIhVuyYzX2LsFle0pATeuiAfDmcO3X28y0E1iNUPJEo
	v25JyyyfCNSgY9W7bLDK2Py5B4SD2vS47HoLtwLlZyt9XfpB5i8DFFy195aCWoC2
	x+AKL61GGQIyWrIINs+YyoIPvM9+DgmiU0kab1MThff7LoEH0Es/Wytho4Ztqxwh
	iCSNYBGhKHSWeVvvsd1OdF/pOZcK2ttl+46V3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782777501; x=
	1782784701; bh=ntoVNrERxl6CnLB0Obl/d+Xz+xme4tJIlufgMOjhiwA=; b=R
	MKRqs/flHUni4dlOeHuhwjnnYx/qu2zwQCJtPfIIEPz3gE6dP2SS+kO/SxtUM2p+
	fXsMgk2rDlTf/sTkRba30Ghras5RPXULAH1/GPHEEhmblWPHjyqELBYhA/qibNmQ
	ECYEK6oVYBifehsJjj32qWlobcGKFSrZa0HHgz9Iqwgpdu9YvkzR7VNNHw/jTwz+
	bqoNgLB8cMrHpQ6+9NaoaPyDNO4HCQS72/HZv8UteAS8Rigl8p00Y6G1kFdS+1jK
	6qPb3zwn5qYMTokX9EPzqE5AEbRmeo/zQ0VssHNfuoJG0EVsyiXKgURmOHD0sUV1
	H0rRl8dpjOEVmRoTwUZ1Q==
X-ME-Sender: <xms:mQZDaluSBeKP6-3dxlZW1Qy-wiZuV30hOCgoY0KTdW_FR9USmttnIA>
    <xme:mQZDaqsTDIOLYRFhhc3J9nrb24WnM6JX0P1jalpuT12eGcDRrsNO7C0AiHmIdhI6S
    wZZ_GAF_hVaMLpQHvr5u3l1DmczGXIt02C9zTRQlweayP0y6j60MtE>
X-ME-Received: <xmr:mQZDaiaKXC3v0RK_n7k7uRKLanjcoEkW0Ynaj3uQGwXdvyRJ9nlk3vd6xHlSeNwReywIoC38Dirstc3cHFJimVEGnsusng>
X-ME-Proxy-Cause: dmFkZTE1nPznX32V2kRYPd7dlOJ1rQMxQ97lS3kACD5+oEF3K9KIS5kEvZ60kMOO9SW4/K
    QPw1fJ0Uyhmt7TDZBpmrns6QqSMdNA56CqP8WoSfum8fnJ6ROXsuIW1V0IRazJ9YoofPdA
    sTTZjseo2amkBTK2yB8676gAjYCnTj4WiXvzDEoqMGHljUjgOtAHWVMwabts+S3qWRtyzK
    4E9/EeTGdZ7uavjZ/gsD8IHy6BDQ3FsBKJrzbjVNgjW3Z/maBbDFLwVIvKVTB+FB58t2Nf
    6IC6zRUoalXGvpiS7NeraM3cciwz14beoWbfR17QqVpm8xj9z6j1i325oVQMRhakNlULd5
    LZDHjkZMhVaJOCK5sNu7C567TC6G74BcKbIUFX8Y7L5R/J5HFqJpTz5QFRAfF6pNDZXMRw
    NNT721SX2qmWOzpsbLjvz7baHpP6tE5XnMymltgojO/d+aMQ8ZSVKdM2OoEzaoH016syXZ
    LXR91cDsgFgly6bjeAUpymfC5EHpfadwr1qHn8fxadSgempnoWd6aBNScmoRMpmKbMNqfw
    SOO/eYhVEtRjJvkDcQZ5ZyEDYkQzi3vZqOB51rSkn6prTNuNuxVGEjwdaA6cQo5MEz4nhz
    PKvXIWkmhe258dVI/0CMIo7RXUSN9DEF8/fLk8wWAe6GpwU+34F0ICv2ylcg
X-ME-Proxy: <xmx:mQZDasgnrDakzWEqB7_AjeS2c_t5Xc3WBZuoKa0aZ4s3n7SEHjJv-Q>
    <xmx:mQZDavUcRf_YCMSZCbYUJMoSGXurxjrs99xK4QubABtZxnkbGNT_Mg>
    <xmx:mQZDauVcra2E5kWpNBgjezjqhXIgqwPYvcnnMt7uQ1KIYOQ6F3GKDw>
    <xmx:mQZDajhAFNO6LVldX5NJt5ll8F8-azSI6SjWkRx169oeJqn6IZVlXA>
    <xmx:nQZDaqvpp383SrPNL_mk4gMnSCyGdO9-6LDFSBkbgsdwZ1j1U-4qLPWs>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jun 2026 19:58:06 -0400 (EDT)
Date: Tue, 30 Jun 2026 08:58:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	Raag Jadav <raag.jadav@intel.com>,	Sohil Mehta <sohil.mehta@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,	Len Brown <lenb@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,	linux-kernel@vger.kernel.org,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,	linux-media@vger.kernel.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	Danilo Krummrich <dakr@kernel.org>,
 driver-core@lists.linux.dev,	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Ben Horgan <ben.horgan@arm.com>, Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org, Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,	Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,	WANG Xuerui <kernel@xen0n.name>,
 kvm@vger.kernel.org,	loongarch@lists.linux.dev
Subject: Re: [PATCH v3 00/16] mod_devicetable.h: Split into per subsystem
 headers
Message-ID: <20260629235804.GA414914@sakamocchi.jp>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	Raag Jadav <raag.jadav@intel.com>,	Sohil Mehta <sohil.mehta@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,	Len Brown <lenb@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,	linux-kernel@vger.kernel.org,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,	linux-media@vger.kernel.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	Danilo Krummrich <dakr@kernel.org>,
 driver-core@lists.linux.dev,	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Ben Horgan <ben.horgan@arm.com>, Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org, Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,	Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,	WANG Xuerui <kernel@xen0n.name>,
 kvm@vger.kernel.org,	loongarch@lists.linux.dev
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sakamocchi.jp,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[sakamocchi.jp:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,linuxfoundation.org,kernel.org,gmail.com,google.com,intel.com,linux.intel.com,vger.kernel.org,ti.com,collabora.com,perex.cz,suse.com,sntech.de,lists.infradead.org,lists.linux.dev,oss.qualcomm.com,kylinos.cn,sony.com,arm.com,ideasonboard.com,synopsys.com,loongson.cn,xen0n.name];
	TAGGED_FROM(0.00)[bounces-66031-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:broonie@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:raag.jadav@intel.com,m:sohil.mehta@intel.com,m:dave.hansen@linux.intel.com,m:robh@kernel.org,m:saravanak@kernel.org,m:bhelgaas@google.com,m:rafael@kernel.org,m:lenb@kernel.org,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:nicolas.frattaroli@collabora.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,m:driver-core@lists.linux.dev,m:jic23@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:xiaopei01@kylinos.cn,m:shashank.mahadasyam@sony.com,m:ben.horgan@arm.com,m:johan@kernel.org,m:linux-
 usb@vger.kernel.org,m:teackot@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dan.scally@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hminas@synopsys.com,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kvm@vger.kernel.org,m:loongarch@lists.linux.dev,m:nickdesaulniers@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sakamocchi.jp:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[o-takashi@sakamocchi.jp,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o-takashi@sakamocchi.jp,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[54];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sakamocchi.jp:dkim,sakamocchi.jp:email,sakamocchi.jp:mid,sakamocchi.jp:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0C6E6DF4CB

Hi,

On Sun, Jun 28, 2026 at 11:58:35PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> v2 is available at
> https://lore.kernel.org/lkml/cover.1782490566.git.u.kleine-koenig@baylibre.com
> .
> 
> Changes since then:
> 
>  - rebased to v7.2-rc1
>  - rename the directory containing the new per device-id headers from
>    "mod_device_id" to "device-id".
>  - Adding Acks received
>  - ASoC patch (formerly patch #3) dropped as it was already merged as
>    commit 83d53eca7e55 ("ASoC: rockchip: rockchip_sai: #include
>    <linux/platform_device.h> explicitly") in v7.2-rc1.
> 
> This series survived an allmodconfig build on alpha, arc, arm64,
> loongarch, m68k, mips, powerpc, riscv, s390, sh, sparc, and x86_64.
> (Well, some failures, but I see these also on vanilla v7.2-rc1.)
> 
> There are a few headers left that include <linux/mod_devicetable.h>, but
> these can be addressed in the next dev cycle without much impact as all
> the much included headers are covered here.
> 
> I will apply this series to
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git device-id-rework
> 
> which is included in next to expose it to the build bots and testers (in
> the hope that there won't occur much merge conflict with v7.3 material).
> I will add review tags and address (the hopefully very few) build issues
> that might pop up. My plan is to let Linus merge it end of the week for
> -rc2.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (The Capable Hub) (16):
>   mod_devicetable.h: Split into per subsystem headers
>   media: ti: vpe: #include <linux/platform_device.h> explicitly
>   driver: core: Include headers for acpi_device_id and of_device_id for
>     struct device_driver
>   driver core: platform: Include header for struct platform_device_id
>   usb: serial: Include <linux/usb.h> in <linux/usb/serial.h>
>   platform/x86: msi-ec: Ensure dmi_system_id is defined
>   of: Explicitly include <linux/types.h> and <linux/err.h>
>   i2c: Let i2c-core.h include <linux/i2c.h>
>   platform/x86: x86-android-tablets: Add include defining struct
>     dmi_system_id
>   platform/x86: int3472: Add include defining struct dmi_system_id
>   usb: dwc2: Add include defining struct pci_device_id
>   ALSA: hda/core: Add include defining struct hda_device_id
>   LoongArch: KVM: Add include defining struct cpu_feature
>   media: em28xx: Add include for struct usb_device_id
>   Replace <linux/mod_devicetable.h> by more specific
>     <linux/device-id/*.h> (headers)
>   Replace <linux/mod_devicetable.h> by more specific
>     <linux/device-id/*.h> (c files)
> 
>  ...
>  drivers/firewire/core-device.c                |    1 -
>  drivers/firewire/net.c                        |    1 -
>  drivers/firewire/sbp2.c                       |    1 -
>  ...
>  drivers/media/firewire/firedtv-fw.c           |    1 -
>  ...
>  include/linux/firewire.h                      |    3 +-
>  ...
>  sound/firewire/isight.c                       |    1 -
>  ...
>  1649 files changed, 1575 insertions(+), 2544 deletions(-)
>  ...
>  create mode 100644 include/linux/device-id/ieee1394.h

I have no objection to the above changes relevant to firewire subsystem.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Consequently, unit drivers just include include/linux/firewire.h to refer 
to 'struct ieee1394_device_id'. After merging the changes, I'll post more
patches to modify the following unit drivers, since they are left from the
patchset.

* drivers/media/firewire/firedtv.h
* sound/firewire/bebob/bebob.h
* sound/firewire/dice/dice.h
* sound/firewire/digi00x/digi00x.h
* sound/firewire/fireface/ff.h
* sound/firewire/fireworks/fireworks.h
* sound/firewire/motu/motu.h
* sound/firewire/oxfw/oxfw.h
* sound/firewire/tascam/tascam.h

By the way, the changes touch so many files. If it takes more time to
apply, I think it better to make steps to modify across several kernel
generation. For example, getting rid of direct reference of
mod_devicetable.h from drivers at first (in the case of firewire
subsystem, for 'Replace <linux/mod_devicetable.h> by more specific
<linux/device-id/*.h> (headers))', then adding these per-subsystem
headers and applying relevant changes.

Of course, I don't mind to apply the v3 patchset as is in upstream.


Thanks

Takashi Sakamoto

