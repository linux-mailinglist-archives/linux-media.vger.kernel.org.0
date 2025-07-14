Return-Path: <linux-media+bounces-37615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1AEB03FE6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 015891A65122
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D66255F5F;
	Mon, 14 Jul 2025 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JcSXgt28"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C7254874;
	Mon, 14 Jul 2025 13:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499501; cv=none; b=W7U8kBUOygey8sWgmM1SVvlXKn6otQ4J4+YsWRV501fqm4v9rE88bK99N8ilsXG18EsKU/JKmc32uTsWNuA23RrBQY6kPHFakEW/xGaXNnBVutmKAYqbTx8CeXrf07AQ2xZVILrayOwY9yzpwiuVhA8SceQNAPZ2VFt0W6QJ1LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499501; c=relaxed/simple;
	bh=XNsmrsqoNuhN3KxH1msEWfTKbHMlz3X4D7cewCe/3+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuUVJAJl0JQ141Bd8cQAQR73JOF9uAGxhVV/8YpMZyGf4ugt+cXbjB8onzmwusXP3R2aF0xNeJInhlWI0l+BscIEqJhKsOinyE8rzYzhxEHz2ZpU4ekD3GBDwFObE6IZY15qdmOqGWiy7jJM4a5sYnVLFAH3uvxiBtpkzu54KjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JcSXgt28; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E07C4CEED;
	Mon, 14 Jul 2025 13:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752499501;
	bh=XNsmrsqoNuhN3KxH1msEWfTKbHMlz3X4D7cewCe/3+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcSXgt28wb5AhwwzeH9ZKpOPB3AVpuiJBtov4cya0H//TJP5Xvd91dc/P0d7NEYZD
	 pOwZXLReDEOFrfO9kw3QqY642rwORIYXT9KAH7Ejl0Q2dePpq2ZwQfOPdS2NIR/IF1
	 nNUJCnXd2xQelLYPDP2rcmE8FQGXUCn6dV6T6oBs=
Date: Mon, 14 Jul 2025 15:24:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
Message-ID: <2025071444-overeater-washday-405c@gregkh>
References: <20250714131953.45947-1-martin@weidenauer.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714131953.45947-1-martin@weidenauer.cc>

On Mon, Jul 14, 2025 at 03:19:53PM +0200, Martin Weidenauer wrote:
> 	Fix checkpatch error "ERROR: that open brace { should be on the previous line"
> 	in ia_css_dvs.host.c:277.
> 
> 	Signed-off-by: Martin Weidenauer <martin@weidenauer.cc>
> 
> 	---
> 
> 	Hey, this is my first patch, I appreciate any feedback. Greetings from DebConf25!

Odd indentation, how did that happen?

thanks,

greg k-h

