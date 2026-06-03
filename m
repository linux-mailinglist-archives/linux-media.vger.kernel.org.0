Return-Path: <linux-media+bounces-63548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cuiVJtTsH2r3sQAAu9opvQ
	(envelope-from <linux-media+bounces-63548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:59:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85B635EDE
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:58:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kw9+S6fW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63548-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63548-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85399301A91D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48E0408022;
	Wed,  3 Jun 2026 08:58:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319F402453;
	Wed,  3 Jun 2026 08:58:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477132; cv=none; b=lUeZNO/q7UzulWjDCsv5smJ8hgZqmBLDregcIZV4En1vg2f6Id77AzpVyXJXNEnagY/Q2CrfC1DQVmnGexZV1wraA6cvZbeO3B88bHAhWLTnQoFIv5Oc1ImfPFXldtep6C7R0DISVdGBNLUuh5G6t5O8KqrApkxeRp3zy09rhNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477132; c=relaxed/simple;
	bh=RRmgsr+/Ucs7yo3QcqE55nJgC6ix5tpCFR/cNzak9ho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JM+y0e0b9+nnSWCknlScBOH5CnKn8kpn6AINwN6mZcj8qiyrJZwG47UY/BYHa5Sef8pPtznY6Ub7MpIdOri2j2Vx4WG/XukVdPDo3yB4JIuDP0QzpLmVu8fb/s+NJBRPkBdiDvLu3k3t3D65pxw7RHI4exOpVGkripV8u9ct078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kw9+S6fW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969FC1F00893;
	Wed,  3 Jun 2026 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477130;
	bh=BNbwL43Qsz2CVMZ22XmUyYOvT+3Ab3Xbi5sCvX1on+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kw9+S6fW6C7GPrRrBgDrSfiRdJbbhpBlIJFdfplNpUl9us7YnX7JXRjFmkTXTniO6
	 Re3/zvUQ7XbnNbDxdEk2bRp9mgw/thwQPnvBsF2MWrPBRfF2aavF4ugppESu6NgqK7
	 AFQ5L6p6PMfwif/Sy77HlNCompXq1QyJMm8CEvuk7t3Oa1B9f/e3uwb0EIkeIcSFUA
	 L0IubhfEUU77YL6olmT294EPuzuGY/c19BVX1SU3Z8LbmmlhEOdgP6oawyKfwGWcgU
	 DWAfi4dN6kvwFR3ER6oioym/6LBFxvXU58oZnINJ+Z4TAxhGNXQb2J4GF/OMcssY0r
	 wZo2xe6KqyLtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/14] media: mediatek: vcodec: add driver to support
 vcp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603084045.17488-3-kyrie.wu@mediatek.com>
