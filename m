Return-Path: <linux-media+bounces-19075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9E98F8D5
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 23:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50C91F218A6
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 21:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262901AC429;
	Thu,  3 Oct 2024 21:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="m3blYp0e"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A693D1ABEA7
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727990559; cv=none; b=Cx3b+tlSiG3GQmgVj275Oj860m2V/Ve7A+kULgUXIQUuQi05ahhtYD3rI6DJgFuzwCHXJI76q0sriCcB9MqpywlQwjgVK13a06Wg9NypW++RFJaqlWd9kOcdxbVHibuz/b/x2TQlK2vsk8u8hS953/onZ8Q25Wr8sQYW6mp8Jkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727990559; c=relaxed/simple;
	bh=hATJKXLhc4G2bgabc37GzfjYl3WMF9XD7Sb3ATw/1jo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pO2sYqPBeWRb2yclKBB0li/Z7mwr40tPYlIbrtg4hfhx0TOnB3aGfe0mZblD8w1hP6N0CANMcN0w4tNb8vL9fTZy+0wd2Jfg482tWQSs5l8eopF4DBy/BNJW8Zzdr49lAMwFyIKijnvE/6d9DlLrCJrAT+Sfe6c+StX3v6y+c1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=m3blYp0e; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1727990550; bh=hATJKXLhc4G2bgabc37GzfjYl3WMF9XD7Sb3ATw/1jo=;
	h=Date:From:To:Subject:From;
	b=m3blYp0e5DKWhvZMvYVyripOWyV4AfbA+1DimcaJrLv0ECglfrtDqrqcZ7E+SJkfr
	 Co5X+ufUcJoJBJefONyolwqLmVC1lXwJTDxoEv2uQ1VhPRrRcakiRl+2o9aIW+wq/h
	 HzVMh+uiQOpg0Br+sdxvB713r2gawW3zIsvbnqxkh8sXKixEHotXFu11peX+SmbXah
	 mDpenXtJA2Q2SzLUPA10aKH0qR4PExDsXOOjvcMajIL6V3Ws2jUKlTaQ6ecwwNRbZf
	 lgRbaAfIYlqBweTTYkoOkLNAKHIJKY6Cl0KGVOtyaHSw50zo+CDnWTeE00lkogwy8O
	 h9UZegj6T6MTg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 3EEC31003B9; Thu,  3 Oct 2024 22:22:30 +0100 (BST)
Date: Thu, 3 Oct 2024 22:22:30 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: {GIT PULL FOR v6.13] rc changes
Message-ID: <Zv8LFpk9MBuEYOlQ@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Some minor changes. I've confirmed that with PREEMPT_RT, gpio-ir-tx works
fine but causes huge latency spikes, and pwm-ir-tx does not.

Thanks,

Sean

The following changes since commit 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad:

  media: atomisp: Use clamp() in ia_css_eed1_8_vmem_encode() (2024-09-10 07:30:36 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.12b

for you to fetch changes up to 5603349e451fb558f101b46892cb97f3e8d0d63b:

  docs: fix misspelling in lirc-set-send-duty-cycle (2024-10-03 07:23:00 +0100)

----------------------------------------------------------------
v6.12b

----------------------------------------------------------------
Kendra Moore (1):
      docs: fix misspelling in lirc-set-send-duty-cycle

Sean Young (2):
      media: gpio-ir-tx: Driver does not behave with PREEMPT_RT
      media: gpio-ir-tx: Remove redundant call to local_irq_disable()

 Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst | 2 +-
 drivers/media/rc/Kconfig                                          | 1 +
 drivers/media/rc/gpio-ir-tx.c                                     | 4 ----
 3 files changed, 2 insertions(+), 5 deletions(-)

