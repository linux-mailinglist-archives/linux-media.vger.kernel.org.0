Return-Path: <linux-media+bounces-45273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670DBFCF6A
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09903A9736
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 15:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3BB246BBA;
	Wed, 22 Oct 2025 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="euxRuVdJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E7A2441A6
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148249; cv=none; b=opHX7JnQbrfZltwt+xiDRIr5z1chpnXyL6Pa1ar3WPQ1JABShdu/csY932CLX+5mY+3wyeTVRijHS8eWrO7C1uyTAXS92D1WD2i1qdMyAEWAwjFfVe+85KnZ/+zLFT7m8bq7k1B/LU0/ru0FBkcPPBtOYtrDMyWKC4N/jXbqbBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148249; c=relaxed/simple;
	bh=EhrMzyw644vWMWZVJT0LTv7dNExUnT9f9XQOoTvDZXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/+3hikr7z6pkuIdtbLw+sXm158dKjMzlZ7NDqRyCZ7gW2+0uGUpngcp01RHz/PSRi39eCBjhadKsRomZhYKniF97j+nlAonPRojqEqSO5PeSry7Gi9St86Lof8qci2JzCy2MgBUk27Ff1sf83HpcrfH8ls0/vk2yew3Qd19aXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=euxRuVdJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6182F83D;
	Wed, 22 Oct 2025 17:48:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761148139;
	bh=EhrMzyw644vWMWZVJT0LTv7dNExUnT9f9XQOoTvDZXE=;
	h=From:To:Cc:Subject:Date:From;
	b=euxRuVdJXaPGGbtnw9Wa50T5o0J1BizNO9mlOZ8TVY94e3FWUhfBpLRCAUZPEeRNP
	 ScU40u5Tiv8kGqvnc9M+u3BwcAyZFKihNAaFZoephRCVvZz0HBPlkOjiDpxEF4BL8R
	 DuRuS2JtByAD+hh8Q01nxN37fKUJWrCKLtubF+GY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [v4l-utils] [PATCH] v4l2-ctl: Take stream skip into account to setup out buffers
Date: Wed, 22 Oct 2025 18:50:31 +0300
Message-ID: <20251022155031.2978-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting up out buffers in do_setup_out_buffers(), the function
stops after stream_count buffers and returns QUEUE_STOPPED. This doesn't
take the stream_skip counter into account, resulting in the queue being
stopped too early. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I've tested this patch with a JPEG encoder, invoking v4l2-ctl with

v4l2-ctl -d $dev \
        --set-fmt-video-out width=${width},height=${height},pixelformat='Y12 ' \
        --set-fmt-video width=${width},height=${height},pixelformat=JPEG \
        --stream-out-mmap \
        --stream-mmap=3 \
        --stream-from ${infile} \
        --stream-to ${outfile} \
        --stream-skip=50 \
        --stream-count=1 \
        --stream-loop \
        --verbose

Without the patch streaming stops after 1 frame, with it it stops after
51 frames.

---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index ec85e41e9e12..5192f1e168b9 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1374,9 +1374,14 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 			if (!verbose)
 				stderr_info(">");
 			fflush(stderr);
-			if (!ignore_count_skip && stream_count)
-				if (!--stream_count)
-					return QUEUE_STOPPED;
+			if (!ignore_count_skip) {
+				if (stream_skip) {
+					--stream_skip;
+				} else if (stream_count) {
+					if (!--stream_count)
+						return QUEUE_STOPPED;
+				}
+			}
 		}
 		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
 			set_fwht_req_by_idx(i, &last_fwht_hdr,

base-commit: 910ce5d9ec8377811faaad7da456d25370c9188b
-- 
Regards,

Laurent Pinchart


