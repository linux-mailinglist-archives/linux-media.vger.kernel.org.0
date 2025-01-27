Return-Path: <linux-media+bounces-25301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 760E5A1CF62
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 01:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1ADB166294
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 00:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B7C523A;
	Mon, 27 Jan 2025 00:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="F7IVyCwq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02016291E;
	Mon, 27 Jan 2025 00:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737938847; cv=none; b=NV8yI3fp3bQ3ecSuGXAoJGNi/8mmdxn4mEs/f7Khsl1oqNXbkS5wn+aBRYuHZbpGka8z2b6/PYYFoCTT6anm+2oVq8WCd783qTDKToj+i7wESvT0pZGqt9V5VOQqQCJOb5Z/V4U4qO6rPWtvK5DopYETAaQfKmB5qEgquUgpwIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737938847; c=relaxed/simple;
	bh=W9im4jG83X9gdqJZgmkXUmgjf6nxXYmEpTkA8Ho3lR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6pZDiYHpNQfsgc01NiQ7iD2a4mtIlb4HHOFh+99noajxhXhgkjLwIeBeQlIlRKEKBzdjuWpPTyvg+lgUC9KGxHyWidZ6BdzirJJ7IuwsBoYRrBO42O8JeFAIENhqJDgfd5xvLCuslTxQzJPpTR5tg6XKxyrSLrjkiv/5f77iXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=F7IVyCwq; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=11JVMHa9ESzCFzaKAlJ98maILC70wuVRg08DC+E9mtI=; b=F7IVyCwqIxjcipKP
	2Fi0HnUm3OkawvnkegdPhxLA8zLve+QVOAim8+7QrRG0Q83pXepulPE9kQLCMXmdU5MOMBwmbIdq2
	AWhHjJQTnKL9q++U/opjF8osMgs54CeHNYE4OO1WITEiOJCZ/U9jLYLqhVNXh49Im5JMmHXbjt0pj
	9NJTcsx08x+6fdov5aXKlNAxRLNvb3hydGwV5iPwnszLk55fZ2MBWGXCCl/PJEUjsgeGk6ze8NKAO
	9HOsnLm1o9v7RdZzENJVmkfAUVpAo9jyl2FPhVNwg4p7ZWbM0D/s/7jsLuRSW+58QNXjFci7s4ic6
	7+zfHkQjOHNRwBLxow==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tcDHf-00CE1G-0e;
	Mon, 27 Jan 2025 00:47:23 +0000
Date: Mon, 27 Jan 2025 00:47:23 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: mantis_ca_init - missing call???
Message-ID: <Z5bXm43f8BLLeCXy@gallifrey>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 00:37:26 up 263 days, 11:51,  1 user,  load average: 0.02, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  My scripts noticed that the mantis_ca_init() and mantis_ca_exit()
functions aren't called anywhere; I was about to deadcode them, but
hmm, to me this looks more likely a bug, but I don't know
the code, so thought it best to ask.

mantis_ca_init() sets up a function pointer structure to a whole
bunch of static functions that can't be called; so that means the
whole of mantis_ca.c is dead.

commit b3b961448f70 ("V4L/DVB (13795): [Mantis/Hopper] Code overhaul, add Hopper
devices into the PCI ID list")
removed the only call to mantis_ca_init() in 2009.

Similarly, the last call to mantis_ca_exit() was removed at nearly the same time
by commit 0bdc799b8b82 ("V4L/DVB (13802): [Mantis/Hopper] Fix all build related warnings")

There is a commented out call to mantis_ca_exit() in mantis_dvb.c.

Thanks in advance,

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

