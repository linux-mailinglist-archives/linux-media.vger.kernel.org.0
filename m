Return-Path: <linux-media+bounces-43490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E9BB0E11
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 138DA16CF9C
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D1330F801;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoOFDW4g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F73019CB;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=TvqIzJM/ECLFvohMX9+bMTmT+hL+nJdrG6TMJpHGQkBaI7ZACS5LXf1WTO5UK90GJq1/tNyY3+V0lfF1wJ+jpMQ8ot5uZYOyZypalIMzH1OEunaCeD01Hea5vDWBPTJjQDh5jG9366A4zSOWQl9Rphviqj8VshlUw+JXCEDv9uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=BpMhPlmacPMtC88QM9VcKjSXx46z3R2YSyY969DUK20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZeRIWvpxiZ6Q+um7A4Bzd7xSij1CLHKlAiNzj+BpZ/sy7do52eBwAX00Y2VyD7s3011r9+R5DdxIXFKaDRRzCPbJhwQH5fkApaVoMpGXcknQa63mBrzR/ZKW2FSOg/8D+8PA3X6naKjMgbZuAJgq0DQwpLJRxxut7OVSMrNCdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoOFDW4g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73267C4AF16;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=BpMhPlmacPMtC88QM9VcKjSXx46z3R2YSyY969DUK20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoOFDW4gXeIqus/L69QLXhUu/pfBgDNdnTYUAmniTybkIoJBj7LNHtYouoOoMmoZ4
	 3BU1hYfGfhiq60cMW0KmB5ukLjsQ3JF00HCyW5dsgLtz5aXfP/ULHZcIoCIIZRgTz6
	 xpIURT5Nu/1jW+drQR/c5Wq0SQRBNAEjUlYasgVivN3MbRjiTvY3bIXjIwWoRtyPbm
	 hBLO4dsGadDwXqd8XIJRsAwNiIE4rcMrSv2Q2f2oEtQcriMjIMYBuYieNaqZ73NRy6
	 4X4nLz1iRmSYXxxrG1ZBxKc1KDz0XgalWCpwtysxbdDsUlD+fGB7GcYdfiF1f15sUA
	 sS5J/tootvdLw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLJT-3665;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 23/23] docs: media: dvb: fix dmx.h.rst.exceptions
Date: Wed,  1 Oct 2025 16:49:46 +0200
Message-ID: <b2acf243771529daa925afddd2b68d07d7bbb164.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are lots of broken links on dmx. Those are mostly linked
to namespace handling.

Yet, some symbols were pointed to the wrong locations, and there
are some definitions that aren't needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/dvb/dmx.h.rst.exceptions            | 82 +++++++++----------
 1 file changed, 39 insertions(+), 43 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/dmx.h.rst.exceptions b/Documentation/userspace-api/media/dvb/dmx.h.rst.exceptions
index afc14d384b83..2c219388d123 100644
--- a/Documentation/userspace-api/media/dvb/dmx.h.rst.exceptions
+++ b/Documentation/userspace-api/media/dvb/dmx.h.rst.exceptions
@@ -1,34 +1,36 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# All symbols belone to this namespace
+namespace DTV.dmx
+
 # Ignore header name
 ignore define _UAPI_DVBDMX_H_
 
 # Ignore limit constants
 ignore define DMX_FILTER_SIZE
 
-# dmx_pes_type_t enum symbols
-replace enum dmx_ts_pes :c:type:`dmx_pes_type`
-replace symbol DMX_PES_AUDIO0 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_VIDEO0 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_TELETEXT0 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_SUBTITLE0 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_PCR0 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_AUDIO1 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_VIDEO1 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_TELETEXT1 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_SUBTITLE1 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_PCR1 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_AUDIO2 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_VIDEO2 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_TELETEXT2 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_SUBTITLE2 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_PCR2 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_AUDIO3 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_VIDEO3 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_TELETEXT3 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_SUBTITLE3 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_PCR3 :c:type:`dmx_pes_type`
-replace symbol DMX_PES_OTHER :c:type:`dmx_pes_type`
+# dmx_ts_pes_type_t enum symbols
+replace symbol DMX_PES_AUDIO0 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_VIDEO0 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_TELETEXT0 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_SUBTITLE0 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_PCR0 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_AUDIO1 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_VIDEO1 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_TELETEXT1 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_SUBTITLE1 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_PCR1 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_AUDIO2 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_VIDEO2 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_TELETEXT2 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_SUBTITLE2 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_PCR2 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_AUDIO3 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_VIDEO3 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_TELETEXT3 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_SUBTITLE3 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_PCR3 :c:type:`DTV.dmx.dmx_ts_pes`
+replace symbol DMX_PES_OTHER :c:type:`DTV.dmx.dmx_ts_pes`
 
 # Ignore obsolete symbols
 ignore define DMX_PES_AUDIO
