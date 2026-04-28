Return-Path: <linux-media+bounces-59861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKbRFGLE8GloYQEAu9opvQ
	(envelope-from <linux-media+bounces-59861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:29:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C00E2486FB5
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D037131F5C7F
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6F92580F2;
	Tue, 28 Apr 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H96EuF95"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152103F65F7
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384368; cv=none; b=IuN8WbUJvQikNXmvg1ZAQfFHTSh1sgQ5WDcoaWWOeFMDcYiyHxIDyMLeloJn8s4HoGe/xCg8p6R/+PxxlVtSKpj5u5JwZ8jfml5xyhPS36evcQrZkMtwczSUHHakpjAByJfTLhvbIHJkThVcZjezO7QYLrgMjknX3Qev2KNHTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384368; c=relaxed/simple;
	bh=4Z6Hmsviejwbkx6SPgDRDj4FO2D2h8bGMTAA7pPjwAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCYB83DiHNsLqExdLY5W0zGNHGEGoYfagi/6c33ldhIJNMxUfJ+qWotM0JTNeQxcq05YeCLeI9UMK8U179+vZw/RqMZIvpEGb9dKlIn4kxCz1eNC+OAnedSqyfAgnGMlg/H66UdFYYL07J5q2vySq6oqDuHVFv4URmuxjAe/ES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H96EuF95; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso113091495e9.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777384365; x=1777989165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvN+aQrEQG1INNwJXWKA667EIqAzFBBNzUYu75gRDbM=;
        b=H96EuF95cSsrXFUd3oQ05BHsRrWViJ8v/XipbGNi+4JQwPw7YgMAEpQfbuZa92x6Vr
         U6M61WCI0QyW4efOLJI0Lq5+aDByQTLtVnssYO0nTeNZJAUcz+8Mn3EWzLs7+Y1bQIou
         6Z3hyovUF/1/qUFMGzNa2JGAe2HqITs9Y4LJHqxNTISFt7nhjxXi1yHESEX9XAZCL/Vd
         kLyWJwvzo33vvX3+Re9Aio7IEsO+vkpEEgZnmiVAkvUesAmNnPtp1YRcYndrNQ4reiQq
         vXjAVTPZFQNHUc6ng903FVgqiDpC1/4SVLUW9zw5W6sIgS4V4chwkeNoGEfzkmervdV3
         569w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384365; x=1777989165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvN+aQrEQG1INNwJXWKA667EIqAzFBBNzUYu75gRDbM=;
        b=eq/y242ueEr5XVq0tLJWoPZbUPuMKmxtqo2EyJK5qr4iJAipuuPNjOTIE7yqj+oVf1
         QSH0BkGDVWPQRNMEnpQQwSFSjY0PBkQl77hizudkUYslep1CyfNeIDxD3x9odyqraIMy
         1Eb1RUwz+nQ2RsQEnx5+9y9eZUh/TRG7T8V6L6kmNA4DOR3c7xc0P3sHIK5jvFHWBVN+
         ZhFq6tK6zaJxkFV1UsRMM4kb6e1kybTtuMoBLGDtGeQLcrnu1GFz8QOuBX9ba7EBHqsf
         zKBuYam3jKkdptlXs5O6soCKmUW7N9A0cwdSsfQPdLO0vV8IjMtpa6hzgoHX53RKgHaW
         g6AA==
X-Forwarded-Encrypted: i=1; AFNElJ/h39sffxrjDEP1g2LerLFtT56SYawy6q30PNGp2rypMYMmVZd3bgnDM3nHvVRX6onvKX18FDL6JaqIcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcjua4QugAHWFRIXbZh5t/QGXnvDNdTGxq3HZ+IPFWBrD1R0k
	1CC0b259K488jJnOWpwOYtnPa14yUmZrPlCC8JQyK3ifa8d2zQuGsy6N
X-Gm-Gg: AeBDievGk/8LzMNF15NJzHZtsBP/SsEzmfzHkcUO+Bx9bzjpnCMlluubS8QfOMBWZwx
	wUPbApvM0O7RxdFjnKvASazr0gQJiDd+1LPBKpCw4BypqEGepG/z+Ph/1FwdD4o5WwgEdacj9Ea
	hY8gHOpO0C1BF/BCRXq/0nM8aaeBo0d7jnYiBAnkQIJiSjmoiVei1bHf1gCEH781Kk8w4MkMNIm
	tq+yPMQzULHU7Wh3l5PrxYt2msO8iTZHNW5Cgz6cnoSk6NGcf1kEDwKbDkYt0O15MYMLVTx2SYY
	HD3ds2m/LHPRMQ1hj479g2lWSn9odcrTJliSEF4xbcgtM8kvwzxGXzmszQr5liT++SQgSCSggJ5
	wEVx6atCUYhvFkAKzJvuinCy/OowL7cvz+BagtGJWOd9dGXT6utYlxIrJmIa+rfbQMwIOwDERzM
	5KsMZuGVIczs4Rxhm5ZXIF9YMhE6Ik2RuqDKPwZVpX
X-Received: by 2002:a05:600c:1396:b0:488:8577:d9cc with SMTP id 5b1f17b1804b1-48a77b0ed61mr53199745e9.20.1777384365202;
        Tue, 28 Apr 2026 06:52:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c0b0dsm7062593f8f.23.2026.04.28.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:52:44 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:52:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/6] media: Fix new smatch warnings
Message-ID: <afC7qXCCkTTOS7jr@stanley.mountain>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
X-Rspamd-Queue-Id: C00E2486FB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59861-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid]

On Tue, Apr 28, 2026 at 12:41:06PM +0000, Ricardo Ribalda wrote:
> Current version of smatch triggers some warnings for the media tree.
> Most of them are inoffensive, but we would like to have zero smatch
> warnings.
> 
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127
> drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
> drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
> drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I'm re-writing a bunch of core stuff right now...  Feel free to
complain about false positives.  I'm going to re-write the buffer
overflow warning in the next couple weeks.

regards,
dan carpenter