References: <20260603084045.17488-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:58:50 +0000
Message-Id: <20260603085850.969FC1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email,lists.linux.dev:replyto,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url];
	TAGGED_FROM(0.00)[bounces-63548-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE85B635EDE

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [Critical] The untrusted firmware-provided message ID is used directly as=
 an array index without bounds checking, enabling arbitrary out-of-bounds m=
emory accesses.
- [High] The Kconfig symbol MTK_VCP_RPROC used in a select statement does n=
ot exist in the kernel tree.
- [High] The driver fails to stop the message processing kthread, unregiste=
r the IPC mailbox, and unregister the notifier during module removal, leadi=
ng to a Use-After-Free and kernel panic.
- [High] Inverted logic in `check_vcp_loaded()` causes a 15-second busy-loo=
p and kernel log spam when the VCP driver is not loaded.
- [High] The kernel message processing thread permanently exits upon encoun=
tering an unregistered message ID, causing a Denial of Service for all subs=
equent IPC.
- [High] The per-IPI mutex for `VCP_IPI_CORE_DECODER` is never initialized,=
 leading to a kernel panic when locked.
- [High] Negative error codes are assigned to the boolean array `ipi_id_ack=
`, which truncates them to `true` (1) and silently masks IPC failures.
- [High] Failing to unwind previously registered callbacks on the error pat=
h in `mtk_vcodec_vcp_load_firmware` leaves dangling references.
- [High] A stale ACK from a timed-out IPC message can cause subsequent IPC =
messages to prematurely succeed without waiting.
- [Medium] Failure to create the IPC processing kthread is silently ignored.
- [Medium] The driver bus-spins the CPU with `mdelay(1)` while holding a mu=
tex, causing significant latency spikes.
- [Medium] The message processing kthread uses `wait_event_interruptible()`=
 without including `kthread_should_stop()` in the wake condition, guarantee=
ing a deadlock if `kthread_stop()` is called.
- [Medium] The VCP device handle is retrieved but never released, leaking t=
he reference.
- [Low] The code uses undefined macros and headers, guaranteeing compilatio=
n failure.
- [Low] Dead code in `mtk_vcodec_vcp_msg_ipi_send()` checks for impossible =
negative return values from `wait_event_timeout()`.
--

commit a24833f019af1320e17d5afbc734268e762b3e20
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: add driver to support vcp

The processor is changed from scp to vcp in mt8196 platform.
Adding new firmware interface to communicate kernel with vcp
for the communication method is changed.

> diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/med=
ia/platform/mediatek/vcodec/Kconfig
> index bc8292232530b..d23dad5c78ce3 100644
> --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> @@ -21,6 +24,7 @@ config VIDEO_MEDIATEK_VCODEC
>  	select V4L2_MEM2MEM_DEV
>  	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
>  	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> +	select VIDEO_MEDIATEK_VCODEC_VCP if MTK_VCP_RPROC

[Severity: High]
Does this select statement reference a missing config symbol? According to =
the
Kconfig subsystem guidelines, referencing a non-existent config symbol in a
select statement leaves the intended target unselectable or causes silent
failures. A search across the kernel tree shows that MTK_VCP_RPROC is never
defined.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> new file mode 100644
> index 0000000000000..2f3bfcd97958a
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -0,0 +1,505 @@
[ ... ]
> +#include <linux/remoteproc/mtk_vcp_public.h>
> +#include <linux/firmware/mediatek/mtk-vcp-ipc.h>

[Severity: Low]
Does the mtk_vcp_public.h header exist in the kernel tree? Relying on
undeclared headers will lead to direct build errors.

[ ... ]
> +static int mtk_vcodec_vcp_msg_process_thread(void *arg)
> +{
[ ... ]
> +	do {
> +		ret =3D wait_event_interruptible(fw->vcp->msg_queue.wq,
> +					       atomic_read(&fw->vcp->msg_queue.cnt) > 0);

[Severity: Medium]
Will this wait condition prevent the kthread from properly stopping if
kthread_stop() is called during driver unload? Since kthread_should_stop()
is not included in the wait condition, waking the thread for teardown could
cause it to immediately go back to sleep.

[ ... ]
> +		obj =3D &msg_node->ipi_data;
> +		msg =3D (struct vdec_vpu_ipi_ack *)obj->share_buf;
[ ... ]
> +		mtk_vcodec_vcp_ipi_lock(fw->vcp, obj->id);
> +		handler =3D fw->vcp->ipi_desc[obj->id].handler;

[Severity: Critical]
Can this code cause an out-of-bounds memory access? The untrusted
firmware-provided obj->id is used directly as an array index without bounds
checking. A compromised or buggy firmware returning an ID >=3D VCP_IPI_MAX
could cause the kernel to access arbitrary memory.

> +		if (!handler) {
> +			dev_err(&fw->pdev->dev, "invalid ack ipi handler id =3D %d\n", obj->i=
d);
> +			mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +			return -EINVAL;
> +		}

[Severity: High]
Should this return -EINVAL instead be a continue? Returning an error here
aborts the while loop and permanently terminates the kthread context. All
subsequent VCP IPC messages will time out, completely breaking the decoder
until the driver is reloaded.

[ ... ]
> +static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id,=
 void *buf,
> +				       unsigned int len, unsigned int wait)
> +{
> +	struct mtk_vcp *vcp =3D fw->vcp;
[ ... ]
> +	mutex_lock(&vcp->ipi_mutex);
> +	feature_id =3D VDEC_FEATURE_ID;
> +	mailbox_id =3D IPI_OUT_VDEC_1;
> +
> +	timeout_jiffies =3D jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);

[Severity: Low]
Is VCP_SYNC_TIMEOUT_MS defined anywhere in the kernel tree? Relying on an
undeclared macro will cause compilation failures.

> +	while (!vcp_device->ops->vcp_is_ready(feature_id)) {
> +		if (time_after(jiffies, timeout_jiffies)) {
> +			vcp->ipi_id_ack[id] =3D -EINVAL;

[Severity: High]
Does assigning a negative error code to ipi_id_ack mask IPC failures?
Because ipi_id_ack is defined as a boolean array in struct mtk_vcp,
negative error codes like -EINVAL will truncate to true (1). Since the
function returns this value at the end, callers expecting standard negative
error codes might incorrectly assume the IPC succeeded.

> +			ret =3D -EINVAL;
> +			goto error;
> +		}
> +		mdelay(1);
> +	}

[Severity: Medium]
Is it safe to use mdelay(1) in a loop while holding a mutex? Because the
code holds vcp->ipi_mutex, it is in a sleepable context. Using mdelay() here
bus-spins the CPU for up to the timeout duration, wasting CPU cycles and
causing significant latency spikes.

[ ... ]
> +wait_ack:
> +	/* wait for VCP's ACK */
> +	ret =3D wait_event_timeout(*msg_wq, *msg_signaled, msecs_to_jiffies(IPI=
_TIMEOUT_MS));
> +	if (!ret || retry_cnt > 5) {
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +		dev_err(&fw->pdev->dev, "wait ipi ack timeout! %d %d\n", ret, vcp->ipi=
_id_ack[id]);
> +	} else if (ret =3D=3D -ERESTARTSYS) {
> +		dev_err(&fw->pdev->dev, "wait ipi ack err (%d)\n", vcp->ipi_id_ack[id]=
);
> +		retry_cnt++;
> +		goto wait_ack;
> +	} else if (ret < 0) {
> +		dev_err(&fw->pdev->dev, "wait ipi ack fail ret %d %d\n", ret, vcp->ipi=
_id_ack[id]);
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +	}

[Severity: Low]
Are the checks for -ERESTARTSYS and negative return values dead code?
wait_event_timeout() strictly returns a positive value (remaining jiffies)
or 0 (timeout). It never returns negative error codes.

[ ... ]
> +	*msg_signaled =3D false;
> +	mutex_unlock(&vcp->ipi_mutex);

[Severity: High]
Should msg_signaled be cleared before sending the IPC message instead of
after? If a previous IPC request times out, and the firmware delivers a late
ACK, the ISR sets the flag to true. The next call to send a message would
then see the flag as already true and return immediately without waiting,
potentially reading stale data.

[ ... ]
> +static int check_vcp_loaded(struct mtk_vcodec_fw *fw)
> +{
> +	struct device *dev =3D &fw->pdev->dev;
> +	struct device_driver *drv;
> +
> +	drv =3D driver_find("mtk-vcp", &platform_bus_type);
> +	if (!drv) {
> +		dev_err(dev, "find mtk-vcp driver failed, need to reload.");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_get_vcp_device(struct mtk_vcodec_fw *fw)
> +{
> +	struct device *dev =3D &fw->pdev->dev;
> +	int retry =3D 0, retry_cnt =3D 10000;
> +	phandle vcp_phandle;
> +
> +	while (try_then_request_module(check_vcp_loaded(fw), "mtk-vcp")) {
> +		if (++retry > retry_cnt) {
> +			dev_err(dev, "failed to load mtk-vcp module");
> +			return -EPROBE_DEFER;
> +		}
> +		usleep_range(1000, 2000);
> +	}

[Severity: High]
Does this loop inadvertently busy-wait based on an inverted condition?
check_vcp_loaded() returns -EINVAL when the driver is not found.
try_then_request_module() evaluates non-zero values as true. Consequently,
if the driver is missing, this evaluates as true, skipping the module reque=
st
and keeping the while loop running for up to 10,000 iterations while floodi=
ng
the kernel log.

[ ... ]
> +	fw->vcp->vcp_device =3D mtk_vcp_get_by_phandle(vcp_phandle);
> +	if (!fw->vcp->vcp_device) {
> +		dev_err(dev, "get vcp device failed\n");
> +		return -ENODEV;
> +	}

[Severity: Medium]
Is the reference acquired by mtk_vcp_get_by_phandle() ever released?
APIs retrieving a device by phandle increment the reference count, but there
is no corresponding put operation in the teardown or release code, which
permanently pins the remote processor driver in memory.

[ ... ]
> +static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
> +{
[ ... ]
> +	ret =3D mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_i=
d,
> +					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
[ ... ]
> +	fw->vcp->vcp_notify.notifier_call =3D mtk_vcodec_vcp_notifier;
> +	fw->vcp->vcp_notify.priority =3D 1;
> +	vcp_device->ops->vcp_register_notify(feature_id, &fw->vcp->vcp_notify);
> +
> +	if (!fw->vcp->is_register_done) {
> +		ret =3D vcp_device->ops->vcp_register_feature(vcp_device, feature_id);
> +		if (ret < 0) {
> +			dev_err(&fw->pdev->dev, "%d register to vcp fail(%d)\n", feature_id, =
ret);
> +			return -EINVAL;
> +		}

[Severity: High]
Should the error path deregister the IPC mailbox and notifier?
Returning directly leaves dangling pointers in the remote processor subsyst=
em
pointing to the driver's memory, which could cause a use-after-free.

> +		fw->vcp->is_register_done =3D true;
> +	}
> +
> +	fw->vcp->is_init_done =3D true;
> +
> +	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
> +	mutex_init(&fw->vcp->ipi_mutex);

[Severity: High]
Is the per-IPI mutex for VCP_IPI_CORE_DECODER initialized anywhere?
Here, ipi_id is hardcoded to VCP_IPI_LAT_DECODER (0). If the core decoder
attempts to register or process an IPI message, it will lock an uninitializ=
ed
mutex.

> +	kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_thread=
");

[Severity: Medium]
Should the return value of kthread_run() be verified? If thread creation
fails, the driver will complete initialization successfully but permanently
hang on the first IPC communication because no thread exists to process ACK=
s.

[ ... ]
> +static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
> +{
> +	struct mtk_vcp_device *vcp_device =3D fw->vcp->vcp_device;
> +	struct device *dev =3D &fw->pdev->dev;
> +	int ret, feature_id;
> +
> +	if (!fw->vcp->vcp_device) {
> +		dev_err(dev, "vcp device is null\n");
> +		return;
> +	}
> +
> +	if (!fw->vcp->is_register_done)
> +		return;
> +
> +	feature_id =3D VDEC_FEATURE_ID;
> +	ret =3D vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATUR=
E_ID);
> +	if (ret < 0) {
> +		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", feature_id, ret);
> +		return;
> +	}
> +
> +	fw->vcp->is_register_done =3D false;
> +}

[Severity: High]
Does this release function adequately stop the kthread, unregister the IPC
mailbox, and unregister the notifier? When the driver is unbound and the
devm_kzalloc managed memory is freed, the still-running kthread and remote
callbacks will access freed memory, causing a kernel panic.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> new file mode 100644
> index 0000000000000..1072c37078f42
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
[ ... ]
> +struct mtk_vcp {
[ ... ]
> +	struct mtk_vcp_ipi_desc ipi_desc[VCP_IPI_MAX];
> +	bool ipi_id_ack[VCP_IPI_MAX];

[Severity: High]
Should ipi_id_ack be an integer type instead of a bool?
The code assigns negative error constants to this array upon failure.
Those non-zero values truncate to true (1), masking any IPC errors and
preventing callers from receiving accurate error codes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D2

