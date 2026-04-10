Return-Path: <linux-media+bounces-58572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F2mJTyD2WmvqQgAu9opvQ
	(envelope-from <linux-media+bounces-58572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 01:09:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 015883DD64F
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 01:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 107E5302BDD6
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 23:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E88534CFAB;
	Fri, 10 Apr 2026 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="CxBF6S+B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6733EB0A
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775862416; cv=pass; b=jPJ/rkqdNXI0QjzShkcZz+FcdeEvMprZOyuNOAaaX8xEI5ByC0TJ+O1rSWCL/X9GJDboqhD92HK/8wK8hcgFvXA4q3Px9SbaP9nhALI7LFpibvt9sJ1miugfbrPvUwLI2jOzDG6IUfH/Yimu1Xpc4Qh1Rwni/DOD8OGCMJba9Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775862416; c=relaxed/simple;
	bh=vN2EtTX1MylqicR1O6dQlJVyp/QYN50CxtPr327Svb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+Eod+fgzkIWsoyfIIT90tZk0saeDBG97GQXld6PDJZ8VAkf9g5RZjUC8GEAVQm6wvVV6XMIt9DXFm/e4M7ELmBUYAWJ69tzK8L42UY6TLfZo+024GwGCGg1xVSa18nqZoAYxoCNdnlClbfUfqa4YCTt2Ko20O8ZBe4syXBrzOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=CxBF6S+B; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7991db3dc98so28596677b3.0
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 16:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775862414; cv=none;
        d=google.com; s=arc-20240605;
        b=RwE0uM9MBaKGHXqZlXZHlYJoR8ctAm6oCF7rRhc3kcj3FRSBkEyJlOjfnvR9ikLGR8
         UHlYSq3RN1DAq2rrtsyz9tN6rcQCUwA1RkpVdrlmDUTd44tlSuO/wQHoxGn17764CNAT
         LxVSjstANV1Pv8Tr2EcIJZFphN6TbfgHFYTk1Y2VE1Cb2r8AGUUzBplw4SqBBjqVXoX6
         VxWL5xxzJhv9JKLuGQZxeujWQo48ObMwUf3NxHDC3kRoo5BLm6dTRJtefkt2yqjF31FO
         Qr4MuVMRXTyWT5PKBrhHqOpgpG6tXLZGLmobYmhq2cNdSVMYSkmiiWzj9GeuY9kqUUoB
         J/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2fh7R+8P/2acO/tSXxa6JUuKvQWyL44+htLmxYHAaTA=;
        fh=ruASF57URCXyM80wgqwq1k+WWLwsW8WeDr63NKBuD/0=;
        b=OVPUaJwmNft/crAwSVLdixqWOA0m/SfxMy3z9LDedyHHRGMOe/vv7m43F7qapROxrQ
         Bir6y26v4UF0KcB/QERaecea0mR0cLDljBKYUEQBUjYv+VbnXvvkzMEQDJW0k5V35sOu
         j4ytC1NL2n2e5MovSoMUYNC4dKfAgWKCexpXev5G8YEVAm7YBZwjdAgo4xFgPxHbDPpZ
         3IJUUtMvXN6kUAFI3EUqbOygK5XVWJDgX9VGEfpXDsVh5Pma+0PtH2C+vDJrUqy2dJmM
         bjFRQ7bkbO4T/EPM4Ypo7tTiuE+109jeEZ0AJo1QPU7AJn0m5gATPSMqDCczGBZfwqNH
         zhkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775862414; x=1776467214; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2fh7R+8P/2acO/tSXxa6JUuKvQWyL44+htLmxYHAaTA=;
        b=CxBF6S+B+NctWnFN+Pg0xBOPws1bh+Y9KrC0HvWw26WaOm7uKiWRhd9jdGf9LvdyRT
         Ar/rCH5YQluU176WKoiGPWNzD1AT28GD+eBmJke5RIeSC01voG2IGD4sylD58Du4Kh+y
         C1qCXWU+7lf9W+aP1zKkrtIywYGBgfNvwn6TL+2iKWR4z8vEbkYDRCvG8MCG89SiXnDH
         incZLpRGskBmApv52qTtBcg2hykRQZFZ5610rBApUYOqtLycxHl1YYyJQcojK/528Zs0
         ecaQz0dt4eZ7tOTCP7p6C6bYq6mxloyLsR6Nf1KCkIg5IFJH4VsqboTlIBmnJJnUjzbL
         B5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775862414; x=1776467214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fh7R+8P/2acO/tSXxa6JUuKvQWyL44+htLmxYHAaTA=;
        b=RdTXq1r/B7/svTyJ9XccJi3kitLXfyKDtPtzzjir9KvLqUrRGefA/Lcc4cquOA0dsz
         m6pRn7iUTB9ag/44q/QXwj/ZPwsU4g041RteB1YN1x64cI9ugwdgF2STIiY8iTuSXMhU
         3m0UiJ3qpGbXBl5eJ5KkEJLfsObAVsSZkbPSKSCrSsRalIMMoQdiIk3eH4CepD6EGjR/
         FATibJYiqf+f5/IOKQFji3hkKVRudiZ7vAfBlJHy2CeCqglQTvjoQV0M7Q30DYAXUFWe
         gxHUk94CGv5QRv2b2WMgt0IloJQ9BA34Giyg1pusBMWVLu+rPvgpQwNzk2QL/8Jn2+GZ
         6W8w==
X-Forwarded-Encrypted: i=1; AJvYcCVTj9qu9z7Vwnczg88RQbRb7E+zqBMfo8IESbq2/rVY2wMN/w3z2osY9iv3CMQKCdchv0k6aG69Ju1Grg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/uPrnNXqAuP7i9MTibz9S46Lv+e+X2Z3awwtNV/3+ijQipBD
	pR23o6uDgQa/tv5i7o7uac1lUccXsyx65trrn3V20XGxcOpkALj4LAod9/d2mLhyiR5WXFC8Yo7
	6SGBENwI7cHH2o09qg+w5qiCts5kvMBrVR+I8q0PV
X-Gm-Gg: AeBDieucgtv1ywb5g0DxifSktGJNZjszO3v+MgNYj/kU5PSG9KPSHeOzf6LmFmcr7ee
	QVxEssnyQ6u7I5Xg8kh+rZs9dK7U0DDK8chy+bHBVC/i0CqcCxaJfUTJXGQ8H7Ol6lGjt+w/qE5
	4BwRez8Yaa7k7HTsSj0PewYJQwIg552366fRvxObc4fOExVJjR4Qldp1/Vuud4DTCfMFauN8sXG
	WFn8cgwq8pWCv7sqrib2OzywpkWgX9kXBG1I3DyelPXSJsHbSgdl0WfbwbZgIVmKP1JIUSr1pBj
	f7ioGQB2/Zc7ECOJF0PJ70mjcqDRsie1fZbewNhMVFjUjtru+J5dBFJirTUlo4UfrA==
X-Received: by 2002:a05:690c:dd4:b0:79a:b9cc:2100 with SMTP id
 00721157ae682-7af7157044cmr50486617b3.35.1775862414318; Fri, 10 Apr 2026
 16:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
 <20260409100247.7cfb62d1.michal.pecio@gmail.com> <20260409221749.5e6bccab.michal.pecio@gmail.com>
 <c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com>
In-Reply-To: <c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Fri, 10 Apr 2026 16:06:43 -0700
X-Gm-Features: AQROBzDzBZVABH3ehzq4hyArtfnxqlwCBGOOvEjT5kqYCvtlbA96XOybKX-WyUw
Message-ID: <CAD5VvzCEV_XbHc_Gby7mFPBSgSebqKDKJf3VC8HNRrD+xWaTJg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58572-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,jphein.com:dkim]
X-Rspamd-Queue-Id: 015883DD64F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 11 Apr 2026 00:48:05 +0300, Mathias Nyman wrote:
> One theory could be that xHC control endpoint refuses to restart when its
> dequeue pointer is moved to a no-op TD like in this case (second cancelled
> URB).
>
> This can happen when we cancel two control URBs at the same time.

