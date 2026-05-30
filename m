Return-Path: <linux-media+bounces-63123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO04GHrOGmo59AgAu9opvQ
	(envelope-from <linux-media+bounces-63123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:48:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A060C9C1
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD7F93037E44
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123E43AE185;
	Sat, 30 May 2026 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="ocIhLwk0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE5E3955D3
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141608; cv=none; b=OEnhHqr0mRpc0mtQXkgbzUGJ//WP7zOkFq5GUksda0is465P0ak6KG9ZfJ7pkvorwTiPqAyDXBWIozQP5HR/zT+1pOuZnOx3ju/Hu9gsRvIlRJxn56XRqsrcbzbncMdF/OPdwXNE8aYj/tZa8sD62BuiyhotlAFwSmwf1FxNKWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141608; c=relaxed/simple;
	bh=9z5gaCcETkHlKLUfBh1xAvlPs3trKDl48H0ub1c3+4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AhtdWALI1NygJzxJczxWxHuY9mS7UyQaCwPUsD06XAiDVOyEOk+ztmhnx1nIVot1rlMT9Ofa0javNd+hIdOiXHb+hiX0fSZiqj0AJRZPW4fzpc2JlmK1E3Y0oxJKtPKl0PTz2uLXj8YyyODOLAn42gGVsaRTq3ti9oBbAL/73Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=ocIhLwk0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso74276635e9.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1780141605; x=1780746405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1FWHqbAB9TF09zdPmqMJNEE6N9Lu/1qer5VB9ESMa8=;
        b=ocIhLwk0yRPju3ENzZqMAplhzIXIQ6qNdjPCPiEecnMp51LnNMirkQEKaPsvPectbf
         mxSMozyEjf2IzKnaXV7gdAfuYEX7pdekzSrZohwHuKxzjJqaR1IASITjCLI5w1PH93z8
         TsQd4Q7PxG8l2LW6J5/KtjccOnydhfsHYLgAXwlGebz5kE2PUN5Yi8oC08dTPY5RNGU0
         rGjo9yrhGRXnJTrzoOpodF3nyFNV8APCA53cwnW44/CNnQGZ5ThBqS1En2/ttl3XXASs
         CtbL+qHjlOmouCwWWuBKptJgVzNTkG2bhB1IG10rK/JOLSTi8QR0P/WFEqZZUZJXkkm9
         Vqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780141605; x=1780746405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F1FWHqbAB9TF09zdPmqMJNEE6N9Lu/1qer5VB9ESMa8=;
        b=ZHOKlHEA8NblpTj8sgDL2NWj+rV95WseVUh3zdoQxDWP0YqLpyGF9aKjeKIwEgtbLL
         81C0ETECb1+oLRZHuw4eOeFFSmI+9TbMg6Ue5A0neoXljOS2XKLOFFwWp8flujccm7r8
         QvFOteYDmOGXotoEQtMEl0OWaDMPgxQQf2CBgkW5NDwg+CZZhU2PnGNDG4ZuiUgSi1td
         1YbOV6fu9SX3LKAg3XUG9ShQ1H8KvvMnXTiGBezLDYvkGcDw19b9EN8z0aNbMuMeMOsH
         kQKyl1Jmylhdjkn88rNBRLCdsjWg/3rtzBOJ5u7MrwM7JTR+cXMWTeviBKrMK2eBaQD4
         bnnw==
X-Forwarded-Encrypted: i=1; AFNElJ95km03Ugtt3AWwT1cFZSIBsCLoW9TsWy2Lu7H4kV/0+veQ8fzdjxaEwKZona4FMaL7QjWvgCu8+BTRXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkn4ID/zBW0wB/KITvzahrAwRQpBfGPjyM31NJIYRM8iV2w2PT
	V4zlCnD35Jj4cUIhPSd7YVyaaKR33z9NMMRpQs8NX7fDCbqvLi9TDKs7HdGy1Ni86Hk=
X-Gm-Gg: Acq92OGVlZBBiBKhMgfo7VZEyYHJfYveYCekJUrEneUd2F6xTNJrdZkLlC6VtxpqFSk
	SXe2DeDcSUBrnBe2fBxghYH272O75iOh2TFka7f/NS8X+/qtPHQpMXGMOzpw9fFpZcNcR9jUkaf
	UFU8e6iubM/YN3AKjqhu52sUa7hxLexoM+m/aRnVWJ4sM/wjLny2CACGAbGXQBLFHiLsQq9nAMS
	OVplAfpME2W3gubpCAhttJfsMY9S72X+uthXOOAREnCtEQGf6pmKGFASgIcKIoN1vZMqlnMdhIK
	hT1VpeSn2SBC1M7kdV1rARgb6K08fFsnsE3627Vpaol9OItJxvwMGbe6hjYsHvnzE7UFz4LP62Q
	X24DohlB1WkcfXGVQHrj+mXu9zNSv3QuSd2TUvEND3fmFYNS33MYXfzte9JukVXtS5JmM2YnD9Q
	ESaF181vAqKxyxaL0ccXZuCX9JUZQa7DgOPT01f8Ngesr4uiqoqxbi
X-Received: by 2002:adf:f2cf:0:b0:43b:5097:6f62 with SMTP id ffacd0b85a97d-45ef6b99e1amr4501090f8f.36.1780141604850;
        Sat, 30 May 2026 04:46:44 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:953e:2ecd:ebf9:4298])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef356a4c4sm10888972f8f.31.2026.05.30.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 04:46:44 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: alen.karnil@ideasonboard.com
