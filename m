Return-Path: <linux-media+bounces-50555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB32D18A8C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F1533055758
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920EE38F236;
	Tue, 13 Jan 2026 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fsV8e2Bt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F82346E5F
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306465; cv=none; b=so+gQkTa9CoaETuIV/7u2U2NVpCrkv3dBaKi/LdCSlYeohMHyQHNUbH6Us6x7+QGMmuHm82MPCA3SNxma/e3XgEl8p39uPpsRPDyy81ig8+P07CUmTQyQqsAoxlhhuAO6mQWI94OGu1wceDXzrdCS3js53q25Wp8DKZQlF7Dfls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306465; c=relaxed/simple;
	bh=OOyKDA66Ody9pymzr+qzAEfTO4uNeC9bS2NxLVtGsAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCA0cXvmmrqF1zXolWnD05cwdk0wYGm4M6bR2APrmj/1KV334T2/OnM7DEe35qWwBtIpjSUuhP26R1cCNSuocky6sDyCNp+qzmPkS+zQzEScBe2ssGeReKX8zqadInBnT7anLayfuZF1jehre4BZrHCNlOhoMZgycz4dRDZ5ARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fsV8e2Bt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=em7G
	O7B5M0Jaufym4zbSL/h+/gT1gSYLeLchVpjho2g=; b=fsV8e2BtLFUVcG12hJpC
	LR66g6X0M7PrQuamMscpo4r6RXmzFP9Xy04lLYK2ZgkzZJPmvj8rx3Aa4v6KcpIR
	+0Q/oq8U+bq8L5p+HoQQOWIzfbzuypZabqYGoKgZL+Qy6praeHQfiKhEtSQ05eHb
	Xv/s9jzMDymxfSwgM6gaIGwmPzdKEociNmWBu85S5Avw/Wkqh/mqx86yHXMOTBu+
	tqd/DP0E2zjPp0Rdlrjnb3mLguC501dMsXcZG6/G9xdBSSp82oErd1P1GOzLKvW4
	qSuAhD18rbTvM1yRZ7FWk8m0TX2ihaanUZmG/9yBMDAuNeKWwh0kLmO/KUpSw/V9
	qA==
Received: (qmail 1673454 invoked from network); 13 Jan 2026 13:14:20 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 13:14:20 +0100
X-UD-Smtp-Session: l3s3148p1@2Jtx7kNI2Ikujnvx
Date: Tue, 13 Jan 2026 13:14:20 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: saa7134: rename i2c_dbg() to i2c_debug()
Message-ID: <aWY3HAZUhTr829qJ@ninjato>
References: <20260113115753.63291-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113115753.63291-1-bartosz.golaszewski@oss.qualcomm.com>

On Tue, Jan 13, 2026 at 12:57:53PM +0100, Bartosz Golaszewski wrote:
> Ahead of introducing I2C-adapter-specific printk() helpers, preemptively
> avoid a conflict with the upcoming i2c_dbg() and rename the local macro
> in the saa7134 driver to i2c_debug().
> 
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> We've started working on changes to i2c core that should allow us to
> eventually address the object-lifetime issues[1] in the subsystem. One of
> the prerequisite steps is to hide all dereferences of struct device
> embedded in struct i2c_adapter with dedicated wrappers. To that end, we
> want to introduce a set of i2c_adapter-specific printk() helpers[2]. The
> name i2c_dbg() conflicted with the macro defined in this driver[3].
> Wolfram suggested[4] that since the i2c changes will not make v7.0, it's
> worth renaming the macro here to free up the shorter name for a use-case
> where there'll be a lot more users. It would be great if this could make
> the v7.0 merge window.

True all that. If we can't have it in 7.0 an ack from media maintainers
would also be great. Then, we can carry it with Bart's series and keep
dependencies low. This is really just a simple rename.

> -#define i2c_dbg(level, fmt, arg...) do { \
> +#define i2c_debug(level, fmt, arg...) do { \

To avoid future issues, I would suggest 'saa7134_i2c_dbg' to have the
namespace clear. But in general,

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


