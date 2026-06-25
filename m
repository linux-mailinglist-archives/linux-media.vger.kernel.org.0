Return-Path: <linux-media+bounces-65627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gFryFh36PGojvQgAu9opvQ
	(envelope-from <linux-media+bounces-65627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 11:51:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC47F6C4676
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 11:51:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VPMuD3ZI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65627-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65627-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9B523028F29
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 09:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0F73AE6F7;
	Thu, 25 Jun 2026 09:47:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B2936C9EC
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 09:47:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380871; cv=none; b=jin8LdliRXG1eIX3wwoNrQ58HAQZTdw81RbiArqwMJYmsUvn7O+yhKq4q5cnLnKjvFGsnGeX1HAqASVKyH7P2+n4MCHwzJ/murZja+mXOdS3xO1kRMRnVzgZuoG0kF0ENrNmLnEjo+QmuHVmv07sx5ihYiNRzB8tTe/xZ+korjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380871; c=relaxed/simple;
	bh=l9uarfYYTt6rzHCXNwF4p3X8UwtJ6REynp/VVdjjqy4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=X+ibOWbfdIed0PxA8P5tuBo+vRr11QB26ztokCc+h28QSsgaQk2b3s4QDrFhleo/xu+05ZE86hjvDNEBCsvN2uXQjsMqvjpM4JAKNbrmxRc7IftF027cUfPj4Y10R2fu+hoEDo2nAG9nZ3RQr6cWgW3K//oOYM0Pps1kcelii6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPMuD3ZI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBD11F000E9
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782380870;
	bh=l9uarfYYTt6rzHCXNwF4p3X8UwtJ6REynp/VVdjjqy4=;
	h=Date:From:To:Subject;
	b=VPMuD3ZINGVcRnnqEJNfRZyGbPhgHzwXMSRQp/oGhIms213t04RyBnUt8gtCy7JI1
	 0nCJM3Edc3m7RxROlePbi1Gg9P5g5w7ojN6x8cHukeaNF8c9rYIe9peu8EXYAqeVEP
	 IaQUDs/CoR9qWdHh77TRZV72nAtXew9aodAcAPzaChdgQPvMqR5GP8CkrYwkkwjrXh
	 mkOim1IvCCAV0ChLr1wQ/vOI+RYq8e3fXz7dIUQWhWz/uhWhrSqf4TXLttAKWmCkei
	 FnA8zdMKGRDb8Z5VxFyeQt30yHGC3PgHMZyOBffhNuZiub+JaY59sUG/PT/CDFuG0d
	 JNihFFs1i4tkg==
Date: Thu, 25 Jun 2026 11:47:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Subject: [ANN] new mailing list for CI reports
Message-ID: <20260625114747.22fc1ec8@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-65627-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxtv.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC47F6C4676

Hi all,

To improve how CI reports are handled, CI e-mails were moved to a separate
mailing list: media-ci@linuxtv.org.

Currently, it covers e-mails from:
- media-ci, which handles PRs and submitted patches;
- Jenkins, which covers mostly userspace apps.

Thanks,
Mauro

