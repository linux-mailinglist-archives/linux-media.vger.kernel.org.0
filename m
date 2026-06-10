Return-Path: <linux-media+bounces-64389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iKcZKwgnKWpxRgMAu9opvQ
	(envelope-from <linux-media+bounces-64389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:57:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D7667832
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:57:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gIy88eYr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64389-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64389-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 140CD31A4E5E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8BE3AD530;
	Wed, 10 Jun 2026 08:47:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F111371CEE
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:47:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081260; cv=none; b=eBO8HtsPP2JQKpbNVTE8uMVSFrrB20hKOpIAhA0/JaYfQq48Vu7E4Gj8xcFwHEqOXnr5IPlLFa+wewsPHmZx2u5QBXXl6+mLndB6mmIOkC4ahPwBw/xm4YR2mLdgYxqTv5fBvVGMHRaIMYLidQFHaU3emdUP32Dxzs8FoxZ565M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081260; c=relaxed/simple;
	bh=HK15SMFGqGFB5dy9wkOYSIixsAG+ODoJmMn9s3DCY08=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jd0IZsJQjJMcvj7JcgfWPVqooqWQ6xBjgXbJNHMPAMqqq5V1y5lNbR4KN0A4ws4iXio7CoosCPKL4aRdm/Kd3ClbPS/pA7pshzd/Y0ltTeuqVCcmrPiW7FhihjQmzEYrGxfc6rRq6NOesdb6Md12+ntC2/Kn2ksY8VvfWbZAuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIy88eYr; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef9df68bcso360776f8f.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081257; x=1781686057; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OERKqt1g2K8cSM2CQc683H+z2iXNM2E/sBMWVP8ew3Q=;
        b=gIy88eYrpImcaDJ+G0nicql1XWrKgTEE7Vb0rQ6xGOzVGZWCebWcba/xjzqe5wVIbN
         YGWPCLuhp7659qZWa+O9zsFQ30Q5w4Ghj4e0Z26ASX0CpyCLl677ejwRC4TxaSHzMOFI
         haSlUrlLj/rhCkZkNlrAKhArwHlqVyr4PUGDZlNhWGl7wAJcasB9BkHPK5dm0fuhrFZP
         v3XpHIeeqgSoaloey/baTIE+7goqhpuB+GJuPfbXEiLJ+sPsrH3hBkpzYAiWTNXdaIQ3
         JtU9Hk3Flsw9C1HtLOc20wtM9rMJtRvUssidzR+mr5l6B+S8VfOZEIs8IBfM6jXacA5z
         DS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081257; x=1781686057;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OERKqt1g2K8cSM2CQc683H+z2iXNM2E/sBMWVP8ew3Q=;
        b=Z9v4ALtETwvL5LADUGr3AmG7IU7MX8rjaZmUFKlzAVr60VFQTkjhq3wlUys797NrX4
         RShZeuL5E6SW13bNIUEwBMUHSHALngSfCk0HzuU8u26jIMqiJEY1gPLjCIPaiB07w5bG
         HUN09uYu4V+HJMXu5ccppozRssrnCxvK4TLsKS/f2Rjf8C+HE98Z22f5svE6kK/BBKGl
         mICYBZrmyWvobudecgHR2JKor5FnfKnowC0aL5jqsdciX4UL85AklfiIqTEIBrUsdID7
         eYoC4if4Q+ofFEvxME/75ScEZ1zDPQEm69jLdQLe3mnfagnxYS5M6ew6ccBxhqifi68n
         95/g==
X-Forwarded-Encrypted: i=1; AFNElJ8jUZ43eX8bESjwTs3gLHK9CvQP0Ju2TisQDb8WKPT1eSHhPa3eY9buEuVB2cIWCUiQjO2L+6UqYKEIKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwc3MnFA793S0idSTMn/RCVpE6mVp3GMd62i07AmPP8eSSaLvo
	4Me/zC+TtsCpNPG5uSWcRlZkeuBeckNrmo7QO7c3SOksYTpYu6m3/oc=
X-Gm-Gg: Acq92OH3KvE55rJFMHF/6snzldtTb/qGqB86vc3gKYQ6Yb9grYcz9lyHzLPWg3IwDrW
	bTG9h5gVcjrFOJQLIfSiCgCFnXIzfxOL++e9LIpl+HNYksKI4jITNYB+JHCx2K8SUy+4BRuXy57
	Ry95t/71kHGSOLOp0mIuiijVilyU4o8t8TV11zNIKaBHc9mMaE8vO4rNfj3tYK6JnwuhaZMPyHB
	ZhP6a4HPrMExZx2ICKhahU+mckoj2yGSei1xH+Hs4Mfyb/MNYg2m2N6Z4LmjDwYuWq6CzJda78b
	MkQilkQRAiYUlqGxIIwiQhPnrLa3MQZT8pxPCVn9fzwj4mbF24/9iIxEhY67aRqmLZlDldAnjHK
	F2moAc2ZNDqbo6qi/rEiJD46cC1SIK3JgkW7f1i+VtGjhZdOED4mQLEG7LWLGhZJB3deMChsb8G
	rcIBpVSjZw25iojpPl/USDu97/6gz8VigbV7KAKHkFkW+gaozNlgzyn0DUdqp9n3zMgRNSBUxwb
	ds=
X-Received: by 2002:a05:6000:2388:b0:451:51d6:5e24 with SMTP id ffacd0b85a97d-460566e8604mr3700520f8f.6.1781081256237;
        Wed, 10 Jun 2026 01:47:36 -0700 (PDT)
Received: from localhost (32.red-80-39-29.staticip.rima-tde.net. [80.39.29.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm123273485f8f.27.2026.06.10.01.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:47:35 -0700 (PDT)
Message-ID: <d6c10dd0-daff-424e-bde4-8f47a036a8a0@gmail.com>
Date: Wed, 10 Jun 2026 10:47:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, en-GB, es-ES
To: Mario Limonciello <superm1@kernel.org>
Cc: linux-usb@vger.kernel.org, SOUND ML <linux-sound@vger.kernel.org>,
 SCSI ML <linux-scsi@vger.kernel.org>, NETDEV ML <netdev@vger.kernel.org>,
 linux-media@vger.kernel.org, KERNEL ML <linux-kernel@vger.kernel.org>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [FYI] Several firmware files removed from linux-firmware.git (affects
 multiple drivers)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64389-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:superm1@kernel.org,m:linux-usb@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xosevazquez@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xosevazquez@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F22D7667832

Hi,

In commit 1e6faaf837aea079582214c9c1382e5476175576 [1] of the
linux-firmware.git repo, the following files were removed due
to unknown licenses:

acenic/tg1.bin
acenic/tg2.bin
emi62/bitstream.fw
emi62/loader.fw
emi62/midi.fw
emi62/spdif.fw
ess/maestro3_assp_kernel.fw
ess/maestro3_assp_minisrc.fw
korg/k1212.dsp
lgs8g75.fw
mts_mt9234mu.fw
mts_mt9234zba.fw
myricom/lanai.bin
qlogic/isp1000.bin
sun/cassini.bin
ttusb-budget/dspbootcode.bin
vicam/firmware.fw
yam/1200.bin
yam/9600.bin
yamaha/ds1_ctrl.fw
yamaha/ds1_dsp.fw
yamaha/ds1e_ctrl.fw


This affects, at least, the following drivers:

drivers/media/dvb-frontends/lgs8gxx.c:#define LGS8GXX_FIRMWARE "lgs8g75.fw"
drivers/media/usb/gspca/vicam.c:#define VICAM_FIRMWARE "vicam/firmware.fw"
drivers/media/usb/gspca/vicam.c:                pr_err("Failed to load \"vicam/firmware.fw\": %d\n", ret);
drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:      err = request_firmware(&fw, "ttusb-budget/dspbootcode.bin",
drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:MODULE_FIRMWARE("ttusb-budget/dspbootcode.bin");
drivers/net/ethernet/sun/cassini.c:     const char fw_name[] = "sun/cassini.bin";
drivers/net/ethernet/sun/cassini.c:MODULE_FIRMWARE("sun/cassini.bin");
drivers/scsi/qlogicpti.c:       const char fwname[] = "qlogic/isp1000.bin";
drivers/scsi/qlogicpti.c:MODULE_FIRMWARE("qlogic/isp1000.bin");
drivers/usb/misc/emi62.c:#define FIRMWARE_FW "emi62/midi.fw"
drivers/usb/misc/emi62.c:#define FIRMWARE_FW "emi62/spdif.fw"
drivers/usb/misc/emi62.c:       err = request_ihex_firmware(&bitstream_fw, "emi62/bitstream.fw",
drivers/usb/misc/emi62.c:       err = request_ihex_firmware(&loader_fw, "emi62/loader.fw", &dev->dev);
drivers/usb/misc/emi62.c:MODULE_FIRMWARE("emi62/bitstream.fw");
drivers/usb/misc/emi62.c:MODULE_FIRMWARE("emi62/loader.fw");
drivers/usb/serial/ti_usb_3410_5052.c:MODULE_FIRMWARE("mts_mt9234mu.fw");
drivers/usb/serial/ti_usb_3410_5052.c:MODULE_FIRMWARE("mts_mt9234zba.fw");
drivers/usb/serial/ti_usb_3410_5052.c:                          strscpy(buf, "mts_mt9234mu.fw");
drivers/usb/serial/ti_usb_3410_5052.c:                          strscpy(buf, "mts_mt9234zba.fw");
drivers/usb/serial/ti_usb_3410_5052.c:                          strscpy(buf, "mts_mt9234zba.fw");
sound/pci/korg1212/korg1212.c:  err = request_firmware(&dsp_code, "korg/k1212.dsp", &pci->dev);
sound/pci/korg1212/korg1212.c:MODULE_FIRMWARE("korg/k1212.dsp");
sound/pci/maestro3.c:                          "ess/maestro3_assp_kernel.fw", &pci->dev);
sound/pci/maestro3.c:                          "ess/maestro3_assp_minisrc.fw", &pci->dev);
sound/pci/maestro3.c:MODULE_FIRMWARE("ess/maestro3_assp_kernel.fw");
sound/pci/maestro3.c:MODULE_FIRMWARE("ess/maestro3_assp_minisrc.fw");
sound/pci/ymfpci/ymfpci_main.c: err = request_firmware(&chip->dsp_microcode, "yamaha/ds1_dsp.fw",
sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1_ctrl.fw");
sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1_dsp.fw");
sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1e_ctrl.fw");
sound/pci/ymfpci/ymfpci_main.c: name = is_1e ? "yamaha/ds1e_ctrl.fw" : "yamaha/ds1_ctrl.fw";
sound/pci/ymfpci/ymfpci_main.c: name = is_1e ? "yamaha/ds1e_ctrl.fw" : "yamaha/ds1_ctrl.fw";


[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=1e6faaf837aea079582214c9c1382e5476175576

