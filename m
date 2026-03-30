Return-Path: <linux-media+bounces-57670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBCAKzC1ymmE/QUAu9opvQ
	(envelope-from <linux-media+bounces-57670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:38:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34C35F5C5
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371E8301E214
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C513DC4DF;
	Mon, 30 Mar 2026 17:29:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from telesales.doctorjel.co.th (unknown [27.254.142.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002B14BF97
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=27.254.142.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891761; cv=none; b=jPVdBiCPtYzL5N9LY9zvErLvXJkQdtTlGx10cH07jUM2eykRldYGDHh+VMQZHAIRDDhtfdLtEKpR3ww/FfSCAWhVfJGB6jwsv0InVzXekayt+IGjwmq5FSkS45eIv49ZBNDMTNhy9nX38/ohAyXCu9rPZGp5Pe8DqOhBrF2XyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891761; c=relaxed/simple;
	bh=AwOKdmnzqRvO6dEAN4AMlY9+PBO9BC09AIMj+6Yy5Kc=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=b5MxUKRBEJCrHFLPaPOucLfNXjuqFTRtBkvG8UPak2pJEeiqgnIvqZdPjkY1Az6tiwiHhgYiVoeC0TFRH/oOrtHLHJd0LUVqjZBqD9uZ6YuynTCkD33S0NaqCNrxfskKkgveEScCTpsbOA7AQtLfqS/LFuVynPm6mJz5H+eyOjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=telesales.doctorjel.co.th; spf=none smtp.mailfrom=telesales.doctorjel.co.th; arc=none smtp.client-ip=27.254.142.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=telesales.doctorjel.co.th
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=telesales.doctorjel.co.th
Received: by websvr.organicscosme.com (Postfix, from userid 10007)
	id 4555331AA085C; Mon, 30 Mar 2026 23:34:33 +0700 (+07)
To: linux-media@vger.kernel.org
Subject: Re: Inquiry for Pump Supply
Date: Mon, 30 Mar 2026 16:34:33 +0000
From: Altman Josh <support@telesales.doctorjel.co.th>
Reply-To: josh@mlimarpolebuildings.com
Message-ID: <8a368c5b603008777e4efc29144d0474@telesales.doctorjel.co.th>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Spamd-Result: default: False [14.94 / 15.00];
	FUZZY_DENIED(12.00)[1:79795fefdb:1.00:txt];
	INTRODUCTION(2.00)[];
	FAKE_REPLY(1.00)[];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[doctorjel.co.th : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57670-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[josh@mlimarpolebuildings.com];
	NEURAL_HAM(-0.00)[-1.000];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[support@telesales.doctorjel.co.th,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[telesales.doctorjel.co.th:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mlimarpolebuildings.com:email,mlimarpolebuildings.com:replyto]
X-Rspamd-Queue-Id: 3B34C35F5C5
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

My name is Altman Josh, We hope this message finds you well.

We are currently seeking competent partners who can assist in the supply of industrial pumps for our end users. As part of our sourcing process, we are reaching out to manufacturers, suppliers, agents, and product sourcing companies who have the capability to provide or arrange the supply of such equipment.

If your company is able to support this requirement, we would be pleased to share the detailed technical specifications and additional information regarding the pumps needed. After reviewing the specifications and confirming your ability to meet the requirements, we can proceed with further discussions and, if mutually agreed, move forward with signing a supply contract.

Kindly confirm your interest and capability to supply or source the required pumps so that we may forward the relevant specifications and documentation for your review.

We look forward to your response and the possibility of establishing a successful business relationship.

Best regards,

Altman Josh  Project & Product Sourcing Manager
Email: josh@mlimarpolebuildings.com


