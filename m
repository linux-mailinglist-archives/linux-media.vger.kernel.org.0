Return-Path: <linux-media+bounces-20082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0209AC1DD
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 10:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C12461C2518F
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 08:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9B215A848;
	Wed, 23 Oct 2024 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GT190R/h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A314EC62;
	Wed, 23 Oct 2024 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672665; cv=none; b=gkNoosT2LlO82wlwjNHTZxBvnei5w2LSK1aN48vpq2DjzsDkZJNmTSb/E/xFLCmR0BPKh5UUEydy3JqcNxGeCviHwwV3Veip2GScfdgSjIMVUZFKukai2iKbMtc4bVyPmvgjbGehdyL7MWkYPdx8BA4G53bMjGHquuoTcI/9g2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672665; c=relaxed/simple;
	bh=/IgelIG9LxLQMH0tFnA+FzLpx84kR1qfjaNwI42cJyU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/DqosJ8fTNN/Yais5ATvga2UnM3I0EzpSaN4AMzsl5m+bwbKK/RmERNHDx+E9Vpz11rYZc925dqHQbRPJFhhan9KeP+7hmx5cS0i/dc/yzjJwgdw1fNogrLI8s5M9oZyBX+QrxkWGtERukIrXmhlMR+lJncs2546dJ6MQOao98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GT190R/h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B22CC4CEC6;
	Wed, 23 Oct 2024 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672665;
	bh=/IgelIG9LxLQMH0tFnA+FzLpx84kR1qfjaNwI42cJyU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GT190R/h7yHeRe2pEdki9I9cn/T0G/mBZ7UBM1Ph0t4WbugP8d1XQ904AYRSxp3dZ
	 sltMEhL3WggzTywfWlqEiIRCBCwvFOGuxYWMOGq1X0I+xIEoV86cTHNCdc97Ydadum
	 z7FgeR2bJcs9ascj8HuoIhlKwzy6opncdxWZLnTlEGiUKRnNbM0uGxPtxMel3syvSs
	 pjiCIbyA/aDPNFweFBvmXfW701pFSJH6dKxcRVc9mHbpJqvle1qvtB6fIdYs7G8Jhg
	 BD2CgK7BgeeYVEgM9Gvicxb9EaFjwD0/vZImPZxy6hMBqKJOfci/uJBHtl/srf8AQo
	 c4Jp+Y1WyfreQ==
Date: Wed, 23 Oct 2024 09:37:36 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: patches@lists.linux.dev, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
Message-ID: <20241023093606.50fedb91@sal.lan>
In-Reply-To: <2024101835-tiptop-blip-09ed@gregkh>
References: <2024101835-tiptop-blip-09ed@gregkh>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 18 Oct 2024 13:31:34 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:

> Remove some entries due to various compliance requirements. They can come
> back in the future if sufficient documentation is provided.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  
> -MEDIA DRIVERS FOR ASCOT2E
> -M:	Sergey Kozlov <serjk@netup.ru>
> -M:	Abylay Ospan <aospan@netup.ru>
> -L:	linux-media@vger.kernel.org
> -S:	Supported
> -W:	https://linuxtv.org
> -W:	http://netup.tv/
> -T:	git git://linuxtv.org/media_tree.git
> -F:	drivers/media/dvb-frontends/ascot2e*

Please don't remove media entries at MAINTAINERS. If there are
compliance requirements related to some maintainers, instead keep the
entry there removing just the M: fields.

In case the driver becomes Orphan, please add:
	M: Mauro Carvalho Chehab <kernel.org>

And change S: to:

	S: Odd Fixes

Regards,
Mauro

