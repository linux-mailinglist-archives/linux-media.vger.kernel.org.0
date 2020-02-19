Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9C2D165169
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 22:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgBSVOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 16:14:55 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33471 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSVOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 16:14:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id m10so1276225wmc.0
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 13:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reversity-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H5Jdzh994/mabmLt+fmhdzZ1vCYp9OdIIj7mz0M+8oE=;
        b=oHJadJreJNrgpcK/hTNOj4A4CWZgQpL1enU/NbxSyi3k9jGST3FY+46OeWfTtZo9gg
         BgkDdsiQ9pKdBwdbdVmTXSSacDv4gg44FQrnuhVnW9ogPOnlBZgatJyg7CDPP8p+j23e
         SJyW6az/WoftDehLo9Wn7U+nwJyzlXsoBvFlrvxkeBYAt0ShUAtpOjfzl69cCOFj2KJq
         EAEExPpuYJXQUdxbzV//UzGJljntnq+vdHujH4SGaZBU6kBb/OFrmLhUYxi46ZFBt3LX
         7RbW3TeIQBvhYVmNqAhs0INnMYezEW5rNa/Tphet91CGh1PfZjH1OdK1/B6aM7FjEll1
         alvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H5Jdzh994/mabmLt+fmhdzZ1vCYp9OdIIj7mz0M+8oE=;
        b=Vh1VXHVvkK0W06fS7AuiKqrKXH2fg+QCNdBV673Bwfyc58IfUnkmyWqXCRCK/kb0Bm
         qpY0ZLxG3P9mAlo1/9LxvSQft411Ps7TjZQWLHjCfMqEBGRbjrnfwxsp72ivq3RR4gGk
         8/2DciY/siJUwas6c8om1rWrxGX9h5n3yqIjC6ayCxQJquxjg8aLvm7feeC6hK2LMlLc
         gPivVE8AhHwCWnzgwAI2enFuTanF2tUvtFbX3tALsjJohErCBHcqIGx6co4HLJCiZ0gz
         14X0lbyLDKwNiMfZJrceMtDeBpLFdhY1T0sSG9z90iHXEl+aQEVzQoU6b60P9EtUAXB2
         plRQ==
X-Gm-Message-State: APjAAAWtYYNfovsN4msP6ROIQB0mKJILquaZ5dIIqP1G2n9reoPdv9Ab
        9sEqtBXENMk1QG4agB9H1r0Zuy4nodZSjg==
X-Google-Smtp-Source: APXvYqxv6jNlqO662tgYBf5ED+GG0MP/gAJf7wargTqM4/rdicIYgnGvzB3kCcZgQx3xSDLXLd2BYA==
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr11764079wmf.40.1582146892770;
        Wed, 19 Feb 2020 13:14:52 -0800 (PST)
Received: from puma.l ([2a02:768:6208:8136:1964:bfa4:a3ee:ec59])
        by smtp.gmail.com with ESMTPSA id s23sm1499457wra.15.2020.02.19.13.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 13:14:52 -0800 (PST)
From:   Mario Hros <git@reversity.org>
To:     linux-media@vger.kernel.org
Cc:     Mario Hros <git@reversity.org>
Subject: [PATCH] media: rtl28xxu: add missing sleep before probing slave demod
Date:   Wed, 19 Feb 2020 22:14:19 +0100
Message-Id: <20200219211419.67063-1-git@reversity.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Slave demod needs some time to wake up otherwise it may not respond to the following probe commands. This problem manifested randomly on my Astrometa DVB-T2 dongle.

Signed-off-by: Mario Hros <git@reversity.org>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index c6881a1b3232..2080f6ef4be1 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -552,6 +552,9 @@ static int rtl2832u_read_config(struct dvb_usb_device *d)
 		if (ret)
 			goto err;
 
+		/* slave demod needs some time to wake up */
+		msleep(20);
+
 		/* check slave answers */
 		ret = rtl28xxu_ctrl_msg(d, &req_mn88472);
 		if (ret == 0 && buf[0] == 0x02) {
-- 
2.25.1

