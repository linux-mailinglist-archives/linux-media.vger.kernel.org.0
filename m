Return-Path: <linux-media+bounces-63028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PFbK899GWr3wwgAu9opvQ
	(envelope-from <linux-media+bounces-63028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 13:51:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C8601E18
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 13:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3AAB314BABC
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D493E36A36D;
	Fri, 29 May 2026 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ZoOBoPTY"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7353A37106E;
	Fri, 29 May 2026 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055136; cv=none; b=IKfT8hf5crCOzu9X3GKvqkG9oHeY0Dwj6OP5UXaS+aDtXngQy3WdXPu6fgzzcW5Rw6EpVlOAOoxLBg5DQMeePf9DuFbMofpRr6Hutj5KN5ULW4fNA8XdR2aKrKv3rlIGhAn/BU6pJlv9lSSoFrl2EqPTKgZboP1zovaw41Z55Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055136; c=relaxed/simple;
	bh=+Y5pr1tUtowdq4cGdCkoGxL6d1e+ZMqe0Src+FHo/gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h/lrjMj+E+V90qYIcbiSbI7Lrkq/6owM61xPNcpmqzFOJNO6y1hzjkqw7XinXDwC3whYdMH6G0UJyXPcgyrooRPZbEuIR7cB25v/6DuPHJY2kXn2/39pmdX8x5SQ24ZMcWxUjW9CDwL5J6GmUFEDQsB4xP6jPjBP+M19K3aUm3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ZoOBoPTY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OsUANOWLHKOer8SDTCbPpoX6AoZe8u2V4LnMwcLy5iA=; b=ZoOBoPTYgtLqwe91Tke96Elckk
	2JzMPczz4LtDrQ6kqL5HiO3UT78giBGarZ2ccbzg9Ew+7SPP1yUPfKE9XQ+m42LfYELqkSe8ZV8of
	RK4quJgk1VDbZfRDM/3paRUbUwShr6YjMeOV+biHXGTzg6AwXjsj8P7xgqyG0QXqNhnaG3E+/eIJ/
	CJmFKmVsSaWX1ad9SyNxnZ09PBDojtuRm7AUQH5oPzdEVAW/n970ezm7TZ89k5yEw5FxgC7I4EZev
	QiGNOU4Mlvu8rnr2W76SNikGepa6UgD3blySqraW9DGF35a+dp5F/l8IE7uAlQiWXLRv7sp3AYu/i
	G+KjkZOg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?UTF-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2=20=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v5 0/8] media: rockchip: rkcif: add support for rk3588 vicap
Date: Fri, 29 May 2026 13:45:09 +0200
Message-ID: <178005509966.4123143.16381895849368924420.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63028-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 306C8601E18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 22 May 2026 23:23:06 +0200, Michael Riesch wrote:
> Habidere,
> 
> The RK3588 Video Capture (VICAP) constitutes an essential piece of the
> RK3588 camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...). This
> series introduces basic support for the RK3588 VICAP unit to the rkcif
> driver, thus paving the way for video capture in general and for camera
> sensor image processing in particular.
> 
> [...]

Applied, thanks!

[5/8] arm64: dts: rockchip: add vicap node to rk3588
      commit: c7126247fb797127ced68691583932d0a05bbd68
[6/8] arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
      commit: bfc2779116ab7636a08c254d76a7a43d06feae1c
[7/8] arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1
      commit: a34ae4f44c9ff4f4170dd21cdb22efad63710af4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

