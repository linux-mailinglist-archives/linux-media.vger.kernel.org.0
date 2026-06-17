Return-Path: <linux-media+bounces-65098-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0AFXMTBoMmoszgUAu9opvQ
	(envelope-from <linux-media+bounces-65098-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:26:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 297EB697E2A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:26:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rU8T2g3u;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65098-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65098-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3D863031831
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790423BBFC9;
	Wed, 17 Jun 2026 09:24:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF675390218
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 09:24:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688247; cv=none; b=phmsSyfUZ9tucFEsdyMOoYkVWYVTYmVFawMt63ZTULFSyWqvx3pZKYrLa/N7Bpg5HtCBNpylWCTpWcXb6utcPvHx+v2Jni5ZG5d5ghCqDF1x967Ms5mWfQifOUkN7FgLt3+FuirifnaGAjiRJyI5tUSDW4nLng1eIPh4XfsMqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688247; c=relaxed/simple;
	bh=SKpnXLCi1zvZEUGcty1rCiGcsCQy3SKBLgIRXGBbd1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=g0J2RcckQ57IFQ4OrZ3H/z7CLWMZnhtmU+TFCLm6Gd3Q/w8SdDr5TmdJ2xzGED+SJOdaC9fS+Y9YDTeiR8E/H36IORTEFzlvwxn9c3GNvwrN8KfFiKHTNZjKtPsEjFv+Vc1T7Y5LFUvoH4al95yfu2KoV8/vi1vWQbKFpCmgtvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rU8T2g3u; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf20f6be6bso40199815ad.3
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781688243; x=1782293043; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pp4NLBaZLYt0mSXO1l3vgMogqTTRDL09jGLYhpl4co=;
        b=rU8T2g3uP0ISS1QSPbAhDwh4x6zypBlrFtpYhpNVwYdyx1ma/UmDM4evPvrPPi/qCx
         uRHrXlO2t2BJN4m4NHOYCWkkgdznx50+Fy0FgwfAlctQIJT7IVC3Y+uccOLhcjynwvZm
         3Ahnf9fs8bOUY4utbWW4IwczFlsGThosLX7eovzwR59ocOulZYggQU/bO9prxj2oYOqa
         YoN5iW6weu/9XONkjfYhsDzyE4cg7AngFreLW1QXRyvV5Q5a+5xQp2zHcz5QgW/UfU6l
         zqJ1DfPjBAsi/hkEe/gJ2ZfsK77OaLAq5G1DylEh2sLoesn26/GbQrHPaVr653uFO8Dl
         lsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688243; x=1782293043;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pp4NLBaZLYt0mSXO1l3vgMogqTTRDL09jGLYhpl4co=;
        b=GdPuenCffxyrWwvxv4jtRE9xIKeuT7nMGYxcsUeeoCeNVLSSKc7hPEUmw60vOzlgvs
         HJhnlq/jXHKDlTnMKLjeVimNzJFPkyrOB/YoUAlWCctH+2B02tBljzUuyJ2ITblyf/6F
         xPSLyKRf9JXHJUcU2xlciWP/08x/Fgv76D9SCsKeT4IbcTKkGhuwuFEo87BfQczhMSZu
         /32HSkd4JGsw4jmN7xDLeEYJy9XihXDsiBsNWMCGhOBYoYutNWF1TJryhwcZw0GhjwKy
         a9+aV/ntGXwK1HdwZkNCyuZTv1pXQjfCg9O/FhPAhzQk0+5P4o0Kmoeqvhranv1ZMw+R
         SwMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GZIjKLyqtbozDpAG+ihJ2Cajcy2+SoD3AsKxHDC8nhmm9mU8egGXNjjzCKxnsLeMQgSvQgmrMqfQHHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEJnjRzSmoLznu9ykRxpqYCxsejLwxTM1pr2GWIy5V8+1vLTxn
	Joq507pmt/Oyz0xqWwss/37AjsTbMWNPU0fez3cYCl+OfnmOZ8aPWgf3
X-Gm-Gg: AfdE7ckwCJ/9po4tuhT4/4TWgdMXtxgaUamMrVQq0H7jcufiDcv2W7KoVPy7PmAVF8x
	6t1F4/h4WjMvUkvDQuKmpihah2hDsimNYJGldv2jNg7J6+YC2rzscal3voz/7WKsLVapXCzExZY
	tHg9YzThAtJGpj1uWrTVvIVxGt9gCN5X/qxvpWOKgdSiz2Cvb09O/O5g15soFQRR+7EF9i3b179
	2Md45TXBsUJO6Y0fOIRefpKaoqYuF9IgbghiqIfy06n5Wk0NbQIGa5CrhSaQUCVe3zYVS8PmJfP
	ImOzPlgQI6cyqtU5OoiJFD1fYHQRrgJMdfSbYohFeZ5an1p0w3lmnmEaF6uZLTV9MVTqlpDDsnb
	qzYU5OvYUONaHcJK/snIlNlRtW7en0R2RoIM/GgV2cIipZ9R/ZGEY+fJ8aWB0imiDUkLlxSW94t
	Je26Wd8opMgH0brhwT0iMTJF3QrA1IaxDyJ/fPwg==
X-Received: by 2002:a17:902:f785:b0:2c0:ab82:6b99 with SMTP id d9443c01a7336-2c6bc26568bmr30294975ad.33.1781688242860;
        Wed, 17 Jun 2026 02:24:02 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6b3c3a213sm31829895ad.40.2026.06.17.02.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:24:02 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: dib9000: possible stack overflow from device mailbox length
Date: Wed, 17 Jun 2026 17:23:59 +0800
Message-ID: <178168823990.2842361.10887181485250914954@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65098-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 297EB697E2A

Hi all,

I think dib9000_mbx_get_message_attr() in
drivers/media/dvb-frontends/dib9000.c can overflow a small stack buffer
with a length the device controls. I would appreciate it if you could
take a look.

The copy looks like this.

	*size = (*block & 0xff) - 1;
	memcpy(msg, block + 1, (*size) * 2);

*size is the low byte of the mailbox header word, which the demod fills
in. Nothing checks it against the destination. The callers pass small
fixed stack arrays. dib9000_risc_check_version() passes a u8 r[4], and
the APB read and write helpers pass a u16 mb[10].

*size is a u8, so a header byte of 0x00 wraps to 255 words. That is a
510 byte memcpy into a 4 or 20 byte stack buffer. check_version() runs
on the normal firmware boot path, so a plain probe reaches it.

The mailbox read path does have a size check, but it only limits how
many payload words get cached. The header word itself is stored before
that check, so its low byte stays unbounded here. fw_init() also checks
the size, but only after the memcpy.

The attacker is a malicious or spoofed DiB9000 based USB DVB stick. The
demod controls the I2C mailbox bytes, so the length byte is fully under
its control.

I reproduced it under KASAN on 7.1-rc7. A small length byte fits and
nothing happens. A larger one on the same path runs past the stack
array, and the stack protector fires with "Kernel stack is corrupted".

I am aware of the two "avoid out of bound access" patches from 2014.
Those only touched the send side in dib9000_risc_apb_access_write() and
were never merged. This is the receive side, which is still unbounded.

The fix I tried passes the destination size in words down to
dib9000_mbx_get_message_attr() and rejects anything larger before the
memcpy. Each caller passes ARRAY_SIZE of its buffer. It is about ten
lines and applies cleanly to 7.1-rc7.

Does this look like a real bug, and is the bound the right way to handle
it? If it looks right I am happy to send a proper patch with the Fixes
tag dd316c6bacc2 ("[media] DIB9000: initial support added").

Thanks,
Maoyi
https://maoyixie.com/

