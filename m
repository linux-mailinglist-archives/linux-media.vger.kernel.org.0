Return-Path: <linux-media+bounces-63151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAm1DC92G2oADQkAu9opvQ
	(envelope-from <linux-media+bounces-63151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 01:43:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D93B613E5C
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 01:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5172B3029603
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 23:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C0D3793CE;
	Sat, 30 May 2026 23:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqnKn224"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D573546E8;
	Sat, 30 May 2026 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780184605; cv=none; b=CuSrnLtp0GQyGEI4XJfNAXPqWdBlrauT8j9KG2gIPAtjAWNnyQLZEfQ7HRvtg89mBTiscTMvr4LllWAOjQIWCZ4dUSQ3a+GC9hNDKxBo2LCPY9gp2K5lfJV5GFoiN3UOeD79IWYSSJDKht9IHj3bBdwl+iU6Vb0BbiAfAqHW3Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780184605; c=relaxed/simple;
	bh=VYcwkiMMIZ/yqWSSArlykGt8d2ioO/8aKg8ivUYHPDg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kiZMElUWvpIZjy1b8ekeLpiMYPDUZhEldChZmk4FnPuuXoXiTmB2tNnkw/7h1Klb11nGFVvYk5nxvjQit8yFOjtqcF1ePgTtNt+pQDU69FZXfBXN0mZtUNVhtYzrDMnzmSEWA1pu+maQESkccP5Qktc2efBgKElapeEOyyPcNh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqnKn224; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8104F1F00893;
	Sat, 30 May 2026 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780184604;
	bh=gbWK7OUNgxuxow5itBpWkuDUu4koZYPX5RyeXxd+NIs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UqnKn224K4gdc+ylN7ZPcDcR70QGXY/R5HM/LWly9taKHZmnrQFxJKpie39AeYlua
	 eKQ7m1r2DJGJ11fPO0hiaWJwgwbUKtsz+Sj9deHllU4NpJ8+LEPz+Rsnvbb98dEnhu
	 LF6dADArZehW+eoQzy8a5N5beXcpQBY+EiQJMrh0MPbPsfA3AlnD/W3kDeJ6L8nDi/
	 /171F+0YLFHUbFKP447ofy4DZ296C8SpClSD52bIpi/MLhHyaDZ810Va60SIQMGwDh
	 US2JQQZZAu4nhI/lHrd4kP8/wPqwtFGi/ykyStaxf8FW37sH3uDNrDZ6FArLZGwUOU
	 QIbVBcL34Cb2w==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 3/3] media: iris: Add Gen2 firmware autodetect and
 fallback
From: bod@kernel.org
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak-gen2-support-v4-v4-3-1b607d13f9b8@oss.qualcomm.com>
References: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
 <20260429-kodiak-gen2-support-v4-v4-3-1b607d13f9b8@oss.qualcomm.com>
