Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C12F4C8907
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 14:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfJBMuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 08:50:19 -0400
Received: from aer-iport-1.cisco.com ([173.38.203.51]:63133 "EHLO
        aer-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJBMuT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 08:50:19 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Oct 2019 08:50:19 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1294; q=dns/txt; s=iport;
  t=1570020619; x=1571230219;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=azYyqHIYzV26XDIjpKQ5qhK+INsrRrWYZtnuE1wO6nk=;
  b=MGwx3pwMHA0tJBcIlL9Fb1gz0cP5cUYmWAOpbB9bdBkuI1EEQxRchqXS
   KT9myCHZquTU448wTQ3scgFKxyeZxHWxhdtZhFYw7+cgbWOA1ULg9mNWD
   CUOEb19wvqK5nAlfMoMoZcvQcXbGeE8+CEXxMRmoz1Iqu1+Keh8gtOemJ
   4=;
X-IronPort-AV: E=Sophos;i="5.64,574,1559520000"; 
   d="scan'208";a="17548536"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Oct 2019 12:43:10 +0000
Received: from localhost.rd.cisco.com ([10.47.76.245])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id x92Ch9t7029812;
        Wed, 2 Oct 2019 12:43:10 GMT
From:   Johan Korsnes <jkorsnes@cisco.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, Johan Korsnes <jkorsnes@cisco.com>
Subject: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
Date:   Wed,  2 Oct 2019 14:42:26 +0200
Message-Id: <20191002124226.21458-1-jkorsnes@cisco.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.76.245, [10.47.76.245]
X-Outbound-Node: aer-core-1.cisco.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When logging the AVI InfoFrame, clearly indicate whether or not the
extended colorimetry attribute is active. This is only the case when
the AVI InfoFrame colorimetry attribute is set to extended. [0]

[0] CTA-861-G section 6.4 page 57

Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
---
 drivers/video/hdmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index f29db728ff29..a709e38a53ca 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -682,8 +682,14 @@ static void hdmi_avi_infoframe_log(const char *level,
 	hdmi_log("    active aspect: %s\n",
 			hdmi_active_aspect_get_name(frame->active_aspect));
 	hdmi_log("    itc: %s\n", frame->itc ? "IT Content" : "No Data");
-	hdmi_log("    extended colorimetry: %s\n",
+
+	if (frame->colorimetry == HDMI_COLORIMETRY_EXTENDED)
+		hdmi_log("    extended colorimetry: %s\n",
 			hdmi_extended_colorimetry_get_name(frame->extended_colorimetry));
+	else
+		hdmi_log("    extended colorimetry: N/A (0x%x)\n",
+			frame->extended_colorimetry);
+
 	hdmi_log("    quantization range: %s\n",
 			hdmi_quantization_range_get_name(frame->quantization_range));
 	hdmi_log("    nups: %s\n", hdmi_nups_get_name(frame->nups));
-- 
2.20.1

