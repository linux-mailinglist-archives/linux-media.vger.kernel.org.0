Return-Path: <linux-media+bounces-16851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EE795F7F9
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A6C71F2359D
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA1A199234;
	Mon, 26 Aug 2024 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j11SZ68A";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ROEf8hRC"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-46.smtp-out.eu-west-1.amazonses.com (a7-46.smtp-out.eu-west-1.amazonses.com [54.240.7.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26F18D63F;
	Mon, 26 Aug 2024 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693052; cv=none; b=d7bb+/XHPTBDBtAX8nyawSmNS9G8AzmHrXi4jDLMgJG0NnbkJZF/qBlgXcOXAfOVE7lqLFa9PeqAZEy6KPFkvxQdEzxlhr3V9dXo9NOY80oYW2DBs/IIDcYGHMyMz/jop+HmiM/lark+QGXVuIdgoNIcoIYYDHRRuGNxk4iB6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693052; c=relaxed/simple;
	bh=8R4802nAp5qJBbZHSqGnPC3d8ZjzB9snyqv/D0YL6jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FGsJo0AH90T4ZBlZ4N2mNXoK7Y9GR+/OoyGLmCDfSZN0sp6HWG/jkmRAz6B8wEr5Vte8YcrGB22Z7VLqVZyj1WJ9V5OAVxY5HtB1Kzf++s2tNkwn2SjQmZYoMJy62UihzBKPBTg1lnnf4j6N75m/uVb1AIjHiheELEsXCF3+t8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j11SZ68A; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=ROEf8hRC; arc=none smtp.client-ip=54.240.7.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724693049;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=8R4802nAp5qJBbZHSqGnPC3d8ZjzB9snyqv/D0YL6jc=;
	b=j11SZ68A42peyxL6Nr/T/J1TRUB0Ql6BmVqWlqkdl+fbBofdt5LuAp7JaxuzKqP6
	Wu/64v639isB+lrtK4bsirYsPXFkiP4cNFQQAiaLg1caBeNDpOKHmkO7lpwyA6cP+aB
	DKibaiwUHlGWD4DGqxg7AQRz6uhfnI4PBNmAiZNXOBGi5qbhVXugS8kYWoYeSXC33Tq
	7YS7O2qbuF5CGmtyQT33dLqSyVqouCDSGNpjKqCr0ggZgDZdvZQESfVJ6biLF1qHb8C
	NeDOV8c7mPraoRgHpn9VNgtG9Sw7MjTz8Z61aqCYF11qWAgKQtd/xqo7Ir9PdDZ7xwl
	qAMUflpWdQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724693049;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=8R4802nAp5qJBbZHSqGnPC3d8ZjzB9snyqv/D0YL6jc=;
	b=ROEf8hRCiaNFBReBuOpwikHScj4jPbtM5KUO6BIifMcH/uQwiFPFJeh3SUxRmAon
	KAgQv19OoV/PQ0Vx1LzkFokfyr9RvVcGgCfim+kKOUMZ21IJCcKBsyJwNxpGAbOPPZz
	6EuMTWPSpcGW4v04SxdSCiHSmB9GH4QWqaLf2Lxs=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, 
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 0/3] Enumerate all pixels formats
Date: Mon, 26 Aug 2024 17:24:09 +0000
Message-ID: <010201918fb76f7a-650dc960-4911-48d7-8e82-8f18243c4b71-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.26-54.240.7.46

The goal of this series is to help userspace applications, like Gstreamer
or Chromium, to categorize decoders and so avoid trying to use decoder
that can't do the require task because it won't support the needed pixel
format.
As example, in today implementation we need to simulate 10 bit header
control to know if the driver support 10 bits pixel formats. With this
new flag it will simpler for userspace applications know if driver
support 10 bit pixel formats and if it is supported by userspace.

An example of how it can be used in GStreamer to discover the
supported pixels formats for stateless decoders is available here:
https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads

v4l2-compliance test of this flag:
https://gitlab.collabora.com/benjamin.gaignard/v4l-utils/-/commits/enum_all_formats_v4

change in version 7:
- Rework documentation about which drivers should use the flag

change in version 6:
- Change flag name.
- Improve documentation.
- Improve visl driver to enumerate one more pixel format when the flag
  is used.

changes in version 5:
- Reset the proposal to follow Hans's advices
- Add new flag to be used with index field.
- Make vicodec and visl test driver use the new flag
- Doing the same for Verisilicon driver.
 
Benjamin Gaignard (3):
  media: videodev2: Add flag to unconditionally enumerate pixel formats
  media: test-drivers: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
  media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag

 .../media/v4l/vidioc-enum-fmt.rst             | 18 ++++++++++++++++-
 .../media/videodev2.h.rst.exceptions          |  1 +
 .../media/platform/verisilicon/hantro_v4l2.c  | 18 ++++++++++++-----
 drivers/media/test-drivers/visl/visl-video.c  | 20 +++++++++++++++++--
 include/uapi/linux/videodev2.h                |  3 +++
 5 files changed, 52 insertions(+), 8 deletions(-)

-- 
2.43.0