@@ -38,29 +40,23 @@ ignore define DMX_PES_SUBTITLE
 ignore define DMX_PES_PCR
 
 # dmx_input_t symbols
-replace enum dmx_input :c:type:`dmx_input`
-replace symbol DMX_IN_FRONTEND :c:type:`dmx_input`
-replace symbol DMX_IN_DVR :c:type:`dmx_input`
+replace symbol DMX_IN_FRONTEND :c:enum:`DTV.dmx.dmx_input`
+replace symbol DMX_IN_DVR :c:enum:`DTV.dmx.dmx_input`
 
 # Flags for struct dmx_sct_filter_params
-replace define DMX_CHECK_CRC :c:type:`dmx_sct_filter_params`
-replace define DMX_ONESHOT :c:type:`dmx_sct_filter_params`
-replace define DMX_IMMEDIATE_START :c:type:`dmx_sct_filter_params`
+replace define DMX_CHECK_CRC :c:type:`DTV.dmx.dmx_sct_filter_params`
+replace define DMX_ONESHOT :c:type:`DTV.dmx.dmx_sct_filter_params`
+replace define DMX_IMMEDIATE_START :c:type:`DTV.dmx.dmx_sct_filter_params`
 
-# some typedefs should point to struct/enums
-replace typedef dmx_filter_t :c:type:`dmx_filter`
-replace typedef dmx_pes_type_t :c:type:`dmx_pes_type`
-replace typedef dmx_input_t :c:type:`dmx_input`
+replace symbol DMX_BUFFER_FLAG_HAD_CRC32_DISCARD :c:type:`DTV.dmx.dmx_buffer_flags`
+replace symbol DMX_BUFFER_FLAG_TEI :c:type:`DTV.dmx.dmx_buffer_flags`
+replace symbol DMX_BUFFER_PKT_COUNTER_MISMATCH :c:type:`DTV.dmx.dmx_buffer_flags`
+replace symbol DMX_BUFFER_FLAG_DISCONTINUITY_DETECTED :c:type:`DTV.dmx.dmx_buffer_flags`
+replace symbol DMX_BUFFER_FLAG_DISCONTINUITY_INDICATOR :c:type:`DTV.dmx.dmx_buffer_flags`
 
-replace symbol DMX_BUFFER_FLAG_HAD_CRC32_DISCARD :c:type:`dmx_buffer_flags`
-replace	symbol DMX_BUFFER_FLAG_TEI :c:type:`dmx_buffer_flags`
-replace	symbol DMX_BUFFER_PKT_COUNTER_MISMATCH :c:type:`dmx_buffer_flags`
-replace	symbol DMX_BUFFER_FLAG_DISCONTINUITY_DETECTED :c:type:`dmx_buffer_flags`
-replace	symbol DMX_BUFFER_FLAG_DISCONTINUITY_INDICATOR :c:type:`dmx_buffer_flags`
-
-replace symbol DMX_OUT_DECODER :c:type:`dmx_output`
-replace symbol DMX_OUT_TAP :c:type:`dmx_output`
-replace symbol DMX_OUT_TS_TAP :c:type:`dmx_output`
-replace symbol DMX_OUT_TSDEMUX_TAP :c:type:`dmx_output`
+replace symbol DMX_OUT_DECODER :c:type:`DTV.dmx.dmx_output`
+replace symbol DMX_OUT_TAP :c:type:`DTV.dmx.dmx_output`
+replace symbol DMX_OUT_TS_TAP :c:type:`DTV.dmx.dmx_output`
+replace symbol DMX_OUT_TSDEMUX_TAP :c:type:`DTV.dmx.dmx_output`
 
 replace ioctl DMX_DQBUF dmx_qbuf
-- 
2.51.0


