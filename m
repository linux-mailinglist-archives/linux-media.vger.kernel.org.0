Return-Path: <linux-media+bounces-63086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFbLKrszGmp+2AgAu9opvQ
	(envelope-from <linux-media+bounces-63086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:47:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5298660A51B
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7CF9305D6D2
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591952DE70D;
	Sat, 30 May 2026 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9agvUeX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936472609FD;
	Sat, 30 May 2026 00:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101999; cv=none; b=QO/owEopn/HA2FdMcKbFYFl9Bupn1whDDtHln/OUYp4a4XjX/ClVeAdQUQhiPaUCdHHol/ZRr/TlqRTFZ76sZV7z+IWhAAde6gQWOshaXUVjcmznhdUO8MZtOkmkzRXwlha1E7ftzF3qeKsNLwsP1aQsDPg+FhJIHndpwCO0yCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101999; c=relaxed/simple;
	bh=xeALcogLvquJ6l0GoaR8WqRSywS1wBFAZcBuOqvSBy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BdVHzSbHTGNhoEmgJP7Q2wQ3+c50jgyGKNzCjo/0puI2nNXlDgoDxoLOPW6N9LNsoqt6Pk3xQqevn6ItBxhc5UE2dnpUekeYiSJQvfR5nU7EFfMHSpzElXQ2aG+oTgasSo8Tkji8pUvrYdBnnrvYLPt+ec3J1dJqxv8cQQSX7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9agvUeX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AF41F00893;
	Sat, 30 May 2026 00:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101998;
	bh=Y3nf6nHfH8VCGutgDWAoeSXIMeobYGLGtitEMjipkuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k9agvUeXecE5uEaAhufYWPGsSzNEldXeOJzwPucHE1//HaEOMDklg5oOJU6dILYT9
	 hmGfBJOKDgzpoXXxZvIK6DJ6yjjANeLipd7hM+GpXOaN5P9B30H6KmxH9OpR7P9ZP3
	 3wkpjZEWwc1MOOxfLgaHVP+M+xnGIMAJID/fbmBpdc/u1WUIRukr8Rf0ebqOtBRbAe
	 hZ+oqIk23H/4nwX2iqtNhAJZReXXiRBdIbg+1b0ZXiL79o08LrHog1eMvXMqru5Ivq
	 Ip8IQ3n6N1/qLivOOTPNfhRuYA8d6LDbM/7rwSqke/7u0t/utUuODvYWiAg/OfecCP
	 Kf2FdWe/lWvcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/15] firmware: qcom: Add a PAS TEE service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260522115936.201208-5-sumit.garg@kernel.org>
References: <20260522115936.201208-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:37 +0000
Message-Id: <20260530004638.35AF41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63086-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: 5298660A51B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Kernel heap buffer overflow in `qcom_pas_tee_get_rsc_table` wh=
en copying the input resource table if the TA returns a smaller size than `=
input_rt_size`.
- [High] Out-of-bounds read in `qcom_pas_tee_get_rsc_table` when duplicatin=
g the output resource table if the TA returns a larger size than the alloca=
ted buffer.
- [High] `qcom_pas_tee_get_rsc_table` incorrectly handles the TEE size quer=
y semantics, ensuring the operation will always fail.
- [High] Unprotected mutation of the global static `qcom_pas_ops_tee` struc=
ture during probe leads to state corruption.
- [High] Calling `memcpy` with a NULL pointer and leaking uninitialized ker=
nel memory to the TEE in `qcom_pas_tee_get_rsc_table`.
- [High] Lack of synchronization during driver removal causes a Use-After-F=
ree in active PAS operations.
- [High] TEE shared memory allocated for metadata is permanently leaked if =
the driver unbinds before metadata release.
- [High] `qcom_pas_tee_probe` ignores registration failures, potentially br=
eaking other PAS backends upon unload.
- [High] TOCTOU race in `qcom_pas_ops_register` allowing concurrent registr=
ations to silently overwrite each other.
- [High] Lockless access to `ops_ptr` in PAS API allows TOCTOU and Use-Afte=
r-Free if the backend unregisters concurrently.
--

commit c2c7ee05cef157ede957dcc207ab0044f9b4fa4a
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
firmware: qcom: Add a PAS TEE service

Add support for Peripheral Authentication Service (PAS) driver based
on TEE bus with OP-TEE providing the backend PAS service implementation.
The TEE PAS service ABI is designed to be extensible with additional API.

> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom=
/qcom_pas_tee.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas_tee.c
[ ... ]
> +static int qcom_pas_tee_init_image(struct device *dev, u32 pas_id,
> +				   const void *metadata, size_t size,
> +				   struct qcom_pas_context *ctx)
> +{
[ ... ]
> +	if (ctx)
> +		ctx->ptr =3D (void *)mdata_shm;
> +	else
> +		tee_shm_free(mdata_shm);
> +
> +	return ret;
> +}

[Severity: High]
Is there a scenario where this memory is permanently leaked?

The memory stored in ctx->ptr is normally freed by
qcom_pas_tee_metadata_release(). If the driver is unbound,
qcom_pas_ops_unregister() clears the subsystem ops_ptr, turning subsequent
qcom_pas_metadata_release() calls in the core into no-ops.

Because qcom_pas_tee_remove() does not clean up active contexts, does this
leave the tee_shm buffer and its TEE context references permanently allocat=
ed?

