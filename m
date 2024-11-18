Return-Path: <linux-media+bounces-21489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DA9D0941
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 07:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 867BAB235B5
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 06:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4994DDC1;
	Mon, 18 Nov 2024 06:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWExlZr1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7291465AB
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731909763; cv=none; b=pBztQ4oPGw6hWu/+wnNI/bx0hgsenlEkc7DNHU8EPh3MhbmkNiRfr/H1uVjwEQS55yirZOSGadA1JfzeCfIWBhIxRyZVpBwkPPBLumXiXEfmg+P4gDw9RQtmrY1tfa0+yPWi9iCCzKQ1WlfSjz1IqmzCFf+b5TdgZn3ENb4kc+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731909763; c=relaxed/simple;
	bh=2IIpqJMX0xeQevAFxZmET457k+zmscQY4pXaruyZgVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fiWps02F0TODFIFfmJKHYC3buApJQJVFfTzWZUH+x1y9PD3ey4woOnCrh47DAkvkn9/cRNsC0377k4k23ntjYZOt4X3KSUUku+PrAOPKP/mJEBZOUNah/8CC6yWqb4NYdETjjHoDHMZvth4xNi7Q1Zygrhq6WhayrGbUSsxgdUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWExlZr1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B43C4CECC;
	Mon, 18 Nov 2024 06:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731909762;
	bh=2IIpqJMX0xeQevAFxZmET457k+zmscQY4pXaruyZgVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dWExlZr1tRemmGntQJA+r82JtIaFezdQ8ZDc/Qbbaz/Qgt1KUC7kOHfCTJ5nqFVe+
	 /0lyGwvH3+38cKcI8NR7oYf+393nbLPYdCB/dHHDkVNCcX/I7LwkyPkWj7o94AXRNz
	 bDjsi15IKlAd2JnSjEZjy0WoaYMbnb98Pwjs5n0ZsZLeuNB33AC0lkysKtu+AHRMH7
	 0hltLHwkp1hv2CadueqMQVx3pN5D1/VwDIYJaiK5hUzPkNGdGN1XzFVKe1eZvRjLU7
	 +/kTB9QO+H9Ijef79cb44q8dCorPbZSUCdHJmzHST4Ts5OXdUvsK+olorm31dvKZ6F
	 0b+ZFs8WL7gvw==
Date: Mon, 18 Nov 2024 07:02:36 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Hans de Goede as USB VIDEO CLASS
 co-maintainer
Message-ID: <20241118070222.6ec70f86@foz.lan>
In-Reply-To: <20241117213837.GJ12409@pendragon.ideasonboard.com>
References: <20241116113855.50976-1-hdegoede@redhat.com>
	<20241117213837.GJ12409@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 17 Nov 2024 23:38:37 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Hans,
> 
> On Sat, Nov 16, 2024 at 12:38:55PM +0100, Hans de Goede wrote:
> > Add myself as co-maintainer for the UVC driver.  
> 
> Thanks for volunteering to help.
> 
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>  
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Merged, thanks!

Thanks,
Mauro

