Return-Path: <linux-media+bounces-63626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +7/pM+dFIGpEzwAAu9opvQ
	(envelope-from <linux-media+bounces-63626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:19:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA18E639109
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:19:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DVUiDpun;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63626-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63626-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C6F530A3515
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5351391855;
	Wed,  3 Jun 2026 14:39:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0018346A1E;
	Wed,  3 Jun 2026 14:39:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497565; cv=none; b=TsYPl63uiVyLo12QvW/wjM8LWlprrXKXOVEkiS5k2BA157B8emZUbCUVjDBn8/oHC6SVIdkLq4kr2K0jNdU7eYOBZtPcFqskrym3Lz1IOGbazQJrIjMiCEqhZybJvMXSyg4kLkw95Pc0HoxVk53jeuv0KXPr1hbqQYI2E5BwWWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497565; c=relaxed/simple;
	bh=F37+84OPHLgri3lzv/+vjUaGfjeQZRQhdnN8AYEzO2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XZ1ujgA/tzEIdhLPydSP5YHddfjmu67g5vkqm2wYtgMZDXgPrRClWtjHbjeV51KYIZ+qYI96DgkkMBAc9TpBKthiNg9Br6frwakLuv7SD4UrQeryki8AcU6xpxT+dJtA/1vyY8zfIomPjSVd+Bzrn4SwGdwkTdEx+3kNMP+Zos0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVUiDpun; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E1E1F00893;
	Wed,  3 Jun 2026 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497563;
	bh=kmImnxP6p8j/9w7MJ2J14WM4Q/TEsNPPlUi1alFraKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DVUiDpunh30RZwYt0895qeC6EIg8TmxLOOoy6Twot3GWBGGAdTBepUUL8XAR7zR6F
	 w9/E+P5m2+h3D3dtA/MwIHLjeeE+og5MZLigfEi1NCUQAZjTElGhUytze6ZzLxUvc/
	 IZzG5O7dxIQTBuk9UNDzaTaMrzcPZcXs1WxY+49IrXv6evX4HK2XVLtEddHjcrhItF
	 H68Z851VBv1uYhDkjljUbaZRthR90STscY+25AVwmEjy10f6Kx8nklnKk+3xEm1T49
	 F3XKnyeavzUjY30PmYhiWfqLzboCNJqDOKrE15nU6mU5bvklMq0DnqRxs1WzreOthP
	 OxeEhbiEo2i7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:39:22 +0000
Message-Id: <20260603143923.58E1E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sashiko.dev:url,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid];
	TAGGED_FROM(0.00)[bounces-63626-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA18E639109

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a =
memory leak during repeated iris_core_init failures.
- [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_pro=
tect_video_var error path.
- [High] PAS metadata memory is permanently leaked upon every firmware load.
- [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shu=
tdown() fails, leaking the IOMMU mapping.

Pre-existing issues:
- [High] The sys_error_handler delayed work is never canceled during driver=
 removal, risking use-after-free and locking crashes.
--

commit 85711dbb43a8f02c3f39064784fe37381f80c2c5
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

media: iris: Enable Secure PAS support with IOMMU managed by Linux

On platforms without a hypervisor, Linux drives the firmware loading and
authentication steps directly. This commit extends the Iris driver to suppo=
rt
Secure Peripheral Authentication Service (PAS) on such platforms by creating
the firmware context device and mapping the IOMMU when the firmware device
SID is present.

Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@=
oss.qualcomm.com/

> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index 1a476146d7580..8bdc9273036ce 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c

[ ... ]

> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *c=
ore, const char *fw_name)
>  	if (strlen(fw_name) >=3D MAX_FIRMWARE_NAME_SIZE - 4)
>  		return -EINVAL;
> =20
> -	ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	ret =3D of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
> =20
>  	mem_phys =3D res.start;
>  	res_size =3D resource_size(&res);
> =20
> -	ret =3D request_firmware(&firmware, fw_name, dev);
> +	pas_ctx =3D devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_ph=
ys, res_size);

[Severity: High]
Does this unconditional devm_qcom_scm_pas_context_alloc() cause a memory le=
ak
during repeated iris_core_init() failures?

If a subsequent step in the firmware load fails (e.g., request_firmware()
returning an error), iris_core_init() returns an error, but the device rema=
ins
bound.

Because iris_core_init() is called upon opening the V4L2 device, userspace
could repeatedly open the device, failing each time and allocating a new
pas_ctx without freeing the previous one.

> +	if (IS_ERR(pas_ctx))
> +		return PTR_ERR(pas_ctx);
> +
> +	ret =3D request_firmware(&firmware, fw_name, fw_dev);
>  	if (ret)
>  		return ret;

[ ... ]

> @@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
>  	ret =3D iris_load_fw_to_memory(core, fwpath);
>  	if (ret) {
>  		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		return ret;
>  	}
> =20
> -	ret =3D qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret =3D qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);

