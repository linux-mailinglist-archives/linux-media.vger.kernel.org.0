Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAF5016002E
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgBOTmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:44 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:56232 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgBOTmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:42 -0500
Received: by mail-pj1-f68.google.com with SMTP id d5so5441650pjz.5;
        Sat, 15 Feb 2020 11:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WaBGbAVLvbw1Oa8PBijA4rVNFNBvvrFDnIgEYRds3L8=;
        b=jmZpkjWsbaobRG1GO0fyalos/nZWZE80HVu13ABf0t7B0ahTcSHiWCChAHZuZiBurG
         b57uODg71jswZRofJSWEa22pIiXiJfsimHlu+cdxpuvye67KXdorOhPsJJKPmK1AIPOD
         G/K7RLOTsPMM03LJifKz3uhbRvnz45jpuCH19Tlc+9o1b52xj5pFK+qmFxRqn1H3vw8/
         4yL09zC4e1YwJnSezJS/M6CM+kAy/t3/T1BmzVN9SxbGMhY6p26MyzAkq1ruMUE+M5r7
         GVT03WQol/jICxoaUmRBiTu2K71nTj3KGgo6z/IBIUZT2CmLoZsZhRhwgbK9WXZyPgiV
         I9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WaBGbAVLvbw1Oa8PBijA4rVNFNBvvrFDnIgEYRds3L8=;
        b=H4kS7QV5MBRMJiXYEDakc/9+KwYWO7vIXwtfTPAlr/xE/T6jnQSyj3aClx3SXzHREa
         xj97Sm6zwkyL19qXdWVM6qLAtLHora4C37MidKOZo7mJGmj+imFjmqnDVjOtS2gofss5
         Roc/9uZyxhh//HXWXB6/XDtwVItI4ezQre5CPCc2cR7Ar2v9EAl+AIiinu6R8xMfqTym
         LCGa8Io/Hjp1OkWdVE2ZRRXaUWtCTm26+AgehQN2pdJRmJgEQiX/AlE98U8fQmi8keT+
         vf0wGOiXerGeABC94eVSpvteOgLXaarKaCBE4WJ3OBh12X8dU+YEJ628btp4ZuXbgcjL
         gQkg==
X-Gm-Message-State: APjAAAWNITLB+BPYOEjQebeHz0ZonphJliwSZhNpwlg9x6taI0IgAacx
        oRk+aw4hK6zR+qkGgWdbHe731WEdAl4=
X-Google-Smtp-Source: APXvYqyieLo6TkLDnsQ1I1ozugLJM2j6uZo5Kq0sitsB01Xv44YmxnyulZiU7C4+ngGeqMUn+Oprtw==
X-Received: by 2002:a17:902:b70e:: with SMTP id d14mr9221633pls.295.1581795759976;
        Sat, 15 Feb 2020 11:42:39 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:39 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 12/17] media: imx: csi: Add missing notifier unregister/cleanup
Date:   Sat, 15 Feb 2020 11:41:31 -0800
Message-Id: <20200215194136.10131-13-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the missing calls to unregister and cleanup the subdev notifier in
imx_csi_remove().

Fixes: c893500a16baf ("media: imx: csi: Register a subdev notifier")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 3e2afdd59276..bea6a70cc353 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -2030,6 +2030,8 @@ static int imx_csi_remove(struct platform_device *pdev)
 
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 	mutex_destroy(&priv->lock);
+	v4l2_async_notifier_unregister(&priv->notifier);
+	v4l2_async_notifier_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
-- 
2.17.1

