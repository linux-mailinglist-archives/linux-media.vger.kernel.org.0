Return-Path: <linux-media+bounces-63029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOUjJyt+GWp9xAgAu9opvQ
	(envelope-from <linux-media+bounces-63029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 13:53:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF727601E47
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 13:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ECA43037B85
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B1F3DDDCE;
	Fri, 29 May 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cRgk3b1h"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6DC3D16EB;
	Fri, 29 May 2026 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055266; cv=none; b=H/KTKFDv5omYRkZOaijZVaEU/lfadD3IOIxbHi1a/YPRiGo4kmN3En6FG3pqiq5xgkMZtpTgNP7LCqAdYauCL5hSYsuFTJpSrz55bW7z1o4GBA885HNJt6QM3oKX7hkqPhZj0dLi4clT0gxPocfGOuKxS8BZJzgE20w8cycy610=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055266; c=relaxed/simple;
	bh=94GyrtKUPcw6dUudljrdpDPI38g/F1ms8pwc++tMTSI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=URUZG/jQnd//f6KbwrG0/dAmeHB33EI0ft7cfW7d0Tjo5mIWnwl4AQdSqTJxJLFjnoYl1WtCuS1u/a9f9ichTd4aEdAoACNF0r94IYJ3KHUqLwoQghuGOjYNfMo4vrCu0sLIKGOuJHjNFgtbMlUYG4TY/SpuQwzxZPqab670g/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cRgk3b1h; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=94GyrtKUPcw6dUudljrdpDPI38g/F1ms8pwc++tMTSI=; b=c
	Rgk3b1hQkT6UQA8SK784y7gFHKJ5xWSNVvi3iaxZq7e78qRe5p/D1EdYCJVFzXCg
	tizlsk8uODVdo2OD1HS6AxAV1EqfJW2BFHba5PnZC8oCoep1XK8gVSZRL79/YFHf
	2o0nRT8OMu/dR2uIP0zoQ2oYqnKvD9CRlNJq9kxBVo=
Received: from w15303746062$163.com ( [113.200.174.80] ) by
 ajax-webmail-wmsvr-40-124 (Coremail) ; Fri, 29 May 2026 19:45:42 +0800
 (CST)
Date: Fri, 29 May 2026 19:45:42 +0800 (CST)
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
In-Reply-To: <bb4d3330-822e-45ae-94f4-65ba0e351f57@amd.com>
References: <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
 <20260528132932.1078483-1-w15303746062@163.com>
 <62c256eb-1df4-4633-8040-222895b54f97@amd.com>
 <7bbb8946.9d19.19e6ed958df.Coremail.w15303746062@163.com>
 <bb4d3330-822e-45ae-94f4-65ba0e351f57@amd.com>
X-NTES-SC: AL_Qu2TAvyeukkv5CiRYOkfmU0Qguw9Xcq5uPkj34FWN5t8jAvp6BgifHBkMWLY9tKqBSCQtgC+cAJg08FoUqNhfqckIc+3Gw44gLYit/sDw/2vEA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5ffc2647.95cf.19e738df1f7.Coremail.w15303746062@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:fCgvCgDXPyxnfBlqz22qAA--.908W
X-CM-SenderInfo: jzrvjiatxuliiws6il2tof0z/xtbC4wcZ-GoZfGfigQAA3K
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63029-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,rock-chips.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,stu.xidian.edu.cn];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w15303746062@163.com,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EF727601E47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQ2hyaXN0aWFuLAoKVGhhbmsgeW91IGZvciB5b3VyIGd1aWRhbmNlIGFuZCBwYXRpZW5jZSB0
aHJvdWdob3V0IHRoaXMgZGlzY3Vzc2lvbi4KCkFmdGVyIGZ1cnRoZXIgaW52ZXN0aWdhdGlvbiwg
SSByZWFsaXplIHRoYXQgaWRlbnRpZnlpbmcgdGhlIHByZWNpc2UKcm9vdCBjYXVzZSByZXF1aXJl
cyBhIGRlZXBlciB1bmRlcnN0YW5kaW5nIG9mIHRoZSBEUk0gc3Vic3lzdGVtIGFuZAphY2Nlc3Mg
dG8gdGhlIHNwZWNpZmljIHN5emthbGxlciByZXByb2R1Y2VyLCB3aGljaCBJIGN1cnJlbnRseSBs
YWNrLgoKVG8gYXZvaWQgd2FzdGluZyB5b3VyIHRpbWUgd2l0aCBpbmNvbXBsZXRlIHBhdGNoZXMs
IEknbGwgc3RlcCBiYWNrCmZyb20gdGhpcyBpc3N1ZSBmb3Igbm93IGFuZCBjb250aW51ZSBsZWFy
bmluZyB0aGUgY29kZWJhc2UuIElmIEkKbWFuYWdlIHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBs
b2NhbGx5IG9yIGZpbmQgbW9yZSBjb25jcmV0ZQpldmlkZW5jZSwgSSdsbCBmb2xsb3cgdXAgd2l0
aCBhIHByb3BlciBhbmFseXNpcy4KClRoYW5rIHlvdSBhZ2FpbiBmb3IgdGhlIHJldmlldyBhbmQg
dGhlIHZhbHVhYmxlIGxlc3NvbnMuCgpSZWdhcmRzLApNaW5neXU=

