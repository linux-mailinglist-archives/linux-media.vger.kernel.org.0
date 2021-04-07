Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C21D35657B
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 09:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349549AbhDGHga (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 03:36:30 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59981 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346776AbhDGHgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 03:36:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id U2jOlACyU43ycU2jRlPYhf; Wed, 07 Apr 2021 09:36:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617780970; bh=9hQvEqMglJn1S/DZYJkGLIqVImTPZS+zQW6uHq2ON3w=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MBEQM8DQftfK5BljUS/vewl6VnGQqVyVtF2Fp1bxEFEjLF/VAYe3aOx74M7Zp3QoK
         gl6y4QqkieEyQQuSUA3N0IorWytkj26NXqj+78F95Jmue/0LDGHJqmphOY9fGsVYAK
         JZKced3qr55TZDJWCL5ZLyyb6Akg4PVBaxH4/NJpNwaTPuFp+uxATFILtfNTV6ZH9E
         0pMh56+2JxBdpw/bWC2wm8ipTiv8jsY1VvV2Ez8np7enL6FDXkJF4Yu1+UDLx0ekkP
         5DRL6i/5DXRgnzx+YldcDzOp/JEVVqx0VGgP2wi+20jCjH/350G0l98S/CtqIXhS7m
         VLb4Yy8r9LxGA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] allegro: change kernel-doc comment blocks to normal comments
Message-ID: <2d849748-bca7-83ef-0308-a8cc5901f127@xs4all.nl>
Date:   Wed, 7 Apr 2021 09:36:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGIL1RsIBfQf9+Prp2sOIKPjiNg7zZi9eXPK5nNASuf70vP7zmsNt2rc1rjD53UCXDobAyPOVp4SG8G4IKEmwyy9cBe2bEDqDYHHLjQzYtXxI733CIbw
 9A/SMvT4KUbi3GXXtXz2AHTf3KxcOyr0GU8byRok11+XSMny2BLLrykKM6EwRassOu/VyUxRDfoAXqWaMHsbN8zATzQZXNAp007aYBeP/DTTXRMecpK6e9v9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The /** at the start indicates that these are kernel-doc comments, but really
these are just regular comments.

Replace /** by /* to avoid a large number of warnings from kernel-doc.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Suggested-by: Michael Tretter <m.tretter@pengutronix.de>
---
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
index 8cc5a28bf237..a19634fe8c0b 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.h
+++ b/drivers/media/platform/allegro-dvt/nal-h264.h
@@ -11,7 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>

-/**
+/*
  * struct nal_h264_hrd_parameters - HRD parameters
  *
  * C struct representation of the sequence parameter set NAL unit as defined by
@@ -32,7 +32,7 @@ struct nal_h264_hrd_parameters {
 	unsigned int time_offset_length;
 };

-/**
+/*
  * struct nal_h264_vui_parameters - VUI parameters
  *
  * C struct representation of the VUI parameters as defined by Rec. ITU-T
@@ -87,7 +87,7 @@ struct nal_h264_vui_parameters {
 	};
 };

-/**
+/*
  * struct nal_h264_sps - Sequence parameter set
  *
  * C struct representation of the sequence parameter set NAL unit as defined by
@@ -142,7 +142,7 @@ struct nal_h264_sps {
 	struct nal_h264_vui_parameters vui;
 };

-/**
+/*
  * struct nal_h264_pps - Picture parameter set
  *
  * C struct representation of the picture parameter set NAL unit as defined by
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
index fc994d4242d8..c09bbe5446aa 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.h
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -54,7 +54,7 @@ struct nal_hevc_profile_tier_level {
 	unsigned int general_level_idc;
 };

-/**
+/*
  * struct nal_hevc_vps - Video parameter set
  *
  * C struct representation of the video parameter set NAL unit as defined by
@@ -129,7 +129,7 @@ struct nal_hevc_hrd_parameters {
 	};
 };

-/**
+/*
  * struct nal_hevc_vui_parameters - VUI parameters
  *
  * C struct representation of the VUI parameters as defined by Rec. ITU-T
@@ -192,7 +192,7 @@ struct nal_hevc_vui_parameters {
 	};
 };

-/**
+/*
  * struct nal_hevc_sps - Sequence parameter set
  *
  * C struct representation of the video parameter set NAL unit as defined by
