Return-Path: <linux-media+bounces-63167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ8RKjfYG2qnGgkAu9opvQ
	(envelope-from <linux-media+bounces-63167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:41:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 214D5614B73
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10B63301452E
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 06:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7A83264EF;
	Sun, 31 May 2026 06:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8fBHx7P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C754548EE
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780209640; cv=none; b=KJ8CX3WlBPCy+CtcQ4lSkIZzH+D4d7uoExkAi908egtXybNTsSz65eK7h9I6ZMD73ZzSP3vYtOuLM9+KhZUHZrCRGEAWTfu37I8C2REjKPehFIDdv4DhKbtdVUBafgGx4SgmiDisBEDR7/xWMgROpPD+8nazOmj+eGNZOVU1sMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780209640; c=relaxed/simple;
	bh=3YRpr4zcdDYRrh2mbCu/WjuAiD3hcnylEw1giqWnKOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LNFuein1qwmvBLs0ayiDskJ6dtsX4ubDypw/79I7W655rRqN6awGyJMC4MMIF41YOOk6REtfcUW0XdCnvr4ThogN8yvVItH43REZtusDaskMhFWvqSk9jWyNcPdzEdKVjXXczdIXRqJNVqJpExf+Tyicq+k17bSJRx+LHtPk0fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8fBHx7P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9261F00893;
	Sun, 31 May 2026 06:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780209638;
	bh=tjIEMkdkMhi9EsGwYAQ4IaM/acj85fa4WFQ0ICG/t8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K8fBHx7PJ99tIU4kp1HfpSzccaN/W5/6xFBsh5CmId0ZN4Ci3TkA0jL/mwVhelplu
	 mIrl5kYwTke6NvXADPQO3JKBVoAPGmNTtsA1sNo/5/u+GlN1VqZFZ8DherFzEUcwiz
	 e7QalTqOhCwQMqsfOY7m2gJSiKrjtqlMzCCPcYzB/DLe8BUHFfCRmEfoyPnV21O/ru
	 wc+FUoPU+SgTJ7k9fz/dOx+Geo/TrbllfnnkUrTYptYSZFebb/J3GOFrqFVdCqIN5T
	 e06ppZqFrHp3Kpk+/WXDTG0YV9KnIeW1vPaJOnhZCdBzNOib+g02UpaXHvXsq6QusO
	 Nwy+uqMK1hHOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260531-iris-code-improvement-v3-7-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-7-4c699c3dd719@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 06:40:38 +0000
Message-Id: <20260531064038.AC9261F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63167-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	URIBL_MULTI_FAIL(0.00)[sashiko.dev:server fail,lists.linux.dev:server fail,smtp.kernel.org:server fail,qualcomm.com:server fail,tor.lore.kernel.org:server fail];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: 214D5614B73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Modifying buffer attributes after the buffer has been synchron=
ously freed during internal buffer release.
- [Critical] Race condition in `iris_close` and asynchronous IRQ response h=
andlers leading to Use-After-Free of `iris_inst`.
--

commit 537b3fb7cfbebde9b35a142b16ff2fc8de50a76e
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: qcom: iris: Make iris_destroy_internal_buffer() return void

iris_destroy_internal_buffer() is guaranteed to succeed and never
reports an error. Returning an int is misleading and forces callers to
handle a meaningless status value. Convert it to return void to match
its behavior and simplify callers.

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 83373862655f7..e6fd38ad8e36b 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -442,7 +442,7 @@ static int iris_hfi_gen1_session_unset_buffers(struct=
 iris_inst *inst, struct ir
> =20
>  	ret =3D iris_wait_for_session_response(inst, false);
>  	if (!ret)
> -		ret =3D iris_destroy_internal_buffer(inst, buf);
> +		iris_destroy_internal_buffer(inst, buf);

[Severity: Critical]
This is a pre-existing issue and was not introduced by the patch under
review, but modifying this function highlights a potential write-after-free
in the buffer release path.

When the Gen1 backend releases a buffer:

iris_release_internal_buffers() {
        ...
        ret =3D hfi_ops->session_release_buf(inst, buffer);
        if (ret)
                return ret;
        buffer->attr |=3D BUF_ATTR_PENDING_RELEASE;
        ...
}

If session_release_buf() calls iris_hfi_gen1_session_unset_buffers(), it
synchronously waits for a response and frees the buffer on success:

iris_hfi_gen1_session_unset_buffers() {
        ...
        ret =3D iris_wait_for_session_response(inst, false);
        if (!ret)
                iris_destroy_internal_buffer(inst, buf);
        ...
}

Since iris_destroy_internal_buffer() frees the buffer, does the subsequent
write to buffer->attr in iris_release_internal_buffers() cause a
write-after-free?

> =20
>  exit:
>  	kfree(pkt);

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/=
drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index c350d231265e5..917d2775612c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -447,7 +447,9 @@ static int iris_hfi_gen2_handle_release_internal_buff=
er(struct iris_inst *inst,
> =20
>  	buf->attr &=3D ~BUF_ATTR_QUEUED;
> =20
> -	return iris_destroy_internal_buffer(inst, buf);
> +	iris_destroy_internal_buffer(inst, buf);
> +
> +	return 0;
>  }

[Severity: Critical]
This is a pre-existing issue and was not introduced by the patch under
review, but I wanted to ask about a potential race condition between
instance cleanup and asynchronous response handling in this file.

During file descriptor release, if the firmware response times out:

iris_close() {
        ...
        iris_remove_session(inst);
        mutex_unlock(&inst->lock);
        ...
        kfree(inst);
}

Could the background IRQ thread receive a delayed response and look up the
instance just before it is removed from the list?

iris_hfi_gen2_handle_session_response() {
        ...
        inst =3D iris_get_instance(core, hdr->session_id);
        if (!inst)
                return -EINVAL;

        mutex_lock(&inst->lock);
        ...
}

If the IRQ thread blocks on mutex_lock(&inst->lock) and then iris_close()
frees the instance, does the IRQ thread wake up and access freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-iris-code-=
improvement-v3-0-4c699c3dd719@oss.qualcomm.com?part=3D7

