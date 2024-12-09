Return-Path: <linux-media+bounces-22870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D248F9E8F8E
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C667D18869FA
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE44921570B;
	Mon,  9 Dec 2024 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="tyK2VXbx"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5C918A93E
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738491; cv=none; b=DxT1qrflhNC2CHU7LG0E7RIMq4BnPj8D4JJEDh+kRq395aWGVGG7zn4gllzkPI9Tep+nvQCFNPjue04GMeE5KhMQieARzx2XNKgonhCzcTPKBEEb0l/zHamYs8X09D9GyKwogi3VpozAa8wueeQUmz8ZXHkyA1xSMg0r9tw3mII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738491; c=relaxed/simple;
	bh=qKOTJBi4eiNJ2qrpzt2hX3B8lrdEG75EEbMMSutyNgg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jy7MywaD7tKuEx2BjkkzsSJ61vlzDJgJXP063ieawjeZxQJRfLwZJzKMYm9Cj2RlqqiG5imvSYmY4UvOeGQ55OuSR6BZFfbxaH9OkLJrWYrPnXdWo0kkGyI2sPpSBcs9vlPN6ias5aM9mwn4+dCY4I0iNYh3v4rvrRrwBPipDgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=tyK2VXbx; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1733738165; bh=qKOTJBi4eiNJ2qrpzt2hX3B8lrdEG75EEbMMSutyNgg=;
	h=Date:From:To:Subject:From;
	b=tyK2VXbxPmtrRhbiWidGRetXORM57k9TGpbk+dWujnNRxF9ZNWAv+w634AtjU27WM
	 CQ0u3a3H+Lql9euj713VuQPB2KAooL15GJ4nwJGkkAn9id+hZDAuQUxjY/sGiMFZ/Q
	 HpNBhFn/xwML32rUI/9qPYL3W3MddxOaLT9EXc2ULpkGqPB3JfHq+/fqeyyRJ0e63i
	 zEqBAey+3Su1FnSXkrzABdDlMY8wR0JJaJIW6pYST27M2fLyuGRcAwEIBA0xJ4scr2
	 2v60s9+gO28WJ01RDE+t1la4GQZH+JXk76k7XsKsHKNIefTTBqLZA0RO+tfXo9h7qB
	 1kT979hEbh38Q==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 6D6EE1002BE; Mon,  9 Dec 2024 09:56:05 +0000 (GMT)
Date: Mon, 9 Dec 2024 09:56:05 +0000
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.14] rc fixes
Message-ID: <Z1a-tW4ZD0vWcVuL@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro, Hans,

Some minor fixes for rc-core.

Thanks,
Sean

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.14a

for you to fetch changes up to e13af3ffa0cb30abff9ceb1b7b0846880695a25c:

  media: rc: iguanair: handle timeouts (2024-12-09 09:46:55 +0000)

----------------------------------------------------------------
v6.14a

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      media: cx18: Remove unused cx18_reset_ir_gpio

Oliver Neukum (1):
      media: rc: iguanair: handle timeouts

Sean Young (2):
      media: mceusb: don't push static constants on stack for %*ph
      media: imon: don't push static constants on stack for %*ph

Wolfram Sang (1):
      media: mceusb: don't include 'pm_wakeup.h' directly

 drivers/media/pci/cx18/cx18-gpio.c | 15 ---------------
 drivers/media/pci/cx18/cx18-gpio.h |  1 -
 drivers/media/rc/iguanair.c        |  4 +++-
 drivers/media/rc/imon_raw.c        |  2 +-
 drivers/media/rc/mceusb.c          |  5 ++---
 5 files changed, 6 insertions(+), 21 deletions(-)

