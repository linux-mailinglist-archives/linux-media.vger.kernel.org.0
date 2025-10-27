Return-Path: <linux-media+bounces-45683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26182C0F02D
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 672F8405B3C
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 15:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E612F3101A2;
	Mon, 27 Oct 2025 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TK8FXR/Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392BF30DEC0;
	Mon, 27 Oct 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579304; cv=none; b=B1GMathwLXVFJaOUz3ITuWWHdYnbDMVBshLElNGHeTegJGPxpOuhs1XYW5nzzWYma7MrvBTOlA1AIUs5Dp6HeFyJfQOR+/+OuvD5u3QFJjxgA+epI3ON7FtQgY1mhZLNCGTLZ34V7cnolUJOXtdyi8qo/aYzVzO4jK7tWzYPCdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579304; c=relaxed/simple;
	bh=SPlI2EZARTa+512LejXq1waPtkaEetiuqdFs5jbL/ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptJGuPqWedvb0iFFcGqeiPyQxjRUOJWzNGF+JNWCozbFs1fAtqFg4VOtd3RwG+4N9DSmjyoRvoaD7wKlyLVJm08V8+vbMLIu3dHSJBY1ZLZpg7/lLLjPHaVyjmOOx5tUZr0haVo3UvVLWNM8px4tgLwx534zsNwtrcaPSp335LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TK8FXR/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B16C4CEF1;
	Mon, 27 Oct 2025 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761579303;
	bh=SPlI2EZARTa+512LejXq1waPtkaEetiuqdFs5jbL/ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TK8FXR/Yx20ezp0gb+qc97oBpI5Iybq+2PPTOTVgzSOkkGmG19qpM5URLowQFrJeC
	 oTfrgNypbztOP3nwqeVqQHftLS3aWg8wBs6Edmsrw/K0VALpoEnDS4l+eWzaHuamIe
	 eOodCz6UG1bFzdWHJ+iqXXx3Ufyi17d8Zgg50kc7HL4bungfBZAzwSFx1iHKgR9Y1U
	 IG8tqQJGM8hhkpAzlU+ddVTGHNyLiR1bD0PyBTzl9kHtNBVeXcpr//Lwm50mMEqh9T
	 svmzaLjFVRQGFKvrsBXzdSU2N3/MRFnsBFhHxIDmfpzZhKWXGucDVCVk4qZ7WnrpAN
	 QtBmZtZBEsgdQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDPFS-000000001zo-37a4;
	Mon, 27 Oct 2025 16:35:07 +0100
Date: Mon, 27 Oct 2025 16:35:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH] media: c8sectpfe: fix probe device leaks
Message-ID: <aP-RKjqX36TtT5n9@hovoldconsulting.com>
References: <20250923151605.17689-1-johan@kernel.org>
 <aP91OoGkrSxxpsf1@hovoldconsulting.com>
 <8487acd9-3c8f-4eba-99e4-6a937618aa55@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8487acd9-3c8f-4eba-99e4-6a937618aa55@foss.st.com>

On Mon, Oct 27, 2025 at 03:28:57PM +0100, Patrice CHOTARD wrote:
> On 10/27/25 14:35, Johan Hovold wrote:
> > On Tue, Sep 23, 2025 at 05:16:05PM +0200, Johan Hovold wrote:
> >> Make sure to drop the references taken to the I2C adapters during probe
> >> on probe failure (e.g. probe deferral) and on driver unbind.
> >>
> >> Fixes: c5f5d0f99794 ("[media] c8sectpfe: STiH407/10 Linux DVB demux support")
> >> Cc: stable@vger.kernel.org	# 4.3
> >> Cc: Peter Griffin <peter.griffin@linaro.org>
> >> Signed-off-by: Johan Hovold <johan@kernel.org>
> >> ---
> > 
> > Can this one be picked up for 6.19?

> The removal of c8sectpfe driver has been initiated see https://lore.kernel.org/linux-media/c3a35ad6-c4f6-46ad-9b5b-1fe43385ecc5@foss.st.com/

Ah, ok, thanks.

Johan

