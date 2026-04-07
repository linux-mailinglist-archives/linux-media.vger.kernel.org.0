Return-Path: <linux-media+bounces-58201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GPlNmKa1WnN7wcAu9opvQ
	(envelope-from <linux-media+bounces-58201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 01:59:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4121F3B595B
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 01:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFF4C3036385
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 23:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3023D38F62D;
	Tue,  7 Apr 2026 23:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjrOnDCp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C8E38E5E8
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 23:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775606359; cv=pass; b=o/jfssa+5jElxCQsPgi05GKC2UoFau+2uN3q+vvylaZZGooF0TIA2hdhBX43GflKNZShORU7gcvF6o8q8H4E9Qa96YS/s4DTQWFZhtdulyCrQG9cxXVrPNOBgOlbd048QrPh5aN5qio2ba1U85psi6tL+H6fzX40ZwEI1Kjgjho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775606359; c=relaxed/simple;
	bh=EWZEt+Vi3klw3aUwVjTWvHLVN5SNDkxrwlnjZJkNvxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RQnukDkg0KvaFaN297v91AlfESYhaD4Q74asYCT/ihcAwzoGaIUEtchTfJwjTqMaPdv8A658LV9Lo43/DWSKBIYR9o0LjcD9iPAPNf6Fw6dZN5yXkzirSZL/kx5LWrUfO0vXu2sG1sAu6KwzqYdca3NkTWY/tAdaiD6bZWYsCYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjrOnDCp; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82c70e4654eso2570215b3a.2
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 16:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775606358; cv=none;
        d=google.com; s=arc-20240605;
        b=SddqhTjh2L1d6Qr/ufD2aGOOdvlGtypb1byqNf30oIBoL7KYk2ZoInj4Ys3WfpOTGT
         7lquK3P3fnidwpkw3OLj7Nzu8QVyDoUn7S2tlmlO6TYVxelX8yMjFGofkS7QMKip6X6i
         pHHhdHSOMjG65XDTvupzQLfNCEQRLEN2VaxoiJvzDi2Jpr/CSGX1phh5yIgVtyC4Uhxr
         /J43SgkagHnRh1qZWrxwDsEUgWBDyl0euAjNqksT80VLLYqADPyjJ7dxQy1XNke4UNbJ
         FRTlXcq6kp2mVT5lZayEUoes6FMR8sA6AgZ/YTahqQtqRIEcxh6/oLrQYZv9uKAZ59m3
         cDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EWZEt+Vi3klw3aUwVjTWvHLVN5SNDkxrwlnjZJkNvxI=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=IKD5piiSWSkVY6tM7ECGeG5DgdSkipRcrMAdIREfE/Okcp7Au/hQXVHxpbbrKPZcis
         qQDfEYDrqPLl/iiWj4LAtb7VlBMQea1qiiAzldBKBi+GF+oJ2OI2SqoyI54oPaJHixis
         qK3Zzo9L+0BLNpAXhFEVCmAY2m2gwQMqfip4Tgiu0jgenHn0+hagRystgiVdsNEbrLhf
         ft0gmUtR7hZL7Y2CoXt1BoAH5JCTjwhy4PE4VXPs0X80Fpks62e0T8pGJD61SV4TjVt6
         /nNFrs9WpjSt1c25wiQHCQ/NGzapJsx6H1R65t3BUrkVILwzW46MUisdpsYSd1llpBip
         rB6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775606358; x=1776211158; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EWZEt+Vi3klw3aUwVjTWvHLVN5SNDkxrwlnjZJkNvxI=;
        b=FjrOnDCpIe4xWUtnp1a305VaxIwdN7RNcvDBg48fQttnaU0tKd95kW7j8Zt04olGce
         1v8FTyPWbuuJPaJPbas9SpdmvAqZxDhwtJ2MNnCOR1JYGX2bNE/MYwZv8Ug//E5uryHN
         yoST4OnqdcSDGBVZB2EXrrA44irgcylY5VDzg/m5IL0hFaE4mp4AaBl4hzBoGOyxstin
         rDsYxDNYwfCEQ3jUKU9gKppIgDMcjkKIDjkH4Q392rJQwZtZujiGCHF6t0SE6RML7xum
         zB1VUMDnKMYTs39kQEFSy0viNuj01yWd4LuS4s1PXF+dhSUB/zR1G1MiRD86NjpJb5Iv
         rJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775606358; x=1776211158;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWZEt+Vi3klw3aUwVjTWvHLVN5SNDkxrwlnjZJkNvxI=;
        b=XrNcNjRA/S+dyz0Kudkw1Hl8KkxvPSDS9dJu7TkT/jZmBet/rspH3lbKVh0lko3Aq2
         l2wsP5AkWVrQY/4TpPRKlJUyV55jkRpmIJNLqUdOf0A2VIB6fAedxF4/QJz455Um7ZXV
         99zlL2LUKQBzyCi0nOwil4RTW0GMuCTo70Zx+1d2HYTDkpXG0x7/kIEX8blmCQkL1tYA
         Rr1v2RHJbsOQWEY02ljk1aBGzrwPdYfGBoeZGYSgX8tVhSxcJqBdRAClkpW/4EzDA6/F
         DWUUcEV+CjjVq6flzdG4gfbqywQrinTSI9gGIw7q9aWrujIisBdyY70yOGbmslGIvypt
         cQ6g==
X-Gm-Message-State: AOJu0YwXCxEotxDMMIY7D+qVMVHWVZsFHg4Dp62LNBIYMKvWxiDOIRGD
	+bxvyPzAHlWXKhqz0piLV+qOYykEpPjP/KlqSBdrz1Ue0w66QF3QSDoZ5iGxp7DkxrDLsl/ZKwi
	crnMYrCp1sSFuP2darKrDsTIOvxgWo6Tl10OW
X-Gm-Gg: AeBDieuHJ9RjoQDzpdY3aJ2TGBDq6dbpAu40uy/lwBEB8Z0sL8WVwTNn7Tt72q2tfqq
	+DN3eaW12VhEnH3xzbyWo9hofuZQUbxA+IAYbWHcnazjGIm4r4cttMFRzJHnAXeMp5fnj0wdkxO
	TcT3J8puCIOVF8/BSeCzGDOVsohDTSwx90wl6P83E72hT6p1POr/GCaYd8+D9SUAmfm3cEwVY9g
	MaK4sTmjBcJnbdyzhfG1S8nqfhldBfVFBFGois8pDVwVH3mgGcDDWRPJ2yPl0Io9vNRxmYGYD8A
	QFm2GRf4Qg6yw6bdfuRwR8q5336kaEL/ShDRiLmyeQ==
X-Received: by 2002:a05:6a00:ad08:b0:82c:77cd:50e1 with SMTP id
 d2e1a72fcca58-82d0da993b4mr17873944b3a.20.1775606357682; Tue, 07 Apr 2026
 16:59:17 -0700 (PDT)
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Tue, 7 Apr 2026 18:59:16 -0500
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Tue, 7 Apr 2026 18:59:16 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: cooper.kevin@gmail.com
Date: Tue, 7 Apr 2026 18:59:16 -0500
X-Gm-Features: AQROBzBqWgwfVWiXxNwH2WVGoah_Xj9yqt69eqXBXxwGKXmfTCBoOME5W2AEs4E
Message-ID: <CAPk_zz9PEPNDcbKzFPgESoa=PNANwyJr5P-y8xA=hUuz=TM33w@mail.gmail.com>
Subject: Roxio Video Capture USB (1b80:e31d) - em28xx Decoder not found
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58201-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cooperkevin@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4121F3B595B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I am submitting a log for the Roxio Video Capture USB (ID 1b80:e31d)
which is currently failing to initialize with the em28xx driver on
Linux Mint.

The device is identified as an Afatech/eMPIA based grabber. When
attempting to bind the ID to the em28xx driver, the initialization
fails with "Decoder not found" and "failed to create media graph."

Board eeprom hash: 0x00000000
Board i2c devicelist hash: 0x7d2e7f80

Relevant dmesg output:
[959397.397238] em28xx 2-1.3:1.0: Here is a list of valid choices for
the card=<n> insmod option:
...
[959398.616159] em28xx 2-1.3:1.0: Config register raw data: 0x00
[959398.834160] usb 2-1.3: Decoder not found
[959398.834179] em28xx 2-1.3:1.0: failed to create media graph
[959398.834193] em28xx 2-1.3:1.0: V4L2 device video2 deregistered

I have tried forcing several card profiles (card=1, card=64, etc.)
without success. Any guidance on getting this specific Roxio variant
supported would be greatly appreciated.

