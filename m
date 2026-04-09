Return-Path: <linux-media+bounces-58457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKgAMn8J2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 897183CF559
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF1D7301F14B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEC433D51F;
	Thu,  9 Apr 2026 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTmtqIKl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A1279DA6
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765878; cv=none; b=oLlbH6VdhIUKqNz07lXvXt+2vndTAnnGY4YdsBvl77xAIvHksyTmbHT6LwSZHXTIHHB5MqTta19vCi+xdLB2ptNdLIpVutgKVWk4xWq2qoV4DnQahy0ezt2LWUMlIch8dLI98kyF156lC6qwD9sA+xA2ajxujCtaOW47Q4T+rIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765878; c=relaxed/simple;
	bh=7mlB3bvkcx9cC95PdWWMYQ+NCpvN+8cOZLms0aqbKFc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIMsHuFPt5ThqyZOJpjVI+nJSuDXVTo6HPdJvg7OkMEDNS8uspUL+KVqv/qZ9OsQaNMhsMUDDpGp5jQ1fW1aJ6t6quDx6C6EkaMeS7S5qTRgLhPRQO+gdWWH606knj0EXgtFytXFmYoPAB/w4EBToj4VKfAcNDd/2Nkj//BGA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTmtqIKl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488c2690057so13356005e9.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 13:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765875; x=1776370675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OW/a1GY3YVi3CjBCoOtuuYxwMISjSqKAg9v5EDBhcuo=;
        b=UTmtqIKlQJrTpExFH3Inn6WuU20sHtlid0eemfTL5f54cBAMes8iAcXkNA8xbHPUgX
         Eznqcy0yLUYWWiNiMBYclnVG0BvWz0/16HysskWrMi5JfCF4jVELPYBPMMQX85ilNU1Z
         G7/8CfBaBYu/DIOs5YBfClralUmrbL0SsafYXZcY1trNmyks0kEIhgLsjkwL203EbrWY
         OILI6NpmkX8wwuZ+11pKW4D7i6OWJkNx+lvq7VtB2VDZybCGEBLcY73oUR7azEwuOqRk
         MvNYYkZDPbT86ege6Q2DYHKo5tm66cVvIfkkR7vpxMXnXINHErCe8pOyqX74QF6w01px
         Wo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765875; x=1776370675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OW/a1GY3YVi3CjBCoOtuuYxwMISjSqKAg9v5EDBhcuo=;
        b=A46JpnFjmO8f5rMORqoVJCdClIURXnJqMvwHmtvIsXHrpE1O2kn+NGuo9dD7NBcF87
         FeCunhljBhAhbw/MYJBFh+YzPz9yjHvPzjjQrlzqxIRy4FLJjQtmMTbntqkZOV9V5fpw
         SnvTnE9mfhjP0g7OrCf7kttLPsAkGU9g52Ips46G/CJHnw+Dno0rgXvy3LegLQUtQvzT
         GkrjMQsKt+xn7aWItUNztO2IOJc4TkuyjWfXma6UYFHOcykpSCRSvqwsArkxbCC/yPgO
         hW3NNdRN66/JB0/VgYx0Tffp4MQvqPOPmexczzijUJvC1lUEPDrav7xtSOkaBj3Kb/wV
         x4/w==
X-Forwarded-Encrypted: i=1; AJvYcCUVmzov/jlTc1zs4X3ygEywaT+DXZShfyk877Yf7XPyTrttCx4Kmpcx8AqjSVsV9ewAAlOt4OkDVjYFng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTvj7iBso3CP0zH9kTVI/PuICYrfNaU7rFkWojXvomCxAQQZ5
	tlkUchYQJnQ2R5jFgPr4GQYBHmr5ZbcYjSu5bDDeab0aptn9xdUdIgu3
X-Gm-Gg: AeBDievAlcUBmzld5D3D9fZYE0wblNv/+AJCnbdSVa1gOMjRAiOuYmy9TK5mP7uly5y
	xjyUaQWcdG1CNU5Qc8rykfV0GY9TPIscLRvfse1rjIDAOgSasZ62kJVGQsf/F7m9jGfzVY5RUpI
	6GE4KdDyYewpWOGNozheZYwgKeLkx+vilLFxifC61JTTDfCgtuBOfQJ6JftS9LTDW0wnKl2oQxD
	HX3CnMFdO1PUKWhglH1QJlipogoxBifM7jCrz5osyhfJ8/f7YEy0uuHc4JIVRE0sI+bZKgH7KkO
	FWuw+n2i4U0AW1EzbachU43hdIzprAuMAbW6RY3Q7UFH6+NkaCELfqDcepl3UzstwGdrLWHQ30U
	thSV96BroBasRMbQ3yg/3R/V0ygzmKgsejrbwuTTgEfHE1iZ9HPMEkgrhWr4AJfs3fE1F6wCPzy
	VP/lyAeK4HnlsgJpqS3OdD0YVap9zhvGZ8FXA=
X-Received: by 2002:a05:600c:c173:b0:485:39d1:b4dd with SMTP id 5b1f17b1804b1-488d684b024mr3053825e9.10.1775765874975;
        Thu, 09 Apr 2026 13:17:54 -0700 (PDT)
