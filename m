Return-Path: <linux-media+bounces-60133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIpBMkaY9GnTCgIAu9opvQ
	(envelope-from <linux-media+bounces-60133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 14:10:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A5A4AC407
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 14:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74F49301843F
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 12:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832933A1687;
	Fri,  1 May 2026 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Ud2P/54Z"
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A628839E6C9
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777637441; cv=none; b=XS+yKzhUuUA8XE3U98TMxLMBTM3BwlbBAIIarcYcwrWeo33mvxNtPsGqpSwGoJ8Epkd2oi3iiXze7yykBjuaBGvU8OheWh6+V3ROWttyfh5B9KMaPtRQ5W0HzQsnG/C5CehZPrrYl9ReuQMDgbEbm6blLIy5KIf+vDoJWYUGKS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777637441; c=relaxed/simple;
	bh=ZMdIxlvI3YK3JOmnzXINozQOFM3ZXEhQtChewYDGhuI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIGfCfXEDRxNjcWxHAu0/AAC197g+czlWTWG/kWErEgm1A/m3rEWQzYxUTm5UU/Mxn2OzO5F5LVmsNndWwo636gj0oFxm44iAKU+PM9tAkUhcuU9NKHwUMXXdgueB3ImXzhZd4TNRWth2eLMAzVvxvVFZ3bfWW4YcJglB7x8elE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Ud2P/54Z; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1777637437; bh=ZMdIxlvI3YK3JOmnzXINozQOFM3ZXEhQtChewYDGhuI=;
	h=Date:From:To:Subject:From;
	b=Ud2P/54ZeLScZlIdf32vcp9hNMRdi6/5P8y6a5nAz/pNwYt6LFCOfInoQOXrStzti
	 mLTzO/YMDSPyiM1lLu/+cWVPIYogLtlKX9wURxvOTDNX7cEEIE/U/PHfgE+ANQIJaR
	 MsuE1xKI67dX6D1xeIAMW2Q8t2NFk3GJRkbpSDcnYDwrFjClXKzsX8ghxmQUKvrVAg
	 fHwM88KqiAMNvKRzoh5vMM5KcBXnXvfZSIQI82dhOrwCYLpjmVR0yoLhXtVK8IbjBJ
	 JRUtpUX6ef7xgFgnjDqFZ+o7a6bU1jFJEpRBW1V3Jh+Wsg5gy8MWIQoxvvWplbZK7N
	 w6b4GWR2Kg/cw==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id CF4E240176; Fri, 01 May 2026 13:10:37 +0100 (BST)
Date: Fri, 1 May 2026 13:10:37 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 7.1] ttusbir fix
Message-ID: <afSYPT3TJTWsxg3_@extorris.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 43A5A4AC407
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60133-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mess.org:+];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url]

Hi Hans, Mauro,

Please merge this single commit into the fixes branch for v7.1, it
fixes the ttusbir driver which currently does not probe at all on v7.1-rc1.

Thanks,

Sean

The following changes since commit 23c39cb598977f10909a2387c5e5f34afc1d6933:

  media: qcom: camss: avoid format string warning (2026-04-27 08:41:22 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung/ tags/v7.1b

for you to fetch changes up to 8ee96c474f306cdc534bdbbb873481614b66c86c:

  media: rc: ttusbir: fix inverted error logic (2026-05-01 11:36:50 +0100)

----------------------------------------------------------------
v7.1b

----------------------------------------------------------------
Oliver Neukum (1):
      media: rc: ttusbir: fix inverted error logic

 drivers/media/rc/ttusbir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

