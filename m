Return-Path: <linux-media+bounces-59350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAyaC64w6WmLVgIAu9opvQ
	(envelope-from <linux-media+bounces-59350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 22:33:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C544AA16
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 22:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F188130A8765
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 20:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9836B299948;
	Wed, 22 Apr 2026 20:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="R7+YQghL"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E6A286D57
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776889846; cv=none; b=DGFXs9DJO43MCTMonoS24KkUXI4IwQ8UFN1r9SZliWdnt92fpgiEIDUh/5DsLmzh+uZJNQ+vXXR1d+VBzDCdjSXA/X/WC0vsb3HCHyQc+Wg9fVITY6L6V6QjyZyJBsBRx6yEWFUFOBolKqhI/8gQLMDbI4YZ9j0J/hSkt6ofpQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776889846; c=relaxed/simple;
	bh=hzeI6CPqXcuBQEp/lztN8dvFduhKkWgKCCp1hwPzO1I=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=umLrnrNHZ85o+rRMaZ1utD4pRXmMGM1jLP9ebSEVAf5d890WnNh7FECVnetrUd6UIbnhVaDiZDQbU4/2TuqVSZPXYKw7+LNCMElvOoPA7s1OeJBpw890d+OeKs2ZIsnR9ZB6CcNHiEDBq1YLW7Ob1ZKbHszyMsFiV0fxxw5bmUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=R7+YQghL; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KNtT5ouZJ0Nlwlu/b9uFmrJddZCWFh3gRIQfX4dERi4=; b=R7+YQghLn2g2pCEiJ2vArTEfAO
	B/GjqpdxJrHfdpsZnUQYz3MaY/aISV1quSk7vdCkOC7HrQyNW48nsJZCXBhh0bwT+CqF04LqArfBc
	Jv3CMyhOq99TeZpUCcdEBi+ktmgHBL/hzRGPBJqUEDn9OQnA/G4P1404LzZoTDlzw8GZGiMC5T0y5
	gESYvVJG73/W+0T1dRFLdEoC6RGk0emawYqGCe2su0ByM3w5DOlfzNNBx2BmJPDv+/0ihUMINrgb4
	MfjgiM37ITJPwhfZkQZj5LqBuFV1aAtfldIDlV8GosGsqM8rvECDDF/KPxwszuoKq9QvzzENgFYkk
	BQVCNQhg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wFeDb-000Qvx-6x
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 22:30:42 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wFeDY-001B6W-3Q
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 22:30:42 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wFeDX-00000000Gv4-1ybc
	for linux-media@vger.kernel.org;
	Wed, 22 Apr 2026 22:30:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 22 Apr 2026 17:30:39 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: linux-media@vger.kernel.org
Subject: Re: [v2] media: em28xx: fix use-after-free in
 em28xx_unregister_media_device()
In-Reply-To: <69e7cc42.050a0220.31d583.2f7b@mx.google.com>
References: <20260421-em28xx-v4l-uaf-v2-1-7d5032b8c384@igalia.com>
 <69e7cc42.050a0220.31d583.2f7b@mx.google.com>
Message-ID: <3451101ea8bafe0044fb38082ead0e7d@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8
X-Spam-Score: -21
X-Spam-Bar: --
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-59350-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.772];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,igalia.com:mid,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 770C544AA16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-21 16:13, Patchwork Integration wrote:
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
...
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/97938357/artifacts/report.htm .
...
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

I opened
https://gitlab.freedesktop.org/linux-media/media-ci/-/work_items/128
as the same (unrelated) errors happened again, and other patches also
seem to
be affected, taking a look at patchwork.

Thanks,

-- 
Mauricio

