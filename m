Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3035AD14
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 21:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfF2Tbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 15:31:35 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33927 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfF2Tbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 15:31:34 -0400
Received: by mail-pf1-f196.google.com with SMTP id c85so4592951pfc.1;
        Sat, 29 Jun 2019 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=iEb4hGSfpAqNO7uZJdmnXtOtykK8ClPPMPCbIhG1ON8=;
        b=VE6wZ8VOd7l4Io/ncKSD6CinMJjB4mZxHgA4WLb71f4vdsPD/tg/FoKkOyU39Krhn3
         V6CnxZGrAb2/ZxxFYKIaqRvcX8b12j211eeRgo2a1Y1V2q/HUGibGahSbbci9BUuKK5I
         VJAzzgRhHaOzmPMoLZkAHsR541syfhcRDd3JodXCTNiuiKrfrMcqnZzVoJaowjYgQNa3
         6AnB9yx57OpCacc4d6FSGgJA9oC3002/9pRooGVWcAZijtDootVX9mNn6FBpbotRAKZC
         J1FkyqPnqNMJnddl5gY0YxlpTDveU3jQC2OscNOSMo0gy4RoqgPNxqGuj6IT90E4rNQh
         dAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=iEb4hGSfpAqNO7uZJdmnXtOtykK8ClPPMPCbIhG1ON8=;
        b=PRYhvPPYrJ1KjdFjJ6Ip2AtcO9s2WdlPosYFSagZvSMNTy87HjxeBflMTdDgneilKw
         s+3AAjkiBtBuvF9wxS7XlUth35PcC+oSU3T9/Pb08LjwIIOfJjDmwyOkrpRDU8FF/UgD
         vaP59YaeGfZbJgaz38CFxE7GaCcfqzKjcqHpkbPxa/plprx+zJLrc+S2p9UehQjInEbs
         7nHX1+Sh7RFnBUAZUfOu1zg/j8UInr1VbY/9ZdSTTdOVhw4mKB1mNQp37ATFIfU1+Cqn
         5AHR917Ij2a85CdSB9vnwAR/rmX+GrYP/0WkVMuQVdFSwzUueBjQsJtrCC1toALxtPS3
         iNZQ==
X-Gm-Message-State: APjAAAXomADnn8btdGhMMzud7BTwFNxfeO8kvbp1zvWgTtQTCHxVf6oz
        CCLH37K+m/LL2MfQpxYtQbw=
X-Google-Smtp-Source: APXvYqxWdfae6MmNyb6yNZNYxp1WwWM3RZAWqKc1EHoSUIT7b+tkmplOTFpELAanOVtNMVpBcMhHdg==
X-Received: by 2002:a63:df46:: with SMTP id h6mr15545778pgj.181.1561836694077;
        Sat, 29 Jun 2019 12:31:34 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.187])
        by smtp.gmail.com with ESMTPSA id 133sm6017202pfa.92.2019.06.29.12.31.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 12:31:33 -0700 (PDT)
Date:   Sun, 30 Jun 2019 01:01:27 +0530
From:   Hariprasad Kelam <hariprasad.kelam@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Irenge Jules Bashizi <jbi.octave@gmail.com>,
        Ioannis Valasakis <code@wizofe.uk>,
        Michelle Darcy <mdarcy137@gmail.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Colin Ian King <colin.king@canonical.com>,
        Hariprasad Kelam <hariprasad.kelam@gmail.com>,
        Madhumitha Prabakaran <madhumithabiw@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging/media/davinci_vpfe: Add null check post kmalloc
Message-ID: <20190629193127.GA18943@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add NULL check post memory operations

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/staging/media/davinci_vpfe/dm365_ipipe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
index 52397ad..5d8ba35 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
@@ -1311,6 +1311,11 @@ static int ipipe_g_config(struct v4l2_subdev *sd, struct vpfe_ipipe_config *cfg)
 		to = *(void **)((void *)cfg + module_if->config_offset);
 
 		params = kmalloc(sizeof(*params), GFP_KERNEL);
+		if (!params) {
+			rval = -ENOMEM;
+			goto error;
+		}
+
 		from = (void *)params + module_if->param_offset;
 		size = module_if->param_size;
 
-- 
2.7.4

