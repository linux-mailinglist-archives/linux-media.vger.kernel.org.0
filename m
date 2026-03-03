Return-Path: <linux-media+bounces-54283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A4cCvqqpmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:33:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 836601EBEA8
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D10330F9CCA
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542E638C409;
	Tue,  3 Mar 2026 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="SVhuVLk+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560BE310655;
	Tue,  3 Mar 2026 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530261; cv=none; b=C5dVEB3TpD4VxnhFFhqGxawH+4TC3oHLsc6YeGlfufYt0QKMp/HgpLtXH2xyeDlbE6VPtid0Tp30Mh5ZoCRZupC+DanqAsoa4iCpCMDdAHZwDECaLvLxLQNGMwPQC2Lxwyt57VlTedsklUzeT3kjNYjcoqKY+xOZaRbtxFDolQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530261; c=relaxed/simple;
	bh=42WJ473703DSwaBkjEobxWyJmpLmlmHmZHHbup3KJMs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K8vkr41yHXWRLf44SjEUitHMQjvbMHw8t3+1DSooTe6sQ/xEXu2HeMm9dk8VP7w35onC+JwBE9XNKx31sqrkwWZcPVb3khCzng0YMWXYizO5q3CoFCbHtycsSy8PG5SU2oiLZsFNdeIGK81g7O5yW7Dwl+raO3JLcDoSqGneLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=SVhuVLk+; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail3; t=1772530254; x=1772789454;
	bh=H4KXmeQvvJ3KsTAtBp7ROQAX3hjn5yTF3s5cCTcIaVw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SVhuVLk+rFyIa19JWKiXKyxSxqXkdPJooRSXu6MiAMxFHDuBR/6cwAIZoCs9C+BCR
	 HXFfqCS8Lntj/uvpSFxHMyKPj+XuJpCH+NzfNoYXeZqnsIyCGZd3RQBeqCD8zmE2EZ
	 paBy1tjsEPgtSjpAUN+kXOljg4gV/8131StmMSJRUtGKcqvQc8UlqZV6ONntWxGfkZ
	 9VyBXsgS0nxHwFmm3elnH5vzt6Mly4AG7PNEnKsjfIWrbiGQ6jIwG3VU/O3QMjOLBO
	 nfAGKSPsrEo9rV6A1VOTNRY7xVd+qvuZNlK9oLYADVfG5+Inh5+BzaZx3iggXGjg5L
	 56YDgZFWb1siA==
Date: Tue, 03 Mar 2026 09:30:49 +0000
To: Bryan O'Donoghue <bod@kernel.org>, Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
From: Bryan O'Donoghue <bod@nxsw.ie>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <676e2a9f-d274-40fa-988f-e9388ba40f71@nxsw.ie>
In-Reply-To: <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org> <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org> <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
Feedback-ID: 54899767:user:proton
X-Pm-Message-ID: d2d0447183497777c7bd74fe9f8c31ac32ae5355
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 836601EBEA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxsw.ie,quarantine];
	R_DKIM_ALLOW(-0.20)[nxsw.ie:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54283-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@nxsw.ie,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxsw.ie:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxsw.ie:dkim,nxsw.ie:mid]
X-Rspamd-Action: no action

On 03/03/2026 09:27, Bryan O'Donoghue wrote:
> - MXA - first time I've heard of this rail, from memory I don't remember
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 having seen this in ipcat whe=
n I could do so.

Yeah no MXA isn't a required vote.

https://lore.kernel.org/linux-arm-msm/9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@=
oss.qualcomm.com/

---
bod


