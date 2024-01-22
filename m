Return-Path: <linux-media+bounces-4035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAE4836C56
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 18:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CCA41C27266
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 17:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36421481DD;
	Mon, 22 Jan 2024 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDRjbf6z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9947E3D98A
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705938273; cv=none; b=B4eP+T489IvbQPwVbqQHRYfox/zwNR9EqS+lO+yXjLK3gS3/SL8bY8ByneerTxRzsvgmVEXaDFzHUWFpSUxDxUXW+NH6poifdT0yr0hQ8/z+dfJW0VZwBl/sBXm2ncfI8CdgYPiGb29FNA1mK/dGCLHmsJSH1ScWgDWSiG6KhDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705938273; c=relaxed/simple;
	bh=t7A3dsJ7Bv+ZbJAPgCKXckbRmd3MRoy4+abuvLC92qo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ghtFIhT1/YGElpWrG21rTYC0HA6p0hD8X3SFDu1+GfFMpdExtHNONCm4bgOL4b5yBU3xnci4w3jeYaR4pLBZwYPqsaRNPVWd8RchYfhU/qvTD/xaDVryV1cVmVNryhzJLODXQ0G2jjpH4rxjsNjjg6rw8mILNyjHIejSi+JsXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDRjbf6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E11C433F1;
	Mon, 22 Jan 2024 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705938273;
	bh=t7A3dsJ7Bv+ZbJAPgCKXckbRmd3MRoy4+abuvLC92qo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nDRjbf6z6AFZOcjT1paNX5UNHjstzUrbX1xkopHMVgrULgORL5e5aT8wxMvqsC45j
	 4ogp4bhZ7NuaAmOegVhwQ+4q2pDTJ2Vvixv3nhO5xmBh3RPZp8yW+IgMyWWLiK+HM4
	 puwm6BcSGIAu/AEYoSP5fJCYpoEEiAl8AzPqeuRQypOdbKWyqtwWHc+UmetSCHFGcv
	 UYRqvL5W9oJ3maonbMdcSjo8LmumvR/aIG9LMsKfEZAWB2e/cdLlD6GCL/wrwb3MtI
	 3yniKjixToAF4chLZQWMZy7KfqXaaPzQ/c3OkvI+bc1YxZXpfXZ2xU8cmPt5gxddDS
	 iB4dekcx0DcFg==
From: Robert Foss <rfoss@kernel.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20240110090111.458115-1-alexander.stein@ew.tq-group.com>
References: <20240110090111.458115-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 1/1] media: tc358743: register v4l2 async device only after successful setup
Message-Id: <170593827161.3113266.3202013781260887557.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 16:44:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1

On Wed, 10 Jan 2024 10:01:11 +0100, Alexander Stein wrote:
> Ensure the device has been setup correctly before registering the v4l2
> async device, thus allowing userspace to access.
> 
> 

Applied, thanks!

[1/1] media: tc358743: register v4l2 async device only after successful setup
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=87399f1ff922



Rob


