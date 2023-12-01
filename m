Return-Path: <linux-media+bounces-1438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7A800080
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 01:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEC90281A3F
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 00:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7D317CD;
	Fri,  1 Dec 2023 00:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X9I371AK"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E64BD7D
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 16:47:02 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2AD3B660737C;
	Fri,  1 Dec 2023 00:47:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701391621;
	bh=RCzUu3Jt91aS0g6/qPmYxjvXzvSFL1QpAsnRaTygKo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X9I371AK0po+h2Ayh7qbQORSSnwEOQuRFZp54pNHoCpWuLtLoXcoHKhq7/tgl+M1w
	 GdH7YGCuv9JNc7lX9ltBQHOU6mFHp9YFYHjlNAIWCDmBg6mIJQzmUU50DEltazh9z/
	 3ss3WwO0SN7DeaV+csXQM/CqcSiuE1gW6lTQ32yER3WNQ3tKvNCIP28Yz/L9p1KXki
	 Ah5kZXvlxjqKB9PWr+2Pf9BBTdJ9g65erWNqUhGj11BbJxkOzvoj0ydb150CaWjEcu
	 Tuk9pUlzE2+3NJ9DTgMc8wCecqqtVvjEDV3HFwX4aS3uMUz7tnt5itpYtobVjmpice
	 E7GD2fT7Tklmg==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 2/6] v4l2-tracer: ignore single line comments when parsing headers
Date: Thu, 30 Nov 2023 16:46:30 -0800
Message-ID: <2d822e517357f697921dec4dc0005ceff5bb0707.1701390439.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701390439.git.deborah.brouwer@collabora.com>
References: <cover.1701390439.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just in case there are single-line comments that start with '//',
ignore them in the autogeneration script.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index 1e4cadda..7b4f859b 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -151,7 +151,8 @@ sub clean_up_line {
 	$line =~ s/^\s+//; # remove leading whitespace
 	$line =~ s/.*\# define.*//; # zero out line if it has defines inside a structure (e.g. v4l2_jpegcompression)
 	$line =~ s/^\s*\/?\s?\*.*//; # zero out line if it has comments where the line starts with start with /* / * or just *
-	$line =~ s/\s*\/\*.*//; # remove comments at the end of a line following a member
+	$line =~ s/\s*\/\*.*//; # remove comments /* */ at the end of a line following a member
+	$line =~ s/\s*\/\/.*//; # remove comments // at the end of a line following a member
 	$line =~ s/\*\/$//; # zero out line if it has comments that begin without any slashs or asterisks but end with */
 	# zero out lines that don't have a ; or { because they are comments but without any identifying slashes or asteriks
 	if ($line !~ /.*[\;|\{].*/) {
-- 
2.41.0


