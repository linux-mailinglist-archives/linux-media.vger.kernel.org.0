Return-Path: <linux-media+bounces-61566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gABXD8VsBWo+WwIAu9opvQ
	(envelope-from <linux-media+bounces-61566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:33:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E702253E5D8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10511303ACE0
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 06:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB5A3A75B3;
	Thu, 14 May 2026 06:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv2Dhm68"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4452C08AB;
	Thu, 14 May 2026 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778740407; cv=none; b=Jv8O1xWMEMjhzo1mzRDdsNT3ODGVm5xxhAq0sFPQKzAthM3ZWquo+UdAofzIO+qG/CDPmAOO8iqo7XdR3RocZ2vsbUcuAfeB2/xitiOkV2YqomNBXNDpYtx0jUkBWCGJMa+TvMsjWua8RQFREeQgF34P4YJk75kvZ7Sk6FAdKu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778740407; c=relaxed/simple;
	bh=6I1pLIu5ZO9By01XD+8EXsPwxjZxNWD9DIOmV6OTciU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0g2aFsIuKuxNZ83N0M7oVda0H2s49PwFgHhJVQgk7BDFbCk7jmvrGv+2pQEXhHz7K1d4TtJjRZIzfaLKRqu6f+qbDu9QXI53MiZWvu/Sr6EhNZQqZ16prwXIoKKoDWLp/Y6x1xxgM3cgmJ/9cUa6mlecRMdTHdgrZ9dh1nFVq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv2Dhm68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD04C2BCB7;
	Thu, 14 May 2026 06:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778740407;
	bh=6I1pLIu5ZO9By01XD+8EXsPwxjZxNWD9DIOmV6OTciU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wv2Dhm68cjTFur1oXruLEabXIRCw/Il7XKh6KSx0j2c+1rUklhQjqWXqcsRYLtvQH
	 9JeZzQRBWuMwdor4b4aQ2knFvij1G1hb36ByKpftOtYZePpvMVVIiArwQPJhV+0Voy
	 OHjrFJtQ/dftSGNYLz/1WObfQsE4UIVlt+3V7tzh5tjbFGl3viIar/I5U0vX2ZDU4G
	 ZPNdkgz0+UKdqPk3mDqPYPYsZaJu1U6E0BDY+dkiQtfPceQ1WJYOXSuQzaMWxHOEmx
	 qyDvnSMfYoJ+A0VdSXUWNIKECU7ZGvMLzdvgRZsmKnTc+8/Y5I+M5Tu8s/LEmQkVho
	 sF9kIUaIxXBxg==
Date: Thu, 14 May 2026 08:33:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Message-ID: <20260514-economic-logical-bittern-25a5b5@quoll>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
 <20260514-msm8939-venus-rfc-v7-1-33c6c6fb9285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260514-msm8939-venus-rfc-v7-1-33c6c6fb9285@gmail.com>
X-Rspamd-Queue-Id: E702253E5D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61566-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:24:30AM +0300, Erikas Bitovtas wrote:
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>=20
> Add a schema description for the Venus video decoder/encoder IP in
> MSM8939.
>=20
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  .../bindings/media/qcom,msm8939-venus.yaml         | 79 ++++++++++++++++=
++++++
>  1 file changed, 79 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


