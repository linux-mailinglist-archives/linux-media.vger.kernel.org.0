Return-Path: <linux-media+bounces-37575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C83EB03232
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 18:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 714131896F60
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 16:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6626D283FCB;
	Sun, 13 Jul 2025 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="UR4nH7LG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C951C5A;
	Sun, 13 Jul 2025 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752425475; cv=none; b=hLxbenKCgLfUkaVZVZklCnsxHsIRqtGl00SxdM7mJJ7+KoFfVc37GoGYve0U/Xf3NXhdkSpbRfpmvfxKS8mpD6FXFpE7ShWGKR4Km8nbtuLhaSQiyf9l1R+QCZMComHBuV2vx5i2/r4S+5wOLlxFz5qTP2qpWaWemxyXnQgpmBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752425475; c=relaxed/simple;
	bh=zR6O5JoJ3ZikYlA0rWHzDqoAeQrlqMX2NFuuoYA4mEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oXWOJqwVL8Qgj7jnNCmm19XDIkqMXGyB3zw5oQ7DO+AHG6lPq3dZprBcB3bCatr1XAAobjEdzDPELsKP+TrlF13GHhIeRnIgjU3PS8XmnC4tQvBJpR3Gi/WiFmBSTMGkunYdT2rb0ri5yBTjyOQeoqZEzGzbugY2l6Nw4LnBpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=UR4nH7LG; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=zmWRtsZllutRYMqXh9M/rrIA4GvWpIeoNVxj6XvjAKU=; b=UR4nH7LGveAdIbZl
	BokFnvJkHzj2RpgS4j/r+J913MAVJKCWsvISNoY+RBVmY3NJ7QZA26dT/rKccN/xUbLVlSTH1aa3E
	yn8BVUgaumxnIAxtCS4UeBjditrVBOyDrUuicmsyf+CP+eOfG9MTDnrKQJs8kEctL3DLIyzQygnv8
	JdTobjLd6t2fPOLxUnybv9vWoX6P4rMnAUt0wcfh1pMa0ikiZnUu2kGuUQ/YDMeuT4KDXl6FjNKZH
	W+5YL07ZLjcEEAZNlxl4m3L469/vcMM0uQI2QiEtaB5WPLNt3WtZltJwQ8tHszlcbWkrrKXpOLj9k
	wSArGTBTuAzz0CCBxQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uazuu-00Fo0N-29;
	Sun, 13 Jul 2025 16:51:08 +0000
Date: Sun, 13 Jul 2025 16:51:08 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	michal.simek@amd.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: of xvip_enum_frame_size and xvip_get_format_by_code
Message-ID: <aHPj_C6iGCEFDW98@gallifrey>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 16:46:25 up 77 days, 59 min,  1 user,  load average: 0.00, 0.04,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  I noticed in xilinx-cip.c there's xvip_enum_frame_size()
which was added back in 2013 but seems unused in tree, however
I had a dig and I found
  https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841638/Xilinx+V4L2+TPG+driver
has a commit:
  https://github.com/Xilinx/linux-xlnx/commit/1c113b4aef14004152fefc0e8b8dbbcc2314566f#diff-bb594682a92148570df8826933cf8629
  from 2014 that uses it - but it looks like that commit never went
anywhere.

So is xvip_enum_frame_size() or not?
I also see xvip_get_format_by_code() looks unused, but I don't
see any uses of it, even digging in that wiki.

Thanks in advance,

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

