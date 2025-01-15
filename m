Return-Path: <linux-media+bounces-24797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B761A127E5
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 16:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E4CB1667E4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44207158DC5;
	Wed, 15 Jan 2025 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zkk84LCN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9159E14AD2B;
	Wed, 15 Jan 2025 15:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736956412; cv=none; b=gsM9b+6sWkzpd7S1uOu1bJwhgujAQ4vDcs8b5jS4xKTxcixLUOZ8I+FCpsD3CRPhPGIz1yTAA8zHm+xtqYdORlPgC2jgTEq0wnzMFlidOacIeqHoyK8gqh5lrSKvZuCufmz9mByZs9Jnp7tKZHzkjyoBLukfkIZwOHHMMwD3a8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736956412; c=relaxed/simple;
	bh=axX3FzCZ+FttAKh5XjvYZ/jUCYaQfNWhJ8H1+GJP+SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjhUJg7ugTp8/hcaPh6YZRvjMLI1fike86enqezOa4y+/0jVu2HzBkU1skTa5Gg91cML0NR3X2zvBMdrS2dzRc2T27hCO6YzETfkX9FSr58Fq1zlfeOQuXIxfUaH6xYqZJMUFk5CPAfmLElCUcf+S8sVjLLOZNB8kqGRZ7+NDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zkk84LCN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B392C4CED1;
	Wed, 15 Jan 2025 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736956412;
	bh=axX3FzCZ+FttAKh5XjvYZ/jUCYaQfNWhJ8H1+GJP+SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zkk84LCN/Vlvo9ht4uIp5uLKi+TbDV0U5j8LEJZHKlKqfBCWPYyXhNFM8yTcRPkO1
	 ILRAm0SAH9jWRC/K7JjIreWb+F485XfSQ6fJ5mk6NRLAPN7wV0N1RAL0O8eucfD+xx
	 JUWl9wITg2s4tBaaJUrtCJareb0Yd91eSExuZsf4=
Date: Wed, 15 Jan 2025 10:53:31 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 17/19] media: dt-bindings: ti,ds90ub960: Add "i2c-addr"
 link property
Message-ID: <20250115-brave-whispering-cougar-a11f26@lemur>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-17-e0b9a1f644da@ideasonboard.com>
 <iet6yl4mloktmpm7ngkug2dgtddriot7qwrkgg6loqermj7f74@mzyg34r7f4pc>
 <19c22201-e3ec-4d07-97ae-c149b172e480@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19c22201-e3ec-4d07-97ae-c149b172e480@ideasonboard.com>

On Tue, Jan 14, 2025 at 01:50:08PM +0200, Tomi Valkeinen wrote:
> > If you need it for your own patch management purposes, keep it under the
> > --- separator.
> 
> I'm using b4. I don't know how to do that with b4, but I'll look into it.

You just put them under --- in your git commit message and b4 will preserve
it as-is when it renders the email.

-K

