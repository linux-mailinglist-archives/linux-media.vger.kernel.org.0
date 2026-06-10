Return-Path: <linux-media+bounces-64446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y9bqBgxrKWoqWgMAu9opvQ
	(envelope-from <linux-media+bounces-64446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:47:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57A669EB5
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:47:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F+W4yH7q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64446-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64446-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE332301373B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0339402447;
	Wed, 10 Jun 2026 13:43:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74D3CF212;
	Wed, 10 Jun 2026 13:43:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099037; cv=none; b=b6iANgHV+TxyfF7ScIpkLsTsdy4PCz5s22EZvAZSGX9trj+55LyE5PkuI+SgQbVbKtQinMFZyecQZN/R3/l1M69whLyxSR3KLUlJVe60i2kM7bNOZPG+4zmvVkUEUMBMgVfCGNOs1mhskctqvS3dt15Ngi7gO3zVcabqn9XKdbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099037; c=relaxed/simple;
	bh=pjQ3p5eGhCwajA1vQ2eDZi47NIqtufz9bme2iUuP95A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+2hbPBAW6Gv4YbP8n+97YlRrTnZOM+XA7S5xOD8r2ylW7bvWWBqJSOSlrbIQHQcT+ulqHcAZMJxW7O3QczKnPpIhqAuPfoUBbRBddjC0ddggFjXDmKiy6HkVmdRBYiRzzEmgCiwjQhVM5qMZl+W0Xn4/1Ku663ZnsbUeAkTEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+W4yH7q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D951F00893;
	Wed, 10 Jun 2026 13:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781099036;
	bh=A3oIx4t3t+ADJZANkLPS377mjeN/BkX8etAL1je2/FQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=F+W4yH7qBy1K+aBJEdwbFxiNTJFm0gGQmZwSLRKejuCy2o8CPW0hSncgOTeY41ahh
	 5Ep3BgSgjyiiKzueSD0gB53SrRakMgeMISWO08mr+p92VIEKN26kRXEZq59XuFPeL4
	 f5m9DI+mDCAygEAYHdSVkIffGFcOORZGxZZUHT1w9g9BCQIVTzZi8KmvlNf8Bm8PLU
	 5NlhQ/aiEdievzgSUk9nVJx/t5NIuJpBkO/sF9DzX5dAGOiv5ZDQLasc+dAbmf3k4V
	 TjNEzWG26kezVAGwh0JFVIah3DbbKNZbfsJfDrM4G0X+3xpLw6Rbqf/lN6FHV4yWIJ
	 BQH8v03Zg158Q==
Message-ID: <b5ec82d0-1afd-49e4-b3b9-31a1b5d82b36@kernel.org>
Date: Wed, 10 Jun 2026 08:43:54 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [FYI] Several firmware files removed from linux-firmware.git
 (affects multiple drivers)
Content-Language: en-US
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: linux-usb@vger.kernel.org, SOUND ML <linux-sound@vger.kernel.org>,
 SCSI ML <linux-scsi@vger.kernel.org>, NETDEV ML <netdev@vger.kernel.org>,
 linux-media@vger.kernel.org, KERNEL ML <linux-kernel@vger.kernel.org>
References: <d6c10dd0-daff-424e-bde4-8f47a036a8a0@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <d6c10dd0-daff-424e-bde4-8f47a036a8a0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xose.vazquez@gmail.com,m:linux-usb@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xosevazquez@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[superm1@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64446-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC57A669EB5

On 6/10/26 03:47, Xose Vazquez Perez wrote:
> Hi,
> 
> In commit 1e6faaf837aea079582214c9c1382e5476175576 [1] of the
> linux-firmware.git repo, the following files were removed due
> to unknown licenses:
> 
> acenic/tg1.bin
> acenic/tg2.bin
> emi62/bitstream.fw
> emi62/loader.fw
> emi62/midi.fw
> emi62/spdif.fw
> ess/maestro3_assp_kernel.fw
> ess/maestro3_assp_minisrc.fw
> korg/k1212.dsp
> lgs8g75.fw
> mts_mt9234mu.fw
> mts_mt9234zba.fw
> myricom/lanai.bin
> qlogic/isp1000.bin
> sun/cassini.bin
> ttusb-budget/dspbootcode.bin
> vicam/firmware.fw
> yam/1200.bin
> yam/9600.bin
> yamaha/ds1_ctrl.fw
> yamaha/ds1_dsp.fw
> yamaha/ds1e_ctrl.fw
> 
> 
> This affects, at least, the following drivers:
> 
> drivers/media/dvb-frontends/lgs8gxx.c:#define LGS8GXX_FIRMWARE "lgs8g75.fw"
> drivers/media/usb/gspca/vicam.c:#define VICAM_FIRMWARE "vicam/firmware.fw"
> drivers/media/usb/gspca/vicam.c:                pr_err("Failed to load 
> \"vicam/firmware.fw\": %d\n", ret);
> drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:      err = 
> request_firmware(&fw, "ttusb-budget/dspbootcode.bin",
> drivers/media/usb/ttusb-budget/dvb-ttusb- 
> budget.c:MODULE_FIRMWARE("ttusb-budget/dspbootcode.bin");
> drivers/net/ethernet/sun/cassini.c:     const char fw_name[] = "sun/ 
> cassini.bin";
> drivers/net/ethernet/sun/cassini.c:MODULE_FIRMWARE("sun/cassini.bin");
> drivers/scsi/qlogicpti.c:       const char fwname[] = "qlogic/isp1000.bin";
> drivers/scsi/qlogicpti.c:MODULE_FIRMWARE("qlogic/isp1000.bin");
> drivers/usb/misc/emi62.c:#define FIRMWARE_FW "emi62/midi.fw"
> drivers/usb/misc/emi62.c:#define FIRMWARE_FW "emi62/spdif.fw"
> drivers/usb/misc/emi62.c:       err = 
> request_ihex_firmware(&bitstream_fw, "emi62/bitstream.fw",
> drivers/usb/misc/emi62.c:       err = request_ihex_firmware(&loader_fw, 
> "emi62/loader.fw", &dev->dev);
> drivers/usb/misc/emi62.c:MODULE_FIRMWARE("emi62/bitstream.fw");
> drivers/usb/misc/emi62.c:MODULE_FIRMWARE("emi62/loader.fw");
> drivers/usb/serial/ti_usb_3410_5052.c:MODULE_FIRMWARE("mts_mt9234mu.fw");
> drivers/usb/serial/ti_usb_3410_5052.c:MODULE_FIRMWARE("mts_mt9234zba.fw");
> drivers/usb/serial/ti_usb_3410_5052.c:                          
> strscpy(buf, "mts_mt9234mu.fw");
> drivers/usb/serial/ti_usb_3410_5052.c:                          
> strscpy(buf, "mts_mt9234zba.fw");
> drivers/usb/serial/ti_usb_3410_5052.c:                          
> strscpy(buf, "mts_mt9234zba.fw");
> sound/pci/korg1212/korg1212.c:  err = request_firmware(&dsp_code, "korg/ 
> k1212.dsp", &pci->dev);
> sound/pci/korg1212/korg1212.c:MODULE_FIRMWARE("korg/k1212.dsp");
> sound/pci/maestro3.c:                          "ess/ 
> maestro3_assp_kernel.fw", &pci->dev);
> sound/pci/maestro3.c:                          "ess/ 
> maestro3_assp_minisrc.fw", &pci->dev);
> sound/pci/maestro3.c:MODULE_FIRMWARE("ess/maestro3_assp_kernel.fw");
> sound/pci/maestro3.c:MODULE_FIRMWARE("ess/maestro3_assp_minisrc.fw");
> sound/pci/ymfpci/ymfpci_main.c: err = request_firmware(&chip- 
>  >dsp_microcode, "yamaha/ds1_dsp.fw",
> sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1_ctrl.fw");
> sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1_dsp.fw");
> sound/pci/ymfpci/ymfpci_main.c:MODULE_FIRMWARE("yamaha/ds1e_ctrl.fw");
> sound/pci/ymfpci/ymfpci_main.c: name = is_1e ? "yamaha/ds1e_ctrl.fw" : 
> "yamaha/ds1_ctrl.fw";
> sound/pci/ymfpci/ymfpci_main.c: name = is_1e ? "yamaha/ds1e_ctrl.fw" : 
> "yamaha/ds1_ctrl.fw";
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux- 
> firmware.git/commit/?id=1e6faaf837aea079582214c9c1382e5476175576

Yes; I know it affects drivers, and thanks for notifying the susbystem 
maintainers.

We shouldn't have been redistributing binaries without a LICENSE from 
the authors indicating we had permission to do so in the first place.

Hopefully this change will prompt the authors to clarify licensing and 
we can restore binaries that we are legally allowed to redistribute.

