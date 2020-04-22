Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6671E1B42D5
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 13:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgDVLKS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 07:10:18 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:50409 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725924AbgDVLKR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 07:10:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RDGdjuQiilKa1RDGhj7oyR; Wed, 22 Apr 2020 13:10:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587553815; bh=mtEAA0mR4h0V7tXdBsV0z6Kf1US7jMGesukxBzoGWYk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Vxd5MmtUwdBfPV89NdzHX0FJZlfZ+LO8T6eYm0IHcSlI+7GemdVGfAPEepa+ur/SN
         M9yP4vKVzmJaKD+4ZxBYzF29u7TzRfbCXb48XShKgGwc1575h3ppU+vcNpxMLi+iEX
         Wzv0U+BCx5vpXUB9LX6TJ8MWC+LH6AfH7UgWqrz5mtxjStYca4t1/N7DbemXKcyW+k
         1FSA6LFhqLU8XkZQHaNtTzlDRU+Ptr8HYy3JV7Y2uvNnqPKCmcu8fEXC4VPGze8qXG
         n8VyDWlAcJYp+LHFOza0l5iLLVgy1myRRfMXWFgok/4tURZTpos+Piyj0RcL9ie/Zk
         C7/FUXi5AKOfw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] rkisp1: fix compile error
Message-ID: <526b9895-95c4-e2a3-a565-5e8397f41458@xs4all.nl>
Date:   Wed, 22 Apr 2020 13:10:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM6xq6ewfiVUv/YjEDaueSANBGnfCz55fJb7ynBjM98IeT+FTeDBpIsls/y60GCenegVY9+Uoga0i/vcvRE3hYTvQcypgaMex24vqZJCCO6c7vJznYp4
 0axALFFbDipZTBS3qzl6mlPp4GRR94D75QrqQnaKpsYeSTHItZ7W8cwhw6m6ZWIkCaLB5KSC0AjA3o5dNhu5x3AZvuxOt4sRfJ6SkRYs10CfZlV+3wVyXKuY
 gqUHzQ9pzeaJ7V8eqh7+XGHMjSJ4+CKYGnX8As4EA70=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There was one missing sensor->mbus.type to sensor->mbus_type
conversion which broke the build.

I suspect this was due to a merge conflict that was incorrectly resolved.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 61f159e59d07..dc2b59a0160a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -291,7 +291,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 	if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		acq_mult = 1;
 		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
-			if (sensor->mbus.type == V4L2_MBUS_BT656)
+			if (sensor->mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
