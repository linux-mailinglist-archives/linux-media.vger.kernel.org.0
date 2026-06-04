Return-Path: <linux-media+bounces-63776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xtTgKtdFIWpdCQEAu9opvQ
	(envelope-from <linux-media+bounces-63776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:31:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0A63E8CD
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:31:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lPKZwBLw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63776-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63776-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFD6F3012E95
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 09:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90478375AB8;
	Thu,  4 Jun 2026 09:15:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA48036922D
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 09:15:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564510; cv=none; b=j4rN/pBgbvMwVSWtCtolm9BgSM4sp/8TKXD4oUj3TAOMShJrj2R0Qx7v8YyhLNVeTFvGHqZxQXcPJqXtLO8aLdo5NOfUziJOadmfRggVk5mPzCDWJkest7eh4DbUIPMyYC5gt8o4JemVYxJ/39g5NcLgdPAFDBNiTY2UvYPrYYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564510; c=relaxed/simple;
	bh=3YT+FbTPS4H2MWKmZEHHBwOfrmj0Fx9iRjroFAqGth8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C+31IUSbUreo7NAlTlzRkh2WnGPu9BLNri4FWWcevrCB2xKiR/vooznsXwdZSOE+enlGDs9sigQntUHV4o8OtymYWXDVy/Ut9gVUZ2WmiIRiLkrtVdos/nCd0r8gtJIHP/XMpH8K9IEggyj8rAK9rrJmPwLkSd/8HkA81uNhTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPKZwBLw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3821F00899;
	Thu,  4 Jun 2026 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780564508;
	bh=Io4aLjzH4FA+MrxMyLD7vwV5w1gUN2k+3fiZwgfCDiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPKZwBLwKZtjGWPaJiQOkRV1ST3TOhrJGLe7XL9A0CCuH8QMgqBsSGY683Fh6do5P
	 5Tcrci28afYH8iqtAGMvKTp1Gkpx1sjEvY5zGiYxAAIFHIn1T5y/5B4gnMqzmtrTn1
	 cdtnXyhq+S+9vnSUt+1XLxPuqb316MLjaM/40AeT3I+B4dlWVmNwlQVM1aUbwrUKVF
	 9jk0UR7UbUjbrvhjhg5D/WmNlerWs8FzSV09q/mV7l2GO9Eu9gSiyfp1piLL0TrNYB
	 K8oSTH0nBtW6dcOA+Zo9pqMelJW3s7UfJh5NP7bDk4ohmuPcSZyIrQxlGzJbQzDzhf
	 eeZNh5E5810oA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] media: qcom: iris: fix runtime PM reference
 leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604090059.46355-2-dennylin0707@gmail.com>
References: <20260604090059.46355-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 09:15:08 +0000
Message-Id: <20260604091508.9C3821F00899@smtp.kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63776-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55C0A63E8CD

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Asymmetric and incorrect teardown order in `iris_vpu_power_off_hw(=
)`.
- [High] Runtime PM reference count underflow due to unconditional `pm_runt=
ime_put_sync()` calls.
--

commit a22a4f4f739fd2c34235f6490e49b9bb97a0667e
Author: Hungyu Lin <dennylin0707@gmail.com>

    media: qcom: iris: fix runtime PM reference leaks
   =20
    Use pm_runtime_resume_and_get() in iris_enable_power_domains()
    to avoid leaking a runtime PM usage count on failure.
   =20
    Also ensure pm_runtime_put_sync() is always called in
    iris_disable_power_domains(), even when iris_opp_set_rate()
    fails, so runtime PM references remain balanced.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..f5e3341e14309 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core,=
 struct device *pd_dev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D pm_runtime_get_sync(pd_dev);
> -	if (ret < 0)
> +	ret =3D pm_runtime_resume_and_get(pd_dev);
> +	if (ret)
>  		return ret;
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  int iris_disable_power_domains(struct iris_core *core, struct device *pd=
_dev)
> @@ -90,12 +90,10 @@ int iris_disable_power_domains(struct iris_core *core=
, struct device *pd_dev)
>  	int ret;
> =20
>  	ret =3D iris_opp_set_rate(core->dev, 0);
> -	if (ret)
> -		return ret;
> =20
>  	pm_runtime_put_sync(pd_dev);
> =20
> -	return 0;
> +	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the runtime =
PM
fixes, I noticed potential regressions due to unconditional
pm_runtime_put_sync() calls when pm_runtime_resume_and_get() fails.

Looking at iris_hfi_queue_cmd_write() in
drivers/media/platform/qcom/iris/iris_hfi_queue.c:

	ret =3D pm_runtime_resume_and_get(core->dev);
	if (ret < 0)
		goto exit;
	...
exit:
	pm_runtime_put_sync(core->dev);

	return ret;

Since pm_runtime_resume_and_get() automatically drops its usage counter
increment and returns a negative error code upon failure, doesn't the
unconditional pm_runtime_put_sync() call at the exit label cause an
underflow of the PM usage counter?

A similar issue appears in iris_core_deinit() from
drivers/media/platform/qcom/iris/iris_core.c:

	pm_runtime_resume_and_get(core->dev);

	mutex_lock(&core->lock);
	if (core->state !=3D IRIS_CORE_DEINIT) {
		iris_fw_unload(core);
		...
		core->state =3D IRIS_CORE_DEINIT;
	}
	mutex_unlock(&core->lock);

	pm_runtime_put_sync(core->dev);

The return value of pm_runtime_resume_and_get() is ignored here, and
pm_runtime_put_sync() is executed unconditionally at the end of the
function.

Could this also underflow the counter on failure, breaking device power
management balance and potentially causing the device to be powered off
while actively in use?


[Severity: High]
This is a pre-existing issue, but I also noticed an asymmetric teardown ord=
er
in iris_vpu_power_off_hw() from
drivers/media/platform/qcom/iris/iris_vpu_common.c:

	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN],
				false);
	iris_disable_power_domains(core,
				   core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
	iris_disable_unprepare_clock(core, IRIS_HW_CLK);

Does this code disable the power domain before disabling the corresponding
hardware clocks?

This appears to contradict standard Qualcomm hardware power sequencing where
clocks must remain enabled during the GDSC disable handshake. It also viola=
tes
the symmetrical reverse order used in the error path of
iris_vpu_power_on_hw().

Could disabling a power domain before its clocks result in hardware lockups,
GDSC disable failures, or register access violations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604090059.4635=
5-1-dennylin0707@gmail.com?part=3D1

