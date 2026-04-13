Return-Path: <linux-media+bounces-58682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NspFp413Wl9agkAu9opvQ
	(envelope-from <linux-media+bounces-58682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 20:27:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F6A3F201A
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 20:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94CF4301169C
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6584236073E;
	Mon, 13 Apr 2026 18:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="skMvFBfm"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161A22BE7CD
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104830; cv=none; b=JWdFgAgB2yj4cUWqnim1csMo94DrBE4F6v+5FlIoP7Mkv1QzLzVx4Z3YeAl3ZhNv0qHS46Mv/y4BpVjcAG+VsDf+uhdm9yxMfHvkssginYpOzRNnaWsx6iwDag1WGGBduOVIYZlJmZLVpNgRS4joNLzsJbzxwKXPGAmgPMveTaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104830; c=relaxed/simple;
	bh=ii7RiEYXFAwNCxuEo1CoPA3li6U6E86Hw/fHvqqyJvc=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=UYPEpTfO/rsMh/1WinVWCsPI03k37Bmrrj8oslCybSKkiNAAZuF5KLwpHbGHAsNIRZGrb8nvc7CnSP0SHHBHQJ50yjOmuSH1eeKowUH3gSVYvv9mwGCqYqHEaCuMPww/dt8qKlAzqJJSZzEGVXkmIiU7Q++EIyxkhq33nTUbNSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=skMvFBfm; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KcFMe4RQ/kS4Ua8WnL3DhPByqlwDLOFhDfb9Ibw2Ago=; b=skMvFBfmPWSL9O8PIdiKZ3eD4E
	dzYdw146QTJf5EOmw2kGT2KL1Ju0rgQY6NSQ7hLQpSx711wE/klGw5wlZK7kLkc+gxT/G/NjKQh0d
	//rdpMDxiYen1pwmR/tag8GzwKApiVLB4/t/E9+St4hqAvBO3ceBretsWVAVr94XpI38Q2RVPW/WL
	iSiUpSzUFKuDnRzcPtlRaSdz5XLzfieqU7udC4cErCYMzyW7PaLQTZ6wm71oy4VjsmKbUWcXtfxHI
	9zrXIyAf7haQVRq8vh2t52XLCovuqnFTfPkaju0IuRN6b04p3IwJzrzHM6mB86fhBxkJnr4rryri0
	DuAn2C+A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wCM01-00FXuR-Cw
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:27:05 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wCLzy-00D2Jh-VP
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:27:05 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wCLzy-0000000FnvY-3BjN
	for linux-media@vger.kernel.org;
	Mon, 13 Apr 2026 20:27:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 13 Apr 2026 15:27:02 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: linux-media@vger.kernel.org
Subject: Re: media: em28xx: fix use-after-free in
 em28xx_unregister_media_device()
In-Reply-To: <69dd09b2.050a0220.1384e9.0f92@mx.google.com>
References: <20260413-em28xx-v4l-uaf-v1-1-52a5a71493ce@igalia.com>
 <69dd09b2.050a0220.1384e9.0f92@mx.google.com>
Message-ID: <0f5a27cb0247cd89a7484c66ac5089b8@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,URIBL_BLOCKED=0.001
X-Spam-Score: -21
X-Spam-Bar: --
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_FROM(0.00)[bounces-58682-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	NEURAL_SPAM(0.00)[0.687];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 51F6A3F201A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-13 12:20, Patchwork Integration wrote:
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/97372899/artifacts/report.htm .
[...]
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

Can someone please rerun 'Job static' and 'Job build-basic'?

The issues seem to be network/infrastructure, unrelated to the patch:

Job static:

    Pulling docker image
registry.freedesktop.org/linux-media/media-ci/static:latest ...
    WARNING: Failed to pull image with policy "always": unexpected EOF
(manager.go:237:5s)
    ERROR: Failed to cleanup volumes

Job build-basic:

    Pulling docker image
registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-v18.8.0
...
    WARNING: Failed to pull image with policy "always": error during
connect: Post
"http://internal.tunnel.invalid/v1.47/images/create?fromImage=registry.gitlab.com%2Fgitlab-org%2Fgitlab-runner%2Fgitlab-runner-helper&tag=x86_64-v18.8.0":
ssh tunnel: read tcp 10.128.0.5:42980->10.128.0.129:22: read: connection
reset by peer (%!s(<nil>)) (manager.go:237:0s)
    ERROR: Failed to remove container
8160dd49bf1ae64d142af1f984d0889458a3b9b72a29af5381eec282aa324a1e
    ERROR: Failed to cleanup volumes

Thanks,

-- 
Mauricio

