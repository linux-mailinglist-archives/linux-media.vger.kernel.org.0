Return-Path: <linux-media+bounces-23071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074099EB5EB
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 17:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53B3E280E8B
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 16:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4AC1D61A5;
	Tue, 10 Dec 2024 16:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyrwIaL0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F6E1B423F;
	Tue, 10 Dec 2024 16:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733847472; cv=none; b=iSLpjSGDAw2Fykvcb63tZoxDJZg1z/AHUmutjMnzNaqdLo1PRgYg2p+7sn4+RR7hjbshNiiySVAN2raKeEVIIkmLXc5KvbqGvEu4fZt1NW+oVq3nk/DxhpCNErmknLI0cOa9wEzvpGJS2nyus5A4kzvdRQ4xb0NqIPJJQBA9B6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733847472; c=relaxed/simple;
	bh=mAy8mZfozCkRb/an6jdqK6qrDkQCZWlv4noJr/yFI/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft6BTTbUfqqXHLEmHCIGC1dkWN5FCbKM6PlHFV29XO9vb4HgRCBlss5Mg4eQFvFynd2yUuQWV9TVIU8DE7EA6/YPFBHVOnRHyPgTS7LhVC5LddCjzbrl6j4sjLUVtE7iidxLXCLfFqkiXr4Za0m89IsCFmZr4Ug0as13+VviZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyrwIaL0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3B3C4CEE1;
	Tue, 10 Dec 2024 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733847472;
	bh=mAy8mZfozCkRb/an6jdqK6qrDkQCZWlv4noJr/yFI/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyrwIaL0rwtW86XXNKl7DLJocB1vlya/i1V+MqilQC5eamyUbtBCJeKQLRUsSzbAt
	 EALtl+hAGLjjff2SnuUXzrTnehAVukY9HQ0l/x5xBnelv+YxLjaSdvZ0LtwevTo+wu
	 T7zRHjc1F0xoBTEtwUh2aASrg50C2mkjyZI+lN/Z748EkxULn5wZRcutkd2ZEzotnb
	 iCEk55BNS+EqApv5CrFzpxH9/9HE983WEQvnmQCJoeIkKrYuiLujxYSNkFNlRFwRHZ
	 wBSYTgqiSf8/NHcUgze7FT2xdnkhYHyRhCCcu6isBY8irYQWyMbbgrCty0583vPuaQ
	 PrkwEQ8eMnKPA==
Date: Tue, 10 Dec 2024 11:17:50 -0500
From: Sasha Levin <sashal@kernel.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 4.19 2/4] media: vb2: use lock if
 wait_prepare/finish are NULL
Message-ID: <Z1hprohu1jEUYOX4@sashalap>
References: <20241124125856.3341388-1-sashal@kernel.org>
 <20241124125856.3341388-2-sashal@kernel.org>
 <49863857-f7b4-40c7-ae0c-3ba2bebe6200@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <49863857-f7b4-40c7-ae0c-3ba2bebe6200@xs4all.nl>

On Mon, Nov 25, 2024 at 08:33:06AM +0100, Hans Verkuil wrote:
>Hi Sasha,
>
>This shouldn't be backported. It is not a fix, and it relies on a number of other
>changes for this to work anyway, and none of those other changes are backported.
>
>So please drop this patch.

Will do, thanks!

-- 
Thanks,
Sasha

