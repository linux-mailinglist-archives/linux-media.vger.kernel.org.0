Return-Path: <linux-media+bounces-63553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0h5COruH2pksgAAu9opvQ
	(envelope-from <linux-media+bounces-63553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:07:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A9D635FE9
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:07:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XfM3kdVz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63553-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63553-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B325304BE67
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D62A36BCDD;
	Wed,  3 Jun 2026 09:03:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC243403F8;
	Wed,  3 Jun 2026 09:03:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477411; cv=none; b=eEDWiV7FU+uwFVH241eVExktMW+Dy9Sh+7fbr0q8ui5GISveX/Rm1mCTU6lTvPOOZH/muOqS5agbMSaJqFnygaHrd/tG0vUgn1YXcEzSw2MRMbyyzb37UR2XfQeiYn4B2whx5X80NHlmbttdFdBSw+qucs5YZibvdeqkaiHhw8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477411; c=relaxed/simple;
	bh=Cn4HqPEzDSKR1VFwEsa1F7fqAGHoPRocDLTYVL+3LSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QNCm4nTx+aLVP2kxW2L4KK9MdGPQXJB4GfMLDJNzozKj9a21euig79G6vFspMqkYQz3sf46qlZ1ruMlyQw6Emki24bgWN22D9bdj+Sfa2SBTRIpgb2xq6GEM1AlFY8omzKMlLgFIUxvjAwD2B6cQemP5zSwyFSbuwWe9HUbv1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfM3kdVz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4B21F00893;
	Wed,  3 Jun 2026 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477410;
	bh=fhVQNZwpYP4K7hTWOnVpXeyvnNRq1RJzmb44ElB8KJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XfM3kdVz25wn30leUWbR/YQJVxUOr9LqMMvCxP2pl/TlFKUPOPQuV19T18WHrbxET
	 hYOL36JU+fewX+ySOSkROLkFPcr/eZFU/3q9Wnl1fKOu+XQzcm7zMfjK/DhyDlmlUe
	 UdjH6S+2SsdJ8hSYTDADxjyyl0XJ8ZGVTZLSTDWdj5qgzRp07ZNNBPX+P6z3qGHlb7
	 P8VXokCEvNsaBPB4D3cRUgKxWUnFHqN4T20WoVjP+yHS25k0nrlM2kw+qFUZeEC6nP
	 vcXYE2D+zcjgN30O/bssAjlil0drbrDwMJ/BpZmYTsrjxcyLMyNlUFb7hlWTyov2Ho
	 vrUMba2QiuAyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603084045.17488-12-kyrie.wu@mediatek.com>
References: <20260603084045.17488-12-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 09:03:29 +0000
Message-Id: <20260603090329.7C4B21F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mediatek.com:email,sashiko.dev:url];
	TAGGED_FROM(0.00)[bounces-63553-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60A9D635FE9

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] The VCP message queue processing thread uses the untrusted `ob=
j->id` directly as an array index without bounds checking, leading to out-o=
f-bounds memory access and potential arbitrary code execution.
- [High] The VCP message queue kthreads spawned during firmware load are le=
aked, leading to a fatal Use-After-Free kernel panic on driver unbind.
- [High] The `ipi_id_ack` array stores negative error codes into `bool` ele=
ments, truncating them to `1`, and is never reset on success, which breaks =
error handling and permanently poisons the IPC state.
- [Medium] The patch adds the MT8196 compatible string but completely omits=
 the corresponding hardware constraints mentioned in the commit message, br=
eaking device tree validation for this SoC.
--

commit f686f0ab8d134aa32615f005292674ee98cf9fb9
Author: Yunfei Dong <yunfei.dong@mediatek.com>

dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for mt8196

This commit adds the device tree binding compatible string for the MT8196
decoder. The commit message outlines hardware changes, including 12 clock
inputs, 2 power domains, and the use of VCP instead of SCP.

> The MT8196 decoder differs from previous generations in several
> key aspects, most notably in its use of VCP instead of SCP.
> Additionally, the MT8196 enhances codec capabilities by supporting
> HEVC Main10 profile decoding. To accommodate these hardware changes,
> the binding constraints specify a total of 12 clock inputs,
> consisting of 9 decoder clocks and 3 VCP interface clocks,
> along with 2 power domains covering both the decoder and VCP
> subsystems.

[Severity: Medium]
The commit message mentions that the binding constraints specify a total of=
 12
clock inputs, 2 power domains, and the use of VCP instead of SCP. However,
are these constraints actually added in this patch?

> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index bf8082d87ac03..74e1d88d30568 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec

Looking at the diff, it appears only the compatible string is added. The
required conditional blocks and property constraints for the clocks, power
domains, and the mediatek,vcp property seem to be missing. Would this cause
valid MT8196 device tree files to falsely fail schema validation?

I also have some questions regarding the VCP message queue handling in the
related C driver files.

In drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c:

[Severity: High]
Does this code leak the vcp_enc_msq_thread kthread?

mtk_vcodec_fw_vcp.c:mtk_vcodec_vcp_load_firmware() {
    ...
    kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_thread"=
);
    ...
}

It seems the task_struct pointer returned by kthread_run() is discarded, so
kthread_stop() cannot be called later in mtk_vcodec_vcp_release().

If the thread is leaked, could this lead to a use-after-free crash on driver
unbind? The leaked thread appears to block indefinitely on the waitqueue in=
side
the devres-managed fw->vcp struct:

mtk_vcodec_fw_vcp.c:mtk_vcodec_vcp_msg_process_thread() {
    ...
    ret =3D wait_event_interruptible(fw->vcp->msg_queue.wq,
                                   atomic_read(&fw->vcp->msg_queue.cnt) > 0=
);
    ...
}


[Severity: Critical]
Can an invalid firmware payload trigger an out-of-bounds memory access here?

mtk_vcodec_fw_vcp.c:mtk_vcodec_vcp_msg_process_thread() {
    ...
    mtk_vcodec_vcp_ipi_lock(fw->vcp, obj->id);
    handler =3D fw->vcp->ipi_desc[obj->id].handler;
    ...
    handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);
    ...
}

The obj->id value comes from the firmware IPC message payload. If this value
exceeds the VCP_IPI_MAX bound, it looks like it could directly index outside
the ipi_desc array, fetching an unvalidated function pointer and immediately
executing it. Should we add a bounds check for obj->id?


[Severity: High]
Are standard negative error codes truncated in this structure?

drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h:struct mt=
k_vcp {
    ...
    bool ipi_id_ack[VCP_IPI_MAX];
    ...
}

Because ipi_id_ack is declared as a boolean array, assigning negative error
codes to it will truncate them to 1 (true).

Additionally, it seems the flag is never reset to false on success:

mtk_vcodec_fw_vcp.c:mtk_vcodec_vcp_msg_ipi_send() {
    ...
    return vcp->ipi_id_ack[id];
}

If a single error or timeout sets this flag to true, won't all subsequent
successful IPC sends falsely report failure because they read the stale true
state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D11

