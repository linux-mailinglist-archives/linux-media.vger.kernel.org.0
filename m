Return-Path: <linux-media+bounces-59862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OesJ+/C8GloYQEAu9opvQ
	(envelope-from <linux-media+bounces-59862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:23:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A41486DB5
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77DC830D9767
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0301843C063;
	Tue, 28 Apr 2026 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gX0Fd3x2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268542EEBA
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384706; cv=none; b=BISDgpbWQ/RNoaCrBOkB1dzpxldlNyCj1gprbsJnN4NRdJ6EMluItuSeisWaGCjcwcLWg4u6VUCD8aMxPkY+p7KaS8d1y1OUAd0SOFl10HEGyozXiK6yavBde7E2bfDMv2aV/q3pBrusL+MVjfrvIdNBpecjfyVTNDU73cIYXMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384706; c=relaxed/simple;
	bh=YUuWQHUFJHFX0a/heeDHaCC6p018XOr4Etgk+Jrwurg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fq6n209l3HTwAmz2mqEciebg8sU4m54boZQm7/LStzl3uT1F2Aomnse1FWQu30AkUVSzcC8EGDARWHXbLGuye6clBrfYRhVRV6VaFTDy+9bdGpj26N3bojrn5sVFo3RM45AQ2WYSGfqFSHlMUoSWJAoQi4JpQBQUIh8jpcN92nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gX0Fd3x2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba6b39871a3so1454188166b.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777384701; x=1777989501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zuh0L2ou97F5J1Q89+nkH3GU/qVTw9rZ5VYJg149j5M=;
        b=gX0Fd3x2YRTZanYLzxmzba4r7wKyMxkzCXSd1yi8U4roGu+hy275F02XzpJ6o2jy9g
         l1k+KGsUxWbUg4pP+v08WUgD12dzYvVoH+m8coVuLPhSuOaVcq117bWHE9KEgQ07Si9M
         aY9gnZ1unUB4hqyftweMxxevTfmvii+U+vfaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384701; x=1777989501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zuh0L2ou97F5J1Q89+nkH3GU/qVTw9rZ5VYJg149j5M=;
        b=i4aEIXj/TINzSvUXCds97jnbV5WDCysZVpHeGmg0ZvJSjK9ZVr0UdSUmblxNZJ5NiN
         JvVytasIePXzUNDxq2TRMkaGwz3SYcaULhVyXiCsS0xEH3UnpxT5fJZp6bdEz8nTKlFQ
         A2wVuIRIAazUlcusoIz4cFWmjcyrc6LsfCstq5focUtiMEg1xutqifklN1t8FsR9ejND
         gO1/MByeWngDA3BHeI1H1gAHjl8WooZsSAwpraXX4tCHGZb/yaAyjwe9TvhXUixtVkVK
         IGb7KzqAOVeFYnsGocp86Fw8rykUaVagEZig7sMN3BhNWCDbb6y6RdiHMsiGoc1DgIJJ
         aDRg==
X-Forwarded-Encrypted: i=1; AFNElJ8Bv5iOGMCgmTfXPRBlxkNSlNnfibqc4HUxGytYiAH4pEjtAdV+wk0IfIqnElYd4U/9jNquptCvH8nJbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe7YD/FRCj/jlBGxWDN6JAHC/V6kXKx+7Nk9fBT784Qxx+UbDj
	526zhGCYYxM3XlFoImjMmKp53QUMOHy+yzOvh551aX32HzcM7ByeuCxjik2MRB5/Lz3wnaGg1As
	PRsp9xPDz
X-Gm-Gg: AeBDievfLXOrhs+4wobrtwvfKXNAjKE9iJh0kDw/i1AqIcWTcTexTuN3IwTdiKyIGaz
	R8gz7k3ylPB1YMk0hi5wy4mkWDOgEA5MuVMIno1Jx2EweZi21FEauFHl6GlTJ+LNKYhyDBNjPWs
	kwiRPZbSktxEzn14Qv9e390lvKEMwLgYpZe0HPJAZvz/78nUMd2WFP0xwjcXXJJB9yRnGEwlCL6
	ekhoNlm917TdU2jm1XA+9zjCBu5C2eLaLVc3wwuEnF1Dl9x2cFa3ZQlkPNRpxuNUcMjY/dZfv4R
	A4X4kdFpMBobyowIC0DV63wlVwm7957mFRqUPB2yQl5FFz9raRtXcAvU0qgMSXaDCYDZd0X1qro
	3POXJe8P0qa5bh3a5ATZ95lnMshZLzv7J1Xw1eoERMestKtond/5WKmVTMNxc7UPYJNXmo/8fO2
	iVx1vKs8uBsseQn0Pufae0uNn3RVJS7qDY7FBFABZM6FjHDz1otuifZ6/12Po1NDjOpAU8mC0=
X-Received: by 2002:a17:907:728e:b0:ba6:4eea:c1e1 with SMTP id a640c23a62f3a-bb847b270cbmr122109866b.17.1777384701421;
        Tue, 28 Apr 2026 06:58:21 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb89ffab9b3sm62259766b.42.2026.04.28.06.58.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:58:21 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba3115fe0d5so2016242266b.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:58:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/CLdYaiBm+yUe0zrNyas8vc2qcokbyMCjZLxCX14+XbCj0mEICRJDY3Yj1IP0Pi8PN45VkKdxQuAQ2LQ==@vger.kernel.org
X-Received: by 2002:a17:906:6a28:b0:bac:6585:b02b with SMTP id
 a640c23a62f3a-bb846d629b8mr154647166b.9.1777384700081; Tue, 28 Apr 2026
 06:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org> <afC7qXCCkTTOS7jr@stanley.mountain>
In-Reply-To: <afC7qXCCkTTOS7jr@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:58:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
X-Gm-Features: AVHnY4KSxj-3Id50OdGKMMLxc9W5Lx_IbFbVckx8UjhHCc5VdI8JIttSLEpvHFA
Message-ID: <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: Fix new smatch warnings
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Keke Li <keke.li@amlogic.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 00A41486DB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59862-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Dan

On Tue, 28 Apr 2026 at 15:52, Dan Carpenter <error27@gmail.com> wrote:
>
> On Tue, Apr 28, 2026 at 12:41:06PM +0000, Ricardo Ribalda wrote:
> > Current version of smatch triggers some warnings for the media tree.
> > Most of them are inoffensive, but we would like to have zero smatch
> > warnings.
> >
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127
> > drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> > drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
> > drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
> > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I'm re-writing a bunch of core stuff right now...  Feel free to
> complain about false positives.  I'm going to re-write the buffer
> overflow warning in the next couple weeks.

The only one that deserves a complain is this one:
https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#m650723c33ec0318d8f32f1a6cc74c74a952ae11a

There are other false positives like this one:
https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#md58851baa54c511f57b05a4dcf3aecf0ffb1b1fa
But I think the extra check makes the code more robust.

Thanks for your tool :)

>
> regards,
> dan carpenter



-- 
Ricardo Ribalda

