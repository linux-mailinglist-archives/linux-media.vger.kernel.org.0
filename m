Return-Path: <linux-media+bounces-52830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CDDKl33kWmWogEAu9opvQ
	(envelope-from <linux-media+bounces-52830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 17:42:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1479C13F299
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 17:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D79F300F12D
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 16:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048852DC783;
	Sun, 15 Feb 2026 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sandum.net header.i=@sandum.net header.b="ZBMT8vaS";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="hRmYcjPT";
	dkim=pass (1024-bit key) header.d=sandum.net header.i=@sandum.net header.b="rl4gPTrP"
X-Original-To: linux-media@vger.kernel.org
Received: from e240-10.smtp-out.eu-north-1.amazonses.com (e240-10.smtp-out.eu-north-1.amazonses.com [23.251.240.10])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027E62566F7
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771173717; cv=none; b=aqUHcxzsKT+sp8SjMhy4piG7b9+rorIHw10KuPtdzjMFabJ2/0RCVU4AXf2eNiyO3p3EgqKLFdoV+6ecIpHcXLOhpMR+nD3l430hjbpeSglzbtsmqXz4PgDjAl7RvJN0lX9vY9gWPF3ePm9m6ouOh82N7QB8Ff6sbI2Srdzioi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771173717; c=relaxed/simple;
	bh=J8TJ2YACfBqVTx8SKWsOUE5//EBqfqhKPWGxTs+oW3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZjosLG5RqqQKpl7KrRfbJrVDLFK1nW5ySFkeOcAGmWLnBtrO/hXQJGsuTJ7cM4MCxIZRl3eRK0jkEUUp67vWDrVrKDlwzABwoEUMDzu2bupDMz8jM0J3G1cy/59DPFCyTbO3VFExdC8ssmMkLs3rQD1Xl5X0QZllwyp3xYLc+I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandum.net; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (1024-bit key) header.d=sandum.net header.i=@sandum.net header.b=ZBMT8vaS; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=hRmYcjPT; dkim=pass (1024-bit key) header.d=sandum.net header.i=@sandum.net header.b=rl4gPTrP; arc=none smtp.client-ip=23.251.240.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandum.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=mail;
	d=sandum.net; t=1771173714;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=J8TJ2YACfBqVTx8SKWsOUE5//EBqfqhKPWGxTs+oW3k=;
	b=ZBMT8vaS35rxGCjRQ0k8CyesWG0u41/ZV5tEH8lT96df/hAVwqLNinbXTrFn8tDN
	oeYgxhckFCPmxtqKCDStZlnfuzWyQEbZ3wEWuV6QhgGvTZt6zkvkNgEGWpv3mt3CBDl
	kSW/cWuEfDKH0i53tDz11sxteip+9fuBmr/VPP5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=icdr7g7fbtu2nwxgaimytihkt42k3kiy; d=amazonses.com; t=1771173714;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=J8TJ2YACfBqVTx8SKWsOUE5//EBqfqhKPWGxTs+oW3k=;
	b=hRmYcjPTXsF+eIsN+KCeR1mZFpAMfXkOMs0Q/+4C7CmSIM92i93EmYMvgwN+gh4p
	NxjWfMv8GM0jjdQphut2m8PkNFWoa9lTdEw7i/+JWVfMnHmFnhNqSQFH4GdsiWLC9XJ
	bEUiAA/5S3JLa6e0F40JI1nZjoehs5dhDmVi03cA=
X-Virus-Scanned: Yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sandum.net; s=mail;
	t=1771173711; bh=J8TJ2YACfBqVTx8SKWsOUE5//EBqfqhKPWGxTs+oW3k=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=rl4gPTrPBpfp7vN/0Awk3C34zGXA7HWMLjXBMgIznuSuwTQZcgNppWOuvrQ5dpI9R
	 YtTfnvkMgP2F15D/0yRyNlrttR153roNzso63x/887NPMJGOHRN9nT4W2Sx+yDgEJr
	 y3FAwL/CyzFFy88z/bFRZAPh7s1FMOXqe/6gNZME=
From: ole@sandum.net
To: linux-media@vger.kernel.org
Cc: antti.laakso@linux.intel.com, hdegoede@redhat.com, ole@sandum.net
Subject: Re: [PATCH] media: ipu-bridge: Add DMI quirk for CVS-sensor dependency
Date: Sun, 15 Feb 2026 16:41:54 +0000
Message-ID: <0110019c622e1880-12e257f8-af57-4538-aad4-686c363a0695-000000@eu-north-1.amazonses.com>
In-Reply-To: <20260210084152.332001-1-antti.laakso@linux.intel.com>
References: <20260210084152.332001-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-north-1.qSikLe0Jy8zWf8HK3WPYFlhgvEvJUmYq3aaZROsKEro=:AmazonSES
X-SES-Outgoing: 2026.02.15-23.251.240.10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sandum.net,quarantine];
	R_DKIM_ALLOW(-0.20)[sandum.net:s=mail,amazonses.com:s=icdr7g7fbtu2nwxgaimytihkt42k3kiy];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ole@sandum.net,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazonses.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,eu-north-1.amazonses.com:mid,30fps:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52830-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[sandum.net:+,amazonses.com:+]
X-Rspamd-Queue-Id: 1479C13F299
X-Rspamd-Action: no action

For what it's worth, I have the CVS driver (from intel/vision-drivers)
working on another affected Dell model:

  Dell XPS 13 9350 (Core Ultra 200V, Lunar Lake)
  OV02C10 (OVTI02C1:00) + INTC10DE CVS chip
  Fedora 42, kernel 6.18.8

The upstream driver needs one fix to probe on this hardware:
SET_HOST_IDENTIFIER returns -EIO (via USBIO I2C bridge, protocol 1.0,
no magic number) and the driver treats it as fatal. Making that
non-fatal lets the GPIO handshake complete and the sensor powers up.
Filed with patches at https://github.com/intel/vision-drivers/issues/32

I'm currently working around the probe ordering with a udev rule that
re-binds ov02c10 after CVS probes. Removing INTC10DE from
acpi_ignore_dep_ids[] (as Hans suggested) would be the proper fix.

The camera works at 1920x1080@30fps via libcamera 0.7.0 Simple pipeline
handler + GPU-accelerated SoftISP through PipeWire.

Hans's suggested path (upstream the CVS driver, remove INTC10DE from
the ignore list) would fix this for both Dell models.

