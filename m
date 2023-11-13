Return-Path: <linux-media+bounces-292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6207EA43D
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0500B20ABA
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D781241F5;
	Mon, 13 Nov 2023 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mxCJMU6P"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6CB22EEB
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:06:43 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFDAD5D
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:06:42 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1FDB6602F3A;
	Mon, 13 Nov 2023 20:06:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906000;
	bh=u1LAKEKgTC6Hdx0fZqCuGF6V0vWfRkKphaqvZgsnnYw=;
	h=From:To:Cc:Subject:Date:From;
	b=mxCJMU6PpVLMrVxfcSdvinfMgR3ts+QuAYmg84vsWErPCFuyfintd5OqX3gMmdbSK
	 QE6d0reGa833lV6MCpGhPeMOP6/n5ZuB9kj/ChVzJ3/ASTwhswhLwfKoZ2kCexxWeW
	 PTTT7+cQS1mu5DVg3ShjET6l75Oy34PX3V2rTItPtH+hLV0xn5d49n5KxyZp3FllGn
	 4YttCnDXyDcCRQN3rtqkII96dn3Cth97n3VIjLL8nJjHnPM75cfQu95ASkNsOosaFB
	 /bHWuDTFdhsG4M1N+qgcMG8gzONjA6mw7FfHhyMifqiy+PP4SkGLPjBF+X0+JE+bMU
	 IjLY268oZzG2g==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/8] v4l2-tracer: expand to stateful decoding
Date: Mon, 13 Nov 2023 12:06:11 -0800
Message-ID: <cover.1699904350.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes and improvements aimed at expanding the scope of the v4l2-tracer
to stateful decoding without causing regressions for stateless decoding.

Deborah Brouwer (8):
  v4l2-info/v4l2-tracer: add macro to mark the trace
  v4l2-tracer: replace buftype2s with val2s
  v4l2-tracer: remove buffers by type and index
  v4l2-tracer: remove compress_frame_count
  v4l2-tracer: get decoded bytesused from DQBUF
  v4l2-tracer: create an option to trace userspace args
  v4l2-tracer: stop retracing failed ioctls
  v4l2-tracer: auto generate flags for DECODER_CMD

 utils/common/v4l2-info.h                 |   7 +
 utils/v4l2-tracer/libv4l2tracer.cpp      |  33 ++++-
 utils/v4l2-tracer/retrace-helper.cpp     |   4 +-
 utils/v4l2-tracer/retrace.cpp            | 168 +++++++++++------------
 utils/v4l2-tracer/retrace.h              |   2 +-
 utils/v4l2-tracer/trace-helper.cpp       |  62 +++++----
 utils/v4l2-tracer/trace.cpp              |  20 +--
 utils/v4l2-tracer/trace.h                |   2 +-
 utils/v4l2-tracer/v4l2-tracer-common.cpp |   1 +
 utils/v4l2-tracer/v4l2-tracer-gen.pl     |  21 +++
 utils/v4l2-tracer/v4l2-tracer.cpp        |   6 +
 11 files changed, 198 insertions(+), 128 deletions(-)

-- 
2.41.0