Cc: asmirnou@pinefeat.co.uk,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
Date: Sat, 30 May 2026 12:46:43 +0100
Message-Id: <20260530114643.12795-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5f239b90-79ca-4533-a39a-a5421d6920bc@ideasonboard.com>
References: <5f239b90-79ca-4533-a39a-a5421d6920bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[pinefeat.co.uk:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pinefeat.co.uk:+];
	TAGGED_FROM(0.00)[bounces-63123-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pinefeat.co.uk];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[pinefeat.co.uk,kernel.org,vger.kernel.org,xs4all.nl,ideasonboard.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmirnou@pinefeat.co.uk,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pinefeat.co.uk:mid,pinefeat.co.uk:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B92A060C9C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 09:36:13 +0100, Alen Karnil wrote:

> > Could you please ensure you are using the Makefile provided in the cef168
> > repository?
> ```
> $ make
> make -C "/lib/modules/`uname -r`/build" M="/home/admin/work/cef168" 
> DTC_INCLUDE="/usr/src/linux-headers-`uname -r | sed 
> 's/rpt-.*/rpt-common-rpi/'`/include"
> make[1]: Entering directory '/home/admin/linux'
> make[2]: Entering directory '/home/admin/work/cef168'
>    CC [M]  cef168.o
> make[4]: *** No rule to make target 'imx477.dtbo', needed by 
> 'modules.order'.  Stop.
> make[3]: *** [/home/admin/linux/Makefile:2024: .] Error 2
> make[2]: *** [/home/admin/linux/Makefile:248: __sub-make] Error 2
> make[2]: Leaving directory '/home/admin/work/cef168'
> make[1]: *** [Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/admin/linux'
> make: *** [Makefile:16: default] Error 2
> ```
>
> This is what I got hung up on, which is why I moved onto copying the 
> .dts* and building it from the kernel directory, which lead into the 
> previous issue and me needing to roll my own .dts*

Could you pull the latest version of the main branch from the cef168
repository? This issue was fixed recently, so it looks like the code
you pulled was from before that fix was merged.

The fix involved using the dtb-y target instead of obj-m in the Makefile.

> > Will do. Should I update the patch before or after your review?
>
> I would prefer if you were to update it before just so we are in sync, 
> thank you.

Will do.

