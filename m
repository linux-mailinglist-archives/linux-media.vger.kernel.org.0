Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A652873C0
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 13:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729610AbgJHL7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 07:59:22 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:35421 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728513AbgJHL7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 07:59:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QUZlkBbKmTHgxQUZrkHmqe; Thu, 08 Oct 2020 13:59:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602158359; bh=6HHkZJVkUW1m8oadLMB2734PP4j+NWvBJjSZEXQqQbs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=alkTKbzXSSrE7PEpdCM69kParpDPlXirBL2wIBKYdZSyV6qF2+Edr75ErHwucYqZK
         l4/LfFb2Ymy4loZBjP/KXgRFijBi7RaQUv5n1L1/6kFENf/h4qo+qatHs6FJjU3TO0
         I2E8T7r/c1rMKiPYX0Kd+MIVEny39ZJnTOWAtJYtT4dTYr69aMwgj5YeDgLWuf4vjN
         Xc0mpqOeDyJbgzt3JL8hOBrsExxkbcW0Zryp8D+yUAbTOumS8nhFKFO2BEIjHG0/8U
         3UpjqjgoHy5TJemKvsUFYlpaxfPIx8Sm3NbAVf52B+w8Zk/gDhrSrSSCl/SLbq/OUi
         fs4sEH45Gi7kQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 3/3] dvb-frontends/drxk_hard.c: fix uninitialized variable warning
Date:   Thu,  8 Oct 2020 13:59:13 +0200
Message-Id: <20201008115913.3579973-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201008115913.3579973-1-hverkuil-cisco@xs4all.nl>
References: <20201008115913.3579973-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfM102tBGkuFk8PcQeK1P/KOfyjMeZev73FPNYGzzWuTDcVzAzy2koiP6zgzgcv+989TSJSnhXSqjU++FO7fzSr8PNy9kqurOnwm8cPkgpVloXbEhSnEA
 y4hMCnjUki40jdCgzOcR1JGDKatp3VdtQC33jh5eJPByGFHwvdKMSmBxFp74fAlYAai5yMfYIgxt7WT2JP3AFg1EdLnBU8Kh815Hdh1cj4CvNj+AdVS/RsK6
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drxk_hard.c: In function 'hi_command.constprop':
drxk_hard.c:1016:5: warning: 'wait_cmd' may be used uninitialized in this function [-Wmaybe-uninitialized]
 1015 |   } while ((status < 0) && (retry_count < DRXK_MAX_RETRIES)
      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1016 |     && (wait_cmd != 0));
      |     ^~~~~~~~~~~~~~~~~~

The underlying cause is that the while condition is wrong. It should be:

(status < 0 || wait_cmd) && (retry_count < DRXK_MAX_RETRIES)

'wait_cmd' is only valid if '!(status < 0)'.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/dvb-frontends/drxk_hard.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 32f9346deb3e..a57470bf71bf 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -1011,8 +1011,7 @@ static int hi_command(struct drxk_state *state, u16 cmd, u16 *p_result)
 			retry_count += 1;
 			status = read16(state, SIO_HI_RA_RAM_CMD__A,
 					  &wait_cmd);
-		} while ((status < 0) && (retry_count < DRXK_MAX_RETRIES)
-			 && (wait_cmd != 0));
+		} while ((status < 0 || wait_cmd) && (retry_count < DRXK_MAX_RETRIES));
 		if (status < 0)
 			goto error;
 		status = read16(state, SIO_HI_RA_RAM_RES__A, p_result);
-- 
2.28.0

