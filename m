Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF34430A86
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344038AbhJQQWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344014AbhJQQWv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:22:51 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4853CC061768;
        Sun, 17 Oct 2021 09:20:42 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id np13so10588985pjb.4;
        Sun, 17 Oct 2021 09:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fz5biioEaxzmk90taTLWjwha9QBsnc0Q/9w21LeSWAE=;
        b=hJxU/L547sPEH/X/RobaV/wHpXuK6xEPJbf7C952RQF+0G3+aZGMjLXQrEyAlJRHz5
         efKgOz6W2DcU8KwYjWkOGAYAfB8lM2eeYvy0XzOqdksnMG/5WGNKhDfYJdaOiVre+B2i
         s41ugn10WUKl1rMcIRctpuzAlEVuTEcSHZZahsw9vx78OKSJ9Rbl10VV1uYrDe158UzO
         IHf8ecJgOHok8Wols2GCl3Uic30XXZYj384/qf59z666YzcugPx3DJK2mc6nRnBPwc5Q
         HPy4q5yviaH9weqhiJ9sn3ryq2wTAFi6Q3rPWY8RULlTQAzuwjN1hpFrGVAKlwmSLqOH
         HYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fz5biioEaxzmk90taTLWjwha9QBsnc0Q/9w21LeSWAE=;
        b=E4/0f+lcjVcxJBgsOZWQCEpZ8058eEUmiNYfa3Zu6UXCkQT6e3zjIin5GrYlNBHDtB
         RrTU0kLvBMy3dlhAGDGq6v91K5cqofh69lWglc7BMrsZeDgtDk0KofRDozL/Sb45b6K5
         OL6cQmgORnoH4hBX2nbMYySPj+GHoKnCUtfh2eRjSO7Cs2oWyXAgcDcacI5bkafo94Le
         JlfRN1yVUeDQBytH9Gfmaln+RtPm7Q4NBGTVKZVUuNlt2hSNb7lYSsbEZWXtC22OmPPO
         e/tKcPgOTSc2zACK8cPQjP4XYeKovl05POFw5kiBVBu4iOiHfE65SVkiKwGVPqNeySDB
         +KRQ==
X-Gm-Message-State: AOAM530SPosiO80HguGzBkdlLHqdH48H6Gr5Ha3OMxnMALVtEM1zEViA
        ZEX0+QnuRLUpvPBPPx+3C6g=
X-Google-Smtp-Source: ABdhPJx9lwgRB5C7qGwjCZD0ZzWyNeQSAmyDLzITbIPVHi8EYqmOeTn0ymaevjL/FaAj+BXT0Q5I5Q==
X-Received: by 2002:a17:902:758b:b0:13e:8b1:e49f with SMTP id j11-20020a170902758b00b0013e08b1e49fmr22353467pll.6.1634487641749;
        Sun, 17 Oct 2021 09:20:41 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:20:41 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/17] media: atomisp: pci: add missing media_device_cleanup() in atomisp_unregister_entities()
Date:   Mon, 18 Oct 2021 01:19:41 +0900
Message-Id: <20211017161958.44351-2-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the commit 9832e155f1ed ("[media] media-device: split media
initialization and registration"), calling media_device_cleanup()
is needed it seems. However, currently it is missing for the module
unload path.

Note that for the probe failure path, it is already added in
atomisp_register_entities().

This patch adds the missing call of media_device_cleanup() in
atomisp_unregister_entities().

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 1e324f1f656e..0511c454e769 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1182,6 +1182,7 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 
 	v4l2_device_unregister(&isp->v4l2_dev);
 	media_device_unregister(&isp->media_dev);
+	media_device_cleanup(&isp->media_dev);
 }
 
 static int atomisp_register_entities(struct atomisp_device *isp)
-- 
2.33.1

