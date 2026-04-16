Return-Path: <linux-media+bounces-58852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBtcFq6J4GnFjQAAu9opvQ
	(envelope-from <linux-media+bounces-58852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:03:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF140AD7F
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F30E3074043
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070A2378D74;
	Thu, 16 Apr 2026 07:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="l2FHOJu+"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED978F39
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 07:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776322975; cv=none; b=hSzM9/KO2SKwvpkVOSK1mxFtus0qRKRqvqvmjQY/quhP792NHJioQQ6qxHXX0LPeochIE6wA4rTzIH0+LI9ntv8DczRuPiEtsloMpcCLFaHn8waj3MH2S9mtg3ceF14HPndk+8iMWBXs4nkcHwtTrV5tn4wB8YxJUims7kLZDQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776322975; c=relaxed/simple;
	bh=OJ0+3m5Bx10WGRhqapZBieHsYjUYqlv/U6oia9NF0mE=;
	h=From:To:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=fJsHgkgKVMh3u/LVo4nD4kNjOqRmggXQziNUMDfs69LguZ0lHZ26j+PF3cFadVv6JSzAJUSqMmDLaIrGm5VuXbKE76aelaPkNZfFv06z0XhDGOf+QL34rIUVShLVsdmVjywRVt58/u6J0LRbfJS/bR1M0JemxR7IFNf0429vASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=l2FHOJu+; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1776322968; bh=OJ0+3m5Bx10WGRhqapZBieHsYjUYqlv/U6oia9NF0mE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=l2FHOJu+wllcT+ySlTSRcdom+qRdER2y28vHT/Fd7N0MwNp1KznogwEif6/JaAvb6
	 s3vf5rx2aY0Hz7BmG0GGuTkf7QVPpXLr/ei5KcrX5ds61uAFqVAhrY2csmzvYttpOW
	 q84Ar8HkqC1f7g+0hPMwf9Y0q+MtB67dfG0+WmMI=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: MdmyWVu0InhAL/82fInHN6ZiDEg91lDSzmw5u40qgmQZ0lHxOWGAyySm9dmO45
	 gzCtcOkcBIaXrHujSBd4TQ9FnZ/WRDnA9keMnpVu1Ah4B+tlGAd5rvHl0DRR8wtEZP9TONwVHdr81
	 osO8rkzXMJlqGnhCdRhfmxnWgFxcbBz0gEqnljTMz6/9xiBFrjca+o9r+IhEGpUE2PHQuSgnSgQLT
	 dtt0wVhQOgxnpP67WZX1l/gMe4Sb2BiQMyP83Zk0z4eaiqXKEaRKDkRRLg+HYbIR+kCg0/0Ci1Fkv
	 8c9aciu1yyvS3zv9vOpiUddWnw1DKLwQH3TDwH9NhlLyNgjavAJl7l/3AGooP/dJNn5fyXUzziWxI
	 FMErSZqd19wE8NXs0GFbe0DRc3edUVVeUOLxfkO9/gXH/1EpAjk9W0IOwtiqOsxvro0RZlCOfCnoZ
	 4RdJlMFgn4sfobLAUAJHBaQbqyVu/Er5fRj6LIjtwpvm4CLUBM60SwPXkdDqBldypGOrUkNuJMlir
	 EkQ1VAsV2xgO0MGIe0BozMHWejzT9az9PsYJ6AiZ5tDhU7tCmf0AdJ36eYwSoFCUOKI13qZg93yp2
	 FzjGZ11m8U2BBCh09Q5ogycEmlORiVzj5cfO924abKkPTUlbZ/uA5ZKVAojf28NlA/cnUCzaVnbBd
	 GfWXWiGsu3dSEJNBPQTw3nLIRJTHkN9o90RojGsCcFvLQohGarFmrMZZNAqDTNZLQIycO4Lnx7T3P
	 nL/teHT390lNCptq7U05gJBiiR177BWsfd47Uhm6aEYKJLXGPH/nX8FpTA/5uQ8YaPkLawJMlsRMS
	 LnyMn+P1O5QKSOrp1uB0MkOkO4DG+DZSPzuFqXb+sDn9Jv1W3Pm8196OZYv+MTrqpJ8UXdTK8am6K
	 79OxBy6B+bqtbrMCAknYAaFHS3PzHkaj61MGK5K9s7+rkKcmV32szIVtde/PCWdkz8NbBfvM8Nomd
	 rsOc6tEqy0W2zzUW4lzzj6FeMbYXbuzvMgpHlA3nK9E4Ad1QY7GE7M6+C/Yi9SyUnGoeIIwxsgLXq
	 bbZXojfT3QRE/3c2XVecXQyEqcLooun3rvojS
From: "=?utf-8?B?Wmhhb3lhbmcgWXU=?=" <2426767509@qq.com>
To: "=?utf-8?B?bGludXgtbWVkaWE=?=" <linux-media@vger.kernel.org>
Subject: Re: [v2] media: dm1105: fix missing error check for dma_alloc_coherent
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 16 Apr 2026 15:01:37 +0800
X-Priority: 3
Message-ID: <tencent_AA4E5254BF8D5B71B14350D4D7E2FB87DE09@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_2F5A25B0AB50C4D77CFB3DDEA852BEBE6509@qq.com>
	<69e083ba.050a0220.16ccf5.2b9b@mx.google.com>
In-Reply-To: <69e083ba.050a0220.16ccf5.2b9b@mx.google.com>
X-QQ-mid: xmsezb51-0t1776322897t49hdqupu
X-Spamd-Result: default: False [2.44 / 15.00];
	TO_EXCESS_BASE64(1.50)[];
	FROM_EXCESS_BASE64(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RSPAMD_URIBL_FAIL(0.00)[qq.com:query timed out];
	FREEMAIL_FROM(0.00)[qq.com];
	RCPT_COUNT_ONE(0.00)[1];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58852-lists,linux-media=lfdr.de];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-media@vger.kernel.org];
	TO_DN_ALL(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DKIM_TRACE(0.00)[qq.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 34DF140AD7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgYWxsLAoKSXQgbG9va3MgbGlrZSB0aGUgQ0kgZmFpbGVkIGR1ZSB0byBhIHJ1bm5lciBp
bmZyYXN0cnVjdHVyZS9uZXR3b3JrIGlzc3VlLCBub3QgYSBjb2RlIHByb2JsZW0uIFRoZSAi
c3RhdGljIiBqb2IgbG9nIHNob3dzIGEgRG9ja2VyIGNvbm5lY3Rpb24gcmVzZXQ6CgpFUlJP
UjogSm9iIGZhaWxlZCAoc3lzdGVtIGZhaWx1cmUpOiB3YWl0aW5nIGZvciBjb250YWluZXI6
IGVycm9yIGR1cmluZyBjb25uZWN0OiBQb3N0ICJodHRwOi8vaW50ZXJuYWwudHVubmVsLmlu
dmFsaWQvLi4uIjogc3NoIHR1bm5lbDogcmVhZCB0Y3AgLi4uIGNvbm5lY3Rpb24gcmVzZXQg
YnkgcGVlcgoKQ291bGQgc29tZW9uZSB3aXRoIHRoZSBwcm9wZXIgcmlnaHRzIHBsZWFzZSBy
ZS10cmlnZ2VyIHRoZSBDSSBqb2IgZm9yIHRoaXMgcGF0Y2g/IAoKVGhhbmsgeW91IQoKQmVz
dCByZWdhcmRzLApaaGFveWFuZyBZdQ==


