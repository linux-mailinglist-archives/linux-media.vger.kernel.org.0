Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922B1336FC3
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbhCKKUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:49 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45183 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232284AbhCKKUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQglKo61; Thu, 11 Mar 2021 11:20:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458030; bh=PjHoSp9WjFCgsd+a/BY6fGrZQV6HYpnqUG49Ry5B0gk=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=rqums34P5ItPC2cBkJ9jcsyURXkrSUOB6pU5GZmkaotcIS0cFwgxsIx9hmdIpC8+H
         oUxNyBn9xrGu5tDjZrSdmlK6SBbf+HY4H9FZsv5WrkavK9AUdMWyQJ26vCywR2/sWB
         LdUW8O8R/VsUv9/LnBYFb8Y48R1p2NaKi6HyoPxVrxD5JDrJy/FpqrG+1HGRfd+V1f
         WgFvxZewiASFbAL+8ZIUBVpTf3FZgpOAIulUHvhHrR5Ng8UZGYG0KxfBojQ4LJVxnW
         wpBUb9jDV36mwre7L7UqAJIsQTYd/EUixgcDDGdiQzmdwnKh9BFkLumkOu60FBqwmd
         QcFoUb8V3w4Yg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 08/13] staging: media: ipu3: add missing kernel-doc 'struct' keywords
Date:   Thu, 11 Mar 2021 11:20:17 +0100
Message-Id: <20210311102022.96954-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM8yx7Q0zYBgI78gf6DyJZMcQ66lh5YEGp98nH9CnoCAbWJlbuxRjXen4cBJQX+PUu4IESiIp0JiVH3JVdiVsiDb940nzFhs6TlLLYNUCQFKIqMt//NC
 PbyB23VCWqFlcCX4osLD8P6H07FxWW2a+sFVlyCi3erMQ/ZBGIqWsYG2H8HYmK1SqT2dQESB6Pl3SGdm16KTJSJEMIEAiYux9fo4EPeRqRTxck9sRGwR0Pmh
 zogjep1c7XsvjO8R38iwcJJqt1O1/5rli16K6Wl9HoQ3gCDFkdJp4zpg0tUmZYHw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two structs where missing the kernel-doc 'struct' keyword
in their kernel-doc documentation.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu3/ipu3-css-pool.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-pool.h b/drivers/staging/media/ipu3/ipu3-css-pool.h
index a8ccd4f70320..35519a08c08c 100644
--- a/drivers/staging/media/ipu3/ipu3-css-pool.h
+++ b/drivers/staging/media/ipu3/ipu3-css-pool.h
@@ -10,7 +10,7 @@ struct imgu_device;
 #define IPU3_CSS_POOL_SIZE		4
 
 /**
- * imgu_css_map - store DMA mapping info for buffer
+ * struct imgu_css_map - store DMA mapping info for buffer
  *
  * @size:		size of the buffer in bytes.
  * @vaddr:		kernel virtual address.
@@ -24,7 +24,7 @@ struct imgu_css_map {
 };
 
 /**
- * imgu_css_pool - circular buffer pool definition
+ * struct imgu_css_pool - circular buffer pool definition
  *
  * @entry:		array with IPU3_CSS_POOL_SIZE elements.
  * @entry.param:	a &struct imgu_css_map for storing the mem mapping.
-- 
2.30.1

