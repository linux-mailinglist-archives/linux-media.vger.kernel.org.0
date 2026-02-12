Return-Path: <linux-media+bounces-52639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLKvNQ+ljWlh5gAAu9opvQ
	(envelope-from <linux-media+bounces-52639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:01:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 624E112C279
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C82A3313E03B
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814602E7BD3;
	Thu, 12 Feb 2026 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FL419Tj9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD22E8B82
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890282; cv=none; b=O4K7hkZ131M/HVhxkkDIeQ5rnW1JSQumZl3VLgeuL3AgK4JQwX7OQD6MqVWiCW8XEf1J3JTNu+t1gX6Wx7La4MrGVa4Nnw/ND2mIUofBWfIvaMVwYmuo/vemwLe88xsrjgulsRlbTIFvuPX4wDotVXjVKcSF4AJgAnvDK0Fe+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890282; c=relaxed/simple;
	bh=wj88IrVJmGEhWhjsikYlBsjmlzdHroGuO9qhyMzxSqM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=i1iaVbmG8grRQJwnxduejn7C6bJDtBX0mowSx0NygsEppXiOM1QrkzqhQaG16ogbjY5t4/9asPIhb072EZ5tGTCon1RxK7hxtpoXzaYByhM7XG2C1L+wloK0iubpl/DBuGn7qjIo6S8N3Xt4GahgiaioWkVJyDrudKd+9CBEW28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FL419Tj9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C04C4CEF7
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770890281;
	bh=wj88IrVJmGEhWhjsikYlBsjmlzdHroGuO9qhyMzxSqM=;
	h=Date:From:To:Subject:From;
	b=FL419Tj9uTDKn8ZHgGsJhUK4cErxX7HwyqN3pnN3IY6lmOT464y/4xZuO7Xe0STpa
	 M/zSUaSc1nhwpvug12r/62bVbBEYgb7jl/lw36TbCLVIsTjFAuRS46gt6B+Ibro+yE
	 eIkvlkEiA6qeX/rZhylgOecpamKdKRV9Ehz3N+HgV+3TqdjKFtVqBAjP7c7tSkUux/
	 yCuvd58eVWGBeuGFNePHSJd9SHfwCwjKFFTC/ueFyFWP+xrmgjAycFepdh6H9vSlto
	 jsuf5G3jEGT5Q1XxHOqNIuZxiIweiADbAdLFd8/6erqgKz7k7tUH9I8iQ4MDKUQibP
	 NB5YNlhROtdFQ==
Message-ID: <3b6c2db8-a87f-490a-9b73-3c0c88d44eb2@kernel.org>
Date: Thu, 12 Feb 2026 10:57:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH] .mailmap: Add back old email alias
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-52639-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cisco.com:email,xs4all.nl:email]
X-Rspamd-Queue-Id: 624E112C279
X-Rspamd-Action: no action

The old hans.verkuil@cisco.com email, long since dead, still pops up
once in a while when using get_maintainer.pl. Add it back to .mailmap
so it is mapped to a working email.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
diff --git a/.mailmap b/.mailmap
index 84309a39d329..d4bc98ca0fac 100644
--- a/.mailmap
+++ b/.mailmap
@@ -303,6 +303,7 @@ Hans de Goede <hansg@kernel.org> <hdegoede@redhat.com>
 Hans Verkuil <hverkuil@kernel.org> <hverkuil@xs4all.nl>
 Hans Verkuil <hverkuil@kernel.org> <hverkuil-cisco@xs4all.nl>
 Hans Verkuil <hverkuil@kernel.org> <hansverk@cisco.com>
+Hans Verkuil <hverkuil@kernel.org> <hans.verkuil@cisco.com>
 Hao Ge <hao.ge@linux.dev> <gehao@kylinos.cn>
 Harry Yoo <harry.yoo@oracle.com> <42.hyeyoo@gmail.com>
 Heiko Carstens <hca@linux.ibm.com> <h.carstens@de.ibm.com>

