Return-Path: <linux-media+bounces-18291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5219792C1
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 19:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D931F227C5
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 17:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F5D1D1310;
	Sat, 14 Sep 2024 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="GQJ5jy8a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D1433BB;
	Sat, 14 Sep 2024 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726336618; cv=none; b=EvNZ3aIeJMBFO5vbTyOKXbRiIf8yebHI8jVoC+ex73bdTRf+SGYvjv9ccBP/6NuF6m9coS2+s6Y9sCEFoMKQsNvhaRaK/8Exb/PkGAt7ath73Vdxg0B7vxwE+Jgh9axL659yoevTsl32V8uAJ8gibGQU1Rwfk44UVLEwZi+nGUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726336618; c=relaxed/simple;
	bh=dD7xaoWu9YGaPQ3bJ0EPoxTKTYlYt+kZpnhjEU2jeA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBZrpgLYzAsXTnnSDtLpv4GWgAWmbgW1Y/P/ubrdSCZuPaj6/EA+BrK4ImClRpJWaKxTHr3ie+xfdVVhpad2G8SIc2YDwL5/ucOFZfphFXsYQ1ZNsy19vdgSpSZbQ75j3utEVWXwt1vRI/yntdEIsIXquMtpESJZ/eoE2ZmSoow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=GQJ5jy8a; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=4xjUEiTV/Fxa2/tsOWp1Mc3wNtQvWZ9FHr+91WMPEJw=; b=GQJ5jy8anA+yuzbb
	//tYn/enOX9yur2wa/nKlrLR6yMlgFFlzIxeJ6B7lFsf25umBYTOLH/s5HAWndgj24aFXBnKBdJYQ
	Frme3lhPt1P/Jkiw5eNxTGC2+CGtariFnwPY5E+W3d/yTHuVg8yAfFMUkq0jew0LLXB9XxI6RSLI0
	qAThq0O6cz0vURk4HzgK+xF0Vv6n6I3g9CVPRkhZBmBJBJKkbL/zJPedxDoNINOV7K5O7/YFJIpxn
	1OZi1JgfRURdTHjKZkwXoMPbEw8xniONQDBQbhGN8yExoBo2auKQooy6ekEwV56zZ5B8w0TR6nP42
	Ukv4ZlvNJN7UKsqoSQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1spX0k-005lyK-21;
	Sat, 14 Sep 2024 17:56:42 +0000
Date: Sat, 14 Sep 2024 17:56:42 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: atomisp-libmsrlisthelper.c
Message-ID: <ZuXOWjvVYa64c1-5@gallifrey>
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
X-Uptime: 17:31:48 up 129 days,  4:45,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  As far as I can tell none of the functions in atomisp-libmsrlisthelper.c
are called in the tree any more; I think:

commit 3a81c7660f8021967dccd52624fa1a6fcf117000
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Wed Sep 27 14:24:56 2017 -0400

    media: staging: atomisp: Remove IMX sensor support

removed the last users of it.

Would it make sense just to remove that?

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

