Return-Path: <linux-media+bounces-64660-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3UxHBSXOK2qCFQQAu9opvQ
	(envelope-from <linux-media+bounces-64660-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:15:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 900C7678262
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:15:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KzEa3Bko;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64660-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64660-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E819A309B55C
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C40362152;
	Fri, 12 Jun 2026 09:11:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11AF29E10B;
	Fri, 12 Jun 2026 09:11:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255475; cv=none; b=On9Q5HoqzrRCxYxCXlQ9skryLS0jmBV0I1BabtFSqc2lxahmvFAi7T89vGGLlwnTNWGsnDa1JSJA9JGz6vsURpMAkO7bqPvNUa+84oU+BRmjU+hz97/hhw623XNWHZx3VYeIS+qr0phiEAYW0n7hW6g+mjyd70t9YTsBw7t90CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255475; c=relaxed/simple;
	bh=sA7XHTR+hUu1GOIidIrazCy8bVz0wveq1McrnESdVO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX1ZTKjbwCn3iBIpsgXR2cndIHg2eMesBj8QH2Ur+BsHX8E3iCMBgk67eJu6nu+B5aYIpJi+cvAjWks+Dkal9yWUR7O6fSVVuQf9qxCb9hO4LO8SQXCmej2ZkSeONKviHM4fvcoKjqT6fA2RJh4FQ//MkWInvrBT4iDCv5M5aD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzEa3Bko; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCEE1F00A3A;
	Fri, 12 Jun 2026 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781255473;
	bh=PQ4QzvJCcyyUBvM3LmUN3c7vcUQePiRiidAiUwgM9rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KzEa3Bko20ri1xq7WNCzHIPuqdbpWldg0H0nLjZ+H0+FJ0oF9puLF8kMs36Dck8Pl
	 u5ZCPpY4AllDcGfU8mUNSrX9IcNrCLCmaNfMnyzBicnUTDZ0WTn/Px5PXR28O9Vptv
	 UTimAjUo6T864VFDA5Md0DBL6H227Pf4V4zS4qwQUu0aJa8GogeLNi/TsJn3d1YJg/
	 H0PucKt6zk0NLyvDV2blcjEGuF9eA7iMP1fMyaw4hE655QV/K1ZmwtOJLNz1TLyqxy
	 uOWDn5kkYeyANABJDfdTz0Hj9iww9qicGMf8s9FlRZbUmjQTWYjjrOq7eYB7vsg126
	 IURkOOoiSyEQg==
Date: Fri, 12 Jun 2026 11:11:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <20260612-faithful-literate-vulture-a3bf8d@quoll>
References: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
 <20260612-shikra_vpu-v2-1-bf8727370a1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260612-shikra_vpu-v2-1-bf8727370a1e@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64660-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,quoll:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 900C7678262

On Fri, Jun 12, 2026 at 01:19:40AM +0530, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.
>=20
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290=E2=80=99s SID=
 layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.
> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
>=20
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++=
------
>  1 file changed, 19 insertions(+), 7 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


