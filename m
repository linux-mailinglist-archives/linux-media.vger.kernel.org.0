Return-Path: <linux-media+bounces-62775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHftOQ5zFWpbVAcAu9opvQ
	(envelope-from <linux-media+bounces-62775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:16:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B55D4078
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66E3D30086DC
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA893DCDBD;
	Tue, 26 May 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfVCb2qO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD23DB623
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790572; cv=none; b=fo50VLOFMzgiKQmMF57wo+iL1/q2dzPbcRgG5dn9jc1vZ/i8yy31WkGkQVzymQnCtseDMh32mjErdDOix2xfKgYBquAOjlp/6kMGvFA738P7moBaetOSaFKj1eKNhWl2x7Tvx83Pv0G6gR7eswNOEYx4t8cmYI/WY3NliMr/Cj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790572; c=relaxed/simple;
	bh=rN2MvPfs055AMgL32gwkCjC3SyRQ4Iy9ilVef64xrEI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mEqeCDxLQ5msJJJhEhyRGlA2O3CJQeYcYwg/Rwt8X2e6jghAHk1j+FkQUF52L6ECndPYQkd0dBUZ708W24zVf+iYccJrb3liXj+eSs2gN3QTfUVvKH1yVokePtbVXR19m7yW/uQ6MMRnti540vIFVvJMvauw00Ru/1Twp4+V/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfVCb2qO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8ee4b703fso9447114e87.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779790569; x=1780395369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhVntoO4L4jeG0qFQfrSf/BPrwX4k6HGmZPXuadJ31w=;
        b=bfVCb2qOa771zVdSOZmauf20nHrbjODs5HFrQbhW5gTzAhOJ6cDiED7MODhAa642Gy
         xLPXstQqkBOPjVjPieqRYmwy3IqUZSyPgMjl5TPq+O3kQ+iAmmtQL8xxHwwweILaULwp
         qxoAC+W8lRZAg79QDJCjpmKopgqTcPFEqc7JRtZlmLzDO+62Z/w+uPBK/obtmFiw2S27
         AaNVeJPoMVrLPZV0y9uDE3MgO5L+uIhrJWEAcmVNTBqWZuHUykarPm2Vs3DJFJiwSIq6
         ueW4z2JL1mhFDWZJi9KZYrmAu1yKiB7i3gi+motY3c1I2JasGpxIpwkIuYU9zjEZcfar
         zOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779790569; x=1780395369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhVntoO4L4jeG0qFQfrSf/BPrwX4k6HGmZPXuadJ31w=;
        b=W4QJ4wb8rOwJ1ZI5uvL8KQmjPUz9UYLCecM7wZ2TL90oLrbGMKqCZiJb2iqPKF2GmZ
         jlbVfhtvY7s5Z3jVxPODBSQ102HWo5WdDZl9RvzqDu3ROeJhs1fEvloxCN1EdBS6ur5y
         xWG9a9XZmLkbmIbSmWHhDlQkeXq9ehP7f9JbvkcxTFUPjRL6aygXVBh1Nargu201JuwN
         /H0Ie1C8u94GDVu9kKCjyfL0nujuEbxZxo3pD4dmgnDLO9KCK3wP0H+MBeSJvOslBAxQ
         wm+BQrM7eSUyddIRb9sGQKPIQjzCb09K9wRWwh++wyBER+YZS2n8HVhOeCe/b0ZJg4SL
         gVDg==
X-Forwarded-Encrypted: i=1; AFNElJ+bCnCD8gg9PzdDPpIGdin1OfUptU/TekUAdOXZumVRgtE9gK5/qW+6MAbXth/NuWJ+2nuX9mYKm81MyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze+G4ub405o46bRPIQVfiyWZWlZ1a3vuNJOJNQrl7EO4F+bYXq
	XKd9bCGj5R9MQItpn4Z2e8DeT5k/kVQaCB+KLt3IWavHkGjHIvgVVF39
X-Gm-Gg: Acq92OFVgG+fR15G6P/rXLSdGaEbVE4pOf1zNrI6EoZTXcrIexaIbDQUPzkeKqCkjRV
	v6E7feRSQeDhb/e0ty6E8cnO/L0zKFIpqRieG3crlIu08Oc9inBYIMBwcDew71E/ObLvkFYxc3a
	y78cApRFx/bXPTHvNXqwkkj+hkJFGArN0Fb6C1/KkzhnTrZGL8OpOd+TVANebnprtdh8BZs+O5l
	zdy9XaxWgjW0zabDOPhTgwEhGAqiKRhiZVNC0RdJy7zO/ZxxMwK7VW1bvyJDPyfMyiVbTdvFfMR
	GSRuO6LLdCMBmvN6U0l/U8B05ekcSbO6T4Ucci6nLQznkhDA/CrgpymrBdzHHvYSCy8qRLJGEJk
	lbEZPV0w/RRf5LJVK40+AjlTSzrSQoEv3gtPgc/I4mu1nGDXVpx+lozLnZQq9tEW3m45zg6M4hK
	LpgWxoCZaZD44HIEqf9Ox5HQ15BUf5icahKQM=
X-Received: by 2002:a05:6512:3981:b0:5aa:2a30:217a with SMTP id 2adb3069b0e04-5aa323dbef6mr4963905e87.34.1779790568814;
        Tue, 26 May 2026 03:16:08 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462cf605sm333990e87.15.2026.05.26.03.16.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 26 May 2026 03:16:08 -0700 (PDT)
Date: Tue, 26 May 2026 12:16:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Lin <henryl@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Message-ID: <20260526121605.332525c6.michal.pecio@gmail.com>
In-Reply-To: <SAWPR12MB99911841F75A9492A6FA875421AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
	<20260526015514.466b72d4.michal.pecio@gmail.com>
	<SAWPR12MB99911841F75A9492A6FA875421AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62775-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4B7B55D4078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 09:55:19 +0000, Henry Lin wrote:
> I tested 25e531b422dc ("usb: xhci: Make usb_host_endpoint.hcpriv
> survive endpoint_disable()") on the affected setup, and it fixes the
> issue.

Good.
 
> With that change applied, repeated stop/start cycles complete
> successfully, and I no longer see the uvcvideo -71 transfer errors.

Were you seeing one such error for each restart, followed by uvcvideo
dropping a few frames and continuing to stream normally, or multiple
transaction errors and complete functional failure?

I was seeing the formrer on several tested HCs, except for those from
ASMedia which never completed the affected URB at all (IMO a HW bug).

I think multiple errors would also be an indication of some bug,
possibly in HW, possibly worth looking into in its own right.

Regards,
Michal

