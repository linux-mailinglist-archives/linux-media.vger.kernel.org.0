Return-Path: <linux-media+bounces-26558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D4A3F26C
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD291764B7
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810B020102C;
	Fri, 21 Feb 2025 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="PHaXmyLv"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFC21B21BD
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740134775; cv=pass; b=NU5d2J4xKTo48LPAlP6dS8aORBoJxDx+ciXiQUQODteu/jwKatoFjyz7PnWg3NaFO2rh7yzV665J+kuUgzV1VE3kpNp6xhjghe1vLUZgzCkQdoocBE+zW+OzPWwrMGGyYQ0ZaNVz7945qpFIc9nEqZ266bAm9lWzoObg8jXwdT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740134775; c=relaxed/simple;
	bh=wi+Fm6ONuDautr3zERO9pb15IFKUGQECy4yDrSae6CM=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=GejjMQzpvsMbQYqT9IT+Vn0xx2XOOyImFahLEJ76I8j65kSXhqFNku39izsbWd9a/wHvFBQl8ndA71aQE+egeR8lVaERs1wG3VeeNk50kivqXg32N0bReH1pL4qjD9rH8v0RJGwszFgEaaRAk2PszzEtxEX9J2an52RMWl8zqbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=PHaXmyLv; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740134770; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YOaobfbst5NfCDsW+avlHmwADb/sZFYxRmKCYbOQje6z8ugC0tY0flhtFoEi2+LBPL4Y0arczWQEv29zlGzpUZ3kZVOB3GOjp7YeNxtCgi43MoZwDmNNiI83oxilKf3HtnyRyIXf8b/AIjgsJGXIUKzZp4phHPsO4PF9RutHPSI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740134770; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=rpYt01A1OuTiUkxy8JVxgGT2RAv46UQcmd1roTumje8=; 
	b=jRQ7ktCjo3y7Trz9d5GNmEix0KmvzdhuteY2B1yvLBkaP9MrRzkpQBlAuGC2h4gBwL+4aG9jmZJDNBB/ZdGOyOxUpgMh2I+gR5C9Z6yb3/ZvBq2TCcvPGFloX1Un0NJHxGAAJO4VtCdlsz6pLO2MGAXmC3VsIuSUFgQAO0rIaO8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740134770;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=rpYt01A1OuTiUkxy8JVxgGT2RAv46UQcmd1roTumje8=;
	b=PHaXmyLvXV3jQUEBpt1miHuqZ2sNSjCmqAZhQ+XpnBjaYccNsksnXqnxI4w/s7sa
	7uevAlEQEj5FTzBdw8V/wdl7Phtz//GNgb6+jzuyf9TBtNiDA/oLPEs28nw6v17Z5ck
	Sm3Wv5T5A1mq9xsshYEjvK7b/VIi48k7q8QnyZyw=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1740134768817978.0638839415848; Fri, 21 Feb 2025 02:46:08 -0800 (PST)
Date: Fri, 21 Feb 2025 11:46:08 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "linux-media" <linux-media@vger.kernel.org>
Message-ID: <195281d6068.fa3be2d9811284.1245840583818451519@collabora.com>
Subject: [GIT PULL FOR 6.15] Allegro-dvt-fix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello Hans & Mauro,

here is a tiny fix for the allegro-dvt driver.

Please pull.
---
The following changes since commit 955a999ca2336869a01bbc2d346185c348929e78:

  media: platform: rpi1-cfe: drop vb2_ops_wait_prepare/finish (2025-02-18 08:11:37 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/sebastianfricke.git tags/for-6.15-allegro-dvt-probe-fix

for you to fetch changes up to 5224469a564385db8a80b67c0316018865c56aa7:

  media: platform: allgro-dvt: unregister v4l2_device on the error path (2025-02-21 11:38:25 +0100)

----------------------------------------------------------------
A fix for the probe function of the allegro dvt driver

----------------------------------------------------------------
Joe Hattori (1):
      media: platform: allgro-dvt: unregister v4l2_device on the error path

 drivers/media/platform/allegro-dvt/allegro-core.c | 1 +
 1 file changed, 1 insertion(+)


Regards,
Sebastian Fricke 





