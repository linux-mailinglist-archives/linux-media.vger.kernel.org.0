Return-Path: <linux-media+bounces-63090-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMRWI4w0Gmp+2AgAu9opvQ
	(envelope-from <linux-media+bounces-63090-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:51:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621860A71A
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E498530E8EB8
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75AD2F260C;
	Sat, 30 May 2026 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZ5bBIYb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6FE2DB7BB;
	Sat, 30 May 2026 00:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102003; cv=none; b=bGxeRmH3+mzScRc14RwyKavCOwNAgVRIr8xeE1A+7URmx+5hweqB3+lbm48/Nb50f303ki5MJLoyjPIB0c2tjH1VCFM82Gyz3KlAnh3wgbWDyfQIkg6BC2J/u3RaNP0Vr+HNUPB3Lgqi5p5I2yjDvV3zm6hsvD/LfAMV0kG7z0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102003; c=relaxed/simple;
	bh=Gj7Ho0fpm89YpVQqdP011+hYYm1f/ozWnlkoOZjGM1E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EAcPF2f2dDkjYrKjlVPYJmgyVZIQk80mqkRMcLOc8IsHzEyerF1kaiQyrltQRqT71X1aJAj2xl/luG903cBlNWH7v32esIxiubZwMzoobq7GNXWa9o/RKwRouQRqtA+dAOwndF06gmHoav9HJSmOwH+ZJHaBBizlRI+/CVBVzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZ5bBIYb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D438D1F00893;
	Sat, 30 May 2026 00:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102002;
	bh=NJcxkZ5CVcWbKhMMFpsQuqUBFLHlS9Piddgvot8kfgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gZ5bBIYb7S1znQu53i0Q9NjwvqLAokIn769EDupEVZjiODNEc2PUnjHAoPWyA+ZGp
	 iZhlhcwS6li4vSf8JS35/y4igrYQ9f1cgUPWH5kxnmEMIvfCXMh2+NqUsYRW3xHhxH
	 ndSUS1PER0GGpzcZ9qaSOrw3oP7/i354SVYUtzr0IPRpIDrtgWPf682ziw3nJAtEbW
	 uCnxjtuKexvaHny7uC1OYwP7lvcO1WWC/BXgreAGRgre7DcVdjlbjTI8AqqFYQOaqa
	 yqUYTYq1IItfXjDhmMYW/3Mutq61ig4Y9Vb3lR+Do83f5Wdfe4CNys2gz0qBp4gdk/
	 TU/Ti2tfahuCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/15] media: qcom: Pass proper PAS ID to
 set_remote_state API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260522115936.201208-12-sumit.garg@kernel.org>
References: <20260522115936.201208-12-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:41 +0000
Message-Id: <20260530004641.D438D1F00893@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:replyto,qualcomm.com:email];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63090-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 4621860A71A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless access and TOCTOU (Time-Of-Check to Time-Of-Use) race on =
the global `ops_ptr` variable leading to a NULL pointer dereference.
--

commit cea57543db0155e85cd736ed70440a251d359393
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

media: qcom: Pass proper PAS ID to set_remote_state API
   =20
This commit updates the SCM backend calls in the iris and venus drivers
to pass the correct PAS ID to qcom_pas_set_remote_state() instead of 0,
which is used by OP-TEE for bookkeeping purposes.

> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index b3c5281aea919..856fa6a79064c 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -109,5 +109,5 @@ int iris_fw_unload(struct iris_core *core)
> =20
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, core->iris_platform_data->pas_=
id);

[Severity: High]
This isn't a bug introduced by this patch, but since this code relies on the
underlying qcom_pas_set_remote_state() function, is there a race condition
in how ops_ptr is accessed?

Looking at qcom_pas_set_remote_state() in drivers/firmware/qcom/qcom_pas.c:

int qcom_pas_set_remote_state(u32 state, u32 pas_id)
{
	if (!ops_ptr)
		return -ENODEV;

	return ops_ptr->set_remote_state(ops_ptr->dev, state, pas_id);
}

If the provider driver is concurrently unbound (e.g., via qcom_pas_tee_remo=
ve)
or shut down, and qcom_pas_ops_unregister() sets ops_ptr =3D NULL, could op=
s_ptr
become NULL between the check and the dereference?

Since there appears to be no locking, RCU, or module reference counting
protecting ops_ptr, could this lead to a NULL pointer dereference, or an
invalid memory access if the provider module is unloaded and the memory
containing the callbacks is freed?

>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D11

