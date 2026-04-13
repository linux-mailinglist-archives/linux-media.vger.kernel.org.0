Return-Path: <linux-media+bounces-58660-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHQkF0bN3GmcWQkAu9opvQ
	(envelope-from <linux-media+bounces-58660-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 13:02:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF29F3EB0B0
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 13:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 028113008322
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 11:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFA83BE167;
	Mon, 13 Apr 2026 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiAlKdaZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B322156C;
	Mon, 13 Apr 2026 11:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776078144; cv=none; b=VWsb7XlwXNp427HU+EoQzY3n8bOn/4mxx7QzYvJr5Jg2ZqAlLI1C0F65jbtKErh/DHnaIEzuS0gi4J1bB3FIoihrZy2JBWrPxw5p+mw/KD99SdCFpFRPr164bIWvjd0f88TyuC2dTqBJyRKtXcon2qNOb2v+wJAJohOv++Gd63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776078144; c=relaxed/simple;
	bh=WqZvPApVXMwS7BXxXyyxchsM+pO3uNmhKBM1ivYferU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgHylYdMIOCsAB5seIvmtf8ZVmkATs/jHFP0raDtkJ3CQyBOpbmuLUoigDhTvpLyT4xnLysk69D7aKOj1/HlXaZPoCRKwm/gKbSf16tjE9YTI9XJolYNu4+oq3OKz2VXWeKfxDBGuuw6oQElgRoXEG3TTQ3EEgJYOgJiaE3m9R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiAlKdaZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9009C116C6;
	Mon, 13 Apr 2026 11:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776078143;
	bh=WqZvPApVXMwS7BXxXyyxchsM+pO3uNmhKBM1ivYferU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jiAlKdaZDJ6CswQxMwsXxXd1MF7Z1TzTax6/zpxIp32UA9vZdRZHBzLi9AixRaKjQ
	 HQLCSF3YE5dq1MsIyLp1KMLoSQhbFue2Dnl8fbrnkFjOeZN3Pqx64TmZ5VgS+a7W56
	 nbMAf6toskK30vi+7AvNCZBWunmM0sSjUjeZW52ElPo5el3ZHtHZs7vU+wfx0CxWmG
	 0sJiMA77sdD3fR0ZJhyQvmCDhXamkmNfRWpuNMaTDH3k1JO/KZt2HL89jdBl2o/euU
	 R1UmEZuaB+g/Sx6iVoCAyloyFsNP/CtPmyV09p/3IJUe7dfXiN5i4fv5HfGnoo+3ai
	 3TcDohiBYoGEw==
Message-ID: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
Date: Mon, 13 Apr 2026 13:02:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform/x86: int3472: tps68470: fix GNVS clock
 fields for Dell Latitude 5285
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 lee@kernel.org, djrscally@gmail.com, ilpo.jarvinen@linux.intel.com,
 mchehab@kernel.org, sakari.ailus@linux.intel.com,
 jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
 kernel test robot <lkp@intel.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
 <20260324214129.17300-3-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260324214129.17300-3-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58660-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net,intel.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF29F3EB0B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 24-Mar-26 10:41 PM, Thierry Chatard wrote:
> The Dell Latitude 5285 BIOS leaves the GNVS fields C0TP, L0CL, and L1CL
> at zero at boot. The TPS68470 clock driver reads L0CL and L1CL to select
> the output frequency; with both fields zero the clock outputs are disabled,
> and neither camera sensor can communicate over I2C.
> 
> Additionally, when C0TP=0 the ACPI _DEP method on INT3479 returns PCI0 as
> its dependency instead of CLP0 (the INT3472 device), causing ipu_bridge to
> never create the i2c-INT3479:00 client for the front camera.
> 
> Add a DMI-gated fixup that runs at TPS68470 probe time and writes 0x02
> (19.2 MHz) into C0TP, L0CL, and L1CL.
> 
> The GNVS physical address is discovered at run time by scanning the raw
> AML of the DSDT (and any SSDTs) for the GNVS SystemMemory OperationRegion
> definition (opcode sequence 0x5B 0x80 "GNVS" 0x00). The parsed address is
> then mapped with acpi_os_map_memory(), which is safe because ACPI NVS
> memory is reserved by the firmware and already mapped by the OS. No
> hard-coded physical addresses are used.
> 
> Field byte offsets within the GNVS region (verified against DSDT
> disassembly on this platform, region size 0x0725 bytes):
>   C0TP: 0x43A   L0CL: 0x4F7   L1CL: 0x549
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603211747.Z6xudmNd-lkp@intel.com/

I'm sorry but the ACPI table / GNVS poking going on here really is not
acceptable. I can see you've done your best to make this safe, but this is
still something which I think we should not do. Writing to GNVS is troublesome
because the old values there might have already been used for 

The first thing to try here is make sure you have the latest BIOS and then select
"load setup defaults" or something similar and then "save settings". These sort
of GVNS problems often come from the layout of GVNS having changed with a BIOS
update, but the BIOS not automatically re-applying the new default settings
(which include many hidden settings) to its saved settings.

This may also change the I2C4 controller from being in ACPI enumeration mode
to being in PCI enumeration mode as one would expect of this generation of
"laptop".

If loading + saving the BIOS default settings does not help then for the
tps68470 clk problem I would suggest to just add clk data to struct
int3472_tps68470_board_data and if the clk data is set use that instead of
the values from ACPI.

Which would leave the when C0TP=0 the ACPI _DEP method on INT3479 returns PCI0
problem. Can you describe that in a bit more detail? You write:

> returns PCI0 as
> its dependency instead of CLP0 (the INT3472 device), causing ipu_bridge to
> never create the i2c-INT3479:00 client for the front camera.

but it is not ipu-bridge which is creating the i2c-INT3479:00 client, that
is done by the APCI + I2C core code, when all _DEP dependencies are marked
as available.

I guess a problem with the wrong _DEP being returned is mostly a problem
for the int3472 code which uses the _DEP relation to find out which sensor
to add regulator lookups, etc. to. But we could do a DMI quirk to simply
lookup the sensor firmware-node by its ACPI path on this 2-in-1 model ?

Also can you share an acpidump of the tables for this device please ?

Regards,

Hans



> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 201 ++++++++++++++++++
>  1 file changed, 201 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0..c9686426f 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -2,8 +2,10 @@
>  /* Author: Dan Scally <djrscally@gmail.com> */
>  
>  #include <linux/acpi.h>
> +#include <linux/dmi.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
> +#include <linux/unaligned.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/tps68470.h>
>  #include <linux/platform_device.h>
> @@ -140,6 +142,203 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
>  	return n_consumers;
>  }
>  
> +/* Dell Latitude 5285 GNVS fix
> + *
> + * The BIOS leaves GNVS fields C0TP, L0CL and L1CL at zero after POST.
> + * With C0TP=0 the ACPI _DEP on INT3479 resolves to PCI0 instead of CLP0
> + * (INT3472), so ipu_bridge never creates i2c-INT3479:00 (OV5670 front cam).
> + * With L0CL=L1CL=0 the TPS68470 clock driver disables all clock outputs,
> + * making both sensors unreachable over I2C.
> + *
> + * Fix: at TPS68470 probe time, locate the GNVS SystemMemory OperationRegion
> + * by scanning the DSDT/SSDTs for its AML definition, map the region, and
> + * write 0x02 (19.2 MHz) into C0TP, L0CL and L1CL.
> + *
> + * Field byte offsets (verified from DSDT disassembly, GNVS size 0x0725):
> + *   C0TP: 0x43A   L0CL: 0x4F7   L1CL: 0x549
> + */
> +#define DELL5285_C0TP_OFF	0x43A
> +#define DELL5285_L0CL_OFF	0x4F7
> +#define DELL5285_L1CL_OFF	0x549
> +/* Minimum GNVS region size: last field (L1CL) is 1 byte at 0x549 */
> +#define DELL5285_GNVS_MIN_SIZE	(DELL5285_L1CL_OFF + 1)
> +
> +/* AML integer opcodes (ACPI 6.4, section 20.2.3) */
> +#define AML_ZERO_OP		0x00
> +#define AML_ONE_OP		0x01
> +#define AML_BYTE_PREFIX		0x0A
> +#define AML_WORD_PREFIX		0x0B
> +#define AML_DWORD_PREFIX	0x0C
> +#define AML_QWORD_PREFIX	0x0E
> +
> +/**
> + * aml_parse_int - Parse one AML integer opcode at @p.
> + * @p:   Pointer to the current position in the AML byte stream.
> + * @end: One past the last valid byte of the AML buffer.
> + * @val: Output: the parsed integer value.
> + *
> + * Returns the number of bytes consumed, or 0 on failure.
> + */
> +static int aml_parse_int(const u8 *p, const u8 *end, u64 *val)
> +{
> +	if (p >= end)
> +		return 0;
> +	switch (*p) {
> +	case AML_ZERO_OP:
> +		*val = 0;
> +		return 1;
> +	case AML_ONE_OP:
> +		*val = 1;
> +		return 1;
> +	case AML_BYTE_PREFIX:
> +		if (p + 2 > end)
> +			return 0;
> +		*val = p[1];
> +		return 2;
> +	case AML_WORD_PREFIX:
> +		if (p + 3 > end)
> +			return 0;
> +		*val = get_unaligned_le16(p + 1);
> +		return 3;
> +	case AML_DWORD_PREFIX:
> +		if (p + 5 > end)
> +			return 0;
> +		*val = get_unaligned_le32(p + 1);
> +		return 5;
> +	case AML_QWORD_PREFIX:
> +		if (p + 9 > end)
> +			return 0;
> +		*val = get_unaligned_le64(p + 1);
> +		return 9;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * dell5285_gnvs_from_table - Scan one ACPI table for the GNVS OperationRegion.
> + * @tbl:  ACPI table header; the AML body is scanned for the GNVS signature.
> + * @addr: Output: physical base address of the GNVS region.
> + * @size: Output: byte length of the GNVS region.
> + *
> + * Searches the AML body of @tbl for the byte sequence:
> + *   ExtOp(0x5B) OpRegionOp(0x80) NameSeg("GNVS") RegionSpace(SystemMemory=0x00)
> + * followed by two AML integers (region address and length).
> + *
> + * Returns true and fills @addr / @size if found and plausible.
> + */
> +static bool dell5285_gnvs_from_table(const struct acpi_table_header *tbl,
> +				     phys_addr_t *addr, u32 *size)
> +{
> +	/* AML: ExtOp OpRegionOp NameSeg("GNVS") SystemMemory */
> +	static const u8 sig[] = { 0x5B, 0x80, 'G', 'N', 'V', 'S', 0x00 };
> +	const u8 *aml = (const u8 *)tbl + sizeof(*tbl);
> +	const u8 *end = (const u8 *)tbl + tbl->length;
> +	const u8 *p;
> +
> +	for (p = aml; p + sizeof(sig) < end; p++) {
> +		u64 region_addr, region_size;
> +		int consumed;
> +
> +		if (memcmp(p, sig, sizeof(sig)) != 0)
> +			continue;
> +
> +		p += sizeof(sig);
> +		consumed = aml_parse_int(p, end, &region_addr);
> +		if (!consumed || !region_addr)
> +			continue;
> +
> +		p += consumed;
> +		consumed = aml_parse_int(p, end, &region_size);
> +		if (!consumed || region_size < DELL5285_GNVS_MIN_SIZE)
> +			continue;
> +
> +		*addr = (phys_addr_t)region_addr;
> +		*size = (u32)region_size;
> +		return true;
> +	}
> +	return false;
> +}
> +
> +/**
> + * dell5285_gnvs_find - Locate the GNVS OperationRegion by scanning DSDT and SSDTs.
> + * @addr: Output: physical base address of the GNVS region.
> + * @size: Output: byte length of the GNVS region.
> + *
> + * Returns true if the GNVS region was found in any ACPI table.
> + */
> +static bool dell5285_gnvs_find(phys_addr_t *addr, u32 *size)
> +{
> +	struct acpi_table_header *tbl;
> +	u32 i;
> +
> +	/* DSDT */
> +	if (ACPI_SUCCESS(acpi_get_table(ACPI_SIG_DSDT, 1, &tbl))) {
> +		bool found = dell5285_gnvs_from_table(tbl, addr, size);
> +
> +		acpi_put_table(tbl);
> +		if (found)
> +			return true;
> +	}
> +
> +	/* SSDTs (instance numbers start at 1, stop at first failure) */
> +	for (i = 1; i <= 32; i++) {
> +		bool found;
> +
> +		if (ACPI_FAILURE(acpi_get_table(ACPI_SIG_SSDT, i, &tbl)))
> +			break;
> +		found = dell5285_gnvs_from_table(tbl, addr, size);
> +		acpi_put_table(tbl);
> +		if (found)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static const struct dmi_system_id dell5285_gnvs_dmi[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static void dell5285_gnvs_fix(void)
> +{
> +	phys_addr_t gnvs_addr;
> +	u32 gnvs_size;
> +	void *gnvs;
> +
> +	if (!dmi_check_system(dell5285_gnvs_dmi))
> +		return;
> +
> +	if (!dell5285_gnvs_find(&gnvs_addr, &gnvs_size)) {
> +		pr_err("int3472-tps68470: Dell 5285: GNVS OperationRegion not found in DSDT/SSDTs\n");
> +		return;
> +	}
> +
> +	gnvs = acpi_os_map_memory(gnvs_addr, gnvs_size);
> +	if (!gnvs) {
> +		pr_err("int3472-tps68470: Dell 5285: failed to map GNVS at %pa\n",
> +		       &gnvs_addr);
> +		return;
> +	}
> +
> +	pr_info("int3472-tps68470: Dell 5285 GNVS fix at %pa: C0TP=0x%02x L0CL=0x%02x L1CL=0x%02x -> 0x02\n",
> +		&gnvs_addr,
> +		*(u8 *)(gnvs + DELL5285_C0TP_OFF),
> +		*(u8 *)(gnvs + DELL5285_L0CL_OFF),
> +		*(u8 *)(gnvs + DELL5285_L1CL_OFF));
> +
> +	*(u8 *)(gnvs + DELL5285_C0TP_OFF) = 0x02;
> +	*(u8 *)(gnvs + DELL5285_L0CL_OFF) = 0x02;
> +	*(u8 *)(gnvs + DELL5285_L1CL_OFF) = 0x02;
> +
> +	acpi_os_unmap_memory(gnvs, gnvs_size);
> +}
> +
>  static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> @@ -155,6 +354,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	if (!adev)
>  		return -ENODEV;
>  
> +	dell5285_gnvs_fix();
> +
>  	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
>  	if (n_consumers < 0)
>  		return n_consumers;


