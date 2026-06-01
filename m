Return-Path: <linux-media+bounces-63367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rsVzGCnJHmpYVAAAu9opvQ
	(envelope-from <linux-media+bounces-63367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 14:14:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C462DE3B
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 14:14:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ACGTTxa8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63367-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63367-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 560B430F547F
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 12:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28BD3DD528;
	Tue,  2 Jun 2026 12:07:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514713D301B;
	Tue,  2 Jun 2026 12:07:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402053; cv=none; b=E6UWE5Y01QCE+ouje0IGeLRc0eN60kva0tKoYN3vCNBFc+GaPHBfF7RRrl8E/LObKwsioo1X74IX09MPgODllzbTgJqU3foz30lgiQJLAcmV3fj9ucCai06HZtRqH502Zvl8sNdH3vVtodwP8Dp3I2fFr3ZQvzXCBzX4OrBH4jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402053; c=relaxed/simple;
	bh=CXeJ9bvnJoexsr0ZqogM4Dl8ae1EzlAlaa7aCsJn7q8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ThUjn+MYNvAb8xFxb26p60nguLUXk95j5HbUJhzBNhu3CG0JJrmg1cYUDe+bO0gVH53RXzlstPEqBE574gixPFt4uXOGZPt9Wqbl+NNHa8LiY/zdYooQueiaVc81xgqB6ZhZr4PZOAnD+DvKxtLplDmrUCX8myVoZmJPQ7+Y8Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACGTTxa8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2DF1F00893;
	Tue,  2 Jun 2026 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402051;
	bh=yf9fztpSi4K+ljlndUdAbTgpH8FO9UBENIcySmefiuo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ACGTTxa8FbXBbbfTxT10geybgu/iGCQ5gAPvgGW65pwToitHKMb7oXIvmJwag/Gl9
	 7+Tz6MWHzmRjkbVhxq7H7CY1ekgHUKDFDvqts6yhC4KPN9pbt4W0DDnvGn2BeJEgE/
	 NQ6TYrDN1EndBuecSRzsbbGV8VvQqGaRoDi/PLx1GzGNzPEZq8D7kWHmo5/Lan8Rcy
	 6mGAQmbNWcZbrkR2CmvqVo2j+F2q79QB1IF38Pf6DeY2xyMYugYYxB7ILjPzTw0dGw
	 4GY2pVtyDg41+ZprebAb0wvC1wAPMg23p0L3JL3wIZ2hjKhPe5o8c4PF9bQK3ZmZSq
	 +PRLqakkNBakw==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 devicetree@vger.kernel.org, Thierry Reding <treding@nvidia.com>
In-Reply-To: <20260525-tegra194-qspi-iommu-v2-0-a11c53f804b2@gmail.com>
References: <20260525-tegra194-qspi-iommu-v2-0-a11c53f804b2@gmail.com>
Subject: Re: (subset) [PATCH v2 0/2] arm64: tegra: Enable DMA Support on
 Tegra194 QSPI
Message-Id: <178032313909.44654.17999841515127150550.b4-ty@b4>
Date: Mon, 01 Jun 2026 15:12:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CXeJ9bvnJoexsr0ZqogM4Dl8ae1EzlAlaa7aCsJn7q8=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiy54/XyPcEnBT53/v2Y89Ssy7P91+LkqBPJnziq4yQyu
 iZ4yRp2MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATSWpg/ytzi/0SS/F8eY6S
 3m9uifbs2fVZW8VOv5hQMd9/DnuY1L/MNR71RQK+z3+nXEiPKnc+L1pikeIVnFhT4eOz8F/TksV
 87Admvej7Y/ch/mZrUChvkZaTUOe9tDs8zlKdhTt19YqZOcrkq9o8/6TL8Avu/HHn6/oTwS3KK6
 2+PqhP57GbesA2+bzLmnthiy/liPeqmp3/E3OCh++/85nFD7eeDNo/galh569m8z0LRFPvPXr/Q
 yOOR8np1tNvWyMtzWbbvlda2BZ12EHlYaVAwKFEvlV3+B89rF9/p9bpbMn1dRcNHD1kMtg0ypYu
 O71tRtGTxFJX1YiVSfvVH3qteJJuH8D8xUb46NN96v+LAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:ldewangan@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:webgeek1234@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:devicetree@vger.kernel.org,m:treding@nvidia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,linaro.org,amd.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63367-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C80C462DE3B

On Mon, 25 May 2026 01:47:43 -0500, Aaron Kling wrote:
> arm64: tegra: Enable DMA Support on Tegra194 QSPI
> 
> The reason for this is to properly support the spi nor chip on the
> Jetson Xavier NX module. Prior to this, it would time out on all
> transfers and sometimes even trigger a cbb fault, locking up the entire
> unit. With this, reading and writing to the flash memory works as
> expected.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/2] spi: tegra210-quad: Allocate DMA memory for DMA engine
      https://git.kernel.org/broonie/spi/c/f469138a77ac

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


