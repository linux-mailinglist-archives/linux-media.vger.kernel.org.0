Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27620225441
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 23:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgGSVQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 17:16:35 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:23490 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgGSVQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 17:16:35 -0400
Date:   Sun, 19 Jul 2020 21:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595193389;
        bh=VwwFYLom9cti28UNn/WWIp/Ik6nYQzVbbvy6jEL/CBY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=SQpLnU2WiTWaPKQK3KNPX3euofINlTKruDF/EqDckEGgdfGqoM9ttZFizm6xdE1m1
         6hCLNBFcroN6ssPAOBUfuqIP8acGtEwHug16SWzofJnSR6nrX4L0oN8YRCFFCK9RlU
         NxTH70jmcGvnEh4WOcpSZIT9OmrCh+mZeREWk9b0=
To:     mchehab@kernel.org
From:   Colton Lewis <colton.w.lewis@protonmail.com>
Cc:     linux-media@vger.kernel.org,
        Colton Lewis <colton.w.lewis@protonmail.com>
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: [PATCH 2/2] v4l2: Correct kernel-doc inconsistency
Message-ID: <20200719211609.152611-2-colton.w.lewis@protonmail.com>
In-Reply-To: <20200719211609.152611-1-colton.w.lewis@protonmail.com>
References: <20200719211609.152611-1-colton.w.lewis@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Silence documentation build warnings by correcting kernel-doc comment
v4l2_subdev_get_fwnode_pad_1_to_1 function

./include/media/v4l2-subdev.h:1045: warning: Function parameter or member '=
entity' not described in 'v4l2_subdev_get_fwnode_pad_1_to_1'
./include/media/v4l2-subdev.h:1045: warning: Function parameter or member '=
endpoint' not described in 'v4l2_subdev_get_fwnode_pad_1_to_1'

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 include/media/v4l2-subdev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f7fe78a6f65a..396209b64af5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1031,8 +1031,8 @@ static inline void *v4l2_get_subdev_hostdata(const st=
ruct v4l2_subdev *sd)
  * v4l2_subdev_get_fwnode_pad_1_to_1 - Get pad number from a subdev fwnode
  *                                     endpoint, assuming 1:1 port:pad
  *
- * @entity - Pointer to the subdev entity
- * @endpoint - Pointer to a parsed fwnode endpoint
+ * @entity: Pointer to the subdev entity
+ * @endpoint: Pointer to a parsed fwnode endpoint
  *
  * This function can be used as the .get_fwnode_pad operation for
  * subdevices that map port numbers and pad indexes 1:1. If the endpoint
--=20
2.26.2


