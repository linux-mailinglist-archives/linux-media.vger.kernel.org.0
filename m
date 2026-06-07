Return-Path: <linux-media+bounces-64059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nHjWKTFwJWrUIAIAu9opvQ
	(envelope-from <linux-media+bounces-64059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 15:20:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8186509F6
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 15:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HJpcQJiG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64059-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64059-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7EFF3017793
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 13:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CD33A8757;
	Sun,  7 Jun 2026 13:20:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575281DF254
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 13:20:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780838434; cv=none; b=T5U0ZPVk6iBZbNbrEhcIrKTz2twoqSInKKf9ve10u/Y1S3nIoF2qM5ibcaEHRM8wy3u5rbpb1VWarBGoh40aLbgsW8vXRN8HDO+xKde171lVC69+jc2MSMvy3pEsNlufzzIMvuSPXV6Nih4oaHAmGeokp2vHsjPsVlfMG9Ite64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780838434; c=relaxed/simple;
	bh=2TxJnA/HnmTLuQXNz3oFnlHDuJbmvFnqD2AuvqCJad4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IIKJjw7xDd7h2faRffkPiAiZ1uKW0cMIQoERCXSILyDtpnSNDNgRyci9xBY45ejBNcKIiLzAnjtw4o01Xa9e72YcsbiZgpoiA+7yl+uCNCJoufoxLMxTtc/AKb8YRcpOqefNM7yDqHAF1NdBgv9ZbpYzLn3sIEO0n7XCxqDUwUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJpcQJiG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B8E1F00893;
	Sun,  7 Jun 2026 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780838433;
	bh=DunmmXA7I45RfdTkUzBlciYmjnhUzE0M6v/P1wmQEV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJpcQJiGzl13I5ajmLA03Xt81++N0D5aevTAOHYUA215w3RT61QlBID7Knp66kbw+
	 dx68Rg5S0SM8WIGhqsI70Siv687HE89HUHhfG/JetoKmMSQCjiv7EaV47nYpQ7hZeP
	 JeiFLHzIlh1wDg7VTE8zVwfK1vcdoCPFps04cN9tEeinE5IUJ5uZJJzlBZXMxjuKaW
	 PHUenm19c3blZgdmb421nYaE26bIIu8BdMJG90kIa2P7aq9eOmgv+8TLFY4SExU8C4
	 zecgQ1jsKFB5Kx3ZaRv1iMN0DVbVMfEsIaKf2Y2NXWHkLPNUt4fx3z46G4ab7mgTjq
	 0ke4erxADNL2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] media: intel: ipu-bridge: add sentinel to
 ivsc_acpi_ids
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260607130853.55980-2-dennylin0707@gmail.com>
References: <20260607130853.55980-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 13:20:32 +0000
Message-Id: <20260607132032.E9B8E1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64059-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED8186509F6

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding a sentinel entry without updating the ARRAY_SIZE loop bound =
causes the loop to process the sentinel as a valid device ID, leading to an=
 unnecessary full-bus ACPI device traversal.
--

commit 554863b8fea7ba90e96f5d3f59ce90e9d589634c
Author: Hungyu Lin <dennylin0707@gmail.com>

media: intel: ipu-bridge: add sentinel to ivsc_acpi_ids

This commit adds an empty terminating entry to the ivsc_acpi_ids array.
It intends to follow the common convention used by device ID tables.

> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
> index fc6608e33de40..471a449f11f65 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -168,6 +168,7 @@ static const struct acpi_device_id ivsc_acpi_ids[] =
=3D {
>  	{ "INTC1095" },
>  	{ "INTC100A" },
>  	{ "INTC10CF" },
> +	{}
>  };
> =20
>  static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_devi=
ce *adev)

[Severity: Low]
Does adding this sentinel cause an unnecessary ACPI bus traversal?

Since ipu_bridge_get_ivsc_acpi_dev() uses ARRAY_SIZE() to iterate over
ivsc_acpi_ids, it will now process the newly added empty sentinel:

ipu_bridge_get_ivsc_acpi_dev() {
    ...
    for (i =3D 0; i < ARRAY_SIZE(ivsc_acpi_ids); i++) {
        const struct acpi_device_id *acpi_id =3D &ivsc_acpi_ids[i];
        ...
        for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
}

On the final iteration, acpi_id->id is an empty string. Passing an empty
string to for_each_acpi_dev_match() triggers an unnecessary traversal of
all registered ACPI devices, as it tries to find a match that does not exis=
t.

Could the loop condition be updated to break on the empty sentinel, or
should ARRAY_SIZE() be avoided here since the array is now null-terminated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607130853.5598=
0-1-dennylin0707@gmail.com?part=3D1

