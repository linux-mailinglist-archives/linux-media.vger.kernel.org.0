Return-Path: <linux-media+bounces-52778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kSHUNTyCj2lTRQEAu9opvQ
	(envelope-from <linux-media+bounces-52778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:57:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D914139498
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EF00300E2B9
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 19:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B25285CB9;
	Fri, 13 Feb 2026 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvYTcLNQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com [209.85.160.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E2239E6C
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771012663; cv=pass; b=I1L8w8tjBIMd9cBcaCkpTQUpDaXyufRTi3ovckOC8lu//jkJtOm6o8Bn85a2Hi1654mjA2OTDSB7jZDS9ATXPCLg8ODoNgCfRQu/eXDPYcqiJ2TwYKgiEn6saiBmfh0IixlWcdmFds2r4PKnDb/eouW6uSF+tTHGt+WxacQx48k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771012663; c=relaxed/simple;
	bh=IGfWkinjMOHNKED8/YZhSc0EWO4DlWu6yYaS23heKdA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ch6x91Q6oenvvNfcoUDHHXq/oYo/X8cN7/uiW+jGCXDJk2gX5yF0NBdlRgnEmOdLqrLTv1pbjbqGmaQRxkGRRzs4tc9adz3fZsrLNpDpzm1AEDbBYc5/S3dzcu71VmlV+m8jwyYLqS0p2F7OWQ9mLP+yNaQTfd5vAS6AsAYGJog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvYTcLNQ; arc=pass smtp.client-ip=209.85.160.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f66.google.com with SMTP id 586e51a60fabf-40946982a78so443974fac.2
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 11:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771012661; cv=none;
        d=google.com; s=arc-20240605;
        b=bffzFbpdYZNQxMpK/5Zwbd0o21nD+OxzavSKThIhL32aWCEpgtIuZH1cAnnq2gmU4X
         2pwvR2giG333vb+QNnzQeJfehVYPgJEFRsMd8KPp0PLJBk6yciBdOJ0bH9+cV01E65g1
         fN76YD0eklD26e4Rp71qHvisi22tsfbigddR8hHAWuDn+jZHFB+K0etMIyEqoBtTLsLD
         zLN+6xHIIdgF8X8vvpP+YVlBkaBvcN9zHVSP2nLL4yA5mZOx9SUxd3N131enUy+xmN8M
         tTXbc+7yTv/84dE4zCSkBmA+KxkWTDl2sj+jPsFKxTZE4ebFule44q+2yMBwB3te6rtL
         6H7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0sTVndXutivOaouYtuhimGwmsBXNgrJhfoFuTS2Y8Kk=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=OLEnWcmfjPqS+ePtDxk0mW3rFOS9UWgWKy+K81xD2gio37UPJE43KibafUT24/ZoQB
         9UO7uSebMwvsVycWvgTgkVrrg1z4jReF/DgpWlpTrnq8H6gm/I1cT9wajMyzTleFQLuo
         a+GlA8JuHydxgqgSadYHGOh+Zw6k2OTsmsvJMjULHd0mMfMMDJqoNfDLJpG6hfBxnFpL
         +NbdBC8WuE9qkb/VRu8HwfCohvgp78Ij7mx4u+cVzpJmlaWheB7AASDWvQV8SaSD0m5X
         4ZBlYCq/apbTOvc2G1/gl/d2NMYc9vAseoXlMCNmlET9J36H81/nzkluFHQP7p/IOBKk
         uYEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771012661; x=1771617461; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0sTVndXutivOaouYtuhimGwmsBXNgrJhfoFuTS2Y8Kk=;
        b=EvYTcLNQoL9UF9H7ASiDxaFJo1uITIgRWCOx3AepW3A2cnKf38sp5tTTA5dQYuBUq6
         gMBOWYDiFZpDCnglhCXZX8BWIdAtUNdbOAwh8aBo2rA/Nv32lmLllVHqLdR642T9a3is
         /V5ZxerWlELHVqsA+McdleAV9HKWzQkioMUQRqDNsteX7pg3+s8C+bEq85cK7YlB/Yf5
         3T9yKWiGEUc1dljrvEL4EOvcU7y7n6ZdpV2sjZ+S2BRp8phQwCOUS94XalCFLHvHT6MS
         A5bqAiYdyg3whHprGPtTLTYUZMftbqz3gN0MgsCLkS1yjoliWVlmtd1+6j2LO3/4xhYJ
         B+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771012661; x=1771617461;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0sTVndXutivOaouYtuhimGwmsBXNgrJhfoFuTS2Y8Kk=;
        b=FW/2ZPMtomTrdyZJgt20J19TEHX6+GhHb9jduPuOhrK8xNhWZqJTa0o1bbii+6Pxuq
         L5P7ML/HQmcW0EG5oIV1+DRH3yybzFRp+DAbSW9JUOq44Pf8VfSkScFWrHCIzSYmsyKy
         Wcdp96a8e3SkGq8DDIm53WAI/lo0m8woXqyYZrw9cTtQhfwkXa7cemBfk3kMM81v6iMY
         uUlJKFCamkElXvnIRsdtc974O7pSE+d0uyOGZHog8dEWhw/KyD9k0Ds/KsSyGPcsmM51
         CH3WnA9XvqdGFRx2+z4psVuAZ0v5SoKB6tpST/RJei6S8DceieKwSPMvyqUNdaH9i7ba
         TMpg==
X-Gm-Message-State: AOJu0Yzr5IktS4ggcBzNu9Ws8qZv4aD7qbupZXI7DjFCdq9STF+1ppuM
	ihvsrCCayDNess3oCVQfx5TYpTE+DHMER42DJtOuqbpMbwrnRVfQfidJISLECFjwY96DtHRxySa
	4a3A4SJCNzoZK4OTaFq0RAdpTPIjklzo3qanuJ2c=
X-Gm-Gg: AZuq6aI1buXAkA60DnjaOsQqLUR7EDuzkYFjqlokoSbgDUyzK/o/5F7rqjnK+vRBzsQ
	fkPuQ2R7FB2O/XcNKeXcc2c5zX57pIsArvd5K/hg/cfn8T04pDYSbUsVgTGr/u/PybiBj7wuVvr
	nq0AcxUx8hK+1zwV9x0Y2C0AJfFgm2wQ1K7ipulm0ZaoCSMt2aKcxbgfNWLgL3P/3eRysXs2IKX
	B19Bb+2KvlsO8gBFBup3KI2iH3poNtUTngTha0Cvtp+O5Fmt4Ga/GOMJ1Tc1GSigJnTpw/iUWSz
	8ML00wLukqoSsrlHdiTsjEPvIf9T9QIdDTUSge1WXle3woL2gIEL+b/2NmLay0pXWg==
X-Received: by 2002:a05:6871:240d:b0:40f:c84:e57b with SMTP id
 586e51a60fabf-40f0c852a46mr454052fac.28.1771012661109; Fri, 13 Feb 2026
 11:57:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lucian Onicescu <lucian.onicescu@gmail.com>
Date: Fri, 13 Feb 2026 21:57:30 +0200
X-Gm-Features: AZwV_Qj5gggVzHXjP2pn4rAQ5_X-zcgUumEbZkmgIvcbhyDwK1dv1Ua1tGKCflU
Message-ID: <CALbYB1O79OnqKMF--HWVx-nuKtYKJbE+Ux=yK_45HDb4oujQyA@mail.gmail.com>
Subject: [Request] Add USB ID 2040:8360 for Hauppauge WinTV-HVR-935 (media cx231xx)
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52778-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lucianonicescu@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5D914139498
X-Rspamd-Action: no action

The Hauppauge WinTV-HVR-935 HD stick is supported as 2040:b151
(CX231XX_BOARD_HAUPPAUGE_935C).
Some units report USB id 2040:8360 with product string "HVR-935 Audio"
and are not bound by cx231xx, so no DVB adapter is created.

Please consider adding 2040:8360 to the cx231xx_id_table with the same
driver_info as 0xb151 so these devices work without out-of-tree
patches.

How the ID was obtained (Debian, kernel 6.1.0-40-amd64):

  $ lsusb -d 2040:8360
  Bus 001 Device 006: ID 2040:8360 Hauppauge HVR-935 Audio

  $ lsusb -t | grep -A3 "Port 3"
|__ Port 3: Dev 6, If 2, Class=Audio, Driver=snd-usb-audio, 480M
|__ Port 3: Dev 6, If 0, Class=Vendor Specific Class, Driver=, 480M
|__ Port 3: Dev 6, If 1, Class=Audio, Driver=snd-usb-audio, 480M

Interface 0 (Vendor Specific) has no driver; the stock cx231xx module
has no 2040:8360
in its alias table.

Suggested patch:

--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1026,6 +1026,8 @@ struct usb_device_id cx231xx_id_table[] = {
  {USB_DEVICE(0x2040, 0xb151),
  .driver_info = CX231XX_BOARD_HAUPPAUGE_935C},
+ {USB_DEVICE(0x2040, 0x8360),
+ .driver_info = CX231XX_BOARD_HAUPPAUGE_935C},
  {USB_DEVICE(0x2040, 0xb150),
  .driver_info = CX231XX_BOARD_HAUPPAUGE_975},
  {USB_DEVICE(0x2040, 0xb130),

Kind regards,
Lucian Onicescu

