Return-Path: <linux-media+bounces-6523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD81872A5E
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 23:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AB651C24F8F
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 22:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7146212CDB3;
	Tue,  5 Mar 2024 22:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2fSTdGW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF57F1EB33;
	Tue,  5 Mar 2024 22:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709678658; cv=none; b=UM/Pd5ig0hhMNyKEDuSQfDK7pO2/hsMaikMwTFt2jgbLBuWATsLn3jhSzjEy6H+ury4yRiESDBJzeX765xAG9wZdfGXp1n3ZEZHu4LqP7nL1cnFd2cklQil0ISz4sV2UtIz9aZ6ndG5SjiqrzWKk92syIx5M8cH8cPN01b5nJUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709678658; c=relaxed/simple;
	bh=W8lxsW+JDwVbeKpPv4XZGtjdXz0JvmAoEChxgdAQdaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/c3a/V8wJxTMjoMJRTueCvlezyoNAInhdJJrm4vvf6Gn5UvNDVRjszZzFKtgDr/BvU9ZEWqKTzcS3aH15Kv1/zbWCyTGwwWDFHvsNnZNHIvg/duSrTvLFWBZgmnKQ6qp6R4vIccTR6eikSpoNCT0G8+TYzyb2xbTjQ+3gEg3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2fSTdGW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0922C433C7;
	Tue,  5 Mar 2024 22:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709678658;
	bh=W8lxsW+JDwVbeKpPv4XZGtjdXz0JvmAoEChxgdAQdaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2fSTdGWEP7moLScZfFqb3jxtDs+1+En/JS8S98psYUmcpbmW8UumYlDa7G0+C6vk
	 Z1wX50rnLjMmna7m09pyzacXqkj8p1G2+0KKOQps2PwzfQrOA7kTDs5MRjuUqFGXs5
	 13rK3nPnb9KXBYF+DyrwRsodkBAb/8Ns4mdrUhBPAEmrPdUIbuAFPTTDp/Ai+6UmnE
	 gr4sLQVrU0faiz/4XXwYi/unecxwCrLrhR4A0YJ0SamGhacrxrsVEuKY9hvRYDefvG
	 FVGH7eADbzZ588z9Jv41DxZkYYnLyzIgqmPL8lW1bPN64P82alzJYq0fsXGe48nE/v
	 sPMoH4FvSDyCQ==
Date: Tue, 5 Mar 2024 23:44:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [SPAM] [PATCH v1 1/5] media: ir-spi: Don't use "proxy" headers
Message-ID: <oqrfn5dp47wh6znalbw4lazkkxk6qwb6cwronkuxvcnv3xodsz@blevdhasmwuz>
References: <20240305174933.1370708-1-andriy.shevchenko@linux.intel.com>
 <20240305174933.1370708-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305174933.1370708-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Tue, Mar 05, 2024 at 07:48:26PM +0200, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

