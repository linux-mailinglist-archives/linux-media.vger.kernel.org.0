Return-Path: <linux-media+bounces-1436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D088A80007E
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 01:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E8C8B2117D
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 00:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C85D10E5;
	Fri,  1 Dec 2023 00:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bLrE1c2d"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCA8D7D
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 16:46:50 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A76A3660737B;
	Fri,  1 Dec 2023 00:46:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701391609;
	bh=NAheS/9BvpTSCA0cjI2U2BStGEamM7g1gA1UFq4FQ+U=;
	h=From:To:Cc:Subject:Date:From;
	b=bLrE1c2dD4MxGTil9T9GZw6zmoyrkhlGOGNvwSqHYwncGFm6DjiX0LBU/GxpeeFvH
	 wJ6QWP1q0NJuh9ac1Lcsj2CIeFTzaG7MJjVfgqcR8lBCbrkKZDYElPsLTDwg1TKQcF
	 GqLYMVaD6GeA8S+XkM9uGIL9hby6xOZedx+2kdZcz/3lOLQ0+IIho1ONSuUw+GHSSr
	 kBsclge29ZRMd35Q7x0GxY6vfX3yPPVVG2w9yRvop4jyVqPoVL9HsB0QsNykx7nIUa
	 GGD3vj1ZDuuXUxf3auWTTPd1HaHdodErsRrwukLnM6Ilj9vUYVEuW0JBeqMWHLZUhz
	 wbCfCxZLg7RWg==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/6] v4l2-tracer: misc fixes and improvements
Date: Thu, 30 Nov 2023 16:46:28 -0800
Message-ID: <cover.1701390439.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series continues to make the v4l2-tracer more robust
by fixing errors and integrating uAPI changes.

It depends on this series to sync with kernel headers:
https://lore.kernel.org/linux-media/cover.1701388237.git.deborah.brouwer@collabora.com/

Deborah Brouwer (6):
  v4l2-tracer: look in more places for libv4l2tracer
  v4l2-tracer: ignore single line comments when parsing headers
  v4l2-tracer: add re/tracing for MAX_NUM_BUFFERS
  v4l2-tracer: add re/tracing for AV1 controls
  v4l2-tracer: stop waiting to handle a signal
  v4l2-tracer: use stat to verify that retrace file exists

 utils/v4l2-tracer/retrace.cpp            | 19 ++++++++++---
 utils/v4l2-tracer/trace.cpp              | 12 +++++++++
 utils/v4l2-tracer/v4l2-tracer-common.h   |  1 +
 utils/v4l2-tracer/v4l2-tracer-gen.pl     |  5 ++--
 utils/v4l2-tracer/v4l2-tracer-info-gen.h |  1 +
 utils/v4l2-tracer/v4l2-tracer.cpp        | 34 +++++++++++++++++++-----
 6 files changed, 60 insertions(+), 12 deletions(-)


base-commit: c8adf732788e3ab317024553c7b2137e3a541269
-- 
2.41.0