[Severity: High]
Does this permanently leak the PAS metadata memory upon every successful
firmware load?

qcom_mdt_pas_load() delegates to qcom_scm_pas_init_image(), which allocates
DMA or TZ memory for the firmware metadata (ELF header and hashes).

The SCM API requires the caller to free this memory using
qcom_scm_pas_metadata_release() once authentication is complete.=20

It appears the iris driver never invokes this release function.

>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> -		return ret;
> +		goto err_unmap;
>  	}
> =20
>  	for (i =3D 0; i < core->iris_platform_data->tz_cp_config_data_size; i++=
) {

[ ... ]

> @@ -95,16 +133,31 @@ int iris_fw_load(struct iris_core *core)
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret=
);
>  			qcom_scm_pas_shutdown(IRIS_PAS_ID);
> -			return ret;
> +			goto err_pas_shutdown;
>  		}
>  	}
> =20
> +	return 0;
> +
> +err_pas_shutdown:
> +	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);

[Severity: High]
Does this result in a double invocation of qcom_scm_pas_shutdown() on the
qcom_scm_mem_protect_video_var() error path?

The code calls qcom_scm_pas_shutdown(IRIS_PAS_ID) explicitly before jumping=
 to
the err_pas_shutdown label, which calls qcom_scm_pas_shutdown() again.

Since core->pas_ctx->pas_id is initialized to IRIS_PAS_ID, this results in =
the
shutdown function being called twice consecutively for the same PAS ID, whi=
ch
could trigger TrustZone errors or corrupt Secure Monitor state.

> +err_unmap:
> +	iris_fw_iommu_unmap(core);
> +
>  	return ret;
>  }
> =20
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
> +	int ret;
> +
> +	ret =3D qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Will this early return skip the required IOMMU unmap logic if
qcom_scm_pas_shutdown() fails?

Since the caller (iris_core_deinit()) ignores the return value of
iris_fw_unload(), the driver proceeds with teardown while permanently leaki=
ng
the firmware's IOMMU IOVA mapping.

Software resource cleanup should likely continue even if a hardware/SCM
command fails.

> +
> +	iris_fw_iommu_unmap(core);
> +
> +	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but I noticed that the sys_error_handler dela=
yed
work is never canceled during driver removal.

Looking at iris_remove() in drivers/media/platform/qcom/iris/iris_probe.c:

static void iris_remove(struct platform_device *pdev)
{
    ...

The driver initializes core->sys_error_handler on a delayed workqueue in
iris_probe(), but iris_remove() unregisters devices and destroys core->lock
without calling cancel_delayed_work_sync(&core->sys_error_handler).

If the delayed work executes concurrently with or after iris_remove(), will=
 it
access freed driver state and attempt to acquire the destroyed mutex, leadi=
ng
to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-glymur-v7-=
0-afaa55d11fe0@oss.qualcomm.com?part=3D5

