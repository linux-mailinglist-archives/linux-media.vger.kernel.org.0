Return-Path: <linux-media+bounces-58650-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADOCHSG93GliVwkAu9opvQ
	(envelope-from <linux-media+bounces-58650-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 11:53:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC503EA11C
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 11:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CC33024A70
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EAB34F241;
	Mon, 13 Apr 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeamRhP9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B895A1DF75A;
	Mon, 13 Apr 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776073559; cv=none; b=hKDakPsK1+8thDfsobEprLEDchq7imnm4jQw6r5nhxqDzk7Q1vzn1Gu3B/SRk7PLU0FZGYQtptom2hXNGR23thgVHWehb70x/UVf01PcEMChjUq7QLgxBx7NuSNgJA/s/Y2KqSXWRX+Xpe40Y0BJ4h8+rcPUiOPOFtbiU5ZbyUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776073559; c=relaxed/simple;
	bh=5veiHHgWaMzRiwn6PqcbksFhy1YN7r23zzqcwCRI7c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FW9OLBgCEmZH6//OMewb9B/HD46vtn9EPRk0IGRZVFzerE9QB0h1P7H0wyWi48lrJhGmnWGfi9Va6aMQHamOlhMluYxXEYQy8twSUblU+OrMsP/EA7SW7A2caatrIa96NYc2PGcwJt4ZEug5l9Nr6nMu9XxyNxG3RLnf7k/ihus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeamRhP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEE0C116C6;
	Mon, 13 Apr 2026 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776073559;
	bh=5veiHHgWaMzRiwn6PqcbksFhy1YN7r23zzqcwCRI7c8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WeamRhP9646SVf2IFUQlX/iyvdRV9gNeT1Y4g6PqjcuNsbxuW2ImPnKKa0twJSjM7
	 PRte7P4h4faYwmIo9b4vz9A5SH1kCiOOy9mJkRnm7YnRAyDqtKw5Utpi+zlZ1kdprh
	 XtIZIFDdGzOnTw3Z5MHhDVfSkj4XSdJvmOlUXrborJSCtE1liDgsTE2sa5EwF4kP48
	 bQNLou6OdlecerlUCvHBKSP7pITaGxko6rjS0lUqgOHzz0MIB7+cpLlO0wd8Hkz+i7
	 n1lIvzxZbR45DvfY+cyHuU5dTcmPLTbsE90vFD/82+1uagC9HQpCJ9pty01QvgZ9Kq
	 E//v0B2L59V0g==
Message-ID: <25fd6ad5-0da9-485b-b507-9d1dc080cc86@kernel.org>
Date: Mon, 13 Apr 2026 11:45:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Enable dual cameras on Dell Latitude 5285 2-in-1
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 lee@kernel.org, djrscally@gmail.com, ilpo.jarvinen@linux.intel.com,
 mchehab@kernel.org, sakari.ailus@linux.intel.com,
 jacopo.mondi@ideasonboard.com, nicholas@rothemail.net
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260324214129.17300-1-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58650-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CFC503EA11C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thierry,

Thank you for your work on this.

On 24-Mar-26 10:41 PM, Thierry Chatard wrote:
> Changes in v2:
> - patch 2: split trailing statements in aml_parse_int() onto separate
>   lines (checkpatch); add kernel-doc @param descriptions to
>   aml_parse_int(), dell5285_gnvs_from_table(), and dell5285_gnvs_find()
>   (kernel test robot); add Reported-by/Closes tags
> - patch 3: wrap long lines in commit message (checkpatch)
> 
> The Dell Latitude 5285 2-in-1 has two cameras (OV5670 front, OV8858
> rear) connected through a TPS68470 PMIC/clock/GPIO hub. All five patches
> are required for a working system; each is self-contained and
> bisect-safe.
> 
> Hardware topology
> -----------------
>   Front camera:  OV5670 (ACPI INT3479), I2C4 / INT3446
>   Rear camera:   OV8858 (ACPI INT3477), I2C2 / i2c_designware.3
>   PMIC:          TPS68470 (ACPI INT3472:05), addr 0x4D, on I2C2
>   ISP:           Intel IPU3 (ipu3_cio2 + ipu3-imgu)
> 
> The OV8858 is daisy-chained behind the TPS68470 S_I2C passthrough port.
> The TPS68470 VSIO regulator controls S_I2C_CTL (reg 0x43); marking it
> always_on keeps the passthrough active from boot so OV8858 is reachable
> on I2C2 at probe time.
> > Four problems must be fixed in combination:

Hmm, it is unfortunate that this 2-in-1 requires the first 2 workarounds,
especially the second workaround.

Patches 3-5 look fine at a quick glance.

> patch 1/5 - intel_lpss: The BIOS claims the same MMIO region for both
>   GEXP and INT3446 (I2C4). Without this quirk the kernel rejects INT3446
>   as a resource conflict and the front camera's I2C bus never comes up.

This one is a bit unfortunate but this is a known issue on similar
(Microsoft Surface Go series) devices with an IPU3 camera like here,
with a pre-existing quirk mechanism to deal with this, so I guess this is
acceptable.

> patch 2/5 - GNVS fixup: With I2C4 available, ipu_bridge still does not
>   create the front camera client because _DEP on INT3479 returns the
>   root PCI bus instead of the INT3472 handle. Root cause: BIOS leaves
>   GNVS fields C0TP, L0CL, L1CL at zero. Fix: scan DSDT/SSDTs for the
>   GNVS OperationRegion at TPS68470 probe time and write 0x02 (19.2 MHz)
>   into all three fields before ipu_bridge evaluates _DEP.

This one really is nasty. I'll reply in detail to the patch itself.

Regards,

Hans



> patch 3/5 - TPS68470 board data: No board data existed for this machine,
>   so no PMIC regulators or GPIOs were configured for either sensor.
> 
> patch 4/5 - ipu-bridge: INT3477 (OV8858) was unknown to ipu_bridge, so
>   it was skipped at CSI-2 enumeration.
> 
> patch 5/5 - ov8858 driver: No ACPI match for INT3477, and the driver did
>   not request the vsio supply needed by the S_I2C passthrough.
> 
> Tested on Dell Latitude 5285 2-in-1, Ubuntu 25.10, kernel 6.17.0-19.
> Both cameras appear in libcamera and are usable in applications.
> Note: the IPU3 IMGU can only run one pipeline at a time, so front and
> rear camera use is mutually exclusive.
> 
> Thierry Chatard (5):
>   platform/x86: intel_lpss: add resource conflict quirk for Dell
>     Latitude 5285
>   platform/x86: int3472: tps68470: fix GNVS clock fields for Dell
>     Latitude 5285
>   platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
>   media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
>   media: ov8858: add ACPI device ID INT3477 and vsio power supply
> 
>  drivers/mfd/intel-lpss-acpi.c                 |  32 +++
>  drivers/media/i2c/ov8858.c                    |  10 +-
>  drivers/media/pci/intel/ipu-bridge.c          |   2 ++
>  drivers/platform/x86/intel/int3472/tps68470.c | 201 ++++++++++++++++++
>  .../x86/intel/int3472/tps68470_board_data.c   | 163 ++++++++++++++
>  5 files changed, 407 insertions(+), 1 deletion(-)
> 
> base-commit: 6de23f81a4be5ee86a4df4fde0ca0c7bf67aecd1
> --
> 2.51.0
> 


