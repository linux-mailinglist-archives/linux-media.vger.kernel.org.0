Return-Path: <linux-media+bounces-49808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1E0CEC0C7
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 15:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1579A301B4A9
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 14:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9E01A9F83;
	Wed, 31 Dec 2025 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UYJujw5E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B61D5CF2
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767189716; cv=none; b=Rl0WNDEW0ALHsUTqBjaolaAucNpTonTI2s2dYTX0+7m16BiCD+oLVp4JMXnBh30TJNnziHeaoOeCNJrLTj5cm4ro8tGFfpzsJvnVYIqVBubbAQtidQq7PK/1CS6YSFxQ1VU/PJkwac3Xg1IyCJE+U3JxmYq9cRRWvlO+5Ps+h/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767189716; c=relaxed/simple;
	bh=uDh9lHLHY8TtyrRiLXhdYQucDWHMnN+qKhDLba7ig2M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aRUrltKgwkCfT4eGuOjavalF5M5e58pp1K3YjtDISn/6SGVyuYQfoR6BnGcSYqYjAvSgrxbimUQbsaMuOj6GREJ4m6QGZiY/oc/fOE5HtAO/OZBC6T2Pl6w1OvwzZX7XKwb76YLdPZvGjONeQ0nKIQXz6w+n5eJHM1cZVNwD8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UYJujw5E; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8B9A54E41EB6;
	Wed, 31 Dec 2025 14:01:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AF5960744;
	Wed, 31 Dec 2025 14:01:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BC46113B076E;
	Wed, 31 Dec 2025 15:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767189711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uDh9lHLHY8TtyrRiLXhdYQucDWHMnN+qKhDLba7ig2M=;
	b=UYJujw5Ea0Q6MDtyZOL+Luj+wyj7V+TLc0kzw8AKesh2J3AH+6gu8/igYzWQk7Ju/pHfPc
	PZmiAGFcSCRtCSqaz7c8khOnxaeL6jtqwYWC6H4E7XgWpWV+/n5mte4lmjvQbj6b2yP0dp
	d1WZ5imYokp9t7jEuLt8rRCP963V25ZidWcAJ9QgOJUtgEFbe5OEzBibX/u26VaJiCQGCT
	4fVjHi4//nFZw6Y+zN6ISDnw1lLvMatN2gY1YL2Yr4sKkebal9jBWjmFo3zpL5rWQgO0wc
	qe9n5Zbs/SYtfxjk7Pyjmy3Mh8A0xGT96xhHwx/gwGGVj2m0AyJNNp1bNGrj/Q==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 15:01:49 +0100
Message-Id: <DFCGGX67KTAJ.NPWO4JKMA9TW@bootlin.com>
Subject: Re: [PATCH v2 2/2] staging: media: tegra-video: move
 tegra20_vip_soc declaration to vip.h
Cc: <linux-staging@lists.linux.dev>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <skomatineni@nvidia.com>, <mchehab@kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
To: "Sun Jian" <sun.jian.kdev@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-3-sun.jian.kdev@gmail.com>
In-Reply-To: <20251231123955.277384-3-sun.jian.kdev@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Dec 31, 2025 at 1:39 PM CET, Sun Jian wrote:
> tegra20_vip_soc is shared across translation units but is currently
> declared via an extern in vip.c. Move the declaration to vip.h so users g=
et
> it via the header and we avoid extern declarations in .c files, matching
> the pattern already used by tegra20_vi_soc and tegra210_vi_soc.
>
> Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bo=
otlin.com/T/
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # build tested
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

