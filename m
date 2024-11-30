Return-Path: <linux-media+bounces-22386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 280299DF1EF
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 17:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4C73B218A1
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 16:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5780C1A0BEC;
	Sat, 30 Nov 2024 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mhnnet.de header.i=@mhnnet.de header.b="LdAomnqX"
X-Original-To: linux-media@vger.kernel.org
Received: from server.mhnnet.de (server.mhnnet.de [202.61.202.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE819D8B4
	for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.202.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732983036; cv=none; b=bOS6MlBuEq6DHEpzDRnfgkwqL6m8V7MqEaVvu0CGvetswf5EqPM09nbeskGXDxq3UITFKNfPYtsHKdWo4hSpW0eWOORFm/jbCC1KG83NrhwbbZtbPrOV4IqWACqOI2Qm/ivyhvdyt3FKyR7jGNuoVavEnz/Ha6hwbRRm1aHibpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732983036; c=relaxed/simple;
	bh=xTtrWQvhZrWUP3CbYfJStkHpc3wiI1yXq1woJKPrilA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRPgO7ALUnDy1nCNFWDnLJZJeLJNYIbVeAvyeeEYt3uZhFnBnIoZdhPDekGvshVzOzmCeTo4B5nKeJ2H8C2Ovphyd+x1g1iybk2kHBPp7umdKamvLwJa8dBoqgPT/Z9t4TdkEPIIRa7HUWOkD3o4UNpiPk5SIVnjhfSxyG8ASRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mhnnet.de; spf=pass smtp.mailfrom=mhnnet.de; dkim=pass (2048-bit key) header.d=mhnnet.de header.i=@mhnnet.de header.b=LdAomnqX; arc=none smtp.client-ip=202.61.202.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mhnnet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mhnnet.de
From: Matthias Nagel <matthias.nagel@mhnnet.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mhnnet.de; s=20231028;
	t=1732983023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yEO0Kug57RgQ92a5O4eC4F8aSEBSQLzGLuhqn1kbjuI=;
	b=LdAomnqXw6JRkTDeH5xN6Qs3y5sopbisrECdX35OgogSvqaGt6kCht8+EPkgr6J4VKhxQK
	nZYdoxJwLiJzf/xYDVX23Z8zu+9SYRBOpQwnkuobgH1lJ8w1EjSRJqzjo75MVojJbmYcK4
	yudM+Z6y2y2I9LGQyUCG4oT6XKurTf/QUWZK91zHxL1Jqe2OwZnweb1YKBp6pfizLhIAME
	XQm0zeAKGumvqD/aDPMXVm9UIVEwXujQkwf862/+fw3bLgCpt4PjginyPp+hK/Z5RRudkt
	iZb2ZQnMqunFLgzwVh0MgdcSDkMldJ+zLzKsnPSJGCWlEnbm4z0thxxS27Brug==
To: "Cao, Bingbu" <bingbu.cao@intel.com>
Cc: tian.shu.qiu@intel.com, sakari.ailus@linux.intel.com, hch@lst.de,
 linux-media@vger.kernel.org
Subject:
 Re: Kernel Issue #219534: VIDEO_INTEL_IPU6 depends on ARCH_HAS_DMA_OPS
Date: Sat, 30 Nov 2024 17:10:21 +0100
Message-ID: <4979834.31r3eYUQgx@matthias-laptop>
In-Reply-To: <D40EACC2-E222-4D97-9742-8D5AC09C92BF@mhnnet.de>
References:
 <5837710.DvuYhMxLoT@matthias-pc>
 <DM8PR11MB5653B751BEF8716894ACA3A499292@DM8PR11MB5653.namprd11.prod.outlook.com>
 <D40EACC2-E222-4D97-9742-8D5AC09C92BF@mhnnet.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello everyone,

Stanislaw Gruszka asked me (see https://github.com/intel/ipu6-drivers/issues/303#issuecomment-2507255464) to drop you a mail for the regression in the IPU6 driver for 6.12.1.

The bug is tracked twice: as https://github.com/intel/ipu6-drivers/issues/303 and https://bugzilla.kernel.org/show_bug.cgi?id=219534#c2. The latter also summarizes the relevant commits.

a) I would like to assign https://bugzilla.kernel.org/show_bug.cgi?id=219534 to an mail recipient (CC). What is the correct mail address for that?

b) IMHO, tracking the bug at two places seems redundant. Which bug tracker do you prefer? Which bug shall I close?

c) Last but not least: Is there any chance to get a back port into 6.12?

Bests, Matthias

Am Donnerstag, 28. November 2024, 08:11:39 MEZ schrieb Matthias Nagel:
> Bingbu,
> 
> it seems so. The patch you pointed me to, removes the dependency on ARCH_HAS_DMA_OPS (again). I am not a GIT pro, and couldn't check which kernel version incorporates that patch. Do I assume correctly that it came out _after_ 6.12.1 and 6.12.2 will include the patch? In that case the reported issue in bugzilla can be considered resolved for 6.12.2 onward.
> 
> Interesting question though is why the dependency made it in 6.12.1 in the first place, it wasn't there for 6.11.*.
> 
> Bests, Matthias
> 
> 
> 
> Am 28. November 2024 04:24:04 MEZ schrieb "Cao, Bingbu" <bingbu.cao@intel.com>:
> >Matthias,
> >
> >Is this what you mentioned in the bugzilla?
> >https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/pci/intel/ipu6?id=c8e9120c2065868d97e9e94bceee777e5db08c3e
> >
> >------------------------------------------------------------------------
> >BRs,  
> >Bingbu Cao
> >
> >>-----Original Message-----
> >>From: Matthias Nagel <matthias.nagel@mhnnet.de>
> >>Sent: Thursday, November 28, 2024 7:13 AM
> >>To: sakari.ailus@linux.intel.com; Cao, Bingbu <bingbu.cao@intel.com>
> >>Cc: Qiu, Tian Shu <tian.shu.qiu@intel.com>
> >>Subject: Kernel Issue #219534: VIDEO_INTEL_IPU6 depends on
> >>ARCH_HAS_DMA_OPS - Which one to put in CC?
> >>
> >>Dear Sakara and Bingbu,
> >>may I kindly draw your attention to
> >>https://bugzilla.kernel.org/show_bug.cgi?id=219534. I was asked to
> >>find the maintainers for IPU6 and CC them. I got your mail addresses
> >>from the MAINTAINER file of the Linux kernel. Hence, I hope I found
> >>the correct contact persons.
> >>Regards,
> >>
> >>--
> >>Matthias Nagel
> >>Dachtlerstr. 2, 40499 Stuttgart, Deutschland
> >>Festnetz: +49-711-25295180, Mobil: +49-151-15998774
> >>E-Mail: matthias.nagel@mhnnet.de, Threema: 86VM8KN7, Signal:
> >>nagmat.84
> >>PGP: https://keys.openpgp.org/vks/v1/by-
> >>fingerprint/6F0EE7ADC9C2515659DB6CE52B2917C14D6851F7
> >>
> >
> 
> 


-- 
Matthias Nagel
Dachtlerstr. 2, 40499 Stuttgart, Deutschland
Festnetz: +49-711-25295180, Mobil: +49-151-15998774
E-Mail: matthias.nagel@mhnnet.de, Threema: 86VM8KN7, Signal: nagmat.84
PGP: https://keys.openpgp.org/vks/v1/by-fingerprint/6F0EE7ADC9C2515659DB6CE52B2917C14D6851F7



