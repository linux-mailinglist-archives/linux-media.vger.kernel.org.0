Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC0C242840
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 12:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgHLKah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Aug 2020 06:30:37 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47137 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726404AbgHLKag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Aug 2020 06:30:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5o1hkGDIyywL55o1jkGb5H; Wed, 12 Aug 2020 12:30:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597228235; bh=5QxiPHNMlml8/5wUSIyOjZzNW+uCUxvsm0AWtjDEuZ4=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UAxRb7xYNBz7wsmPPf7ZueYBDZ7IRgN/+f07m9paFwYDe+/GyHyHfm0Y7fsPbpFqM
         im7POdjFlCuABm1ycByq/s01CBxNfxwe8cU/0RtNGoJ3CaKgm3bm08Q3Yr3fsxlcG/
         x5snXGFBUJn4xqOihUmZGQE9HFQc+yn+PFp/0+G+JjrKDx8cEGeFJIY9t/h1vrkY/B
         HVTkWfpRG3WR0rXjwe2qvdi+pB4cULQNQco37MD3kUpHzoLh7CtbRZjc/D1yH7K58A
         X7DV1BJ9I+iTVkd8BB+sfDwF6RiQ4xh+N1Ez0NLk1fvJvmC+y+VKJ9+dN+VglxmoiW
         9uldHjEgh78Qw==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.8] vicodec: add missing v4l2_ctrl_request_hdl_put()
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <60cb280b-fb2a-86f6-aefb-cc12386b3adf@xs4all.nl>
Date:   Wed, 12 Aug 2020 12:30:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNUjg5ViURPR8WWH1PulkN/29MgeDil7tJDkRuUTD1frO5r1nz0jK2oczSds5VuI2/8v713gEiL7sPyxFj86OHu+q21jMG2CZO2/+wA/C4iehJwMzae0
 nlE3ZasJW0NkdBPdY4wLOpreXAUYHCcH79umPrD0uXlIrS+e4YDtJA3NZGVlHyoppslv25QZlG6M57A118pUT2tHwhSrXqDXcnNsjM5Wu9WmD4fSE+93ZXfU
 lENIoKlMvrga8nXmzucgcABBokZdqTXxIm/0L0BEG8s=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The check for a required control in the request was missing a call to
v4l2_ctrl_request_hdl_put(), so the control request object was never
released.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 997deb811bf5 ("media: vicodec: Add support for stateless decoder.")
---
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 8941d73f6611..71928e30dae8 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1994,6 +1994,7 @@ static int vicodec_request_validate(struct media_request *req)
 	}
 	ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
 					       vicodec_ctrl_stateless_state.id);
+	v4l2_ctrl_request_hdl_put(hdl);
 	if (!ctrl) {
 		v4l2_info(&ctx->dev->v4l2_dev,
 			  "Missing required codec control\n");
