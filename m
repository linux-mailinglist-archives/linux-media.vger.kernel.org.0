Return-Path: <linux-media+bounces-54851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP3MG2YkrGlHlwEAu9opvQ
	(envelope-from <linux-media+bounces-54851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 14:13:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E9222BDD7
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 14:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A50A9301A6AA
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 13:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344793A1CFC;
	Sat,  7 Mar 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEwbysJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE227E06C;
	Sat,  7 Mar 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889182; cv=none; b=DaTGL98cy9AfCP2jESCWkJyEKJndR/5lgTYmsDQBfSBN1lprBywx4LE1AwVxIn7r9lUiEKtJtcrBOZcq/vmKROE1O239ZptTwLdGF8xdFy0Vd0s928Cxj2nfIJ971LUIGw3TBDIymLm+YaNcO2o+ArxBYb3elw5A82uwT76Mq1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889182; c=relaxed/simple;
	bh=DFrhs/qRdR8CWTDX+nG/pAb/0PAtcneBtf79J5Xjb/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsfjgHWhDZY2fZTp33+ZFzOUXGMrUUjpUuNAHas2VC5YOHseJ4JE4Xyh+fYx5dn4U+oLv2nRIsQPS5Q5MZn3Xjbw76Acj1wOTs8YAyZwY4sJ0a839Q5pLgyS1ULTgVnqCtFhJ5ea0k3Sk2HqDXgi4zsuaDpkpIRYOFsuGXEZ/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEwbysJ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B74C19422;
	Sat,  7 Mar 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772889182;
	bh=DFrhs/qRdR8CWTDX+nG/pAb/0PAtcneBtf79J5Xjb/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEwbysJ/mZ98DaLE8B74hVOeA4BlccNm1sWk8epzLy7ZDwGqr1huViL0qCIbrwUky
	 TkZZW7L8Xp7CHaDJqf/jza06yYqGYYzfcbdG79EkLtIE8bkoS2+SK8Afj7BAt5YcuG
	 no84kpTmHoC3poTAiwKrNf8K7ST0q3PCO9Q87NoOCNQfxTHAfODMnjQ6pqfwPyUsst
	 hk73Q9qdtGo5J+7IuhKOvmof068GPOZ1o8OaQEyeyrQ1u2tqke+T98PLcHYb7EYAD3
	 o74jR9A5Wcz+LtiOVdgiuEtV9Jaajzzbmqd5gD7wND4LSxfTALr8HKtmmY4PwjMklp
	 y33sd0ZMMCxkw==
Date: Sat, 7 Mar 2026 14:13:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: media: qcom,sm8550-iris: Add
 X1P42100 compatible
Message-ID: <20260307-olive-honeybee-of-luxury-b22bbd@quoll>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-1-75fa80a0a9e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-enable_iris_on_purwa-v2-1-75fa80a0a9e3@oss.qualcomm.com>
X-Rspamd-Queue-Id: 73E9222BDD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54851-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.928];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.30.226.201:received,100.90.174.1:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:44:29PM +0800, Wangao Wang wrote:
> Document the new compatible "qcom,x1p42100-iris", which is compatible
> with SM8550 but adds an additional set of clocks. The BSE clock is

Then please express the compatibility. Device is or is not compatible
and you just wrote that it is.

Best regards,
Krzysztof


