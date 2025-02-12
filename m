Return-Path: <linux-media+bounces-26072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 016F7A32987
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 16:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA086164EE2
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 15:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D4B21127E;
	Wed, 12 Feb 2025 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="VJsLSavy"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF29271800
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739372843; cv=none; b=sBiBAUMC5aQYKj6S7/dpiVSv8Q1kl+t4HQiAULcXpJy+w/TzAZPwyF/21JFeYWRDDluZI54R0j2opbOu4hDkzWyVa7wo3s1kTfRvzS6esCa4YfcOg6ERA+qhajUnVfFh1PSZM7RQ4S1mxveB+2lNsQ9WyOhcbedpU9GY1tp1E2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739372843; c=relaxed/simple;
	bh=PDovwoou6JW6XlUmwOXOw8Q+gymJnQ+ACT8u+sFjv68=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ujgb/zLDoRdeRdK59gZOep2GkhKcfAyFI+G/mp0e8lWWqRZxGMOC4YpLbNIQcqQjKjYYnH4e1ywr6HvpSH8qNOitUKfphGGmn2bfcwmF0eYogFAoGaRI1pwcfn/OfwAk2YuEhEiX3qL1s2vUnuMruLuTzAUbPF+L7cakQ5t+2Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=VJsLSavy; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1739372481; bh=PDovwoou6JW6XlUmwOXOw8Q+gymJnQ+ACT8u+sFjv68=;
	h=Date:From:To:Subject:From;
	b=VJsLSavyV6M4Z/UTtGuQM9qnfE/il+HHXnA256FWuUODQwai1NFceWZiRDnZjYSF6
	 P7hrhYqcWN8aowzRP40c1g63ZUzHXl0tT9VR4AA1Nz4DXC6T66xizdRfU89dcvl1S1
	 yxhRKt2QyX4vZYJkmItZAQFxS+wjCNyAXkYLTwmSf8pe4jFfPzvfq8JeYSPbTap7pI
	 Lde3VBZrY5vuxY7dYOpM4y4JrBMK+qossE2TwAanGbQXp6b3sCD2jCJEry1JqwQe0E
	 2+eHDPeWrvWoD9wGcVcIOpThIqeZBH0esfvbzmQiEgOKSiB8Q5tJs2rkkMAFsrDCnp
	 x1w8tOFTEzzgg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id D7F7C100073; Wed, 12 Feb 2025 15:01:21 +0000 (GMT)
Date: Wed, 12 Feb 2025 15:01:21 +0000
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.15] rc fixes and enhancements
Message-ID: <Z6y3wWQKVygVIVNu@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit bb77ddc4eefbcba2103db4e48b12eb0254c9cf0f:

  media: MAINTAINERS: add Qualcomm iris video accelerator driver (2025-02-07 11:51:57 +0100)

are available in the Git repository at:

  git@gitlab.freedesktop.org:linux-media/users/seanyoung.git tags/v6.15a

for you to fetch changes up to 5c3e2e6002cd7ec6a20f714d98e79b7a2aeb5428:

  media: rc: add keymap for Siemens Gigaset RC20 remote (2025-02-12 12:12:03 +0000)

----------------------------------------------------------------
v6.15a

----------------------------------------------------------------
Michael Klein (1):
      media: rc: add keymap for Siemens Gigaset RC20 remote

Murad Masimov (2):
      media: streamzap: fix race between device disconnection and urb callback
      media: streamzap: prevent processing IR data on URB failure

 drivers/media/rc/keymaps/Makefile                  |  1 +
 drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.c | 71 ++++++++++++++++++++++
 drivers/media/rc/streamzap.c                       | 70 +++++++++++----------
 include/media/rc-map.h                             |  1 +
 4 files changed, 112 insertions(+), 31 deletions(-)
 create mode 100644 drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.c

