Return-Path: <linux-media+bounces-34107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EFEACEE39
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E6373AA2EB
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B38224220;
	Thu,  5 Jun 2025 10:59:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC9215198
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121165; cv=none; b=GnVlcYiTjnQpiDkJFtpMD+0V/UC3H+zltYGdJjOoD3zSKrgW2FDokZgICNnXR6iC+6AvXZwskvtDnq6/4Vg21nTwYDwup532xoM2lG/Y9kNZIBr1CIkethG+zqxGc/l1uAGJ16KThioGGcpp3r3Hs24vOON0ghbnY8nCFd3+dmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121165; c=relaxed/simple;
	bh=WiUwqHpjji8OhlrAYM/1xwjpeNk+XS97lWA25/k2b1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EO7cU3vUKka88B6epdNXkcx8LwjRfyeDLowYZKGF4kvT47LwXoJKJs4oq/cN5/DaY4tLYn6uK74DPqPw2uHUiX47o4XfJ3bYiO+rLyAdbH4k3CXCODlciDSmTXA08DnaLGJkBj6IHd0/oCwj640tsONC7Tin0S76MDGexvsWmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E56CC4CEEB;
	Thu,  5 Jun 2025 10:59:24 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 6/9] libdvbv5/dvb-v5-std.c: add DTV_BANDWIDTH_HZ where possible
Date: Thu,  5 Jun 2025 12:58:29 +0200
Message-ID: <f3226f83c3e8cf9f71dc53d435abc381f88e08b0.1749121112.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749121112.git.hverkuil@xs4all.nl>
References: <cover.1749121112.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several systems support DTV_BANDWIDTH_HZ, add it.

This fixes a dvbv5-scan error message about missing support for
DTV_BANDWIDTH_HZ.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 lib/libdvbv5/dvb-v5-std.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/libdvbv5/dvb-v5-std.c b/lib/libdvbv5/dvb-v5-std.c
index c0a14175..74e2e4fe 100644
--- a/lib/libdvbv5/dvb-v5-std.c
+++ b/lib/libdvbv5/dvb-v5-std.c
@@ -81,6 +81,7 @@ const unsigned int sys_isdbt_props[] = {
 const unsigned int sys_atsc_props[] = {
 	DTV_FREQUENCY,
 	DTV_MODULATION,
+	DTV_BANDWIDTH_HZ,
 	0
 };
 
@@ -111,12 +112,14 @@ const unsigned int sys_dvbc_annex_ac_props[] = {
 	DTV_INVERSION,
 	DTV_SYMBOL_RATE,
 	DTV_INNER_FEC,
+	DTV_BANDWIDTH_HZ,
 	0
 };
 
 const unsigned int sys_dvbc_annex_b_props[] = {
 	DTV_FREQUENCY,
 	DTV_MODULATION,
+	DTV_BANDWIDTH_HZ,
 	0
 };
 
@@ -126,6 +129,7 @@ const unsigned int sys_dvbs_props[] = {
 	DTV_SYMBOL_RATE,
 	DTV_INNER_FEC,
 	DTV_POLARIZATION,
+	DTV_BANDWIDTH_HZ,
 	0
 };
 
@@ -139,6 +143,7 @@ const unsigned int sys_dvbs2_props[] = {
 	DTV_ROLLOFF,
 	DTV_POLARIZATION,
 	DTV_STREAM_ID,
+	DTV_BANDWIDTH_HZ,
 	0
 };
 
@@ -149,12 +154,14 @@ const unsigned int sys_turbo_props[] = {
 	DTV_INNER_FEC,
 	DTV_MODULATION,
 	DTV_POLARIZATION,
+	DTV_BANDWIDTH_HZ,
 	0
 };
 
 const unsigned int sys_isdbs_props[] = {
 	DTV_FREQUENCY,
 	DTV_STREAM_ID,
+	DTV_BANDWIDTH_HZ,
 	0
 };
 
-- 
2.47.2


