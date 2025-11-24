Return-Path: <linux-media+bounces-47668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89269C81A9E
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 17:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 988453A9BDF
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 16:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99997316189;
	Mon, 24 Nov 2025 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="eVMzGw+l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CC1305053
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002988; cv=none; b=IRO2w44xn8z0yUaOQxnPtd02AMn0GqdVnLUBBGnjrL2zZp3Ajwm+WTTTd7ean3Iud1e9APDuC+VtnlmyTNaQ4whSPQASnbTSs4heAmqjruV8W3Fj6xhqoiLmQsocXy7ezpw0OoaYiWVvC1IkY80cBeO2pG1lQCe9LrIqU5abXHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002988; c=relaxed/simple;
	bh=5q+m+70L8W6/MtJ6J2PXmMYiDdxIy6zTsSH9/gU2w/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogjF32BJDTVKyNQvbVBhVPTNGkxdF1PkN1vPJbWBdpDtHbqImFkBawfyHpKycZ2vAt0Gkr2+VphRHkQHqllY2CxN7KCtqDpyYx4HnRP7W5iyeUEaR7uOuNc90CAwycmZaXG4AemEjTdvbWEfqs5VluGobOREdDx21ujUNIdi27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=eVMzGw+l; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88267973e5cso28416476d6.3
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 08:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764002985; x=1764607785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=32HmhasQZgNPGsGzmYAFxW5zQ2p5OywfOicHnjZoIfo=;
        b=eVMzGw+lIe8BpaRm7SNXkhBwUf5p2wiC/6j4zB7TUH6aw68gp9PE3fChtD/wM/Aicy
         pcSDwcOrU0L7dBg2J1jKg9Qxx54gxHoQh7KEd6xJzwd4zI7SMHPGlQuKziB0OXkp96a9
         05hIeXotdEnvpTaGwRR/vIp96xp0XTU393Fv8TAv6s5lPw5RZgwyx+wsTgLtM+MduNju
         hSf8JQ5OmHGP51N580YZl4QH31YGs65Bf/YMcRJzqPydsAF1rbK6tK4K+g1HRUDQdOPO
         K8tONuYzVe9aSwh6QwePWp7EK76LZGZ/Od/e/aVoTOhScOgsNPLoJ63lcI0Fq4tymk5m
         cl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764002985; x=1764607785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32HmhasQZgNPGsGzmYAFxW5zQ2p5OywfOicHnjZoIfo=;
        b=jGu2bwJfDpdSY8hqrP4/JGdL4eGgcBf5f5BkMf2OjElbLfrDy3K0muybM3xUciwiIZ
         liNS3WhG+qNrqvEs+vhRZnrNZsbVFW/K10z5vZPxINVPvGt+qKnTbV9OfDyK321rJp47
         XEJ/IEot0Vs2/MkgoVjoCKfAd9qV6H+K2s4bWChQKMYjiZCXXeXORtVzwpKF52RDVKXb
         ie637FCG+FP7zCwemiFqnz8Trb9l8d9bypH1WipADhXTp/ZWFoHv4v/RaXUTO0LflUWX
         CCeyXb6EROTPb67zLkuV5lR4s+5ygEVu8+Fri8QNDT4uKoj+OTKuYIOtMyK9g7SfZC5J
         E7Mg==
X-Gm-Message-State: AOJu0YwORhG+4VE7ZFIEpPcFKqn25sS4L6B4nz2+qVS2OzdhjNUAb7L2
	qxkw91k+51GR7o6N6IfekVyM5Tq9Bcp//W6bEeb93xjRveHlZOwPkE23v3QGTGNxhQ==
X-Gm-Gg: ASbGncujvCh+gkY4FC8vkB9/JdP2AA2L8pIu7NUGpdAteK/JbU4RYkTw2wBARatFmNv
	XZp4bDpnhi7NuvgAQdfXBZrA/faFp1jECiiTD43EgaPAcrqx8r9qi0WtjFV2Sbsk8HR60BkvbxX
	C19prtzfaKng6Bn7qPCeZdwtQtgtg5ZfrSLzJpNDWF+/5/KJGSxmMI3+mYbMf2qXMZaa9JsTSKl
	r16mM/gEBqeSZdrmhVGTqaghbuDXeDfm+yNRq5TiGwJdqeSmJ9fyhdDjVfldT7LGKacIrbq986V
	I33MW8ymYdCxg3b+GGDH1LQEQxT7nFltCNId+Q5xLZvIAhJY4mszMrKuxQDnAADU7T2UN1K+MKN
	SZu4K82yTr4m9GIZLuncTmc86egK4NXeBTNzEiuP2OCGMbpNPpgtDlt2mxLRNK29jHgj+xD2PW+
	B9yn9qIKLFb2VH
X-Google-Smtp-Source: AGHT+IHocwxdXpk5RDYixJT4zq5tyh6blA48vmJIcPgVQzo441r/3lc83iLf5nSVxOzoet7kQOBP2A==
X-Received: by 2002:a05:6214:19c5:b0:882:3ecd:20ec with SMTP id 6a1803df08f44-8847c57a6c3mr180093406d6.60.1764002985111;
        Mon, 24 Nov 2025 08:49:45 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54c32csm103250496d6.37.2025.11.24.08.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:49:44 -0800 (PST)
Date: Mon, 24 Nov 2025 11:49:41 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antoine Jacquet <royale@zerezo.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	lvc-project@linuxtesting.org,
	syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] dvb-usb: dtv5100: rewrite i2c message usb_control
 send/recv
Message-ID: <1097a93c-89d7-49e1-9b36-3fb9e51ede54@rowland.harvard.edu>
References: <20251121132332.3983185-1-Sergey.Nalivayko@kaspersky.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121132332.3983185-1-Sergey.Nalivayko@kaspersky.com>

On Fri, Nov 21, 2025 at 04:23:31PM +0300, Nalivayko Sergey wrote:
> syzbot reports a WARNING issue as below:
> 
> usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> WARNING: CPU: 0 PID: 5833 at drivers/usb/core/urb.c:413 usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411

...

> The issue occurs due to insufficient validation of data passed to the USB API.
> In the current implementation, the dtv5100 driver expects two I2C non-zero 
> length messages for a combined write/read request. However, when 
> only a single message is provided, the driver incorrectly processes message
> of size 1, passing a read data size of zero to the dtv5100_i2c_msg function.

Then why not fix the validation instead of trying to cope with invalid 
data in dtv5100_i2c_msg()?

> When usb_control_msg() is called with a PIPEOUT type and a read length of
> zero, a mismatch error occurs between the operation type and the expected
> transfer direction in function usb_submit_urb. This is the trigger
> for warning.
> 
> Replace usb_control_msg() with usb_control_msg_recv() and
> usb_control_msg_send() to rely on the USB API for proper validation and
> prevent inconsistencies in the future.

The reason those two functions were created was to simplify the calling 
sequence by removing the need for callers to allocate temporary buffers 
-- not to do any extra validation.  That reason don't seem to apply in 
this case.

It seems like there would be no need to change dtv5100_i2c_msg() at all 
if its inputs were properly vetted.  Am I missing something?

Alan Stern

