Return-Path: <linux-media+bounces-61039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLtfKpk0AWrPRwEAu9opvQ
	(envelope-from <linux-media+bounces-61039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 03:44:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC1C507082
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 03:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11C4B3009019
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 01:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4ED221721;
	Mon, 11 May 2026 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLj16F9o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293B20C00C
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778463891; cv=pass; b=MCi5rA4fVBJxlqY5/jPLrrHd4RvnLufnJZbdKf8oe6OPoxTfi+vTz4E3QU5O1bvzi3oCqCEMxnV/4jt18CicVu7eaXgv28N337MJlVZxwpV0foVzML620v5PvvfaYbVc59cR9rYVAhmaqVIBoaMF0xe6jsQayorQktjY7NAEdLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778463891; c=relaxed/simple;
	bh=dcERz7RH/AJ7D68IG6bQCbf+o3Z7rl3hTCassk6h6ME=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=G4TRWbgtR6svpeVM3g4j1fxQbAIqWgiurs8TdOSwVDJ8PHEtcpTWbKXojIrOr/r4TdurQG5VBqwf18xkiziKge7d/KkHC7mgp3ZOQ9AQGNUKrGap0+4f/us+ZJixNml1ehMcwIabESDKM03fYtIWYfwiS9WdofDYTXMyAsq1ha8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLj16F9o; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95d439bd3a5so924675241.3
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 18:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778463889; cv=none;
        d=google.com; s=arc-20240605;
        b=I2HIIJ0ey1ODIPyi1bQ3IL0yB5M3+wXwUxs9+pBHSAMCJpGoSCtDI8VTOxx3P5jT7x
         SpF/ftqaP8+8RGKKYeYL0vehbbTNj6o/yTTy8a/qemqnl8FaHXMHyHA1JS9O729OVKG4
         g4Qxq2WSyWxnekF6FR6HWztIn7x0N2R3ZJsJ2mfBvC6tpc26BxMrcNSMqapDPH9yONLr
         HvjUGKY10n1RUYRtTSJjmuCQ/CUiI+N7IP1MwDo0yUupY372NzSK7naLyELG9z+w4FQx
         vsziYisa9NW2FdL5WVptXk4FfYRPi1E1a6+htDlZ0N4Jm7fXvA36Q5AKG+CM7lphtebQ
         fctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        fh=HodTeJVibNK54LaKBeWJTrv3HkW6FOjs+3rZSY/P30o=;
        b=kSt6PN0yYNX9JzCQ3f3zlnMSFT/C0DAfL7whhb/GVTaPNo798MiJOiY7FmOtJrfxxr
         2MMJ3M53mSXxVcAyAgSLpUpnDr+a9muF5RRp3HmYGgL5EGzh5UN/n9I6cWk6pkFCI5EQ
         laREpTC39FZVUS9O698FQKSt7hOn26LaNhz9N1ylrS8WxVNos4CZaby3xDeAQnHZHQIz
         RR0Y6KRpxLjHlIlAiQ6zjuQhucrESDJH93TREOWgJWyjwdfLFDXriVfOsaB7OOJFyVTp
         wuEYCXMTAVhEct/7j3zoySb1Cjp+PgbnaGowzO1TbGXdLRxMTxpY4qTKn3x0pP1nXU7A
         SmSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778463889; x=1779068689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        b=cLj16F9o1T1fsCGJGV5JUI2img3fpH0bj4MV78oCOvMHfo1GYAOWq3pWFZ8sNn8ZLa
         yf4/H57QNgx2SklXF4KXYD1S/XK+NphPQRqyijh76Jb4lyJmsP51AABZ3OK0OkodpF6V
         OLtj0bXZDwqyr4NvlPLO+fertOMWP+PrTXXYT9el6ES/4zDYPTxGZhrYK7ZikALiK47b
         50n2iCl/+278I0REcXrO5B4hZU7Qp7vGnvLocdTp2uQC2WTQqlyT78qDyyYhPUTUmbVr
         zMv5ayuNMNF0eNIWopD9ye3FEXT4X9VdvOTrdJbFfgwKnGbzrc1O7penlzK+Ff4wBICA
         kqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778463889; x=1779068689;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        b=M1n4BADKMbhb0/OaQSj2HaYWjdEmgvjgBeGtPvELeZAGb7tMG5jeCYWEU6qfq1Oa0O
         Flr1JH8HdLMuimyFMBbbTQ3c6LsNFwAvB0MNGU6OHDHK4helSK7Z/FDsj/STrDv+G3Ge
         UrFRbUS3WrR2U+PGhjLSIcd1tkT/vsA0NJ+awes+FtW4T7m10P+lJqjd92SL0uZGuOFE
         fiCVchnPWyi1X8boJVZbsUJ8BKf9u9rRQl9jZTXXosu2iLJ8sZiSSzmuuncaENlNQCe7
         ixteCEPZ0RjhENdfGYuxScVH6rUl1EUtMSD2G6esKcJr7HmExS3zvbB77CwofFiTcem/
         YgHA==
X-Gm-Message-State: AOJu0YyFqbubZRq9ZJ58KjVi8rZfJOPfGOQLBOgCUAmA5E8V+ZV3E3ti
	RKCmndjc+kFBYak7ZKIUY4DXgoyWVHe0DwJgBPIxvD3UpdoERk6V0NmxMcm8lDWOfpnD5Xw6q1V
	tFW307Ci4L3MLpKlzd8cY4ViEcC2akbLN+mENow==
X-Gm-Gg: Acq92OG1X+BnhShka5hq7Xgf0sjK5sLDqRkivxXfUgazoTxRjXgiWzA7Xet2YlQLRFz
	zOLz7w265Jk1zuNlyioYtXxVtFl8nDXBqZffeKsOFQSVUc5PpqfgFncDwhQ7cctZy9veC4a4mSX
	l3De8+jPldh5NXjUro3s0TQ85gF3LCpNoWKQt2S3dy/kH/ySohZBEX/bJ/jXBob+kddaUBS0DZ4
	w8xElAjnrRfq6oB//p70U30YJEG4HcAwHpceMyHY/MyhpCuJUycsJrBFPMWdYoGfl1Ojan8SPS9
	8ol1vQ==
X-Received: by 2002:a05:6102:54ab:b0:62f:3cb7:8652 with SMTP id
 ada2fe7eead31-6313e9f142dmr4833089137.13.1778463888492; Sun, 10 May 2026
 18:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yixiang Xu <m992364136@gmail.com>
Date: Mon, 11 May 2026 09:44:37 +0800
X-Gm-Features: AVHnY4JPopboAW_Ec2owylTnIzbk88ztgfT9KyTE8i92NLZ8aDYkHduXSz8eaOc
Message-ID: <CABEbnPHhbdq2mrnWUbs=FWMeO01qh_AQTzRwMbhvia128rQfVw@mail.gmail.com>
Subject: [RFC] media: sun6i-csi: V3S parallel HREF/VREF polarity mismatch with GC0308
To: linux-media@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2AC1C507082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61039-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m992364136@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,

I am debugging a parallel DVP GC0308 camera on an Allwinner V3S board
with Linux 6.8.12 and the mainline sun6i-csi driver.

The sensor probes correctly and the media graph is created, but the
captured frames are invalid unless the HREF/VREF polarity bits in
SUN6I_CSI_IF_CFG_REG are forced to 1.

Hardware / software setup:

SoC: Allwinner V3S
Kernel: Linux 6.8.12
Driver: drivers/media/platform/sunxi/sun6i-csi/
Sensor: GalaxyCore GC0308, parallel DVP, UYVY8_2X8
MCLK: 24 MHz
Bus: 8-bit parallel

Relevant device-tree endpoint properties:

bus-width = <8>;
data-shift = <0>;
hsync-active = <1>;
vsync-active = <1>;
data-active = <1>;
pclk-sample = <1>;

The GC0308 sensor side works:

I2C address 0x21 is occupied by the kernel driver

the sensor node appears as "gc0308 0-0021"

media-ctl shows:

gc0308 0-0021 -> sun6i-csi-bridge -> sun6i-csi-capture

the sensor source pad is set to:

UYVY8_2X8/640x480

With the unmodified sun6i-csi polarity mapping, the driver computes:

IF_CFG=0x00010000

That means:

bit16 PCLK = 1
bit17 HREF = 0
bit18 VREF = 0

The resulting captured buffers have the expected size, but the contents
are not valid image data. Typical UYVY/422P dumps look like repeated
single-byte patterns plus zero-filled tails, for example:

e8 e8 e8 e8 ...
d1 d1 d1 d1 ...
84 84 84 84 ...

As an A/B test, I forced the parallel CSI IF_CFG polarity bits to match
the old Allwinner BSP behaviour:

value |= SUN6I_CSI_IF_CFG_CLK_POL_RISING |
             SUN6I_CSI_IF_CFG_HREF_POL_NEGATIVE |
             SUN6I_CSI_IF_CFG_VREF_POL_NEGATIVE;

This changes the log to:

IF_CFG=0x00070000

After this change, the captured UYVY data starts looking like real
U/Y/V/Y data, for example:

80 16 80 16 80 15 7f 15 ...

and the frame displays correctly on the LCD.

I also compared against an old working Allwinner BSP for the same board
and sensor. The old GC0308 BSP driver uses:

VREF_POL = V4L2_MBUS_VSYNC_ACTIVE_HIGH
HREF_POL = V4L2_MBUS_HSYNC_ACTIVE_HIGH
CLK_POL = V4L2_MBUS_PCLK_SAMPLE_RISING

The old BSP path is known to display the GC0308 image correctly.
It effectively programs the CSI timing/polarity bits as 1 for
PCLK/HREF/VREF on this board.

This looks related to the existing comment in sun6i_csi_reg.h:

/* Note that Allwinner manuals and code invert positive/negative definitions. */

and also to the previous discussion:

[PATCH] media: sun6i-csi: Fix incorrect HSYNC/VSYNC/PCLK polarity configuration
https://www.spinics.net/lists/arm-kernel/msg771128.html

Parallel Camera Interface Timings, Signal Definitions and Polarity?
https://www.spinics.net/lists/arm-kernel/msg771862.html

Question:

What would be the preferred way to fix or represent this?

Change the sun6i-csi parallel HREF/VREF mapping so that
active-high hsync/vsync sets IF_CFG bit17/18 to 1?

Add a V3S-specific quirk for the parallel HREF/VREF mapping?

Use a device-tree workaround by writing:

hsync-active = <0>;
vsync-active = <0>;
pclk-sample = <1>;

so that the current driver computes IF_CFG=0x00070000,
even though this contradicts the GC0308 BSP/sensor active-high
description?

Is there a better way to distinguish HREF/VREF semantics from
HSYNC/VSYNC polarity in the binding or driver?

I am not proposing the hardcoded A/B-test patch as an upstream fix.
It was only used to isolate the issue. I can provide dmesg logs,
media-ctl output, raw frame dumps, and test additional variants if that
helps.

Thanks,
Andrew

