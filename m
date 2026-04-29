Return-Path: <linux-media+bounces-59942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOAsKim78Wl1kAEAu9opvQ
	(envelope-from <linux-media+bounces-59942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:02:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C55490E70
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD8A33053890
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AEC3A8736;
	Wed, 29 Apr 2026 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UtJa0cOJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E363A75BB
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449648; cv=none; b=Vq/jMRcGSkR/iUrXt2xW9+EF4UM0KVNYNmM71MM/uSTc/OSoWVAJ4CffrQY8MbFdJ01ZC42B4n/RBQhGVsZvH9b0ph7Ibv5Ov7FLZ/vS3SKLFHr4+5WFz/WDWIYzUv5RtRD1blppeY2tV43WsxS2mZQBwFDQmkZ3mM7ViJ/5LSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449648; c=relaxed/simple;
	bh=jUfv7BY18i0hzz1iwaD/eeJ7LRQt53qdiERx2ReGrsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2oHXO/slLr1nj/Iqe2qQCxIBKLI7VMuwjDR386/NCRx6VqjbzHyKjd0fav3lxwP2OxJmuC327UrVfjmmwTcZOYzNY2dJuJNhjx9vRV3/ITbpeVy7wp2ce46+OAXFcAYR4srdAaJw4yNyzWayIGHe+geUlA/MrfF3P6fEzFbdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UtJa0cOJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4462f8d2488so80859f8f.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777449646; x=1778054446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKt07qcPF1NidEM1dAs7s4kLamhrOjHwcNAU0l78/qI=;
        b=UtJa0cOJ2Ik+0qnbSPe4O4cQakHmMhkItx+4s9ze5KogBaWHBGCr3JoawwPTy4Hr+o
         OB/XHMKOdUenA/X7fvMpfos/E6HQiOKtKt4oefQ2kDl9oBu8hv8ZE4Wuw/Zfhv6rc0C0
         J2QO7kjSssKqGhCqD6iQhV2wQNGp0xmwOhcKhBDYQOb0ML89QSI3WsJjvX2+ZX818dos
         ry2TyQVwTC4xlTkqHrrEBKj+RvRwdCOaLks2dmtFPoqzc8e2wJggeOh3V0pLiT3IH4BU
         PvxTVMpscT1CLsem8eCukS3Ny8wl7xO1WClUgsql0Txktgo+GOmjGCtz+WVvpazhGvwS
         MvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449646; x=1778054446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKt07qcPF1NidEM1dAs7s4kLamhrOjHwcNAU0l78/qI=;
        b=BoFfzA4aMXthfjSV/jwePdrzc3W3fFI2riPC9mRioVQ4kApiC0qu4m8+hVmnRdPiJB
         YTclTxFk9vb7zqm+BVBCx1lE17pxWWwpBkII9JFdDmzJFVflhHiLQDuYhZV8/n6BAJle
         Uhq/KVGJN5XdByu8UzO8gTaZFTQjNYGhrhxbIRtgo5wd4D0iPcGuPMueUV7P0Sow+0rh
         mM1WE9CgBK0Iu15NpgKS1PbbqSR0PQCHB95tfK3EeAYiVzBSFvjSriwDXm60OmlRY4YJ
         vMapqaAimhPm2sWh6Ec95ihurlX6BnDdc1WpgOiEx3pGZquFtiIMtI0+W4n4ShUHV5Mg
         p5aA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ez1HGDs3CIX0egTwLX2PesfVNQLep7hKJzc5reZV4mxTMSXVPx3XWMjlSpQYS9De1ip7ad3yprSuYzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo/rG/Lgu5k7/Jch8ixjslECzcNLQFm+TQQdFAr5730+2rfcXZ
	cmb+c+ogIKfoHQGZV2Pyfk4/PUCqwspPS6ZFmMpz5O5MMe0XKu7MqJcprxpvsiSYf0k=
X-Gm-Gg: AeBDieu+vBoedj+O/uVDPAjB5Ix/k7fQwz+X6sSuZP/FD3kKaXcCFnAh51OJh794CuM
	IjUAuI8oaV2ReVcKkOsVF3aAk0JMuw/j4j80SZvfxmMcqxS7c1dpdNbHpGgZ+dZcVnCySWFd9rJ
	nK97zWdsWeUOj95ch2EXemn5YUQPAh3skEZ1oMJTUZdGQPHhmIuMCw2Qu3fYx1PWTlUss2P1/uS
	NL8yoHybncAEcFCBl04KMyT7ZkAEb6sU9BHQWoM7FCcJVZ7OIFnpOe0f69hjV2cJWMpJkbDaNWU
	2TDssejrW0/12FHpUz7M1P4jAya/fDwoWbQRgv1lxIGKsnnG8+6oZIdX3ngL4GXJZdj22YE4KuS
	kVexJMcGSkRN6Jf6GU8w4h9D2AVQhFLjCdYx32mja4VR1R0uMomzDuqohrLVyknBCFQHCbGgYbt
	+pmKYU0NnHpE8vF4AWfseZi+AxPutw3dzuFC/cDMbAt+c3USjrkcB3dgxvq4b9jSkYLD77
X-Received: by 2002:a05:600c:3acd:b0:489:e696:127d with SMTP id 5b1f17b1804b1-48a76f82973mr58572165e9.5.1777449641184;
        Wed, 29 Apr 2026 01:00:41 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c303c3bsm18098475e9.7.2026.04.29.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:00:40 -0700 (PDT)
Message-ID: <78978a11-8345-4b84-bef7-90d17f4c581c@suse.com>
Date: Wed, 29 Apr 2026 10:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org
References: <20260429070759.309110-3-manuelebner@mailbox.org>
 <20260429071445.309733-2-manuelebner@mailbox.org>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260429071445.309733-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A6C55490E70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59942-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@suse.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,suse.com:dkim,suse.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 4/29/26 09:14, Manuel Ebner wrote:
> Update the documentation to reflect new type-aware kmalloc-family as
> suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kmalloc(sizeof(struct some_obj_name), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kzalloc(sizeof(*ptr), gfp);
>  -> ptr = kzalloc_obj(*ptr);
> ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>  -> ptr = kmalloc_objs(*ptr, count);
> ptr = kcalloc(count, sizeof(*ptr), gfp);
>  -> ptr = kzalloc_objs(*ptr, count);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>



