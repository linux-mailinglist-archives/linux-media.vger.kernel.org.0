Return-Path: <linux-media+bounces-12300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B16C58D53CE
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3981C246C7
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 20:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0C4180A71;
	Thu, 30 May 2024 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T8GN6WbW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173C7158D8C
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 20:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717100529; cv=none; b=H9H1qn/MuS+PJjiUIYj9MUy1wLctT7eqt5MQKDV/ej1sjEavt6uvgPAQWDQp3CdSXo1QomGlN7ZOZA/i0bMWPYOE5lGRTm78j3ftL39YQz6yB2u6aL3TydcSC2siLzBJ+a+yWTF2FInw49noQfxWxWG3a4QV9fIj8DxDURLsMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717100529; c=relaxed/simple;
	bh=kP1fxrBLHorGxxOn7tZYhQG69cf58OzqEBOLqmiEqTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7Of9M6G6lyVuUEvdDf6Vnxdvnw/LLib3lUyz7pBFe3GDW98SD3s/x/QToLKui40kHA5Yc40cKr3knTMn8tEFpWgRiIVXgQPbo3Pf58b6mKogD2PfQ+7OOsxf22nbTbZsD0trvftRcNHBqpd+kjEWEFWO2IR7k8xpJdMe9OCgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T8GN6WbW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8FE72D31;
	Thu, 30 May 2024 22:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717100521;
	bh=kP1fxrBLHorGxxOn7tZYhQG69cf58OzqEBOLqmiEqTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8GN6WbW/cGSZI9tSwwcfxCNB5H7+chn3aLzIpAKDQvguHUkGNy6LamCzrfbAeRYL
	 Gw9cEUO1faIlYzLDFQALBxuLoDuqSnbNjVtagOIC+QLYtop2fDy54R0Nk7d+MSth1V
	 MVFimqZcbatBmPzrKhEPs2JJXjoyArbKSFbJwdEA=
Date: Thu, 30 May 2024 23:21:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 1/9] media: vimc: Don't iterate over single pad
Message-ID: <20240530202153.GA23937@pendragon.ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
 <bad644d0-f139-4df4-bac8-e64cc8e8324c@linuxfoundation.org>
 <20240530194515.GA28160@pendragon.ideasonboard.com>
 <339ab149-6cfc-498e-9650-e72e7e2cd039@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <339ab149-6cfc-498e-9650-e72e7e2cd039@linuxfoundation.org>

On Thu, May 30, 2024 at 02:18:05PM -0600, Shuah Khan wrote:
> On 5/30/24 13:45, Laurent Pinchart wrote:
> > On Thu, May 30, 2024 at 01:27:53PM -0600, Shuah Khan wrote:
> >> On 4/24/24 17:57, Laurent Pinchart wrote:
> >>> The .init_state() operations of the debayer and sensor entities iterate
> >>> over the entity's pads. In practice, the iteration covers a single pad
> >>> only. Access the pad directly and remove the loops.
> >>
> >> I am not seeing much of a reason to do this. This code is good
> >> even when num_pads change.
> >>
> >> Don't change the loops.
> > 
> > Why so ? Beside the fact that the loop wastes some CPU cycles, the
> > current code implies that there would be multiple source pads, which is
> > confusing for the reader. I think the result of this patch is both
> > improved efficiency and improved readability.
> 
> It is currently flexible and if and when more pads get added,
> there is no need to change it. I am not concerned about the
> efficiency on this test driver. Also people use the test
> driver as a sample.

If pad gets added, we don't know yet if the code will work as-is.
Chances are it will need to change anyway. I don't think it's a good
idea to prepare for a situation that we can't foresee without having
good reasons to make assumptions.

I have plans to refactor the vimc driver exteensively, changing how the
different entities behave, to bring it closer to how a real inline ISP
is architectured. The .init_state() functions will likely be rewritten
completely.

I agree with the sample argument, and that's one more reason why I think
this patch does the right thing :-)

> Please leave it the way it is.

-- 
Regards,

Laurent Pinchart