Date: Sun, 31 May 2026 00:43:18 +0100
Message-Id: <178018459824.10222.12026103622148092471.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=14844; i=bod@kernel.org;
 h=from:subject:message-id; bh=VYcwkiMMIZ/yqWSSArlykGt8d2ioO/8aKg8ivUYHPDg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqG3YYBPPWNA5EplKbWbk0Pgnc9pkVG3A9QpgSK
 IFdUtdpUO6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaht2GAAKCRAicTuzoY3I
 On/+D/9w3Vp8lJjp7QVlZCcfnuIElsHlmIKutukLgXAeagNEfwRl6AxJ6GLGaWnJ13LK7sp4Yrv
 53oBwxVXiXL6gmMTSKmSQmHW/nUncTcaOTgcQz6g+d0ao4dQ/gBZm7FdR7YmUeeEglnrbMhxWdA
 786thOY/wvWQN7OZR7bu/QhBBoesrRfGVBQT5K6K636HGZMnFHEcRKxPuGaRlhycPyacYezPHHW
 vydUTU9k+zBPbWHn4jZZ+8tH4mTJRU1iYTJ7dqRFI9uAzJAww3qolM+opqJiHoOaV+KTLpPuF+q
 W8M9zD9bYlcDqxjmahhp6ZrHK7T09aXMYug+hX2b4L+8TQWBYcanYuGN7f4MhcNHlm5YUx0cneF
 RHjF3IFeHZtXygvYg3W9gRpH3SKyAfgib7AEUZgzTAIasKyjlmsLOdYAth6u8uiuAl9R4LcA7iH
 pMbx8wblRf1MSD39R+6gStEUXN5s+t9aovUaN+mTj+C6KR3zOAbEZ6kW6qAxVh/3M+Yh5nqN6WL
 NPkHvxbAyEYN2DVfAC2r3FS+wgH1Gnex/o3f4EfRb25n3zKisgVy3I3Nh22jcTzq7DOrzWob4Lt
 LptYGMNZgLH/aIU7NpjjvkYaVgx1V3lZ6HilJIMkAdJecSXuWjg61q1xgcwXZpKBoD+2g+flN0V
 LzAhiWN1WPlpHkw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63151-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9D93B613E5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-29 17:39 +0530, Dikshita Agarwal wrote:
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>    descriptor when present and attempt to load the corresponding
>    firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>    descriptor is available, retry with the Gen1 firmware image.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the driver detects the
> firmware generation at runtime before authentication by inspecting
> the firmware data. The firmware is classified as Gen2 if the
> QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
>  6 files changed, 105 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d7580849d7b68c7c15dd7f82f89a680b..64a2170bf538a6d291b3d909f5563408a3a75e50 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,20 +16,95 @@
>  
>  #define MAX_FIRMWARE_NAME_SIZE	128
>  
> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >= 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	const size_t mlen = strlen(marker);
> +	int major = 0, minor = 0;
> +	char version_buf[64];
> +	size_t max;
> +
> +	max = (size > mlen) ? size - mlen : 0;
> +	for (size_t i = 0; i < max; i++) {

Iterating character by character through the string is boilerplate you
don't need.

size = 27;
mlen = 24;
max = 3;

for (i = 0; i < max = 3; i++)

i = 2;

=>


> +		if (!memcmp(data + i, marker, mlen)) {
> +			const char *found = (const char *)(data + i + mlen);
> +
> +			strscpy(version_buf, found, sizeof(version_buf));

This strscpy can exceed the extent of the data buffer here because the
bounds check is the sizeof(version_buf) and all you've bounds checked is
the start of the string not its extent by this point.

found = data + 2 + mlen - strscpy copies from data+2 to data+64 which is an
overflow.

> +			if (!strncmp(version_buf, "vfw", 3))
> +				return true;
> +			if (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
> +			    major >= 2)
> +				return true;
> +			break;

Right so it is valid to find maker only once with this break

> +		}
> +	}
> +
> +	return false;
> +}

const char * const marker = "QC_IMAGE_VERSION_STRING=";
const char * const terminator = data + size;
size_t marker_len = strlen(marker);
size_t marker_off;
char *fat_buf;
char *version;
bool ret = false;

version = strnstr(data, marker, size);
if (version) {
	marker_off = version - data;
	version += marker_len;
	size -= marker_off + marker_len;

	if (version < terminator-3) {
		/* This is safe because we bounds check */
		if (strncmp("vfw", version, size) == 0)
			return true;
	}

	/* To do your sscanf() you need to create a zeorised buffer */
	fat_buf = kzalloc(size+1, GFP_KERNEL);
	if (!fat_buf)
		return false;

	memcpy(fat_buf, version, size);

	/* sscanf is now guaranteed to terminate on NULL */
	if (sscanf(fat_buf, "video-firmware.%d.%d", &major, &minor) == 2) {
		if (major >= 2) {
			ret = true;
			goto free_mem;
		}
	}
}

free_mem:
	if (fat_buf)
		kfree(fat_buf);
	return ret;

