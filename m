Return-Path: <linux-media+bounces-16002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CC994C245
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 18:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AC452819AB
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 16:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A24190047;
	Thu,  8 Aug 2024 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="hJeW1nzT"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B662A1D8
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723133137; cv=none; b=MEhutp0v2A1FhvcPOP3ochscSh6DqRpE0Dt0Io6OqZpjFvXbkbCPoJCDYkjZWIjLKA5lT+HvmEFZmj13dYiQ901GbpejllZtzSO5kpwjoLBZoUdhVwVKiWFSeD1AmYq9sriAiHpd+2YVsajmMXFggIZx8Ihg7rZrfCoybYSzlZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723133137; c=relaxed/simple;
	bh=cL/L+kudEUgfQMvfZ0Q2jHVBfWz8AqYzdzwhT9mnXuw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=scpBAq5BhNlxCSF5Vkop63hyqqrKgM1aPs/I49C8Ec1jYZpIYYS9XbAyUDtYVii26nIDlarXrbwjvzzwYdJQay7R1wMwfI3xg21ncEzuwfYRnhOoOcMr1xOicAvUh3UsT/zhbWiOf11WRuVAbUpGOFsmdD4oSaS2gQxICtUiXtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=hJeW1nzT; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1723133133; bh=cL/L+kudEUgfQMvfZ0Q2jHVBfWz8AqYzdzwhT9mnXuw=;
	h=Date:From:To:Subject:From;
	b=hJeW1nzTAzkhhpmCzoOJswWndUybctA2tXpRNlYu2/0V+XMSOfMw72Anv5WN+580o
	 kDQbj+0JqkMb3BROIELTQIMNJxbGQnuLg3WNCUUsXGT2neu5r9ZcH2d77JQTod0NGF
	 4hOR/bSraR895LhL75SWHxqCzPPHzKsojnNlJj/Snis2FLhtEE5Z1KCf0yEOV9YIRG
	 9hW9XHSuvZEb61v3nyGT85qTKT5J5dQohoFW4s3pErFjC9qRCLGB4UIx5Z/TRf7kwg
	 knzWwfeiQ521xgZNY7teypnOk9SokrIKbQ0PwHPhgT5qaXHG7GU86441JaeHhxSFR2
	 cSona1DhuRr6A==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 9A3E11000C2; Thu,  8 Aug 2024 17:05:33 +0100 (BST)
Date: Thu, 8 Aug 2024 17:05:33 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v6.11] dvb fix
Message-ID: <ZrTszRDue7UddGwB@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit e2ed53694e5356a55fd539a4d8dc56c2fa42b2ff:

  Merge tag 'tags/fixes-media-uvc-20230722' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-03 11:01:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.11d

for you to fetch changes up to dc07913e3d01c6ba98d68bced88a9b17b297cbdb:

  Revert "media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()" (2024-08-08 16:55:33 +0100)

----------------------------------------------------------------
v6.11d

----------------------------------------------------------------
Sean Young (1):
      Revert "media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()"

 drivers/media/usb/dvb-usb/dvb-usb-init.c | 35 ++++----------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

