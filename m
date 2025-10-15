Return-Path: <linux-media+bounces-44554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF3BBDD9B2
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BBBB3A3092
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DACC3090F7;
	Wed, 15 Oct 2025 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpRQy1Vc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9B2C235F
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519290; cv=none; b=iK3kBB8lpplBnuAXb6EvLWnxzl6M8cDJ96EUyhy150V099QPfEQylzzjmhpSNkRakHucNUt0USqrKbG8WT7kV0E6lVQEuhVpn2L5EtD6CXxpo5jKRIoUXueHkzYwRqOBPXJmiYw/ZqI6a0zmxGW9Eo3LXl7Yq1b9/l0h+DhyL1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519290; c=relaxed/simple;
	bh=lhsahFCrFdZreObcCkK8kdwESy929d/0SzfO4fkASuk=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=UGP/IoNceS8EoA9Sdh8gBQItSeU8OSM1W2vhGkQg5NSUz84trk5RmRHGRhe8rj/Imj8B0a2STiSoLnap5Em58zoL/kIWn4xr1Uf8MtPb+JDj8oosXh1OjtMWQcB2i8bRZL4Tg/FnYSrWEagM/etHzYLgny1CkRcrJJV6fzwfWYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpRQy1Vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19948C4CEF9
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519289;
	bh=lhsahFCrFdZreObcCkK8kdwESy929d/0SzfO4fkASuk=;
	h=Date:From:To:Subject:From;
	b=lpRQy1Vcw4nXebIjMo8cA542JHYAKnlGOOVRyd5DK8acVkleeUQhZSkne6sc8UWwi
	 fj0jo6LH6BaGvMjKhW88pP4IdtCsefwvlP8G9M2yVbZjKW++BDM4eMXt1zejEP87OL
	 lIPg57NKX3gSClfHW2qFjci3bnX5yjj2ZyVmdOu4dm8o6c8XAHIGpc29JKAvoYmJ8K
	 5nX1ViYmAwmrcMrWyRDb5i053rNWoBfFSeoFvBXhx8AyvD8Q0dCzpyFGCM9tUftNJr
	 8nZ491RgGf3KKp88ePAppIF2bZ8sb9wSQk6NDanKojaMjuxMr0ekvOVa4jW093NIMw
	 4HHGvDqzr6bLw==
Message-ID: <0fa3fccd-c619-4a98-b50c-41fd513a847c@kernel.org>
Date: Wed, 15 Oct 2025 11:08:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [ANN] Media Summit 2026: co-locate again with Embedded Recipes?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

The Embedded Recipes conference 2026 will be May 27 and 28, again in Nice, same venue
as this year (flamingos!).

We co-located with ER this year, and I thought that was quite successful. I also liked
the meeting room we had, so I plan to be early for once and see if we can get the same
meeting room for (hopefully) Tuesday May 26 2026.

But that assumes that there are no objections. The alternative would be to co-locate with
the Embedded Linux Conference Europe in Prague on October 7-9 2026.

Let me know if co-locating with the ER 2026 conference is a problem, or if you really
prefer the ELCE, or have an alternative.

If I don't hear any objections by the end of the month, then I'll see if I can get the
meeting room organized.

Regards,

	Hans

