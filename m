Return-Path: <linux-media+bounces-23371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 652609F09DE
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BC70282803
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDF61C3BE5;
	Fri, 13 Dec 2024 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIpPOtYl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBB1BB6B8;
	Fri, 13 Dec 2024 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086538; cv=none; b=AYfGEtyGVmAsK+4hwfkvkMeffC+Mm12y4045B3XQuWLa7V3OABDOesHJtGwGOweEHO1/JlUi7i3QJ9gzauypNl2V485zSWYKbSqHazYHJr7htLzKEPTgXkNdt+wqg7zqWDr80b35KdhfgGhAY39CdE7l1U/dTn75gv9ZTZO/cbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086538; c=relaxed/simple;
	bh=YCRSfsCR0H7j5DT02vvh1WjN/AA7pKlT4vzd9klUb9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzqTyq5OooVToEvH4zyndRsP7okbwg67uoV1v/VCBVRUvFNMZpHQH8C3j7KvstBqsoxGqMoygod1A/wRXiCfJCDzRvE6k4SufVXaKeAVYB0+1yVeu7pvhwS7KZSi8vggkGw3GRBXsfaXz3uGgiM1OfB19ibW8SZMielruss8Z3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIpPOtYl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114EEC4CED0;
	Fri, 13 Dec 2024 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734086537;
	bh=YCRSfsCR0H7j5DT02vvh1WjN/AA7pKlT4vzd9klUb9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIpPOtYl+1Ss8ywsdiPsmsy9xA4GgA4kMKsRS9gp3SYldVavtdGgsKqf4EdP+5L/g
	 56VMcEbMgL1Xr2mi5EZG5aThoMb3tdcEurNcY/HbNOFo4kwoBGwCn5mp5zkmU9299u
	 3YdIMZ4CAEY1GBxn79TMcb7xIeuWBbHTx1nX2dafz0jmUt4g8kTuuzPS0NWcZ/cQrD
	 /EJIJnyuSzQVH/Jej3EiqBejmnBSuO5Y+vMb2kgEXfvbqptJnf2Kvhg2zXQ/Ht5Tq5
	 jwGJG3VgtNp6l4bSCBvvhtZFwJtnTo9yLhXeMxrDqp3Ia9gRRz9nme3zjzu9jQ5W0P
	 qYp8yeERHNPtg==
Date: Fri, 13 Dec 2024 11:42:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Johnny Liu <johnliu@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, mperttunen@nvidia.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] Support host1x actmon
Message-ID: <jgqdgq6mifzex3tonl4sxbehwmcjo4jksfqmh7l4z5e2v4dqsj@uouomf3gyj7v>
References: <20241210174554.18869-1-johnliu@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210174554.18869-1-johnliu@nvidia.com>

On Tue, Dec 10, 2024 at 09:45:49AM -0800, Johnny Liu wrote:
> Activity monitoring (actmon for short) is a means to dynamically
> measure the utilization of units in the system to help drive software
> power management policies.
> 

Is this a resend or v2? Please always mark your patches appropriately -
see submitting patches document.

b4 diff '20241210174554.18869-1-johnliu@nvidia.com'
Grabbing thread from lore.kernel.org/all/20241210174554.18869-1-johnliu@nvidia.com/t.mbox.gz
---
Analyzing 6 messages in the thread
Could not find lower series to compare against.

But I am sure I saw it somewhere...

Or just use b4, so all this problems disappear.

Best regards,
Krzysztof


