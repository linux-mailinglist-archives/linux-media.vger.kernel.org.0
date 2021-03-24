Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F62347133
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 06:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235286AbhCXFqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 01:46:24 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:47158 "EHLO
        mail-m975.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235303AbhCXFqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 01:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DMi9g
        BKA8V6Tl2JurLgWr/kbFPfvpARWZMY2TG8EQVA=; b=gn8TuDPn84AtjJ0EPLcOY
        1WGW9Lt7MlEB7u1YM1aTDZCcKhLFreTXxieDl7uyi9b5qDNdIhT+4TTeY9Q7N225
        eoyTo5HrNVLV3B0THDf3ubitMoiKRX/pt04VbtfKCxnvJ0cRvZ8sFMX92JZMXnPC
        sBqtRb8zSLTZkoXeFlPbYQ=
Received: from caizhichao.ccdomain.com (unknown [218.94.48.178])
        by smtp5 (Coremail) with SMTP id HdxpCgBXIqD10VpgIUcpBw--.92S2;
        Wed, 24 Mar 2021 13:45:43 +0800 (CST)
From:   caizhichao <tomstomsczc@163.com>
To:     mchehab@kernel.org
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, Zhichao Cai <caizhichao@yulong.com>
Subject: [PATCH] drivers:staging: Simplify the if condition
Date:   Wed, 24 Mar 2021 13:45:35 +0800
Message-Id: <20210324054535.1716-1-tomstomsczc@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgBXIqD10VpgIUcpBw--.92S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrGF1UZF1UCr13Xr4kCrg_yoWkGFgEkr
        4ftFn2gr45Cr1fCw15CF4UZ34Iqan5Ar9Y9a4FyFW3KFsrZay8Z3ykZry8J3s0g34Yqr9x
        CrZ5urn3KwnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU05KsUUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: pwrp23prpvu6rf6rljoofrz/1tbisgdfilUMRlWqaAAAso
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zhichao Cai <caizhichao@yulong.com>

Fixes coccicheck warning:
drivers/staging/media/atomisp/pci/sh_css_params.c:4652:24-26: WARNING !A || A && B is equivalent to !A || B

Signed-off-by: Zhichao Cai <caizhichao@yulong.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 9fad28b..7467256 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4649,10 +4649,8 @@ struct ia_css_dvs_6axis_config *
 	params = stream->isp_params_configs;
 
 	/* Backward compatibility by default consider pipe as Video*/
-	if (!params || (params &&
-			!params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO])) {
+	if (!params || !params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO])
 		goto err;
-	}
 
 	dvs_config = kvcalloc(1, sizeof(struct ia_css_dvs_6axis_config),
 			      GFP_KERNEL);
-- 
1.9.1

