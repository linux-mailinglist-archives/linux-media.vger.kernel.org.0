Return-Path: <linux-media+bounces-62962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJsWEMVIGGpSiggAu9opvQ
	(envelope-from <linux-media+bounces-62962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:53:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFEE5F317E
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14B5E305295F
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD9D282F09;
	Thu, 28 May 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ed7QzX0u"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D469277007;
	Thu, 28 May 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976299; cv=none; b=aS5PABN7elW8Qkz36fBvUsccFl+OIcYWYhrLvCEgqJYKZhWMLmayW0Sx7sn1aUndu9PrLarAg76N75u0QWENlXuMSNNV0j0o5h9JURfC+ZXX3dNe/SncdXXe5ME86tPkfPVydAmWMhVE0HNaJGg8ZQD+bFQ/oWp67B7U2bqKptw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976299; c=relaxed/simple;
	bh=NFxfsp06lyRCY10yxDG+j91u6X2oQuXM0g9r3DGGHig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=bhXRMj2D79TK5K4mSp9OACmA+ufH8BXnixjKS5asuuEJI9vNFFS/+3AYn7aOm0jIu8XxXUPmVOWrrZdiQFkHC7IR+aqv4wCH68SNT5GWGrBVgl+HXGveZirZ9BgBAEJlFc7KsxGnnTLCD2/PBc7bnlyrrasn8ZoQqyJxKhczH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ed7QzX0u; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=NFxfsp06lyRCY10yxDG+j91u6X2oQuXM0g9r3DGGHig=; b=E
	d7QzX0uKnB10S1oxHpa+QBT15dBgs5woaNO1VbnJ61uqPB7jUSCIz4VqZz3krhCj
	1ZVGH/tG1vPSfeFc2QsOrAMUqy1RMl8qR2JfIPejp/55EmXLz11z7QQ43yv04POi
	ZvV70Hxuq9scSNu8ko8TCB4vvTODShJKmns+xglOiQ=
Received: from w15303746062$163.com ( [113.200.174.80] ) by
 ajax-webmail-wmsvr-40-149 (Coremail) ; Thu, 28 May 2026 21:49:58 +0800
 (CST)
Date: Thu, 28 May 2026 21:49:58 +0800 (CST)
From: w15303746062  <w15303746062@163.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	sumit.semwal@linaro.org, jeffy.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	"Mingyu Wang" <25181214217@stu.xidian.edu.cn>
Subject: Re:Re: [PATCH v2] drm/prime: fix dangling dmabuf entries after
 handle release
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <62c256eb-1df4-4633-8040-222895b54f97@amd.com>
References: <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
 <20260528132932.1078483-1-w15303746062@163.com>
 <62c256eb-1df4-4633-8040-222895b54f97@amd.com>
X-NTES-SC: AL_Qu2cC/WcuUki7iOdYekfmU0Qguw9Xcq5uPkj34FWN5t8jCLr2iAKW0JFIHb04eyMFRyerjiMcBZ1+ONjdJh8W6EFZutYLvilnzrxQVlQsWMr+w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7bbb8946.9d19.19e6ed958df.Coremail.w15303746062@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:lSgvCgD3f6cGSBhqZ9GtAA--.11991W
X-CM-SenderInfo: jzrvjiatxuliiws6il2tof0z/xtbC4wazl2oYSAZ8OAAA35
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62962-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_X_PRIO_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w15303746062@163.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,rock-chips.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,stu.xidian.edu.cn];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CCFEE5F317E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQ2hyaXN0aWFuLAoKVGhhbmsgeW91IGZvciBpbnNpc3Rpbmcgb24gdGhpcy4gSSd2ZSBub3cg
Z29uZSB0aHJvdWdoIGFsbCBjYWxsZXJzCm9mIGRybV9wcmltZV9hZGRfYnVmX2hhbmRsZSgpIGlu
IGRybV9wcmltZS5jLgoKWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0OiBib3RoIGRybV9nZW1fcHJp
bWVfZmRfdG9faGFuZGxlKCkgYW5kCmRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2RtYWJ1ZigpIHBl
cmZvcm0gdGhlIGxvb2t1cCB1bmRlcgpwcmltZV9mcHJpdi0+bG9jayBiZWZvcmUgYWRkaW5nLCBz
byBhIGR1cGxpY2F0ZSBoYW5kbGUgc2hvdWxkIGluZGVlZApuZXZlciBiZSBpbnNlcnRlZCB0aHJv
dWdoIHRob3NlIHBhdGhzLgoKVGhhdCBzYWlkLCB0aGUgc3l6a2FsbGVyIHJlcG9ydCBjbGVhcmx5
IHNob3dzIHRoYXQgdGhlIGRtYWJ1ZnMgdHJlZQppcyBub3QgZW1wdHkgd2hlbiBkcm1fcHJpbWVf
ZGVzdHJveV9maWxlX3ByaXZhdGUoKSBydW5zLCB3aGljaCBtZWFucwpzb21lIGVudHJ5IHdhc24n
dCByZW1vdmVkLiBHaXZlbiB0aGF0IHRoZSBub3JtYWwgYWRkL3JlbW92ZSBwYXRocwphcHBlYXIg
Y29ycmVjdCwgdGhlIHRyaWdnZXIgbWlnaHQgYmUgc29tZXRoaW5nIG1vcmUgc3VidGxlIOKAlCBw
ZXJoYXBzCmEgZHJpdmVyLXNwZWNpZmljIGNhbGxiYWNrIHRoYXQgYnlwYXNzZXMgdGhlIGdlbmVy
aWMgaGVscGVycywgb3IgYW4KZXJyb3IgcGF0aCB0aGF0IGxlYXZlcyBhbiBvcnBoYW4gaW4gdGhl
IGRtYWJ1ZnMgdHJlZS4gSSBoYXZlbid0IGJlZW4KYWJsZSB0byBpZGVudGlmeSB0aGUgZXhhY3Qg
dHJpZ2dlciB5ZXQuCgpUaGUgcHJvcG9zZWQgY2hhbmdlIHRvIGRybV9wcmltZV9yZW1vdmVfYnVm
X2hhbmRsZSgpIChyZXN0YXJ0IHNlYXJjaAppbnN0ZWFkIG9mIGJyZWFrKSBpcyBpbnRlbmRlZCBh
cyBhIHNtYWxsIHJvYnVzdG5lc3MgaW1wcm92ZW1lbnQsIG5vdAphIGZpeCBmb3IgYSBjb25maXJt
ZWQgcmFjZS4gSW4gdGhlIG5vcm1hbCBjYXNlIGl0IHdpbGwgc3RpbGwgZXhlY3V0ZQpvbmx5IG9u
Y2UsIGJ1dCBpZiB0aGUgdHJlZXMgZXZlciBiZWNvbWUgaW5jb25zaXN0ZW50IGZvciBhbnkgcmVh
c29uLAppdCB3aWxsIGNsZWFuIHVwIGFsbCBlbnRyaWVzIGZvciB0aGUgZ2l2ZW4gaGFuZGxlIGFu
ZCBwcmV2ZW50IHRoZQpXQVJOSU5HLgoKV291bGQgeW91IGJlIG9rYXkgd2l0aCBzdWNoIGEgZGVm
ZW5zaXZlIGFwcHJvYWNoLCBvciB3b3VsZCB5b3UgcHJlZmVyCnRoYXQgd2UgZmlyc3QgdHJhY2sg
ZG93biB0aGUgcHJlY2lzZSB0cmlnZ2VyIChlLmcuIHdpdGggYWRkaXRpb25hbApXQVJOcyBvciB0
cmFjaW5nKT8KClRoYW5rcywKTWluZ3l1

