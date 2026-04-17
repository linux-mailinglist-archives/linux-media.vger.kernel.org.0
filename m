Return-Path: <linux-media+bounces-58982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EeVLVb44Wn50AAAu9opvQ
	(envelope-from <linux-media+bounces-58982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:07:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC7419149
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E78DF30649F4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D253B19DC;
	Fri, 17 Apr 2026 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="JgHC0J/P"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387531B830;
	Fri, 17 Apr 2026 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416533; cv=none; b=PNcdqQDD0hQ+kjP1R+Q43PU+mUAUCsOorXsg/S/kjCp6gmVNBBxThcsry1Ra3hTY9BDAo0vGiwBtzP1ZcSMErh17PgnE4qGnT9su6gvMYTE/D/X4V8pCGjmhxah2Ru1hr28lFnddk6tGuiB8z0bIg9EuboLe9odAHeiyUN0gONk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416533; c=relaxed/simple;
	bh=UYUFdG0TN5vWAlYHwsEzFVPpHEORJprLH1GLR+tAfmo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=LxEoXGsQ3E9RsaGthMuLv+wyn+7vGRghY7UqzZcndnOCgymSQPt6WRjUXpKPc3v944le8Ag+PqwIq0QdNRLRVGPtwfBFdspmIlw6dg2qtYz0WSeDSNaxw0h540VtnTMeSw27oXBFsKrllO9KYDkA6yNobUSZ3smTtp6PEmjDUzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=JgHC0J/P; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1776416523; x=1777021323; i=markus.elfring@web.de;
	bh=UYUFdG0TN5vWAlYHwsEzFVPpHEORJprLH1GLR+tAfmo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JgHC0J/PQQRZYIGI69UiyI+usDsZr+KqpqBuy8AU0nvBR3bm8CJLyVoEbZKjCuLr
	 MdgDIBz87IKJKFPbjTb+A35uLWYNLcz9HJ0d50oPasVfYI/pWXElXChn7p4ykH9OP
	 /z/MjhN6gDxohj73Q20DQUpmLz6brWXL8CqjhjZ2/dT9jrKoYUquua+eCVzKZMplD
	 PkfYH6KwWcvnYIohliFHE05nCguJW6Bl95B6HyHevfTN7e3CJXDfqzWjWB6x8u2XV
	 hY2JhfLh6kQLJ67mVX7O49SCCOv+kMbnyKuZOZ8qhlYaPoujBbpQAvj+WHhhPgXzC
	 Gx+zHdaMEHrep0Se3Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Myf3v-1vU4Pu1jbx-00zqrw; Fri, 17
 Apr 2026 11:02:03 +0200
Message-ID: <445cda8a-c55d-489c-8031-2461f51c6acf@web.de>
Date: Fri, 17 Apr 2026 11:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260414083239.34407-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] media: em28xx-video: fix missing res_free() on
 init_usb_xfer failure
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260414083239.34407-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:H5M9GR022UoN8sFxCG5Qq+pz/b9PyzAcY4C5iHwS8/SD6oYnt+6
 56pZSctmw5utg4Q3+8TOji2zloLx5x9Rcw1PVqJ2TUMCkD7bG4upr5EKVv8iIaraKmODqlH
 aalE055+G7eEGek7hE7b4+DJb0Gp0N7ZzRNYkaCYK5HLaQeptfXn8ZYSJu0R+zJ4CleZlup
 j2RJ0CtdgmaUGByKrjnQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pdfKoCdzWDg=;mU8lp5BZW/mK2pvUYR2uWHWulkQ
 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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58982-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[web.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50DC7419149
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> res_get() is called before em28xx_init_usb_xfer(), but the error
> path of em28xx_init_usb_xfer() does not release the resource,
> leading to a persistent busy state.

See also once more:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.0#n94
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v7.0#n34

Regards,
Markus