> +
> +static const struct firmware *iris_detect_firmware(struct iris_core *core,
> +						   const char **fw_name)
> +{
> +	const struct firmware *firmware;
> +	bool has_both_gens;
> +	int ret;
> +
> +	*fw_name = NULL;
> +	if (core->iris_platform_data->firmware_desc_gen2)
> +		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
> +	else if (core->iris_platform_data->firmware_desc_gen1)
> +		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> +	else
> +		return ERR_PTR(-EINVAL);
> +
> +	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> +		core->iris_platform_data->firmware_desc_gen1;
> +
> +	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> +	if (ret) {
> +		*fw_name = core->iris_firmware_desc->fwname;
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret && has_both_gens) {
> +			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> +			*fw_name = core->iris_firmware_desc->fwname;
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +
> +		return ret ? ERR_PTR(ret) : firmware;
> +	}
> +
> +	ret = request_firmware(&firmware, *fw_name, core->dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (has_both_gens &&
> +	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
> +		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
> +		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> +	}
> +
> +	return firmware;
> +}
> +
> +static int iris_load_fw_to_memory(struct iris_core *core)
>  {
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = core->dev;
>  	struct resource res;
>  	phys_addr_t mem_phys;
> +	const char *fw_name;
>  	size_t res_size;
>  	ssize_t fw_size;
>  	void *mem_virt;
>  	int ret;
>  
> -	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> -		return -EINVAL;
> -
>  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
> @@ -37,9 +112,11 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	mem_phys = res.start;
>  	res_size = resource_size(&res);
>  
> -	ret = request_firmware(&firmware, fw_name, dev);
> -	if (ret)
> -		return ret;
> +	firmware = iris_detect_firmware(core, &fw_name);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
> +
> +	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	fw_size = qcom_mdt_get_size(firmware);
>  	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -66,18 +143,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  int iris_fw_load(struct iris_core *core)
>  {
>  	const struct tz_cp_config *cp_config;
> -	const char *fwpath = NULL;
>  	int i, ret;
>  
> -	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> -					    &fwpath);
> -	if (ret)
> -		fwpath = core->iris_firmware_desc->fwname;
> -
> -	ret = iris_load_fw_to_memory(core, fwpath);
> +	ret = iris_load_fw_to_memory(core);
>  	if (ret) {
> -		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		dev_err(core->dev, "firmware download failed %d\n", ret);
> +		return ret;
>  	}
>  
>  	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -99,7 +170,7 @@ int iris_fw_load(struct iris_core *core)
>  		}
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 0408d51188b27251986780de6b4672b155ab1005..7acb073f719746f57ebaa2afd9061db9239f860e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -257,11 +257,7 @@ struct iris_firmware_desc {
>  };
>  
>  struct iris_platform_data {
> -	/*
> -	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> -	 * supporting both firmware kinds.
> -	 */
> -	const struct iris_firmware_desc *firmware_desc;
> +	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
>  
>  	const struct vpu_ops *vpu_ops;
>  	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 00d6244bc92fd9216bd7c0e6153689e7d8982a67..8259709ba203eac2230da3048166b33892b337b2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -22,6 +22,12 @@ const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
>  };
>  
> +const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> +};
> +
>  const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
>  };
>  
>  const struct iris_platform_data sc7280_data = {
> -	.firmware_desc = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
>  };
>  
>  const struct iris_platform_data sm8250_data = {
> -	.firmware_desc = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 6180104f3b94bf0d5e3206481816802fbd09849d..829dc37b4058101e7dddd484533724272b502560 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -83,7 +83,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>   * - inst_caps to platform_inst_cap_qcs8300
>   */
>  const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -112,7 +112,7 @@ const struct iris_platform_data qcs8300_data = {
>  };
>  
>  const struct iris_platform_data sm8550_data = {
> -	.firmware_desc = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -147,7 +147,7 @@ const struct iris_platform_data sm8550_data = {
>   * - controller_rst_tbl to sm8650_controller_reset_table
>   */
>  const struct iris_platform_data sm8650_data = {
> -	.firmware_desc = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu33_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -178,7 +178,7 @@ const struct iris_platform_data sm8650_data = {
>  };
>  
>  const struct iris_platform_data sm8750_data = {
> -	.firmware_desc = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu35_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index dbc15edc602b72fdec8bb2d8d3623676afee728c..89426ed42facca7729c987c5b283d11e862e4fe1 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>  	if (IS_ERR(core->ubwc_cfg))
> @@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	iris_session_init_caps(core);
> -
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 807c9a20b6ba17fdda8e7e91956bdf19e83a3ad8..6fbc20366f5fd3a80468d90d813851ecf54e4cef 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> +#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"
> @@ -196,6 +197,8 @@ int iris_open(struct file *filp)
>  		goto fail_m2m_release;
>  	}
>  
> +	iris_session_init_caps(core);
> +
>  	if (inst->domain == DECODER)
>  		ret = iris_vdec_inst_init(inst);
>  	else if (inst->domain == ENCODER)
> 
> -- 
> 2.34.1
> 
> 



