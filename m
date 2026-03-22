Return-Path: <linux-media+bounces-56623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MgNDBtlv2lJ4QMAu9opvQ
	(envelope-from <linux-media+bounces-56623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 04:42:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5D2E8248
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 04:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39CC0301BF55
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 03:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1A037FF68;
	Sun, 22 Mar 2026 03:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="fOuBtUDS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C737CD2D
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774150900; cv=none; b=F0Mj1Ezdph3QXI7MAKtdGOLCtty5KpWqYDx8SZfM86O32khnPsz8K0C79yOol4P6YGJdpnnP8FFakjfJySHEZaaUKHZuOpSlF9gD7HtFJDaN3YrrOJn4SzC1GRi/4sCHCYjrdPvwPlOPvP6aAt4i2g0wINEgFuRIoUpswlLnCko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774150900; c=relaxed/simple;
	bh=wehqK6rLH1PC9vgBn24Kw3MFbqIl5qgphsugM3D76v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/d9v3iVqwQsksRijOB3oELK1Q56U/+D+JGmhpZ79T2DFbabkFhqkBgnVP7nCzXrx4L8kRNSs2EA+Z7OmbVnioVeZGDMhS4jIiyhh9bivPqTtvgs2dE+a+umQ76lSCHJ1X1iluFUnAdUm5/Jdg68rUugq0GqMjptszSP9sXtkOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=fOuBtUDS; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso3207692eec.0
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 20:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774150899; x=1774755699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+6TeIDvGKnGgJzVgLjcCJqKLNQPeYlw80XeDdHbaRI=;
        b=fOuBtUDSQzd+uzCsb/jaKXIwzevsLbeRne0MqOGM8reIwl7p2wxKDOATlxiuUBwKgw
         W3dEy8PjsmcwgiQbZnWu5ommgvDl6I1GF5WTxEEcGDA7kvegEXGqL3bf70WVNb7VlAXP
         9+s+4sRgcVFVJHhPOsNCQPROLH+2BFH3eGZhdkva/asI60I4y+7nNfJvIu7J0b5ntNUq
         8fn+gUL9J9atYoSWOcenQihk9jGKc4j8MGXl7ArtIvO6CPCUI0nPrhKXTtuldQw4HlgP
         lYgnFW83dyqNwNqMoicT8nxFQA4OiC5kR5LgssvnNc0nWuGHzfL2NTouOFBuP0GydlcJ
         ZZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774150899; x=1774755699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+6TeIDvGKnGgJzVgLjcCJqKLNQPeYlw80XeDdHbaRI=;
        b=nos78ZnG2E2yIeeS1Kp3QKiqomNfb557s2x+aboV8IGKbxNGOHw3QtMLkzrAZu24Hm
         fnlD4zOW6Sq90LFxZ4N4PsjkGHvPkVF3J3Ib5215Oz7dBfc3wce5lZIwdWgsF0jyuRJc
         WaqJskoFdmDCPa62U0+OnBBjZvJo6v811XEhZfht+hcjc83izMXcXYCf2EN9tipdr4oA
         WvY2zJUYNlMBCcimJH+Utuzf38io0wKy4iLongcFl6KCK5w8m+k0TsA1cW22KREKkUsq
         RAVnUpBi1uZakkh9j2tmqVAXkg6OUumINhjI978SFgs1Y0tHN9GC0mZLYALptJPaiH+z
         1QLw==
X-Gm-Message-State: AOJu0Yy0q8NX07Hl6R3MMUwEX0j1FxiamfpwTJS72icafHitr46u5GXh
	aoMeInWam++0SUShR1gOM6i/X9hGUB3rOJKsipGaX+pixvZekCkbkAAU67FgNYsrhw==
X-Gm-Gg: ATEYQzwZ+4UlnGMyDTsaESdWLW0kbeYWT6dizNlvwdRt4CLqUustL2+gaakWfCQjEW/
	lM3lvPYTzSHjgRCiRJBIzncxaX+vTkbOf1iKOVCirok+bjWyF45/n8r+mOdXynGONmEYk+TLcAv
	W6O3AKZP+KE2WeajWzdT8M69ulArMljg9+Z2wfraykCpW7n7wj6NqQUNoGSIkRBstDc9ILsGNhY
	AmMuxIOFhAOA3nnlC6+zV9vQELRca47OWi+D9ER6UmqDMJu0PY/AxkN9igICtJlctbd+FAXaD2M
	yVz0LXmwXewDlm94HaDBx/5iOg1fCCoJf/jMub2RldrXcQh1486aR2VMcPYMv4b0d1OfmkOBlvu
	4Co3F5CkgLXXzp7tyatSMXD64Ejyw/B2qoHfS8IxfqaOwQD7h7bqhSvYFa2evIGVRUO/JKCs+fR
	y3iU7HJnSH
X-Received: by 2002:a05:7300:7c12:b0:2b8:6a22:6d52 with SMTP id 5a478bee46e88-2c1098157a7mr3843248eec.33.1774150898451;
        Sat, 21 Mar 2026 20:41:38 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm8989451eec.12.2026.03.21.20.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:41:38 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 1/3] USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
Date: Sat, 21 Mar 2026 20:40:11 -0700
Message-ID: <20260322034015.3629056-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322034015.3629056-1-jp@jphein.com>
References: <20260322034015.3629056-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56623-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABC5D2E8248
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 UVC webcam whose firmware
does not handle USB Link Power Management transitions reliably. When LPM
is active, the device can enter a state where it fails to respond to
control transfers, producing EPIPE (-32) errors on UVC probe control
SET_CUR requests. In the worst case, the stalled endpoint triggers an
xHCI stop-endpoint command that times out, causing the host controller
to be declared dead and every USB device on the bus to be disconnected.

This has been reported as Ubuntu Launchpad Bug #2061177. The failure
mode is:

  1. UVC probe control SET_CUR returns -32 (EPIPE)
  2. xHCI host not responding to stop endpoint command
  3. xHCI host controller not responding, assume dead
  4. All USB devices on the affected xHCI controller disconnect

Disabling LPM prevents the firmware from entering the problematic low-
power states that precede the stall. This is the same approach used for
other webcams with similar firmware issues (e.g., Logitech HD Webcam C270).

Cc: stable@vger.kernel.org
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/usb/core/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -493,6 +493,8 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Razer - Razer Blade Keyboard */
 	{ USB_DEVICE(0x1532, 0x0116), .driver_info =
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
+	/* Razer - Razer Kiyo Pro Webcam */
+	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
 
 	/* Lenovo ThinkPad OneLink+ Dock twin hub controllers (VIA Labs VL812) */
 	{ USB_DEVICE(0x17ef, 0x1018), .driver_info = USB_QUIRK_RESET_RESUME },
--
2.43.0

