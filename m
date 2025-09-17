Return-Path: <linux-media+bounces-42645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7228B7E1B7
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30CBD46101D
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 07:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1042305E32;
	Wed, 17 Sep 2025 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F7ucMnm7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B933304BB9;
	Wed, 17 Sep 2025 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095586; cv=none; b=MsdQYPyMFiHZzbS/luD6oYJBhcPehMiEL4T2ohnpriSoa2hRNQB2tChkSD8DrEnVraB8pPLvA3JGViww6f+1ZLGLnObMhfaAk94JoCphC0EL6W5CqStKKq5cs/g9uZZcUUBlU9AbXnc5ishQ0Ub4MHMHkb5HKTHisU6jCXloeGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095586; c=relaxed/simple;
	bh=9W3ZNXyDSab2h/WE9GpRxxCXjsp0I+y9eeJur86V7FM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdMglejHoBDMqyIL/NITxY8fSUAVRdq/glMMkQo/rgvlotG8gkS1g4Rdp+le9xC0LVkUFmOJhoJ6kqMdmmmp0/BS6jNTVBy/iACRh5Au8k72tBEa/Y2FFKnZhtcoDtcQorC9JHQ8XNGjq6Ok4CHhApLpfgED9asnRctcJFZLy/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F7ucMnm7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6694DC00784;
	Wed, 17 Sep 2025 07:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3A5C6063E;
	Wed, 17 Sep 2025 07:53:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BBEA102F1727;
	Wed, 17 Sep 2025 09:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758095581; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=emFT8+nJVyi2W/wfZKpSHjD2VZR95mKcyCGwHzrsAO0=;
	b=F7ucMnm7DgTCjhoYBlR05retA2wRdJvHzwF3VeCIIp9pzfaDv0hqdu7xjUFNlFR/32cwYY
	TTH3ZPd30dMISSPqnCizrgYbV6aG8WU3tYY7I8IN1a8sKd0nFX61uCFHafxDtPgRpJqjDw
	/aX2SUIlk6CZS18XbDwxSCiuG9M5r80NcHsZ9isMwOgjxpDvZ/uZo+nnDZRiP1C5Ic1kW/
	y/UJR9EXgBM+eWbUAa2wKzynDuDjMZMfXOpRCIvFmjWoJUWTH415wMM4U/jerYuHjXLwZ8
	zvKF6L+PrDOQ8m+VvTfgnf8yJSNMsowqsYRycyZuf9JQ9iAsPxB7NX03zuIe+w==
Date: Wed, 17 Sep 2025 09:52:55 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko
 <digetx@gmail.com>, Jonas =?UTF-8?B?U2Nod8O2YmVs?=
 <jonasschwoebel@yahoo.de>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 05/23] staging: media: tegra-video: expand VI and VIP
 support to Tegra30
Message-ID: <20250917095255.2710c266@booty>
In-Reply-To: <20250906135345.241229-6-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
	<20250906135345.241229-6-clamor95@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Svyatoslav,

On Sat,  6 Sep 2025 16:53:26 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> Existing VI and VIP implementation for Tegra20 is fully compatible with
> Tegra30.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

