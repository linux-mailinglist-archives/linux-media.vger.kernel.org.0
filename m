Return-Path: <linux-media+bounces-62956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F5nLIg5GGrdhAgAu9opvQ
	(envelope-from <linux-media+bounces-62956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 14:48:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BD5F2414
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 14:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F7C73195017
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 12:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9AB3EFFC6;
	Thu, 28 May 2026 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GHsVZzXZ"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799873EFD36;
	Thu, 28 May 2026 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972160; cv=none; b=rAgBiuuV4lgJwiSC5mtSc2hjgPgqWEtIqdDsoFwc3M4Bpp4C5iOliQE70wbgk8pABCqYhuapEmdZENF1hxFBdEgh6hy7yg20qhiSAsru1zFRCaYdBwXLanz3LbquegAUHUjuZ9agQq5m48Ir9J/kswzT8jXQjoA5lUaNUWYXpm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972160; c=relaxed/simple;
	bh=eqfs4KK63S0TOSE6+RLu6s71mPduUVA0LxwjeQ2pykI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=eNUWUOrHnXB/rg8/7lXo2m7aVwX/Z0WHPR5Lt8RJY4os7Sjzoeea9QCSuYvpy/ji4do/7c2ICBdpBqZHSb/NY9A51SRy8jM3XBjYgUaa6il7g/jI371T+Lq7JPXgG+PILiJ9FfQAEMz4FM+Db8AQ0NMp1nAngDW6CYFjNicDTuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GHsVZzXZ; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=eqfs4KK63S0TOSE6+RLu6s71mPduUVA0LxwjeQ2pykI=; b=G
	HsVZzXZP50EnuqFQuNvCHI6wfii4vWJ4d7KHSxs48eUIZPyebzqW4Lgq4v9Bch5P
	2UZk9RAZiY1NA8/ZEsZVYV32CsHmjMDBgVLJbwf76fSQRk8Z6wAASFLbJmovgZIM
	9/VXNvA0/xCFgxRDEQwxvOMbAnKCNojagTnpAXz+WM=
Received: from w15303746062$163.com ( [113.200.174.80] ) by
 ajax-webmail-wmsvr-40-149 (Coremail) ; Thu, 28 May 2026 20:40:44 +0800
 (CST)
Date: Thu, 28 May 2026 20:40:44 +0800 (CST)
From: w15303746062  <w15303746062@163.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	sumit.semwal@linaro.org, jeffy.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	"Mingyu Wang" <25181214217@stu.xidian.edu.cn>,
	stable@vger.kernel.org
Subject: Re:Re: [PATCH] drm/prime: Fix unsupervised rb_tree corruption in
 drm_prime_remove_buf_handle
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
References: <20260528082912.1051262-1-w15303746062@163.com>
 <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
X-NTES-SC: AL_Qu2cC/WcvUgv4iabZukfmU0Qguw9Xcq5uPkj34FWN5t8jCLr2iAKW0JFIHb04eyMFRyerjiMcBZ1+ONjdJh8W6EFDzOAp66oJV0VScdoN1osUg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6d351ca7.9904.19e6e99f765.Coremail.w15303746062@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:lSgvCgDX3qLNNxhqaMytAA--.11951W
X-CM-SenderInfo: jzrvjiatxuliiws6il2tof0z/xtbDAA2hhWoYN80SlAAA3n
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62956-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,rock-chips.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,stu.xidian.edu.cn];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w15303746062@163.com,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0E3BD5F2414
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQ2hyaXN0aWFuLAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IGFuZCBmb3IgY2F0Y2hpbmcg
dGhpcy4gWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0LCBhbmQgbXkgYW5hbHlzaXMgd2FzIGZsYXdl
ZC4gQWRkaW5nIHRoZSBsb2NrIGluc2lkZSBgZHJtX3ByaW1lX3JlbW92ZV9idWZfaGFuZGxlYCB3
b3VsZCBpbmRlZWQgY2F1c2UgYSByZWN1cnNpdmUgZGVhZGxvY2suCgpUaGUgc3l6a2FsbGVyIGNy
YXNoIHdhcyBvcmlnaW5hbGx5IHRyaWdnZXJlZCBvbiB0aGUgdjYuMTgga2VybmVsLiBXaGVuIGlu
dmVzdGlnYXRpbmcsIEkgY2hlY2tlZCB0aGUgbGF0ZXN0IG1haW5saW5lIHNvdXJjZSBmb3IgYGRy
bV9wcmltZV9yZW1vdmVfYnVmX2hhbmRsZWAgaXRzZWxmLiBTaW5jZSBJIGRpZG4ndCBzZWUgYW55
IHN5bmNocm9uaXphdGlvbiBjaGFuZ2VzIHdpdGhpbiB0aGF0IHNwZWNpZmljIGZ1bmN0aW9uLCBJ
IGluY29ycmVjdGx5IGFzc3VtZWQgdGhlIGNvbmN1cnJlbmN5IGlzc3VlIHdhcyBzdGlsbCBjb21w
bGV0ZWx5IHVuaGFuZGxlZCwgZmFpbGluZyB0byBub3RpY2UgdGhhdCB0aGUgdXBzdHJlYW0gdHJl
ZSBwcm9wZXJseSBob2xkcyB0aGUgbG9jayBpbiB0aGUgY2FsbGVyIChgZHJtX2dlbV9vYmplY3Rf
cmVsZWFzZV9oYW5kbGVgKS4KCkkgd2lsbCBkaXZlIGRlZXBlciBpbnRvIHRoZSBjb2RlIHRvIHNl
ZSBpZiB0aGVyZSBpcyBzdGlsbCBhbnkgaGlkZGVuIHJhY2UgY29uZGl0aW9uIHVuZGVyIHRoZSBj
dXJyZW50IGxvY2tpbmcgc2NoZW1lLCBvciBpZiB0aGlzIGlzIHN0cmljdGx5IGEgbGVnYWN5IGlz
c3VlIHRoYXQgbWlnaHQgb25seSByZXF1aXJlIGEgc3RhYmxlLXRyZWUgYmFja3BvcnQuIElmIGEg
Zml4IGlzIHN0aWxsIHdhcnJhbnRlZCwgSSB3aWxsIHNlbmQgYSB2MiBwYXRjaC4KClRoYW5rcyBh
Z2FpbiBmb3IgeW91ciB0aW1lIGFuZCBndWlkYW5jZSEKCkJlc3QgcmVnYXJkcywKTWluZ3l1IFdh
bmc=

