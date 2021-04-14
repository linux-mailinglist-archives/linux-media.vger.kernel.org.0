Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA9535F4D9
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 15:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351349AbhDNN0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 09:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351336AbhDNN0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 09:26:02 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6140EC061756;
        Wed, 14 Apr 2021 06:25:41 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id t11so6810790qtr.8;
        Wed, 14 Apr 2021 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=NS2Bw26/lYixh5RZoHKAJ8ElpXYjSbxdF61bTnSB1is=;
        b=toAJnJVRjMrkpQx4FcSUcX6JbpfReRDzI23V/MWQVYtHJ5SdUfaIkhX+9spmMNyD+y
         UnPE0LJ8X2tQ3x7HG1jy146jJLpcGOEAYvLQSoaz01Oqrj6gGtX9gZbKc1aoeGAR1VOY
         DWDXcLrXDZDPn4NODgl8ioTl9jsRIh1gqfryH2XLTg75uqAbtzPnYHsqfRmBHWTZmHN+
         /9TAr2UDC8pFqlv2E9sJwxiqyzcWxkF5QOfwE4BSPETQpeIGtJymBytcBxHElDjEmo/m
         ZbwixI6k3kMkrcf2QmOh3F1oFVDo56xp1mvAQjNZVeI1ASJlbnLpuWbTAxQP36tpBZI7
         zAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=NS2Bw26/lYixh5RZoHKAJ8ElpXYjSbxdF61bTnSB1is=;
        b=q9ql4ThXP2ctsFXUsNAwBxdng0ASVNmy2qgNEDrWcdsD5nxpBbv3Kd916o/rhVuVQW
         Ov90fSU3dVaeAqDPDQXxaKpCzAOhETtddCT4mSiaa9vJAzVyF3SnEffq98hhFbKvREQq
         chADwv3LSIhrBSJAWzLmJnq9rcSNVShbGhwkNSyer+YjklgqeR5VNsSLpMNVDbMmTs6n
         uF4ohy1GMaagBAuoXyWRbCWwp7I752ZwkZijYs8vF7kgEegGVTrmIrwjZzm4ez4aXfRn
         cTT2nE0IW52hnTnNn7caJ/qSMUiRpYsk78Z6LZhC3wrrRxmDG1QML0ZCAguEok8PGF+y
         DruA==
X-Gm-Message-State: AOAM5335bCakKXG8JbJQsDqWH09Pf8lJe+ZdHN7v7C+XDIb4XfcwEBiM
        wcTFy9e+kXL86XYReAyxejk=
X-Google-Smtp-Source: ABdhPJzwU+M0Oykcfm27jfLSv0IOoPnBW+9uyyzf6trdexap9regc+qGxDIxZMTPntU8lOO3RX4cHw==
X-Received: by 2002:a05:622a:650:: with SMTP id a16mr1628999qtb.316.1618406740656;
        Wed, 14 Apr 2021 06:25:40 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id f14sm7986252qka.54.2021.04.14.06.25.39
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 06:25:40 -0700 (PDT)
Date:   Wed, 14 Apr 2021 10:25:37 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v3] staging: media: omap4iss: Remove unused macro function
Message-ID: <20210414132537.GA15742@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove unused macro function "v4l2_dev_to_iss_device(dev)".

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v2:
 - No changes in code, just forgot to list the changes made

Changes since v1:
 - Remove only unused macro function v4l2_dev_to_iss_device(dev)
 - Left macro functions "to_iss_device()" and "to_device()"

 drivers/staging/media/omap4iss/iss.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.h b/drivers/staging/media/omap4iss/iss.h
index b88f952..3f587e0 100644
--- a/drivers/staging/media/omap4iss/iss.h
+++ b/drivers/staging/media/omap4iss/iss.h
@@ -119,9 +119,6 @@ struct iss_device {
 	unsigned int isp_subclk_resources;
 };
 
-#define v4l2_dev_to_iss_device(dev) \
-	container_of(dev, struct iss_device, v4l2_dev)
-
 int omap4iss_get_external_info(struct iss_pipeline *pipe,
 			       struct media_link *link);
 
-- 
2.7.4

