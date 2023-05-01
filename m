Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C502C6F325D
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 16:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbjEAO5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 10:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjEAO53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 10:57:29 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09DAE76
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 07:57:27 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so2675219a12.0
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 07:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1682953046; x=1685545046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+Szr5JBy8RaoZnqf1yWe8wMzkp/4nwEXk00ydqk3dY=;
        b=A2jMdqHJJG3LFuNyIPcPe77P3WcaFgvImBFQ4p51PGmLJpu8+k4Arp8WRHas2OoyYf
         FIY5XUKZ1RMTsH4j8zpy1ne1qoMn78frUGsWAlNTo27A5yRWFrV14jpx7H+rh97bzIUy
         fr10EqkaoimJmGSO5X/doYsBELdjJaBOLdw4LNhGpHq+Lo5b9xNeEiRQUoJUdA9iUXbZ
         VqFTcqv4iLlFGZEXHGaWvlk2ws9HOga/vd0N4ar/VD8iY58gFXIziTL7MTC9OsIBDcNa
         nbUmt8JlbxqXrmqmvFwCt+Vr4JPl56RDGaIfngF6mc+ZwprQ10ZTpKhOtVVZSktbS7lG
         SxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682953046; x=1685545046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+Szr5JBy8RaoZnqf1yWe8wMzkp/4nwEXk00ydqk3dY=;
        b=SB+3UXuDv1nsnBJVZ9Umt1Q/UkZHhn3AWSoNoRAEOYAPyBv/qWVb+qfEtoJgNvwAfa
         Vwm09ZWAaQCheGM/9kCQamnEDgHjNsZJM2vCIN4hpbKWvxKEy0KMl0sxzJHqWjRFFYim
         zH7pN+VNEOR5n7d9HmBV4EiMoMMEvzXjhikAqa/2qGWQXVTudwz58Tv1qipf+wCgbHEJ
         w2ay0vl1NBL0GmWpZjxH0ac3r6O8uR5LzPNp3Jb0wNiw/R0t69zBXRMQQ6viVX290TIG
         Uf4uiouM3qwp4M1PQPd4M/wCGl9lsdE+onU5FQKROoPjd49YfHSywRWgqJClzonagebj
         VqWg==
X-Gm-Message-State: AC+VfDwFHVi6uYIlWLGZ8zy5CAp+g2BFjsVeFVl55pWDFkPR5Yc9PRaZ
        RsMz343xPnS/N2k7ddP50RVSDsW7GqqM2jCoKF8=
X-Google-Smtp-Source: ACHHUZ46rr5hhtHOMUMfoC3QVIiXRcUZIi/YaLi3ELDHdrplufmKD7htjuYy1tVcgAZ07FgDf8lNEw==
X-Received: by 2002:a05:6402:517a:b0:50b:c896:12eb with SMTP id d26-20020a056402517a00b0050bc89612ebmr1611525ede.31.1682953046415;
        Mon, 01 May 2023 07:57:26 -0700 (PDT)
Received: from dlp-nixos.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id g24-20020a50ee18000000b0050690bc07a3sm11999481eds.18.2023.05.01.07.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 07:57:26 -0700 (PDT)
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org,
        Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: [PATCH 1/2] media: videodev2.h: Fix p_s32 and p_s64 pointer types
Date:   Mon,  1 May 2023 16:57:06 +0200
Message-Id: <20230501145707.4088026-2-dlp@qtec.com>
X-Mailer: git-send-email 2.38.4
In-Reply-To: <20230501145707.4088026-1-dlp@qtec.com>
References: <20230501145707.4088026-1-dlp@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the intended pointer types for p_s32 and p_64 in the union of the
struct v4l2_ext_control.

Fixes: e77eb66342c7 ("videodev2.h: add p_s32 and p_s64 pointers")
Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>
---
 include/uapi/linux/videodev2.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index aee75eb9e686..9e7cf1d36945 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1807,8 +1807,8 @@ struct v4l2_ext_control {
 		__u8 __user *p_u8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
-		__u32 __user *p_s32;
-		__u32 __user *p_s64;
+		__s32 __user *p_s32;
+		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps *p_h264_pps;
-- 
2.38.4

