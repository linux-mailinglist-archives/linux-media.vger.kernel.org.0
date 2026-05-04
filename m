Return-Path: <linux-media+bounces-60319-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEilF1XR+Gm41AIAu9opvQ
	(envelope-from <linux-media+bounces-60319-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 19:03:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C354C1B68
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 19:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EACA730534D4
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 17:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8A83DEAD6;
	Mon,  4 May 2026 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOKZRrjo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DA43E0C74
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914058; cv=none; b=UOiypjou/0VdeOC++Mabb/3PZXF6ZIjyiJ2yufX1mCsW9ZiikzSBC0G9Z3QQnvd07SfB4ROyUqvG5XRZmVzAxkhATTs3HuQG+UTGpsg7078wKvkVy1d2d+wjYA868dpzRMLLNhfbCuEek46k/zKZgrwm3hZmezMW3LBNBKbcoKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914058; c=relaxed/simple;
	bh=SvYuwhoj+MC168s8WF3aTNPzHTkFNFVNcEfomso5Z2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhTIRl9Ybwy0MzlPIl2TUGukzhwKdqUJOGXRnIyuOBzRp36GvUxQs6H+jr2Yy287bdqQwrtYA9Yu3/t6+BuR3ZR2KM+EtuD2xRTDwEdwcw6Ym7nHl8R/ZZJ4k1maFQTSxKpHiBSSYJRsZR932RGLfy1ZP4lCkKr+QtWyCJUCKP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOKZRrjo; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so5432225eec.1
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777914056; x=1778518856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PGmmr1OFx7Ef94Mvp1XVRRtzp0lP2gGW1M3Ai8Oq7U=;
        b=nOKZRrjouj9Z5KU5NC8oAQ4xO2YXGRJr6wh8adt3FXLhtwD53n2iGA3/48Htv/yGyU
         o9cWfA1Jw/qmqseqR6bf1u6rSFulZdehBxtSwTohbTHBgotNoZ1vJTpDaTToi6UQ2T5l
         MawUK0fW8EtfGASyeyigKEeJ/7SAY/KUIWiWq7MKpJl8Uqo7HXKF3Flti0a0kv8JbIh5
         7MhT+d+cEX3MoNdKmdri6jALpFzWe/XWYg1ZuN1sKQZ4skhmAFNNGbb/lrtVqwFBelw+
         WuMkNLrY27C4pnVvAL/XdvMX0A8jkf6oIgTUmEqC6c0Rm6UBuLz5OWdsrZ52QU6pXjri
         kHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914056; x=1778518856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PGmmr1OFx7Ef94Mvp1XVRRtzp0lP2gGW1M3Ai8Oq7U=;
        b=s78We9XlGB/Py/MRSMyG4I3aqX2yl7wD/c7S2Gzp9Zk9ygGv/mryEHGSrOexeaqd79
         JSZ8ByrXZ0Co+mIsg7jnWDaV4VXl+tYPtpTP719tYPLS3Tf2j8rUHoTezFpHUsbTg0tu
         m9UL6QB+dp4z0u+Exh5ZF4RTqHLRIX6zoM52+AYwj8Be/NX8BH0UocLFFKtzU+bPzdZV
         WmMK1sOM7jnAIu/t9zmT8nhQZwbfYkBbvsN8eWQ+M85BYZfP3adnnfFDj/qE6/+BbGVU
         HS1eBPYSKChffw2Qh01k/tO68eO/Znl/CeiNeJEu2Ar4NRUQwUZy4eBjk169IJ1q7qZ5
         pvoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RHgfRim2OjTm2usr8TdK9yDj5L5JLXiLTrEEDXwQYMXWMmDIvDod/1qtmX7VdOx2IxyarWcms/yXFLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9NsyfY55BQRka8pTAMzIhCD/L36ENnHVied92sccfa8R3SmD
	WANi5QUENKKMxsQqYVIj/17iYt8AyLa6+HtRsL9mV9NXIc+E1L2GUFsN
X-Gm-Gg: AeBDiesOHjEgJx31fMjpu3MQ31RMTt0Js0HiaqJVmRZxJxUt2Zx8sGwelMK3DWqfXOm
	kx2JJIxCj88Cn0EA9Lygs9eKBnGuWWksXvpSqoNDjs9C9BVNdIuhIYblp5fXDPpHUOS285v0YI6
	o3EHEzVBdl24EbXuA1gKPTFNlmpsEGR/bRXUYeTXONHKuSnLVeNCIpgEFfQxklHuktYKHaVU6WZ
	bh/RHrG2CU2QhCgfyt3z6lORL+xV48IwEjGIanLQlQTyD0O937eXjiP0PyOoKXpVjBIdAq+z4b9
	fXQj0BofOJ0SFjST2KCqC8lEskIIIYfC5eHAIWNUEgni8HtA3/VQh3/7UVQHk0b+nuhqRgNY9zy
	EcWXkmR/7qdK5KIaVymlolIggxyrP5auKBHIUutFoOWBh6JdLAohQrUSXB/PBMAte/JXnWx24el
	ESjSQkwtElUgTCUy9MECGvG9CYgADZD3JdVpUXyiBSVXDDnqN95XkTj0eJwxpk6f780EHYLORYO
	aPw+8hvS/f5NQ==
X-Received: by 2002:a05:7300:fb96:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-2efb8aa1d96mr5274059eec.1.1777914055733;
        Mon, 04 May 2026 10:00:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5b87:9b19:32e2:2981])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889cf53sm21498060eec.5.2026.05.04.10.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:00:54 -0700 (PDT)
Date: Mon, 4 May 2026 10:00:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Nick Dyer <nick@shmanahar.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] Input: atmel_mxt_ts - Set byte_offset as signed
Message-ID: <afjQpR_PyjsSgI9T@google.com>
References: <20260504-fix-sparse-v1-1-1071137cd280@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-fix-sparse-v1-1-1071137cd280@chromium.org>
X-Rspamd-Queue-Id: 93C354C1B68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60319-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]

On Mon, May 04, 2026 at 10:55:03AM +0000, Ricardo Ribalda wrote:
> The calculations done to obtain byte_offset can result into a negative
> number, fix its type.
> 
> This patch fixes the following sparse error:
> 
> drivers/input/touchscreen/atmel_mxt_ts.c:1481:44: warning: unsigned value that used to be signed checked against zero?
> drivers/input/touchscreen/atmel_mxt_ts.c:1479:49: signed value source
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Applied, thank you.

-- 
Dmitry

