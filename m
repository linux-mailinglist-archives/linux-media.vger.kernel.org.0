Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C57A35D6F7
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 07:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243260AbhDMFPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 01:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243246AbhDMFPz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 01:15:55 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5489CC061574;
        Mon, 12 Apr 2021 22:15:36 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u7so5763338plr.6;
        Mon, 12 Apr 2021 22:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8FKIyfvJimu5n8dTNB4u4e/nO7qNHfn5pyDyp+5wO5A=;
        b=kwYX7mZ+06IgOFbOJmfyFCBrXT2iZis2iKlsVKmQ6TObfXOKlWf748R2KuJuKBe5wQ
         ZDTAW071raQSQESs/qsmvuwWJA3eMJqOpb2TrREPQjrFuCK3bNyyGyMjFdC5DzeDoopm
         9sKCaMc3O2nkzTFh4YI7AP4seaBiWroGsu72AyIafrceegqRLu7jfwTbUuUpsboFm+1C
         dnXytEElZVTt7Ow2SVVw0BBy1F3NLJZvWW73JGjX9VXyY4NcSecXOHEXeFbYd3NkdMbo
         N9L2tiGy3UqxaekwntF0tQTeDB+Ne7kRcpV5iIh+3PSuoInAfzKpHdy83cYIhvE1k+l0
         AxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8FKIyfvJimu5n8dTNB4u4e/nO7qNHfn5pyDyp+5wO5A=;
        b=cNKUdy0hn0EXv9jnLhEbIwF5VHUOvHfDsOdvnjjiv6AZM8Ghll3KOhBQZ4sCtdkSNd
         vAYFrGMoTVebynAOJ1Ccz/l7Q/a0SmNVmbv596Enx6L9kDL7JreXVtH7Z7gywXROE2qG
         qhSN2WFXKoJnqy+lroN6rVE9SNCJdne6NG45HbKDrKgQyxFIK7b+KmJw/LtQAwpcWLnN
         AtHTXdq2/PidYoEf3Zx36sj7orHvqJ9ZIxpJrM5aM+J2CMhi/z1fIeQv0drShWOEQY4J
         EJN++oBh3vTBwnBjZgMjHxBC1SMeqj5eP9Cm6iyPR8UDL49g8CbO6CmYgYJXPWwYJsxa
         3ijQ==
X-Gm-Message-State: AOAM532uTnxebW3FD7JzJ52IIkA3j2PDMHeZcxp55/B0cEV60jdPX1L3
        urWtjaz4cyKz3vS6wBXIsQE=
X-Google-Smtp-Source: ABdhPJyDeXeO03Ru03OrC3kdsY22Ij81nz1iwwYpXoeNA401PfROWPVyPNTRCmz59DtX7J4qXiaIpw==
X-Received: by 2002:a17:90b:1e01:: with SMTP id pg1mr2956908pjb.156.1618290935759;
        Mon, 12 Apr 2021 22:15:35 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id v1sm960182pjt.1.2021.04.12.22.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:15:35 -0700 (PDT)
Date:   Tue, 13 Apr 2021 10:45:29 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v2 1/4] staging: media: intel-ipu3: remove unnecessary blank
 line
Message-ID: <79b543d96fa0bd613090984b98c5665344b4dddf.1618289130.git.mitaliborkar810@gmail.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618289130.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed an unnecessary blank line to meet linux kernel coding style.
Reported by checkpatch.pl

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- No changes. 

 drivers/staging/media/ipu3/include/intel-ipu3.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index d95ca9ebfafb..335522e7fc08 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -75,7 +75,6 @@ struct ipu3_uapi_grid_config {
 	(IPU3_UAPI_AWB_MAX_SETS * \
 	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
 
-
 /**
  * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
  *
-- 
2.30.2

