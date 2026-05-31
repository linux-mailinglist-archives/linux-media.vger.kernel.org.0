Return-Path: <linux-media+bounces-63166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LYiaJmTUG2pFGgkAu9opvQ
	(envelope-from <linux-media+bounces-63166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:25:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF142614AEF
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ED32302D087
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 06:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB01342CA7;
	Sun, 31 May 2026 06:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCSsLQTB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9D2221FD4
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780208733; cv=none; b=fcZoQ+59CbSq1wAzP/qdC6qxoOO8ArJfVOyeICGDARLQzWa3JUmzkkSJ9lgMQU873stb6gVok9NuPO5zyp1m4hBTKpQUVhBD1JT81s9hP44myzXaUqENp/KFX48Jh6OYg7myc/5BxgYCGqUR7i40WMw0zcEmziK/IEmUjg7Pobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780208733; c=relaxed/simple;
	bh=oWiXdZ4yOeyxc/Gj5D3fsq/ihlkhrCyarMdyxF/r4zw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NiJZMlNC4goLgMqBGAQqhkFhNvW9VWAjM1YHftIMlnGWn4BSAggdBYhyYDzA42FQHoeloG6YZPiZmS/GLJeSs50VpdXXpEl+91LP24/GZoWunshGL+kzrSHu5rnVvr5na7H6cO6zUPzSu0NM9SHw1vdbbI6novp32WV7DBH/wKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCSsLQTB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911D61F00893;
	Sun, 31 May 2026 06:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780208731;
	bh=ag69Hy/mVz86KkpksxHc/EnB89w7VqRSVGleU3G3P/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FCSsLQTBt18pk3kscKMocUz7LZGF+UJx6aHrmCg67/h7Q89eMTTv390xzzkBsek3o
	 PeEXxfV3PGZiMOwDh9fDwJWESuWVnRtUrqg73IzPSUeRh8LBcRkwHjLb+mNINsB+TQ
	 BFNBfuan3D/8y3QGMxGqasfZ1mbExjwipE5i1FU3+ww9F2xY1ciigwDf8fBSxby0M4
	 oDMsgGDyMAP3DfwOWJQM5mxS0RwvEHWQtPamXN2PU+D4xu/hYctnczClA3CYPeEn1F
	 3euNzE2n8IQ/yNP7EjEDNEh2mL5PEmlNtXBlWDg/dZ4LTC1IdBbmxOF6SCWVepXn6R
	 +z2Ytv6pluUHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260531-iris-code-improvement-v3-5-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-5-4c699c3dd719@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 06:25:31 +0000
Message-Id: <20260531062531.911D61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63166-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: DF142614AEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly claims that the duplicated entry =
in the dispatch table caused the property to be sent to firmware twice on e=
very config-params call.
--

commit 25b255af1736827e8ef4663ef7b30ae4066986f5
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry

This commit removes a duplicate entry for HFI_PROP_OPB_ENABLE from the
property dispatch table in iris_hfi_gen2_session_set_config_params().

>     HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appeared twice in the
>     dispatch table, causing the property to be sent to firmware twice on =
every
>     config-params call.

[Severity: Medium]
Is this description accurate regarding the property being sent to firmware
twice?

Looking at iris_hfi_gen2_session_set_config_params(), the inner loop breaks
immediately after finding the first match:

	for (i =3D 0; i < config_params_size; i++) {
		for (j =3D 0; j < ARRAY_SIZE(prop_type_handle_arr); j++) {
			if (prop_type_handle_arr[j].type =3D=3D config_params[i]) {
				ret =3D prop_type_handle_arr[j].handle(inst, plane);
				if (ret)
					return ret;
				break;
			}
		}
	}

Because of this break statement, wouldn't the second duplicate entry in
prop_type_handle_arr simply act as unreachable dead code rather than
causing duplicate firmware calls?

Could the commit message be updated to clarify that this removes unreachable
code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-iris-code-=
improvement-v3-0-4c699c3dd719@oss.qualcomm.com?part=3D5

