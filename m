Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1297DCA3A
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 10:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbjJaJyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 05:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbjJaJy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 05:54:26 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34B0D47
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 02:53:38 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32f78d949daso2358659f8f.1
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 02:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698746017; x=1699350817; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzcHgJeME8SmvLN454BJ2f75d3TFJlrQAlY/l2HK+Us=;
        b=mEYiSDYFll1/nWffzhgULhJcenS803yMEQI5RBGRsP+WAXVo72YLCmCYQjrFRkHHbG
         abGpv9KrYZJQ9t+eFBDK86P21ss9bz/L8oE0Rx1Aw/fLuhAL62eglI/KFmRC+9nwpkTw
         roGnQ7LxYAw1b1QxZYzyJTMQt/RMGRVzTIH3V986zAoioQ0QldYCMLVFFSrnnyBVPg2q
         tluwMOohAGp3tb0fc8sEQnfjgX6HZabza6X2Kf+TOytGKgY2jO6oJ9ebjD2Q++4wqmrr
         HdBIY92VYCkSx6w7AnFhMqdjMZMGbED6ONJu2KOfs4RQhpmR2trj9aj7HwPIh9u446pK
         getQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698746017; x=1699350817;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzcHgJeME8SmvLN454BJ2f75d3TFJlrQAlY/l2HK+Us=;
        b=Ky4cKFCUmeQ1XpeEd3acq4kZLRPsjs99Q6LSoymFqb+jkET6bYbf8aFUun016GQx5m
         CqsFo6NkJ12ky/UpzmaGGuGix2ofgiih2sxRreOfNyvQWx1fKQ/OtXSFVMkpiIneJmNS
         GrzVN4pD+EbT7DR9BAJ+gV2jjkXtQ69Oz00geutr/9+LWolgbJnS7yuyJ2XyjZYIM8s+
         JSy5oW9gVlKnhAJod98yw0zqgtUGVg0IMEd79ekKJtop/6YJ95N/wdXZi5OSNmOvpL04
         8ubrC7ExJttjsmH0BwfDBnEMJgOVYnrzR6ERmzCe3bIMzDB/SGOhPHJPMeOohBwkCWKz
         4C8A==
X-Gm-Message-State: AOJu0YwLtknj0zYp2o3LzvgufLC48beLVrS+xwEQaN5qIIboo6lsCjFX
        xkly8Nfo077JImXNhti77ZHT/A==
X-Google-Smtp-Source: AGHT+IGQ3EbnVgYbgH2NgwfDvLm3+nygpGdf5Agqt6r2SrYPqkaggyRBMRzQlA+p82ssNtqPOj1Idw==
X-Received: by 2002:a5d:670c:0:b0:32d:8431:341e with SMTP id o12-20020a5d670c000000b0032d8431341emr7738143wru.62.1698746016957;
        Tue, 31 Oct 2023 02:53:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d594d000000b00327bf4f2f14sm1073304wri.88.2023.10.31.02.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:53:36 -0700 (PDT)
Date:   Tue, 31 Oct 2023 12:53:33 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Lin Ma <linma@zju.edu.cn>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Hyunwoo Kim <imv4bel@gmail.com>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: dvbdev: drop refcount on error path in
 dvb_device_open()
Message-ID: <47a1e8bd-accf-4afb-85aa-c9a746561902@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If call to file->f_op->open() fails, then call dvb_device_put(dvbdev).

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/dvb-core/dvbdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 305bb21d843c..49f0eb7d0b9d 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -104,6 +104,8 @@ static int dvb_device_open(struct inode *inode, struct file *file)
 			err = file->f_op->open(inode, file);
 		up_read(&minor_rwsem);
 		mutex_unlock(&dvbdev_mutex);
+		if (err)
+			dvb_device_put(dvbdev);
 		return err;
 	}
 fail:
-- 
2.42.0

