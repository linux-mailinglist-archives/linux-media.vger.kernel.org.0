Return-Path: <linux-media+bounces-25173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 030AEA19C40
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 02:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB958188D213
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 01:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA881CA84;
	Thu, 23 Jan 2025 01:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="nmJJ0iq0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69692629;
	Thu, 23 Jan 2025 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737596169; cv=none; b=O+ON5O8Pb1hxCmwT3/Cbe/WTzkI2uUBecSEcxpRt+MjpeJF1+u30dKyjN51YQcnvNjzJabCeOQG8IqT/Sn3IQjfHbR8VAnCZUlsoZ5r0Fat9wO1LPWEPqNpsqf8xwkyD+qLlXtm7//vyES4ahmu6mqxnOYnbBovVOAWawPZI+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737596169; c=relaxed/simple;
	bh=MC4Lw8+dfOefZDDB9so3Da+KfFp7b6BMLbODTxdiQkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ULg44KTwkqIIRZpHO3KtkDRL3Ac1rZTQ534x25q4Dlz2rdkKZ2bVN4ufOMGwEO8Y0WFNU6xeCRMeyNhM18XpH/VpUk4dFrOHsrX73+K8724zmip9xcaMSXhJMI4wAICXULf4N04bPghnoZRX+NALZhL87SRXtPvb1SOLJF1DiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=nmJJ0iq0; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=TOUAhIYWQ8QyfPdE/Sso3IssDYoUMKXmjWHhP3JSAYI=; b=nmJJ0iq0ejIHjoc8
	i7lqBcKu0wJMhLSULUSP6EOz8uOeJgdqtmOTli59gKOWCaIkkatPtcPWfBo1uXZdcmjF2ikMgtvSw
	BTVs23FnVL6O8OUtIBx4mJVLjE1rVOfdKrmxpasLwWn7l+Kd9H4YxT1DZQolATC1oWdDtBFJ1GnnO
	TqDbOo2BsaluKO19hm+OUhfK7XVXhZvJYPkPFMMehAJt4xQzOrZ8a1fLGwOjo0mOOX0oKShGumz8Z
	da4epTxwiTqYD3F3IOAgvsHsZdsA1oElH/FrpbPTvcqkgxKyRWkgr5ai81QPGo+fUb8G98KsG+bWr
	KTboHxpYTnjySXKQQg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tam8b-00BbDu-1z;
	Thu, 23 Jan 2025 01:36:05 +0000
Date: Thu, 23 Jan 2025 01:36:05 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: of lnbh29 and lgs8gl5
Message-ID: <Z5GdBZ5A7AGhjRzU@gallifrey>
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
X-Uptime: 01:28:57 up 259 days, 12:43,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  One of my scripts noticed that lgs8gl5_attach and lnbh29_attach
aren't called anywhere; that makes me suspicious whether any of the
code in those drivers can be called at all?

  From what I can tell in git history, lgs8gl5_attach last use
was removed by:

6bf1a997ed13 ("V4L/DVB (12423): cxusb, d680 dmbth use unified lgs8gxx
code instead of lgs8gl5")
way back in 2009

lnbh29_attach was added in 2018 by
1b09dd9ff8a5 ("media: dvb-frontends: add LNBH29 LNB supply driver")
but doesn't look like it was used.

Am I missing some other route to these, or are they dead?

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