> +static void *qcom_pas_tee_get_rsc_table(struct device *dev,
> +					struct qcom_pas_context *ctx,
> +					void *input_rt, size_t input_rt_size,
> +					size_t *output_rt_size)
> +{
[ ... ]
> +	ret =3D tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret !=3D 0) {
> +		dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err: 0x%x\n",
> +			ctx->pas_id, ret, inv_arg.ret);
> +		return ret ? ERR_PTR(ret) : ERR_PTR(-EINVAL);
> +	}

[Severity: High]
Does this logic correctly handle the TEE Client API semantics for size quer=
ies?

According to GlobalPlatform TEE Client API specifications, if a TA requires=
 a
larger buffer during a size query, it updates the size field and returns
TEEC_ERROR_SHORT_BUFFER.

Since this code treats any non-zero return code as a fatal error, will it
abort the operation instead of proceeding to the second pass to allocate
the required buffer?

> +	if (param[1].u.memref.size) {
> +		struct tee_shm *rt_shm __free(shm_free) =3D
> +			tee_shm_alloc_kernel_buf(data->ctx,
> +						 param[1].u.memref.size);
[ ... ]
> +		rt_shm_va =3D tee_shm_get_va(rt_shm, 0);
> +		if (IS_ERR(rt_shm_va)) {
> +			dev_err(dev, "rt_shm get VA failed\n");
> +			return ERR_CAST(rt_shm_va);
> +		}
> +		memcpy(rt_shm_va, input_rt, input_rt_size);

[Severity: Critical]
Can this memcpy() overflow the newly allocated rt_shm buffer?

If a compromised or buggy Trusted Application returns a required size stric=
tly
smaller than input_rt_size in the first pass, param[1].u.memref.size will be
smaller than input_rt_size. Copying input_rt_size bytes would then write
past the bounds of the allocated kernel buffer.

[Severity: High]
What happens if input_rt is NULL and input_rt_size is 0?

In that scenario, memcpy() is called with a NULL pointer, which is undefined
behavior in C.

Additionally, if the TA requests a size greater than input_rt_size, the
remainder of the allocated rt_shm_va buffer remains uninitialized. Could th=
is
leak uninitialized kernel memory to the TEE when it is passed as an INOUT
parameter?

> +		param[1].u.memref.shm =3D rt_shm;
> +		ret =3D tee_client_invoke_func(data->ctx, &inv_arg, param);
[ ... ]
> +		if (param[1].u.memref.size) {
> +			*output_rt_size =3D param[1].u.memref.size;
> +			rt_buf =3D kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);

[Severity: High]
Could this kmemdup() cause an out-of-bounds read?

After the second TA invocation, the TA can update param[1].u.memref.size. If
the TA returns a size larger than the initially allocated rt_shm buffer bou=
nds,
using this updated size in kmemdup() will read past the end of the mapping.

> +static struct qcom_pas_ops qcom_pas_ops_tee =3D {
> +	.drv_name		=3D "qcom-pas-tee",
[ ... ]
> +static int qcom_pas_tee_probe(struct tee_client_device *pas_dev)
> +{
[ ... ]
> +	data->session_id =3D sess_arg.session;
> +	dev_set_drvdata(dev, data);
> +	qcom_pas_ops_tee.dev =3D dev;

[Severity: High]
Can mutating this global static structure during probe lead to state corrup=
tion?

If multiple instances probe or if the device is bound and unbound, this glo=
bal
state is overwritten. A second bound instance will overwrite the .dev point=
er
of the active registered instance.

Could subsequent PAS operations on the original instance then use the wrong
device context or a freed device pointer?

> +	qcom_pas_ops_register(&qcom_pas_ops_tee);
> +
> +	return ret;
> +}

[Severity: High]
Should probe fail if qcom_pas_ops_register() fails?

qcom_pas_ops_register() silently rejects registration if another backend li=
ke
SCM is already registered, but qcom_pas_tee_probe() ignores this and reports
success.

If the TEE driver is loaded while SCM is active, it will probe successfully
without owning the PAS subsystem. Upon unload, qcom_pas_tee_remove() will
unconditionally call qcom_pas_ops_unregister(), breaking the legitimately
active SCM backend.

[Severity: High]
Is qcom_pas_ops_register() safe against concurrent registrations?

The generic PAS service checks if (!qcom_pas_is_available()) locklessly bef=
ore
calling smp_store_release(&ops_ptr, ops). If two backends call this
concurrently, both can read ops_ptr as NULL and pass the check.

This allows the second caller to overwrite the first registration without
raising an error.

> +static void qcom_pas_tee_remove(struct tee_client_device *pas_dev)
> +{
> +	struct device *dev =3D &pas_dev->dev;
> +	struct qcom_pas_tee_private *data =3D dev_get_drvdata(dev);
> +
> +	qcom_pas_ops_unregister();

[Severity: High]
Can the lockless design of the PAS API cause a use-after-free here?

The exported PAS API functions check if (!ops_ptr) locklessly before calling
operations like ops_ptr->init_image(). If qcom_pas_ops_unregister() is call=
ed
concurrently during module unload, setting ops_ptr to NULL, an active caller
could dereference the NULL pointer or access the backend's dev while it is
being freed via devres.

> +	tee_client_close_session(data->ctx, data->session_id);
> +	tee_client_close_context(data->ctx);
> +}

[Severity: High]
Does this remove sequence need to synchronize with ongoing PAS callbacks?

The driver does not wait for ongoing PAS callbacks to complete before
unregistering the PAS operations and closing the TEE session.

An inflight operation like qcom_pas_tee_auth_and_reset() can still be
executing when remove() returns. When devres frees data, the active callback
could dereference a dangling pointer and attempt to use a closed TEE contex=
t.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D4

