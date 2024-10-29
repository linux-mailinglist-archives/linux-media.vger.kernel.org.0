Return-Path: <linux-media+bounces-20467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDF9B3F2B
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 01:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9240B219F4
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 00:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CF5D51C;
	Tue, 29 Oct 2024 00:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CQxdC7u1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1666463D;
	Tue, 29 Oct 2024 00:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730161856; cv=none; b=sPvFIhB/t6LdFKKyibK9UprV4z4Qfl03175aJM53iGTbihbAIMjHM7pzlx2TzDaA2fCMYe+9AcDZ2E0fkJGyWiSKrjBAf0PCOHU8XzPlZP5GgVqHlKbBGvZuaA4O4nRFjPd38KzdjxM2ye4kf1/93ZjXKUzgStZNtNQqgpegSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730161856; c=relaxed/simple;
	bh=CVrLhzU5+d2LSEsi4y/ttfHu2AnUh555Gf6yMqZy7T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8rjZ+2Q9hYWtoRywYSPCA2ymazk+Be0h+N25skgK7Ozrn2ExLQ4KrxfWLOiAHN7EmtSTfBqH3O70wVZKvsA6qsUfhSaGqRb1pXdrBAUIixXm4vKz9RKgCMWT5o+yo1jBIWVszkKGjYgEs6pyV2ZKa5Pd9irI4ZIyTDaX7mZ2zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CQxdC7u1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D18C4CEC3;
	Tue, 29 Oct 2024 00:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730161855;
	bh=CVrLhzU5+d2LSEsi4y/ttfHu2AnUh555Gf6yMqZy7T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQxdC7u1I+BpCT/6DfXjQHY15j/W7Me6haHGPjvSsAMFIr4i/68WrnDjvMHzuNxx8
	 L54KEtz9taUBuzKY7ZbKR8I5m1YI5KtFH6BThOiv68PGWUtTCzGb+wAMeBkAchZBbc
	 qAOaxxHC2QXKXFePoiOjDtwcFuws9w3t6Cj9oQg4=
Date: Tue, 29 Oct 2024 01:30:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] media: remove dead TI wl128x FM radio driver
Message-ID: <2024102922-faceplate-recycling-b47b@gregkh>
References: <20241028083030.26351-1-lukas.bulwahn@redhat.com>
 <CACMJSeu32-cnn01WoLbv4ffbMt3CfF0MTqbkxZHvu+4HQio=Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSeu32-cnn01WoLbv4ffbMt3CfF0MTqbkxZHvu+4HQio=Mw@mail.gmail.com>

On Mon, Oct 28, 2024 at 08:06:52PM +0100, Bartosz Golaszewski wrote:
> On Mon, 28 Oct 2024 at 09:30, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
> >
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit 78fe66360ed6 ("misc: ti-st: st_kim: remove the driver") deletes the
> > ti-st driver and its corresponding config option TI_ST.
> >
> > With that deletion, the Texas Instruments WL128x FM Radio driver is now
> > dead as well. Delete this obsolete driver.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Amen!
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Should I take this through the same tree that the misc driver was
removed in?  If so, please let me know.

thanks,

greg k-h

