Return-Path: <linux-media+bounces-43888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB564BC342A
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 06:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43CE19E038F
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 04:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1842BEC21;
	Wed,  8 Oct 2025 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qerGsF5l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B188F2BDC25;
	Wed,  8 Oct 2025 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759895978; cv=none; b=INDRoaLwgAjEq3AIIQ3LXrhjAwGYFEoTZXTAy1CA9nxkANN42iM5rOHGElbXLmjIec2lU4z66yi7QaNY6OHOOyrNUdR1JLgvJERBLMmkIN04geNjS+x9iXYBxhtfpxXF4xoj/aJ1qfGcIFbxZbIAHcGDSyT2niwHV3aXeRKOOMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759895978; c=relaxed/simple;
	bh=vPUzB/kedHLN1UiYunAi6GZuZ1A/GiYXuoHbDCB5M4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aLVzpR5kS//ICMWTlkjhopdd93l05ggclsgW+FYFijugTYKoILgruEa7KsIoOAWl6qgNaFJ+5TeosKL0+XbYhab4fi7YAkmuO40YSwn6AGrOjLQd2/Zp+7FZqCdBVAkGO/Hl+KgPJsMpSn3oSbamSnq8K/1UYcxkbA9p2DXzCPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qerGsF5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53779C4CEF4;
	Wed,  8 Oct 2025 03:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759895978;
	bh=vPUzB/kedHLN1UiYunAi6GZuZ1A/GiYXuoHbDCB5M4o=;
	h=From:To:Cc:Subject:Date:From;
	b=qerGsF5lf8DmJqYFBYDmf4IlURtKS0YXbmifDG984jebZyIHSFw9vs/ZjCeuQXpmn
	 tDpQNiDUa1CcKuxJ9+TIaM4wYOk2j9RRUm+0svoDvAd1WarK1IPKLNy/B+E7cmEW57
	 85W8Noz7TknIYF+kYHZcbs8fJKLXlrtX6T6A9uQ5t7HEWaZdsv8Ze4Pbh0dmU6qJwU
	 +4iTKQ+lGCshOlmLAe+Y5AG1xb3wqSYbkCvPx65adrmUtEObISLVS4iuiZQ/6BAo78
	 bsp4m2nHdfbnwQTFB3YbXeFpGofJUvZeKrMcXZ78/DzMatDD+7ppwmjpIB6rAPQrlZ
	 xs9cXWx8xymQQ==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH 0/3] module: Add compile-time check for embedded NUL characters
Date: Tue,  7 Oct 2025 20:59:32 -0700
Message-Id: <20251008033844.work.801-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2403; i=kees@kernel.org; h=from:subject:message-id; bh=vPUzB/kedHLN1UiYunAi6GZuZ1A/GiYXuoHbDCB5M4o=; b=owGbwMvMwCVmps19z/KJym7G02pJDBlPHy7ljBR+Mv320ptmjW8KAibxM6zdHyC+8ax7DP/0C U8kZL9P7yhlYRDjYpAVU2QJsnOPc/F42x7uPlcRZg4rE8gQBi5OAZhI6kZGhjurND948cqdkf5W /y0hbqLU7t1NlpnZcyf/P7P0RU63cx7D/9APS9/Vt3r/SVTmLYnb7SWmnfXpnOmDCm7TiQGeZaG 53AA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

A long time ago we had an issue with embedded NUL bytes in MODULE_INFO
strings[1]. While this stands out pretty strongly when you look at the
code, and we can't do anything about a binary module that just plain lies,
we never actually implemented the trivial compile-time check needed to
detect it.

Add this check (and fix 2 instances of needless trailing semicolons that
this change exposed).

Note that these patches were produced as part of another LLM exercise.
This time I wanted to try "what happens if I ask an LLM to go read
a specific LWN article and write a patch based on a discussion?" It
pretty effortlessly chose and implemented a suggested solution, tested
the change, and fixed new build warnings in the process.

Since this was a relatively short session, here's an overview of the
prompts involved as I guided it through a clean change and tried to see
how it would reason about static_assert vs _Static_assert. (It wanted
to use what was most common, not what was the current style -- we may
want to update the comment above the static_assert macro to suggest
using _Static_assert directly these days...)

  I want to fix a weakness in the module info strings. Read about it
  here: https://lwn.net/Articles/82305/

  Since it's only "info" that we need to check, can you reduce the checks
  to just that instead of all the other stuff?

  I think the change to the comment is redundent, and that should be
  in a commit log instead. Let's just keep the change to the static assert.

  Is "static_assert" the idiomatic way to use a static assert in this
  code base? I've seen _Static_assert used sometimes.

  What's the difference between the two?

  Does Linux use C11 by default now?

  Then let's not use the wrapper any more.

  Do an "allmodconfig all -s" build to verify this works for all modules
  in the kernel.


Thanks!

-Kees

[1] https://lwn.net/Articles/82305/

Kees Cook (3):
  media: dvb-usb-v2: lmedm04: Fix firmware macro definitions
  media: radio: si470x: Fix DRIVER_AUTHOR macro definition
  module: Add compile-time check for embedded NUL characters

 include/linux/moduleparam.h                   |  3 +++
 drivers/media/radio/si470x/radio-si470x-i2c.c |  2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c        | 12 ++++++------
 3 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.34.1


