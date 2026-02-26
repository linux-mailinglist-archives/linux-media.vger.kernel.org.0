Return-Path: <linux-media+bounces-53588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBFaJmeAoGn3kQQAu9opvQ
	(envelope-from <linux-media+bounces-53588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 18:18:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5C1AC2A1
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 18:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94E6D36243E1
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 16:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D123603D1;
	Thu, 26 Feb 2026 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b="tEIrXfrr"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9C3603CC
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772122147; cv=none; b=nOGnMwfuIQxxviweHw2G1lRaz22Raq/DeGFNvGqQ8XEV1i3fnQ+QRWy4L18WyBlGnZW3Ov/OUnD0OTD8UzjKNdkCRhp7fso5fVCBdh+mdYWEG1UV813JfYmHnAnqADlMGKgTwPUecfo0/5lWQ6TlzIEXjmiDImx2r/fTiMlBBgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772122147; c=relaxed/simple;
	bh=wQT4A1YWJZSJVJeDDWn0FnXQhUYrvOzhsNfs1BTeyis=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Gttvml4QiGy/5iql1y1vb70Wl/hr2w2//NFegeeU/mLWh+4+snhOKvl7jFjB+3FmSLXHW3+S1y/oDFO5IZakeDf01n97GgxvHbTQfREu6q5mHiuRZ9cRNT76xfrOnaXF4vXJYeblanJK1if5BgPI0H7LhrTQpvn6GJTe/sCatMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b=tEIrXfrr; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1772122139; x=1772726939; i=yarny@public-files.de;
	bh=AI4HDgEjejlMTEN48eawkCcbDdaPlPbnb+v2ZG3Gp1w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tEIrXfrri9au5f8NKuwhUuqqBAFA5023ec/okXM4tWPeENSmCzGL3Sa7tvs7iit3
	 wwBOPD/nQRGWzbLZ/SQ/WEKVKoF3RqZFSiIo717KK3HuaHhjOO3Dgz+QGWerhr/wA
	 ++fXDdOevA/bWSayB0imqpVb5G4LH1VVLSqbgJHB0131VVDcH0fEABqC5zFrMJ9Ql
	 XPCKvAAvKRZHBRRfgttP5/VUedtujtSZxeTGQ48MCgiNWEkVYTHoOFxrDT6ik+vuQ
	 pjafrPxWcrSO7GVQm2hLqIUdflSmjE0CLMHFW4yj/SvdeDt4bg4yhBoaszaX01lAs
	 jf4xyEFMCkWLkuJBVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkHQX-1vGEZG2Qkj-00hMX0; Thu, 26
 Feb 2026 17:08:59 +0100
Message-ID: <afe17741-fef5-4864-94b8-b2361e0daf16@public-files.de>
Date: Thu, 26 Feb 2026 16:08:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [dtv-scan-tables] Partially revert "dvb-s: add frequencies from,
 https://en.kingofsat.net/"
To: linux-media@vger.kernel.org
References: <89c093e9-9b27-44ea-8c1e-a10a2edbd784@public-files.de>
 <699f2d55.050a0220.cd58f.b259@mx.google.com>
Content-Language: de-DE
From: Yarny <Yarny@public-files.de>
In-Reply-To: <699f2d55.050a0220.cd58f.b259@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gPIZw98ij7+IFsD0tB1oNKPqpyBuwyHxLMKwTaer1pEZ329HYn2
 pTz86TN9G63ByRBIM0nPjkcpLY+WK/7zpctrjGLe2JqNIlYi78UzuRpByV+W1FMkksY4ll+
 O8TJWvCq0JV5TI/Fj5nx+B/HVud3YiCt77MfFpCQNAchE++5fiWxUC4AoGiiODiXPEKpH0O
 BN3XMLxTwTIHltPCxmxmg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dkj18WIfm1Y=;VA9BwajN0DhEHdkjfcMhb1yaIOR
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[public-files.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[public-files.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-53588-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[public-files.de:+];
	FREEMAIL_FROM(0.00)[public-files.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Yarny@public-files.de,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: DFE5C1AC2A1
X-Rspamd-Action: no action

Dear linux-media,
dear Patchwork Integration Media CI robot,

> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-al=
l
> to this message.
Maybe my patch got misclassified?
The patch is not aimed at the "media-committers" repository,
but at the dtv-scan-tables repository
(as is denoted in the email subject
and in the commit's subject line).

> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html

At the time of this writing,
that page apparently only concerns
patches for the linux kernel repository.

I have no idea how to rectify this.

Sorry for the inconvenience -- Yarny



Am Mi 25 Feb 2026 um 18:11:49 schrieb Patchwork Integration:
> Dear Yarny:
>=20
> Thanks for your patches! Unfortunately the Media CI robot has not been
> able to test them.
>=20
> Make sure that the whole series 89c093e9-9b27-44ea-8c1e-a10a2edbd784@pub=
lic-files.de is
> available at lore. And that it can be cherry-picked on top the "next"
> branch of "https://gitlab.freedesktop.org/linux-media/media-committers.g=
it".
>=20
> You can try something like this:
>      git fetch https://gitlab.freedesktop.org/linux-media/media-committe=
rs.git next
>      git checkout FETCH_HEAD
>      b4 shazam 89c093e9-9b27-44ea-8c1e-a10a2edbd784@public-files.de
>=20
> Error message:
> Trying branch next 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f...
> Running in OFFLINE mode
> Analyzing 1 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>    [PATCH] Partially revert "dvb-s: add frequencies from, https://en.kin=
gofsat.net/"
>      + Link: https://lore.kernel.org/r/89c093e9-9b27-44ea-8c1e-a10a2edbd=
784@public-files.de
> ---
> Total patches: 1
> ---
> Applying: Partially revert "dvb-s: add frequencies from https://en.kingo=
fsat.net/"
> Patch failed at 0001 Partially revert "dvb-s: add frequencies from https=
://en.kingofsat.net/"
> error: dvb-s/Badr-4-26.0E: does not exist in index
> error: dvb-s/Eutelsat-10A-12.0W: does not exist in index
> error: dvb-s/Eutelsat-21B-21.6E: does not exist in index
> error: dvb-s/Eutelsat-36B-50.5E: does not exist in index
> error: dvb-s/Eutelsat-36D-36.0E: does not exist in index
> error: dvb-s/Eutelsat-3B-3.0E: does not exist in index
> error: dvb-s/Eutelsat-8-West-D-8.0W: does not exist in index
> error: dvb-s/Express-AM-8-14.0W: does not exist in index
> error: dvb-s/Hot-Bird-13E-16.0W: does not exist in index
> error: dvb-s/Intelsat-10-02-0.8W: does not exist in index
> error: dvb-s/Intelsat-35-34.5W: does not exist in index
> error: dvb-s/Intelsat-38-45.0E: does not exist in index
> error: dvb-s/Intelsat-902-50.1W: does not exist in index
> error: dvb-s/Intelsat-905-45.3W: does not exist in index
> error: dvb-s/Intelsat-906-64.2E: does not exist in index
> error: dvb-s/Rascom-QAF-1R-3.0E: does not exist in index
> error: dvb-s/Turksat-3A-42.0E: does not exist in index
> error: dvb-s/Yamal-402-55.0E: does not exist in index
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --ab=
ort".
> hint: Disable this message with "git config advice.mergeConflict false"
>=20
> Trying branch fixes 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f...
> Running in OFFLINE mode
> Analyzing 1 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>    [PATCH] Partially revert "dvb-s: add frequencies from, https://en.kin=
gofsat.net/"
>      + Link: https://lore.kernel.org/r/89c093e9-9b27-44ea-8c1e-a10a2edbd=
784@public-files.de
> ---
> Total patches: 1
> ---
> Applying: Partially revert "dvb-s: add frequencies from https://en.kingo=
fsat.net/"
> Patch failed at 0001 Partially revert "dvb-s: add frequencies from https=
://en.kingofsat.net/"
> error: dvb-s/Badr-4-26.0E: does not exist in index
> error: dvb-s/Eutelsat-10A-12.0W: does not exist in index
> error: dvb-s/Eutelsat-21B-21.6E: does not exist in index
> error: dvb-s/Eutelsat-36B-50.5E: does not exist in index
> error: dvb-s/Eutelsat-36D-36.0E: does not exist in index
> error: dvb-s/Eutelsat-3B-3.0E: does not exist in index
> error: dvb-s/Eutelsat-8-West-D-8.0W: does not exist in index
> error: dvb-s/Express-AM-8-14.0W: does not exist in index
> error: dvb-s/Hot-Bird-13E-16.0W: does not exist in index
> error: dvb-s/Intelsat-10-02-0.8W: does not exist in index
> error: dvb-s/Intelsat-35-34.5W: does not exist in index
> error: dvb-s/Intelsat-38-45.0E: does not exist in index
> error: dvb-s/Intelsat-902-50.1W: does not exist in index
> error: dvb-s/Intelsat-905-45.3W: does not exist in index
> error: dvb-s/Intelsat-906-64.2E: does not exist in index
> error: dvb-s/Rascom-QAF-1R-3.0E: does not exist in index
> error: dvb-s/Turksat-3A-42.0E: does not exist in index
> error: dvb-s/Yamal-402-55.0E: does not exist in index
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --ab=
ort".
> hint: Disable this message with "git config advice.mergeConflict false"
>=20
>=20
>=20
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>=20
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>=20
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-al=
l
> to this message.
>=20