Received: from foxbook (bfi125.neoplus.adsl.tpnet.pl. [83.28.46.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a74sm1485171f8f.3.2026.04.09.13.17.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Apr 2026 13:17:54 -0700 (PDT)
Date: Thu, 9 Apr 2026 22:17:49 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: JP Hein <jp@jphein.com>, Alan Stern <stern@rowland.harvard.edu>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
Message-ID: <20260409221749.5e6bccab.michal.pecio@gmail.com>
In-Reply-To: <20260409100247.7cfb62d1.michal.pecio@gmail.com>
References: <20260331003806.212565-1-jp@jphein.com>
	<20260331003806.212565-3-jp@jphein.com>
	<CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
	<20260409100247.7cfb62d1.michal.pecio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58457-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 897183CF559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 10:02:47 +0200, Michal Pecio wrote:
> On Thu, 9 Apr 2026 08:45:17 +0200, Ricardo Ribalda wrote:
> > A usb device shall not be able crash the whole USB host. I believe
> > that you already captured some logs and the USB guys are looking
> > into it. I'd really like to hear what they have to say after
> > reviewing them.
> 
> Sorry, I forgot about this bug. I will take a closer look at logs
> later today.

lsusb -v of identical(?) device is found here:
http://linux-hardware.org/?probe=a1cd74d9ac&log=lsusb

And I'm looking at the logs here:
https://github.com/jphein/kiyo-xhci-fix/tree/main/kernel-patches/crash-evidence

crash-6.17-stock-stress-20260330.log
Empty file, not sure why included at all.

crash-6.17-video-call-20260330.log
No debug messages. At some point:
Mar 30 10:00:52 katana kernel: usb 2-3.4: disable of device-initiated U1 failed.
Mar 30 10:00:53 katana kernel: usb 2-3.4: Failed to set U2 timeout to 0x0,error code -110
Mar 30 10:00:53 katana kernel: uvcvideo 2-3.4:1.1: usb_set_interface Failed to disable LPM
Mar 30 10:00:54 katana kernel: usb 2-3.4: Failed to query (SET_CUR) UVC control 11 on unit 3: -71 (exp. 1).
Mar 30 10:00:54 katana kernel: usb 2-3.4: Failed to query (SET_CUR) UVC control 11 on unit 3: -71 (exp. 1).
Mar 30 10:00:54 katana kernel: usb 2-3.4: Failed to query (SET_CUR) UVC control 11 on unit 3: -71 (exp. 1).

Not sure if the LPM thing is the cause or a symptom of general EP 0
disfunction, as seen in subsequent EPROTO errors.

Not sure why usb_set_interface() is called. Is this the start streaming
case mentioned in some email? What was happening before?

stall-6.17-stock-no-workarounds-20260330.log
All sorts of repeating errors, including stall on EP1IN ("ep 2") which
is supposedly isochronous and shouldn't. Clearly some broken state, not
sure how things got there.

stall-6.17-stress-during-call-20260330.log
This is the most interesting one.

The first slightly unusual thing is repeated unlinks on EP5IN (int),
not sure why uvcvideo would do that, possibly result of the stess test.
I know that such pattern alone can break ASMedia host controllers for
no reason I understand, though this one is Intel.

It's suspicious that wBytesPerInterval of the endpoint is 8, wMaxPacket
is 64 and URBs are 16 bytes. Just in case, I attach a test patch which
rises wBytesPerInterval to match wMaxPacketSize.

The first definite anomaly is Transaction Error on EP5IN:
Mar 30 16:59:16 katana kernel: xhci_hcd 0000:00:14.0: Transfer error for slot 18 ep 10 on endpoint
Mar 30 16:59:16 katana kernel: xhci_hcd 0000:00:14.0: Hard-reset ep 10, slot 18

Not sure why endpoint reset follows immediately without retries.
The test patch also removes one potential reason. We might see whether
the retries will fail, or if retrying until the transfer succeeds
magically prevents the subsequent disaster. Perhaps the device gets
unusually upset about sequence mismatch on this endpoint, which results
from not clearing this halt condition properly (known problem).

Five seconds later two control URBs are unlinked:
Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Cancel URB 00000000122aa5e2, dev 3.1, ep 0x0, starting at offset 0x11e227b40
Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: // Ding dong!
Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Cancel URB 000000008a55bcd3, dev 3.1, ep 0x0, starting at offset 0x11e227b20
Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Not queuing Stop Endpoint on slot 18 ep 0 in state 0x44

Probably timeout, i.e. things got stuck. Oddly, state 0x44 indicates
that this control endpoint has previously halted - error or stall.

Higher layers notice that things are timing out:

Mar 30 16:59:21 katana kernel: usb 2-3.1: pipewire timed out on ep0out len=0/0
Mar 30 16:59:21 katana kernel: usb 2-3.1: disable of device-initiated U1 failed.
Mar 30 16:59:21 katana kernel: usb 2-3.1: ThreadPoolSingl timed out on ep0out len=0/1

Nothing works from now. At some point the parent hub reports
disconnection and reconnection. Still nothing works.

---

Would it be possible to repeat this test with the patch below?
It overrides the suspicious wBytesPerInterval and hopefully enables
retries of this failed interrupt URB. We will see what happens.

xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 1d50c91afd7f..17d78b4e07bf 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1464,6 +1464,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	mult = xhci_get_endpoint_mult(xhci, udev, ep);
 	max_packet = xhci_usb_endpoint_maxp(udev, ep);
 	max_burst = xhci_get_endpoint_max_burst(udev, ep);
+	if (interval && max_esit_payload < max_packet) {
+		xhci_err(xhci, "max_esit_payload %d -> %d\n", max_esit_payload, max_packet);
+		max_esit_payload = max_packet;
+	}
 	avg_trb_len = max_esit_payload;
 
 	/* FIXME dig Mult and streams info out of ep companion desc */
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 98ef014c8dee..e5823650850a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2544,6 +2544,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->status = 0;
 		break;
 	case COMP_SHORT_PACKET:
+		ep->err_count = 0;
 		td->status = 0;
 		break;
 	case COMP_STOPPED_SHORT_PACKET:





