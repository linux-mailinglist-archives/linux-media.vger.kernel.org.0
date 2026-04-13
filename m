Return-Path: <linux-media+bounces-58685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFU/IpxR3WkFcQkAu9opvQ
	(envelope-from <linux-media+bounces-58685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:27:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 073993F3158
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E2B23026F2F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 20:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1FE39478E;
	Mon, 13 Apr 2026 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrR7S2ik"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D22A391E79
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776111881; cv=none; b=tcO6PNhfOr8T/isDniR5nP9QZbFQJxfeuIybBPXdqiLc7duFvcNJgeijNUPWurYJHW+BBz3YSJhM0fuDl9/kTOPUyt25uSxVE7wufNdRynGda9A5XmI1Phhhhkc3b2v3fMGIIuIgq7rQRK1+ogGxZEaxM7jCM7w9tAk0/DI1CXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776111881; c=relaxed/simple;
	bh=r035kg2j5tap0sXoLHNh8z+DMzv3pfkJNjVz0DQOCNw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RyOr16tWHFjuuRKDyPznbbAm6pgQB240W/qw5i9lrxe+ZmG9mTDft0eQQDGhTSq5ZVMzI2FJxZd6kZqm7ZGk/spsm6RxoWfXeWwa0Mf7vBTzyMgFBkdHSQcF2Kfc+/vdQtqJroFUfDVGID8fYMstiSZCGVcmhLkjBYnM5nHV82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrR7S2ik; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0046078so47961695e9.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776111878; x=1776716678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+Q7hBnkIm57QECCVy2ANNrMAu0aGQ9vQGD+qze2OxU=;
        b=IrR7S2ikOIlFA4P1IcTIsOdMb7lDHUPEN+r7tc0VPjp5SIzRUhJ9blk3xXoTkm0oqr
         3aTjY5wv6ouqALgxjxqjLyH9PJ9f9KJ8SxqKVLtBmMjGBh6HGrsKmtoZfMFxSL3ZHfQG
         8wpSPBznm9rxe+QbFFMZftpaSEZN2swhLHStaTs84CFbr5NLwncDl/JWZ9dPuizsbRVs
         0xvyHjRxkpxHHHeSwmTXe3x/vXxetXXhTtOFgRPcgsgMaeiHywM9cTtT4tKBBKGTVHzT
         IK67kEuPe+B6BHRqJq84SV1HMbRlsKrRAViBpoFccbXkzwnMbkYoAbViBBBHx9ywnCqZ
         7p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776111878; x=1776716678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+Q7hBnkIm57QECCVy2ANNrMAu0aGQ9vQGD+qze2OxU=;
        b=DdMA5JfleTd9Xq2Ioee4CVO1t3iAnIgHpAb/9D3c1ACZEWOs2NpV05P9YMpIU4kXRK
         DiinsvkQdSMy4sAaXumfJKOQ8T7pSHzv44/oYr16c695mZ45c26IgAgVOF7Hlb3NCpw8
         3xTs+vhzeZXHnCGduZgBxR/M0gigWdaxLFoyLLtUSSOfqDVSVW10FH0vWU7TWfiHnOGD
         kHSq0N8mmC2eCNBEdgzekSFDm1qS0S/jWGwdjBpxhfGERASJQ8SuQuM56iHcsZKYt6SI
         qUqi0Qkw73+0LnrbjpRcIABnP/Z8HplcX+6R6BZDqvqyHeMnqHF8p889Yg7IkXCe9KzY
         q5Ww==
X-Forwarded-Encrypted: i=1; AFNElJ+PulZjzkqzfg+nOZkSLO6rLaTWHk+RPqXJiiRXRRhfOU7HzUqFlgnPfOKmeOV30Ja7G1GgnJqFSHvBWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybq4ot2EgKhZRLq+L22yltEc4atoQbvf5bn5tpcB1cvuJGsXJ0
	jsqBmn2qDtgolzmfkeoljF82+IBYi5xE6WODt+2LomPc6yhtSdR4CKB5
X-Gm-Gg: AeBDiev8Z6si1zdZvykmBURyr2y223TEAc+gRlN9kdG6oX21bKQAylpWaI9VZajH69H
	9J1VbUZcdJOF9AyDMycyE5UVowWf5AU67+Udx8Tws11MZ3TIkLIL9Tnsk8Wvyfu2O10eVD3Fizk
	UOfMzshpDQJkISSPeZvN1hAV/fr3+gFs0Bj5HC/Vt6tcI+c1cNdn/4rbDE35DRVcqJ7es14H7d4
	lMa1LuRlNcbvdOzgt8CeiMuZHQLe8Y/NyR3cDKsz78DZcxIailrXZ8K4nF5IWxcm08ixk/AAVeY
	blbr7jfxhC0qHKK3vbcl9XE6tou/0LLf/BpFUlLdfo0bm3+4m11zIWf/F43mrI14TvZyg5fri5n
	+t/VTYE3lgSYsni62kRyiM8lk05ndlH9UEVaIMGeAMjI3YJEyhUhlSkbQ9k9I2dGip3MOpVmYJu
	MLh1xCXx0T5CqltazR4cNy1RVWgzv9zm6/04dghDz8dGaWBA==
X-Received: by 2002:a05:600c:3b24:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488d688d2a1mr202847345e9.26.1776111878178;
        Mon, 13 Apr 2026 13:24:38 -0700 (PDT)
Received: from foxbook (bfi125.neoplus.adsl.tpnet.pl. [83.28.46.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm159780385e9.6.2026.04.13.13.24.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Apr 2026 13:24:37 -0700 (PDT)
Date: Mon, 13 Apr 2026 22:24:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jeffrey Hein <jp@jphein.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
Message-ID: <20260413222432.3f15151c.michal.pecio@gmail.com>
In-Reply-To: <CAD5VvzCEV_XbHc_Gby7mFPBSgSebqKDKJf3VC8HNRrD+xWaTJg@mail.gmail.com>
References: <20260331003806.212565-1-jp@jphein.com>
	<20260331003806.212565-3-jp@jphein.com>
	<CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
	<20260409100247.7cfb62d1.michal.pecio@gmail.com>
	<20260409221749.5e6bccab.michal.pecio@gmail.com>
	<c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com>
	<CAD5VvzCEV_XbHc_Gby7mFPBSgSebqKDKJf3VC8HNRrD+xWaTJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58685-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 073993F3158
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 16:06:43 -0700, Jeffrey Hein wrote:
> Test 2: Michal's xhci patch ONLY (clean isolation)
> ====================================================
> Active: ONLY Michal's xhci patch. No usbcore.quirks cmdline, stock
> uvcvideo (DKMS module disabled), LPM and autosuspend at defaults.
> 
> Result: HC survived.
> 
> Video call ran successfully.

Something weird when video was being disabled:

[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Spurious event dma 0x0000000272e42200, comp_code 13 after 13
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Spurious event dma 0x0000000272e42230, comp_code 13 after 13
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Cancel URB 0000000052d839d8, dev 3.1, ep 0x81, starting at offset 0x272e42f00
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: // Ding dong!
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 36 ep 2
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Removing canceled TD starting at 0x272e42f00 (dma) in stream 0 URB 0000000052d839d8
[...]
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: xhci_giveback_invalidated_tds: Giveback cancelled URB 0000000052d839d8 TD
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Cancel URB 00000000d8d84b58, dev 3.1, ep 0x81, starting at offset 0x260549210
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: // Ding dong!
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Transfer error for slot 36 ep 2 on endpoint
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 36 ep 2
[...]
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: drop ep 0x81, slot id 36, new drop flags = 0x8, new add flags = 0x0

Video started again, seemed to work for a while:

[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: add ep 0x81, slot id 36, new drop flags = 0x0, new add flags = 0x8
[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev 00000000e40f0c43
[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: // Ding dong!
[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[Fri Apr 10 15:44:47 2026] usb 2-3.1: Hub-initiated U1 disabled due to long timeout 16800us
[Fri Apr 10 15:44:47 2026] usb 2-3.1: Hub-initiated U1 disabled due to long timeout 132us
[Fri Apr 10 15:44:47 2026] usb 2-3.1: Hub-initiated U1 disabled due to long timeout 1050us
[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: Set up evaluate context for LPM MEL change.
[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: // Ding dong!
[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: Successful evaluate context command
[Fri Apr 10 15:44:47 2026] usb 2-3.1: Disable U2, ESIT shorter than exit latency
[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: Spurious event dma 0x0000000260549020, comp_code 13 after 13
[Fri Apr 10 15:44:47 2026] xhci_hcd 0000:00:14.0: Spurious event dma 0x0000000260549050, comp_code 13 after 13

Until it broke, not sure what caused this. No EP5IN unlinks here.

[Fri Apr 10 15:45:09 2026] xhci_hcd 0000:00:14.0: Spurious event dma 0x0000000272e42690, comp_code 13 after 13
[Fri Apr 10 15:45:09 2026] xhci_hcd 0000:00:14.0: Spurious event dma 0x0000000272e426d0, comp_code 13 after 13
[Fri Apr 10 15:45:09 2026] xhci_hcd 0000:00:14.0: No Ping response error for slot 36 ep 2, Skip one Isoc TD
[Fri Apr 10 15:45:09 2026] xhci_hcd 0000:00:14.0: No Ping response error for slot 36 ep 2, Skip one Isoc TD
[Fri Apr 10 15:45:09 2026] xhci_hcd 0000:00:14.0: No Ping response error for slot 36 ep 2, Skip one Isoc TD

Then EP5IN also fails and is soft-retried, but it doesn't help.
Control requests get EPROTO or ETIMEDOUT as usual.

[Fri Apr 10 15:45:09 2026] xhci_hcd 0000:00:14.0: Transfer error for slot 36 ep 10 on endpoint
[Fri Apr 10 15:45:09 2026] xhci_hcd 0000:00:14.0: Soft-reset ep 10, slot 36

Looks like the device is dead indeed, or the HC broke down and
can't communiate with it.