I tested Michal's xhci patch (max_esit_payload clamp + short packet
err_count reset) on a custom 6.17.0 kernel. Two separate tests below.

Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
Device: Razer Kiyo Pro (1532:0e05), bcdDevice 8.21
Kernel: 6.17.0-xhci-test (vanilla 6.17 + Michal's patch)

max_esit_payload 8 -> 64 confirmed firing at boot for EP5IN.

Test 1: Michal's xhci patch + JP's UVC patches + NO_LPM
=========================================================
Active: usbcore.quirks=1532:0e05:k (NO_LPM), DKMS uvcvideo with
UVC_QUIRK_CTRL_THROTTLE, Michal's xhci patch.

Result: HC died. The crash sequence from the full log:

1) 437 repeated Cancel/resubmit cycles on EP5 IN (ep 0x85, slot 5
   ep 10) over ~7 minutes starting mid-call:

  [15:18:58] Cancel URB 0000000028356cb5, dev 3.1, ep 0x85, starting
at offset 0x114a49080
  [15:18:58] Stopped on Transfer TRB for slot 5 ep 10
  ... (437 cancel/resubmit cycles through 15:26:04)

   This is the same "repeated unlinks on EP5IN" pattern you noted in
   the March 30 stall-6.17-stress-during-call log, Michal.

