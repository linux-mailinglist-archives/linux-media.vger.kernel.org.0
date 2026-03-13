Return-Path: <linux-media+bounces-55705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIllGmgmtGl7hwAAu9opvQ
	(envelope-from <linux-media+bounces-55705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:59:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E54285712
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9E31327EC5A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BD33A6F0A;
	Fri, 13 Mar 2026 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gGuf+jau"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC934A773
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413751; cv=pass; b=kI0ONh3FbHSwrXMv9SbnBWdjHzuXK14tzBAAl6W9bA3I+q8jObVq0aT/gZBy6Zzx+9nHTN3YeSovfxMwejCtQRTcOiTRVJzMyCzlp77WpI3cw4fQahBhYxoXt5lx7Uha3Vu0B+pnv4HfdCQ2hNI2R0j0cAyPzG/KDk98VN5xYvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413751; c=relaxed/simple;
	bh=D6qkme987bkuvKvbWjANSZ89Mo5mVCNJ7WSPXZ/u9BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6xmYLHeS+Qg6UKA6gQvQtNBkbm1mnJETa4CQOqJbsuJijmG8MWx9O94OW7gul6pL0apvjzkFm6NLDhFLN//+aE4cyVc0YeZdm2nkN5gCimGxerD/vcgmQUoz3cs3TYQw0pIG0oq8JEpgyG9ANEiUnwrQyhymyva6c7LkPMr4vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gGuf+jau; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8f9568e074so325740266b.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773413748; cv=none;
        d=google.com; s=arc-20240605;
        b=WrqZkiBP5PQ01FQAaAwukm17Mz5VKzDSfHNqISebWRK8IghclsREONYwfKzkgbtU1G
         FWsp7eQBNrgXLnVnZhY+lUzmUEVutM02f62gySn0Gb87N/95TtFpN8Y6FVYz40avJdM4
         LZtrR4/vwcuU0cvJ/a/4wFhs7fc+ZEZdZMIUQCPNiZ1DbBKPaDkDNF4I7otaR2h6/x9r
         UnNJh4YkCahI57bFiM4k+tNCpht+FVNy48lwpFxQ8RLrz/Yi5+pT7wGOUtDRpW5apWne
         UW6+/mLE3b+21nIb6MZVh5C1XUIiOhwNE3jzQXJ25F8Zx04dkkBHf4H6ZQsQ7v2t8jsF
         VUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qQg9Jy3pko/p3QDQIrbYAQKNMOmR0FAO1WDZwiDxM4o=;
        fh=NYlmRUg5maxPw0KVvFGrW5acKbpeU9xKS7+1XeaDtY4=;
        b=ZveIA+s/zQjpmbzJO2a0hed4QvtbIldvFiA87V2vgnvbrY5u6jcbGXzCk9HIXFC6Du
         55MqypWx75ATbuHxEr/yWNo/bmOUB62XpbS5o5D9db1gW/slSLzOgJ0BNSXIoISQXAnd
         SzETlK5Exx4f5BT+65wgm3zzygM/CbABmdDz7GXBAW1TH4ej9R/KEQ28UOR8Mui4EIJ+
         VwmX72Rehs21ZvAI5dWaUEhpQ2SiX2ZD8ndkUxbbrZc6nTISDWIXifZRN4+ru15gWuif
         +EJP2/U+ARm7uM9Z1MTVp6TjIK1YseHrXJyqqpBQsR1nap7iIBks1uZBST2iM+wJ/jRX
         q61w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773413748; x=1774018548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQg9Jy3pko/p3QDQIrbYAQKNMOmR0FAO1WDZwiDxM4o=;
        b=gGuf+jau8/V37a8Ap+/q1B/uIKWW5nOjzDnclyUDfWeAyaeBgo3F18npKs6gEjMrpv
         QZyJMV4d6n7NkE4L9m1lSze5cvOrQh0ZFVYYCgJv2lG6Z5BQpW+dFTHM8eG9sfrArlOL
         PkLypION4HmKu15XDcmosaBYO5o38fxQQwW9OBLmNDFUbhl2/zntPDXCq+3nkrur9R71
         v9BgsOTx704LuHrW27Euqat49LXJ4/EXu4Eug1wCJMx3Zg2vK/wZsCmt/sRkSbTXgXcZ
         YBgvOkwO+Zd18qlEtZprpy1191XehGi3tEUjjhUuruUqm8Tcw+Y2n59fBn/4v7/WM7rQ
         UD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773413748; x=1774018548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQg9Jy3pko/p3QDQIrbYAQKNMOmR0FAO1WDZwiDxM4o=;
        b=fjwRXfFYBDbtDS2AeYwesls7ZP17LCkWEiF/gIE2Y6DNn4yZ9ZgASESMCl67igdeML
         o69+jWYY7c/lTUq8VBjBeMEQ0Z2OVuZ6/fsv0fqrHK6RhAZhyeoPM/GE1r3fQFJ05/ep
         qnXQz9i2GFSrg1jtlVNxMJKlDLZFsUDDRYjf5CZdBAlsPsUzXXAF4nqVQBKxk2eLteXW
         ygCcF1Ecm6EANXFXPiN+ax8NxDa/rKusLpLjV6Ft14Dwlly5Jnp8MAn/Q2Wg6Vsexhe1
         VDmo7tm8MUg4CXeTw+u4Ygy93Yy4QUqAevVn0dVim50UVjIcEj8kzA4UbZqASXORXd57
         GKfg==
X-Forwarded-Encrypted: i=1; AJvYcCV1b+zkKuXBNtozirXdhyav8ctrklrRfUuPKckDnbLWa0ECJTp5wy7EjrfB4cLsK46u4VmsgBQcsDfkqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+djEHf7/RIiHe0S69650wAXoSwNq+l8BmT01WKMgYDzfFe22f
	IfnMKSyFd5hP2ge7DyQXlRUJq4PcMsBnoI169YVLNBGL2TGn4mk5pJW8+VozYLOhjsjgJy06hqi
	H9eQ+uHKmyqEf/2XTLG6Zol+/at0c0OQqiz9Z9R63aA==
X-Gm-Gg: ATEYQzwA2QdQqfOQ49IDg/m+mDvDnFDTvD3CEpmEVMrtzxywVkLsVQP41EvNBSU5rII
	RL/OnjxyN3imlF1h4JPiLHl3JwrALsP/SghA8B46eZW9BXhK3rp330Dsvspk0KdHUNyRUGrh8oi
	ALoy7SHv+ytzpJYyHalWkBAFixCdIeBoJxHeGFzWCS2R7CCsiK1IVsf/gJd33H9uMEqBRoPdBVu
	QTmHVq3rkWzVDmapl31MmUjDLez7o/w3JHZqy5VBDq8GaVcr1O4Pmr2ipK7lZd4jBVYnYkGbFmn
	NSCER6jo6T4kYv/F8m6PAqv4y/bXY5JbkvIei01A
X-Received: by 2002:a17:907:3e29:b0:b94:2ca0:4ad6 with SMTP id
 a640c23a62f3a-b97654596f9mr225200266b.56.1773413747993; Fri, 13 Mar 2026
 07:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212092846.61602-1-marco.crivellari@suse.com>
In-Reply-To: <20260212092846.61602-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 13 Mar 2026 15:55:36 +0100
X-Gm-Features: AaiRm53dYOYIHMjGy-9PaNnoN1zi3lXBK63hVsHd3fpebyV4762emwKBW9UqaJk
Message-ID: <CAAofZF7VOvWCRbH4b2z+nqg9mGaup7PuQrVyjFa5YCKS6itgSw@mail.gmail.com>
Subject: Re: [PATCH v2] media: synopsys: hdmirx: replace use of
 system_unbound_wq with system_dfl_wq
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Shreeya Patel <shreeya.patel@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-55705-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C7E54285712
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, Feb 12, 2026 at 10:28=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

