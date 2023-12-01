Return-Path: <linux-media+bounces-1431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C27FFFF7
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 01:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 105AE1C20EC5
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 00:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3F07EC;
	Fri,  1 Dec 2023 00:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B28Ke9tm"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6CC194
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 16:13:17 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 028226607345;
	Fri,  1 Dec 2023 00:13:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701389595;
	bh=19JhUrTQwruU1YahZmIof9oR2ZkcMCmNUg2En8Q9N0I=;
	h=From:To:Cc:Subject:Date:From;
	b=B28Ke9tmVS7LNK4eexayt23EbFzeIhGsBi1l7G3+q0OGp7pTkdXl5+UQt7ikkAb71
	 uFE/3ApdQaqwhftqWJ0n9KufCdxq5+jXYkl/XVaC+b2u0gdbGRcpww6abtn/8DzCaz
	 KZSR3CfLmYo8JKWXwSFAFWJwK/GHdyW8B9Ez/GPGQ0ql6Vva73MPoAFk17Du+PtwBc
	 gaWNaUGy8Dy9njueHzPAUUhopy86H3DdH43KzokP5vXksMUT8BF9BijKGHxZlJTwNa
	 jHnDYxMOukPVlMWFOiKu88kar2qs7mxKHGsA+GbbDNhU4rCZIVAeAnBX2kX4scNmpY
	 zkljX4Vrvj9bg==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 0/4] v4l2-tracer: track changes from syncing with kernel
Date: Thu, 30 Nov 2023 16:12:25 -0800
Message-ID: <cover.1701388237.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series aims to solve the potential breakage of the v4l2-tracer
every time that v4l-utils is synced with the latest kernel headers.

Currently the v4l2-tracer autogeneration script is run by meson. If the script gets
confused by changes to the latest kernel headers, then the v4l2-tracer won’t compile.
And, even worse, the autogeneration script will have overwritten the autogenerated
files so there is no history of the changes that broke the compilation.

This series solves the problem by adding the autogenerated files to the git repository.
It stops using meson to create the files and instead, patches the v4l2-tracer whenever
v4l-utils is synced with the latest kernel headers. If compilation breaks, it is easy
to fix by just removing the v4l2-tracer patches before committing the other changes
related to the sync.

Changes in v2:
  * Use a temporary directory to store the generated files
  and remove it afterward.

Deborah Brouwer (4):
  v4l2-tracer: autogenerate files that can be added to git
  v4l2-tracer: add auto-generated files to git repo
  v4l2-tracer: stop auto-generating files with meson
  sync-with-kernel.sh: create v4l2-tracer patches

 sync-with-kernel.sh                      |   27 +
 utils/v4l2-tracer/meson.build            |   55 +-
 utils/v4l2-tracer/retrace-gen.cpp        | 5664 ++++++++++++++++++++++
 utils/v4l2-tracer/retrace-gen.h          |  144 +
 utils/v4l2-tracer/trace-gen.cpp          | 3225 ++++++++++++
 utils/v4l2-tracer/trace-gen.h            |  144 +
 utils/v4l2-tracer/v4l2-tracer-gen.pl     |   12 +-
 utils/v4l2-tracer/v4l2-tracer-info-gen.h | 2419 +++++++++
 8 files changed, 11633 insertions(+), 57 deletions(-)
 create mode 100644 utils/v4l2-tracer/retrace-gen.cpp
 create mode 100644 utils/v4l2-tracer/retrace-gen.h
 create mode 100644 utils/v4l2-tracer/trace-gen.cpp
 create mode 100644 utils/v4l2-tracer/trace-gen.h
 create mode 100644 utils/v4l2-tracer/v4l2-tracer-info-gen.h

-- 
2.41.0


