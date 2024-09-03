Return-Path: <linux-media+bounces-17490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F7696A629
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 20:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 943ED287870
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 18:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7749F19007F;
	Tue,  3 Sep 2024 18:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Ataplj0G"
X-Original-To: linux-media@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A24EF9DF;
	Tue,  3 Sep 2024 18:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725386831; cv=none; b=j3A9jxqao5fx0RdZhpiGv7k8XkbpyGqqlNCggkK7XTAuGLlB/hy7Dkfg4bWQhm9TfzgPsDnfLkHYW35CnNLkCtQRH9i/9s6bbLT7gRW4xnBUt29xNqJBLcq3xNfrt0pTQHD0Qb5Mjy1KFhs350G2x59G6uCp1Cp2YfCnj8LSrvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725386831; c=relaxed/simple;
	bh=GcyWQO62Icmx4b81tJNoRo89mbEkBZ4wiHm4cqVtjbg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=R5lFOLNAcl6bAu0Y9/zhWn5LDRVdCQdHTZEm7cI9EmlaHNxBFazeChvSAL2dD9iAXbhxkgU7qKgVKfbrx4UfKIhE1ppi49KeLw4RHc1mA0u9CcSgwzFJZd5h3b95PSEk6IJFxQfX5jcDc1mOFnfc5d3f/VNtxZ9+ASFJT5WwaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Ataplj0G; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from smtpclient.apple (d66-183-91-182.bchsia.telus.net [66.183.91.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7313C20B7165;
	Tue,  3 Sep 2024 11:07:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7313C20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1725386824;
	bh=eDO1Gub+WhZH8e1yf5DOAq4k3qry711BGtAlfp/se7c=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=Ataplj0G1mJQ7jpADnNfZwl/BaDhy+4NcF3ctLVfTPGo3y8YDLo8rvOGL1dt7I5iX
	 95S4fwK1a4WgoRp7i99SXDxPcsNindIBOq8Zpq+JCr6n/wypWoABYpR+zP3YYpFjWM
	 LRZNkPa0HlgUVZZ8LlGdg3J9nSLRg2EDzLigUO3U=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [RFT][PATCH 0/5] firewire: use sleepable workqueue to handle 1394
 OHCI IT/IR context events
From: Allen Pais <apais@linux.microsoft.com>
In-Reply-To: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
Date: Tue, 3 Sep 2024 11:06:53 -0700
Cc: linux1394-devel@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-sound@vger.kernel.org,
 edmund.raile@protonmail.com,
 linux-media@vger.kernel.org,
 netdev@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EB8EC5FD-AB6C-48C3-8980-65E8CB444BDF@linux.microsoft.com>
References: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
X-Mailer: Apple Mail (2.3776.700.51)



>This series of change is inspired by BH workqueue available in recent
>kernel.

>In Linux FireWire subsystem, tasklet softIRQ context has been utilized =
to
>operate 1394 OHCI Isochronous Transmit (IT) and Isochronous Receive =
(IR)
>contexts. The tasklet context is not preferable, as you know.

>I have already received a proposal[1][2] to replace the usage of =
tasklet
>with BH workqueue. However, the proposal includes bare replacement for =
1394
>OHCI IT, IR, Asynchronous Transmit (AT), and Asynchronous Receive (AR)
>contexts with neither any care of actual usage for each context nor
>practical test reports. In theory, this kind of change should be done =
by
>step by step with enough amount of evaluation over software design to =
avoid
>any disorder.

>In this series of changes, the usage of tasklet for 1394 OHCI IT/IR
>contexts is just replaced, as a first step. In 1394 OHCI IR/IT events,
>software is expected to process the content of page dedicated to DMA
>transmission for each isochronous context. It means that the content =
can be
>processed concurrently per isochronous context. Additionally, the =
content
>of page is immutable as long as the software schedules the transmission
>again for the page. It means that the task to process the content can =
sleep
>or be preempted. Due to the characteristics, BH workqueue is _not_ =
used.

>At present, 1394 OHCI driver is responsible for the maintenance of =
tasklet
>context, while in this series of change the core function is =
responsible
>for the maintenance of workqueue and work items. This change is an =
attempt
>to let each implementation focus on own task.

>The change affects the following implementations of unit protocols =
which
>operate isochronous contexts:

>- firewire-net for IP over 1394 (RFC 2734/3146)
>- firedtv
>- drivers in ALSA firewire stack for IEC 61883-1/6
>- user space applications

>As long as reading their codes, the first two drivers look to require =
no
>change. While the drivers in ALSA firewire stack require change to =
switch
>the type of context in which callback is executed. The series of change
>includes a patch for them to adapt to work process context.

>Finally, these changes are tested by devices supported by ALSA firewire
>stack with/without no-period-wakeup runtime of PCM substream. I also =
tested
>examples in libhinoko[3] as samples of user space applications. =
Currently I
>face no issue.

>On the other hand, I have neither tested for firewire-net nor firedtv,
>since I have never used these functions. If someone has any experience =
to
>use them, I would request to test the change.

>[1] =
https://lore.kernel.org/lkml/20240403144558.13398-1-apais@linux.microsoft.=
com/
>[2] https://github.com/allenpais/for-6.9-bh-conversions/issues/1
>[3] https://git.kernel.org/pub/scm/libs/ieee1394/libhinoko.git/


>Regards

Thank you for doing this work. You will probably need to send out a v2
As most of you patches have single line comment instead of Block style
Commnents (/* ..*/). Please have it fixed.

- Allen

>Takashi Sakamoto (5):
> firewire: core: allocate workqueue to handle isochronous contexts in
>   card
> firewire: core: add local API for work items scheduled to workqueue
>   specific to isochronous contexts
> firewire: ohci: process IT/IR events in sleepable work process to
>   obsolete tasklet softIRQ
> firewire: core: non-atomic memory allocation for isochronous event to
>   user client
> ALSA: firewire: use nonatomic PCM operation



