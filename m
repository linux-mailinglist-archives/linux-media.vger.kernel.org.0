Return-Path: <linux-media+bounces-60618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKRrNqZI+2lZYwMAu9opvQ
	(envelope-from <linux-media+bounces-60618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:56:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E24DB6F5
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BBFD30547DD
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8905547ECF9;
	Wed,  6 May 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EztVb4Ma"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82DD3F167C;
	Wed,  6 May 2026 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075649; cv=none; b=fINQcwyqLMO5H/8nd8nrOxQIINKHMqqAlFRjaz4ip+gHyFYUAvqeT5lgosu8P+YIX2tIKP58bMz6T18PydN59vy71Nl9A0OSC9hEykB7/1ktCvl9LrJ7OYNtzKfVEEZWjw0REH5Sg15ihre27n7oQrFfMMzi3zbh3Sy4Zt8H+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075649; c=relaxed/simple;
	bh=NoI8j3F1YW25tR0zL0cDFy/lvZ5oPDxPYyIFiIeRMtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqBEKQsuGIGcTbNa89Am2LPqvsN53iuRjyjkZirX9ITsJDTqtTb8WVvt+TGsl86o4Vw7gasEqAFAxpGIwJwXNe3Ddsa9sHwW3T7Erdk2nLYP2kQJPwalsn6kKCplgHHw729aXsJEZJneXQBGKVd7uHwsUUty7YM6o/pEwCF9/Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EztVb4Ma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134EFC2BCB2;
	Wed,  6 May 2026 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778075648;
	bh=NoI8j3F1YW25tR0zL0cDFy/lvZ5oPDxPYyIFiIeRMtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EztVb4MarZed7S8kuN33gAfdyd2gdT1d8RmOJSSFKQBihDeycyARB7Zhi+PL+C9yq
	 R/+vcTzXRksxQ4zwZpvTD6wqftzB10Ga7gpdTM7GQ4zQrRzw55F+U/Nk3g+BS7rxAe
	 yJCHf5Cgg2KVl/CRkbJt8CbMzRcsR7MngJkPDmLw+woqflg8wXWdWsAFF/dbk7Qj8z
	 UAQfxxezNET+jbe/+3m39trZkzCd7adVhIZWKuPKj14mUbK2McYqK0Hc7M8eFXdL36
	 HmN2psbcmeCn0x/fBlXNQFIMyKyq79uNEbKjV+Z+dYpIXcyygxbfPThvTvfgp9jFDM
	 +nsbDI3QOR8xw==
Message-ID: <758ab729-dc5a-4837-b255-9462aaa6b0a3@kernel.org>
Date: Wed, 6 May 2026 15:54:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] ata: ahci_tegra: Explicitly specify PMC instance to
 use
To: Thierry Reding <thierry.reding@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-1-a6de5da7216b@nvidia.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260506-pmc-v1-1-a6de5da7216b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 758E24DB6F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60618-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlemoal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

On 2026/05/06 15:41, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Damien Le Moal <dlemoal@kernel.org>

Applying this through the Tegra tree is fine with me.


-- 
Damien Le Moal
Western Digital Research

