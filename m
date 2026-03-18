Return-Path: <linux-media+bounces-56184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I/cDxJoumnnWAIAu9opvQ
	(envelope-from <linux-media+bounces-56184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:53:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F42B8829
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ABF630C7A9E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADFA38F94A;
	Wed, 18 Mar 2026 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQP4/1Hi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A7F38F94E
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823828; cv=none; b=D7gTE6I2FyTbeajEDCe8FYrRlV8xFKZwFemfJp5/3DuphchUFYFaO5ULzYM/Eh0oLiLYa8J3vQrG8T/AUTbaLoL68/SD/cyJroxw/j8yQt+gyaeyzDEoOMEar3gvdSrhoYeD/7c2r0TaJwbiOKBCshyoJANZsi6WM8p2JMPUj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823828; c=relaxed/simple;
	bh=m668tyQymQnfCkhmdsJ7IENlD/tKANOt2hk1466qyhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRHpbQPfdb+BxmAkgtPAyMIyMGH7ViZymAMiciemED8wQ0dkSJiUgg+H0EsZY71EKGfvmH5jjme2A04ZxHeR8QAlOk5hoEDf1TERMNBgN/Pr9kXdJfxNbk/e6Z3vQRYBQAcueTbhfM372qVcXZWI6bCyR9oKDK5FaF6NGnXLX08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQP4/1Hi; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so354611f8f.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 01:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823824; x=1774428624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnI3/1shswpctWxVX0DhVP02QL18DhS7NRzz/xsnoZU=;
        b=KQP4/1HixdErXM1VTdGkSe239DW/WkQsMBacXtrC8QV/uJrQXAQkRlDFR9niRmqKxT
         meIWOsNIiw2OiJRy7/LE0tTvJFODnuF3L3FtootEePriH2IbHT4DtwxmlpuhL3ltKxeC
         6/+akmeQ+o4rc0p2P1yb92ELeSBOfo15G+hQ+luNT+1Nzu86AR8OpRsa+MqR/EJO+abW
         OgCd8xT6c10sZQ/tYkis9cs7pC0ww2mXyetRkuvnTDnqrhWIfUzPu1d27Ma8uGMGY/eA
         TPuT9rX5X12t88BwzVbA4qETzkmtUH2APmOEofiL0wbiAtXo1+Ihoj59mCoj+1KWwLZ5
         /enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823824; x=1774428624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnI3/1shswpctWxVX0DhVP02QL18DhS7NRzz/xsnoZU=;
        b=Eo/388S8vxijXWBv38UPJo1JlcZ335A5bxtiLUSyzPOSnsaSxzeVx8dd50Db1z2Y6n
         +Q0iKklOLuz4kvrq3kz7tIhZdGuDtofbw2N4jYGrbScnzulFyZk5bmIWjBlaOBTRYTwW
         Drqo6PW1pT7A4mk4MyUi6GSxmDx3xdNKXhQ6QEN9wxeyH9M2gL6Ht6Nex4u5ifBLO6SP
         d3oandWFbiuPfjNpSlL1iofyIpY5rSGBw7ryPMLJGyMpsUKlOHD7tFP9jmLMKUigLplb
         hroYvgWvsTkunuME6N8xR9iU7zFP6ywY9aZb87Bj1PxweOYj9mC+36+8ZGRjVReh0vod
         rqFw==
X-Gm-Message-State: AOJu0YyNKx+SFKcezfBErop1/YgGSqctyjVT+58GVhLPujPzSUk6xAfs
	1kbgC6jYI6zTzNX1hS6pxD/I58mvmCS0T284PPiNqeTAkZr5+SrYi2LafwAFMg==
X-Gm-Gg: ATEYQzyZngqLFIN74n4xF0e77o/XbKKB/619HsQXTLtL28cD9EKxqiE5fuvN35g/7d1
	b5TqdmH+zDRtbOUrYn2opaLkfVkhZPq5TBtxnmSN5fC90f1zymSKwO4x80Tu4rp8x7B3sMSWGQj
	1ieGkUjILHdPud6AIo1UJzkmttTaaRpIkPpbp166c3LdS3H26UdqHYOyiCLDZzOQvAsmm+k4Ni4
	opvUYIMJ2SPeTjE6fSx2yioGk63s/WcjWxkCrcQ0KWqDNttxKDA1g+vgN9NhuDuvbY2P1ppPEY4
	Hrabsu0A+Iat6PCVnddXVSR/KezalPvLGaxnVU2rOEVEMJ2+hR2O4k+dkhLi5vDMcSqus/CsGeK
	HoKmMFYHDl7j2b8DruSE+PbbbEZT30jvLfoBTZHfchW27lCjqIdaoHHlHCOFonOvNUVTgskiPV2
	86TQLfy7mjOJH2OEtcS3IFwtwXF260UbAUK/+j1pL4nXuao9ZTmYIZ0l131IdzpavjTwyKUlqcY
	H3vHG4aOAVd2+n1hA==
X-Received: by 2002:a05:600c:4e42:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-486f446359emr37198375e9.29.1773823823805;
        Wed, 18 Mar 2026 01:50:23 -0700 (PDT)
Received: from localhost.localdomain ([37.60.47.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ec4c9f3sm115147665e9.0.2026.03.18.01.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:50:23 -0700 (PDT)
From: Esther Zilberberg <esty5664@gmail.com>
To: linux-media@vger.kernel.org
Cc: Esther Zilberberg <esty5664@gmail.com>
Subject: [PATCH v4l-utils] v4l2-tracer: retrace: support all mplane planes
Date: Wed, 18 Mar 2026 08:49:35 +0000
Message-ID: <20260318084936.10626-1-esty5664@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-56184-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esty5664@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C30F42B8829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For V4L2_BUF_TYPE_*_MPLANE buffers, retrace_v4l2_buffer()
only restored the first plane from the JSON trace.

Restore all planes by iterating over the "planes" array and
reconstructing each struct v4l2_plane entry, assigning them
into a properly allocated array.

This ensures consistency with trace output and prevents
incorrect buffer reconstruction for multiplanar formats.

Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
---
 utils/v4l2-tracer/retrace.cpp | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 010936c0..844c25c7 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -284,9 +284,22 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		json_object *planes_obj;
 		json_object_object_get_ex(m_obj, "planes", &planes_obj);
-		 /* TODO add planes > 0 */
-		json_object *plane_obj = json_object_array_get_idx(planes_obj, 0);
-		buf->m.planes = retrace_v4l2_plane(plane_obj, buf->memory);
+		buf->m.planes = (struct v4l2_plane *) calloc(buf->length, sizeof(struct v4l2_plane));
+        if (buf->m.planes == nullptr) {
+            line_info("\n\tMemory allocation failed.");
+            free(buf);
+            return nullptr;
+        }
+        for (__u32 i = 0; i < buf->length; i++) {
+            json_object *plane_obj = json_object_array_get_idx(planes_obj, i);
+            if (plane_obj == nullptr)
+                break;
+            struct v4l2_plane *plane_ptr = retrace_v4l2_plane(plane_obj, buf->memory);
+            if (plane_ptr != nullptr) {
+                buf->m.planes[i] = *plane_ptr;
+                free(plane_ptr);
+            }
+        }
 	}
 
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
-- 
2.43.0


