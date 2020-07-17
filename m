Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFEF22369A
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 10:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgGQII4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 04:08:56 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51279 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726113AbgGQII4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 04:08:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id wLQJjsBp5Z80HwLQMjWTlK; Fri, 17 Jul 2020 10:08:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594973334; bh=UX2FFXbfjbowTE4USSZOgwmHu8TYRRoUqk6tROmHIAs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Le9ZpOEFWzhdYTvwoi9QjeTxQvapCOirnhc/Ptv3xmcXWYMicko9NDKCr1zUq+C0U
         2hSu/na2tSXFsJpphBRHGt88VVTSiDtyrkfNayRqvLRzWIu/hZkVd4UFaFYqpTXuEQ
         YyRfWcSdq7ZQeelvUgKswZstNMl4SjvHV8UtGw2agiydprcjsjEtxnQSMJWlqL+CZP
         x9V6nMV6UW7h4Vy1l1JcbrlS8+kUGQDMobBDdsPCsAJVTCLPE1D9+knbhK3mX4W5Ni
         NeqSxgb0PA+ITLF1d7tvjLNtBefckg7VGqMIO3w9NfQh8SQfvzd4MJKpDUuYdHSxww
         S/bKIbdMWfvew==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-subdev.h: keep * together with the type
Message-ID: <23144bce-956b-27cf-0311-e91a2d9aa2b1@xs4all.nl>
Date:   Fri, 17 Jul 2020 10:08:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAr0Qh/FDNwF1LmhHBsPZTO3g4lHOL/pHlramdcOlgE+t4pLaTIPbJTwByq6JZbo5AzcoudpJoF7qtVJca2fDkuNqYUs8vxJM70lfU7tj+pSq2dBb4w6
 Q0+DZwfPhcztdP0fs3fkKPDOfWq3k9gG9iZUVPwnjIea8V+Vp8RJF39Fi730wq33gwgb70oLaz3h2w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Having the '*' in the next line separated from the type makes it
hard to see that these functions return a pointer to that type.

Instead, keep it next to the type name so it is clear that it is
a pointer to that type.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 98975248a033..8ef5a8a5bff7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -947,10 +947,10 @@ struct v4l2_subdev_fh {
  * @cfg: pointer to &struct v4l2_subdev_pad_config array.
  * @pad: index of the pad in the @cfg array.
  */
-static inline struct v4l2_mbus_framefmt
-*v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
-			    unsigned int pad)
+static inline struct v4l2_mbus_framefmt *
+v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
+			   unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
@@ -965,10 +965,10 @@ static inline struct v4l2_mbus_framefmt
  * @cfg: pointer to &struct v4l2_subdev_pad_config array.
  * @pad: index of the pad in the @cfg array.
  */
-static inline struct v4l2_rect
-*v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
-			  unsigned int pad)
+static inline struct v4l2_rect *
+v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_pad_config *cfg,
+			 unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
@@ -983,15 +983,16 @@ static inline struct v4l2_rect
  * @cfg: pointer to &struct v4l2_subdev_pad_config array.
  * @pad: index of the pad in the @cfg array.
  */
-static inline struct v4l2_rect
-*v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
-			     unsigned int pad)
+static inline struct v4l2_rect *
+v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_pad_config *cfg,
+			    unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
 	return &cfg[pad].try_compose;
 }
+
 #endif

 extern const struct v4l2_file_operations v4l2_subdev_fops;

