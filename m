Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0DE35F5DE
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 16:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351785AbhDNOGj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 10:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351732AbhDNOGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 10:06:32 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C900C061574;
        Wed, 14 Apr 2021 07:06:10 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id 130so7270188qkm.4;
        Wed, 14 Apr 2021 07:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=24C4YPPmvpQq0WpQR0fbdbp9ZiV7j5vDcMjzvvE1mNk=;
        b=uBrTXX9Zjwe3GGx4+r+nd5zq18AbmlA/vprUL1ffl6e5521M0Khm/LR9QaX+SQdOop
         IE00povsaMQW7lrQKqzg32f1hno2HBrxx1hijK+5dl46EwqMBNJg4ckqw9W7V9HRIHCA
         fsJIuoFvSrqBVoXsubEVIc5d+8IMGJG3vNENDPpjjFkT1YcuHYYy3EInYyczsOsT8o7F
         ngqET7waO9GGkZNpkAS/I6TwjOL4kKb4/EC9+p0kI41mvqabdR5kspUivquVMRaX4Ezd
         UalhTACn0GTdU5/mKk+a/wHJTZqhPzb6vtQPAP3R2VJESiKskPwi+L0PetpIK9OFajW/
         o4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=24C4YPPmvpQq0WpQR0fbdbp9ZiV7j5vDcMjzvvE1mNk=;
        b=YU0oHamT/+VPJ1Xj7iyA3uwppvZ+rTGcf6rmzN4D6hy/GcByIyPwNEm+ALyiMQqegu
         JCpJi+3G5tPXelXTJymxCCn2IOPfAw+nQsTN7WC4BCH95DZWCMnYlxNOsfuRxes6FL5Q
         K6prlYaZIR4IcswVTWNxBr/ssjlYLd/skWw8tQPOuF20N11F8o/kv/pFIQjqoL5awiVn
         6Q0m/6vc8Oe+LgQeTWP+gJ6sUXLRrfL632MaJte1nvkmGho2MhO2IBhQCNTMbhqBmKlj
         WI9oouH/Of0fYiKyD4QzMGVgkZ4UUGWWJCbHFL6ebq/1BJcZci1W9u4gtU5HzvCA8B4P
         8WLA==
X-Gm-Message-State: AOAM532whSRWOA2yk+AE2hDvQWnozBGvXw2v3L77NVOlIF8UOjQc3ERt
        cPbE4xGil5WYXE6PdLwd9q4=
X-Google-Smtp-Source: ABdhPJz0YLmFaj8lbliQzWO++Oj3bm/NtRjyADbV+kCcQnuBIbmXmHmReHgD6A2sdRpWL+o0a+EE+g==
X-Received: by 2002:a37:611:: with SMTP id 17mr22627564qkg.206.1618409169418;
        Wed, 14 Apr 2021 07:06:09 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id l16sm7420069qtr.65.2021.04.14.07.06.08
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 07:06:09 -0700 (PDT)
Date:   Wed, 14 Apr 2021 11:06:06 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2] staging: media: atomisp: pci: Correct identation in
 block of conditional statements in file atomisp_acc.c
Message-ID: <dd0b898b26f1bcc6563b7ed33670c801c0d4988f.1618409028.git.alinesantanacordeiro@gmail.com>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Correct identation in block of conditional statements.
The conditional statement depends on the results of the
macro function "list_for_each_entry()".

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_acc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
index f638d0b..5e5faa4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.c
@@ -77,8 +77,8 @@ acc_get_fw(struct atomisp_sub_device *asd, unsigned int handle)
 	struct atomisp_acc_fw *acc_fw;
 
 	list_for_each_entry(acc_fw, &asd->acc.fw, list)
-	if (acc_fw->handle == handle)
-		return acc_fw;
+		if (acc_fw->handle == handle)
+			return acc_fw;
 
 	return NULL;
 }
-- 
2.7.4

