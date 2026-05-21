Return-Path: <linux-media+bounces-62592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCM9GFQwEGoaUwYAu9opvQ
	(envelope-from <linux-media+bounces-62592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:30:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DA45B2205
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CFA63069C10
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D90C3D6488;
	Fri, 22 May 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeG7QDaE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801E93CE489;
	Fri, 22 May 2026 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445312; cv=none; b=IPkvjlKjhPI5gpmUGbgePXzlOPTOtPKDi6QlJXGSYVM+69BjQBpaMhvGNP2+0/r5OjQPwCwL8hZBrWFYu/1pvqqKbPZ7bXO8WwCG+WyCrHtbXGZTaf4K6Rk7jlsA6pUJ4h+tiq2xLEUjgGXzvTDuJiTS7fe1+r7N5OPCmW5tJ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445312; c=relaxed/simple;
	bh=XGvRWFnHxBl/4vDYNIzRFjTrHmqdZDLJkRM7tpyOMxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ItpGd6MTaRpLTSZpOGiYcmtmFWudcKp9chThaMSbd/Jtp0mRRMf/LB6rP75Qk95YeRJqSfk+K/Lpgr3jBMLdJWMfDu60EqU5eEhL8xJu58Xzz0TeaU+TFLbFArj9R9roStTVb1araCRbqY5ty/3as5zN1j+5Y3hP0r7RIwLcz4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeG7QDaE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCFB1F00A3D;
	Fri, 22 May 2026 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445308;
	bh=alAHQ6fqvt3+i41azObwMF7fJWB0ovwWc5B+rB7ORY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YeG7QDaEac6cNXHgTtk0EFoBIpVWWa/nX/LkZ/HmW0VgQy//YejsCGHkoheWsIDl3
	 qXgZsSJvHvIV44fgpxEeebH+AtxmNkcupj6nHG7Hf/ndi7ifEm92dBmZ2zWY9kEYU2
	 P3vog+eOv95h6m22hdfWVsOt2I7QnUxLNfRLoBiXSu8RYWKObqCd3JNFiCk6pXJXnk
	 6lj5bYJ8mlUxa+QRwfh1x2cE2kF7AKEN6HptNylz/j/0w++iVieO24PJqgcf2kWQpZ
	 ioBY0GCATSkySNVm6A7GxzchcGv50UeePCANvhp3Uku0feefCy9lA73SIgJL+wBTad
	 nmyY4S5WBzskQ==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Lukas Wunner <lukas@wunner.de>, linux-media@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521073816.766596-1-johan@kernel.org>
References: <20260521073816.766596-1-johan@kernel.org>
Subject: Re: [PATCH v2] spi: fix controller registration API inconsistency
Message-Id: <177936276667.58022.4468059770892456065.b4-ty@b4>
Date: Thu, 21 May 2026 12:26:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XGvRWFnHxBl/4vDYNIzRFjTrHmqdZDLJkRM7tpyOMxc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC453nfah20aKIr5D3H75HTWHifNTf2Tr+jzS
 qbSFZqv1xqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuOQAKCRAk1otyXVSH
 0NboB/4wZyHo+B5rVtB6lPbLxX5AbHLgukxAXUiROlmcBBd9TYbJ68oTs7B5mJC6eaKfHgLi+7Q
 ZHuTCy7h2VrFfJ3bkXcVXN9DJqlghExwemDsHhKkC+/sgbp1/rZR2tqqeRodkwFF5Pp8FBHeF6P
 cJWXoAMSmKtfyFPQjro0Uldg87bRHZrDoPFZCV8NUYtIjDGa2vKiitfPhB3QWvbrdz3nG74ay3G
 RYuwaNHWDcpZzH5O/fW75hKtLkAx/jHvsl3W+KOsU4T6jJ9qJIaA1KVEHCHKmOUhQoqeYaZwWgX
 3Gpb0P2+c8X2cQTuTT/65tVeb6jD6XN0w5SJDme1Y9Jq1lta
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62592-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,wunner.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 04DA45B2205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 09:38:16 +0200, Johan Hovold wrote:
> spi: fix controller registration API inconsistency

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: fix controller registration API inconsistency
      https://git.kernel.org/broonie/spi/c/16ba3b0c66ef

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