2) After the last ep 0x85 cancellation + endpoint reconfigure (add
   ep 0x81), ~994,000 spurious SHORT_PACKET events (comp_code 13)
   flooded the HC for ~5 minutes:

  [15:26:04] add ep 0x81, slot id 5
  [15:26:04] Successful Endpoint Configure command
  [15:26:04] Spurious event dma ..., comp_code 13 after 13
  ... (~993,703 spurious events through 15:30:48)

3) Control transfers started timing out, with miss service interval
   errors on isochronous eps 2 and 4:

  [15:30:48] Cancel URB ..., dev 3.1, ep 0x0
  [15:30:53] Cancel URB ..., dev 3.1, ep 0x0  (5s stop-ep timeout)
  [15:30:53] ThreadPoolSingl timed out on ep0in len=0/2
  [15:30:53] Failed to query (GET_CUR) UVC control 6 on unit 1: -110
  [15:30:59] Cancel URB ..., dev 3.1, ep 0x0
  [15:31:04] Command timeout, USBSTS: 0x00000000
  [15:31:04] xHCI host controller not responding, assume dead

Full log (2.9MB gz, 1.06M lines):
https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/crash-6.17.0-xhci-test-20260410-152541.log.gz

Test 2: Michal's xhci patch ONLY (clean isolation)
====================================================
Active: ONLY Michal's xhci patch. No usbcore.quirks cmdline, stock
uvcvideo (DKMS module disabled), LPM and autosuspend at defaults.

Result: HC survived.

Video call ran successfully. Then ran stress test (rapid v4l2-ctl
control transfers -- focus, white balance, exposure, zoom, brightness
cycling). Firmware locked at round ~23:

  [336.489500] usb 2-3.1: pipewire timed out on ep0out len=0/0
  [336.489503] usb 2-3.1: disable of device-initiated U1 failed.
  [336.489510] usb 2-3.1: v4l2-ctl timed out on ep0out len=0/8
  [336.504055] Transfer error for slot 36 ep 10 on endpoint
  ... (repeating timeout/error cycle every ~5s)

Device firmware was completely unresponsive, but the host controller
survived. No hc_died(). The transfer errors were on ep 10 (EP5 IN,
the endpoint Michal's patch targeted).

Full log (1.2MB gz):
https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/crash-6.17.0-xhci-test-20260410-154243.log.gz

Full dmesg:
https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/michal-only-stress-20260410.log

Summary
========
In both tests, EP5 IN (interrupt, wBytesPerInterval=8) was at the
center of the problem. In Test 1, the repeated unlinks on EP5 IN
led to a spurious event flood that eventually killed the HC. In
Test 2, EP5 IN had transfer errors but the HC handled them without
dying.

The key variable between the tests was the UVC throttle and NO_LPM,
not Michal's xhci patch (which was active in both). I don't yet
understand why the additional UVC-layer mitigations would make the
HC outcome worse, not better. Different test conditions (stream
teardown in Test 1 vs active streaming in Test 2) may explain it.

Michal, re: lsusb -- I built usbutils 019 from source and confirmed
it decodes wBytesPerInterval natively:

      Endpoint Descriptor:
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               8
        bMaxBurst               0
        wBytesPerInterval       8

Full lsusb -v (usbutils 019, 927 lines):
https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/lsusb-v-kiyo-pro-usbutils019.txt

v7 patch 2/2 included lsusb -vv (934 lines). If lsusb -v is preferred
I can swap it in a v8.

I have other Intel machines available for testing if you'd like to
confirm this isn't Cannon Lake-specific. No AMD hardware currently.

JP

