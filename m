Return-Path: <linux-media+bounces-53060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPQeHWYGlmm4YQIAu9opvQ
	(envelope-from <linux-media+bounces-53060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 19:35:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F6158BE9
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 19:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70C41301184F
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7849346E41;
	Wed, 18 Feb 2026 18:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sandum.net header.i=@sandum.net header.b="Ic/D8Hm8";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="GYi7A8r+";
	dkim=pass (1024-bit key) header.d=sandum.net header.i=@sandum.net header.b="JhOQETpL"
X-Original-To: linux-media@vger.kernel.org
Received: from e240-7.smtp-out.eu-north-1.amazonses.com (e240-7.smtp-out.eu-north-1.amazonses.com [23.251.240.7])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B927FB05
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771439705; cv=none; b=rea20T4pEkNAHeQSP20rJK+hRlqCy/lwTYdD34gdKru65EquKZ+iTKQzMHLtX5BKkGO3CKFkACanwaoabvzk286fBhpvKHQgJWw9CcXcrm2b2+/Vl4shhYc4740rE/ILG0PUyQVZiLdTaidTYxNzVsqMDFUZSFIZ5N1zhqCN3Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771439705; c=relaxed/simple;
	bh=D0LvmqiIHcP7jF63fovj7naOfzhOdoa4g8WU2SSsjYU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=D3dG/djx433T1lM6eCoeWTdtp/GHVUPwrE+HPecJBZGI65YyRyjm5u91gUDhG9zUrgYoI6MOiQBXFxhR9jjiehMGvC9g8ZzR79pwY3BGvcPi+oYcoI0detW6sLonK8XX+Eswz6b7BUdTjUhVkaqSAF1Ug3EaMuPwsDW1HEaOqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandum.net; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (1024-bit key) header.d=sandum.net header.i=@sandum.net header.b=Ic/D8Hm8; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=GYi7A8r+; dkim=pass (1024-bit key) header.d=sandum.net header.i=@sandum.net header.b=JhOQETpL; arc=none smtp.client-ip=23.251.240.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandum.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=mail;
	d=sandum.net; t=1771439702;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=D0LvmqiIHcP7jF63fovj7naOfzhOdoa4g8WU2SSsjYU=;
	b=Ic/D8Hm8z4U1us+0MGCar/7u5pm2et3tnd3zfd3ZZq3zr+JokdE3x41tCzwiVB6i
	/l0yNJGh9RxntKSi9w0rImqvzKUSMlw0aN4UOmyG/bcAZhQR9vAHym/RFY3NG5hsVxp
	XhYbXw/P9g/sg/7rOBeMU5ZfQi+1D6LIIb+4Foqc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=icdr7g7fbtu2nwxgaimytihkt42k3kiy; d=amazonses.com; t=1771439702;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=D0LvmqiIHcP7jF63fovj7naOfzhOdoa4g8WU2SSsjYU=;
	b=GYi7A8r+S9rudbB3epVdU4dPcqGYJgQ6oE4j9kTzWeWmXJ9xwbDtOfP7gg6s9KFT
	Yaunh1gEFHQGMU9AQ2INKD2fchGTpSuhWVYFYV8B6ooyKdNPfg2ayP4KNRw1IvggZ2q
	3QPZd302ikeGF6h1Ui4USXf6y+1FELdt3u46knXs=
X-Virus-Scanned: Yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sandum.net; s=mail;
	t=1771439698; bh=D0LvmqiIHcP7jF63fovj7naOfzhOdoa4g8WU2SSsjYU=;
	h=From:Subject:To:References:In-Reply-To;
	b=JhOQETpLA9Vca7yfF09qaDL4LMYMIkvdXVUhAqw4JvfZVbP6R7rQj2NUnEvjvDU5F
	 rhlSaGTFMu2Gg4fouWM9mrpSCl4mHEL8jLOkyqzH88IXiWxgvlj7Urc+ddTyR+nDoj
	 tfA+meo8d3OXpeobyIVjWYpZxb/DrcpN/OJB0p0g=
Message-ID: <0110019c7208bf94-a8eb3ab8-26cd-4f3e-bb41-a0b1a16033f2-000000@eu-north-1.amazonses.com>
Date: Wed, 18 Feb 2026 18:35:01 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ole@sandum.net
Subject: Re: [PATCH] media: ipu-bridge: Add DMI quirk for CVS-sensor
 dependency
To: linux-media@vger.kernel.org
References: <20260210084152.332001-1-antti.laakso@linux.intel.com>
 <0110019c622e1880-12e257f8-af57-4538-aad4-686c363a0695-000000@eu-north-1.amazonses.com>
 <1af7c71b-3074-4892-a545-e6a9338bc2af@oss.qualcomm.com>
Content-Language: en-US, da-DK
In-Reply-To: <1af7c71b-3074-4892-a545-e6a9338bc2af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-north-1.qSikLe0Jy8zWf8HK3WPYFlhgvEvJUmYq3aaZROsKEro=:AmazonSES
X-SES-Outgoing: 2026.02.18-23.251.240.7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sandum.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sandum.net:s=mail,amazonses.com:s=icdr7g7fbtu2nwxgaimytihkt42k3kiy];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53060-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ole@sandum.net,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[sandum.net:+,amazonses.com:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amazonses.com:dkim,eu-north-1.amazonses.com:mid,qualcomm.com:email,sandum.net:dkim]
X-Rspamd-Queue-Id: B56F6158BE9
X-Rspamd-Action: no action

On 18-Feb-26 17:03,johannes.goede@oss.qualcomm.com wrote:

> Interesting, as a workaround Fedora has a kmod package with
> the out of tree driver in there for now. It would be good to
> add that udev rule to the kmod package, can you share your
> udev rule?

Sure, here it is:

   ACTION=="bind", SUBSYSTEM=="i2c", DRIVER=="Intel CVS driver", \
       RUN+="/bin/sh -c 'echo i2c-OVTI02C1:00 > /sys/bus/i2c/drivers/ov02c10/bind 2>/dev/null || true'"

It triggers on the CVS driver binding to INTC10DE:00 and re-binds
the ov02c10 driver, which probed too early (before CVS had acquired
the sensor) and failed with -EREMOTEIO.

A couple of notes that may be useful for the kmod package:

1. The upstream intel_cvs driver fails to probe on this hardware
    (Dell XPS 13 9350, LNL, protocol 1.0) because SET_HOST_IDENTIFIER
    returns -EIO and is treated as fatal. The GPIO handshake works fine
    without it. I filed this with a patch at:
    https://github.com/intel/vision-drivers/issues/32

2. Without a way to release the sensor after probe, the camera LED
    stays on permanently. I added a sensor_owner sysfs attribute
    (also in the above issue) that lets userspace acquire/release
    on demand, plus a 10-second auto-release after boot. The kmod
    package may want to include this as well, or at least the
    auto-release so the LED doesn't stay lit indefinitely.

regards,
Ole


