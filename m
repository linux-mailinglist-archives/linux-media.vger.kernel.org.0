Return-Path: <linux-media+bounces-18493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0496D9840F0
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C821C21BD3
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 08:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0211552ED;
	Tue, 24 Sep 2024 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="TLABLe4O"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F879450EE;
	Tue, 24 Sep 2024 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167580; cv=pass; b=MUuKv3qE0IZCOn5Nzxnq8Tirs2qwB+VXLjNrrGJUNO1glsA9qxLggm+zYp9Sa2zZha0azoi61AkiRIT2u30ok/LH7nearHoVJriLdbfx0V8Aqkj6zC/9ZYMUwCwWT5nj/vOYd/vc/k1bB/1FRAx4wSf7lfASJp8e5qgKqhv7irw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167580; c=relaxed/simple;
	bh=12vqI8adF8E+VLzIPrMujM7ijLzTcmdj4y2PoSY85Jg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=owpunNdwm9d2ig6FZjKgV7yXIRldbhvCsXdAXiu78lWlUXRR+EwmVIYhjT0vBuUSVnmR0WKA5G91y/jVXjH7vxHOe7X1P7RuHLT5RxXhY598deoS8x4WUo0dRiuIFqcaTXC1/CHdahMZ8pR3nBLJVsLqrmHVlRKIlIajOZsFSyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=TLABLe4O; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727167566; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bRw2gThyodHhJH7oG5F+7FbrMeZYNy4Pnnw3dDnY5/R+HCZNCM/b/aDgNO+tm3h2Q2RSWB3M1VO4dFKhTm6T7jhWbt9iSd6x7QZRYs6wjWB94+8C5Nwriu74Ll6qWeyLatxKxGIMPmvQJT3RN/Hg+hGoG1/qps/WaNLnTxkwuxY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727167566; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qVbv9XllENapXT4d93AeMRsf9cE6Elu5l5QH65oWAFA=; 
	b=JAZcScnanf/LTSfBu4CPhpgVCotH9V7nMY/6LFdkWi3uMUugnOd8iWmNgS+RNOVl/1Yk9cvt4bjGfQog+HwNPkiCEuLEVPGZ1nTmVuPgIB0LOkAs8Y0/bo38eLNIupOZrWXhyoze3SAB1BE5qszXerpoDb/5crgZyIPQGqiqluM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727167566;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=qVbv9XllENapXT4d93AeMRsf9cE6Elu5l5QH65oWAFA=;
	b=TLABLe4Olbq5lHoP9xaL+G5c5uG9LexlvsxG8WdqnyY4v6nbc8rTyJ5h+0fgE7pv
	X9yx8FSoL+xLMjEk27rO3ZtTNJ5LxOQZUvio5gi2hExGdROnjyIJXz1sML4196HaI9B
	Hr5acHA+Qhd9NrqCFc+V3vHOU/BduezVN/EcN/lM=
Received: by mx.zohomail.com with SMTPS id 1727167564727428.59957541410006;
	Tue, 24 Sep 2024 01:46:04 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH RFC v2 0/3] Documentation: Debugging guide
Date: Tue, 24 Sep 2024 10:45:57 +0200
Message-Id: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEV88mYC/42OSwrCMBiEr1KyNpKkqWldCYIHcCtS8vi1gbQpi
 Qal9O6GbF3ocmaYb2ZBEYKFiPbVggIkG62fsmCbCulBTnfA1mSNGGGcNKzDiuMRjJW98Tr2dpyD
 T4BFB5IZ3hLe1ih3lYyAVZCTHnJ7ejqXzTnAzb7K2AWdT0d0zeZg48OHdzmQaIl+bCWKCe6MUZR
 SzXldH7R3Tiof5Fb7sVAT+4vEMknWohGdMKTZfZHWdf0AqnkifCIBAAA=
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727167560; l=3499;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=12vqI8adF8E+VLzIPrMujM7ijLzTcmdj4y2PoSY85Jg=;
 b=BYo4qhbatwSLUqZEo+wPHe1eiZhhHW25jIWlEW3j3FtNP2H0T6FSzg0iSWpQxkutdg8SUvZv+KDu
 IcyXeU7XDpYuY2bP6tBtApP3y5XIRi8xXdIo70//Kx/gD9UrV7Lu
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

The RFC contains:
- a general debugging guide split into debugging for driver developers and
  debugging from userspace
- a new summary page for all media related documentation. This is inspired by
  other subsystems, which first of all allows a user to find the subsystem
  under the subsystems page and secondly eases general navigation through the
  documentation that is sprinkled onto multiple places.
- a guide on how to debug code in the media subsystem, which points to the
  parts of the general documentation and adds own routines.

WHY do we need this?
--------------------

For anyone without years of experience in the Linux kernel, knowing which tool
to use or even which tools are available is not as straightforward as some
senior developers might perceive.
We realized that there is a general need for a kind of "start page", that
allows especially beginners to get up-to-speed with the codebase and the
documentation. The documentation in particular is currently quite hard to navigate
as you mostly have to know what you are searching for to find it.

WHAT do we cover?
-----------------

The document is structured into two sections:

1. A problem-focused approach: This means, a developer facing an issue matching
one of the given examples, will find suggestions for how to approach that
problem (e.g. which tool to use) in this section
2. A tool-focused approach: This sections highlights the available tools, with
comparisions between the tools if sensible. The goal of this work is
**duplicate as little as possible** from the existing documentation and
instead provide a rough overview that provides:
    - A link to the actual documentation
    - A minimal example for how it can be used (from a media perspective,
      if the usage isn't absolutely trivial like printk)
    - A rational for why it should be used

To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Cc: hverkuil-cisco@xs4all.nl
Cc: mauro.chehab@linux.intel.com
Cc: kernel@collabora.com
Cc: bob.beckett@collabora.com
Cc: nicolas.dufresne@collabora.com
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

---
Changes in v2:
- Split the media debugging guide into a general and a media specific guide,
  which contains mostly references to the general guide and a few media
  specific aspects.
- Fill out TBD sections
- Add device coredump section

---
Sebastian Fricke (3):
      docs: media: Create separate documentation folder for media
      docs: Add guides section for debugging
      docs: media: Debugging guide for the media subsystem

 .../driver_development_debugging_guide.rst         | 193 +++++++++++++++
 Documentation/debugging/index.rst                  |  66 +++++
 .../debugging/userspace_debugging_guide.rst        | 269 +++++++++++++++++++++
 Documentation/index.rst                            |   2 +
 Documentation/media/guides/debugging_issues.rst    | 174 +++++++++++++
 Documentation/media/guides/index.rst               |  11 +
 Documentation/media/index.rst                      |  20 ++
 Documentation/subsystem-apis.rst                   |   1 +
 8 files changed, 736 insertions(+)
---
base-commit: 68a72104cbcf38ad16500216e213fa4eb21c4be2
change-id: 20240529-b4-media_docs_improve-79ea2d480483

Best regards,
-- 
Sebastian Fricke <sebastian.fricke@collabora.com>

