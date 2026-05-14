Return-Path: <linux-media+bounces-61582-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iADbHomMBWo5YQIAu9opvQ
	(envelope-from <linux-media+bounces-61582-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:49:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E2F53F797
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5694C30379B8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8F23DD847;
	Thu, 14 May 2026 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J9OO1quG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B8A3D9040;
	Thu, 14 May 2026 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748526; cv=none; b=tQGEDQpwH/G3ZzwlvTgYr+uYmkDllI+TNl3W1EB+yWDV8IiBFoQF4xIL8vs+rFYxMvQC4xPS8IKhi5saWeL97C6A9nTfp1PP1pg5QhXjsVc8QBtRD6jK+4LrsLEG6iTU2T+B7aUFHGqPgTP3cm6EYhZliRAy759KdQKpn6Av+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748526; c=relaxed/simple;
	bh=1MpxAwxVfLmh97bSasDgW5WHSkVKbVxk2cEZaZyGygY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=D3Sk5LZg6bZcu9DnD/v8ocZHzjIKm0tFG7qIIN8qYTKAtALenY7PctJxf2/UjiLduf0Clj2afG3R6a5KhEKAORdG69qSa50iqfsn4D6H4DOm6XsGhWCKEZ7aPUYhsHT2YcUO3Ff6kbJ85cGTgLetdEKM2ZlCG0CJJf2VlHpKiTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J9OO1quG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25F29454;
	Thu, 14 May 2026 10:48:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778748514;
	bh=1MpxAwxVfLmh97bSasDgW5WHSkVKbVxk2cEZaZyGygY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=J9OO1quGQxYlChpQRJfc2O6MjulSZAv9JOXb+mlaSj0KcW+Sw2ZbtzgRiK1owx0Vr
	 0QZctrAjghEn0tHtXe8Vo8iYcXwb3lObxzyA55E21v/IURVGOVrhUnJ3k3ZUMxgZVh
	 0QATR9mNAwLGMp0BtZjmkrOcTdv0fpKimA77Vqtw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <agWJBNKMi8R5Yh26@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com> <20260501-ov5640_cleanup-v1-8-0869a7802a33@ideasonboard.com> <agWJBNKMi8R5Yh26@zed>
Subject: Re: [PATCH 08/11] media: i2c: ov5640: Document AWB control registers
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 14 May 2026 09:48:39 +0100
Message-ID: <177874851949.2082999.17039652496751513634@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Queue-Id: D5E2F53F797
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61582-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ping.linuxembedded.co.uk:mid]
X-Rspamd-Action: no action

Quoting Jacopo Mondi (2026-05-14 09:34:40)
> Ah sorry,
>   I would squash this with the previous one. If you prefer to keep
>   them separate, add my tag to 07 as well.

Ack, I tried to keep things separated so it was clear I wasn't modifying
values while splitting, and then changing the readability. I didn't want
any unintended changes to be disguised.

Happy to squash now it's had some eyes over though.

--
Kieran

