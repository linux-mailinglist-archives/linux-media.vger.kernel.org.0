Return-Path: <linux-media+bounces-59758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP+HNGxQ8GmgRgEAu9opvQ
	(envelope-from <linux-media+bounces-59758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:15:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9447DF44
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C59F73034E26
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33C8345738;
	Tue, 28 Apr 2026 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWOSwsps"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3153E322A;
	Tue, 28 Apr 2026 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777356893; cv=none; b=e3RtAiSoduqJg/fd9+Ab6hqr9X7PEgC0ajgb9ygUNKh579X/RTXun8Pc7mii6fGfQ74yxmaGkxxWXv+eXKvqYFzPzApzELPHCrxW+sa2K4285WlvH0+VYhlz3dFFdrFs4ai/NmNP2RixWzlyL+TYpPlBMn+cQpa2+zu6ghSoi8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777356893; c=relaxed/simple;
	bh=ZtNEEwE/C9cL26Tuda4aj88/aIU5hPbhP1JSjoFn+EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/YWZGaomQtGTh9zNxqkVytnyqO6+NB29Aqg2QZ1F/pWfqQVSnCzo8HbMm0cvMhwS5Z0BJfB40Ey4bwI6KOQTeNQOuaO1uhelpygMQr/uuv0+AoEYlENhynzFejXXLlopSvUpU9Om/jUnv8fleKio9SHHzawRdMWT6z7/JkMbok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWOSwsps; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F14DC2BCAF;
	Tue, 28 Apr 2026 06:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777356892;
	bh=ZtNEEwE/C9cL26Tuda4aj88/aIU5hPbhP1JSjoFn+EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWOSwsps2UaCyLidZ43a2fT7AZWHkqGM0pcS1f5LES2h643yzai4q1nKtbd0FlGSs
	 NbN5rl99ASQhfoCLWJdjbT5CYuCV5mor1cVGWIRWcsvE33/YzkxGCLFGusZCkPLU24
	 wsX6h5BJV25uO2nOTBlJvqabdm/1chBlSUZFQmRneugpKnSR+yQBc8PhCGfQVSkmdC
	 mEfDwkntQ5ffLsho4B5fhOyXREGE5a56I++lElJYZofKTcShIk+ZBo1+SI18GkakYE
	 W9adFmN1UuHhqtX2nhbH+/raYNR/JWj/l4nlcLHPl9A+P/sbvWR1D/PvWjS9UcoTxA
	 gjFAJIWKwKg7g==
Date: Tue, 28 Apr 2026 08:14:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 02/12] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Message-ID: <20260428-nifty-quaint-hoatzin-6de65d@quoll>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
 <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2CD9447DF44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59758-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 09:24:08AM +0530, Vishnu Reddy wrote:
> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
> is a new generation of video IP that introduces a dual-core architecture.
> The second core brings its own power domain, clocks, and reset lines,
> requiring additional power domains and clocks in the power sequence.
> 
> To accommodate glymur clock and power resources requirement, the maxItems
> constraints in qcom,venus-common.yaml are relaxed. This allows the glymur

This is a very confusing part of commit msg. You cannot relax the
constraints. Each device MUST have a specific, fixed constraint. It is
your task to be sure they are not relaxed.


> binding to inherit from the common venus schema without duplicating shared
> properties.

That's obvious. Why would new iris device schema not use common venus
schema? What is different here then that such possibility exists?

Best regards,
Krzysztof


