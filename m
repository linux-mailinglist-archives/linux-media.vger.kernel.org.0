Return-Path: <linux-media+bounces-55854-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCuIFwG1t2nUUQEAu9opvQ
	(envelope-from <linux-media+bounces-55854-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:45:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8775295CBB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E6C43015D14
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C461E35294F;
	Mon, 16 Mar 2026 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e0JOA/I7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F414534DB41
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773647100; cv=none; b=RRLi5lEYhFFwRsgVbXxRaDRtMn7bhoLGbJeHl3AN5V5gxUDRWO37qOU29098SmkxwIqfZ3ANcrA/z3Thiuhk9kO5epfAy4W1ECcK2rBXcXpo5Eu9GokGOcZcFENr/e2IitSuFu369zjkaTqWc26UuMkm+B/XGzsP5FrSjwkYJB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773647100; c=relaxed/simple;
	bh=1RfqJGfRdFLRXoHUVxP7vta7xyvxWsldHLdDG61UM6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlZa4Yya0pd3rLpt5G56nSUXNaHqb44iPtENXg2U67A/HtnX56go3FfLGjky6um11t9JknBjuGJYHuwSfk5uDOo9J+goqS/oJ5g8dESvIZgK0pzgTafOqX+2A1y0ATrSllQRFShEQeCMtQz6p9nuNd+6qORKI1CbUdmgf+xqvYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e0JOA/I7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so26025485e9.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773647096; x=1774251896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2D0O8SjSzwAzQxCfBFMk6mn5JoB9+VPa05Rt+NX6daU=;
        b=e0JOA/I7666l9T3rV8vedvDGimouNIswWvDYtyAz3IpTbkl90zfbhRHZDoFe59XOtE
         1V/nz66key1oCA8lb69UrEawXvug1sEKtbpXxifS8WF1YANzE8IF/mEUWLACbrlpbQG5
         m3CAMzk/DL7XD9bzjV23dmu9R87dvdYSauFAL2BTQg/Q6jVVOThvMBgi7Dtd41lQscBP
         J2af9R0dociOhQrs+9M0iZ9K+cQ5enY2lfCDqZG8L0khLsFrZ67WTzYcAOpHphJuA0Kr
         S+s0nnkNKvyaInaVrDSgXfPhQ49tP4+f4gpMRFWjlaBBK8M2igmwA6aoQZMsL6/uIdfk
         GkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773647096; x=1774251896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2D0O8SjSzwAzQxCfBFMk6mn5JoB9+VPa05Rt+NX6daU=;
        b=XYiVAqc3Rnb32I5ipPokz/yWcoLELLE5I/eDvSnGigHwK72kKsMDpKmepdCwA9+NdT
         9pXTUg2OjAEM+5qKyNdupWEY0uMwV9AEB4WLMzFOR0pGvCeG98fgKA1mt6Dn0YzSl4CM
         7huWKvRQxRAxFQxx5b+dtJi6JaU2igx5hCmmeq1u2sw6mMZZ9v9SdXTkGJOCSpxt84z+
         YB+cp0LA7KrswwizhtXI2DG1HHsLr0AziJ2etIw+JoV61+iWyNMdmaYqF8wHwkDNIZqp
         TGYvMdqzLgSMeX+wP6SVvb1bu39Oy2kcJuX0REIfmZB6Eh21VGagZZylC0aUg6+wdmbY
         NkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu94c0pHdtguC/7Ob8sBbagddruTcovIcz0U5/jBG7eVASZe5+DWj2ChGLzQ5+AJ8oImLYKXsb6izbZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPgbelap7Exl1DK/hceYscPZ6JJk/Vq7gwFgYy/S5QWxvY1t2
	ALdlM7a0zO86fzMV57VvIIlvKI1wGD6NG2s2NVDVX4MCrnYjhPddcHw8w4UEwc5+B1g=
X-Gm-Gg: ATEYQzw6/VJGmiUJLm95hgXbQ7y3xRzNzPxuYXM0zbEAnFtO+UZEqDZZOVsjt2BXRME
	wCuq19zde06pcWx0WHcQQobnM9q+pnQoZTLH+0uDq/iryp3i8qQA9M5t8Vuko5sk03AqJT5jPHp
	QX6tylFHNsnc0frJAXI3RXhl7LbsZuCgyi2wcFmjZBqzj/uaedgu3iQjpeUZT7AelUHL+qwO9PI
	s63XXIVqurrfeNuNFLR0AFC46oM6RHAG2MXnKGCXYnX+N9kWiRlBWJeQVAqASqFYGzZrOpngAgu
	4Eo1Lxr9rkuVdwlByxVhWP2MjzWPETJmXutIF2iETZ0p+14j31bne8d2VOkqO7wY+qN4Me5DAEy
	X/oImzN7fMLTQmDY0kagOen4M8JkZmd9ArGSSogiOSGeQvILMKnVds6wfaxkaenBO66zpPmVFxu
	6ooME04ydh/PqAeWFQ2BHi0lxg+gMA
X-Received: by 2002:a05:600c:8b83:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-4855648f5a3mr192856735e9.0.1773647096249;
        Mon, 16 Mar 2026 00:44:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6700fsm85177635e9.22.2026.03.16.00.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:44:55 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:44:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] media: staging: atomisp: Remove unnecessary return
 statements from void functions
Message-ID: <abe09JiclfebsrXb@stanley.mountain>
References: <20260312-atomisp-remove-void-return-v2b-v5-1-4f68de466c3c.ref@yahoo.pl>
 <20260312-atomisp-remove-void-return-v2b-v5-1-4f68de466c3c@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-atomisp-remove-void-return-v2b-v5-1-4f68de466c3c@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55854-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: C8775295CBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:56:18AM +0100, Tomasz Unger wrote:
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> index 856561e951a5..0fe5ff64ba00 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> @@ -339,7 +339,6 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
>  	spin_lock_init(&bdev->list_lock);
>  	mutex_init(&bdev->rbtree_mutex);
>  
> -
>  	INIT_LIST_HEAD(&bdev->entire_bo_list);

Urelated.  There are other unrelated changes as well.

regards,
dan carpenter


