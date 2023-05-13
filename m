Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF1507016BB
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239127AbjEMMek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238952AbjEMMee (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD7C3C24
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xIgIUtVOUKj4gzOmyTofQHkveS/36aXeXqsulYFcutU=;
        b=VqVpZ3sxGBAw6snPkeWW8HIicSwGeTiv7hE1HRQelbxsHvG8DjXt8tTkttDW10GiMIV/He
        Vi2KX1B8rcTZsl/tbVIRciq0D2cfzUtyGr7fW7DSXaFOb3iiSR9CmrQ6eDvIq/bpjSIcRE
        FkKQJgYRAtHniR32tOMkXuRaAOJa4no=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-4uSMFXyTN5Wl7oNR9Sj4eA-1; Sat, 13 May 2023 08:32:52 -0400
X-MC-Unique: 4uSMFXyTN5Wl7oNR9Sj4eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAB9F380670C;
        Sat, 13 May 2023 12:32:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 36DFF40C2076;
        Sat, 13 May 2023 12:32:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 28/30] media: atomisp: Remove unused atomisp_get_css_pipe_id() function
Date:   Sat, 13 May 2023 14:31:57 +0200
Message-Id: <20230513123159.33234-29-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove no longer user atomisp_get_css_pipe_id() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 28 -------------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |  3 --
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 6bae107682c1..1deeb7c28379 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1068,34 +1068,6 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	return 0;
 }
 
-enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device *asd)
-{
-	/*
-	 * Disable vf_pp and run CSS in video mode. This allows using ISP
-	 * scaling but it has one frame delay due to CSS internal buffering.
-	 */
-	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER)
-		return IA_CSS_PIPE_ID_VIDEO;
-
-	/*
-	 * Disable vf_pp and run CSS in still capture mode. In this mode
-	 * CSS does not cause extra latency with buffering, but scaling
-	 * is not available.
-	 */
-	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT)
-		return IA_CSS_PIPE_ID_CAPTURE;
-
-	switch (asd->run_mode->val) {
-	case ATOMISP_RUN_MODE_PREVIEW:
-		return IA_CSS_PIPE_ID_PREVIEW;
-	case ATOMISP_RUN_MODE_VIDEO:
-		return IA_CSS_PIPE_ID_VIDEO;
-	case ATOMISP_RUN_MODE_STILL_CAPTURE:
-	default:
-		return IA_CSS_PIPE_ID_CAPTURE;
-	}
-}
-
 /* Input system HW workaround */
 /* Input system address translation corrupts burst during */
 /* invalidate. SW workaround for this is to set burst length */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 997fa61589ab..56d3df86c706 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -42,9 +42,6 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count);
 void atomisp_stop_streaming(struct vb2_queue *vq);
 
-enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device
-	*asd);
-
 extern const struct v4l2_ioctl_ops atomisp_ioctl_ops;
 
 /* compat_ioctl for 32bit userland app and 64bit kernel */
-- 
2.40.1

