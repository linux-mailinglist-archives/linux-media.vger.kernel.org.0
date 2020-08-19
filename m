Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD4A24A86D
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 23:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgHSVZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 17:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgHSVZy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 17:25:54 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CF0C061757;
        Wed, 19 Aug 2020 14:25:53 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id e5so18971274qth.5;
        Wed, 19 Aug 2020 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IggagUhCG0K8a3hefRSgUzwnSbkGGgrQm83a+JgIvdQ=;
        b=CWC0062TfYPyMrAhnadTO83lwCABw4i0qW5ZR9yuRGMpzkg2cfog4KDEKhR9F1ZxxZ
         MTNxW8PuSzbg4IWibSCF8pAuGKC84cTGCimOUxdBHEwYVpA2+ZTUPGuXiOlhSUwy23Na
         Uta9jFiVoNWO0lVZq15blnh7Xc1iOfhqRgmUCQOOtnIkuvXnhOxbLkfuXARBjEEAfdNH
         a982mEWG/A2Oe6mmVnNc7E9B2Gjq4TztnA8vYXAlQNaPrbiIlXaaiaBsC4QQoi8q1yYU
         vI66H5QsSnVXsEn5e2v3NmgXm4ybqFcT7xXa7iAvEYjP87ckLZZGklfv6lfsLcifcSIE
         w1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IggagUhCG0K8a3hefRSgUzwnSbkGGgrQm83a+JgIvdQ=;
        b=unquwisea38jn5vP7pluVuwku7Rw+6dsQjsrUvA6xqQq1BT6nK8s03xwIux8OV89of
         aIvrMDQIt1pY/bxW9eYR6scs2c1Uj1N2+RYhHqjToizU5zsf248NOQRWVA1yLZT1X/yR
         kxFyueh26uX9Nb6zJJH1KvOwaW4W8bbBPjTeczKNtXOMRG4CyJeh8YBZU4oHABdWcLuJ
         5ATB3ee0KWFTaSc7FdQFqYFOOcgXUiu9LbNUyvPr9YmWvDJxwRDLGBhCrhJ8PgVNWy7A
         EtkymN9o5QDwwbMD9zC3hwEvEHxi3LTy7Aqwy7PRTOf9Pl1j8QOx3C/0i6NJ8FyiK+GH
         cQqA==
X-Gm-Message-State: AOAM531lXnpHVCvREOIhukRoxaQGjaTJ0njdzDSpqW1eV43g1Kk6M58/
        jMcvY6cVtr4xVPc1+VRpchC4scOgU1yeBw==
X-Google-Smtp-Source: ABdhPJy62o1ErltqANeJZM7cNie6fz8k14C/b5Z9r/tbCKNWL3cPTkojLgZfQjqMxy8uRkZiWsfROg==
X-Received: by 2002:ac8:2f2c:: with SMTP id j41mr25168970qta.258.1597872353091;
        Wed, 19 Aug 2020 14:25:53 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c100:b9d:1023:d984:6664:9f69])
        by smtp.googlemail.com with ESMTPSA id q13sm26499398qkn.85.2020.08.19.14.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 14:25:52 -0700 (PDT)
From:   Tong Zhang <ztong0001@gmail.com>
To:     isely@pobox.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, hverkuil@xs4all.nl
Cc:     ztong0001@gmail.com
Subject: [PATCH v2] media: pvrusb2: fix parsing error
Date:   Wed, 19 Aug 2020 17:25:23 -0400
Message-Id: <20200819212523.113973-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <75b8354b-362a-0215-8038-45bd68be7de5@xs4all.nl>
References: <75b8354b-362a-0215-8038-45bd68be7de5@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pvr2_std_str_to_id() returns 0 on failure and 1 on success,
however the caller is checking failure case using <0

Co-developed-by: Hans Verkuil<hverkuil@xs4all.nl>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---

v2: return -EINVAL as suggested by Hans Verkuil<hverkuil@xs4all.nl>.
I also rebased the code on v5.9-rc1.

 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 1cfb7cf64131..6a444cb27e31 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -866,8 +866,8 @@ static int ctrl_std_sym_to_val(struct pvr2_ctrl *cptr,
 {
 	int ret;
 	v4l2_std_id id;
-	ret = pvr2_std_str_to_id(&id,bufPtr,bufSize);
-	if (ret < 0) return ret;
+	if (!pvr2_std_str_to_id(&id, bufPtr, bufSize))
+		return -EINVAL;
 	if (mskp) *mskp = id;
 	if (valp) *valp = id;
 	return 0;
-- 
2.25.1

